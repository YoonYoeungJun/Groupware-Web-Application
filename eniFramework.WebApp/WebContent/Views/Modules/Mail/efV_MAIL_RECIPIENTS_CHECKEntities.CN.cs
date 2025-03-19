using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_RECIPIENTS_CHECKEntitiesCN : ContextBase {
        public virtual DbSet<V_MAIL_RECIPIENTS_CHECK_CN> V_MAIL_RECIPIENTS_CHECK { get; set; }
        static efV_MAIL_RECIPIENTS_CHECKEntitiesCN () {
            Database.SetInitializer<efV_MAIL_RECIPIENTS_CHECKEntitiesCN>(null);
        }
        public efV_MAIL_RECIPIENTS_CHECKEntitiesCN()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_RECIPIENTS_CHECK_CN>(new V_MAIL_RECIPIENTS_CHECKMapCN());
            
        }
    }
}