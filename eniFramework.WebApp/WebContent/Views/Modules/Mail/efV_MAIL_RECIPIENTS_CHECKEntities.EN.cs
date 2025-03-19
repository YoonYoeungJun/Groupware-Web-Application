using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_RECIPIENTS_CHECKEntitiesEN : ContextBase {
        public virtual DbSet<V_MAIL_RECIPIENTS_CHECK_EN> V_MAIL_RECIPIENTS_CHECK { get; set; }
        static efV_MAIL_RECIPIENTS_CHECKEntitiesEN () {
            Database.SetInitializer<efV_MAIL_RECIPIENTS_CHECKEntitiesEN>(null);
        }
        public efV_MAIL_RECIPIENTS_CHECKEntitiesEN()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_RECIPIENTS_CHECK_EN>(new V_MAIL_RECIPIENTS_CHECKMapEN());
            
        }
    }
}