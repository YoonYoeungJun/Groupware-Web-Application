using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Infrastructure.Interception;
using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Modules.Board {
    public class efV_BBSEntities : ContextBase {
        public DbSet<V_BBS> V_BBS { get; set; }
        static efV_BBSEntities () {
            //DbInterception.Add(new V_BBSInterceptor());

            Database.SetInitializer<efV_BBSEntities>(null);
        }
        public efV_BBSEntities()
            : base("ConnectionString") {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder) {
            modelBuilder.Configurations.Add<V_BBS>(new V_BBSMap());
        }
    }
}