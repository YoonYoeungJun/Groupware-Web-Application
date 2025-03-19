
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
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;

#endregion

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    public partial class ASPPrintView : BaseUIACTPage {
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
        public override string PageID { get { return "commonreport"; } }

        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json |
                        JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_BlockUI | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Extends | JScriptKind.Framework_Resources |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie | JScriptKind.Framework | JScriptKind.Framework_ControlBase |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Report |
                        JScriptKind.Framework_Message | JScriptKind.Framework_Loading | JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax |
                        JScriptKind.Framework_DbAccess | JScriptKind.Framework_Date | JScriptKind.Framework_Security | JScriptKind.Framework_Utils;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public ASPPrintView()
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
            documentViewer.ReportTypeName = "eniFramework.WebApp.WebContent.ASPReports.TestReport";
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


        protected class DbQueryCallBackArgs : BaseCallbackArgs {
            public string Code { get; set; }
            public string Name { get; set; }
            public DataTable Columns { get; set; }
            public string From { get; set; }
            public string Where { get; set; }
        }


        protected void vspdDataCbProcess_Callback(object source, CallbackEventArgs e) {
            var callbackArgs = JsonConvert.DeserializeObject<BaseCallbackArgs>(e.Parameter);

            try {
                if (callbackArgs.Cmd == "DbQuery") {
                    var callbackDbQueryArgs = JsonConvert.DeserializeObject<DbQueryCallBackArgs>(callbackArgs.Data.ToString());
                    var callbackDbqueryResultData = this.DbQuery(callbackDbQueryArgs);

                    var callbackDbQueryResult = new BaseCallbackResultArgs { Cmd = callbackArgs.Cmd, Data = callbackDbqueryResultData };
                    e.Result = JsonConvert.SerializeObject(callbackDbQueryResult);
                }
            } catch (ExceptionManager ex) {
                var callbackResult = new BaseCallbackResultArgs { Code = "-1", Cmd = callbackArgs.Cmd, Message = ex.Message };
                e.Result = JsonConvert.SerializeObject(callbackResult);
            } catch (System.Exception ex) {
                new ExceptionManager(ex);
                var callbackResult = new BaseCallbackResultArgs { Code = "-1", Cmd = callbackArgs.Cmd, Message = ex.Message };
                e.Result = JsonConvert.SerializeObject(callbackResult);
            }
        }

        #endregion

        #region ▶ 5. User-defined function group

        protected string DbQuery(DbQueryCallBackArgs pCallbackArgs) {
            lgStrSql = new StringBuilder();
            lgStrSql.Append(" SELECT ");
            for(int i = 0; i < pCallbackArgs.Columns.Rows.Count; i ++){
                if (i == pCallbackArgs.Columns.Rows.Count - 1){
                    lgStrSql.AppendLine(string.Format(" {0} ", pCallbackArgs.Columns.Rows[i]["FieldName"]));
                } else {
                    lgStrSql.Append(string.Format(" {0}, ", pCallbackArgs.Columns.Rows[i]["FieldName"]));
                }
            }
            lgStrSql.Append(string.Format(" FROM {0} ", pCallbackArgs.From));
            if (pCallbackArgs.Columns.Rows.Count < 2) {
                lgStrSql.AppendLine(string.Format(" WHERE {0} LIKE {1} ", pCallbackArgs.Columns.Rows[0]["FieldName"], Data.FilterVariable(pCallbackArgs.Code, FilterVarCondition.AllLikeCondition)));
            } else {
                lgStrSql.AppendLine(string.Format(" WHERE {0} LIKE {1} ", pCallbackArgs.Columns.Rows[0]["FieldName"], Data.FilterVariable(pCallbackArgs.Code, FilterVarCondition.AllLikeCondition)));
                lgStrSql.AppendLine(string.Format(" AND {0} LIKE {1} ", pCallbackArgs.Columns.Rows[1]["FieldName"], Data.FilterVariable(pCallbackArgs.Name, FilterVarCondition.AllLikeCondition)));
            }
            if (string.IsNullOrWhiteSpace(pCallbackArgs.Where) == false) {
                lgStrSql.AppendLine(string.Format(" AND {0} ", pCallbackArgs.Where));
            }

            var strDataTable = new StringBuilder();
            var dsCommonWinPopup = lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "CommonWinPopup");
            var dtCommonWinPopup = dsCommonWinPopup.Tables[0];

            foreach (DataRow row in dtCommonWinPopup.Rows) {
                for (int i = 0; i < pCallbackArgs.Columns.Rows.Count; i++) {
                    if (i == pCallbackArgs.Columns.Rows.Count - 1) {
                        strDataTable.Append(string.Format("{0}{1}", row[pCallbackArgs.Columns.Rows[i]["FieldName"].ToString()], eniSpread.RowSep));
                    } else {
                        strDataTable.Append(string.Format("{0}{1}", row[pCallbackArgs.Columns.Rows[i]["FieldName"].ToString()], eniSpread.ColSep));
                    }
                }
            }

            return strDataTable.ToString();
        }

        #endregion

        #endregion

        #endregion
    }
}