
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
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections.Specialized;

using DevExpress.Web;
using DevExpress.Data.Linq;

// eniFramework Reperence part
using eniFramework.CSV;
using eniFramework.Json;
using eniFramework.String;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.Exception;
using eniFramework.Date;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Modules.Contact {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("sfid={sfid}, sfnm={sfnm}, SelectFolderKorName={selectFolderKorName}")]
    [AllowAnonymous, ReiterationPage]
    public partial class List : BaseUIACTPage {
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


        public override string BodyClassName { get { return "eniThm_layout_02"; } }
        public override string PageID { get { return "contact_list"; } }
        public override bool RegisteredServerControls { get { return true; } }
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

        public List()
            : base() {
        }

        protected override void OnInitWebUIPage() {
            
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

            gdvContactsList.DataSource = lgWorkDataSet.Tables["UFN_TB_GET_CONTACTS"];
            gdvContactsList.DataBind();

            HiddenFields.Add("Contacts", "MyContacts");
            HiddenFields.Add("ContactsGroup", "AllContacts");
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            if (gdvContactsList.IsCallback) {
                switch (tabContactsIndex.ActiveTabIndex) {
                    case 0:
                        break;
                    case 1:
                        gdvContactsList.DataSource = GetContacts();
                        gdvContactsList.DataBind();
                        break;
                    case 16: //영문
                        switch ((string)HiddenFields["ContactsGroup"]) {
                            case "AllContacts":
                                var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                   where (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsA.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "GroupwareContacts":
                                var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsG.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "MyContactsGroup":
                                var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsM.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            default:
                                var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                   contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsD.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                        }
                        break;
                    case 17: //숫자
                        switch ((string)HiddenFields["ContactsGroup"]) {
                            case "AllContacts":
                                var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                   where (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsA.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "GroupwareContacts":
                                var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsG.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "MyContactsGroup":
                                var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsM.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            default:
                                var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                   contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsD.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                        }
                        break;
                    case 18: //특수문자
                        switch ((string)HiddenFields["ContactsGroup"]) {
                            case "AllContacts":
                                var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                   where ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                   (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsA.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "GroupwareContacts":
                                var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                   (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsG.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "MyContactsGroup":
                                var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                   (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsM.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            default:
                                var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                   contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                   ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                   (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                   (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsD.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                        }
                        break;
                    default: //한글
                        var chrIdx = tabContactsIndex.Tabs[tabContactsIndex.ActiveTabIndex].Text.ToCharArray(0, 1)[0];

                        switch ((string)HiddenFields["ContactsGroup"]) {
                            case "AllContacts":
                                var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                   where new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsA.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "GroupwareContacts":
                                var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsG.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            case "MyContactsGroup":
                                var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsM.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                            default:
                                var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                   where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                   contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                   new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                   select contactRow);

                                gdvContactsList.DataSource = enContactsD.AsDataView();
                                gdvContactsList.DataBind();
                                break;
                        }
                        break;
                }

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

        protected void DbQuery() {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT CON_NO, ");
            lgStrSql.AppendLine("     CON_NM, ");
            lgStrSql.AppendLine("     CON_GR_NO, ");
            lgStrSql.AppendLine("     CON_GR_NM, ");
            lgStrSql.AppendLine("     CON_FLAG, ");
            lgStrSql.AppendLine("     CON_EM, ");
            lgStrSql.AppendLine("     CON_PN, ");
            lgStrSql.AppendLine("     CON_ORG_BIZ_NM, ");
            lgStrSql.AppendLine("     CON_ORG_DEPT_NM, ");
            lgStrSql.AppendLine("     CON_ORG_PSTN_NM, ");
            lgStrSql.AppendLine("     CONTACT_TYPE, ");
            lgStrSql.AppendLine("     CONTACT_TYPE_NM ");
            lgStrSql.AppendLine(string.Format(" FROM UFN_TB_CONTACT({0}) ", Data.FilterVariable(lgACT.UserId)));
            lgStrSql.AppendLine(" ORDER BY CONTACT_TYPE, CON_ORG_BIZ_NO, CON_ORG_BIZ_NM, CON_ORG_PLANT_NO, CON_ORG_PLANT_NM, CON_ORG_DEPT_NO, CON_ORG_DEPT_NM, CON_NM, CON_ORG_PSTN_NO, CON_ORG_PSTN_NM ");

            Data.MergeDataSet(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "UFN_TB_GET_CONTACTS"), true);
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

        protected void gdvContactsList_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            var callbackArgs = JsonConvert.DeserializeObject<BaseCallbackArgs>(e.Parameters);
            
            try {
                switch (callbackArgs.Cmd) {
                    case "MyContacts":
                    case "PublicContacts":
                        gdvContactsList.DataSource = GetContacts();
                        gdvContactsList.DataBind();
                        //switch (callbackArgs.CmdDetail) {
                        //    case "AllContacts":
                        //        gdvContactsList.DataSource = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                        //        gdvContactsList.DataBind();
                        //        break;
                        //    case "GroupwareContacts":
                        //        var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                        //        var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                        //                           where contactRow.Field<string>("CONTACT_TYPE") == "A"
                        //                           select contactRow);
                        //        gdvContactsList.DataSource = enContactsG.AsDataView();
                        //        gdvContactsList.DataBind();
                        //        break;
                        //    case "MyContactsGroup":
                        //        var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                        //        var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                        //                           where contactRow.Field<string>("CONTACT_TYPE") == "B"
                        //                           select contactRow);
                        //        gdvContactsList.DataSource = enContactsM.AsDataView();
                        //        gdvContactsList.DataBind();
                        //        break;
                        //    default:
                        //        var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                        //        var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                        //                           where contactRow.Field<string>("CON_GR_NO") == callbackArgs.CmdDetail
                        //                           select contactRow);
                        //        gdvContactsList.DataSource = enContactsD.AsDataView();
                        //        gdvContactsList.DataBind();
                        //        break;
                        //}
                        break;
                    case "IndexChange":
                        switch (tabContactsIndex.ActiveTabIndex) {
                            case 0:
                                break;
                            case 1:
                                gdvContactsList.DataSource = GetContacts();
                                gdvContactsList.DataBind();
                                break;
                            case 16: //영문
                                switch ((string)HiddenFields["ContactsGroup"]) {
                                    case "AllContacts":
                                        var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                           where (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsA.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "GroupwareContacts":
                                        var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsG.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "MyContactsGroup":
                                        var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsM.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    default:
                                        var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                           contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsD.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                }
                                break;
                            case 17: //숫자
                                switch ((string)HiddenFields["ContactsGroup"]) {
                                    case "AllContacts":
                                        var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                           where (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsA.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "GroupwareContacts":
                                        var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsG.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "MyContactsGroup":
                                        var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsM.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    default:
                                        var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                           contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9'
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsD.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                }
                                break;
                            case 18: //특수문자
                                switch ((string)HiddenFields["ContactsGroup"]) {
                                    case "AllContacts":
                                        var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                           where ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                           (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsA.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "GroupwareContacts":
                                        var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                           (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsG.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "MyContactsGroup":
                                        var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                           (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsM.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    default:
                                        var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                           contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= 'A' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= 'z') == false &&
                                                           ((char)contactRow.Field<string>("CON_NM")[0] >= '0' &&
                                                           (char)contactRow.Field<string>("CON_NM")[0] <= '9') == false &&
                                                           (new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound >= 'ㄱ' &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound <= 'ㅎ') == false
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsD.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                }
                                break;
                            default: //한글
                                var chrIdx = tabContactsIndex.Tabs[tabContactsIndex.ActiveTabIndex].Text.ToCharArray(0, 1)[0];

                                switch ((string)HiddenFields["ContactsGroup"]) {
                                    case "AllContacts":
                                        var tbContactsA = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsA = (from contactRow in tbContactsA.AsEnumerable()
                                                           where new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsA.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "GroupwareContacts":
                                        var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "A" &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsG.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    case "MyContactsGroup":
                                        var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == "B" &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsM.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                    default:
                                        var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                                        var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                                           where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                                           contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"] &&
                                                           new HangulManager((char)contactRow.Field<string>("CON_NM")[0]).InitialSound == chrIdx
                                                           select contactRow);

                                        gdvContactsList.DataSource = enContactsD.AsDataView();
                                        gdvContactsList.DataBind();
                                        break;
                                }
                                break;
                        }
                        break;
                }
            } catch (ExceptionManager ex) {
                throw ex;
            } catch (System.Exception ex) {
                throw new ExceptionManager(ex);
            }
        }

        private DataView GetContacts() {
            switch ((string)HiddenFields["ContactsGroup"]) {
                case "AllContacts":
                    return GetWorkDataSetTable("UFN_TB_GET_CONTACTS").AsDataView();
                case "GroupwareContacts":
                    var tbContactsG = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                    var enContactsG = (from contactRow in tbContactsG.AsEnumerable()
                                       where contactRow.Field<string>("CONTACT_TYPE") == "A"
                                       select contactRow);
                    return enContactsG.AsDataView();
                case "MyContactsGroup":
                    var tbContactsM = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                    var enContactsM = (from contactRow in tbContactsM.AsEnumerable()
                                       where contactRow.Field<string>("CONTACT_TYPE") == "B"
                                       select contactRow);
                    return enContactsM.AsDataView();
                default:
                    var tbContactsD = GetWorkDataSetTable("UFN_TB_GET_CONTACTS");
                    var enContactsD = (from contactRow in tbContactsD.AsEnumerable()
                                       where contactRow.Field<string>("CONTACT_TYPE") == ((string)HiddenFields["Contacts"] == "MyContacts" ? "B" : "C") &&
                                       contactRow.Field<string>("CON_GR_NO") == (string)HiddenFields["ContactsGroup"]
                                       select contactRow);
                    return enContactsD.AsDataView();
            }
        }

        //초중종 분리
        private void Make(string origString) {
            if (string.IsNullOrEmpty(origString))
                return;
            char origChar = origString.ToCharArray(0, 1)[0];
            int unicode = Convert.ToInt32(origChar);


            uint jongCode = 0;
            uint jungCode = 0;
            uint choCode = 0;

            if (unicode < 44032 || unicode > 55203){
                var b = string.Format("{0}의 초성 : {1}, 중성 : {2}, 종성 : {3}", origString, origString, "", "");
            }

            else {
                uint uCode = Convert.ToUInt32(origChar - '\xAC00');

                jongCode = uCode % 28;

                jungCode = ((uCode - jongCode) / 28) % 21;

                choCode = ((uCode - jongCode) / 28) / 21;

                char[] choChar = new char[] { 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };

                char[] jungChar = new char[] { 'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ' };

                char[] jongChar = new char[] { ' ', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };

                var a = string.Format("{0}의 초성 : {1}, 중성 : {2}, 종성 : {3}", origString, choChar[choCode].ToString(), jungChar[jungCode].ToString(), jongChar[jongCode].ToString());

            }

        }
    
        #endregion

        #region ■■ 5.2.2 User-defined function group

        #endregion

        #endregion

        #endregion
    }
}