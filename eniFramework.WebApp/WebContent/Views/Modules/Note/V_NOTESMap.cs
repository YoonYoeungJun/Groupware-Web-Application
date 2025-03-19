using System;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq.Expressions;

namespace eniFramework.WebApp.Modules.Note {
    public class V_NOTESMap : EntityTypeConfiguration<V_NOTES> {
        public V_NOTESMap() {
            this.HasKey(t => t.NOTE_ID);
            this.Property(t => t.NOTE_ID).IsRequired();
            this.Property(t => t.FOLDER_ID).IsRequired();
            this.Property(t => t.FLAGED).IsRequired();
            this.ToTable("V_NOTES");

            this.Property(t => t.USER_ID).HasColumnName("USER_ID");
            this.Property<long>(t => t.NOTE_ID).HasColumnName("NOTE_ID");
            this.Property<int>(t => t.FOLDER_ID).HasColumnName("FOLDER_ID");
            this.Property(t => t.FOLDER_NAME).HasColumnName("FOLDER_NAME");
            this.Property<int>(t => t.FLAGED).HasColumnName("FLAGED");
            this.Property(t => t.FLAGEDCLASS).HasColumnName("FLAGEDCLASS");
            this.Property<byte>(t => t.FLAGS).HasColumnName("FLAGS");
            this.Property(t => t.FLAGCLASS).HasColumnName("FLAGCLASS");
            this.Property<byte>(t => t.ISFORWARD).HasColumnName("ISFORWARD");
            this.Property(t => t.IMPORTANCE).HasColumnName("IMPORTANCE");
            this.Property(t => t.FROM).HasColumnName("FROM");
            this.Property(t => t.TO).HasColumnName("TO");
            this.Property<byte>(t => t.ATTACHFILES).HasColumnName("ATTACHFILES");
            this.Property(t => t.SUBJECT).HasColumnName("SUBJECT");
            this.Property(t => t.DATE).HasColumnName("DATE");
        }
    }
}