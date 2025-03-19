using System;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq.Expressions;

namespace eniFramework.WebApp.Modules.Board {
    public class V_BBSMap : EntityTypeConfiguration<V_BBS> {
        public V_BBSMap() {
            this.HasKey(t => t.NO);
            this.Property(t => t.NO).IsRequired();
            this.Property(t => t.CATEGORY_CD).IsRequired();
            this.Property(t => t.LOGIN_ID).IsRequired();
            this.ToTable("V_BBS");

            this.Property(t => t.NO).HasColumnName("NO");
            this.Property(t => t.CATEGORY_CD).HasColumnName("CATEGORY_CD");
            this.Property(t => t.CATEGORY_NM_KO).HasColumnName("CATEGORY_NM_KO");
            this.Property(t => t.CATEGORY_NM_EN).HasColumnName("CATEGORY_NM_EN");
            this.Property(t => t.CATEGORY_NM_CN).HasColumnName("CATEGORY_NM_CN");
            this.Property(t => t.CATEGORY_NM_JP).HasColumnName("CATEGORY_NM_JP");
            this.Property(t => t.PATH_NAME_KO).HasColumnName("PATH_NAME_KO");
            this.Property(t => t.PATH_NAME_EN).HasColumnName("PATH_NAME_EN");
            this.Property(t => t.PATH_NAME_CN).HasColumnName("PATH_NAME_CN");
            this.Property(t => t.PATH_NAME_JP).HasColumnName("PATH_NAME_JP");
            this.Property(t => t.CATEGORY_GROUP_CD).HasColumnName("CATEGORY_GROUP_CD");
            this.Property(t => t.CATEGORY_GROUP_NM).HasColumnName("CATEGORY_GROUP_NM");
            this.Property(t => t.PARENT_NO).HasColumnName("PARENT_NO");
            this.Property(t => t.PREFACE_CD).HasColumnName("PREFACE_CD");
            this.Property(t => t.PREFACE_NM).HasColumnName("PREFACE_NM");
            this.Property(t => t.NOTICE_YN).HasColumnName("NOTICE_YN");
            this.Property(t => t.NOTICE_TO).HasColumnName("NOTICE_TO");
            this.Property(t => t.SECRET_YN).HasColumnName("SECRET_YN");
            this.Property(t => t.SECRET_KEY).HasColumnName("SECRET_KEY");
            this.Property(t => t.SUBJECT).HasColumnName("SUBJECT");
            this.Property(t => t.SUBJECT_COLOR).HasColumnName("SUBJECT_COLOR");
            this.Property(t => t.SUBJECT_BOLD_YN).HasColumnName("SUBJECT_BOLD_YN");
            this.Property(t => t.CONTENT).HasColumnName("CONTENT");
            this.Property<int>(t => t.FILE_CNT).HasColumnName("FILE_CNT");
            this.Property<int>(t => t.CMT_CNT).HasColumnName("CMT_CNT");
            this.Property(t => t.DATE).HasColumnName("DATE");
            this.Property(t => t.EDIT).HasColumnName("EDIT");
            this.Property<int>(t => t.VISIT).HasColumnName("VISIT");
            this.Property<int>(t => t.RECOMMEND).HasColumnName("RECOMMEND");
            this.Property(t => t.TAG).HasColumnName("TAG");
            this.Property<int>(t => t.OPTIONS_FLAG).HasColumnName("OPTIONS_FLAG");
            this.Property(t => t.LOGIN_ID).HasColumnName("LOGIN_ID");
            this.Property(t => t.WRITE_USER_ID).HasColumnName("WRITE_USER_ID");
            this.Property(t => t.WRITE_USER_NM).HasColumnName("WRITE_USER_NM");
            this.Property(t => t.WRITE_USER_NM_KO).HasColumnName("WRITE_USER_NM_KO");
            this.Property(t => t.WRITE_USER_NM_EN).HasColumnName("WRITE_USER_NM_EN");
            this.Property(t => t.WRITE_USER_NM_CN).HasColumnName("WRITE_USER_NM_CN");
            this.Property(t => t.WRITE_USER_NM_JP).HasColumnName("WRITE_USER_NM_JP");
            this.Property(t => t.ROLE_PSTN).HasColumnName("ROLE_PSTN");
            this.Property(t => t.ROLE_PSTN_NM_KO).HasColumnName("ROLE_PSTN_NM_KO");
            this.Property(t => t.ROLE_PSTN_NM_EN).HasColumnName("ROLE_PSTN_NM_EN");
            this.Property(t => t.ROLE_PSTN_NM_CN).HasColumnName("ROLE_PSTN_NM_CN");
            this.Property(t => t.ROLE_PSTN_NM_JP).HasColumnName("ROLE_PSTN_NM_JP");
            this.Property(t => t.SORT_BY).HasColumnName("SORT_BY");
        }
    }
}