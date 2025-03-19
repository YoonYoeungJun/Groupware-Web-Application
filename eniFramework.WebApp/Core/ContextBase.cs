using System.Configuration;
using System.Data.Entity;

namespace eniFramework.WebApp.Core {
    public class ContextBase : DbContext {
        public ContextBase(string connectionString)
            : base(ContextBase.GetPathedConnectionString(connectionString)) { }

        private static string GetPathedConnectionString(string connectionString) {
            return ConfigurationManager.ConnectionStrings[connectionString].ConnectionString;
        }
    }
}
