
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

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Web.Data;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.WebContent.Views.Modules.P0 {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class P0000QA1 : BaseUIACTPage {
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

        //protected hMailManager msilManager = null;

        #endregion

        #region ■ 1.4 Class Global properties

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public P0000QA1()
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
        protected override void OnRequesting() {
            //switch (msilManager.hMailSvrApp.ServerState) {
            //    case eServerState.hStateStarting:
            //        eniLbl_MailSerVerStatus.Text = "시작하는중...";
            //        eniBtn_MailServerControl.Text = "중지";
            //        break;
            //    case eServerState.hStateRunning:
            //        eniLbl_MailSerVerStatus.Text = "실행중.";
            //        eniBtn_MailServerControl.Text = "중지";
            //        break;
            //    case eServerState.hStateStopping:
            //        eniLbl_MailSerVerStatus.Text = "중지하는중...";
            //        eniBtn_MailServerControl.Text = "시작";
            //        break;
            //    case eServerState.hStateStopped:
            //        eniLbl_MailSerVerStatus.Text = "중지.";
            //        eniBtn_MailServerControl.Text = "시작";
            //        break;
            //}
        }

        protected override void OnReqProcessing() {
            //eniGridData.DataSource = new tdsB0.S_MESSAGEDataTable();
            //eniGridData.DataBind();

            //var a = msilManager.hMailSvrApp.Status.ProcessedMessages;
            //var b = msilManager.hMailSvrApp.Status.RemovedSpamMessages;
            //var c = msilManager.hMailSvrApp.Status.RemovedViruses;
            //var d = msilManager.hMailSvrApp.Status.UndeliveredMessages;
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            if (eniGridData.IsCallback) {
                eniGridData.DataSource = lgWorkDataSet.Tables["S_MESSAGE"];
            }
        }

        #endregion

        #region ■ 2.7 Initializatize variables

        protected override void OnInitVariables() {
            //msilManager = new hMailManager();
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

        protected void DbQuery() {
            lgStrSql = new StringBuilder();
            lgStrSql.Append(" SELECT ");
            lgStrSql.Append(" MSG_CD, ");
            lgStrSql.Append(" MSG_TYPE, ");
            lgStrSql.Append(" SERVERITY, ");
            lgStrSql.Append(" MSG_TEXT, ");
            lgStrSql.Append(" INSRT_USER, ");
            lgStrSql.Append(" INSRT_DT, ");
            lgStrSql.Append(" UPDT_USER, ");
            lgStrSql.Append(" UPDT_DT, ");
            lgStrSql.Append(" OTL ");
            lgStrSql.Append(" FROM S_MESSAGE (NOLOCK) ");

            //Data.MergeDataSet<tdsB0.S_MESSAGEDataTable>(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "S_MESSAGE"), true);
        }

        //protected void col_MAJOR_CD_DbQuery() {
        //    lgStrSql.Append(" SELECT ");
        //    lgStrSql.Append(" MAJOR_CD, ");
        //    lgStrSql.Append(" MAJOR_NM, ");
        //    lgStrSql.Append(" MINOR_LEN, ");
        //    lgStrSql.Append(" MAJOR_TYPE, ");
        //    lgStrSql.Append(" USE_YN, ");
        //    lgStrSql.Append(" INSRT_USER, ");
        //    lgStrSql.Append(" INSRT_DT, ");
        //    lgStrSql.Append(" UPDT_USER, ");
        //    lgStrSql.Append(" UPDT_DT, ");
        //    lgStrSql.Append(" OTL ");
        //    lgStrSql.Append(" FROM S_MAJOR (NOLOCK) ");
        //    lgStrSql.Append(" WHERE USE_YN = 'Y' ");

        //    Data.MergeDataSet<tdsB0.S_MESSAGEDataTable>(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "S_MESSAGE"), true);
        //}

        #endregion

        #region ■ 3.2 DbInsertData Multi

        private void DbInsertData(SqlTransaction pSqlConnection, List<ASPxDataInsertValues> pInsertDataList) {
            foreach (var insrtRow in pInsertDataList) {
                lgStrSql = new StringBuilder();
                lgStrSql.Append(" SELECT ");
                lgStrSql.Append(" MSG_CD ");
                lgStrSql.Append(" FROM S_MESSAGE (NOLOCK) ");
                lgStrSql.Append(string.Format(" WHERE MSG_CD = {0} ", Data.FilterVariable(insrtRow.NewValues["MSG_CD"])));
                var rowCoiunt = DatabaseAccessBase.ExecuteRowCountQuery(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());
                if (rowCoiunt > 0) {
                    throw new ExceptionManager(string.Format("필드 : MSG_CD, 값 : {0}은 이미 존재하는 데이터 입니다.", insrtRow.NewValues["MSG_CD"]));
                }

                lgStrSql = new StringBuilder();
                lgStrSql.AppendLine(" INSERT INTO S_MESSAGE (MSG_CD, MSG_TYPE, SERVERITY, MSG_TEXT, INSRT_USER, INSRT_DT, UPDT_USER, UPDT_DT, OTL) ");
                lgStrSql.AppendLine(" VALUES( ");
                lgStrSql.Append(Data.FilterVariable(insrtRow.NewValues["MSG_CD"], true));
                lgStrSql.Append(Data.FilterVariable(insrtRow.NewValues["MSG_TYPE"], true));
                lgStrSql.Append(Data.FilterVariable(insrtRow.NewValues["SERVERITY"], true));
                lgStrSql.Append(Data.FilterVariable(insrtRow.NewValues["MSG_TEXT"], true));
                //lgStrSql.Append(Data.FilterVariable(lgWebUser.UserId, true));
                lgStrSql.Append(Data.FilterVariable("UNIERP", true));
                lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true));
                //lgStrSql.Append(Data.FilterVariable(lgWebUser.UserId, true));
                lgStrSql.Append(Data.FilterVariable("UNIERP", true));
                lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true));
                lgStrSql.Append(Data.FilterVariable(0, FilterVarType.NoBraceButReplSingleWithDoubleQuotation));
                lgStrSql.AppendLine(" ) ");

                var executeRowCount = DatabaseAccessBase.ExecuteNonQuery(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());
            }
        }

        #endregion

        #region ■ 3.3 DbUpdateData Multi

        private void DbUpdateData(SqlTransaction pSqlConnection, List<ASPxDataUpdateValues> pUpdateDataList) {
            foreach (var updateRow in pUpdateDataList) {

                // 낙관적 락킹 키로 이미 조회된 자료를 가져와 OTL 필드 값 확인
                var row = lgWorkDataSet.Tables["S_MESSAGE"].Select(string.Format("MSG_CD = {0}", Data.FilterVariable(updateRow.NewValues["MSG_CD"])));
                var rowOtl = int.Parse(row[0]["OTL"].ToString());

                lgStrSql = new StringBuilder();
                lgStrSql.AppendLine(" UPDATE A SET ");
                lgStrSql.AppendLine(string.Format(" MSG_TYPE = {0}", Data.FilterVariable(updateRow.NewValues["MSG_TYPE"], true)));
                lgStrSql.AppendLine(string.Format(" SERVERITY = {0}", Data.FilterVariable(updateRow.NewValues["SERVERITY"], true)));
                lgStrSql.AppendLine(string.Format(" MSG_TEXT = {0}", Data.FilterVariable(updateRow.NewValues["MSG_TEXT"], true)));
                //lgStrSql.AppendLine(string.Format(" UPDT_USR_ID = {0}", Data.FilterVariable(lgWebUser.UserId, true)));
                lgStrSql.AppendLine(string.Format(" UPDT_USER = {0}", Data.FilterVariable("UNIERP", true)));
                lgStrSql.AppendLine(string.Format(" UPDT_DT = {0}", Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true)));
                lgStrSql.AppendLine(string.Format(" OTL = {0}", Data.FilterVariable(rowOtl + 1, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                lgStrSql.AppendLine(" FROM S_MESSAGE A ");
                lgStrSql.AppendLine(string.Format(" WHERE A.MSG_CD = {0}", Data.FilterVariable(updateRow.NewValues["MSG_CD"])));
                lgStrSql.AppendLine(string.Format(" AND A.OTL = {0}", Data.FilterVariable(rowOtl)));

                var executeRowCount = DatabaseAccessBase.ExecuteNonQuery(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());

                //쿼리가 적용된 행수를 보고 삭제여부 판단한다.
                if (executeRowCount == 0) {
                    lgStrSql = new StringBuilder();
                    lgStrSql.Append(" SELECT ");
                    lgStrSql.Append(" UPDT_USER ");
                    lgStrSql.Append(" FROM S_MESSAGE (NOLOCK) A");
                    lgStrSql.AppendLine(string.Format(" WHERE A.MSG_CD = {0}", Data.FilterVariable(updateRow.NewValues["MSG_CD"])));

                    var ds = DatabaseAccessBase.ExecuteDataSet(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());

                    //낙관적 락킹 필드가 다른사용자에의해 변경된 경우
                    if (ds.Tables[0].Rows.Count > 0) {
                        throw new ExceptionManager(string.Format("키값 : {0}은 이미 {1}에 의해 변경된 데이터 입니다.<br>다시 조회후 수정 할수 있습니다.", updateRow.NewValues["MSG_CD"], ds.Tables[0].Rows[0]["UPDT_USER"]));
                    } else { // 이미 다른사용자에 의해 삭제된경우
                        throw new ExceptionManager(string.Format(string.Format("키값 : {0}은 수정되지 않았습니다.<br>이미 삭제된것으로 보입니다.", updateRow.NewValues["MSG_CD"])));
                    }
                }
            }
        }

        #endregion

        #region ■ 3.4 DbDeleteData Multi

        private void DbDeleteData(SqlTransaction pSqlConnection, List<ASPxDataDeleteValues> pDeleteDataList) {
            foreach (var deleteRow in pDeleteDataList) {

                // 낙관적 락킹 키로 이미 조회된 자료를 가져와 OTL 필드 값 확인
                var row = lgWorkDataSet.Tables["S_MESSAGE"].Select(string.Format("MSG_CD = {0}", Data.FilterVariable(deleteRow.Values["MSG_CD"])));
                var rowOtl = int.Parse(row[0]["OTL"].ToString());

                lgStrSql = new StringBuilder();
                lgStrSql.AppendLine(" DELETE S_MESSAGE ");
                lgStrSql.AppendLine(string.Format(" WHERE MSG_CD = {0}", Data.FilterVariable(deleteRow.Values["MSG_CD"])));
                lgStrSql.AppendLine(string.Format(" AND OTL = {0}", Data.FilterVariable(rowOtl)));

                var executeRowCount = DatabaseAccessBase.ExecuteNonQuery(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());

                //쿼리가 적용된 행수를 보고 삭제여부 판단한다.
                if (executeRowCount == 0) {
                    lgStrSql = new StringBuilder();
                    lgStrSql.Append(" SELECT ");
                    lgStrSql.Append(" UPDT_USER ");
                    lgStrSql.Append(" FROM S_MESSAGE (NOLOCK) A");
                    lgStrSql.AppendLine(string.Format(" WHERE A.MSG_CD = {0}", Data.FilterVariable(deleteRow.Values["MSG_CD"])));

                    var ds = DatabaseAccessBase.ExecuteDataSet(pSqlConnection, System.Data.CommandType.Text, lgStrSql.ToString());

                    //낙관적 락킹 필드가 다른사용자에의해 변경된 경우
                    if (ds.Tables[0].Rows.Count > 0) {
                        throw new ExceptionManager(string.Format("키값 : {0}은 이미 {1}에 의해 변경된 데이터 입니다.<br>다시 조회후 수정 할수 있습니다.", deleteRow.Values["MSG_CD"], ds.Tables[0].Rows[0]["UPDT_USER"]));
                    } else { // 이미 다른사용자에 의해 삭제된경우
                        throw new ExceptionManager(string.Format(string.Format("키값 : {0}은 수정되지 않았습니다.<br>이미 삭제된것으로 보입니다.", deleteRow.Values["MSG_CD"])));
                    }
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

        protected void eniGridData_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            DbQuery();

            eniGridData.DataSource = lgWorkDataSet.Tables["S_MESSAGE"];
            eniGridData.DataBind();
        }

        protected void eniGridData_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e) {
            //e.NewValues["ROW_NUM"] = "신규";
            //e.NewValues["MINOR_TYPE"] = "U";
            //e.NewValues["USE_YN"] = "Y";
        }

        protected void eniGridData_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
            //switch (e.Column.Name) {
            //    case "MAJOR_CD":
            //        var colMAJOR_CD = (ASPxComboBox)e.Editor;
            //        colMAJOR_CD.DataBind();
            //        break;
            //    default: break;
            //}
        }

         protected void eniGridData_BatchUpdate(object sender, ASPxDataBatchUpdateEventArgs e) {
            using (var conection = lgDbAccess.Connection) {
                conection.Open();
                var connectionTran = conection.BeginTransaction();

                try {
                    if (e.InsertValues.Count > 0) {
                        DbInsertData(connectionTran, e.InsertValues);
                    }
                    if (e.UpdateValues.Count > 0) {
                        DbUpdateData(connectionTran, e.UpdateValues);
                    }
                    if (e.DeleteValues.Count > 0) {
                        DbDeleteData(connectionTran, e.DeleteValues);
                    }

                    connectionTran.Commit();
                    conection.Close();
                    e.Handled = true;
                } catch (ExceptionManager ex) {
                    connectionTran.Rollback();
                    conection.Close();
                    e.Handled = false;
                    lgException = ex;
                } catch (System.Exception ex) {
                    connectionTran.Rollback();
                    conection.Close();
                    e.Handled = false;
                    lgException = new ExceptionManager(ex);
                }

                try {
                    DbQuery();
                    eniGridData.DataSource = lgWorkDataSet.Tables["S_MESSAGE"];
                } catch (ExceptionManager ex) {
                    lgException = ex;
                } catch (System.Exception ex) {
                    lgException = new ExceptionManager(ex);
                }
            }
        }

         protected void eniGridData_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e) {
             switch (e.ErrorTextKind) {
                 case GridErrorTextKind.General:
                     if (lgException != null) {
                         e.ErrorText = lgException.Message;
                     }
                     break;
                 default: break;
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