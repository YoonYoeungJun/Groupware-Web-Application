
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections.Specialized;

using DevExpress.Web;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.DataAccess;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Variables.Menu;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Views.ucHomeView;

#endregion

namespace eniFramework.WebApp.Views {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class HomeView_back : BaseUIACTPage {
        #region ★ 0. Codiing Infomation 
        /// <NameSpace>①eniFramework.WebApp.Groupware</NameSpace>
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

        public override string BodyClassName { get { return "eniThem_layout_02"; } }
        public override string PageID { get { return "home_view"; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json | JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_History |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie | JScriptKind.Framework | JScriptKind.Framework_ControlBase |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Message | JScriptKind.Framework_Loading |
                        JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax | JScriptKind.Framework_DbAccess;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public HomeView_back()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
        }

        protected override void OnWebUIPageLoadComplete() {

            //System.Threading.Thread.Sleep(500);
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
            DbQuery();

            DockLoadUser();
            DockLoadMail();
            DockLoadBoard("BBS_ALL");
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            //var cboMailFolder = dpMail.FindControl("eniCboMailFolderSelector") as eniComboBox;
            //if (cboMailFolder != null) {
            //    cboMailFolder.DataSource = lgWorkDataSet.Tables["IMAPFOLDERS"];
            //    cboMailFolder.DataBind();
            //}

            //var cboBoard = dpBoard.FindControl("cboBoardSelector") as eniComboBox;
            //if (cboBoard != null) {
            //    cboBoard.DataSource = lgWorkDataSet.Tables["BOARD_CATEGORY_LIST"];
            //    cboBoard.DataBind();
            //}
        }

        #endregion

        #region ■ 2.7 Initializatize variables

        protected override void OnInitVariables() {

        }

        #endregion

        #region ■ 2.8 Set local global default variables


        protected override void SetDefulatValues() {

        }

        #endregion

        #region ■ 2.9 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery

        protected void DbQuery() {
            
        }

        #endregion

        #endregion


        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group


        //protected void ucStatus_WindowCallback(object source, PopupWindowCallbackArgs e) {

        //}


        //protected void ucMail_WindowCallback(object source, PopupWindowCallbackArgs e) {
        //    if (string.IsNullOrWhiteSpace(e.Parameter)) return;

        //    DockLoadMail();
        //}

        //protected void ucBoard_WindowCallback(object source, PopupWindowCallbackArgs e) {
        //    if (string.IsNullOrWhiteSpace(e.Parameter)) return;

        //    DockLoadBoard(e.Parameter);
        //}

        //protected void ucSchedule_WindowCallback(object source, PopupWindowCallbackArgs e) {

        //}

        //protected void ucTime_WindowCallback(object source, PopupWindowCallbackArgs e) {

        //}

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group

        #endregion

        #region ■■ 5.2.2 User-defined function group

        private void DockLoadUser() {
            this.ucStatus.SetUser(lgACT);
        }

        private void DockLoadMail() {
            var ucMailCtrl = this.dpMail.FindControl("ucMail") as ucMail;
            ucMailCtrl.DataSource = lgACT.MailServerProvider.GetUserMessages();
        }

        private void DockLoadBoard(string sParam){
            var ucBoardCtrl = this.dpBoard.FindControl("ucBoard") as ucBoard;
            if (ucBoardCtrl != null) {
                lgStrSql.Clear();
                lgStrSql.AppendLine(" SELECT TOP(20)	A.NO,  ");
                lgStrSql.AppendLine(" 		A.CATEGORY_CD,  ");
                lgStrSql.AppendLine(" 		A.CATEGORY_NM,  ");
                lgStrSql.AppendLine(" 		A.CATEGORY_GROUP_CD,  ");
                lgStrSql.AppendLine(" 		A.CATEGORY_GROUP_NM,  ");
                lgStrSql.AppendLine(" 		A.PARENT_NO,  ");
                lgStrSql.AppendLine(" 		A.PREFACE_CD,  ");
                lgStrSql.AppendLine(" 		A.PREFACE_NM,  ");
                lgStrSql.AppendLine(" 		A.NOTICE_YN,  ");
                lgStrSql.AppendLine(" 		A.NOTICE_TO,  ");
                lgStrSql.AppendLine(" 		A.SECRET_YN,  ");
                lgStrSql.AppendLine(" 		A.SECRET_KEY, ");
                lgStrSql.AppendLine(" 		A.SUBJECT,  ");
                lgStrSql.AppendLine(" 		A.SUBJECT_COLOR,  ");
                lgStrSql.AppendLine(" 		A.SUBJECT_BOLD_YN,  ");
                lgStrSql.AppendLine(" 		A.FILE_CNT,  ");
                lgStrSql.AppendLine(" 		A.CMT_CNT,  ");
                lgStrSql.AppendLine(" 		A.CONTENT,  ");
                lgStrSql.AppendLine(" 		A.CONTENT_PLAIN,  ");
                lgStrSql.AppendLine(" 		A.OPTIONS_FLAG,  ");
                lgStrSql.AppendLine(" 		A.DATE,  ");
                lgStrSql.AppendLine(" 		A.EDIT,  ");
                lgStrSql.AppendLine(" 		A.VISIT,  ");
                lgStrSql.AppendLine(" 		A.RECOMMEND, ");
                lgStrSql.AppendLine(" 		A.TAG,  ");
                lgStrSql.AppendLine(" 		A.DELETED_YN,  ");
                lgStrSql.AppendLine(" 		A.BIZ_AREA_CD,  ");
                lgStrSql.AppendLine(" 		A.BIZ_AREA_NM, ");
                lgStrSql.AppendLine(" 		A.PLANT_CD,  ");
                lgStrSql.AppendLine(" 		A.PLANT_NM,  ");
                lgStrSql.AppendLine(" 		A.DEPT_CD,  ");
                lgStrSql.AppendLine(" 		A.DEPT_NM,  ");
                lgStrSql.AppendLine(" 		A.ROLE_PSTN_CD,  ");
                lgStrSql.AppendLine(" 		A.ROLE_PSTN_NM,  ");
                lgStrSql.AppendLine(" 		A.USER_ID,  ");
                lgStrSql.AppendLine(" 		A.USER_NAME,  ");
                lgStrSql.AppendLine(" 		A.SORT_BY  ");
                lgStrSql.AppendLine(string.Format(" FROM UFN_TB_BBS('ALL', 'BBS_ALL', {0}) A ", Data.FilterVariable(lgACT.UserId)));
                lgStrSql.AppendLine(" WHERE A.PARENT_NO IS NULL ");
                lgStrSql.AppendLine(" ORDER BY SORT_BY ASC, NO DESC  ");

                var dsBoardList = lgDbAccess.ExecuteDataSet(lgStrSql.ToString());

                ucBoardCtrl.DataSource = dsBoardList.Tables[0];
            }
        }

        #endregion

        #endregion

        #endregion
    }
}