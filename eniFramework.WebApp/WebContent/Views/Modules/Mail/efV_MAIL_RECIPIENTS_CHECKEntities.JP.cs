using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_RECIPIENTS_CHECKEntitiesJP : ContextBase {
        public virtual DbSet<V_MAIL_RECIPIENTS_CHECK_JP> V_MAIL_RECIPIENTS_CHECK { get; set; }
        static efV_MAIL_RECIPIENTS_CHECKEntitiesJP () {
            Database.SetInitializer<efV_MAIL_RECIPIENTS_CHECKEntitiesJP>(null);
        }
        public efV_MAIL_RECIPIENTS_CHECKEntitiesJP()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_RECIPIENTS_CHECK_JP>(new V_MAIL_RECIPIENTS_CHECKMapJP());
            
        }
    }
}