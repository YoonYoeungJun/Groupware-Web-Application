using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_MESSAGESEntities : ContextBase {
        public virtual DbSet<V_MAIL_MESSAGES> V_MAIL_MESSAGES { get; set; }
        static efV_MAIL_MESSAGESEntities () {
            Database.SetInitializer<efV_MAIL_MESSAGESEntities>(null);
        }
        public efV_MAIL_MESSAGESEntities()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_MESSAGES>(new V_MAIL_MESSAGESMap());
        }
    }
}