using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Modules.Board {
    public class V_BBS {
        public long NO { get; set; }
        public string CATEGORY_CD { get; set; }
        public string CATEGORY_NM_KO { get; set; }
        public string CATEGORY_NM_EN { get; set; }
        public string CATEGORY_NM_CN { get; set; }
        public string CATEGORY_NM_JP { get; set; }
        public string PATH_NAME_KO { get; set; }
        public string PATH_NAME_EN { get; set; }
        public string PATH_NAME_CN { get; set; }
        public string PATH_NAME_JP { get; set; }
        public string CATEGORY_GROUP_CD { get; set; }
        public string CATEGORY_GROUP_NM { get; set; }
        public long PARENT_NO { get; set; }
        public string PREFACE_CD { get; set; }
        public string PREFACE_NM { get; set; }
        public string NOTICE_YN { get; set; }
        public string NOTICE_TO { get; set; }
        public string SECRET_YN { get; set; }
        public string SECRET_KEY { get; set; }
        public string SUBJECT { get; set; }
        public string SUBJECT_COLOR { get; set; }
        public string SUBJECT_BOLD_YN { get; set; }
        public string CONTENT { get; set; }
        public int FILE_CNT { get; set; }
        public int CMT_CNT { get; set; }
        public DateTime DATE { get; set; }
        public DateTime EDIT { get; set; }
        public int VISIT { get; set; }
        public int RECOMMEND { get; set; }
        public string TAG { get; set; }
        public int OPTIONS_FLAG { get; set; }
        public string LOGIN_ID { get; set; }
        public string WRITE_USER_ID { get; set; }
        public string WRITE_USER_NM { get; set; }
        public string WRITE_USER_NM_KO { get; set; }
        public string WRITE_USER_NM_EN { get; set; }
        public string WRITE_USER_NM_CN { get; set; }
        public string WRITE_USER_NM_JP { get; set; }
        public string ROLE_PSTN { get; set; }
        public string ROLE_PSTN_NM_KO { get; set; }
        public string ROLE_PSTN_NM_EN { get; set; }
        public string ROLE_PSTN_NM_CN { get; set; }
        public string ROLE_PSTN_NM_JP { get; set; }
        public string SORT_BY { get; set; }
    }
}