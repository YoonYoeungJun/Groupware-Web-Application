
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
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
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Common.ActiveX;

#endregion

namespace eniFramework.WebApp.Modules.B0 {
    /// <summary>
    /// B0000MA1
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class B0000MA1 : BaseUIACTPage {
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

        protected override bool UsedSessionDataSet { get { return true; } }
        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "b0000ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B0000MA1() : base() { }

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
            lgStrSql.AppendLine("SELECT ROW = ROW_NUMBER() OVER (ORDER BY AUTO_NO_TYPE), ");
            lgStrSql.AppendLine("      AUTO_NO_TYPE, ");
            lgStrSql.AppendLine("      AUTO_NO_NM, ");
            lgStrSql.AppendLine("      EFFECT_FROM_DT, ");
            lgStrSql.AppendLine("      AUTO_FLAG, ");
            lgStrSql.AppendLine(string.Format("      CASE WHEN AUTO_FLAG = 'A' THEN N'{0}' ELSE N'{1}' END AUTO_FLAG_NM, ", GetResource("CSTRESX00017"), GetResource("CSTRESX00018")));
            lgStrSql.AppendLine("      JOB_PREFIX, ");
            lgStrSql.AppendLine("      DATE_TYPE, ");
            lgStrSql.AppendLine("      SERIAL_LEN, ");
            lgStrSql.AppendLine("      SERIAL_DIGIT, ");
            lgStrSql.AppendLine("      DATE_INFO, ");
            lgStrSql.AppendLine("      SERIAL_NO, ");
            lgStrSql.AppendLine("      AUTO_NO, ");
            lgStrSql.AppendLine("      INSRT_USER_ID, ");
            lgStrSql.AppendLine("      INSRT_DT, ");
            lgStrSql.AppendLine("      UPDT_USER_ID, ");
            lgStrSql.AppendLine("      UPDT_DT ");
            lgStrSql.AppendLine("FROM B_AUTO_NUMBERING (NOLOCK)");
            lgStrSql.AppendLine(string.Format("WHERE AUTO_NO_TYPE LIKE {0}", Data.FilterVariable(pArgs.Data.AUTO_NO_TYPE, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND EFFECT_FROM_DT >= {0}", Data.FilterVariable(pArgs.Data.EFFECT_FROM_DT)));
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
            var dsB0000MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B0000MA1");
            var dtB0000MA1 = dsB0000MA1.Tables[0];

            for (int i = 0; i < dtB0000MA1.Rows.Count && i < pageRowCount; i++) {
                var row = dtB0000MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["AUTO_NO_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", string.Empty, eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["AUTO_NO_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", ((DateTime)row["EFFECT_FROM_DT"]).ToString(CommonVariable.CDT_YYYY_MM_DD), eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["AUTO_FLAG"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["AUTO_FLAG_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["JOB_PREFIX"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DATE_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["SERIAL_LEN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["SERIAL_DIGIT"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["DATE_INFO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["SERIAL_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["AUTO_NO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", i + ((curPage - 1) * pageRowCount) + 1, eniSpread.RowSep));
            }

            if (dtB0000MA1.Rows.Count > pageRowCount) {
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
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" AUTO_NO_TYPE ");
                        lgStrSql.AppendLine(" FROM B_AUTO_NUMBERING (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE AUTO_NO_TYPE = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_TYPE"])));
                        lgStrSql.AppendLine(string.Format(" AND EFFECT_FROM_DT = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EFFECT_FROM_DT"])));
                        var rowCoiunt = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());
                        if (rowCoiunt > 0) {
                            throw new ExceptionManager(GetGlobalResource("GCSTRESX00500"));
                        }

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" INSERT INTO B_AUTO_NUMBERING (AUTO_NO_TYPE, AUTO_NO_NM, EFFECT_FROM_DT, AUTO_FLAG, JOB_PREFIX, DATE_TYPE, SERIAL_LEN, SERIAL_DIGIT, SERIAL_NO, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EFFECT_FROM_DT"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_FLAG"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["JOB_PREFIX"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DATE_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SERIAL_LEN"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SERIAL_DIGIT"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        lgStrSql.Append(Data.FilterVariable(0, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                        lgStrSql.AppendLine(" ) ");

                        break;
                    case DBAccessMode.Update:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" UPDATE A SET ");
                        lgStrSql.AppendLine(string.Format(" AUTO_NO_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_NM"], true, true)));
                        lgStrSql.AppendLine(string.Format(" AUTO_FLAG = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_FLAG"], true)));
                        lgStrSql.AppendLine(string.Format(" JOB_PREFIX = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["JOB_PREFIX"], true)));
                        lgStrSql.AppendLine(string.Format(" DATE_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["DATE_TYPE"], true)));
                        lgStrSql.AppendLine(string.Format(" SERIAL_LEN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SERIAL_LEN"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
                        lgStrSql.AppendLine(string.Format(" SERIAL_DIGIT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SERIAL_DIGIT"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM B_AUTO_NUMBERING A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.AUTO_NO_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_TYPE"])));
                        lgStrSql.AppendLine(string.Format(" AND A.EFFECT_FROM_DT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EFFECT_FROM_DT"])));
                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE B_AUTO_NUMBERING ");
                        lgStrSql.AppendLine(string.Format(" WHERE AUTO_NO_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["AUTO_NO_TYPE"])));
                        lgStrSql.AppendLine(string.Format(" AND EFFECT_FROM_DT = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["EFFECT_FROM_DT"])));
                 
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
        protected class vspdDataCallbackArgs {
            public string AUTO_NO_TYPE { get; set; }
            public string EFFECT_FROM_DT { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }
         protected class DbQueryCallBackArgs :BaseCallbackArgs {
             public new vspdDataCallbackArgs Data { get; set; }
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
                switch(cb_args.Cmd) {
                    case "DbQuery":
                        var cb_dbquery_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                        this.DbQuery(lgDbAccess, cb_dbquery_args, cb_r_args);
                        break;
                    case "DbSave":

                        try {
                            lgDbBatAccess.BatchProcessStart("B0000MA1");

                            var cb_dbsave_args = DbSaveCallBackArgs.GetDeserialize<DbSaveCallBackArgs>(e.Parameter);

                            this.DbSave(lgDbBatAccess, cb_dbsave_args);

                        } catch(ExceptionManager ex) {
                            lgDbBatAccess.BatchProcessRollback();
                            throw ex;
                        } catch(System.Exception ex) {
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