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

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.Annotations;
#endregion

namespace eniFramework.WebApp {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous]
    public partial class Index : BaseUIACTPage {
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
        
        public override string PageID { get { return "index"; } }
        public override string BodyClassName { get { return "eniThm_layout_03"; } }

        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json | JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Enum | JScriptKind.Framework_Variables | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie |
                        JScriptKind.Framework | JScriptKind.Framework_UserAgent | JScriptKind.Framework_DbAccess | JScriptKind.Framework_Message | JScriptKind.Framework_Ajax | JScriptKind.Framework_Loading;
            }
        }
        public override JScriptExt RegisteredScriptExt {
            get {
                return JScriptExt.Ext3;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public Index() : base() { }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {

            if (lgACT.AdminYn == UseYN.Y) {
                mnToolbar.Items.FindByName("btnAdmin").Visible = true;
            }

            //if (lgACT.UserId == "dic_nutri") {
            //    mnToolbar.Items.FindByName("btnWebHard").Visible = false;
            //}
        }

        protected override void OnWebUIPageLoadComplete() {
        }
        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {
            if (pQueryString.AllKeys.Length > 0) {
                ifrmMain.Attributes["src"] += "?" + pQueryString.ToString();
                //IndexLayout.GetPaneByName("IdxContent").ContentUrl += "?" + pQueryString.ToString();
            }
            
        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            mnToolbar.Items[0].ToolTip = mnToolbar.Items[0].Image.ToolTip = GetResource("CSTRESX00002");
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            string arguments = Request["__EVENTARGUMENT"];
            var command = arguments.Split('=');
            if (command[0] == "cmd" && command[1] == "LogOut") {
                lgACT.LogoutProcess(this);

                //Response.Redirect("/");
            }
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

        protected void DbQuery(string pSearchText, string pSearchType) {
            
        }

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group

        protected class CallbackArgs {
            public DBAccessMode DbAccessMode { get; set; }
            public string SearchText { get; set; }
            public string SearchType { get; set; }
        }

        protected void dvWebSiteList_CustomCallback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            var callbackArgs = JsonConvert.DeserializeObject<CallbackArgs>(e.Parameter);
            switch (callbackArgs.DbAccessMode) {
                case DBAccessMode.None:
                    break;
                case DBAccessMode.Query:
                    break;
                case DBAccessMode.Create:
                    break;
                case DBAccessMode.Update:
                    break;
                case DBAccessMode.Delete:
                    break;
                default:
                    break;
            }
        }

        #endregion

        #region ■■ 5.2.2 User-defined function group


        #endregion

        #endregion

        #endregion
    }
}