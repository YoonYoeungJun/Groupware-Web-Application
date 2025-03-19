
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
using System.Web.UI.WebControls;
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
using eniFramework.Date;
using eniFramework.WebApp.Controls;
using eniFramework.Exception;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Modules {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class ContactView : BaseUIACTPage {
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

        protected override bool UsedSessionDataSet {
            get {
                return true;
            }
        }

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "contactview"; } }
        public override bool RegisteredHiddenField { get { return true; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json |
                        JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_BlockUI | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Extends | JScriptKind.Framework_Resources |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework | JScriptKind.Framework_ControlBase |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Report |
                        JScriptKind.Framework_Message | JScriptKind.Framework_Loading | JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax |
                        JScriptKind.Framework_DbAccess | JScriptKind.Framework_Date | JScriptKind.Framework_Security | JScriptKind.Framework_Utils;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public ContactView()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

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
            DbQuery();

            LoadContactsList();

            var allIContactsItem = nbContactList.Items.FindByName("AllContacts");
            allIContactsItem.Selected = true;
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

        protected void DbQuery() {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT CON_GR_NO, ");
            lgStrSql.AppendLine("     PAR_CON_GR_NO, ");
            lgStrSql.AppendLine("     CON_GR_NM, ");
            lgStrSql.AppendLine("     SEQ, ");
            lgStrSql.AppendLine("     LVL, ");
            lgStrSql.AppendLine("     CNT, ");
            lgStrSql.AppendLine("     CONTACT_TYPE, ");
            lgStrSql.AppendLine("     CONTACT_TYPE_NM ");
            lgStrSql.AppendLine(string.Format(" FROM UFN_TB_CONTACT_GROUP({0}) ", Data.FilterVariable(lgACT.UserId)));
            lgStrSql.AppendLine(" WHERE CONTACT_TYPE IN('B', 'C') ");
            lgStrSql.AppendLine(" AND LVL = 2 ");
            lgStrSql.AppendLine(" ORDER BY CONTACT_TYPE, SEQ, LVL, CON_GR_NO, PAR_CON_GR_NO ASC ");

            Data.MergeDataSet(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "UFN_TB_CONTACT_GROUP"), true);
        }

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        protected void tvContactList_PreRender(object sender, EventArgs e) {

        }

        #endregion

        #region ■■ 5.2.2 User-defined function group

        protected void LoadContactsList() {
            var tbGroup = GetWorkDataSetTable("UFN_TB_CONTACT_GROUP");

            foreach (DataRow row in tbGroup.Rows) {
                if (row["CONTACT_TYPE"].ToString() == "B") {
                    CreateNavItem("MyContactsGroup", (string)row["CON_GR_NO"], (string)row["CON_GR_NM"], true);
                } else {
                    CreateGroupItem("PublicContacts", (string)row["CON_GR_NO"], (string)row["CON_GR_NM"]);
                }
            }
        }

        private void CreateNavItem(string sNavGroup, string sName, string sText, bool bLeftBlank) {
            var contactGroup = nbContactList.Items.FindByName(sNavGroup);
            if (contactGroup == null) {
                return;
            }

            var navItem = contactGroup.Group.Items.Add(sText, sName);
            navItem.Image.Width = Unit.Pixel(16);
            navItem.Image.Height = Unit.Pixel(16);
            if (bLeftBlank) {
                navItem.Image.SpriteProperties.CssClass = "Margin20L";
            }
            navItem.Image.SpriteProperties.Top = Unit.Pixel(52);
            navItem.Image.SpriteProperties.Left = Unit.Pixel(102);
            navItem.Image.SpriteProperties.SelectedTop = Unit.Pixel(52);
            navItem.Image.SpriteProperties.SelectedLeft = Unit.Pixel(102);
            navItem.Image.SpriteProperties.SelectedCssClass = "itemSelected";
        }

        private void CreateGroupItem(string sNavGroup, string sName, string sText) {
            var contactGroup = nbContactList.Groups.FindByName(sNavGroup);
            if (contactGroup == null) {
                return;
            }

            var navItem = contactGroup.Items.Add(sText, sName);
            navItem.Image.Width = Unit.Pixel(16);
            navItem.Image.Height = Unit.Pixel(16);
            navItem.Image.SpriteProperties.Top = Unit.Pixel(52);
            navItem.Image.SpriteProperties.Left = Unit.Pixel(102);
            navItem.Image.SpriteProperties.SelectedTop = Unit.Pixel(52);
            navItem.Image.SpriteProperties.SelectedLeft = Unit.Pixel(102);
            navItem.Image.SpriteProperties.SelectedCssClass = "itemSelected";
        }

         protected TreeViewNode[] MakeBoardMenus(AccountMNUs pRootMenu) {
            var nodes = new List<TreeViewNode>();

            foreach (AccountMNU menu in pRootMenu) {
                var trViewNode = new TreeViewNode(menu.MenuName, string.Format("{0}|{1}", menu.ReqRtUrl, menu.MenuId), "~/Contents/Images/Board/ICO-Menu-List.gif") {
                    ToolTip = menu.MenuDescription,
                    DataItem = menu.ReqRtUrl
                };

                var subMenus = lgACT.GetSubMenus(menu.MenuId, menu.MenuLvl + 1);

                if (subMenus.Count > 0) {
                    var rangeSubMenus = MakeBoardMenus(subMenus);
                    
                    trViewNode.Nodes.AddRange(rangeSubMenus);
                    trViewNode.Image.Url = "~/Contents/Images/Board/ICO-Menu-Forder.gif";
                }

                nodes.Add(trViewNode);
            }

            return nodes.ToArray();
        }

        #endregion

         protected void eniCbPanNavBoardMenu_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {

         }

        #endregion

 

        #endregion
    }
}