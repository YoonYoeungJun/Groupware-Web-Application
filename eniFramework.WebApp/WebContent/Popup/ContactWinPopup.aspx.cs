
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Net.Mail;
using System.Collections;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Web.Data;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Popup {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous]
    public partial class ContactWinPopup : BaseUIACTPage {
        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp</NameSpace>
        /// <Module>②</Module>
        /// <Class>③</Class>
        /// <Desc>④
        ///   This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        ///   <FirstCreated>
        ///     <history name="creator" Date="created date">Make …</history>
        ///   </FirstCreated>
        ///   <Lastmodified>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///   </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        ///   <remark name="modifier"  Date="modified date">… </remark>
        ///   <remark name="modifier"  Date="modified date">… </remark>
        /// </Remarks>
        #endregion

        #region ▶ 1. Declaration part

        #region ■ 1.1 Global Constants

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        #endregion

        #region ■ 1.4 Class Global properties

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "contactwinpopup"; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json | JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.Framework_jQuery_Extends | 
                       JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie | JScriptKind.Framework | JScriptKind.Framework_Extends | 
                       JScriptKind.Framework_UserAgent | JScriptKind.Framework_DbAccess | JScriptKind.Framework_Message | JScriptKind.Framework_Ajax | JScriptKind.Framework_Loading;
            }
        }
        public override JScriptExt RegisteredScriptExt { get { return JScriptExt.Ext3; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public ContactWinPopup()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageInit & WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnInitWebUIPage() {

        }
        protected override void OnWebUIPageLoad() {

        }

        protected override void OnWebUIPageLoadComplete() {


        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRoutingParams(RouteData pRoute) {

        }

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {


        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            if (!IsCallback && !IsPostBack && lgLang != "KO") {
                hyRecentWeek.Text = GetResource("CSTRESX00002");
                hySentHist.Text = GetResource("CSTRESX00003");
                chkAllSelected.Text = GetResource("CSTRESX00005");
                chkAllSelected.ToolTip = GetResource("CSTRESX00013");
                txtSearchText.ToolTip = GetResource("CSTRESX00014");
                btnSearch.Text = GetResource("CSTRESX00006");
                btnSearch.ToolTip = GetResource("CSTRESX00015");
                btnToAdd.ToolTip = GetResource("CSTRESX00016");
                btnToDel.ToolTip = GetResource("CSTRESX00017");
                btnCcAdd.ToolTip = GetResource("CSTRESX00018");
                btnCcDel.ToolTip = GetResource("CSTRESX00019");
                btnBccAdd.ToolTip = GetResource("CSTRESX00020");
                btnBccDel.ToolTip = GetResource("CSTRESX00021");
                btnOk.Text = GetResource("CSTRESX00011");
                btnOk.ToolTip = GetResource("CSTRESX00022");
                btnCancel.Text = GetResource("CSTRESX00012");
                btnCancel.ToolTip = GetResource("CSTRESX00023");
            }
        }


        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            this.CreateContactGroup();

            this.lbContactList.DataSource = this.lbContactList_Recent_Week_DbQuery();
            this.lbContactList.DataBind();
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {

        }

        #endregion

        #region ■ 2.7 Initializatize variables

        //protected override void OnInitVariables() {

        //}

        #endregion

        #region ■ 2.8 Set local condition data


        //protected override void OnInitConditionData() {
            
        //}

        #endregion

        #region ■ 2.9 Set local default variables


        //protected override void SetDefulatValues() {

        //}

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery & ControlQuery

        private DataTable tvContactGroup_DbQuery() {
            this.lgStrSql = new StringBuilder();
            //this.lgStrSql.AppendLine(" SELECT	A.BIZ_AREA_CD CON_GR_NO,  ");
            //this.lgStrSql.AppendLine(" 		'*' PAR_CON_GR_NO,  ");
            //this.lgStrSql.AppendLine(" 		A.BIZ_AREA_NM CON_GR_NM,  ");
            //this.lgStrSql.AppendLine(" 		A.SEQ,  ");
            //this.lgStrSql.AppendLine(" 		1 LVL,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(B.CNT, 0) CNT, ");
            //this.lgStrSql.AppendLine(" 		'A' TYPE ");
            //this.lgStrSql.AppendLine(" FROM S_BIZ_AREA A (NOLOCK) ");
            //this.lgStrSql.AppendLine(" LEFT JOIN (SELECT BIZ_AREA_CD, COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 			FROM S_USR_MST (NOLOCK)  ");
            //this.lgStrSql.AppendLine(" 			WHERE USE_CONTACT_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			AND USE_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			GROUP BY BIZ_AREA_CD) B ON(A.BIZ_AREA_CD = B.BIZ_AREA_CD) ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	A.PLANT_CD,  ");
            //this.lgStrSql.AppendLine(" 		A.BIZ_AREA_CD,  ");
            //this.lgStrSql.AppendLine(" 		A.PLANT_NM,  ");
            //this.lgStrSql.AppendLine(" 		A.SEQ,  ");
            //this.lgStrSql.AppendLine(" 		2 LVL,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(B.CNT, 0) CNT, ");
            //this.lgStrSql.AppendLine(" 		'A' ");
            //this.lgStrSql.AppendLine(" FROM S_PLANT A (NOLOCK) ");
            //this.lgStrSql.AppendLine(" LEFT JOIN (SELECT PLANT_CD, COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 			FROM S_USR_MST (NOLOCK) ");
            //this.lgStrSql.AppendLine(" 			WHERE USE_CONTACT_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			AND USE_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			GROUP BY PLANT_CD) B ON(A.PLANT_CD = B.PLANT_CD) ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	A.DEPT_CD,  ");
            //this.lgStrSql.AppendLine(" 		A.PLANT_CD,  ");
            //this.lgStrSql.AppendLine(" 		A.DEPT_NM,  ");
            //this.lgStrSql.AppendLine(" 		A.SEQ,  ");
            //this.lgStrSql.AppendLine(" 		3 LVL,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(B.CNT, 0) CNT, ");
            //this.lgStrSql.AppendLine(" 		'A' ");
            //this.lgStrSql.AppendLine(" FROM S_ACCT_DEPT A (NOLOCK) ");
            //this.lgStrSql.AppendLine(" LEFT JOIN (SELECT DEPT_CD, COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 			FROM S_USR_MST (NOLOCK) ");
            //this.lgStrSql.AppendLine(" 			WHERE USE_CONTACT_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			AND USE_YN = 'Y'  ");
            //this.lgStrSql.AppendLine(" 			GROUP BY DEPT_CD) B ON(A.DEPT_CD = B.DEPT_CD) ");
            //this.lgStrSql.AppendLine(" WHERE A.USE_CONTACT_YN = 'Y' ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	'MY_CONTACT',  ");
            //this.lgStrSql.AppendLine(" 		'*',  ");
            //this.lgStrSql.AppendLine(string.Format(" 		{0},  ", Data.FilterVariable("나의 주소록", true, false)));
            //this.lgStrSql.AppendLine(" 		'98000',  ");
            //this.lgStrSql.AppendLine(" 		1,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(A.CNT, 0), ");
            //this.lgStrSql.AppendLine(" 		'B' ");
            //this.lgStrSql.AppendLine(" FROM (SELECT COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK)  ");
            //this.lgStrSql.AppendLine(string.Format(" 		WHERE USR_ID = {0}) A ", Data.FilterVariable(lgACT.UserId)));
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	A.CON_GR_NO,  ");
            //this.lgStrSql.AppendLine(" 		'MY_CONTACT',  ");
            //this.lgStrSql.AppendLine(" 		A.CON_GR_NM,  ");
            //this.lgStrSql.AppendLine(" 		'98000',  ");
            //this.lgStrSql.AppendLine(" 		2,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(B.CNT, 0), ");
            //this.lgStrSql.AppendLine(" 		'B' ");
            //this.lgStrSql.AppendLine(" FROM B_USR_CONTACT_GROUP A (NOLOCK) ");
            //this.lgStrSql.AppendLine(" LEFT JOIN (SELECT CON_GR_NO,  ");
            //this.lgStrSql.AppendLine(" 			COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 			FROM B_USR_CONTACT (NOLOCK)  ");
            //this.lgStrSql.AppendLine(string.Format(" 			WHERE USR_ID = {0}  ", Data.FilterVariable(lgACT.UserId)));
            //this.lgStrSql.AppendLine(" 			GROUP BY CON_GR_NO) B ON(A.CON_GR_NO = B.CON_GR_NO) ");
            //this.lgStrSql.AppendLine(string.Format(" 		WHERE A.USR_ID = {0}  ", Data.FilterVariable(lgACT.UserId)));
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	'CT99999999999',  ");
            //this.lgStrSql.AppendLine(" 		'MY_CONTACT',  ");
            //this.lgStrSql.AppendLine(string.Format(" 		{0},  ", Data.FilterVariable("지정되지 않음", true, false)));
            //this.lgStrSql.AppendLine(" 		'98999',  ");
            //this.lgStrSql.AppendLine(" 		2,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(A.CNT, 0), ");
            //this.lgStrSql.AppendLine(" 		'B' ");
            //this.lgStrSql.AppendLine(" FROM (SELECT COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK)  ");
            //this.lgStrSql.AppendLine(string.Format(" 		WHERE USR_ID = {0}  ", Data.FilterVariable(lgACT.UserId)));
            //this.lgStrSql.AppendLine(" 		AND CON_GR_NO IS NULL) A ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT 'PUBLIC_CONTACT',  ");
            //this.lgStrSql.AppendLine(" 		'*',  ");
            //this.lgStrSql.AppendLine(string.Format(" 		{0},  ", Data.FilterVariable("공용 주소록", true, false)));
            //this.lgStrSql.AppendLine(" 		'99000',  ");
            //this.lgStrSql.AppendLine(" 		1,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(A.CNT, 0),  ");
            //this.lgStrSql.AppendLine(" 		'C' ");
            //this.lgStrSql.AppendLine(" FROM (SELECT COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK)  ");
            //this.lgStrSql.AppendLine(" 		WHERE USR_ID = 'PUBLIC') A ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	A.CON_GR_NO,  ");
            //this.lgStrSql.AppendLine(" 		'PUBLIC_CONTACT',  ");
            //this.lgStrSql.AppendLine(" 		A.CON_GR_NM,  ");
            //this.lgStrSql.AppendLine(" 		'99000',  ");
            //this.lgStrSql.AppendLine(" 		2,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(B.CNT, 0),  ");
            //this.lgStrSql.AppendLine(" 		'C' ");
            //this.lgStrSql.AppendLine(" FROM B_USR_CONTACT_GROUP A (NOLOCK) ");
            //this.lgStrSql.AppendLine(" LEFT JOIN (SELECT CON_GR_NO, COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 			FROM B_USR_CONTACT (NOLOCK)  ");
            //this.lgStrSql.AppendLine(" 			WHERE USR_ID = 'PUBLIC'  ");
            //this.lgStrSql.AppendLine(" 			GROUP BY CON_GR_NO) B ON(A.CON_GR_NO = B.CON_GR_NO) ");
            //this.lgStrSql.AppendLine(" WHERE A.USR_ID = 'PUBLIC' ");
            //this.lgStrSql.AppendLine(" UNION ALL ");
            //this.lgStrSql.AppendLine(" SELECT	'CT99999999999',  ");
            //this.lgStrSql.AppendLine(" 		'PUBLIC_CONTACT',  ");
            //this.lgStrSql.AppendLine(string.Format(" 		{0},  ", Data.FilterVariable("지정되지 않음", true, false)));
            //this.lgStrSql.AppendLine(" 		'99999',  ");
            //this.lgStrSql.AppendLine(" 		2,  ");
            //this.lgStrSql.AppendLine(" 		ISNULL(A.CNT, 0),  ");
            //this.lgStrSql.AppendLine(" 		'C' ");
            //this.lgStrSql.AppendLine(" FROM (SELECT COUNT(*) CNT  ");
            //this.lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK) ");
            //this.lgStrSql.AppendLine(" 		WHERE USR_ID = 'PUBLIC'  ");
            //this.lgStrSql.AppendLine(" 		AND CON_GR_NO IS NULL) A ");

            this.lgStrSql.AppendLine(" SELECT CON_GR_NO, ");
            this.lgStrSql.AppendLine(" 		PAR_CON_GR_NO, ");
            this.lgStrSql.AppendLine(string.Format(" 		CON_GR_NM_{0} CON_GR_NM, ", lgLang));
            this.lgStrSql.AppendLine(" 		SEQ, ");
            this.lgStrSql.AppendLine(" 		LVL, ");
            this.lgStrSql.AppendLine(" 		CNT, ");
            this.lgStrSql.AppendLine(" 		CONTACT_TYPE, ");
            this.lgStrSql.AppendLine(" 		CONTACT_TYPE_NM	 ");
            this.lgStrSql.AppendLine(string.Format(" FROM UFN_TB_CONTACT_GROUP('{0}')  ", lgACT.UserId));
            this.lgStrSql.AppendLine(" ORDER BY CONTACT_TYPE, SEQ, LVL, CON_GR_NO, PAR_CON_GR_NO ");
            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }

        private class ContactListCallBackArgs : BaseCallbackArgs {
            public string lvl { get; set; }
            public string group_cd { get; set; }
            public string type { get; set; }
            public new string Data { get; set; }
        }
        DataTable lbContactList_Recent_Week_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT DISTINCT A.NAME + ' <' + ADDRESS + '>' MAIL_DISPLAY_ADDR, ");
            this.lgStrSql.AppendLine(" 		A.NAME CON_NM,  ");
            this.lgStrSql.AppendLine(" 		A.ADDRESS MAIL_ADDR, ");
            this.lgStrSql.AppendLine(" 		A.SEND_DATE ");
            this.lgStrSql.AppendLine(" FROM B_MAIL_SEND_HIST A (NOLOCK) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
            this.lgStrSql.AppendLine(string.Format(" AND SEND_DATE > {0} ", Data.FilterVariable(DateTime.Now.AddDays(-7).ToString(CommonVariable.CDT_YYYY_MM_DD))));
            this.lgStrSql.AppendLine(" ORDER BY A.SEND_DATE DESC ");

            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }
        DataTable lbContactList_Recent_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT DISTINCT A.NAME + ' <' + ADDRESS + '>' MAIL_DISPLAY_ADDR, ");
            this.lgStrSql.AppendLine(" 		A.NAME CON_NM,  ");
            this.lgStrSql.AppendLine(" 		A.ADDRESS MAIL_ADDR, ");
            this.lgStrSql.AppendLine(" 		A.SEND_DATE ");
            this.lgStrSql.AppendLine(" FROM B_MAIL_SEND_HIST A (NOLOCK) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
            this.lgStrSql.AppendLine(" ORDER BY A.SEND_DATE DESC ");

            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }
        DataTable lbContactList_DbQuery(ContactListCallBackArgs pArgs) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT CON_NM + ' <' + MAIL_ADDR + '>' MAIL_DISPLAY_ADDR, CON_NM, CON_NM_KO, CON_NM_EN, CON_NM_CN, CON_NM_JP, MAIL_ADDR, CON_GR_NO, MAIL_ADDR, HAND_TEL_NO, BIZ_AREA_NM, BIZ_AREA_NM_KO, BIZ_AREA_NM_EN, BIZ_AREA_NM_CN, BIZ_AREA_NM_JP, PLANT_NM, PLANT_NM_KO, PLANT_NM_EN, PLANT_NM_CN, PLANT_NM_JP, DEPT_NM, DEPT_NM_KO, DEPT_NM_EN, DEPT_NM_CN, DEPT_NM_JP, PSTN_NM, PSTN_NM_KO, PSTN_NM_EN, PSTN_NM_CN, PSTN_NM_JP ");
            lgStrSql.AppendLine(" FROM ( ");
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "all" || pArgs.type.ToLower() == "a") {
                lgStrSql.AppendLine("       SELECT	USR_ID CON_NO,  ");
                switch (lgLang) {
                    case "KO": lgStrSql.AppendLine(" 				NAME CON_NM,  "); break;
                    default:
                    case "EN": lgStrSql.AppendLine(" 				ENG_NAME CON_NM,  "); break;
                    case "CN": lgStrSql.AppendLine(" 				HANJA_NAME CON_NM,  "); break;
                }
                lgStrSql.AppendLine(" 				NAME CON_NM_KO,  ");
                lgStrSql.AppendLine(" 				ENG_NAME CON_NM_EN,  ");
                lgStrSql.AppendLine(" 				HANJA_NAME CON_NM_CN,  ");
                lgStrSql.AppendLine(" 				NAME CON_NM_JP,  ");
                lgStrSql.AppendLine(" 				'*' CON_GR_NO, ");
                lgStrSql.AppendLine(" 				A.MAIL_ADDR,  ");
                lgStrSql.AppendLine(" 				A.HAND_TEL_NO, ");
                lgStrSql.AppendLine(string.Format(" 				dbo.UFN_SC_CODENAME_LANG('S_BIZ_AREA', A.BIZ_AREA_CD, 'X', '{0}') BIZ_AREA_NM, ", lgLang));
                lgStrSql.AppendLine(string.Format(" 				dbo.UFN_SC_CODENAME_LANG('S_PLANT', A.PLANT_CD, A.BIZ_AREA_CD, '{0}') PLANT_NM, ", lgLang));
                lgStrSql.AppendLine(string.Format(" 				dbo.UFN_SC_CODENAME_LANG('S_ACCT_DEPT', A.DEPT_CD, A.PLANT_CD, '{0}') DEPT_NM, ", lgLang));
                lgStrSql.AppendLine(string.Format(" 				B.MINOR_NM_{0} PSTN_NM, ", lgLang));
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_BIZ_AREA', A.BIZ_AREA_CD, 'X', 'KO') BIZ_AREA_NM_KO, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_PLANT', A.PLANT_CD, A.BIZ_AREA_CD, 'KO') PLANT_NM_KO, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_ACCT_DEPT', A.DEPT_CD, A.PLANT_CD, 'KO') DEPT_NM_KO, ");
                lgStrSql.AppendLine(" 				B.MINOR_NM_KO PSTN_NM_KO, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_BIZ_AREA', A.BIZ_AREA_CD, 'X', 'EN') BIZ_AREA_NM_EN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_PLANT', A.PLANT_CD, A.BIZ_AREA_CD, 'EN') PLANT_NM_EN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_ACCT_DEPT', A.DEPT_CD, A.PLANT_CD, 'EN') DEPT_NM_EN, ");
                lgStrSql.AppendLine(" 				B.MINOR_NM_EN PSTN_NM_EN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_BIZ_AREA', A.BIZ_AREA_CD, 'X', 'CN') BIZ_AREA_NM_CN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_PLANT', A.PLANT_CD, A.BIZ_AREA_CD, 'CN') PLANT_NM_CN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_ACCT_DEPT', A.DEPT_CD, A.PLANT_CD, 'CN') DEPT_NM_CN, ");
                lgStrSql.AppendLine(" 				B.MINOR_NM_CN PSTN_NM_CN, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_BIZ_AREA', A.BIZ_AREA_CD, 'X', 'JP') BIZ_AREA_NM_JP, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_PLANT', A.PLANT_CD, A.BIZ_AREA_CD, 'JP') PLANT_NM_JP, ");
                lgStrSql.AppendLine(" 				dbo.UFN_SC_CODENAME_LANG('S_ACCT_DEPT', A.DEPT_CD, A.PLANT_CD, 'JP') DEPT_NM_JP, ");
                lgStrSql.AppendLine(" 				B.MINOR_NM_JP PSTN_NM_JP, ");
                lgStrSql.AppendLine(" 				'A' TYPE ");
                lgStrSql.AppendLine(" 		FROM S_USR_MST A (NOLOCK) ");
                lgStrSql.AppendLine(" 		LEFT JOIN B_MINOR B (NOLOCK) ON(A.ROLE_PSTN = B.MINOR_CD AND B.MAJOR_CD = 'S0006') ");
                lgStrSql.AppendLine(" 		WHERE A.USE_YN = 'Y' ");
                lgStrSql.AppendLine(" 		AND USE_MAIL_YN = 'Y' ");
                lgStrSql.AppendLine(" 		AND USE_CONTACT_YN = 'Y' ");
                lgStrSql.AppendLine(" 		AND ISNULL(A.MAIL_ADDR, '') != '' ");
                lgStrSql.AppendLine(string.Format(" 		AND A.USR_ID != {0} ", Data.FilterVariable(lgACT.UserId)));
                if (pArgs != null) {
                    switch (pArgs.lvl) {
                        case "1":
                            lgStrSql.AppendLine(string.Format(" AND A.BIZ_AREA_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                            break;
                        case "2":
                            lgStrSql.AppendLine(string.Format(" AND A.PLANT_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                            break;
                        case "3":
                            lgStrSql.AppendLine(string.Format(" AND A.DEPT_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                            break;
                        default: break;
                    }
                }
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "all") {
                lgStrSql.AppendLine(" 		UNION ALL --관계사 주소록 ");
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "all" || pArgs.type.ToLower() == "aa") {
                lgStrSql.AppendLine("       SELECT	USR_ID CON_NO,  ");
                switch (lgLang) {
                    case "KO": lgStrSql.AppendLine(" 				NAME CON_NM,  "); break;
                    default:
                    case "EN": lgStrSql.AppendLine(" 				ENG_NAME CON_NM,  "); break;
                    case "CN": lgStrSql.AppendLine(" 				HANJA_NAME CON_NM,  "); break;
                }
                lgStrSql.AppendLine(" 				NAME CON_NM_KO,  ");
                lgStrSql.AppendLine(" 				ENG_NAME CON_NM_EN,  ");
                lgStrSql.AppendLine(" 				HANJA_NAME CON_NM_CN,  ");
                lgStrSql.AppendLine(" 				NAME CON_NM_JP,  ");
                lgStrSql.AppendLine(" 				'*' CON_GR_NO, ");
                lgStrSql.AppendLine(" 				A.MAIL_ADDR,  ");
                lgStrSql.AppendLine(" 				A.HAND_TEL_NO, ");
                lgStrSql.AppendLine(string.Format(" 				B.BIZ_AREA_NM_{0} BIZ_AREA_NM, ", lgLang));
                lgStrSql.AppendLine(string.Format(" 				C.PLANT_NM_{0} PLANT_NM, ", lgLang));
                lgStrSql.AppendLine(string.Format(" 				D.DEPT_NM_{0} DEPT_NM, ", lgLang));
                lgStrSql.AppendLine(" 				A.ROLE_PSTN_NM PSTN_NM, ");
                lgStrSql.AppendLine(" 				B.BIZ_AREA_NM_KO BIZ_AREA_NM_KO, ");
                lgStrSql.AppendLine(" 				C.PLANT_NM_KO PLANT_NM_KO, ");
                lgStrSql.AppendLine(" 				D.DEPT_NM_KO DEPT_NM_KO, ");
                lgStrSql.AppendLine(" 				A.ROLE_PSTN_NM PSTN_NM_KO, ");
                lgStrSql.AppendLine(" 				B.BIZ_AREA_NM_EN BIZ_AREA_NM_EN, ");
                lgStrSql.AppendLine(" 				C.PLANT_NM_EN PLANT_NM_EN, ");
                lgStrSql.AppendLine(" 				D.DEPT_NM_EN DEPT_NM_EN, ");
                lgStrSql.AppendLine(" 				A.ROLE_PSTN_NM PSTN_NM_EN, ");
                lgStrSql.AppendLine(" 				B.BIZ_AREA_NM_CN BIZ_AREA_NM_CN, ");
                lgStrSql.AppendLine(" 				C.PLANT_NM_CN PLANT_NM_CN, ");
                lgStrSql.AppendLine(" 				D.DEPT_NM_CN DEPT_NM_CN, ");
                lgStrSql.AppendLine(" 				A.ROLE_PSTN_NM PSTN_NM_CN, ");
                lgStrSql.AppendLine(" 				B.BIZ_AREA_NM_JP BIZ_AREA_NM_JP, ");
                lgStrSql.AppendLine(" 				C.PLANT_NM_JP PLANT_NM_JP, ");
                lgStrSql.AppendLine(" 				D.DEPT_NM_JP DEPT_NM_JP, ");
                lgStrSql.AppendLine(" 				A.ROLE_PSTN_NM PSTN_NM_JP, ");
                lgStrSql.AppendLine(" 				'AA' TYPE ");
                lgStrSql.AppendLine(" 		FROM S_OUTSIDE_CONTACT A (NOLOCK) ");
                lgStrSql.AppendLine(" 		LEFT JOIN S_BIZ_AREA_OUTSIDE B (NOLOCK) ON(A.BIZ_AREA_CD = B.BIZ_AREA_CD) ");
                lgStrSql.AppendLine(" 		LEFT JOIN S_PLANT_OUTSIDE C (NOLOCK) ON(A.PLANT_CD = C.PLANT_CD AND B.BIZ_AREA_CD = C.BIZ_AREA_CD) ");
                lgStrSql.AppendLine(" 		LEFT JOIN S_ACCT_DEPT_OUTSIDE D (NOLOCK) ON(A.DEPT_CD = D.DEPT_CD AND C.PLANT_CD = D.PLANT_CD) ");
                lgStrSql.AppendLine(" 		WHERE USE_CONTACT_YN = 'Y' ");
                lgStrSql.AppendLine(" 		AND ISNULL(A.MAIL_ADDR, '') != '' ");
                lgStrSql.AppendLine(string.Format(" 		AND A.USR_ID != {0} ", Data.FilterVariable(lgACT.UserId)));
                if (pArgs != null) {
                    switch (pArgs.lvl) {
                        case "1":
                        lgStrSql.AppendLine(string.Format(" AND A.BIZ_AREA_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                        break;
                        case "2":
                        lgStrSql.AppendLine(string.Format(" AND A.PLANT_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                        break;
                        case "3":
                        lgStrSql.AppendLine(string.Format(" AND A.DEPT_CD = {0}", Data.FilterVariable(pArgs.group_cd)));
                        break;
                        default: break;
                    }
                }
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "all") {
                lgStrSql.AppendLine(" 		UNION ALL --나의 그룹 ");
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "b") {
                lgStrSql.AppendLine(" 		SELECT	A.CON_NO, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(C.CON_GR_NO, 'CT99999999999') CON_GR_NO, ");
                lgStrSql.AppendLine(" 				B.CON_EM MAIL_ADDR, ");
                lgStrSql.AppendLine(" 				ISNULL(E.CON_PN, '') HAND_TEL_NO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_KO, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_EN, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_CN, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_JP, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_JP, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_JP, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_JP, ");
                lgStrSql.AppendLine(" 				'B' TYPE ");
                lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK) A ");
                lgStrSql.AppendLine(string.Format(" 		INNER JOIN dbo.UFN_TB_CONTACT_MAILADDR({0}) B ON(A.CON_NO = B.CON_NO) ", Data.FilterVariable(lgACT.UserId)));
                lgStrSql.AppendLine(" 		LEFT JOIN B_USR_CONTACT_GROUP (NOLOCK) C ON(A.CON_GR_NO = C.CON_GR_NO) ");
                lgStrSql.AppendLine(string.Format(" 		LEFT JOIN dbo.UFN_TB_CONTACT_ORG({0}) D ON(A.CON_NO = D.CON_NO) ", Data.FilterVariable(lgACT.UserId)));
                lgStrSql.AppendLine(string.Format(" 		LEFT JOIN dbo.UFN_TB_CONTACT_PN({0}) E ON(A.CON_NO = E.CON_NO) ", Data.FilterVariable(lgACT.UserId)));
                lgStrSql.AppendLine(string.Format(" 		WHERE A.USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
                if (pArgs != null && string.IsNullOrWhiteSpace(pArgs.group_cd) == false) {
                    if (pArgs.group_cd.ToLower() != "my_contact") {
                        lgStrSql.AppendLine(string.Format(" AND ISNULL(A.CON_GR_NO, 'CT99999999999') = {0}", Data.FilterVariable(pArgs.group_cd)));
                    }
                }
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "all") {
                lgStrSql.AppendLine(" 		UNION ALL --공용 주소록 ");
            }
            if (pArgs == null || pArgs.type == null || pArgs.type.ToLower() == "c") {
                lgStrSql.AppendLine(" 		SELECT	A.CON_NO, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				A.CON_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(C.CON_GR_NO, 'CT99999999999') CON_GR_NO, ");
                lgStrSql.AppendLine(" 				B.CON_EM MAIL_ADDR, ");
                lgStrSql.AppendLine(" 				ISNULL(E.CON_PN, '') HAND_TEL_NO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_KO, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_KO, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_EN, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_EN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_CN, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_CN, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_BIZ_NM, '') BIZ_AREA_NM_JP, ");
                lgStrSql.AppendLine(" 				'' PLANT_NM_JP, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_DEPT_NM, '') DEPT_NM_JP, ");
                lgStrSql.AppendLine(" 				ISNULL(D.CON_ORG_PSTN_NM, '') PSTN_NM_JP, ");
                lgStrSql.AppendLine(" 				'C' TYPE ");
                lgStrSql.AppendLine(" 		FROM B_USR_CONTACT (NOLOCK) A ");
                lgStrSql.AppendLine(" 		INNER JOIN dbo.UFN_TB_CONTACT_MAILADDR('PUBLIC') B ON(A.CON_NO = B.CON_NO) ");
                lgStrSql.AppendLine(" 		LEFT JOIN B_USR_CONTACT_GROUP (NOLOCK) C ON(A.CON_GR_NO = C.CON_GR_NO) ");
                lgStrSql.AppendLine(" 		LEFT JOIN dbo.UFN_TB_CONTACT_ORG('PUBLIC') D ON(A.CON_NO = D.CON_NO) ");
                lgStrSql.AppendLine(" 		LEFT JOIN dbo.UFN_TB_CONTACT_PN('PUBLIC') E ON(A.CON_NO = E.CON_NO) ");
                lgStrSql.AppendLine(" 		WHERE A.USR_ID = 'PUBLIC' ");
                if (pArgs != null && string.IsNullOrWhiteSpace(pArgs.group_cd) == false) {
                    if (pArgs.group_cd.ToLower() != "public_contact") {
                        lgStrSql.AppendLine(string.Format(" AND ISNULL(A.CON_GR_NO, 'CT99999999999') = {0}", Data.FilterVariable(pArgs.group_cd)));
                    }
                }
            }
            lgStrSql.AppendLine(" 		) A ");
            lgStrSql.AppendLine(" ORDER BY TYPE, CON_NM ");

            return lgDbAccess.ExecuteDataSet(lgStrSql.ToString()).Tables[0];
        }


        #endregion

        #region ■ 3.2 DbInsertData Multi


        #endregion

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #region ■■ 4.2.1 Single control event implementation group

        protected void cbpContactGroup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            this.CreateContactGroup();
        }

        protected void lbContactList_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            try {
                var cb_args = JsonConvert.DeserializeObject<ContactListCallBackArgs>(e.Parameter);
                switch (cb_args.Cmd) {
                    case "recent_week":
                        this.lbContactList.DataSource = this.lbContactList_Recent_Week_DbQuery();
                        break;
                    case "recent_hist":
                        this.lbContactList.DataSource = this.lbContactList_Recent_DbQuery();
                        break;
                    default:
                    case "group":
                        this.lbContactList.DataSource = this.lbContactList_DbQuery(cb_args);
                        break;
                    case "search":
                        var dt_contact_list = this.lbContactList_DbQuery(new ContactListCallBackArgs() { lvl = "0", group_cd = "all" });
                        if (string.IsNullOrWhiteSpace(cb_args.Data) == false) {
                            var s_list = from row in dt_contact_list.AsEnumerable()
                                              where row["CON_NM"].ToString().Contains(cb_args.Data) ||
                                                row["CON_NM_KO"].ToString().Contains(cb_args.Data) ||
                                                row["CON_NM_EN"].ToString().Contains(cb_args.Data) ||
                                                row["CON_NM_CN"].ToString().Contains(cb_args.Data) ||
                                                row["CON_NM_JP"].ToString().Contains(cb_args.Data) ||
                                                row["MAIL_ADDR"].ToString().Contains(cb_args.Data) ||
                                                row["HAND_TEL_NO"].ToString().Contains(cb_args.Data) ||
                                                row["BIZ_AREA_NM_KO"].ToString().Contains(cb_args.Data) ||
                                                row["BIZ_AREA_NM_EN"].ToString().Contains(cb_args.Data) ||
                                                row["BIZ_AREA_NM_CN"].ToString().Contains(cb_args.Data) ||
                                                row["BIZ_AREA_NM_JP"].ToString().Contains(cb_args.Data) ||
                                                row["PLANT_NM_KO"].ToString().Contains(cb_args.Data) ||
                                                row["PLANT_NM_EN"].ToString().Contains(cb_args.Data) ||
                                                row["PLANT_NM_CN"].ToString().Contains(cb_args.Data) ||
                                                row["PLANT_NM_JP"].ToString().Contains(cb_args.Data) ||
                                                row["DEPT_NM_KO"].ToString().Contains(cb_args.Data) ||
                                                row["DEPT_NM_EN"].ToString().Contains(cb_args.Data) ||
                                                row["DEPT_NM_CN"].ToString().Contains(cb_args.Data) ||
                                                row["DEPT_NM_JP"].ToString().Contains(cb_args.Data) ||
                                                row["PSTN_NM_KO"].ToString().Contains(cb_args.Data) ||
                                                row["PSTN_NM_EN"].ToString().Contains(cb_args.Data) ||
                                                row["PSTN_NM_CN"].ToString().Contains(cb_args.Data) ||
                                                row["PSTN_NM_JP"].ToString().Contains(cb_args.Data)
                                              select row;
                            if (s_list.Count() > 0) {
                                this.lbContactList.DataSource = s_list.CopyToDataTable();
                            } else {
                                this.lbContactList.DataSource = null;
                            }
                        } else {
                            this.lbContactList.DataSource = dt_contact_list;
                        }
                        break;
                }
                this.lbContactList.Items.Clear();
                this.lbContactList.DataBind();
            } catch (System.Exception ex) {
                throw ex;
            }
        }
        protected void lbContactList_ItemRowPrepared(object sender, ListBoxItemRowPreparedEventArgs e) {
            if (this.lbContactList.DataSource != null && ((DataTable)this.lbContactList.DataSource).Columns.Contains("DEPT_NM")) {
                e.Row.Attributes["title"] = e.Item.GetFieldValue("DEPT_NM").ToString();
            }
        }

        #endregion

        #region ■■ 4.2.2 Grid control event implementation group

        #endregion

        #region ▶ 5. User-defined function group

        void CreateContactGroup() {
            var dt_contact_group = this.tvContactGroup_DbQuery();

            var contactCntRows = dt_contact_group.Select("LVL = 1 AND CNT > 0");
            var totalCnt = 0;

            foreach (DataRow contactCntRow in contactCntRows) {
                totalCnt += int.Parse(contactCntRow["CNT"].ToString());
            }

            var rootNode = new TreeViewNode(string.Format("{0}|{1}", GetResource("CSTRESX00004"), totalCnt.ToString()), "0|ALL", string.Empty) {
                ToolTip = GetResource("CSTRESX00004")
            };

            rootNode.Nodes.AddRange(MakeContactGroup(dt_contact_group, dt_contact_group.Select("LVL = 1")));
            tvContactGroup.Nodes.Add(rootNode);
            tvContactGroup.ExpandAll();
            tvContactGroup.SelectedNode = rootNode;
        }
        TreeViewNode[] MakeContactGroup(DataTable pContactGroup, DataRow[] pRootContacts) {
            var nodes = new List<TreeViewNode>();

            foreach (DataRow contact in pRootContacts) {
                var trViewNode = new TreeViewNode(string.Format("{0}|{1}", contact["CON_GR_NM"], contact["CNT"]), string.Format("{0}|{1}|{2}", contact["LVL"], contact["CON_GR_NO"], contact["CONTACT_TYPE"]), string.Empty) {
                    ToolTip = contact["CON_GR_NM"].ToString()
                    //DataItem = menu.ReqRtUrl
                };

                var subContacts = pContactGroup.Select(string.Format("PAR_CON_GR_NO = {0} AND LVL = {1}", Data.FilterVariable(contact["CON_GR_NO"]), Data.FilterVariable(int.Parse(contact["LVL"].ToString()) + 1, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));

                if (subContacts.Length > 0) {
                    var rangeSubMenus = MakeContactGroup(pContactGroup, subContacts);

                    trViewNode.Nodes.AddRange(rangeSubMenus);
                }

                nodes.Add(trViewNode);
            }

            return nodes.ToArray();
        }
        

        #endregion



        #endregion

        #endregion
    }
}