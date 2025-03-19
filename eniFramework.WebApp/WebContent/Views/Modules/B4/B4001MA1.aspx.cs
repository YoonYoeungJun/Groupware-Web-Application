
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
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

using DevExpress.Web;
using DevExpress.Web.Data;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Security;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Modules.B4 {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class B4001MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "b4001ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B4001MA1()
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
            chkUniCode.Text = GetGlobalResource("GCSTRESX00000");
            if (lgLang == "KO" || lgLang == "EN") {
                chkUniCode.Enabled = true;
                var strUniCode = GetCookie("ckUniCode");
                if (strUniCode == "1") {
                    chkUniCode.Checked = true;
                } else {
                    chkUniCode.Checked = false;
                }
            } else {
                chkUniCode.Enabled = false;
                chkUniCode.Visible = false;
            }

            tabMain.TabPages[0].Text = GetResource("CSTRESX00001");

            if ((lgLang == "KO" || lgLang == "EN") && !chkUniCode.Checked) {
                vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBSPD7;
                vspdData1.ActiveXVersion = SpreadVersion.vspdDFPOBSPD7;
                vspdData2.ActiveXVersion = SpreadVersion.vspdDFPOBSPD7;
            } else {
                vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
                vspdData1.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
                vspdData2.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
            }
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            
        }

        #endregion

        #region ■ 2.7 Initializatize variables

        protected override void OnInitVariables() {

        }

        #endregion

        #region ■ 2.8 Set local condition data


        protected override void OnInitConditionData() {
            
        }

        #endregion

        #region ■ 2.9 Set local default variables


        protected override void SetDefulatValues() {

        }

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery & ControlQuery

        protected void DbQuery(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs, BaseCallbackResultArgs oR_Args) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine("WITH MAIN_SQL AS ( ");
            lgStrSql.AppendLine("SELECT ROW = ROW_NUMBER() OVER (ORDER BY A.USR_ID), ");
            lgStrSql.AppendLine("     A.USR_ID, ");
            lgStrSql.AppendLine("     A.ERP_NO, ");
            lgStrSql.AppendLine("     CONVERT(VARCHAR(10), A.USR_VALID_DT, 121) USR_VALID_DT, ");
            lgStrSql.AppendLine("     A.PWD, ");
            lgStrSql.AppendLine("     CONVERT(VARCHAR(10), A.PWD_VALID_DT, 121) PWD_VALID_DT, ");
            lgStrSql.AppendLine("     A.NAME, ");
            lgStrSql.AppendLine("     A.ENG_NAME, ");
            lgStrSql.AppendLine("     A.HANJA_NAME, ");
            lgStrSql.AppendLine("     A.USR_KIND, ");
            lgStrSql.AppendLine(string.Format("     C.MINOR_NM_{0} USR_KIND_NM, ", lgLang));
            lgStrSql.AppendLine("     A.USR_TYPE, ");
            lgStrSql.AppendLine(string.Format("     D.MINOR_NM_{0} USR_TYPE_NM, ", lgLang));
            lgStrSql.AppendLine("     A.USR_GUBUN, ");
            lgStrSql.AppendLine(string.Format("     E.MINOR_NM_{0} USR_GUBUN_NM, ", lgLang));
            lgStrSql.AppendLine("     A.ADMIN_YN, ");
            lgStrSql.AppendLine("     A.USE_YN, ");
            lgStrSql.AppendLine("     A.REMARK, ");
            lgStrSql.AppendLine("     A.INSRT_USER_ID, ");
            lgStrSql.AppendLine("     A.INSRT_DT, ");
            lgStrSql.AppendLine("     A.UPDT_USER_ID, ");
            lgStrSql.AppendLine("     A.UPDT_DT, ");
            lgStrSql.AppendLine("     A.OTL ");
            lgStrSql.AppendLine(" FROM S_USR_MST A (NOLOCK) ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR C (NOLOCK) ON(A.USR_KIND = C.MINOR_CD AND C.MAJOR_CD = 'S0003') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR D (NOLOCK) ON(A.USR_TYPE = D.MINOR_CD AND D.MAJOR_CD = 'S0004') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR E (NOLOCK) ON(A.USR_GUBUN = E.MINOR_CD AND E.MAJOR_CD = 'S0005') ");
            lgStrSql.AppendLine(string.Format("WHERE A.ERP_NO LIKE {0}", Data.FilterVariable(pArgs.Data.ERP_NO, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.NAME LIKE {0}", Data.FilterVariable(pArgs.Data.NAME, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.USR_ID LIKE {0}", Data.FilterVariable(pArgs.Data.USR_ID, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(") ");
            lgStrSql.AppendLine("SELECT * FROM MAIN_SQL ");
            var curPage = 1; //공백으로 들어온다면 조회 페이지는 1페이지
            if (!string.IsNullOrWhiteSpace(pArgs.Data.PageNo) && int.TryParse(pArgs.Data.PageNo, out curPage)) {
                if (curPage <= 0) { //만약 0번의 페이지로 넘어온다면 페이지가 없다는것으로 간주하고 1페이지
                    curPage = 1;
                } else { //1페이지 이상 처리
                    curPage += 1;
                }
            }
            var pageRowCount = eniSpread.PageRowCount; //공백으로 들어온다면 기본값
            if (!string.IsNullOrWhiteSpace(pArgs.Data.PageRowCount) && int.TryParse(pArgs.Data.PageRowCount, out pageRowCount)) {
                if (pageRowCount <= 0) { //공백이 아니고 0 보다 작을때만 기본값 설정
                    pageRowCount = eniSpread.PageRowCount;
                }
            }
            lgStrSql.AppendLine(string.Format("WHERE ROW BETWEEN ({0} - 1) * {1} + 1 AND {0} * {1} + 1 ", curPage, pageRowCount));

            var strDataTable = new StringBuilder();
            var dsB4001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B4001MA1");
            var dtB4001MA1 = dsB4001MA1.Tables[0];

            for (int i = 0; i < dtB4001MA1.Rows.Count && i < pageRowCount; i++) {
                var row = dtB4001MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["USR_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ERP_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_VALID_DT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD_VALID_DT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ENG_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["HANJA_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_KIND"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_KIND_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_TYPE_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_GUBUN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_GUBUN_NM"], eniSpread.ColSep));
                if (row["ADMIN_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                if (row["ADMIN_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                if (row["USE_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                if (row["USE_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                strDataTable.Append(string.Format("{0}{1}", row["REMARK"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", i + ((curPage - 1) * pageRowCount) + 1, eniSpread.RowSep));
            }

            if (dtB4001MA1.Rows.Count > pageRowCount) {
                oR_Args.PageNo = curPage.ToString();
            } else {
                oR_Args.PageNo = "";
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }

        protected void DbQuery1(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs, BaseCallbackResultArgs oR_Args) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT A.USR_ID,  ");
            lgStrSql.AppendLine(" 		A.USR_ROLE_ID,  ");
            lgStrSql.AppendLine(string.Format(" 		B.USR_ROLE_NM_{0} USR_ROLE_NM ", lgLang));
            lgStrSql.AppendLine(" FROM S_USR_MST_S_USR_ROLE_ASSO A (NOLOCK) ");
            lgStrSql.AppendLine(" LEFT JOIN S_USR_ROLE B (NOLOCK) ON(A.USR_ROLE_ID = B.USR_ROLE_ID) ");
            lgStrSql.AppendLine(string.Format("WHERE A.USR_ID = {0}", Data.FilterVariable(pArgs.Data.USR_ID)));
            lgStrSql.AppendLine(" ORDER BY A.USR_ROLE_ID ");

            var strDataTable = new StringBuilder();
            var dsB4001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B4001MA1");
            var dtB4001MA1 = dsB4001MA1.Tables[0];

            for (int i = 0; i < dtB4001MA1.Rows.Count; i++) {
                var row = dtB4001MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["USR_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_ROLE_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", string.Empty, eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_ROLE_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", i + 1, eniSpread.RowSep));
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }

        protected void DbQuery2(DatabaseAccess pDbAccess, DbQuery2CallBackArgs pArgs, BaseCallbackResultArgs oR_Args) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT DISTINCT A.USR_ID,  ");
            lgStrSql.AppendLine(" 		B.MENU_ID, ");
            lgStrSql.AppendLine(string.Format(" 		C.MENU_NM_{0} MENU_NM, ", lgLang));
            lgStrSql.AppendLine(string.Format(" 		C.MENU_DES_{0} MENU_DES, ", lgLang));
            lgStrSql.AppendLine(" 		C.MENU_SEQ ");
            lgStrSql.AppendLine(" FROM S_USR_MST_S_USR_ROLE_ASSO A (NOLOCK) ");
            lgStrSql.AppendLine(" INNER JOIN S_USR_ROLE_S_USR_MENU_ASSO B (NOLOCK) ON(A.USR_ROLE_ID = B.USR_ROLE_ID AND B.USE_YN = 'Y') ");
            lgStrSql.AppendLine(" INNER JOIN S_USR_MENU C (NOLOCK) ON(B.MENU_ID = C.MENU_ID AND C.USE_YN = 'Y') ");
            lgStrSql.AppendLine(string.Format("WHERE A.USR_ID = {0}", Data.FilterVariable(pArgs.Data.USR_ID)));
            lgStrSql.AppendLine(string.Format("AND A.USR_ROLE_ID = {0}", Data.FilterVariable(pArgs.Data.USR_ROLE_ID)));
            lgStrSql.AppendLine(" ORDER BY C.MENU_SEQ, B.MENU_ID ");

            var strDataTable = new StringBuilder();
            var dsB4001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B4001MA1");
            var dtB4001MA1 = dsB4001MA1.Tables[0];

            for (int i = 0; i < dtB4001MA1.Rows.Count; i++) {
                var row = dtB4001MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["USR_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_DES"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", i + 1, eniSpread.RowSep));
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }

        #endregion

        #region ■ 3.2 DbSave

        protected void DbSave(DatabaseBatchAccess pDbBatAccess, DbSaveCallBackArgs pDbSaveArgs) {
            var executeRowCount = 0;
            var rowCount = 0;
            lgStrSql = new StringBuilder();
            for (int i = 0; i < pDbSaveArgs.Data.Rows.Count; i++) {
                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(@" INSERT INTO S_USR_MST (USR_ID, ERP_NO, USR_VALID_DT, PWD, PWD_VALID_DT, NAME, ENG_NAME, HANJA_NAME, USR_KIND, USR_TYPE, USR_GUBUN, ADMIN_YN, USE_YN, REMARK, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ERP_NO"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_VALID_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(SecurityManager.ConvertToString(MD5.GetHash(Encoding.ASCII.GetBytes(pDbSaveArgs.Data.Rows[i]["PWD"].ToString()))), true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PWD_VALID_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENG_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HANJA_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_KIND"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_GUBUN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADMIN_YN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["REMARK"], true, true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(0, FilterVarType.NoBraceButReplSingleWithDoubleQuotation));
                        lgStrSql.AppendLine(" ) ");
                        lgStrSql.AppendLine(" ");

                        //DEFAULT 권한 추가
                        lgStrSql.AppendLine(" INSERT INTO S_USR_MST_S_USR_ROLE_ASSO (USR_ID, USR_ROLE_ID, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"], true));
                        lgStrSql.Append(Data.FilterVariable("DEFAULT", true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                        lgStrSql.AppendLine(" ) ");

                        //관리자이면 ALL권한 추가
                        if (pDbSaveArgs.Data.Rows[i]["ADMIN_YN"].ToString() == "Y") {
                            lgStrSql.AppendLine(" ");
                            lgStrSql.AppendLine(" INSERT INTO S_USR_MST_S_USR_ROLE_ASSO (USR_ID, USR_ROLE_ID, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                            lgStrSql.Append(" VALUES( ");
                            lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"], true));
                            lgStrSql.Append(Data.FilterVariable("ALL", true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                            lgStrSql.AppendLine(" ) ");
                        }

                        break;
                    case DBAccessMode.Update:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" UPDATE A SET ");
                        lgStrSql.AppendLine(string.Format(" ERP_NO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ERP_NO"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_VALID_DT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_VALID_DT"], true)));

                        if (pDbSaveArgs.Data.Rows[i]["ORG_PWD"].ToString() != pDbSaveArgs.Data.Rows[i]["PWD"].ToString()) {
                            lgStrSql.AppendLine(string.Format(" PWD = {0}", Data.FilterVariable(SecurityManager.ConvertToString(MD5.GetHash(Encoding.ASCII.GetBytes(pDbSaveArgs.Data.Rows[i]["PWD"].ToString()))), true)));
                        } else {
                            lgStrSql.AppendLine(string.Format(" PWD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PWD"], true)));
                        }
                        lgStrSql.AppendLine(string.Format(" PWD_VALID_DT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PWD_VALID_DT"], true)));
                        lgStrSql.AppendLine(string.Format(" NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" ENG_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENG_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" HANJA_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HANJA_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" USR_KIND = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_KIND"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_TYPE"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_GUBUN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_GUBUN"], true)));
                        lgStrSql.AppendLine(string.Format(" ADMIN_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADMIN_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" USE_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" REMARK = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["REMARK"], true, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM S_USR_MST A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.USR_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"])));

                        if (pDbSaveArgs.Data.Rows[i]["ORG_ADMIN_YN"].ToString() != pDbSaveArgs.Data.Rows[i]["ADMIN_YN"].ToString() && pDbSaveArgs.Data.Rows[i]["ADMIN_YN"].ToString() == "Y") {
                            lgStrSql.AppendLine(" ");
                            lgStrSql.AppendLine(" INSERT INTO S_USR_MST_S_USR_ROLE_ASSO (USR_ID, USR_ROLE_ID, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                            lgStrSql.Append(" VALUES( ");
                            lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"], true));
                            lgStrSql.Append(Data.FilterVariable("ALL", true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                            lgStrSql.AppendLine(" ) ");
                        } else if (pDbSaveArgs.Data.Rows[i]["ORG_ADMIN_YN"].ToString() != pDbSaveArgs.Data.Rows[i]["ADMIN_YN"].ToString() && pDbSaveArgs.Data.Rows[i]["ADMIN_YN"].ToString() == "N") {
                            lgStrSql.AppendLine(" ");
                            lgStrSql.AppendLine(" DELETE S_USR_MST_S_USR_ROLE_ASSO ");
                            lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"])));
                            lgStrSql.AppendLine(" AND USR_ROLE_ID = 'ALL' ");
                        }

                        break;
                    case DBAccessMode.Delete:
                        //삭제된 사용자는 데이터 베이스의 DELETE_YN으로 구분하고 게시판등에서 이름을 표시할때 쓴다.
                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" UPDATE A SET ");
                        lgStrSql.AppendLine(" USE_YN = 'N' ");
                        lgStrSql.AppendLine(" FROM S_USR_MST A ");
                        lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"])));

                        break;
                }

                executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());
            }

            for (int i = 0; i < pDbSaveArgs.Data1.Rows.Count; i++) {
                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data1.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:
                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" USR_ID ");
                        lgStrSql.AppendLine(" FROM S_USR_MST_S_USR_ROLE_ASSO (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ID"])));
                        lgStrSql.AppendLine(string.Format(" AND USR_ROLE_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ROLE_ID"])));
                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());
                        if (rowCount > 0) {
                            throw new ExceptionManager("이미 존재하는 권한입니다.");
                        }

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" INSERT INTO S_USR_MST_S_USR_ROLE_ASSO (USR_ID, USR_ROLE_ID, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ROLE_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                        lgStrSql.AppendLine(" ) ");
                        break;
                    case DBAccessMode.Delete:
                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE S_USR_MST_S_USR_ROLE_ASSO ");
                        lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ID"])));
                        lgStrSql.AppendLine(string.Format(" AND USR_ROLE_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data1.Rows[i]["USR_ROLE_ID"])));
                        break;
                }

                executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());
            }
        }

        #endregion

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #region ■■ 4.2.1 Single control event implementation group

        #endregion

        #region ■■ 4.2.2 Grid control event implementation group

        protected class vspdDataCallBackArgs {
            public string ERP_NO { get; set; }
            public string NAME { get; set; }
            public string USR_ID { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }

        protected class vspdData2CallBackArgs {
            public string ERP_NO { get; set; }
            public string NAME { get; set; }
            public string USR_ID { get; set; }
            public string USR_ROLE_ID { get; set; }
        }

        protected class DbQueryCallBackArgs : BaseCallbackArgs {
            public new vspdDataCallBackArgs Data { get; set; }
        }
        protected class DbQuery2CallBackArgs : BaseCallbackArgs {
            public new vspdData2CallBackArgs Data { get; set; }
        }
        protected class DbSaveCallBackArgs : BaseCallbackArgs {
            public new DataTable Data { get; set; }
            public DataTable Data1 { get; set; }
        }

        protected void vspdDataCbProcess_Callback(object source, CallbackEventArgs e) {

            var cb_r_args = GetBaseCallbackResultArgs();

            var cb_args = default(BaseCallbackArgs);

            try {
                cb_args = BaseCallbackArgs.GetDeserialize<BaseCallbackArgs>(e.Parameter);

                if(cb_args == null) {
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                } else {
                    cb_r_args.Bind(cb_args);
                }
            } catch(SystemException ex) {
                cb_r_args.InnerException = ex;
            }

            if(cb_r_args.Code == "-1") {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                switch (cb_args.Cmd) {
                    case "DbQuery":
                        switch (cb_args.CmdDetail) {
                            case "vspdData":
                                var cb_dbquery_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                                this.DbQuery(lgDbAccess, cb_dbquery_args, cb_r_args);
                                break;
                            case "vspdData1":
                                var cb_dbquery_args1 = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                                this.DbQuery1(lgDbAccess, cb_dbquery_args1, cb_r_args);
                                break;
                            case "vspdData2":
                                var cb_dbquery_args2 = DbQuery2CallBackArgs.GetDeserialize<DbQuery2CallBackArgs>(e.Parameter);

                                this.DbQuery2(lgDbAccess, cb_dbquery_args2, cb_r_args);
                                break;
                        }
                        
                        break;
                    case "DbSave":
                        try {
                            lgDbBatAccess.BatchProcessStart("B4001MA1");

                            var cb_dbsave_args = DbSaveCallBackArgs.GetDeserialize<DbSaveCallBackArgs>(e.Parameter);

                            this.DbSave(lgDbBatAccess, cb_dbsave_args);

                        } catch (ExceptionManager ex) {
                            lgDbBatAccess.BatchProcessRollback();
                            throw ex;
                        } catch (System.Exception ex) {
                            lgDbBatAccess.BatchProcessRollback();
                            throw new ExceptionManager(ex);
                        } finally {
                            lgDbBatAccess.BatchProcessEnd();
                        }
                        break;
                    default:
                        cb_r_args.Code = "-1";
                        cb_r_args.Message = GetGlobalResource("GCSTRESX00102");
                        break;
                }
            } catch(System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }

        #endregion

        #region ▶ 5. User-defined function group

        #endregion

        #endregion

        #endregion
    }
}