using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace eniFramework.WebApp.Core {
    internal class SqlServerDetector : IDisposable {
        private readonly SqlServerDetector.RegistryKeyProxy _localMachine;

        internal SqlServerDetector(SqlServerDetector.RegistryKeyProxy localMachine) {
            this._localMachine = localMachine;
        }

        public virtual string GetLocalDBVersionInstalled() {
            SqlServerDetector.RegistryKeyProxy registryKeyProxy = this.OpenLocalDBInstalledVersions(false);
            if (registryKeyProxy.SubKeyCount == 0)
                registryKeyProxy = this.OpenLocalDBInstalledVersions(true);
            List<Tuple<Decimal, string>> source = new List<Tuple<Decimal, string>>();
            foreach (string subKeyName in registryKeyProxy.GetSubKeyNames()) {
                Decimal result;
                if (Decimal.TryParse(subKeyName, NumberStyles.AllowDecimalPoint, (IFormatProvider)CultureInfo.InvariantCulture, out result))
                    source.Add(Tuple.Create<Decimal, string>(result, subKeyName));
            }
            Tuple<Decimal, string> tuple = source.OrderByDescending<Tuple<Decimal, string>, Decimal>((Func<Tuple<Decimal, string>, Decimal>)(v => v.Item1)).FirstOrDefault<Tuple<Decimal, string>>();
            if (tuple == null || tuple.Item2 == null)
                return (string)null;
            if (tuple.Item1 >= new Decimal(120, 0, 0, false, (byte)1))
                return "mssqllocaldb";
            return "v" + tuple.Item2;
        }

        private SqlServerDetector.RegistryKeyProxy OpenLocalDBInstalledVersions(bool useWow6432Node) {
            SqlServerDetector.RegistryKeyProxy registryKeyProxy = this._localMachine.OpenSubKey("SOFTWARE");
            if (useWow6432Node)
                registryKeyProxy = registryKeyProxy.OpenSubKey("Wow6432Node");
            return registryKeyProxy.OpenSubKey("Microsoft").OpenSubKey("Microsoft SQL Server Local DB").OpenSubKey("Installed Versions");
        }

        public void Dispose() {
            this._localMachine.Dispose();
        }

        internal class RegistryKeyProxy : IDisposable {
            private readonly RegistryKey _key;

            public virtual int SubKeyCount {
                get {
                    if (this._key != null)
                        return this._key.SubKeyCount;
                    return 0;
                }
            }

            protected RegistryKeyProxy() {
            }

            public RegistryKeyProxy(RegistryKey key) {
                this._key = key;
            }

            public static implicit operator SqlServerDetector.RegistryKeyProxy(RegistryKey key) {
                return new SqlServerDetector.RegistryKeyProxy(key);
            }

            public virtual string[] GetSubKeyNames() {
                if (this._key != null)
                    return this._key.GetSubKeyNames();
                return new string[0];
            }

            public virtual SqlServerDetector.RegistryKeyProxy OpenSubKey(string name) {
                return new SqlServerDetector.RegistryKeyProxy(this._key == null ? (RegistryKey)null : this._key.OpenSubKey(name));
            }

            public virtual void Dispose() {
                if (this._key == null)
                    return;
                this._key.Dispose();
            }
        }
    }
}
