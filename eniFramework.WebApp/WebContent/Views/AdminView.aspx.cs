
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
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Variables.Menu;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;

#endregion

namespace eniFramework.WebApp.Modules {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class AdminView : BaseUIACTPage {
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

        protected override bool UsedSessionDataSet {
            get {
                return true;
            }
        }
        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "adminview"; } }

        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json | JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie |JScriptKind.jQuery_History |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework_Cookie | JScriptKind.Framework | JScriptKind.Framework_ControlBase | 
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Message | JScriptKind.Framework_Loading | 
                        JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax | JScriptKind.Framework_DbAccess;
            }
        }
        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public AdminView() : base() { }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
            tvModuleMenu.Nodes.AddRange(MakeAdminMenus(lgACT.GetGroupMenus("Admin")));
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
            mnToolbar.Items[0].ToolTip = mnToolbar.Items[0].Image.ToolTip = GetResource("CSTRESX00001");
            mnToolbar.Items[1].ToolTip = mnToolbar.Items[1].Image.ToolTip = GetResource("CSTRESX00002");
            mnToolbar.Items[2].ToolTip = mnToolbar.Items[2].Image.ToolTip = GetResource("CSTRESX00003");
            mnToolbar.Items[3].ToolTip = mnToolbar.Items[3].Image.ToolTip = GetResource("CSTRESX00004");
            mnToolbar.Items[4].ToolTip = mnToolbar.Items[4].Image.ToolTip = GetResource("CSTRESX00005");
            mnToolbar.Items[5].ToolTip = mnToolbar.Items[5].Image.ToolTip = GetResource("CSTRESX00006");
            mnToolbar.Items[6].ToolTip = mnToolbar.Items[6].Image.ToolTip = GetResource("CSTRESX00007");
            mnToolbar.Items[7].ToolTip = mnToolbar.Items[7].Image.ToolTip = GetResource("CSTRESX00008");
            mnToolbar.Items[8].ToolTip = mnToolbar.Items[8].Image.ToolTip = GetResource("CSTRESX00009");
            mnToolbar.Items[9].ToolTip = mnToolbar.Items[9].Image.ToolTip = GetResource("CSTRESX00010");
            mnToolbar.Items[10].ToolTip = mnToolbar.Items[10].Image.ToolTip = GetResource("CSTRESX00011");
            mnToolbar.Items[11].ToolTip = mnToolbar.Items[11].Image.ToolTip = GetResource("CSTRESX00012");
            mnToolbar.Items[12].ToolTip = mnToolbar.Items[12].Image.ToolTip = GetResource("CSTRESX00013");
            mnToolbar.Items[13].ToolTip = mnToolbar.Items[13].Image.ToolTip = GetResource("CSTRESX00014");
            mnToolbar.Items[14].ToolTip = mnToolbar.Items[14].Image.ToolTip = GetResource("CSTRESX00015");
            mnToolbar.Items[15].ToolTip = mnToolbar.Items[15].Image.ToolTip = GetResource("CSTRESX00016");
            mnToolbar.Items[16].ToolTip = mnToolbar.Items[16].Image.ToolTip = GetResource("CSTRESX00017");
            mnToolbar.Items[17].ToolTip = mnToolbar.Items[17].Image.ToolTip = GetResource("CSTRESX00018");
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

        protected void DbQuery(string pSearchText, string pSearchType) {
            
        }

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        protected void tvModuleMenu_ExpandedChanged(object source, TreeViewNodeEventArgs e) {
            if (e.Node.Expanded) {
                e.Node.Image.Url = "../../contents/images/ico-pgm_open.gif";
            } else {
                e.Node.Image.Url = "../../contents/images/ico-folder.gif";
            }
        }

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group


        #endregion

        #region ■■ 5.2.2 User-defined function group


        protected TreeViewNode[] MakeAdminMenus(AccountMNUs pRootMenu) {
            var nodes = new List<TreeViewNode>();

            foreach (AccountMNU menu in pRootMenu) {
                var trViewNode = new TreeViewNode(menu.MenuName, string.Format("{0}|{1}|{2}", menu.MenuId, menu.ReqRtUrl, menu.ParentMenuId), string.Empty) {
                    ToolTip = menu.MenuDescription,
                    DataItem = menu.ReqRtUrl
                };


                var subMenus = lgACT.GetSubMenus(menu.MenuId, menu.MenuLvl + 1);

                if (menu.MenuType == "M") {
                    trViewNode.Image.Url = "../../contents/images/ico-folder.gif";
                    trViewNode.Image.UrlSelected = "../../contents/images/ico-folder_selected.gif";
                } else {
                    trViewNode.Image.Url = "../../contents/images/ico-pgm.gif";
                    trViewNode.Image.UrlSelected = "../../contents/images/ico-pgm_open.gif";
                }

                if (subMenus.Count > 0) {
                    var rangeSubMenus = MakeAdminMenus(subMenus);

                    trViewNode.Nodes.AddRange(rangeSubMenus);
                }

                nodes.Add(trViewNode);
            }

            return nodes.ToArray();
        }

        #endregion

        #endregion

        #endregion
    }
}