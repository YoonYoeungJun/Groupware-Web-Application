using System;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq.Expressions;

namespace eniFramework.WebApp.Modules.Mail {
    public class V_MAIL_RECIPIENTS_CHECKMapEN : EntityTypeConfiguration<V_MAIL_RECIPIENTS_CHECK_EN> {
        public V_MAIL_RECIPIENTS_CHECKMapEN() {
            this.HasKey(t => t.MESSAGEID);
            this.HasKey(t => t.RECIPIENTID);
            this.Property(t => t.MESSAGEID).IsRequired();
            this.Property(t => t.RECIPIENTID).IsRequired();
            this.Property(t => t.ACCOUNTID).IsRequired();
            this.ToTable("V_MAIL_RECIPIENTS_CHECK");

            this.Property<int>(t => t.ACCOUNTID).HasColumnName("ACCOUNTID");
            this.Property(t => t.MESSAGEID).HasColumnName("MESSAGEID");
            this.Property(t => t.RECIPIENTID).HasColumnName("RECIPIENTID");
            this.Property<byte>(t => t.SENDSTATUS).HasColumnName("SENDSTATUS");
            this.Property(t => t.SENDSTATUSNAME).HasColumnName("SENDSTATUSNAME_EN");
            this.Property(t => t.MESSAGETOADDRESS).HasColumnName("RECIPIENT");
            this.Property(t => t.MESSAGESUBJECT).HasColumnName("MESSAGESUBJECT");
            this.Property(t => t.IMPORTANCE).HasColumnName("IMPORTANCE");
            this.Property<byte>(t => t.ATTACHFILECOUNT).HasColumnName("ATTACHFILECOUNT");
            this.Property<DateTime>(t => t.MESSAGEDATE).HasColumnName("MESSAGEDATE");
            this.Property(t => t.RECIPIENTDATE).HasColumnName("RECIPIENTDATE");
            this.Property(t => t.HDRTHREADINDEX).HasColumnName("HDRTHREADINDEX");
            this.Property(t => t.HDRMESSAGEID).HasColumnName("HDRMESSAGEID");
            this.Property(t => t.HDRGROUPWARECIP).HasColumnName("HDRGROUPWARECIP");
        }
    }
}