using System;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq.Expressions;

namespace eniFramework.WebApp.Modules.Mail {
    public class V_MAIL_MESSAGESMap : EntityTypeConfiguration<V_MAIL_MESSAGES> {
        public V_MAIL_MESSAGESMap() {
            //this.HasKey(t => new {
            //    t.MESSAGEID,
            //    t.MESSAGEFOLDERID,
            //    t.MESSAGEFLAGED
            //});
            this.HasKey(t => t.MESSAGEID);
            this.Property(t => t.MESSAGEID).IsRequired();
            this.Property(t => t.MESSAGEFOLDERID).IsRequired();
            this.Property(t => t.MESSAGEFLAGED).IsRequired();
            this.ToTable("V_MAIL_MESSAGES");
            
            this.Property(t => t.USR_ID).HasColumnName("USR_ID");
            this.Property<int>(t => t.DOMAINID).HasColumnName("DOMAINID");
            this.Property<int>(t => t.ACCOUNTID).HasColumnName("ACCOUNTID");
            this.Property<long>(t => t.MESSAGEID).HasColumnName("MESSAGEID");
            this.Property<int>(t => t.MESSAGEFOLDERID).HasColumnName("MESSAGEFOLDERID");
            this.Property(t => t.MESSAGEFOLDERNAME).HasColumnName("MESSAGEFOLDERNAME_KO");
            this.Property<int>(t => t.MESSAGEFLAGED).HasColumnName("MESSAGEFLAGED");
            this.Property(t => t.MESSAGEFLAGEDCLASS).HasColumnName("MESSAGEFLAGEDCLASS");
            this.Property<byte>(t => t.MESSAGEFLAGS).HasColumnName("MESSAGEFLAGS");
            this.Property(t => t.MESSAGEFLAGCLASS).HasColumnName("MESSAGEFLAGCLASS");
            this.Property<byte>(t => t.ISFORWARD).HasColumnName("ISFORWARD");
            this.Property(t => t.IMPORTANCE).HasColumnName("IMPORTANCE");
            this.Property<byte>(t => t.ATTACHFILECOUNT).HasColumnName("ATTACHFILECOUNT");
            this.Property(t => t.MESSAGEFROMADDRESS).HasColumnName("MESSAGEFROMADDRESS_KO");
            this.Property(t => t.MESSAGETOADDRESS).HasColumnName("MESSAGETOADDRESS_KO");
            this.Property(t => t.MESSAGESUBJECT).HasColumnName("MESSAGESUBJECT_KO");
            this.Property(t => t.MESSAGEDATE).HasColumnName("MESSAGEDATE");
            this.Property<long>(t => t.MESSAGESIZE).HasColumnName("MESSAGESIZE");
            this.Property(t => t.PARSETYPE).HasColumnName("PARSETYPE");
        }
    }
}