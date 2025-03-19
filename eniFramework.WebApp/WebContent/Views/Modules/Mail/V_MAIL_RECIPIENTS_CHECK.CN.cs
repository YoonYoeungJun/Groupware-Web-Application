using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Modules.Mail {
    public class V_MAIL_RECIPIENTS_CHECK_CN {
        public int ACCOUNTID { get; set; }
        public string MESSAGEID { get; set; }
        public string RECIPIENTID { get; set; }
        public byte SENDSTATUS { get; set; }
        public string SENDSTATUSNAME { get; set; }
        public string MESSAGETOADDRESS { get; set; }
        public string MESSAGESUBJECT { get; set; }
        public string IMPORTANCE { get; set; }
        public byte ATTACHFILECOUNT { get; set; }
        public DateTime MESSAGEDATE { get; set; }
        public DateTime? RECIPIENTDATE { get; set; }
        public string HDRTHREADINDEX { get; set; }
        public string HDRMESSAGEID { get; set; }
        public string HDRGROUPWARECIP { get; set; }
    }
}