using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Modules.Note {
    public class V_NOTES {
        public string USER_ID { get; set; }
        public long NOTE_ID { get; set; }
        public int FOLDER_ID { get; set; }
        public string FOLDER_NAME { get; set; }
        public int FLAGED { get; set; }
        public string FLAGEDCLASS { get; set; }
        public byte FLAGS { get; set; }
        public string FLAGCLASS { get; set; }
        public byte ISFORWARD { get; set; }
        public string IMPORTANCE { get; set; }
        public string FROM { get; set; }
        public string TO { get; set; }
        public byte ATTACHFILES { get; set; }
        public string SUBJECT { get; set; }
        public DateTime DATE { get; set; }
    }
}