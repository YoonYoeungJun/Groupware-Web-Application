
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

namespace eniFramework.WebApp.Modules.N0 {
    /// <summary>
    /// N0001MA1
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class N0001MA1 : BaseUIACTPage {
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
        public override string PageID { get { return "n0001ma1"; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public N0001MA1()
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

        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            //col_PARENT_MENU_ID_DbQuery();
            //var col_PARENT_MENU_ID = eniGridData.Columns["PARENT_MENU_ID"] as GridViewDataComboBoxColumn;
            //col_PARENT_MENU_ID.PropertiesComboBox.DataSource = lgWorkDataSet.Tables["PARENT_MENU_ID"];

            //cboMenuGroup.DataSource = col_MENU_GROUP_DbQuery();

            //eniGridData.DataSource = new tdsB2.S_USR_MENUDataTable();
            //eniGridData.DataBind();
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
            lgStrSql.AppendLine(" SELECT A.MENU_ID, ");
            lgStrSql.AppendLine("     A.PARENT_MENU_ID, ");
            lgStrSql.AppendLine("     B.MENU_NM PARENT_MENU_NM, ");
            lgStrSql.AppendLine("     A.MENU_NM, ");
            lgStrSql.AppendLine("     A.MENU_DES, ");
            lgStrSql.AppendLine("     A.MENU_GROUP, ");
            lgStrSql.AppendLine("     C.MINOR_NM MENU_GROUP_NM, ");
            lgStrSql.AppendLine("     A.MENU_TYPE, ");
            lgStrSql.AppendLine("     CASE WHEN A.MENU_TYPE = 'M' THEN '메뉴' ELSE '프로그램' END MENU_TYPE_NM, ");
            lgStrSql.AppendLine("     A.MENU_LVL, ");
            lgStrSql.AppendLine("     A.MENU_SEQ, ");
            lgStrSql.AppendLine("     A.ROUTE_ID, ");
            lgStrSql.AppendLine("     D.ROUTE_NAME, ");
            lgStrSql.AppendLine("     A.USE_YN, ");
            lgStrSql.AppendLine("     A.INSRT_USER_ID, ");
            lgStrSql.AppendLine("     A.INSRT_DT, ");
            lgStrSql.AppendLine("     A.UPDT_USER_ID, ");
            lgStrSql.AppendLine("     A.UPDT_DT, ");
            lgStrSql.AppendLine("     A.OTL ");
            lgStrSql.AppendLine(" FROM S_USR_MENU (NOLOCK) A ");
            lgStrSql.AppendLine(" LEFT JOIN S_USR_MENU (NOLOCK) B ON(A.PARENT_MENU_ID = B.MENU_ID) ");
            lgStrSql.AppendLine(" LEFT JOIN S_MINOR (NOLOCK) C ON(A.MENU_GROUP = C.MINOR_CD AND C.MAJOR_CD = 'S0008') ");
            lgStrSql.AppendLine(" LEFT JOIN S_ROUTE_HDR (NOLOCK) D ON(A.ROUTE_ID = D.ROUTE_ID) ");
            lgStrSql.AppendLine(string.Format("WHERE A.MENU_ID LIKE {0}", Data.FilterVariable(pArgs.Data.MENU_ID, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.PARENT_MENU_ID LIKE {0}", Data.FilterVariable(pArgs.Data.PARENT_MENU_ID, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.MENU_GROUP LIKE {0}", Data.FilterVariable(pArgs.Data.MENU_GROUP, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.MENU_TYPE LIKE {0}", Data.FilterVariable(pArgs.Data.MENU_TYPE, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(string.Format("AND A.ROUTE_ID LIKE {0}", Data.FilterVariable(pArgs.Data.ROUTE_ID, FilterVarCondition.AllLikeCondition)));
            lgStrSql.AppendLine(" ORDER BY A.MENU_GROUP, A.MENU_ID, A.MENU_SEQ");

            var strDataTable = new StringBuilder();
            var dsN0001MA1 = pDbAccess.ExecuteDataSet(lgStrSql.ToString(), new string[] {"N0001MA1"});
            var dtN0001MA1 = dsN0001MA1.Tables[0];

            foreach (DataRow row in dtN0001MA1.Rows) {
                strDataTable.Append(string.Format("{0}{1}", row["MENU_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PARENT_MENU_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", string.Empty, eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["PARENT_MENU_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_DES"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_GROUP"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_GROUP_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_TYPE"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_TYPE_NM"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_LVL"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["MENU_SEQ"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ROUTE_ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", string.Empty, eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ROUTE_NAME"], eniSpread.ColSep));
                if (row["USE_YN"].ToString() == "Y") {
                    strDataTable.Append(string.Format("{0}{1}", "1", eniSpread.RowSep));
                } else {
                    strDataTable.Append(string.Format("{0}{1}", "0", eniSpread.RowSep));
                }
            }

            return strDataTable.ToString();
        }

        private DataTable col_MENU_GROUP_DbQuery() {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT ");
            lgStrSql.AppendLine(" MINOR_CD, ");
            lgStrSql.AppendLine(" MINOR_NM ");
            lgStrSql.AppendLine(" FROM S_MINOR (NOLOCK) ");
            lgStrSql.AppendLine(" WHERE MAJOR_CD = 'S0008' ");
            lgStrSql.AppendLine(" AND USE_YN = 'Y'");

            return lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "MENU_GROUP").Tables["MENU_GROUP"];
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
                        lgStrSql.AppendLine(" MENU_ID ");
                        lgStrSql.AppendLine(" FROM S_USR_MENU (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));
                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());
                        if (rowCount > 0) {
                            throw new ExceptionManager(string.Format("필드 : MAJOR_CD, 값 : {0}<br> 필드 : MINOR_CD, 값 : {1}은 이미 존재하는 데이터 입니다.", pDbSaveArgs.Data.Rows[i]["MENU_ID"], pDbSaveArgs.Data.Rows[i]["MINOR_CD"]));
                        }

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" INSERT INTO S_USR_MENU (MENU_ID, PARENT_MENU_ID, MENU_NM, MENU_DES, MENU_GROUP, MENU_TYPE, MENU_LVL, MENU_SEQ, ROUTE_ID, USE_YN, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT, OTL) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PARENT_MENU_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_NM"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_DES"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_GROUP"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_TYPE"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_LVL"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_SEQ"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ROUTE_ID"], true));
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
                        lgStrSql.AppendLine(string.Format(" PARENT_MENU_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["PARENT_MENU_ID"], true)));
                        lgStrSql.AppendLine(string.Format(" MENU_NM = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_NM"], true)));
                        lgStrSql.AppendLine(string.Format(" MENU_DES = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_DES"], true)));
                        lgStrSql.AppendLine(string.Format(" MENU_GROUP = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_GROUP"], true)));
                        lgStrSql.AppendLine(string.Format(" MENU_TYPE = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_TYPE"], true)));
                        lgStrSql.AppendLine(string.Format(" MENU_LVL = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_LVL"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
                        lgStrSql.AppendLine(string.Format(" MENU_SEQ = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_SEQ"], true)));
                        lgStrSql.AppendLine(string.Format(" ROUTE_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["ROUTE_ID"], true)));
                        lgStrSql.AppendLine(string.Format(" USE_YN = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId, true)));
                        lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        lgStrSql.AppendLine(" FROM S_USR_MENU A ");
                        lgStrSql.AppendLine(string.Format(" WHERE A.MENU_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" DELETE S_USR_MENU ");
                        lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                        break;
                }

                executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());

                lgStrSql.Clear();
                switch ((DBAccessMode)Enum.ToObject(typeof(DBAccessMode), int.Parse(pDbSaveArgs.Data.Rows[i]["DBAccessMode"].ToString()))) {
                    case DBAccessMode.Create:
                        //권한테이블에 생성
                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" MENU_ID ");
                        lgStrSql.AppendLine(" FROM S_USR_ROLE_S_USR_MENU_ASSO (NOLOCK) ");
                        lgStrSql.AppendLine(" WHERE USR_ROLE_ID = 'ALL' ");
                        lgStrSql.AppendLine(string.Format(" AND MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());

                        //이미 해당 메뉴가 권한테 존재하면 삭제
                        if (rowCount > 0) {
                            lgStrSql.Clear();
                            lgStrSql.AppendLine(" DELETE S_USR_ROLE_S_USR_MENU_ASSO ");
                            lgStrSql.AppendLine(" WHERE USR_ROLE_ID = 'ALL' ");
                            lgStrSql.AppendLine(string.Format(" AND MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                            executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());
                        }

                        //권한 생성
                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" INSERT INTO S_USR_ROLE_S_USR_MENU_ASSO (USR_ROLE_ID, MENU_ID, USE_YN, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                        lgStrSql.Append(" VALUES( ");
                        lgStrSql.Append(Data.FilterVariable("ALL", true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"], true));
                        lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                        lgStrSql.AppendLine(" ) ");

                        executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());

                        break;
                    case DBAccessMode.Update:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" USR_ROLE_ID ");
                        lgStrSql.AppendLine(" FROM S_USR_ROLE_S_USR_MENU_ASSO (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());

                        if (rowCount > 0) {
                            lgStrSql.Clear();
                            lgStrSql.AppendLine(" UPDATE S_USR_ROLE_S_USR_MENU_ASSO SET ");
                            lgStrSql.AppendLine(string.Format(" USE_YN =  {0}", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"])));
                            lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));
                        } else {
                            lgStrSql.Clear();
                            lgStrSql.AppendLine(" INSERT INTO S_USR_ROLE_S_USR_MENU_ASSO (USR_ROLE_ID, MENU_ID, USE_YN, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                            lgStrSql.Append(" VALUES( ");
                            lgStrSql.Append(Data.FilterVariable("ALL", true));
                            lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"], true));
                            lgStrSql.Append(Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["USE_YN"], true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                            lgStrSql.AppendLine(" ) ");
                        }

                        executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());

                        break;
                    case DBAccessMode.Delete:

                        lgStrSql.Clear();
                        lgStrSql.AppendLine(" SELECT ");
                        lgStrSql.AppendLine(" USR_ROLE_ID ");
                        lgStrSql.AppendLine(" FROM S_USR_ROLE_S_USR_MENU_ASSO (NOLOCK) ");
                        lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                        rowCount = pDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString());

                        if (rowCount > 0) {
                            lgStrSql = new StringBuilder();
                            lgStrSql.AppendLine(" DELETE S_USR_ROLE_S_USR_MENU_ASSO ");
                            lgStrSql.AppendLine(string.Format(" WHERE MENU_ID = {0} ", Data.FilterVariable(pDbSaveArgs.Data.Rows[i]["MENU_ID"])));

                            executeRowCount = pDbBatAccess.ExecuteNonQuery(lgStrSql.ToString());
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

        protected class vspdDataCallbackArgs {
            public string MENU_ID { get; set; }
            public string PARENT_MENU_ID { get; set; }
            public string MENU_GROUP { get; set; }
            public string MENU_TYPE { get; set; }
            public string ROUTE_ID { get; set; }
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

                        var cb_result_data = this.DbQuery(lgDbAccess, cb_dbquery_args);

                        cb_r_args.MultiResult = cb_result_data;
                        break;
                    case "DbSave":

                        try {
                            lgDbBatAccess.BatchProcessStart("N0001MA1");

                            var cb_dbsave_args = JsonConvert.DeserializeObject<DbSaveCallBackArgs>(e.Parameter);

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