
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
using eniFramework.WebApp;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;

#endregion

namespace eniFramework.WebApp.Common.Popup {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    public partial class CommonWinPopup : BaseUIACTPage {
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
        public override string PageID { get { return "commonwinpopup"; } }
        public override JScriptExt RegisteredScriptExt {
            get {
                return JScriptExt.Ext3;
            }
        }

        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.All;
            }
        }
        public override bool RegisteredServerControls {
            get {
                return true;
            }
        }
        public override bool RegisteredHiddenField {
            get {
                return true;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public CommonWinPopup()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageInit & WebUIPageLoad & WebUIPageLoadComplete

        //protected override void OnInitWebUIPage() {
            
        //}
        //protected override void OnWebUIPageLoad() {
            
        //}

        //protected override void OnWebUIPageLoadComplete() {
            

        //}

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        //protected override void OnInitRoutingParams(RouteData pRoute) {
            
        //}

        //protected override void OnInitRequestParams(NameValueCollection pQueryString) {


        //}
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            if ((lgLang == "KO" || lgLang == "EN") && GetCookie("ckUniCode") != "1") {
                vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBSPD7;
            } else {
                vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
            }
        }


        #endregion

        #region ■ 2.5 Request Processing

        //protected override void OnReqProcessing() {
            
        //}

        #endregion

        #region ■ 2.6 PostBack Request Processing
        //protected override void OnPostBackOrCallBackReqProcessing() {
            
        //}

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

        //protected string DbQuery(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs) {
        //    return null;
        //}


        #endregion

        #region ■ 3.2 DbInsertData Multi

     

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
            public string Code { get; set; }
            public string Name { get; set; }
            public DataTable Columns { get; set; }
            public string From { get; set; }
            public string Where { get; set; }
            public string OrderBy { get; set; }
            public string GroupBy { get; set; }
            public object Data { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }

        protected class DbQueryCallBackArgs : BaseCallbackArgs {
            public new vspdDataCallbackArgs Data { get; set; }
        }


        protected void vspdDataCbProcess_Callback(object source, CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs();

            var cb_args = default(BaseCallbackArgs);

            try {
                cb_args = BaseCallbackArgs.GetDeserialize<BaseCallbackArgs>(e.Parameter);

                if (cb_args == null) {
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                } else {
                    cb_r_args.Bind(cb_args);
                }
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
            }

            if (cb_r_args.Code == "-1") {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                switch (cb_args.Cmd) {
                    case "DbQuery":
                        var cb_dq_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                        this.DbQuery(lgDbAccess, cb_dq_args, cb_r_args);
                        break;
                    default:
                        cb_r_args.Code = "-1";
                        cb_r_args.Message = GetGlobalResource("GCSTRESX00102");
                        break;
                }
            } catch (System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }

        #endregion

        #region ▶ 5. User-defined function group

        protected void DbQuery(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs, BaseCallbackResultArgs oR_Args) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" WITH MAIN_SQL AS ( ");
            lgStrSql.Append(" SELECT ");
            var rowFieldName = pArgs.Data.Columns.Rows[0][0].ToString();
            if (rowFieldName.LastIndexOf(" ") > 0) {
                rowFieldName = rowFieldName.Substring(0, rowFieldName.LastIndexOf(" "));
                if (rowFieldName.ToLower().Contains("as")) {
                    rowFieldName = rowFieldName.ToUpper().Replace("AS", "");
                }
            } else {
                if (rowFieldName.ToLower().IndexOf(" as ") > 0) {
                    rowFieldName = rowFieldName.Substring(0, rowFieldName.ToLower().LastIndexOf(" as "));
                }
            }
            if (string.IsNullOrWhiteSpace(pArgs.Data.OrderBy)) {
                lgStrSql.AppendLine(string.Format("ROW = ROW_NUMBER() OVER (ORDER BY {0}), ", rowFieldName));
            } else {
                lgStrSql.AppendLine(string.Format("ROW = ROW_NUMBER() OVER (ORDER BY {0}), ", pArgs.Data.OrderBy));
            }
            
            for (int i = 0; i < pArgs.Data.Columns.Rows.Count; i++) {
                if (i == pArgs.Data.Columns.Rows.Count - 1) {
                    lgStrSql.AppendLine(string.Format(" {0} ", pArgs.Data.Columns.Rows[i]["FieldName"]));
                } else {
                    lgStrSql.AppendLine(string.Format(" {0}, ", pArgs.Data.Columns.Rows[i]["FieldName"]));
                }
            }
            lgStrSql.AppendLine(string.Format(" FROM {0} ", pArgs.Data.From));
            if (pArgs.Data.Columns.Rows.Count < 2) {
                var strWhere1 = pArgs.Data.Columns.Rows[0][0].ToString();
                if (strWhere1.LastIndexOf(" ") > 0) {
                    strWhere1 = strWhere1.Substring(0, strWhere1.LastIndexOf(" "));
                    if (strWhere1.ToLower().Contains("as")) {
                        strWhere1 = strWhere1.ToUpper().Replace("AS", "");
                    }
                } else {
                    if (strWhere1.ToLower().LastIndexOf(" as ") > 0) {
                        strWhere1 = strWhere1.Substring(0, strWhere1.ToLower().LastIndexOf(" as "));
                    }
                }
                lgStrSql.AppendLine(string.Format(" WHERE {0} LIKE {1} ", strWhere1, Data.FilterVariable(pArgs.Data.Code, true, FilterVarCondition.AllLikeCondition)));
            } else {
                var strWhere1 = pArgs.Data.Columns.Rows[0][0].ToString();
                if (strWhere1.LastIndexOf(" ") > 0) {
                    strWhere1 = strWhere1.Substring(0, strWhere1.LastIndexOf(" "));
                    if (strWhere1.ToLower().Contains("as")) {
                        strWhere1 = strWhere1.ToUpper().Replace("AS", "");
                    }
                } else {
                    if (strWhere1.ToLower().LastIndexOf(" as ") > 0) {
                        strWhere1 = strWhere1.Substring(0, strWhere1.ToLower().LastIndexOf(" as "));
                    }
                }
                lgStrSql.AppendLine(string.Format(" WHERE {0} LIKE {1} ", strWhere1, Data.FilterVariable(pArgs.Data.Code, true, FilterVarCondition.AllLikeCondition)));
                var strWhere2 = pArgs.Data.Columns.Rows[1][0].ToString();
                if (strWhere2.LastIndexOf(" ") > 0) {
                    strWhere2 = strWhere2.Substring(0, strWhere2.LastIndexOf(" "));
                    if (strWhere2.ToLower().Contains("as")) {
                        strWhere2 = strWhere2.ToUpper().Replace("AS", "");
                    }
                } else {
                    if (strWhere2.ToLower().LastIndexOf(" as ") > 0) {
                        strWhere2 = strWhere2.Substring(0, strWhere2.ToLower().LastIndexOf(" as "));
                    }
                }
                lgStrSql.AppendLine(string.Format(" AND {0} LIKE {1} ", strWhere2, Data.FilterVariable(pArgs.Data.Name, true, FilterVarCondition.AllLikeCondition)));
            }
            if (string.IsNullOrWhiteSpace(pArgs.Data.Where) == false) {
                lgStrSql.AppendLine(string.Format(" AND {0} ", pArgs.Data.Where));
            }

            if (!string.IsNullOrWhiteSpace(pArgs.Data.GroupBy)) {
                lgStrSql.AppendLine(string.Format(" GROUP BY {0}", pArgs.Data.GroupBy));
            }
            lgStrSql.AppendLine(" ) SELECT * FROM MAIN_SQL ");
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
            var dsCommonWinPopup = lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "CommonWinPopup");
            var dtCommonWinPopup = dsCommonWinPopup.Tables[0];

            for (int i = 0; i < dtCommonWinPopup.Rows.Count && i < pageRowCount; i++) {
                var row = dtCommonWinPopup.Rows[i];
                for (int j = 0; j < pArgs.Data.Columns.Rows.Count; j++) {
                    if (j == pArgs.Data.Columns.Rows.Count - 1) {
                        strDataTable.Append(string.Format("{0}{1}", row[j + 1], eniSpread.RowSep));
                    } else {
                        strDataTable.Append(string.Format("{0}{1}", row[j + 1], eniSpread.ColSep));
                    }
                }
            }

            if (dtCommonWinPopup.Rows.Count > pageRowCount) {
                oR_Args.PageNo = curPage.ToString();
            } else {
                oR_Args.PageNo = "";
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }

        #endregion

        #endregion

        #endregion
    }
}