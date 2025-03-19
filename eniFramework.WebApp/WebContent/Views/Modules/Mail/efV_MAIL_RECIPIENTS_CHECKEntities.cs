using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Mail {
    public class efV_MAIL_RECIPIENTS_CHECKEntities : ContextBase {
        public virtual DbSet<V_MAIL_RECIPIENTS_CHECK> V_MAIL_RECIPIENTS_CHECK { get; set; }
        static efV_MAIL_RECIPIENTS_CHECKEntities () {
            Database.SetInitializer<efV_MAIL_RECIPIENTS_CHECKEntities>(null);
        }
        public efV_MAIL_RECIPIENTS_CHECKEntities()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_MAIL_RECIPIENTS_CHECK>(new V_MAIL_RECIPIENTS_CHECKMap());
            
        }
    }
}