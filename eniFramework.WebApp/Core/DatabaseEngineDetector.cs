using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Internal;
using System.Data.Common;
using System.Data.EntityClient;
using System.Linq;
using System.Reflection;
using System.Security.Principal;

namespace eniFramework.WebApp.Core {
    public static class DatabaseEngineDetector {
        private static readonly string currentUserName = WindowsIdentity.GetCurrent().Name;
        private static readonly string networkServiceLocalizedName = new SecurityIdentifier(WellKnownSidType.NetworkServiceSid, (SecurityIdentifier)null).Translate(typeof(NTAccount)).Value;
        private static SqlServerDetector detector;

        private static SqlServerDetector Detector {
            get {
                if (DatabaseEngineDetector.detector == null)
                    DatabaseEngineDetector.detector = new SqlServerDetector((SqlServerDetector.RegistryKeyProxy)Microsoft.Win32.Registry.LocalMachine);
                return DatabaseEngineDetector.detector;
            }
        }

        public static string LocalDbVersion {
            get {
                return DatabaseEngineDetector.Detector.GetLocalDBVersionInstalled();
            }
        }

        public static bool IsSqlExpressInstalled {
            get {
                string[] multiSzValue = RegistryViewer.Current.GetMultiSzValue(RegistryHive.LocalMachine, "SOFTWARE\\Microsoft\\Microsoft SQL Server", "InstalledInstances");
                if (multiSzValue != null)
                    return ((IEnumerable<string>)multiSzValue).Contains<string>("SQLEXPRESS");
                return false;
            }
        }

        public static bool IsLocalDbInstalled {
            get {
                return !string.IsNullOrEmpty(DatabaseEngineDetector.LocalDbVersion);
            }
        }

        private static bool IsExecutingUnderService {
            get {
                if (!DatabaseEngineDetector.currentUserName.StartsWith("IIS APPPOOL\\", StringComparison.InvariantCultureIgnoreCase))
                    return string.Equals(DatabaseEngineDetector.currentUserName, DatabaseEngineDetector.networkServiceLocalizedName, StringComparison.InvariantCultureIgnoreCase);
                return true;
            }
        }

        public static string[] GetSclCEInstalledVersions() {
            List<string> stringList = new List<string>();
            string str = "SOFTWARE\\Microsoft\\Microsoft SQL Server Compact Edition\\";
            if (RegistryViewer.Current.IsKeyExists(RegistryHive.LocalMachine, str + "v3.5"))
                stringList.Add("v3.5");
            if (RegistryViewer.Current.IsKeyExists(RegistryHive.LocalMachine, str + "v4.0"))
                stringList.Add("v4.0");
            return stringList.ToArray();
        }

        private static string PatchInnerString(string connectionString, bool entitySyntax, DatabaseEngineDetector.PatchSimpleString patchFunction) {
            if (!entitySyntax)
                return patchFunction.Patch(connectionString);
            EntityConnectionStringBuilder connectionStringBuilder1 = new EntityConnectionStringBuilder();
            connectionStringBuilder1.ConnectionString = connectionString;
            EntityConnectionStringBuilder connectionStringBuilder2 = connectionStringBuilder1;
            connectionStringBuilder2.ProviderConnectionString = patchFunction.Patch(connectionStringBuilder2.ProviderConnectionString);
            return connectionStringBuilder2.ConnectionString;
        }

        public static string PatchConnectionString(string rawConnectionString, bool entitySyntax = false) {
            if (rawConnectionString.ToLower().Contains("sqlite"))
                return rawConnectionString;
            DatabaseEngineDetector.PatchSimpleString patchFunction = new DatabaseEngineDetector.PatchSimpleString();
            return DatabaseEngineDetector.PatchInnerString(rawConnectionString, entitySyntax, patchFunction);
        }

        public static string SelectConnectionStringName(string sqlexpressName, string localdbName) {
            if (DatabaseEngineDetector.IsSqlExpressInstalled || DatabaseEngineDetector.LocalDbVersion == null)
                return sqlexpressName;
            return localdbName;
        }

        public static string GetSqlServerInstanceName() {
            string localDbVersion = DatabaseEngineDetector.LocalDbVersion;
            if (localDbVersion != null && !DatabaseEngineDetector.IsExecutingUnderService)
                return "(localdb)\\" + localDbVersion;
            return DatabaseEngineDetector.IsSqlExpressInstalled ? ".\\SQLEXPRESS" : "(local)";
        }

        public static bool PatchConnectionStringsAndConfigureEntityFrameworkDefaultConnectionFactory() {
            DatabaseEngineDetector.PatchAppConfigConnectionStrings();
            return DatabaseEngineDetector.ConfigureEntityFrameworkDefaultConnectionFactory();
        }

        public static bool ConfigureEntityFrameworkDefaultConnectionFactory() {
            string localDbVersion = DatabaseEngineDetector.LocalDbVersion;
            if (localDbVersion == null)
                return DatabaseEngineDetector.ConfigureDefaultConnectionFactory("SqlConnectionFactory");
            return DatabaseEngineDetector.ConfigureDefaultConnectionFactory("LocalDbConnectionFactory", (object)localDbVersion);
        }

        private static bool ConfigureDefaultConnectionFactory(string connectionFactoryTypeName, params object[] connectionFactoryArguments) {
            object dbConfiguration = DatabaseEngineDetector.CreateDbConfiguration();
            if (dbConfiguration == null)
                return false;
            object instance = Activator.CreateInstance(dbConfiguration.GetType().Assembly.GetType("System.Data.Entity.Infrastructure." + connectionFactoryTypeName), connectionFactoryArguments);
            dbConfiguration.GetType().GetMethod("SetDefaultConnectionFactory", BindingFlags.Instance | BindingFlags.NonPublic).Invoke(dbConfiguration, new object[1]
      {
        instance
      });
            dbConfiguration.GetType().GetMethod("SetConfiguration", BindingFlags.Static | BindingFlags.Public).Invoke((object)null, new object[1]
      {
        dbConfiguration
      });
            return true;
        }

        private static object CreateDbConfiguration() {
            Assembly frameworkAssembly = DatabaseEngineDetector.GetEntityFrameworkAssembly();
            if (frameworkAssembly == (Assembly)null)
                return (object)null;
            return frameworkAssembly.GetType("System.Data.Entity.DbConfiguration").GetConstructor(BindingFlags.Instance | BindingFlags.NonPublic, (Binder)null, new Type[0], (ParameterModifier[])null).Invoke(new object[0]);
        }

        private static Assembly GetEntityFrameworkAssembly() {
            return DatabaseEngineDetector.GetLoadedAssembly("EntityFramework");
        }

        private static Assembly GetLoadedAssembly(string asmName) {
            foreach (Assembly loadedAssembly in DatabaseEngineDetector.GetLoadedAssemblies()) {
                if (DatabaseEngineDetector.PartialNameEquals(loadedAssembly.FullName, asmName))
                    return loadedAssembly;
            }
            return (Assembly)null;
        }

        private static IEnumerable<Assembly> GetLoadedAssemblies() {
            return (IEnumerable<Assembly>)AppDomain.CurrentDomain.GetAssemblies();
        }

        private static bool PartialNameEquals(string asmName0, string asmName1) {
            return string.Equals(DatabaseEngineDetector.GetPartialName(asmName0), DatabaseEngineDetector.GetPartialName(asmName1), StringComparison.InvariantCultureIgnoreCase);
        }

        private static string GetPartialName(string asmName) {
            int startIndex = asmName.IndexOf(',');
            if (startIndex >= 0)
                return asmName.Remove(startIndex);
            return asmName;
        }

        public static void PatchAppConfigConnectionStrings() {
            typeof(ConfigurationManager).GetField("s_initState", BindingFlags.Static | BindingFlags.NonPublic).SetValue((object)null, typeof(ConfigurationManager).GetNestedType("InitState", BindingFlags.NonPublic).GetEnumValues().GetValue(0));
            FieldInfo field = typeof(ConfigurationManager).GetField("s_configSystem", BindingFlags.Static | BindingFlags.NonPublic);
            Type type = typeof(ConfigurationManager).Assembly.GetType("System.Configuration.ClientConfigurationSystem");
            field.SetValue((object)null, (object)null);
            ((IInternalConfigSettingsFactory)Activator.CreateInstance(typeof(ConfigurationManager).Assembly.GetType("System.Configuration.Internal.InternalConfigSettingsFactory"), true)).SetConfigurationSystem((IInternalConfigSystem)new DatabaseEngineDetector.ConnectionStringPatcherConfigSystem((IInternalConfigSystem)Activator.CreateInstance(type, true)), false);
        }

        private class PatchSimpleString {
            public string Patch(string connectionString) {
                DbConnectionStringBuilder connectionStringBuilder = new DbConnectionStringBuilder() {
                    ConnectionString = connectionString
                };
                string serverInstanceName = DatabaseEngineDetector.GetSqlServerInstanceName();
                connectionStringBuilder["Data Source"] = (object)serverInstanceName;
                if (!serverInstanceName.ToUpper().Contains(".\\SQLEXPRESS"))
                    connectionStringBuilder.Remove("User Instance");
                return connectionStringBuilder.ConnectionString;
            }
        }

        private class ConnectionStringPatcherConfigSystem : IInternalConfigSystem {
            private const string ConnectionStringsSectionName = "connectionStrings";
            private const string EntityFrameworkConnectionStringProviderName = "System.Data.EntityClient";
            private IInternalConfigSystem internalConfigSystem;
            private ConnectionStringsSection connectionStringsSection;

            private ConnectionStringsSection ConnectionStringSection {
                get {
                    if (this.connectionStringsSection == null)
                        this.connectionStringsSection = this.CreateConnectionStringsSection();
                    return this.connectionStringsSection;
                }
            }

            bool IInternalConfigSystem.SupportsUserConfig {
                get {
                    return this.internalConfigSystem.SupportsUserConfig;
                }
            }

            public ConnectionStringPatcherConfigSystem(IInternalConfigSystem internalConfigSystem) {
                this.internalConfigSystem = internalConfigSystem;
            }

            private ConnectionStringsSection CreateConnectionStringsSection() {
                ConnectionStringsSection section = (ConnectionStringsSection)this.internalConfigSystem.GetSection("connectionStrings");
                ConnectionStringsSection connectionStringsSection = new ConnectionStringsSection();
                foreach (ConnectionStringSettings connectionStringSettings in section.ConnectionStrings.Cast<ConnectionStringSettings>()) {
                    ConnectionStringSettings settings = new ConnectionStringSettings(connectionStringSettings.Name, DatabaseEngineDetector.PatchConnectionString(connectionStringSettings.ConnectionString, connectionStringSettings.ProviderName == "System.Data.EntityClient"), connectionStringSettings.ProviderName);
                    connectionStringsSection.ConnectionStrings.Add(settings);
                }
                return connectionStringsSection;
            }

            object IInternalConfigSystem.GetSection(string configKey) {
                if (!(configKey == "connectionStrings"))
                    return this.internalConfigSystem.GetSection(configKey);
                return (object)this.ConnectionStringSection;
            }

            void IInternalConfigSystem.RefreshConfig(string sectionName) {
                if (sectionName == "connectionStrings")
                    this.connectionStringsSection = (ConnectionStringsSection)null;
                this.internalConfigSystem.RefreshConfig(sectionName);
            }
        }
    }
}