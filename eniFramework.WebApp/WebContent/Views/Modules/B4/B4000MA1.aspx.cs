
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
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;
using eniFramework.WebApp.Common.Annotations;

using hMailServer;
using hMailServerService;
using hMailServerService.SocketLayer;

#endregion

namespace eniFramework.WebApp.Modules.B4 {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class B4000MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "b4000ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B4000MA1()
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
            } else {
                vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
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
            lgStrSql.AppendLine("SELECT ROW = ROW_NUMBER() OVER (ORDER BY A.BIZ_AREA_CD, A.PLANT_CD, A.DEPT_CD, A.ROLE_PSTN, A.USR_ID), ");
            lgStrSql.AppendLine("     A.USR_ID, ");
            lgStrSql.AppendLine("     A.ERP_NO, ");
            lgStrSql.AppendLine("     CONVERT(VARCHAR(10), A.USR_VALID_DT, 121) USR_VALID_DT, ");
            lgStrSql.AppendLine("     A.PWD, ");
            lgStrSql.AppendLine("     CONVERT(VARCHAR(10), A.PWD_VALID_DT, 121) PWD_VALID_DT, ");
            lgStrSql.AppendLine("     A.PWD_SCT, ");
            lgStrSql.AppendLine("     A.DOMAIN, ");
            lgStrSql.AppendLine("     B.DOMAINSENDNAME DOMAIN_NM, ");
            lgStrSql.AppendLine("     A.FIRST_NAME, ");
            lgStrSql.AppendLine("     A.LAST_NAME, ");
            lgStrSql.AppendLine("     A.NAME, ");
            lgStrSql.AppendLine("     A.ENG_NAME, ");
            lgStrSql.AppendLine("     A.HANJA_NAME, ");
            lgStrSql.AppendLine("     A.BIRT_DAY, ");
            lgStrSql.AppendLine("     A.USR_KIND, ");
            lgStrSql.AppendLine(string.Format("     C.MINOR_NM_{0} USR_KIND_NM, ", lgLang));
            lgStrSql.AppendLine("     A.USR_TYPE, ");
            lgStrSql.AppendLine(string.Format("     D.MINOR_NM_{0} USR_TYPE_NM, ", lgLang));
            lgStrSql.AppendLine("     A.USR_GUBUN, ");
            lgStrSql.AppendLine(string.Format("     E.MINOR_NM_{0} USR_GUBUN_NM, ", lgLang));
            lgStrSql.AppendLine("     A.BIZ_AREA_CD, ");
            lgStrSql.AppendLine(string.Format("     F.BIZ_AREA_NM_{0} BIZ_AREA_NM, ", lgLang));
            lgStrSql.AppendLine("     A.PLANT_CD, ");
            lgStrSql.AppendLine(string.Format("     G.PLANT_NM_{0} PLANT_NM, ", lgLang));
            lgStrSql.AppendLine("     A.DEPT_CD, ");
            lgStrSql.AppendLine(string.Format("     H.DEPT_NM_{0} DEPT_NM, ", lgLang));
            lgStrSql.AppendLine("     A.ROLE_PSTN, ");
            lgStrSql.AppendLine(string.Format("     I.MINOR_NM_{0} ROLE_PSTN_NM, ", lgLang));
            lgStrSql.AppendLine("     A.ENTR_DT, ");
            lgStrSql.AppendLine("     A.EXT_MAIL_ADDR, ");
            lgStrSql.AppendLine("     A.ZIP_CODE, ");
            lgStrSql.AppendLine("     A.ADDR, ");
            lgStrSql.AppendLine("     A.TEL_NO, ");
            lgStrSql.AppendLine("     A.EM_TEL_NO, ");
            lgStrSql.AppendLine("     A.HAND_TEL_NO, ");
            lgStrSql.AppendLine("     A.ADMIN_YN, ");
            lgStrSql.AppendLine("     A.USE_MAIL_YN, ");
            lgStrSql.AppendLine("     A.MAIL_ADDR, ");
            lgStrSql.AppendLine("     A.MAIL_SIZE, ");
            lgStrSql.AppendLine("     A.MAIL_LEVEL, ");
            lgStrSql.AppendLine("     A.REMARK, ");
            lgStrSql.AppendLine("     A.USE_YN, ");
            lgStrSql.AppendLine("     A.INSRT_USER_ID, ");
            lgStrSql.AppendLine("     A.INSRT_DT, ");
            lgStrSql.AppendLine("     A.UPDT_USER_ID, ");
            lgStrSql.AppendLine("     A.UPDT_DT, ");
            lgStrSql.AppendLine("     A.OTL ");
            lgStrSql.AppendLine(" FROM S_USR_MST (NOLOCK) A ");
            lgStrSql.AppendLine(" LEFT JOIN V_MAIL_DOMAINS (NOLOCK) B ON(A.DOMAIN = B.DOMAINNAME) ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) C ON(A.USR_KIND = C.MINOR_CD AND C.MAJOR_CD = 'S0003') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) D ON(A.USR_TYPE = D.MINOR_CD AND D.MAJOR_CD = 'S0004') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) E ON(A.USR_GUBUN = E.MINOR_CD AND E.MAJOR_CD = 'S0005') ");
            lgStrSql.AppendLine(" LEFT JOIN S_BIZ_AREA (NOLOCK) F ON(A.BIZ_AREA_CD = F.BIZ_AREA_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN S_PLANT (NOLOCK) G ON(A.PLANT_CD = G.PLANT_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN S_ACCT_DEPT (NOLOCK) H ON(A.DEPT_CD = H.DEPT_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) I ON(A.ROLE_PSTN = I.MINOR_CD AND I.MAJOR_CD = 'S0006') ");
            lgStrSql.AppendLine(string.Format("WHERE A.BIZ_AREA_CD LIKE {0}", Data.FilterVariable(pArgs.Data.BIZ_AREA_CD, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.PLANT_CD LIKE {0}", Data.FilterVariable(pArgs.Data.PLANT_CD, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.DEPT_CD LIKE {0}", Data.FilterVariable(pArgs.Data.DEPT_CD, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.ERP_NO LIKE {0}", Data.FilterVariable(pArgs.Data.ERP_NO, FilterVarCondition.AllLikeCondition)));
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
            var dsB4000MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B4000MA1");
            var dtB4000MA1 = dsB4000MA1.Tables[0];

            for (int i = 0; i < dtB4000MA1.Rows.Count && i < pageRowCount; i++) {
                var row = dtB4000MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["USR_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ERP_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_VALID_DT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PWD_VALID_DT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", this.TripleDESDecrypt(row["PWD_SCT"].ToString()), eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DOMAIN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DOMAIN_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["FIRST_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["LAST_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ENG_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["HANJA_NAME"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["BIRT_DAY"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_KIND"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_KIND_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_TYPE_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_GUBUN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USR_GUBUN_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["BIZ_AREA_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["BIZ_AREA_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DEPT_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DEPT_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ROLE_PSTN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ROLE_PSTN_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ENTR_DT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["EXT_MAIL_ADDR"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ZIP_CODE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ADDR"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["TEL_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["EM_TEL_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["HAND_TEL_NO"], eniSpread.ColSep));
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
                if (row["USE_MAIL_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                if (row["USE_MAIL_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                strDataTable.Append(string.Format("{0}{1}", row["MAIL_ADDR"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MAIL_SIZE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MAIL_LEVEL"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["REMARK"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["USE_YN"], eniSpread.ColSep));
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
                strDataTable.Append(string.Format("{0}{1}", i + ((curPage - 1) * pageRowCount) + 1, eniSpread.RowSep));
            }

            if (dtB4000MA1.Rows.Count > pageRowCount) {
                oR_Args.PageNo = curPage.ToString();
            } else {
                oR_Args.PageNo = "";
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }

        #endregion

        #region ■ 3.2 DbSave

        protected void DbSave(DatabaseBatchAccess pDbBatAccess, DbSaveCallBackArgs pDbSaveArgs) {
            var executeRowCount = 0;
            
            lgStrSql = new StringBuilder();
            for (int i = 0; i < pDbSaveArgs.Data.Rows.Count; i++) {
                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(@" INSERT INTO S_USR_MST (USR_ID, ERP_NO, USR_VALID_DT, PWD, PWD_VALID_DT, PWD_SCT, DOMAIN, FIRST_NAME, LAST_NAME, NAME, ENG_NAME, HANJA_NAME, BIRT_DAY, USR_KIND, USR_TYPE, USR_GUBUN, BIZ_AREA_CD, PLANT_CD, DEPT_CD, ROLE_PSTN, ENTR_DT, EXT_MAIL_ADDR, ZIP_CODE,
                                                ADDR, TEL_NO, EM_TEL_NO, HAND_TEL_NO, ADMIN_YN, USE_MAIL_YN, USE_CONTACT_YN, MAIL_ADDR, MAIL_SIZE, MAIL_LEVEL, USE_YN, REMARK, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES ( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ERP_NO"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_VALID_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(SecurityManager.ConvertToString(MD5.GetHash(Encoding.ASCII.GetBytes(pDbSaveArgs.Data.Rows[i]["PWD"].ToString()))), true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PWD_VALID_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(TripleDESEncrypt(pDbSaveArgs.Data.Rows[i]["PWD"].ToString()), true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DOMAIN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["FIRST_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["LAST_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(string.Format("{0}{1}", pDbSaveArgs.Data.Rows[i]["FIRST_NAME"], pDbSaveArgs.Data.Rows[i]["LAST_NAME"]), true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENG_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HANJA_NAME"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIRT_DAY"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_KIND"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_GUBUN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIZ_AREA_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DEPT_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ROLE_PSTN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENTR_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EXT_MAIL_ADDR"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ZIP_CODE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADDR"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["TEL_NO"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EM_TEL_NO"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HAND_TEL_NO"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADMIN_YN"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_MAIL_YN"], true));
                        lgStrSql.Append(Data.FilterVariable("Y", true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAIL_ADDR"], true, true));
                        lgStrSql.Append(Data.FilterVariable(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]), FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
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
                        if (pDbSaveArgs.Data.Rows[i]["ORG_PWD"].ToString() != pDbSaveArgs.Data.Rows[i]["PWD"].ToString()) {
                            lgStrSql.AppendLine(string.Format(" PWD_SCT = {0}", Data.FilterVariable(TripleDESEncrypt(pDbSaveArgs.Data.Rows[i]["PWD"].ToString()), true)));
                        } else {
                            lgStrSql.AppendLine(string.Format(" PWD_SCT = {0}", Data.FilterVariable(this.TripleDESEncrypt(pDbSaveArgs.Data.Rows[i]["PWD_SCT"].ToString()), true)));
                        }
                        lgStrSql.AppendLine(string.Format(" DOMAIN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DOMAIN"], true, true)));
                        lgStrSql.AppendLine(string.Format(" FIRST_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["FIRST_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" LAST_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["LAST_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" NAME = {0}", Data.FilterVariable(string.Format("{0}{1}", pDbSaveArgs.Data.Rows[i]["FIRST_NAME"], pDbSaveArgs.Data.Rows[i]["LAST_NAME"]), true, true)));
                        lgStrSql.AppendLine(string.Format(" ENG_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENG_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" HANJA_NAME = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HANJA_NAME"], true, true)));
                        lgStrSql.AppendLine(string.Format(" BIRT_DAY = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIRT_DAY"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_KIND = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_KIND"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_TYPE"], true)));
                        lgStrSql.AppendLine(string.Format(" USR_GUBUN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USR_GUBUN"], true)));
                        lgStrSql.AppendLine(string.Format(" BIZ_AREA_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIZ_AREA_CD"], true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_CD"], true)));
                        lgStrSql.AppendLine(string.Format(" DEPT_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DEPT_CD"], true)));
                        lgStrSql.AppendLine(string.Format(" ROLE_PSTN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ROLE_PSTN"], true)));
                        lgStrSql.AppendLine(string.Format(" ENTR_DT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ENTR_DT"], true)));
                        lgStrSql.AppendLine(string.Format(" EXT_MAIL_ADDR = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EXT_MAIL_ADDR"], true, true)));
                        lgStrSql.AppendLine(string.Format(" ZIP_CODE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ZIP_CODE"], true, true)));
                        lgStrSql.AppendLine(string.Format(" ADDR = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADDR"], true, true)));
                        lgStrSql.AppendLine(string.Format(" TEL_NO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["TEL_NO"], true)));
                        lgStrSql.AppendLine(string.Format(" EM_TEL_NO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EM_TEL_NO"], true)));
                        lgStrSql.AppendLine(string.Format(" HAND_TEL_NO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["HAND_TEL_NO"], true)));
                        lgStrSql.AppendLine(string.Format(" ADMIN_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ADMIN_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" USE_MAIL_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_MAIL_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" MAIL_ADDR = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAIL_ADDR"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MAIL_SIZE = {0}", Data.FilterVariable(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]), FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
                        lgStrSql.AppendLine(string.Format(" MAIL_LEVEL = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
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

            var apiMailServer = hMailServerProvider.hMailServerInstance;

            //메일 계정 생성
            for (int i = 0; i < pDbSaveArgs.Data.Rows.Count; i++) {
                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:
                        if (pDbSaveArgs.Data.Rows[i]["USE_MAIL_YN"].ToString() == "Y") {
                            if (hMailServerProvider.ExistAccount(string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], pDbSaveArgs.Data.Rows[i]["DOMAIN"]))) {
                                try {
                                    apiMailServer.Domains.ItemByName[pDbSaveArgs.Data.Rows[i]["DOMAIN"].ToString()].Accounts.ItemByAddress[string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], pDbSaveArgs.Data.Rows[i]["DOMAIN"])].Delete();
                                } catch { }
                            }

                            var acs = apiMailServer.Domains.ItemByName[pDbSaveArgs.Data.Rows[i]["DOMAIN"].ToString()].Accounts;
                            var ac = acs.Add();
                            ac.Address = string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], pDbSaveArgs.Data.Rows[i]["DOMAIN"]);
                            ac.Password = pDbSaveArgs.Data.Rows[i]["PWD"].ToString();
                            ac.PersonFirstName = pDbSaveArgs.Data.Rows[i]["FIRST_NAME"].ToString();
                            ac.PersonLastName = pDbSaveArgs.Data.Rows[i]["LAST_NAME"].ToString();
                            ac.MaxSize = int.Parse(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]));
                            switch (int.Parse(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"].ToString())) {
                                case 0:
                                    ac.AdminLevel = eAdminLevel.hAdminLevelNormal;
                                    break;
                                case 1:
                                    ac.AdminLevel = eAdminLevel.hAdminLevelDomainAdmin;
                                    break;
                                case 2:
                                    ac.AdminLevel = eAdminLevel.hAdminLevelServerAdmin;
                                    break;
                                default:
                                    break;
                            }

                            ac.Active = true;
                            ac.Save();

                            lgStrSql.Clear();
                            lgStrSql.AppendLine(" SELECT A.SEQ_NO, A.REFERENCE MESSAGEFOLDERNAME, A.REFERENCE_KO MESSAGEFOLDERNAME_KO, A.REF_TYPE MESSSAGEFOLDERTYPE, B.REFERENCE MESSAGEFOLDERSECTION, B.REF_TYPE MESSAGEFOLDERSECTIONTYPE ");
                            lgStrSql.AppendLine("   FROM S_CONFIGURATION A (NOLOCK) ");
                            lgStrSql.AppendLine("   LEFT JOIN S_CONFIGURATION B (NOLOCK) ON(A.MAJOR_CD = B.MAJOR_CD AND A.SEQ_NO = B.SEQ_NO AND B.MINOR_CD = 'M0002') ");
                            lgStrSql.AppendLine("  WHERE A.MAJOR_CD = 'S0050' ");
                            lgStrSql.AppendLine("    AND A.MINOR_CD = 'M0001' ");
                            lgStrSql.AppendLine("  ORDER BY SEQ_NO ");

                            var tb = pDbBatAccess.ExecuteDataSet(lgStrSql.ToString()).Tables[0];

                            foreach (DataRow fRow in tb.Rows) {
                                if (fRow["MESSAGEFOLDERNAME_KO"].ToString() != "받은 편지함") {
                                    ac.IMAPFolders.Add(fRow["MESSAGEFOLDERNAME"].ToString());
                                }
                            }

                            ac.Save();
                        }
                        break;
                    case DBAccessMode.Update:
                        //초기버전에는 다중도메인을 운영하지 않는다.
                        var oldDomain = pDbSaveArgs.Data.Rows[i]["DOMAIN"].ToString();
                        var newDomain = pDbSaveArgs.Data.Rows[i]["DOMAIN"].ToString();
                        var oldUseMailYn = pDbSaveArgs.Data.Rows[i]["ORG_USE_MAIL_YN"].ToString();
                        var newUseMailYn = pDbSaveArgs.Data.Rows[i]["USE_MAIL_YN"].ToString();
                        var hMailDomainObj = default(Domain);
                        var hMailAccount = default(Account);

                        //도메인이 변경에 따른 도메인별 계정 추가/삭제
                        if (oldDomain != newDomain) {
                            //이전 도메인의 계정 삭제

                            hMailDomainObj = apiMailServer.Domains.ItemByName[oldDomain];
                            if (hMailDomainObj != null) {
                                hMailAccount = hMailDomainObj.Accounts.get_ItemByAddress(string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], oldDomain));
                                hMailAccount.DeleteMessages();
                                hMailAccount.Delete();
                            }

                            //업데이트 도메인 계정 생성
                            hMailDomainObj = apiMailServer.Domains.ItemByName[newDomain];
                            hMailAccount = hMailDomainObj.Accounts.get_ItemByAddress(string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], newDomain));
                            hMailAccount.Password = pDbSaveArgs.Data.Rows[i]["PWD_SCT"].ToString(); //미빌번호 복호화 기능 있어야함
                            hMailAccount.PersonFirstName = pDbSaveArgs.Data.Rows[i]["FIRST_NAME"].ToString();
                            hMailAccount.PersonLastName = pDbSaveArgs.Data.Rows[i]["LAST_NAME"].ToString();
                            hMailAccount.MaxSize = int.Parse(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]));
                            switch (int.Parse(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"].ToString())) {
                                case 0:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelNormal;
                                    break;
                                case 1:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelDomainAdmin;
                                    break;
                                case 2:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelServerAdmin;
                                    break;
                                default:
                                    break;
                            }
                            hMailAccount.Active = true;
                            hMailAccount.Save();
                        } else {
                            hMailDomainObj = apiMailServer.Domains.ItemByName[newDomain];
                        }

                        if (oldUseMailYn == newUseMailYn && newUseMailYn == "Y") {
                            //메일 사용플래그가 변경된게 없으면서 사용으로 되어있을땐 메일 계정 업데이트
                            hMailAccount = hMailDomainObj.Accounts.get_ItemByAddress(string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], newDomain));
                            hMailAccount.Password = pDbSaveArgs.Data.Rows[i]["PWD_SCT"].ToString();
                            hMailAccount.PersonFirstName = pDbSaveArgs.Data.Rows[i]["FIRST_NAME"].ToString();
                            hMailAccount.PersonLastName = pDbSaveArgs.Data.Rows[i]["LAST_NAME"].ToString();
                            hMailAccount.MaxSize = int.Parse(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]));
                            switch (int.Parse(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"].ToString())) {
                                case 0:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelNormal;
                                    break;
                                case 1:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelDomainAdmin;
                                    break;
                                case 2:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelServerAdmin;
                                    break;
                                default:
                                    break;
                            }
                            hMailAccount.Active = true;
                            hMailAccount.Save();
                        } else if (oldUseMailYn != newUseMailYn && newUseMailYn == "Y") {
                            //메일 사용플래그가 변경되었으면서 사용으로 되어있으면 메일 계정 생성
                            hMailAccount = hMailDomainObj.Accounts.Add();
                            hMailAccount.Address = string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], pDbSaveArgs.Data.Rows[i]["DOMAIN"]);
                            hMailAccount.Password = pDbSaveArgs.Data.Rows[i]["PWD_SCT"].ToString();
                            hMailAccount.PersonFirstName = pDbSaveArgs.Data.Rows[i]["FIRST_NAME"].ToString();
                            hMailAccount.PersonLastName = pDbSaveArgs.Data.Rows[i]["LAST_NAME"].ToString();
                            hMailAccount.MaxSize = int.Parse(StringFormat.ConvertNumber(pDbSaveArgs.Data.Rows[i]["MAIL_SIZE"]));
                            switch (int.Parse(pDbSaveArgs.Data.Rows[i]["MAIL_LEVEL"].ToString())) {
                                case 0:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelNormal;
                                    break;
                                case 1:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelDomainAdmin;
                                    break;
                                case 2:
                                    hMailAccount.AdminLevel = eAdminLevel.hAdminLevelServerAdmin;
                                    break;
                                default:
                                    break;
                            }

                            hMailAccount.Active = true;
                            hMailAccount.Save();

                            lgStrSql = new StringBuilder();
                            lgStrSql.AppendLine(" SELECT A.SEQ_NO, A.REFERENCE MESSAGEFOLDERNAME, A.REFERENCE_KO MESSAGEFOLDERNAME_KO, A.REF_TYPE MESSSAGEFOLDERTYPE, B.REFERENCE MESSAGEFOLDERSECTION, B.REF_TYPE MESSAGEFOLDERSECTIONTYPE ");
                            lgStrSql.AppendLine("   FROM S_CONFIGURATION A (NOLOCK) ");
                            lgStrSql.AppendLine("   LEFT JOIN S_CONFIGURATION B (NOLOCK) ON(A.MAJOR_CD = B.MAJOR_CD AND A.SEQ_NO = B.SEQ_NO AND B.MINOR_CD = 'M0002') ");
                            lgStrSql.AppendLine("  WHERE A.MAJOR_CD = 'S0050' ");
                            lgStrSql.AppendLine("    AND A.MINOR_CD = 'M0001' ");
                            lgStrSql.AppendLine("  ORDER BY SEQ_NO ");

                            var tb = pDbBatAccess.ExecuteDataSet(lgStrSql.ToString()).Tables[0];

                            foreach (DataRow fRow in tb.Rows) {
                                if (fRow["MESSAGEFOLDERNAME_KO"].ToString() != "받은 편지함") {
                                    hMailAccount.IMAPFolders.Add(fRow["MESSAGEFOLDERNAME"].ToString());
                                }
                            }

                            hMailAccount.Save();

                        } else if (oldUseMailYn != newUseMailYn && newUseMailYn == "N") {
                            //메일 사용플래그가 변경되었으면서 미사용으로 되어있으면 메일 계정 삭제
                            hMailAccount = hMailDomainObj.Accounts.get_ItemByAddress(string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], newDomain));
                            hMailAccount.DeleteMessages();
                            hMailAccount.Delete();
                        }
                        break;
                    case DBAccessMode.Delete:
                        if (pDbSaveArgs.Data.Rows[i]["ORG_USE_MAIL_YN"].ToString() == "Y") {
                            var acs = apiMailServer.Domains.ItemByName[pDbSaveArgs.Data.Rows[i]["DOMAIN"].ToString()].Accounts;
                            var ac = acs.ItemByAddress[string.Format("{0}@{1}", pDbSaveArgs.Data.Rows[i]["USR_ID"], pDbSaveArgs.Data.Rows[i]["DOMAIN"])];
                            ac.DeleteMessages();
                            ac.Delete();
                        }
                        break;
                }
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
            public string BIZ_AREA_CD { get; set; }
            public string PLANT_CD { get; set; }
            public string DEPT_CD { get; set; }
            public string ERP_NO { get; set; }
            public string NAME { get; set; }
            public string USR_ID { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }

        protected class DbQueryCallBackArgs : BaseCallbackArgs {
            public new vspdDataCallBackArgs Data { get; set; }
        }
        protected class DbSaveCallBackArgs : BaseCallbackArgs {
            public new DataTable Data { get; set; }
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
                        var cb_dbquery_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                        this.DbQuery(lgDbAccess, cb_dbquery_args, cb_r_args);
                        break;
                    case "DbSave":

                        try {
                            lgDbBatAccess.BatchProcessStart("B4000MA1");

                            var dbSaveArgs = JsonConvert.DeserializeObject<DbSaveCallBackArgs>(e.Parameter);

                            this.DbSave(lgDbBatAccess, dbSaveArgs);

                            lgDbBatAccess.BatchProcessEnd();
                        } catch (ExceptionManager ex) {
                            cb_r_args.InnerException = ex;
                            lgDbBatAccess.BatchProcessRollback();
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

        #region Gridview InnerControl Event

        #endregion

        #endregion

        #region ▶ 5. User-defined function group

        #endregion

        #endregion

        #endregion
    }
}