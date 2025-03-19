
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
    public partial class B3001MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "b3001ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public B3001MA1()
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
            lgStrSql.AppendLine(" SELECT A.BIZ_AREA_CD, ");
            lgStrSql.AppendLine(string.Format("     B.BIZ_AREA_NM_{0} BIZ_AREA_NM, ", this.lgLang));
            lgStrSql.AppendLine("     A.PLANT_CD, ");
            lgStrSql.AppendLine("     A.PLANT_NM, ");
            lgStrSql.AppendLine("     A.PLANT_FULL_NM, ");
            lgStrSql.AppendLine("     A.PLANT_ENG_NM, ");
            lgStrSql.AppendLine("     A.PLANT_NM_KO, ");
            lgStrSql.AppendLine("     A.PLANT_NM_EN, ");
            lgStrSql.AppendLine("     A.PLANT_NM_CN, ");
            lgStrSql.AppendLine("     A.PLANT_NM_JP, ");
            lgStrSql.AppendLine("     A.SEQ, ");
            lgStrSql.AppendLine("     A.INSRT_USER_ID, ");
            lgStrSql.AppendLine("     A.INSRT_DT, ");
            lgStrSql.AppendLine("     A.UPDT_USER_ID, ");
            lgStrSql.AppendLine("     A.UPDT_DT, ");
            lgStrSql.AppendLine("     A.OTL ");
            lgStrSql.AppendLine(" FROM S_PLANT (NOLOCK) A ");
            lgStrSql.AppendLine(" LEFT JOIN S_BIZ_AREA (NOLOCK) B ON(A.BIZ_AREA_CD = B.BIZ_AREA_CD) ");
            lgStrSql.AppendLine(string.Format("WHERE A.BIZ_AREA_CD LIKE {0}", Data.FilterVariable(pArgs.Data.BIZ_AREA_CD, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.PLANT_CD LIKE {0}", Data.FilterVariable(pArgs.Data.PLANT_CD, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(" ORDER BY SEQ, A.BIZ_AREA_CD, A.PLANT_CD ");

            var strDataTable = new StringBuilder();
            var dsB3001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B3001MA1");
            var dtB3001MA1 = dsB3001MA1.Tables[0];

            foreach (DataRow row in dtB3001MA1.Rows) {
                strDataTable.Append(string.Format("{0}{1}", row["BIZ_AREA_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["BIZ_AREA_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_CD"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_FULL_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_ENG_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM_KO"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM_EN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM_CN"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PLANT_NM_JP"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["SEQ"], eniSpread.RowSep));
            }

            return strDataTable.ToString();
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
                        lgStrSql = new StringBuilder();
                        lgStrSql.AppendLine(" INSERT INTO S_PLANT (BIZ_AREA_CD, PLANT_CD, PLANT_NM, PLANT_FULL_NM, PLANT_ENG_NM, PLANT_NM_KO, PLANT_NM_EN, PLANT_NM_CN, PLANT_NM_JP, SEQ, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIZ_AREA_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_CD"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_FULL_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_ENG_NM"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_KO"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_EN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_CN"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_JP"], true, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SEQ"], true));
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
                        lgStrSql.AppendLine(string.Format(" PLANT_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_FULL_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_FULL_NM"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_ENG_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_ENG_NM"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_NM_KO = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_KO"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_NM_EN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_EN"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_NM_CN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_CN"], true, true)));
                        lgStrSql.AppendLine(string.Format(" PLANT_NM_JP = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_NM_JP"], true, true)));
                        lgStrSql.AppendLine(string.Format(" SEQ = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["SEQ"], true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM S_PLANT A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.BIZ_AREA_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIZ_AREA_CD"])));
                        lgStrSql.AppendLine(string.Format(" AND A.PLANT_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_CD"])));

                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE S_PLANT ");
                        lgStrSql.AppendLine(string.Format(" WHERE BIZ_AREA_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["BIZ_AREA_CD"])));
                        lgStrSql.AppendLine(string.Format(" AND PLANT_CD = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PLANT_CD"])));

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
            public string BIZ_AREA_CD { get; set; }
            public string PLANT_CD { get; set; }
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
                            lgDbBatAccess.BatchProcessStart("B3001MA1");

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