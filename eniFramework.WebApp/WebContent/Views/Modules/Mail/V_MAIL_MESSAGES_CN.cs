using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Modules.Mail {
    public class V_MAIL_MESSAGES_CN {
        public string USR_ID { get; set; }
        public int DOMAINID { get; set; }
        public int ACCOUNTID { get; set; }
        public long MESSAGEID { get; set; }
        public int MESSAGEFOLDERID { get; set; }
        public string MESSAGEFOLDERNAME { get; set; }
        public int MESSAGEFLAGED { get; set; }
        public string MESSAGEFLAGEDCLASS { get; set; }
        public byte MESSAGEFLAGS { get; set; }
        public string MESSAGEFLAGCLASS { get; set; }
        public byte ISFORWARD { get; set; }
        public string IMPORTANCE { get; set; }
        public byte ATTACHFILECOUNT { get; set; }
        public string MESSAGEFROMADDRESS { get; set; }
        public string MESSAGETOADDRESS { get; set; }
        public string MESSAGESUBJECT { get; set; }
        public DateTime MESSAGEDATE { get; set; }
        public long MESSAGESIZE { get; set; }
        public string PARSETYPE { get; set; }
    }
}