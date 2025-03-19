
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Reflection;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web.Security;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.String;
using eniFramework.Security;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// Default
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [ReiterationPage]
    public partial class RedirectSplash : BaseUIACTPage {
        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp</NameSpace>
        /// <Module>②WebSiteNET</Module>
        /// <Class>③Default</Class>
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

        public override string PageID { get { return "redirectsplash"; } }
        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json |
                        JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Extends |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie | JScriptKind.Framework |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Message | JScriptKind.Framework_Ajax;
            }
        }
        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public RedirectSplash() {
            
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {

        }

        protected override void OnWebUIPageLoadComplete() {
            
        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {

        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
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

        #region ■ 2.8 Set local global default variables


        protected override void SetDefulatValues() {
        }

        #endregion

        

        #region ■ 2.9 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        protected void btnLogin_Click(object sender, EventArgs e) {
           
        }

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group

        #endregion

        #region ■■ 5.2.2 User-defined function group


        #endregion

        #endregion

        #endregion
    }
}