using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_MESSAGESEntitiesEN : ContextBase {
        public virtual DbSet<V_MAIL_MESSAGES_EN> V_MAIL_MESSAGES { get; set; }
        static efV_MAIL_MESSAGESEntitiesEN () {
            Database.SetInitializer<efV_MAIL_MESSAGESEntitiesEN>(null);
        }
        public efV_MAIL_MESSAGESEntitiesEN()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_MESSAGES_EN>(new V_MAIL_MESSAGESMapEN());
        }
    }
}