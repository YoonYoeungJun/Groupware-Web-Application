using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Note {
    public class efV_NOTESEntities : ContextBase {
        public virtual DbSet<V_NOTES> V_NOTES { get; set; }
        static efV_NOTESEntities () {
            Database.SetInitializer<efV_NOTESEntities>(null);
        }
        public efV_NOTESEntities()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_NOTES>(new V_NOTESMap());
        }
    }
}