
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

namespace eniFramework.WebApp.Modules.B3 {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class B3003MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "b3003ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B3003MA1()
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

        protected string DbQuery(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs) {

            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT ");
            lgStrSql.AppendLine(" MINOR_CD, ");
            lgStrSql.AppendLine(" MINOR_NM, ");
            lgStrSql.AppendLine(" MINOR_NM_KO, ");
            lgStrSql.AppendLine(" MINOR_NM_EN, ");
            lgStrSql.AppendLine(" MINOR_NM_CN, ");
            lgStrSql.AppendLine(" MINOR_NM_JP, ");
            lgStrSql.AppendLine(" USE_YN, ");
            lgStrSql.AppendLine(" INSRT_USER_ID, ");
            lgStrSql.AppendLine(" INSRT_DT, ");
            lgStrSql.AppendLine(" UPDT_USER_ID, ");
            lgStrSql.AppendLine(" UPDT_DT, ");
            lgStrSql.AppendLine(" OTL ");
            lgStrSql.AppendLine(" FROM B_MINOR (NOLOCK) ");
            lgStrSql.AppendLine(" WHERE MAJOR_CD = 'S0006' ");
            lgStrSql.AppendLine(" ORDER BY MAJOR_CD, MINOR_CD ");

            var strDataTable = new StringBuilder();
            var dsB1001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B1001MA1");
            var dtB1001MA1 = dsB1001MA1.Tables[0];

            foreach (DataRow row in dtB1001MA1.Rows) {
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_KO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_EN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_CN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MINOR_NM_JP"], eniSpread.ColSep));
                if (row["USE_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.RowSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.RowSep));
                }
            }

            return strDataTable.ToString();
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
                        lgStrSql.AppendLine(" INSERT INTO B_MINOR (MAJOR_CD, MINOR_CD, MAJOR_CD, MINOR_NM, MINOR_NM_KO, MINOR_NM_EN, MINOR_NM_CN, MINOR_NM_JP, MINOR_TYPE, USE_YN, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable("S0006", true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MAJOR_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_KO"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_EN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_CN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_NM_JP"], true, true));
                        lgStrSql.Append(Data.FilterVariable("S", true));
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
                        lgStrSql.AppendLine(string.Format(" USE_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM B_MINOR A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.MINOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"])));
                        lgStrSql.AppendLine(" AND A.MAJOR_CD = 'S0006'");

                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE B_MINOR ");
                        lgStrSql.AppendLine(string.Format(" WHERE MINOR_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MINOR_CD"])));
                        lgStrSql.AppendLine(" AND A.MAJOR_CD = 'S0006'");

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

            if (cb_r_args.Code == "-1") {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                switch(cb_args.Cmd) {
                    case "DbQuery":

                        var cb_dbquery_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                        var cb_result_data = this.DbQuery(lgDbAccess, cb_dbquery_args);

                        cb_r_args.MultiResult = cb_result_data;
                        break;
                    case "DbSave":

                        try {
                            lgDbBatAccess.BatchProcessStart("B3003MA1");

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