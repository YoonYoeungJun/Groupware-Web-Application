using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_MESSAGESEntitiesCN : ContextBase {
        public virtual DbSet<V_MAIL_MESSAGES_CN> V_MAIL_MESSAGES { get; set; }
        static efV_MAIL_MESSAGESEntitiesCN () {
            Database.SetInitializer<efV_MAIL_MESSAGESEntitiesCN>(null);
        }
        public efV_MAIL_MESSAGESEntitiesCN()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_MESSAGES_CN>(new V_MAIL_MESSAGESMapCN());
        }
    }
}