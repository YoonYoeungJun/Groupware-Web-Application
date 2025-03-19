
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
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Common.ActiveX;

#endregion

namespace eniFramework.WebApp.Modules.B1 {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class B1001MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "b1001ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B1001MA1()
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

        protected override void OnRequesting() {
            
        }

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
            lgStrSql.AppendLine("SELECT ROW = ROW_NUMBER() OVER (ORDER BY MAJOR_CD, MINOR_CD, MINOR_NM), ");
            lgStrSql.AppendLine(" MAJOR_CD, ");
            lgStrSql.AppendLine(" MINOR_CD, ");
            lgStrSql.AppendLine(" MINOR_NM, ");
            lgStrSql.AppendLine(" MINOR_NM_KO, ");
            lgStrSql.AppendLine(" MINOR_NM_EN, ");
            lgStrSql.AppendLine(" MINOR_NM_CN, ");
            lgStrSql.AppendLine(" MINOR_NM_JP, ");
            lgStrSql.AppendLine(" MINOR_TYPE, ");
            lgStrSql.AppendLine(string.Format(" CASE WHEN MINOR_TYPE = 'S' THEN N'{0}' ELSE N'{1}' END MINOR_TYPE_NM, ", GetResource("CSTRESX00011"), GetResource("CSTRESX00012")));
            lgStrSql.AppendLine(" USE_YN, ");
            lgStrSql.AppendLine(" INSRT_USER_ID, ");
            lgStrSql.AppendLine(" INSRT_DT, ");
            lgStrSql.AppendLine(" UPDT_USER_ID, ");
            lgStrSql.AppendLine(" UPDT_DT, ");
            lgStrSql.AppendLine(" OTL ");
            lgStrSql.AppendLine(" FROM B_MINOR (NOLOCK) ");
            lgStrSql.AppendLine(string.Format("WHERE MAJOR_CD LIKE {0}", Data.FilterVariable(pArgs.Data.MAJOR_CD, FilterVarCondition.AllLikeCondition)));
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
            var dsB1001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B1001MA1");
            var dtB1001MA1 = dsB1001MA1.Tables[0];

            for (int i = 0; i < dtB1001MA1.Rows.Count && i < pageRowCount; i++) {
                var row = dtB1001MA1.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["MAJOR_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_KO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_EN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_CN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_JP"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_TYPE_NM"], eniSpread.ColSep));
                if (row["USE_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.ColSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.ColSep));
                }
                strDataTable.Append(string.Format("{0}{1}", i + ((curPage - 1) * pageRowCount) + 1, eniSpread.RowSep));
            }

            if (dtB1001MA1.Rows.Count > pageRowCount) {
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
            var rowCount = 0;
            lgStrSql = new StringBuilder();
            for (int i = 0; i < pDbSaveArgs.Data.Rows.Count; i++) {
                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" MINOR_CD ");
                        lgStrSql.AppendLine(" FROM B_MINOR (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE MAJOR_CD = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAJOR_CD"])));
                        lgStrSql.AppendLine(string.Format(" AND MINOR_CD = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"])));
                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());
                        if (rowCount > 0) {
                            throw new ExceptionManager(string.Format("필드 : MAJOR_CD, 값 : {0}<br> 필드 : MINOR_CD, 값 : {1}은 이미 존재하는 데이터 입니다.", pDbSaveArgs.Data.Rows[i]["MAJOR_CD"], pDbSaveArgs.Data.Rows[i]["MINOR_CD"]));
                        }

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" INSERT INTO B_MINOR (MINOR_CD, MAJOR_CD, MINOR_NM, MINOR_NM_KO, MINOR_NM_EN, MINOR_NM_CN, MINOR_NM_JP, MINOR_TYPE, USE_YN, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAJOR_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_KO"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_EN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_CN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_JP"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(0, FilterVarType.NoBraceButReplSingleWithDoubleQuotation));
                        lgStrSql.AppendLine(" ) ");

                        break;
                    case DBAccessMode.Update:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" UPDATE A SET ");
                        lgStrSql.AppendLine(string.Format(" MINOR_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MINOR_NM_KO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_KO"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MINOR_NM_EN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_EN"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MINOR_NM_CN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_CN"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MINOR_NM_JP = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_JP"], true, true)));
                        lgStrSql.AppendLine(string.Format(" MINOR_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_TYPE"], true)));
                        lgStrSql.AppendLine(string.Format(" USE_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM B_MINOR A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.MINOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"])));
                        lgStrSql.AppendLine(string.Format(" AND A.MAJOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAJOR_CD"])));

                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE B_MINOR ");
                        lgStrSql.AppendLine(string.Format(" WHERE MINOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"])));
                        lgStrSql.AppendLine(string.Format(" AND MAJOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAJOR_CD"])));

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
            public string MAJOR_CD { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }
        protected class DbQueryCallBackArgs : BaseCallbackArgs {
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
                            lgDbBatAccess.BatchProcessStart("B1001MA1");

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

        #region Gridview InnerControl Event

        #endregion

        #endregion

        #region ▶ 5. User-defined function group

        #endregion

        #endregion

        #endregion
    }
}