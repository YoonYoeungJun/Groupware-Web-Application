
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
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
using System.Text.RegularExpressions;

using hMailServer;
using DevExpress.Web;
using DevExpress.Utils;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Json.Linq;
using eniFramework.Exception;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common;
using eniFramework.SharpZipLib.Zip;
using eniFramework.DataAccess;
using eniFramework.DataAccess.Linq;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.Annotations;
using hMailServerService;

using hMailServerService.SocketLayer;

using tdsV_MAIL_IMAPFOLDERS = hMailServerService.tdsData.V_MAIL_IMAPFOLDERS_DETAILDataTable;
using tdsV_MAIL_IMAPFOLDER = hMailServerService.tdsData.V_MAIL_IMAPFOLDERS_DETAILRow;

using StringFormatSize = hMailServerService.SocketLayer.StringFormat;

#endregion

namespace eniFramework.WebApp.Modules {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class MailView : BaseUIACTPage {
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

        public int sfid = -1;
        public string sfnm = string.Empty;
        public hMailServerService.IMAPFolders simfp = hMailServerService.IMAPFolders.None;
        protected long messageID = -1;
        string str_mv = string.Empty;
        string str_prov_mv = string.Empty;

        tdsV_MAIL_IMAPFOLDERS _IMAPFolders = null;

        #endregion

        #region ■ 1.4 Class Global properties

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "MailView"; } }
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

        public MailView()
            : base() {
            
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
            if (this.gdvList.IsCallback) {
                switch (str_mv) {
                    case "list":
                        EntityServerModeDataSource.ContextTypeName = "eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntities";
                        EntityServerModeDataSource.TableName = "V_MAIL_MESSAGES";

                        gdvList.KeyFieldName = "MESSAGEFOLDERID;MESSAGEID;MESSAGEFLAGS";
                        gdvList.Columns["MESSAGEFLAGEDCLASS"].Visible = true;
                        gdvList.Columns["MESSAGEFLAGCLASS"].Visible = true;
                        gdvList.Columns["MESSAGESIZE"].Visible = true;
                        gdvList.Columns["SENDSTATUSNAME"].Visible = false;
                        gdvList.Columns["RECIPIENTDATE"].Visible = false;

                        if (simfp == hMailServerService.IMAPFolders.InboxMe) {
                            gdvList.Columns["MESSAGEFROMADDRESS"].Visible = false;
                            gdvList.Columns["MESSAGETOADDRESS"].Visible = false;
                        } else if (simfp == hMailServerService.IMAPFolders.SentBox || simfp == hMailServerService.IMAPFolders.TempBox) {
                            gdvList.Columns["MESSAGEFROMADDRESS"].Visible = false;
                            gdvList.Columns["MESSAGETOADDRESS"].Visible = true;
                        } else {
                            gdvList.Columns["MESSAGEFROMADDRESS"].Visible = true;
                            gdvList.Columns["MESSAGETOADDRESS"].Visible = false;
                        }
                        break;
                    case "receive_check":
                        EntityServerModeDataSource.ContextTypeName = "eniFramework.WebApp.Modules.Mail.efV_MAIL_RECIPIENTS_CHECKEntities";
                        EntityServerModeDataSource.TableName = "V_MAIL_RECIPIENTS_CHECK";

                        gdvList.KeyFieldName = "MESSAGEID;RECIPIENTID";
                        gdvList.Columns["MESSAGEFLAGEDCLASS"].Visible = false;
                        gdvList.Columns["MESSAGEFLAGCLASS"].Visible = false;
                        gdvList.Columns["MESSAGEFROMADDRESS"].Visible = false;
                        gdvList.Columns["MESSAGETOADDRESS"].Visible = true;
                        gdvList.Columns["MESSAGESIZE"].Visible = false;
                        gdvList.Columns["SENDSTATUSNAME"].Visible = true;
                        gdvList.Columns["RECIPIENTDATE"].Visible = true;
                        break;
                }
            }
        }

        protected override void OnWebUIPageLoadComplete() {
        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRoutingParams(RouteData pRoute) {
            
        }

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {
            int reqFolderID = 0;
            long reqMessageID = 0;
            
            if (int.TryParse(pQueryString["sfid"], out reqFolderID)) {
                this.sfid = reqFolderID;
                this.sfnm = Server.UrlDecode(pQueryString["sfnm"]);

                if (string.IsNullOrWhiteSpace(this.sfnm)) {
                    this.sfnm = this.lgACT.MailServerProvider.GetIMAPFolderNameByIMAPFolderID(this.sfid);
                }
            } else {
                this.sfnm = Server.UrlDecode(pQueryString["sfnm"]);
                if (!string.IsNullOrWhiteSpace(this.sfnm)) {
                    this.sfid = this.lgACT.MailServerProvider.GetIMAPFolderIDByIMAPFolderName(this.sfnm);
                }
            }

            if (this.sfid == -1 && string.IsNullOrWhiteSpace(this.sfnm)) {
                if (this.HiddenFields.Count != 0 && this.HiddenFields.Contains("sfid") && HiddenFields.Contains("sfnm")) {
                    this.sfid = int.Parse(this.HiddenFields["sfid"].ToString());
                    this.sfnm = this.HiddenFields["sfnm"].ToString();
                }
            }

            if (long.TryParse(pQueryString["mid"], out reqMessageID)) {
                this.messageID = reqMessageID;
            }

            this.str_mv = (this.HiddenFields.Contains("mv") ? this.HiddenFields["mv"].ToString().ToLower() : pQueryString["mv"].ToString()).ToLower();
            this.str_prov_mv = this.HiddenFields.Contains("prov_mv") ? this.HiddenFields["prov_mv"].ToString().ToLower() : string.Empty;
        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            if (!IsCallback && !IsPostBack && lgLang != "KO") {
                mnToolbar.Items[0].Text = GetResource("CSTRESX00011");
                mnToolbar.Items[0].ToolTip = GetResource("CSTRESX00012");
                mnToolbar.Items[1].Text = GetResource("CSTRESX00013");
                mnToolbar.Items[1].ToolTip = GetResource("CSTRESX00014");
                mnToolbar.Items[2].Text = GetResource("CSTRESX00015");
                mnToolbar.Items[2].ToolTip = GetResource("CSTRESX00016");
                mnToolbar.Items[3].Text = GetResource("CSTRESX00017");
                mnToolbar.Items[3].ToolTip = GetResource("CSTRESX00018");
                mnToolbar.Items[4].Text = GetResource("CSTRESX00019");
                mnToolbar.Items[4].ToolTip = GetResource("CSTRESX00020");
                mnToolbar.Items[5].Text = GetResource("CSTRESX00021");
                mnToolbar.Items[5].ToolTip = GetResource("CSTRESX00022");
                mnToolbar.Items[6].Text = GetResource("CSTRESX00023");
                mnToolbar.Items[6].ToolTip = GetResource("CSTRESX00024");
                mnToolbar.Items[7].Text = GetResource("CSTRESX00025");
                mnToolbar.Items[7].ToolTip = GetResource("CSTRESX00026");
                mnToolbar.Items[8].Text = GetResource("CSTRESX00027");
                mnToolbar.Items[8].ToolTip = GetResource("CSTRESX00028");
                mnToolbar.Items[9].Text = GetResource("CSTRESX00029");
                mnToolbar.Items[9].ToolTip = GetResource("CSTRESX00030");
                mnToolbar.Items[9].Items[0].Text = GetResource("CSTRESX00031");
                mnToolbar.Items[9].Items[0].ToolTip = GetResource("CSTRESX00032");
                mnToolbar.Items[9].Items[1].Text = GetResource("CSTRESX00033");
                mnToolbar.Items[9].Items[1].ToolTip = GetResource("CSTRESX00034");
                mnToolbar.Items[10].Text = GetResource("CSTRESX00039");
                mnToolbar.Items[10].ToolTip = GetResource("CSTRESX00040");
                mnToolbar.Items[11].Text = GetResource("CSTRESX00041");
                mnToolbar.Items[11].ToolTip = GetResource("CSTRESX00042");
                mnToolbar.Items[12].Text = GetResource("CSTRESX00043");
                mnToolbar.Items[12].ToolTip = GetResource("CSTRESX00044");
                mnToolbar.Items[13].Text = GetResource("CSTRESX00045");
                mnToolbar.Items[13].ToolTip = GetResource("CSTRESX00046");
                mnToolbar.Items[14].Text = GetResource("CSTRESX00015");
                mnToolbar.Items[14].ToolTip = GetResource("CSTRESX00147");
                mnToolbar.Items[15].Text = GetResource("CSTRESX00047");
                mnToolbar.Items[15].ToolTip = GetResource("CSTRESX00048");

                popmMoreMenu.Items[0].Text = GetResource("CSTRESX00148");
                popmMoreMenu.Items[0].ToolTip = GetResource("CSTRESX00149");
                popmMoreMenu.Items[1].Text = GetResource("CSTRESX00150");
                popmMoreMenu.Items[1].ToolTip = GetResource("CSTRESX00151");
                popmMoreMenu.Items[2].Text = GetResource("CSTRESX00152");
                popmMoreMenu.Items[2].ToolTip = GetResource("CSTRESX00153");
                popmMoreMenu.Items[3].Text = GetResource("CSTRESX00154");
                popmMoreMenu.Items[3].ToolTip = GetResource("CSTRESX00155");
                popmMoreMenu.Items[4].Text = GetResource("CSTRESX00156");
                popmMoreMenu.Items[4].ToolTip = GetResource("CSTRESX00157");
                popmMoreMenu.Items[5].Text = GetResource("CSTRESX00158");
                popmMoreMenu.Items[5].ToolTip = GetResource("CSTRESX00159");
                popmMoreMenu.Items[6].Text = GetResource("CSTRESX00160");
                popmMoreMenu.Items[6].ToolTip = GetResource("CSTRESX00161");

                popmListMenu.Items[0].Text = GetResource("CSTRESX00162");
                popmListMenu.Items[0].ToolTip = GetResource("CSTRESX00163");
                popmListMenu.Items[1].Text = GetResource("CSTRESX00164");
                popmListMenu.Items[1].ToolTip = GetResource("CSTRESX00165");
                popmListMenu.Items[2].Text = GetResource("CSTRESX00166");
                popmListMenu.Items[2].ToolTip = GetResource("CSTRESX00167");
                popmListMenu.Items[3].Text = GetResource("CSTRESX00168");
                popmListMenu.Items[3].ToolTip = GetResource("CSTRESX00169");
                popmListMenu.Items[4].Text = GetResource("CSTRESX00170");
                popmListMenu.Items[4].ToolTip = GetResource("CSTRESX00171");
                popmListMenu.Items[5].Text = GetResource("CSTRESX00172");
                popmListMenu.Items[5].ToolTip = GetResource("CSTRESX00173");
                popmListMenu.Items[6].Text = GetResource("CSTRESX00174");
                popmListMenu.Items[6].ToolTip = GetResource("CSTRESX00175");
                popmListMenu.Items[7].Text = GetResource("CSTRESX00176");
                popmListMenu.Items[7].ToolTip = GetResource("CSTRESX00177");
                popmListMenu.Items[8].Text = GetResource("CSTRESX00178");
                popmListMenu.Items[8].ToolTip = GetResource("CSTRESX00179");
                popmListMenu.Items[9].Text = GetResource("CSTRESX00180");
                popmListMenu.Items[9].ToolTip = GetResource("CSTRESX00181");

                txtSearchText.NullText = GetResource("CSTRESX00035");
                btnSearch.Text = GetResource("CSTRESX00036");
                btnSearch.ToolTip = GetResource("CSTRESX00037");

            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.gdvList.IsCallback && this.lgLang != "KO")) {
                gdvList.Columns["ALLSELECT"].ToolTip = GetResource("CSTRESX00049");
                gdvList.Columns["MESSAGEFLAGEDCLASS"].ToolTip = GetResource("CSTRESX00050");
                gdvList.Columns["MESSAGEFLAGCLASS"].ToolTip = GetResource("CSTRESX00051");
                gdvList.Columns["ATTACHFILECOUNT"].ToolTip = GetResource("CSTRESX00052");
                gdvList.Columns["MESSAGEFROMADDRESS"].Caption = GetResource("CSTRESX00053");
                gdvList.Columns["MESSAGEFROMADDRESS"].ToolTip = GetResource("CSTRESX00054");
                gdvList.Columns["MESSAGETOADDRESS"].Caption = GetResource("CSTRESX00055");
                gdvList.Columns["MESSAGETOADDRESS"].ToolTip = GetResource("CSTRESX00056");
                gdvList.Columns["MESSAGESUBJECT"].Caption = GetResource("CSTRESX00057");
                gdvList.Columns["MESSAGESUBJECT"].ToolTip = GetResource("CSTRESX00058");
                if (lgLang == "CN") {
                    gdvList.Columns["MESSAGEDATE"].Width = 150;
                }
                gdvList.Columns["MESSAGEDATE"].Caption = GetResource("CSTRESX00059");
                gdvList.Columns["MESSAGEDATE"].ToolTip = GetResource("CSTRESX00060");
                gdvList.Columns["MESSAGESIZE"].Caption = GetResource("CSTRESX00063");
                gdvList.Columns["MESSAGESIZE"].ToolTip = GetResource("CSTRESX00064");
                gdvList.Columns["SENDSTATUSNAME"].Caption = GetResource("CSTRESX00065");
                gdvList.Columns["SENDSTATUSNAME"].ToolTip = GetResource("CSTRESX00066");
                gdvList.Columns["RECIPIENTDATE"].Caption = GetResource("CSTRESX00067");
                gdvList.Columns["RECIPIENTDATE"].ToolTip = GetResource("CSTRESX00068");
            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.popWrite.IsCallback && lgLang != "KO")) {
                cboLang.Items[0].Text = GetGlobalResource("GCTRRESX10090");
                cboLang.Items[1].Text = GetGlobalResource("GCTRRESX10091");
                cboLang.Items[2].Text = GetGlobalResource("GCTRRESX10092");
                cboLang.Items[3].Text = GetGlobalResource("GCTRRESX10093");
            
                upcAttachment.AdvancedModeSettings.TemporaryFolder = lgACT.GetMailACTDirectory(PathType.Temp, PathFormatter.FullPhysicalPath);
                upcAttachment.BrowseButton.Text = GetResource("CSTRESX00098");
                upcAttachment.ValidationSettings.GeneralErrorText = GetResource("CSTRESX00094");
                upcAttachment.ValidationSettings.MultiSelectionErrorText = GetResource("CSTRESX00095");
                upcAttachment.ValidationSettings.MaxFileSizeErrorText = GetResource("CSTRESX00096");
                upcAttachment.ValidationSettings.NotAllowedFileExtensionErrorText = GetResource("CSTRESX00097");
            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.gdvAttachList.IsCallback && lgLang != "KO")) {
                gdvAttachList.Columns["ALLSELECT"].ToolTip = GetResource("CSTRESX00049");
                gdvAttachList.Columns["file_name"].Caption = GetResource("CSTRESX00103");
                gdvAttachList.Columns["file_name"].ToolTip = GetResource("CSTRESX00104");
                gdvAttachList.Columns["file_extantion"].Caption = GetResource("CSTRESX00105");
                gdvAttachList.Columns["file_extantion"].ToolTip = GetResource("CSTRESX00106");
                gdvAttachList.Columns["upload_type"].Caption = GetResource("CSTRESX00107");
                gdvAttachList.Columns["upload_type"].ToolTip = GetResource("CSTRESX00108");
                gdvAttachList.Columns["down_period"].Caption = GetResource("CSTRESX00109");
                gdvAttachList.Columns["down_period"].ToolTip = GetResource("CSTRESX00110");
                gdvAttachList.Columns["custom_file_size"].Caption = GetResource("CSTRESX00111");
                gdvAttachList.Columns["custom_file_size"].ToolTip = GetResource("CSTRESX00112");
            }
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            this._IMAPFolders = this.lgACT.MailServerProvider.GetIMAPFoldersDetail();
            
            if (this.sfid == -1 && string.IsNullOrWhiteSpace(this.sfnm)) {
                var first_folder_row = this._IMAPFolders.Select("FOLDERID <> 0").OrderBy(row => row.Field<int>("SEQ_NO")).First();
                this.sfid = first_folder_row.Field<int>("FOLDERID");
                this.sfnm = first_folder_row.Field<string>(string.Format("FOLDERNAME_{0}", lgLang));
            } else {
                if (this.sfid != -1) {
                    this.sfnm = this._IMAPFolders.Select(string.Format("FOLDERID = {0}", Data.FilterVariable(this.sfid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation))).First().Field<string>(string.Format("FOLDERNAME_{0}", lgLang));
                } else {
                    this.sfid = this._IMAPFolders.Select(string.Format("FOLDERNAME = {0}", Data.FilterVariable(hMailServerProvider.GetGlobalIMAPFolderName(this.sfnm, Global.hMailServerLang)))).First().Field<int>("FOLDERID");
                }
            }
            
            this.HiddenFields["sfid"] = this.sfid;
            this.HiddenFields["sfnm"] = this.sfnm;
            this.simfp = hMailServerProvider.GetGlobalIMAPFolder(this.sfnm);
            if (simfp == hMailServerService.IMAPFolders.InboxMe) {
                gdvList.Columns["MESSAGEFROMADDRESS"].Visible = false;
                gdvList.Columns["MESSAGETOADDRESS"].Visible = false;
            } else if (simfp == hMailServerService.IMAPFolders.SentBox || simfp == hMailServerService.IMAPFolders.TempBox) {
                gdvList.Columns["MESSAGEFROMADDRESS"].Visible = false;
                gdvList.Columns["MESSAGETOADDRESS"].Visible = true;
            } else {
                gdvList.Columns["MESSAGEFROMADDRESS"].Visible = true;
                gdvList.Columns["MESSAGETOADDRESS"].Visible = false;
            }

            this.LoadSystemIMAPFolders();
            this.LoadMyIMAPFolers();
            this.LoadTailIMAPFolders();
            
            foreach (DevExpress.Web.MenuItem item in mnToolbar.Items) {
                if (item.Name == "btnMove") {
                    foreach (tdsV_MAIL_IMAPFOLDER folder in this._IMAPFolders) {
                        if (folder.FOLDERID == 0 || //전체
                            folder.SEQ_NO == 2 ||   //내게쓴 편지함
                            folder.SEQ_NO == 4 ||   //보낸 편지함
                            folder.SEQ_NO == 5 ||   //임시 보관함
                            folder.SEQ_NO == 7 ||   //지운 편지함
                            folder.SEQ_NO == 8)     //예약 발송함
                            continue;

                        var folderItem = new DevExpress.Web.MenuItem(folder[string.Format("FOLDERNAME_{0}", lgLang)].ToString(), string.Format("{0}", folder.FOLDERID));
                        folderItem.Image.SpriteProperties.CssClass = GetIMAPFolderCssClassName(folder.FOLDERNAME) + " Margin5R";
                        item.Items.Add(folderItem);
                    }
                }
            }

            var tot_folder = this._IMAPFolders.First<tdsV_MAIL_IMAPFOLDER>(folder => folder.FOLDERID == 0);
            lblUseSize.Text = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(tot_folder.TOTAL_SIZE);
            lblMaxSize.Text = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(lgACT.MailServerProvider.AccountMaxSize * 1048576L);
            var position = (decimal)((decimal)(tot_folder.TOTAL_SIZE / 1048576) / lgACT.MailServerProvider.AccountMaxSize * 100);
            prbUsedTotalSize.Position = (position < 0 ? 0 : (position > 100 ? 100 : position));
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            try {
                this.sfid = int.Parse(this.HiddenFields["sfid"].ToString());
                this.sfnm = this.HiddenFields["sfnm"].ToString();
                this.simfp = hMailServerProvider.GetGlobalIMAPFolder(this.sfnm);
            } catch {
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

        /// <summary>
        /// 최근 메일 발송지 조회
        /// </summary>
        /// <param name="sHdrType">해더 타입</param>
        /// <returns></returns>
        protected DataTable tkbAddr_DbQuery(string sHdrType) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT NAME + ' <' + ADDRESS + '>' AS NAME, ");
            lgStrSql.AppendLine(" NAME + ' <' + ADDRESS + '>' AS ADDRESS");
            lgStrSql.AppendLine(" FROM B_MAIL_SEND_HIST ");
            lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
            lgStrSql.AppendLine(string.Format(" AND HDR_TYPE = {0} ", Data.FilterVariable(sHdrType)));
            lgStrSql.AppendLine(" ORDER BY SEND_HIST_NO DESC, NAME, ADDRESS ASC ");

            return lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), sHdrType).Tables[sHdrType];
        }

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        protected void cbpFolders_Callback(object sender, CallbackEventArgsBase e) {
            var cb_args = default(BaseCallbackArgs);

            try {
                cb_args = BaseCallbackArgs.GetDeserialize<BaseCallbackArgs>(e.Parameter);

                if (cb_args == null) {
                    throw new SystemException("데이터 형식이 잘못되었습니다.");
                }
            } catch (SystemException ex) {
                throw ex;
            }

            if (cb_args.Cmd.ToLower() == "my_folder"){
                switch (cb_args.DBAccessMode) {
                    case DBAccessMode.Create:
                        var accout = this.lgACT.MailServerProvider.GetAPIAccount();
                        accout.IMAPFolders.Add(cb_args.Data.ToString());
                        break;
                    case DBAccessMode.Update:
                        break;
                    case DBAccessMode.Delete:
                        break;
                }
            }
            

            this._IMAPFolders = this.lgACT.MailServerProvider.GetIMAPFoldersDetail();

            this.LoadSystemIMAPFolders();
            this.LoadMyIMAPFolers();
            this.LoadTailIMAPFolders();
        }

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group

        /// <summary>
        /// EntityServerModeDataSource 조회 이벤트
        /// </summary>
        /// <remarks>
        /// 마스터 페이지의 전체 DataBind() 함수 때문에 페이지 로드가 되기전 그리드 또는 다른 바인딩 함수를 호출하면
        /// 2번 이상이 호출되면서 오류가 발생함으로 속도가 저하됨(주의해야함)
        /// </remarks>
        /// <param name="sender">이벤트 발생자</param>
        /// <param name="e">이벤트</param>
        protected void EntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e) {
            var query = default(IQueryable);
            switch (this.str_mv) {
                case "read": //읽기 상태에서 삭제 그리드 데이터 가공을 하게되면 발생하기 때문에 포함
                case "list":
                    e.KeyExpression = "MESSAGEID";
                    switch (lgLang) {
                        case "KO": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntities().V_MAIL_MESSAGES.AsQueryable(); break;
                        case "EN": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntitiesEN().V_MAIL_MESSAGES.AsQueryable(); break;
                        case "CN": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntitiesCN().V_MAIL_MESSAGES.AsQueryable(); break;
                        case "JP": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntitiesJP().V_MAIL_MESSAGES.AsQueryable(); break;
                    }
                    if (simfp == hMailServerService.IMAPFolders.InboxMe) {
                        query = query.Select("NEW (ACCOUNTID, MESSAGEID, MESSAGEFOLDERID, MESSAGEFOLDERNAME, MESSAGEFLAGED, MESSAGEFLAGEDCLASS, MESSAGEFLAGS, MESSAGEFLAGCLASS, ISFORWARD, IMPORTANCE, ATTACHFILECOUNT, MESSAGESUBJECT, MESSAGEDATE, MESSAGESIZE, PARSETYPE)");
                    } else if (simfp == hMailServerService.IMAPFolders.SentBox || simfp == hMailServerService.IMAPFolders.TempBox) {
                        query = query.Select("NEW (ACCOUNTID, MESSAGEID, MESSAGEFOLDERID, MESSAGEFOLDERNAME, MESSAGEFLAGED, MESSAGEFLAGEDCLASS, MESSAGEFLAGS, MESSAGEFLAGCLASS, ISFORWARD, IMPORTANCE, ATTACHFILECOUNT, MESSAGETOADDRESS, MESSAGESUBJECT, MESSAGEDATE, MESSAGESIZE, PARSETYPE)");
                    }else {
                        query = query.Select("NEW (ACCOUNTID, MESSAGEID, MESSAGEFOLDERID, MESSAGEFOLDERNAME, MESSAGEFLAGED, MESSAGEFLAGEDCLASS, MESSAGEFLAGS, MESSAGEFLAGCLASS, ISFORWARD, IMPORTANCE, ATTACHFILECOUNT, MESSAGEFROMADDRESS, MESSAGESUBJECT, MESSAGEDATE, MESSAGESIZE, PARSETYPE)");
                    }
                    query = query.Where("ACCOUNTID = @0", lgACT.AccountId);
                    if (this.HiddenFields.Contains("sfid") && this.HiddenFields["sfid"].ToString() != "0") {
                        query = query.Where("MESSAGEFOLDERID = @0", sfid);
                    } else {
                        if (this.HiddenFields.Contains("sfop") && this.HiddenFields["sfop"].ToString() == "unseen") {
                            query = query.Where("(MESSAGEFLAGS & @0) != @0", (byte)1);
                        }
                    }
                    if (!string.IsNullOrEmpty(txtSearchText.Text)) {
                        query = query.Where("FREETEXT((MESSAGESUBJECT, MESSAGEBODY), @0)", txtSearchText.Text);
                    }
                    //query = query.OrderBy("MESSAGEID DESC");
                    break;
                case "receive_check":
                    e.KeyExpression = "MESSAGEID;RECIPIENTID";
                    switch (lgLang) {
                        case "KO": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_RECIPIENTS_CHECKEntities().V_MAIL_RECIPIENTS_CHECK.AsQueryable(); break;
                        case "EN": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_RECIPIENTS_CHECKEntitiesEN().V_MAIL_RECIPIENTS_CHECK.AsQueryable(); break;
                        case "CN": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_RECIPIENTS_CHECKEntitiesCN().V_MAIL_RECIPIENTS_CHECK.AsQueryable(); break;
                        case "JP": query = new eniFramework.WebApp.Modules.Mail.efV_MAIL_RECIPIENTS_CHECKEntitiesJP().V_MAIL_RECIPIENTS_CHECK.AsQueryable(); break;
                    }
                    query = query.Select("NEW (ACCOUNTID, MESSAGEID, RECIPIENTID, SENDSTATUSNAME, MESSAGETOADDRESS, MESSAGESUBJECT, IMPORTANCE, ATTACHFILECOUNT, MESSAGEDATE, RECIPIENTDATE)");
                    query = query.Where("ACCOUNTID = @0", lgACT.AccountId);
                    //query = query.OrderBy("MESSAGEDATE DESC");
                    break;
            }
            e.QueryableSource = query;
        }
        /// <summary>
        /// 엔티티 프레임 워크의 Linq 데이터 로드후 발생함으로 마스터 페이지에서 DataBind() 호출후
        /// 데이터가 반인딩 된후 호출됨
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gdvList_DataBound(object sender, EventArgs e) {
            switch (this.str_mv) {
                case "read":
                case "list":
                    if (this.str_prov_mv == "receive_check") {
                        var g_col1 = this.gdvList.GetGroupedColumns();
                        foreach (var col in g_col1) {
                            col.GroupIndex = -1;
                        }
                        this.gdvList.GroupBy(this.gdvList.Columns["MESSAGEDATE"], 0);
                        this.gdvList.SortBy(this.gdvList.Columns["MESSAGEDATE"], DevExpress.Data.ColumnSortOrder.Descending);
                    }
                    break;
                case "receive_check":
                    if (this.str_prov_mv == "list") {
                        var g_col2 = gdvList.GetGroupedColumns();
                        foreach (var col in g_col2) {
                            col.GroupIndex = -1;
                        }
                        this.gdvList.GroupBy(this.gdvList.Columns["MESSAGEDATE"], 0);
                        this.gdvList.SortBy(this.gdvList.Columns["MESSAGEDATE"], DevExpress.Data.ColumnSortOrder.Descending);
                    }
                    break;
            }
            this.gdvList.ExpandAll();
        }
        protected void gdvList_BeforePerformDataSelect(object sender, EventArgs e) {
            if (!this.HiddenFields.Contains("mv") || !this.HiddenFields.Contains("cmd")) {
                return;
            }

            var strSql = new StringBuilder();
            var str_mv = this.HiddenFields["mv"].ToString();
            var str_cmd = this.HiddenFields["cmd"].ToString();
            var move_mfid = 0;
            var mfid = 0;
            var mfnm = string.Empty;
            var mid = 0L;

            switch (str_mv) {
                case "list":
                    var dt_multidata = default(DataTable);
                    var strMsgIDs = string.Empty;
                    if (!this.HiddenFields.Contains("data") || string.IsNullOrWhiteSpace(this.HiddenFields["data"].ToString())) {
                        return;
                    } else {
                        try {
                            dt_multidata = (DataTable)JsonConvert.DeserializeObject<DataTable>(this.HiddenFields["data"].ToString());
                        } catch {
                            return;
                        }
                    }
                    switch(str_cmd) { 
                        case "delete": //삭제
                            foreach (DataRow row in dt_multidata.Rows) {
                                if (long.TryParse(row["mid"].ToString(), out mid)) {
                                    strMsgIDs += string.Format("{0},", mid);
                                }
                            }
                            if (!this.HiddenFields.Contains("sfnm") || string.IsNullOrWhiteSpace(this.HiddenFields["sfnm"].ToString())) {
                                return;
                            } 
                            if (string.IsNullOrWhiteSpace(strMsgIDs) == false) {
                                var aParams = new SqlParameter[] {
                                    new SqlParameter("@ACCOUNT_ID", lgACT.AccountId), 
                                    new SqlParameter("@STR_IDS", strMsgIDs.Substring(0, strMsgIDs.LastIndexOf(',')))
                                };
                                if (sfid != 0) {
                                    if (this.simfp != hMailServerService.IMAPFolders.TrashBox) {
                                        this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_DELETE_MESSAGES", aParams);
                                        Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                    } else {
                                        this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_DELETE_MESSAGES_FULL", aParams);
                                    }
                                } else {
                                    mfnm = this.HiddenFields["sfnm"].ToString();
                                    if (hMailServerProvider.GetGlobalIMAPFolder(mfnm) != hMailServerService.IMAPFolders.TrashBox) {
                                        this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_DELETE_MESSAGES", aParams);
                                        Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                    } else {
                                        this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_DELETE_MESSAGES_FULL", aParams);
                                    }
                                }
                            }
                            break;
                        case "delete_full": //완전삭제
                            foreach (DataRow row in dt_multidata.Rows) {
                                if (long.TryParse(row["mid"].ToString(), out mid)) {
                                    strMsgIDs += string.Format("{0},", mid);
                                }
                            }
                            if (string.IsNullOrWhiteSpace(strMsgIDs) == false) {
                                var aParams = new SqlParameter[] {
                                    new SqlParameter("@ACCOUNT_ID", lgACT.AccountId), 
                                    new SqlParameter("@STR_IDS", strMsgIDs.Substring(0, strMsgIDs.LastIndexOf(',')))
                                };
                                this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_DELETE_MESSAGES_FULL", aParams);
                            }
                            break;
                        case "move": //이동
                            if (!this.HiddenFields.Contains("move_mfid") || !int.TryParse(this.HiddenFields["move_mfid"].ToString(), out move_mfid)) {
                                return;
                            }
                            foreach (DataRow row in dt_multidata.Rows) {
                                if (long.TryParse(row["mid"].ToString(), out mid)) {
                                    strMsgIDs += string.Format("{0},", mid);
                                }
                            }
                            if (string.IsNullOrWhiteSpace(strMsgIDs) == false) {
                                var aParams = new SqlParameter[] {
                                    new SqlParameter("@ACCOUNT_ID", this.lgACT.AccountId), 
                                    new SqlParameter("@MOVE_IMAPFOLDERID", move_mfid),
                                    new SqlParameter("@STR_IDS", strMsgIDs.Substring(0, strMsgIDs.LastIndexOf(',')))
                                };
                                this.lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_MOVE_IMAPFOLDER", aParams);
                                Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                            }
                            break;
                        case "empty":
                            if (dt_multidata.Rows.Count == 0 && dt_multidata.Columns.Contains("folder_id")){
                                return;
                            }
                            strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                            strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                            strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                            strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", dt_multidata.Rows[0]["folder_id"]));
                            strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                            this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                            break;
                        case "flaged_read":
                            if (dt_multidata.Rows.Count == 0 && dt_multidata.Columns.Contains("folder_id")) {
                                return;
                            }
                            strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 1 ");
                            strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                            strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                            strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", dt_multidata.Rows[0]["folder_id"]));
                            strSql.AppendLine(" AND MESSAGEFLAGS & 1 != 1 ");
                            this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                            Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                            break;
                        case "flaged_read_delete":
                            if (dt_multidata.Rows.Count == 0 && dt_multidata.Columns.Contains("folder_id")) {
                                return;
                            }
                            strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                            strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                            strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                            strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", dt_multidata.Rows[0]["folder_id"]));
                            strSql.AppendLine(" AND MESSAGEFLAGS & 1 = 1 ");
                            strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                            this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                            break;
                        case "flaged_unread_delete":
                            if (dt_multidata.Rows.Count == 0 && dt_multidata.Columns.Contains("folder_id")) {
                                return;
                            }
                            strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                            strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                            strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                            strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", dt_multidata.Rows[0]["folder_id"]));
                            strSql.AppendLine(" AND MESSAGEFLAGS & 1 != 1 ");
                            strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                            this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                            break;
                    }
                    break;
                case "read":
                    if (!this.HiddenFields.Contains("mid") || !long.TryParse(this.HiddenFields["mid"].ToString(), out mid)) {
                        return;
                    }
                    var apiMessage = default(Message);
                    switch (str_cmd) {
                        case "delete":
                            apiMessage = this.lgACT.MailServerProvider.GetAPIMessage(mid);
                            if (!this.HiddenFields.Contains("mfid") || !int.TryParse(this.HiddenFields["mfid"].ToString(), out mfid)) {
                                return;
                            }
                            if (!this.HiddenFields.Contains("mfnm") || string.IsNullOrWhiteSpace(this.HiddenFields["mfnm"].ToString())) {
                                return;
                            }
                            if (sfid != 0) {
                                if (simfp != hMailServerService.IMAPFolders.TrashBox) {
                                    var str_trash_box = hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, Global.hMailServerLang);
                                    apiMessage.Copy(lgACT.MailServerProvider.GetIMAPFolderIDByIMAPFolderName(str_trash_box));
                                }
                            } else {
                                mfnm = this.HiddenFields["mfnm"].ToString();
                                if (hMailServerProvider.GetGlobalIMAPFolder(mfnm) != hMailServerService.IMAPFolders.TrashBox) {
                                    var str_trash_box = hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, Global.hMailServerLang);
                                    apiMessage.Copy(lgACT.MailServerProvider.GetIMAPFolderIDByIMAPFolderName(str_trash_box));
                                }
                            }
                            this.lgACT.MailServerProvider.GetAPIIMAPFolderByFolderID(mfid).Messages.DeleteByDBID(mid);
                            Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                            break;
                        case "delete_full":
                            if (!this.HiddenFields.Contains("mfid") || !int.TryParse(this.HiddenFields["mfid"].ToString(), out mfid)) {
                                return;
                            }
                            this.lgACT.MailServerProvider.GetAPIIMAPFolderByFolderID(mfid).Messages.DeleteByDBID(mid);
                            Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                            break;
                        case "move":
                            apiMessage = this.lgACT.MailServerProvider.GetAPIMessage(mid);
                            if (!this.HiddenFields.Contains("mfid") || !int.TryParse(this.HiddenFields["mfid"].ToString(), out mfid)) {
                                return;
                            }
                            if (!this.HiddenFields.Contains("move_mfid") || !int.TryParse(this.HiddenFields["move_mfid"].ToString(), out move_mfid)) {
                                return;
                            }
                            var folder = this.lgACT.MailServerProvider.GetAPIIMAPFolderByFolderID(mfid);
                            apiMessage.Copy(move_mfid);
                            folder.Messages.DeleteByDBID(mid);
                            apiMessage = null;
                            folder = null;
                            Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                            return;
                    }
                    break;
                case "receive_check":
                    switch (str_cmd) {
                        case "delete":
                            var dt_re_multidata = default(DataTable);
                            var strReMsgIDs = string.Empty;
                            var strReMsgRIDs = string.Empty;
                            if (!this.HiddenFields.Contains("data") || string.IsNullOrWhiteSpace(this.HiddenFields["data"].ToString())) {
                                return;
                            } else {
                                try {
                                    dt_re_multidata = (DataTable)JsonConvert.DeserializeObject<DataTable>(this.HiddenFields["data"].ToString());
                                } catch {
                                    return;
                                }
                            }
                            if (dt_re_multidata.Rows.Count == 0) {
                                return;
                            }
                            foreach (DataRow row in dt_re_multidata.Rows) {
                                strReMsgIDs += string.Format("{0},", Data.FilterVariable(row["mid"]));
                                strReMsgRIDs += string.Format("{0},", Data.FilterVariable(row["rid"]));
                            }

                            var strReSql = new StringBuilder();
                            strReSql.AppendLine(" DELETE hMailServer..HM_MESSAGE_RECIPIENTS_CHECK ");
                            strReSql.AppendLine(string.Format(" WHERE MESSAGEID IN({0})", strReMsgIDs.Substring(0, strReMsgIDs.LastIndexOf(','))));
                            strReSql.AppendLine(string.Format(" AND RECIPIENTID IN({0})", strReMsgRIDs.Substring(0, strReMsgRIDs.LastIndexOf(','))));
                            this.lgDbAccess.ExecuteNonQuery(strReSql.ToString());
                            break;
                    }
                    break;
            }
        }

        protected void gdvList_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e) {
            if (e.Row != null && e.RowType == GridViewRowType.Data) {
                e.Row.Attributes["row_no"] = e.VisibleIndex.ToString();
                e.Row.Attributes["mid"] = e.KeyValue.ToString().Split('|')[1];
                e.Row.Attributes["data"] = e.KeyValue.ToString();
            }
        }
        protected void gdvList_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e) {
            var strRowNum = e.VisibleIndex.ToString();
            var strMessageID = string.Empty;
            var strMessageFolderID = string.Empty;
            var strFlagedClass = string.Empty;
            var strFlagClass = string.Empty;
            var strCellTitle = string.Empty;

            e.Cell.Attributes["id"] = e.DataColumn.FieldName;

            switch (e.DataColumn.FieldName) {
                case "MESSAGEFLAGEDCLASS":
                    e.Cell.Controls.Clear();
                    strFlagedClass = e.CellValue.ToString();
                    strCellTitle = strFlagedClass == "Flagged" ? GetResource("CSTRESX00125") : GetResource("CSTRESX00126");
                    
                    var htmlFlaggedSpan = new HtmlGenericControl("span");

                    htmlFlaggedSpan.Attributes["title"] = e.Cell.ToolTip = strCellTitle;
                    htmlFlaggedSpan.Attributes["style"] = "margin: 0px 0px 0px 1px; padding:0 0 0 3px;";
                    htmlFlaggedSpan.Attributes["class"] = string.Format("Icon {0} CursorPoint DisplayBlock", strFlagedClass);
                    htmlFlaggedSpan.Attributes["onclick"] = "return eni.LocalPage.gdvList_Flaged_Click(event)";

                    e.Cell.Controls.Add(htmlFlaggedSpan);
                    break;
                case "MESSAGEFLAGCLASS":
                    e.Cell.Controls.Clear();

                    try {
                        strFlagClass = e.GetValue("MESSAGEFLAGCLASS").ToString();
                        strCellTitle = strFlagClass.Contains("Fwd") ? GetResource("CSTRESX00129") : (strFlagClass.Contains("UnSeen") ? GetResource("CSTRESX00128") : GetResource("CSTRESX00127"));

                        var htmlFlagSpan = new HtmlGenericControl("span");

                        htmlFlagSpan.Attributes["title"] = e.Cell.ToolTip = strCellTitle;
                        htmlFlagSpan.Attributes["class"] = string.Format("Icon {0} CursorPoint DisplayBlock", strFlagClass);
                        htmlFlagSpan.Attributes["style"] = strFlagClass.ToString().Contains("Fwd") ? "margin-left: 5px;" : "margin: 0px";
                        htmlFlagSpan.Attributes["onclick"] = "return eni.LocalPage.gdvList_Flag_Click(event)";

                        e.Cell.Controls.Add(htmlFlagSpan);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
                case "ATTACHFILECOUNT":
                    e.Cell.Controls.Clear();

                    try {
                        switch (str_mv) {
                            default:
                            case "list":
                                if ((byte)e.CellValue <= 0)
                                    return;

                                var htmlAttachIcoSpan = new HtmlGenericControl("span");

                                htmlAttachIcoSpan.Attributes["class"] = "row_attach CursorPoint";
                                htmlAttachIcoSpan.Attributes["title"] = e.Cell.ToolTip = string.Format(GetResource("CSTRESX00130"), (byte)e.CellValue);
                                htmlAttachIcoSpan.Attributes["class"] = "Icon Attachments CursorPoint DisplayBlock";
                                htmlAttachIcoSpan.Attributes["style"] = "float:none; margin:0 0 0 4px;";
                                htmlAttachIcoSpan.Attributes["onclick"] = "return eni.LocalPage.gdvList_Attachment_Click(event)";

                                e.Cell.Controls.Add(htmlAttachIcoSpan);
                                break;
                            case "receive_check":
                                if ((byte)e.CellValue <= 0)
                                    return;

                                var htmlrAttachIcoSpan = new HtmlGenericControl("span");
                                htmlrAttachIcoSpan.Attributes["mid"] = e.GetValue("MESSAGEID").ToString();
                                htmlrAttachIcoSpan.Attributes["class"] = "Icon Attachments CursorPoint DisplayBlock";
                                htmlrAttachIcoSpan.Attributes["style"] = "float:none; margin:0 0 0 4px;";
                                htmlrAttachIcoSpan.Attributes["onclick"] = "return eni.LocalPage.gdvList_Attachment_Click(event)";

                                e.Cell.Controls.Add(htmlrAttachIcoSpan);
                                break;
                        }
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
                case "MESSAGEFROMADDRESS":
                    e.Cell.Controls.Clear();

                    try {
                        strFlagClass = e.GetValue("MESSAGEFLAGCLASS").ToString();
                        var strFromAddress = ReplaceEscape(e.CellValue.ToString());
                        var strClickEvent = @"function (s, e) { return eni.LocalPage.hiAddress_Click(s, e, """ + strFromAddress + @"""); }";

                        if (string.IsNullOrWhiteSpace(strFromAddress))
                            return;

                        var strFromName = string.Empty;
                        try {
                            strFromName = new MailAddress(strFromAddress).DisplayName;
                        } catch {
                            strFromName = strFromAddress;
                            strClickEvent = string.Empty;
                        }
                        

                        var hiFrom = new eniHyperLink() {
                            CssClass = "OverHidden CursorPoint DisplayBlock PositionRelative Text-Ellipsis",
                            Width = e.Cell.Width,
                            Height = Unit.Pixel(14),
                            Text = strFromName,
                            ToolTip = strFromAddress,
                            ForeColor = Color.FromName((strFlagClass.Contains("UnSeen") ? "#3399FF" : "#000000"))
                        };

                        hiFrom.Attributes["style"] = "padding:0 5px 0 5px;";
                        if (!string.IsNullOrWhiteSpace(strClickEvent)){
                            hiFrom.ClientSideEvents.Click = strClickEvent;
                        }
                        e.Cell.Controls.Add(hiFrom);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
                case "MESSAGETOADDRESS":
                    e.Cell.Controls.Clear();

                    try {
                        switch (str_mv) {
                            default:
                            case "list":
                                strFlagClass = e.GetValue("MESSAGEFLAGCLASS").ToString();
                                var strToAddress = ReplaceEscape(e.CellValue.ToString());
                                var strClickEvent = @"function (s, e) { return eni.LocalPage.hiAddress_Click(s, e, """ + strToAddress + @"""); }";

                                if (string.IsNullOrWhiteSpace(strToAddress))
                                    return;

                                
                                var arr_strToAddress = strToAddress.Split(',');
                                var str_last = string.Empty;
                                if (arr_strToAddress.Length > 1) {
                                    str_last = "(" + (arr_strToAddress.Length - 1).ToString() + ")";
                                }
                                var strToName = string.Empty;
                                try {
                                    strToName = new MailAddress(arr_strToAddress[0]).DisplayName;
                                } catch {
                                    strToName = arr_strToAddress[0];
                                    strClickEvent = string.Empty;
                                }
                                var hiTo = new eniHyperLink() {
                                    CssClass = "OverHidden CursorPoint DisplayBlock PositionRelative Text-Ellipsis",
                                    Height = Unit.Pixel(14),
                                    Text = simfp == hMailServerService.IMAPFolders.TempBox ? strToAddress : strToName + str_last,
                                    ToolTip = strToAddress,
                                    ForeColor = Color.FromName((strFlagClass.Contains("UnSeen") ? "#3399FF" : "#000000"))
                                };

                                hiTo.Attributes["style"] = "padding:0 5px 0 5px;";

                                if (sfid == 0) {
                                    if (hMailServerProvider.IsGlobalIMAPFolderName(hMailServerService.IMAPFolders.TempBox, e.GetValue("MESSAGEFOLDERNAME").ToString())) {
                                        hiTo.Font.Italic = true;
                                    }
                                } else {
                                    if (simfp == hMailServerService.IMAPFolders.TempBox) {
                                        hiTo.Font.Italic = true;
                                    }
                                }

                                hiTo.ClientSideEvents.Click = strClickEvent;

                                e.Cell.Controls.Add(hiTo);
                                break;
                            case "receive_check":
                                var hirTo = new eniHyperLink() {
                                    CssClass = "OverHidden CursorPoint DisplayBlock PositionRelative Text-Ellipsis",
                                    Height = Unit.Pixel(14),
                                    Text = new MailAddress(e.CellValue.ToString()).DisplayName,
                                    ToolTip = e.CellValue.ToString(),
                                    ForeColor = Color.FromName("#000000")
                                };
                                hirTo.Attributes["style"] = "padding:0 5px 0 5px;";

                                //hiTo.ClientSideEvents.Click = strClickEvent;

                                e.Cell.Controls.Add(hirTo);
                                break;
                        }
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
                case "MESSAGESUBJECT":
                    e.Cell.Controls.Clear();

                    try {
                        switch (str_mv) {
                            default:
                            case "list":
                                strMessageID = e.GetValue("MESSAGEID").ToString();
                                strMessageFolderID = e.GetValue("MESSAGEFOLDERID").ToString();
                                strFlagClass = e.GetValue("MESSAGEFLAGCLASS").ToString();
                                var strIportance = e.GetValue("IMPORTANCE").ToString().ToUpper();
                                var strFolderName = e.GetValue("MESSAGEFOLDERNAME").ToString();
                                var strSubject = e.CellValue.ToString();
                                var strClickEvent = string.Empty; ;

                                if (this.sfid == 0) {
                                    if (!hMailServerProvider.IsGlobalIMAPFolderName(hMailServerService.IMAPFolders.TempBox, e.GetValue("MESSAGEFOLDERNAME").ToString())) {
                                        strClickEvent = "function (s, e) { return eni.LocalPage.hiSubject_Click(s, e, 0); }";
                                    } else {
                                        strClickEvent = "function (s, e) { return eni.LocalPage.hiSubject_Click(s, e, 1); }";
                                    }
                                } else {
                                    if (simfp != hMailServerService.IMAPFolders.TempBox) {
                                        strClickEvent = "function (s, e) { return eni.LocalPage.hiSubject_Click(s, e, 0); }";
                                    } else {
                                        strClickEvent = "function (s, e) { return eni.LocalPage.hiSubject_Click(s, e, 1); }";
                                    }
                                }

                                if (sfid == 0 || sfid == -1) {
                                    var htmlFolderNm = new HtmlGenericControl("span");

                                    htmlFolderNm.Attributes["title"] = strFolderName;
                                    htmlFolderNm.Attributes["class"] = "Padding5LR CursorPoint FloatL";
                                    htmlFolderNm.Attributes["style"] = "color:#808080;";
                                    htmlFolderNm.Attributes["onclick"] = "return eni.LocalPage.gdvList_Folder_Click(event)";
                                    htmlFolderNm.InnerText = string.Format("[{0}]", strFolderName);

                                    e.Cell.Controls.Add(htmlFolderNm);
                                }

                                if (strIportance == "HIGH") {
                                    var img = new eniImage() {
                                        Width = Unit.Pixel(3),
                                        Height = Unit.Pixel(8),
                                        CssClass = "Icon Importance CursorPoint FloatL",
                                        ToolTip = GetResource("CSTRESX00115"),
                                        Cursor = "pointer"
                                    };

                                    img.Attributes["style"] = "margin: 1px 0px 0px; padding: 0px;";

                                    e.Cell.Controls.Add(img);
                                }

                                var hlSubject = new eniHyperLink() {
                                    CssClass = "OverHidden CursorPoint DisplayBlock PositionRelative Text-Ellipsis " + ((strIportance == "HIGH") ? "Padding5L" : string.Empty),
                                    Height = Unit.Pixel(14),
                                    Text = strSubject,
                                    ToolTip = strSubject,
                                    ForeColor = Color.FromName((strFlagClass.Contains("UnSeen") ? "#3399FF" : "#000000")),
                                    EncodeHtml = true
                                };

                                hlSubject.ClientSideEvents.Click = strClickEvent;
                                hlSubject.ClientSideEvents.SetEventHandler("onhover", "function(){alert()}");

                                if (strIportance.ToLower() == "high") {
                                    hlSubject.Attributes["style"] = "";
                                }

                                if (sfid == 0) {
                                    if (hMailServerProvider.IsGlobalIMAPFolderName(hMailServerService.IMAPFolders.TempBox, strFolderName)) {
                                        hlSubject.Font.Italic = true;
                                    }
                                } else {
                                    if (simfp == hMailServerService.IMAPFolders.TempBox) {
                                        hlSubject.Font.Italic = true;
                                    }
                                }

                                hlSubject.Attributes["style"] += " padding:0 5px 0 5px;";

                                e.Cell.Controls.Add(hlSubject);
                                break;
                            case "receive_check":
                                strMessageID = e.GetValue("MESSAGEID").ToString();
                                var strrIportance = e.GetValue("IMPORTANCE").ToString().ToUpper();

                                if (strrIportance == "HIGH") {
                                    var img = new eniImage() {
                                        Width = Unit.Pixel(3),
                                        Height = Unit.Pixel(8),
                                        CssClass = "Icon Importance CursorPoint FloatL",
                                        ToolTip = GetResource("CSTRESX00115"),
                                        Cursor = "pointer"
                                    };

                                    img.Attributes["style"] = "margin: 1px 0px 0px; padding: 0px;";

                                    e.Cell.Controls.Add(img);
                                }

                                var hlrSubject = new eniHyperLink() {
                                    CssClass = "OverHidden CursorPoint DisplayBlock PositionRelative Text-Ellipsis " + ((strrIportance == "HIGH") ? "Padding5L" : string.Empty),
                                    Height = Unit.Pixel(14),
                                    Text = e.GetValue("MESSAGESUBJECT").ToString(),
                                    ToolTip = e.GetValue("MESSAGESUBJECT").ToString(),
                                    ForeColor = Color.FromName((strFlagClass.Contains("UnSeen") ? "#3399FF" : "#000000"))
                                };

                                if (strrIportance.ToLower() == "high") {
                                    hlrSubject.Attributes["style"] = "";
                                }

                                hlrSubject.Attributes["style"] += " padding:0 5px 0 5px;";

                                e.Cell.Controls.Add(hlrSubject);
                                break;
                        }
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
                case "MESSAGEDATE":
                    e.Cell.Controls.Clear();

                    try {
                        var oMessageDate = e.GetValue("MESSAGEDATE");

                        if (!(oMessageDate is DateTime))
                            return;

                        var dtMessageDate = (DateTime)oMessageDate;
                        var strMessageDate = string.Empty;


                        if (dtMessageDate.ToShortDateString() == DateTime.Now.ToShortDateString()) {
                            strMessageDate = dtMessageDate.ToString(CommonVariable.CDT_HHMMSS);

                        } else {
                            strMessageDate = dtMessageDate.ToString(CommonVariable.CDT_YY_MM_DD_DDD_HH_MM_SS);
                        }

                        strCellTitle = dtMessageDate.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_HH_MM_SS_KOR);

                        var htmlDateDiv = new HtmlGenericControl("div");

                        htmlDateDiv.Attributes["class"] = "VerticalAlignCM Width100f";
                        htmlDateDiv.Attributes["title"] = strCellTitle;
                        htmlDateDiv.InnerText = strMessageDate;

                        e.Cell.Controls.Add(htmlDateDiv);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }

                    break;

                case "MESSAGESIZE":
                    e.Cell.Controls.Clear();

                    try {
                        var lMessageSIze = e.GetValue("MESSAGESIZE");

                        if (lMessageSIze is long == false)
                            return;

                        var strMessageSize = StringFormatSize.ConvertFileSize((long)lMessageSIze);

                        var htmlSizeDiv = new HtmlGenericControl("div");

                        htmlSizeDiv.Attributes["class"] = "VerticalAlignCM Width100f";
                        htmlSizeDiv.Attributes["title"] = strMessageSize;
                        htmlSizeDiv.InnerText = strMessageSize;

                        e.Cell.Controls.Add(htmlSizeDiv);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }

                    break;
                case "SENDSTATUSNAME":
                    e.Cell.Controls.Clear();

                    try {
                        var htmlSizeDiv = new HtmlGenericControl("div");

                        htmlSizeDiv.Attributes["class"] = "VerticalAlignCM Width100f";
                        htmlSizeDiv.Attributes["title"] = e.GetValue("SENDSTATUSNAME").ToString();
                        htmlSizeDiv.InnerText = e.GetValue("SENDSTATUSNAME").ToString();

                        e.Cell.Controls.Add(htmlSizeDiv);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }

                    break;

                case "RECIPIENTDATE":
                    e.Cell.Controls.Clear();

                    try {
                        var oRecipientDate = e.GetValue("RECIPIENTDATE");

                        if (!(oRecipientDate is DateTime))
                            return;

                        var dtRecipientDate = (DateTime)oRecipientDate;
                        var strRecipientDate = string.Empty;


                        if (dtRecipientDate.ToShortDateString() == DateTime.Now.ToShortDateString()) {
                            strRecipientDate = dtRecipientDate.ToString(CommonVariable.CDT_HHMMSS);

                        } else {
                            strRecipientDate = dtRecipientDate.ToString(CommonVariable.CDT_YY_MM_DD_DDD_HH_MM_SS);
                        }

                        strCellTitle = dtRecipientDate.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_HH_MM_SS_KOR);

                        var htmlDateDiv = new HtmlGenericControl("div");

                        htmlDateDiv.Attributes["class"] = "VerticalAlignCM Width100f";
                        htmlDateDiv.Attributes["title"] = strCellTitle;
                        htmlDateDiv.InnerText = strRecipientDate;

                        e.Cell.Controls.Add(htmlDateDiv);
                    } catch (System.Exception ex) {
                        e.Cell.Text = ex.Message;
                    }
                    break;
            }
        }

        protected void gdvList_CustomGroupDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e) {
            switch (e.Column.Name) {
                case "MESSAGEDATE":
                    var colData = (DateTime)e.Value;
                    var dateText = string.Empty;
                    string Count = gdvList.GetGroupRowSummaryText(e.VisibleIndex).Replace("(", "").Replace("개)", "").Trim();

                    if (colData.ToShortDateString() == DateTime.Now.ToShortDateString()) {
                        dateText = GetResource("CSTRESX00131");
                    } else if (colData.ToShortDateString() == DateTime.Now.AddDays(-1).ToShortDateString()) {
                        dateText = GetResource("CSTRESX00132");
                    } else {
                        dateText = colData.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_KOR);
                    }

                    e.EncodeHtml = false;
                    if (colData.DayOfWeek == DayOfWeek.Saturday) {
                        e.DisplayText = string.Format("<span style='color:#2F8AFA;'>{0} [<span style='color:#5DAE4F;'>{1}</span>]</span>", dateText, Count);
                    } else if (colData.DayOfWeek == DayOfWeek.Sunday) {
                        e.DisplayText = string.Format("<span style='color:#FA3B3B;'>{0} [<span style='color:#5DAE4F;'>{1}</span>]</span>", dateText, Count);
                    } else {
                        e.DisplayText = string.Format("<span style='color:#333;'>{0} [<span style='color:#5DAE4F;'>{1}</span>]</span>", dateText, Count);
                    }
                    break;
            }
        }

        protected void gdvList_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e) {
            switch (e.Item.FieldName) {
                case "MESSAGEDATE":
                    e.Text = string.Format(GetResource("CSTRESX00133"), e.Value);
                    break;
                case "MESSAGESIZE":
                    if (e.Value != null) {
                        var mSize = float.Parse(e.Value.ToString());
                        var fSize = mSize < 1073741824.0 ? (mSize < 1048576.0 ? (mSize < 1024.0 ? mSize : mSize / 1024) : mSize / 1048576.0) : mSize / 1073741824.0;
                        var fSizeUnit = mSize < 1073741824.0 ? (mSize < 1048576.0 ? (mSize < 1024.0 ? "byte" : "Kb") : "Mb") : "Gb";
                        e.Text = string.Format("{0:#,0.00} {1}", fSize, fSizeUnit);
                    }
                    break;
            }
        }

        #region Read

        protected class ReadCallBackArgs : BaseCallbackArgs {
            public int mfid { get; set; }
            public long mid { get; set; }
        }

        protected void popRead_WindowCallback(object source, PopupWindowCallbackArgs e) {
            var cb_args = default(ReadCallBackArgs);

            try {
                cb_args = ReadCallBackArgs.GetDeserialize<ReadCallBackArgs>(e.Parameter);

                if(cb_args == null) {
                    throw new SystemException("데이터 형식이 잘못되었습니다.");
                }
            } catch(SystemException ex) {
                throw ex;
            }

            var apiMessage = lgACT.MailServerProvider.GetAPIMessage(cb_args.mid);
            var message = lgACT.MailServerProvider.GetUserMessageDetail(cb_args.mid);
            var attachments = lgACT.MailServerProvider.GetUserAttachments(cb_args.mid);

            //메일 읽음/읽지않음 플래그 변경
            if (apiMessage.get_Flag(eMessageFlag.eMFSeen) == false) {
                apiMessage.set_Flag(eMessageFlag.eMFSeen, true);
                apiMessage.Save();

                Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
            }

            imgFlagged.CssClass = "Icon " + message.MESSAGEFLAGEDCLASS;

            //중요 메일 설정
            if (message.IMPORTANCE.ToLower() == "high") {
                eniImgImportantArea.Visible = true;
            }

            //메일 내용 설정
            lblSubject.Text = message.MESSAGESUBJECT;
            lblSubject.ToolTip = message.MESSAGESUBJECT;

            var strDate = string.Empty;
            if (message.MESSAGEDATE.ToShortDateString() == DateTime.Now.ToShortDateString()) {
                strDate = message.MESSAGEDATE.ToString("HH:mm:ss");
            } else {
                strDate = message.MESSAGEDATE_MIDDLE;
            }
            lblDate.Text = strDate;
            lblDate.ToolTip = message.MESSAGEDATE_LONG;

            lblFromAddr.Text = ReplaceEscape(message.MESSAGEFROMADDRESS);
            lblFromAddr.ToolTip = ReplaceEscape(message.MESSAGEFROMADDRESS);

            lblToAddr.Text = ReplaceEscape(message.MESSAGETOADDRESS);
            lblToAddr.ToolTip = ReplaceEscape(message.MESSAGETOADDRESS);

            if (string.IsNullOrWhiteSpace(message.MESSAGECCADDRESS)) {
                tbCCInfoArea.Visible = false;
            } else {
                lblCcAddr.Text = ReplaceEscape(message.MESSAGECCADDRESS);
                lblCcAddr.ToolTip = ReplaceEscape(message.MESSAGECCADDRESS);
            }

            if (string.IsNullOrWhiteSpace(message.MESSAGEBCCADDRESS)) {
                tbBCCInfoArea.Visible = false;
            } else {
                lblBccAddr.Text = ReplaceEscape(message.MESSAGEBCCADDRESS);
                lblBccAddr.ToolTip = ReplaceEscape(message.MESSAGEBCCADDRESS);
            }
            var org_htmlBody = message.MESSAGEHTMLBODY;
            var htmlBody = hMailServerProvider.GetHtmlAttachmentFiles(attachments, EnumDef.ConvertLangToEnumLang(lgLang));

            try{
                var inner_attachment = from row in attachments
                                    where !string.IsNullOrWhiteSpace(row.ATTACHMENT_CONTENT_ID)
                                   select row;
                if (inner_attachment.Count() > 0 && (message.PARSETYPE.ToLower() == "cdo" || message.PARSETYPE.ToLower() == "eaget")) {
                    var str_root_path = lgACT.GetMailACTDirectory(PathType.Temp, PathFormatter.FullPhysicalPath, true);
                    var cdo_msg = default(CDO.Message);
                    var eaget_msg = default(EAGetMail.Mail);
                    var freefix = string.Empty;

                    switch (message.PARSETYPE.ToLower()) {
                        case "cdo":
                            if (cdo_msg == null || eaget_msg == null) {
                                cdo_msg = hMailServerProvider.GetCDOMessageByMessageID(cb_args.mid);
                                eaget_msg = hMailServerProvider.GetEAGetMailByMessageID(cb_args.mid);
                            }
                            break;
                        case "eaget":
                            if (eaget_msg == null) {
                                eaget_msg = lgACT.MailServerProvider.GetEAGetMail(cb_args.mid);
                            }
                            break;
                    }

                    foreach (DataRow row in inner_attachment) {
                        switch (message.PARSETYPE.ToLower()) {
                            case "cdo":
                                if (cdo_msg.Attachments.Count < eaget_msg.Attachments.Length) {
                                    var arr_byte = eaget_msg.Attachments[row.Field<byte>("ATTACHMENT_ID")].Content;
                                    Regex rxImages = new Regex("src=[\"'](.+?)" + row["ATTACHMENT_CONTENT_ID"].ToString() + "[\"']", RegexOptions.IgnoreCase & RegexOptions.IgnorePatternWhitespace);
                                    MatchCollection mc = rxImages.Matches(org_htmlBody);
                                    foreach (Match m in mc) {
                                        org_htmlBody = org_htmlBody.Replace(m.Value, "src=\"data:image;base64," + Convert.ToBase64String(arr_byte) + "\"");
                                    }
                                } else {
                                    var path = Path.Combine(Path.Combine(str_root_path, message.MESSAGEID.ToString()), Guid.NewGuid().ToString());
                                    Directory.CreateDirectory(path);
                                    cdo_msg.Attachments[row.Field<byte>("ATTACHMENT_ID") + 1].SaveToFile(path);
                                    var file = System.IO.File.OpenRead(path);
                                    var read = new BinaryReader(file);
                                    Regex rxImages = new Regex("src=[\"'](.+?)" + row["ATTACHMENT_CONTENT_ID"].ToString() + "[\"']", RegexOptions.IgnoreCase & RegexOptions.IgnorePatternWhitespace);
                                    MatchCollection mc = rxImages.Matches(org_htmlBody);
                                    foreach (Match m in mc) {
                                        org_htmlBody = org_htmlBody.Replace(m.Value, "src=\"data:image;base64," + Convert.ToBase64String(read.ReadBytes((int)file.Length)) + "\"");
                                    }
                                    file.Close();
                                }
                                break;
                            case "eaget":
                                var arr_byte1 = eaget_msg.Attachments[row.Field<byte>("ATTACHMENT_ID")].Content;
                                Regex rxImages1 = new Regex("src=[\"'](.+?)" + row["ATTACHMENT_CONTENT_ID"].ToString() + "[\"']", RegexOptions.IgnoreCase & RegexOptions.IgnorePatternWhitespace);
                                MatchCollection mc1 = rxImages1.Matches(org_htmlBody);
                                foreach (Match m in mc1) {
                                    org_htmlBody = org_htmlBody.Replace(m.Value, "src=\"data:image;base64," + Convert.ToBase64String(arr_byte1) + "\"");
                                }
                                break;
                        }
                    }
                }
            } catch { }
            if (string.IsNullOrWhiteSpace(org_htmlBody) == false) {
                htmlBody += hMailServerService.SocketLayer.HtmlHelper.RemoveStyleBlock(hMailServerService.SocketLayer.HtmlHelper.AppendTargetToHtmlLingk(org_htmlBody));
                phBody.Controls.Add(new LiteralControl(htmlBody));
            } else {
                htmlBody += hMailServerService.SocketLayer.HtmlHelper.RemoveStyleBlock(hMailServerService.SocketLayer.HtmlHelper.AppendTargetToHtmlLingk(org_htmlBody.Replace(Environment.NewLine, "<br/>")));
                phBody.Controls.Add(new LiteralControl(htmlBody));
            }
        }

        #endregion

        #region Write

        protected void upcAttachment_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e) {
            var tempFileName = Guid.NewGuid().ToString();
            var physicalFileRootPath = lgACT.GetMailACTDirectory(PathType.Attach, PathFormatter.FullPhysicalPath);
            var physicalFilePath = Path.Combine(physicalFileRootPath, tempFileName);
            var customFileSize = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(e.UploadedFile.ContentLength);
            var fileExtention = Path.GetExtension(e.UploadedFile.FileName).Replace(".", "").ToUpper();

            if (!Directory.Exists(physicalFileRootPath)) {
                Directory.CreateDirectory(physicalFileRootPath);
            }

            //로그인 사용자 개인별 임시폴더에 저장
            e.UploadedFile.SaveAs(physicalFilePath);

            e.CallbackData = JsonConvert.SerializeObject(new {temp_file_name = tempFileName,
                                                                file_name = e.UploadedFile.FileName,
                                                                file_size = e.UploadedFile.ContentLength,
                                                                physical_file_path = physicalFilePath,
                                                                custom_file_size = customFileSize,
                                                                file_extantion = fileExtention,
                                                                content_type = e.UploadedFile.ContentType,
                                                                recent = "Y",
                                                                deleted = "N"});
        }

        protected DataTable GetAttachments(long lMessageID) {
            var dt_datatable = this.GetAttachmentsDataTable();
            if (lMessageID <= 0) {
                return dt_datatable;
            }
            var dr_message = lgACT.MailServerProvider.GetUserMessage(lMessageID);
            var dt_attch = hMailServerProvider.GetAttachments(lMessageID);
            var dt_select_attch = (from row in dt_attch
                            where row.IsATTACHMENT_CONTENT_IDNull() || string.IsNullOrWhiteSpace(row.ATTACHMENT_CONTENT_ID)
                           select row).CopyToDataTable();

            if (dt_select_attch.Rows.Count == 0) {
                return dt_select_attch;
            }

            var str_root_path = lgACT.GetMailACTDirectory(PathType.Attach, PathFormatter.FullPhysicalPath);
            var local_msg = default(Message);
            var cdo_msg = default(CDO.Message);
            var eaget_msg = default(EAGetMail.Mail);

#if !DEBUG
            switch (dr_message.PARSETYPE.ToLower()) {
                case "local":
                    local_msg = lgACT.MailServerProvider.GetAPIMessage(lMessageID);
                    break;
                case "cdo":
                    cdo_msg = hMailServerProvider.GetCDOMessageByMessageID(lMessageID);
                    eaget_msg = hMailServerProvider.GetEAGetMailByMessageID(dr_message);
                    break;
                case "eaget":
                    eaget_msg = lgACT.MailServerProvider.GetEAGetMail(lMessageID);
                    break;
            }
#endif
            foreach (DataRow row in dt_select_attch.Rows) {
                var n_row = dt_datatable.NewRow();
                n_row["temp_file_name"] = Guid.NewGuid();
                n_row["file_name"] = row.Field<string>("ATTACHMENT_FILENAME");
                n_row["file_size"] = row.Field<long>("ATTACHMENT_FILESIZE");
                n_row["upload_type"] = "General";
                n_row["down_period"] = GetResource("CSTRESX00134");
                n_row["custom_file_size"] = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(row.Field<long>("ATTACHMENT_FILESIZE"));
                if (row.Field<string>("ATTACHMENT_FILENAME").Contains(".")) {
                    n_row["file_extantion"] = Path.GetExtension(row.Field<string>("ATTACHMENT_FILENAME")).Replace(".", "").ToUpper();
                } else {
                    n_row["file_extantion"] = GetResource("CSTRESX00135");
                }
                n_row["content_type"] = hMailServerProvider.GetFileType(row.Field<string>("ATTACHMENT_FILENAME"));
                n_row["physical_file_path"] = Path.Combine(str_root_path, n_row["temp_file_name"].ToString());
                n_row["recent"] = "N";
                n_row["deleted"] = "N";
                dt_datatable.Rows.Add(n_row);

#if !DEBUG
                switch (dr_message.PARSETYPE.ToLower()) {
                    case "local":
                        local_msg.Attachments[row.Field<byte>("ATTACHMENT_ID")].SaveAs(n_row.Field<string>("physical_file_path"));
                        break;
                    case "cdo":
                        if (cdo_msg.Attachments.Count < eaget_msg.Attachments.Length) {
                            eaget_msg.Attachments[row.Field<byte>("ATTACHMENT_ID")].SaveAs(n_row.Field<string>("physical_file_path"), true);
                        } else {
                            cdo_msg.Attachments[row.Field<byte>("ATTACHMENT_ID") + 1].SaveToFile(n_row.Field<string>("physical_file_path"));
                        }
                        break;
                    case "eaget":
                        eaget_msg.Attachments[row.Field<byte>("ATTACHMENT_ID")].SaveAs(n_row.Field<string>("physical_file_path"), true);
                        break;
                }
#endif
            }
            return dt_datatable;
        }

        protected DataTable GetAttachmentsDataTable() {
            var attachment = new DataTable();
            attachment.Columns.Add("temp_file_name", typeof(string));
            attachment.Columns.Add("file_name", typeof(string));
            attachment.Columns.Add("file_size", typeof(long));
            attachment.Columns.Add("upload_type", typeof(string));
            attachment.Columns.Add("down_period", typeof(string));
            attachment.Columns.Add("custom_file_size", typeof(string));
            attachment.Columns.Add("file_extantion", typeof(string));
            attachment.Columns.Add("content_type", typeof(string));
            attachment.Columns.Add("physical_file_path", typeof(string));
            attachment.Columns.Add("recent", typeof(string));
            attachment.Columns.Add("deleted", typeof(string));
            return attachment;
        }

        protected void gdvAttachList_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e) {
            if (e.RowType == GridViewRowType.EmptyDataRow) {
                e.Row.Attributes["style"] = "height: 100px";
            }
        }

        protected void gdvAttachList_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            if (string.IsNullOrWhiteSpace(e.Parameters)) {
                gdvAttachList.DataBind();
                return;
            }

            var cb_data = default(DataTable);

            try {
                cb_data = JsonConvert.DeserializeObject<DataTable>(e.Parameters);
            } catch (SystemException ex) {
                gdvAttachList.DataBind();
                return;
            }

            foreach (DataRow row in cb_data.Rows) {
                if (row.Field<string>("deleted") == "Y") {
                    if (System.IO.File.Exists(row.Field<string>("physical_file_path"))) {
                        System.IO.File.Delete(row.Field<string>("physical_file_path"));
                    }
                }
            }

            var filter_rows = from row in cb_data.AsEnumerable()
                             where row["deleted"].ToString() == "N"
                             select row;
            var filter_dt = default(DataTable);
            if (filter_rows.Count() > 0) {
                filter_dt = filter_rows.CopyToDataTable();
            } else {
                filter_dt = null;
            }

            gdvAttachList.DataSource = filter_dt;
            gdvAttachList.DataBind();
        }

        protected class WriteCallBackArgs : BaseCallbackArgs {
            public int mfid { get; set; }
            public long mid { get; set; }
            public string to_addr { get; set; }
            public string cc_addr { get; set; }
            public string bcc_addr { get; set; }
            public DataTable attachments { get; set; }
            public string htmlbody { get; set; }

        }

        private class WriteCallBackResultArgs : BaseCallbackResultArgs {
            public int mfid { get; set; }
            public long mid { get; set; }
            //public long parent_mid { get; set; }
            public DataTable dt_to_addr { get; set; }
            public DataTable dt_cc_addr { get; set; }
            public DataTable dt_bcc_addr { get; set; }
            public DataTable attachments { get; set; }
            public bool important { get; set; }
            public string subject { get; set; }
            public string htmlbody { get; set; }
        }
        private DataTable GetAddressTable(string addr) {
            var str_to_addr = hMailServerService.SocketLayer.StringFormat.StandardMailAddressFormat(addr).Split(',');

            var dt = new DataTable();
            dt.Columns.Add("name", typeof(string));
            dt.Columns.Add("address", typeof(string));
            dt.Columns.Add("mail_address", typeof(string));

            var row = default(DataRow);
            foreach (var row_addr in str_to_addr) {
                row = dt.NewRow();
                var oAddr = new MailAddress(row_addr);
                row["name"] = oAddr.DisplayName;
                row["address"] = oAddr.Address;
                row["mail_address"] = oAddr.ToString().Replace("\"", "");
                dt.Rows.Add(row);
            }

            return dt;
        }
        protected void cbWriteProcess_Callback(object source, CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs<WriteCallBackResultArgs>();

            var cb_args = default(WriteCallBackArgs);

            try {
                cb_args = WriteCallBackArgs.GetDeserialize<WriteCallBackArgs>(e.Parameter);

                if (cb_args == null) {
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                } else {
                    cb_r_args.Bind(cb_args);
                    cb_r_args.mfid = cb_args.mfid;
                    cb_r_args.mid = cb_args.mid;
                }
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
            }

            if (cb_r_args.InnerException != null) {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                if (cb_args.Cmd == "send") {
                    var oMessageData = default(MessageData);
                    var str_mv = HiddenFields["mv"].ToString();
                    if (str_mv == "re" || str_mv == "reall" || str_mv == "fwd") {
                        oMessageData = new MessageData(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode,
                                                    new FromAddress(lgACT.Name, lgACT.MailAddress), long.Parse(this.HiddenFields["parent_mid"].ToString()), lgHostInfo.UserHostAddress);
                    } else {
                        oMessageData = new MessageData(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode,
                                                    new FromAddress(lgACT.Name, lgACT.MailAddress), lgHostInfo.UserHostAddress);
                    }

                    oMessageData.Lang = cboLang.Value.ToString();

                    switch (str_mv) {
                        case "tmp":
                        case "new":
                            oMessageData.Command = SendCommand.New; break;
                        case "newme":
                            oMessageData.Command = SendCommand.NewMe; break;
                        case "re":
                            oMessageData.Command = SendCommand.Re; break;
                        case "reall":
                            oMessageData.Command = SendCommand.ReAll; break;
                        case "fwd":
                            oMessageData.Command = SendCommand.Fwd; break;
                    }
                    if (oMessageData.Command != SendCommand.NewMe) {
                        oMessageData.ToRecipients.Add(ReplaceEscape(cb_args.to_addr));
                        if (string.IsNullOrWhiteSpace(cb_args.cc_addr) == false) {
                            oMessageData.CCRecipients.Add(ReplaceEscape(cb_args.cc_addr));
                        }
                        if (string.IsNullOrWhiteSpace(cb_args.bcc_addr) == false) {
                            oMessageData.BCCRecipients.Add(ReplaceEscape(cb_args.bcc_addr));
                        }
                    }
                    if (cb_args.attachments != null && cb_args.attachments.Rows.Count > 0) {
                        foreach (DataRow row in cb_args.attachments.Rows) {
                            oMessageData.Attachments.Add(row["file_name"].ToString(),
                                                        row["temp_file_name"].ToString(),
                                                        (row["upload_type"].ToString().ToLower() == "general" ? AttachFileType.GeneralFile : AttachFileType.PeriodFile),
                                                        row["physical_file_path"].ToString());
                        }
                    }
                    oMessageData.IsIndividul    = chkIndividul.Checked;
                    oMessageData.Notice         = chkNotice.Checked;
                    oMessageData.Importance     = chkImportant.Checked;
                    oMessageData.Subject        = txtSubject.Text;
                    oMessageData.HTMLBody       = cb_args.htmlbody;
                    Global.SendToMailServerService(oMessageData);

                    //임시 보관함 메세지면 삭제
                    if (this.HiddenFields.Contains("tmp_mid") && !string.IsNullOrWhiteSpace(this.HiddenFields["tmp_mid"].ToString()) && long.Parse(this.HiddenFields["tmp_mid"].ToString()) > 0) {
                        var msgID = long.Parse(this.HiddenFields["tmp_mid"].ToString());
                        var str_temp_box = hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TempBox, Global.hMailServerLang);
                        lgACT.MailServerProvider.GetAPIIMAPFolderByFolderName(str_temp_box).Messages.DeleteByDBID(msgID);
                    }
                } else if (cb_args.Cmd == "save_tmp") {
                    var obj_imap_folder = default(IMAPFolder);
                    var obj_message = default(Message);

                    if (cb_args.mid != 0) {
                        obj_message = lgACT.MailServerProvider.GetAPIMessage(cb_args.mid);
                    } else {
                        var str_temp_box = hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TempBox, Global.hMailServerLang);
                        obj_imap_folder = lgACT.MailServerProvider.GetAPIIMAPFolderByFolderName(str_temp_box);
                        obj_message = obj_imap_folder.Messages.Add();
                    }

                    if (cb_args.mid == 0) {
                        obj_message.Charset = "UTF-8";
                        obj_message.Flag[eMessageFlag.eMFRecent] = false;
                        obj_message.Flag[eMessageFlag.eMFSeen] = true;
                    }
                    
                    if (chkImportant.Checked) {
                        obj_message.HeaderValue["Importance"] = "high";
                    }

                    //임시저장함의 파일 보관로직 필요
                    //if (cb_args.attachments.Rows.Count > 0) {
                    //    foreach(DataRow row in cb_args.attachments.Rows){
                    //        if ()
                    //        obj_message.Attachments.Add()
                    //    }
                    //}


                    if (cb_args.mid == 0) {
                        obj_message.From = string.Format("{0} <{1}>", lgACT.Name, lgACT.MailAddress);
                    }
                    if (!string.IsNullOrWhiteSpace(cb_args.to_addr)) obj_message.HeaderValue["To"] = ReplaceEscape(cb_args.to_addr);
                    if (!string.IsNullOrWhiteSpace(cb_args.cc_addr)) obj_message.HeaderValue["CC"] = ReplaceEscape(cb_args.cc_addr);
                    if (!string.IsNullOrWhiteSpace(cb_args.bcc_addr)) obj_message.HeaderValue["BCC"] = ReplaceEscape(cb_args.bcc_addr);
                    if (cb_args.mid == 0) {
                        obj_message.HeaderValue["X-Groupware-Temp"] = "YES";
                    }
                    obj_message.Subject = txtSubject.Text;
                    obj_message.HTMLBody = cb_args.htmlbody;
                    obj_message.Save();

                    cb_r_args.mfid = obj_imap_folder == null ? cb_args.mfid : obj_imap_folder.ID;
                    cb_r_args.mid = obj_message.ID;
                } else {
                    var draftMail = lgACT.MailServerProvider.GetUserMessageDetail(cb_args.mid);

                    //받는사람, 참조자, 숨은 참조자 설정
                    switch (cb_args.Cmd) {
                        case "re":
                            try {
                                //받는사람 리스트 설정
                                cb_r_args.dt_to_addr = this.GetAddressTable(ReplaceEscape(draftMail.MESSAGEFROMADDRESS));
                            } catch (System.Exception ex) {
                                throw new SystemException("받는사람의 메일주소를 지정하는데 오류가 발생하였습니다.");
                            }
                            break;
                        case "reall":
                            try {
                                cb_r_args.dt_to_addr = this.GetAddressTable(ReplaceEscape(draftMail.MESSAGEFROMADDRESS));
                                cb_r_args.dt_to_addr.Merge(GetAddressTable(ReplaceEscape(draftMail.MESSAGETOADDRESS)));
                            } catch (System.Exception ex) {
                                throw new SystemException("받는사람의 메일주소를 지정하는데 오류가 발생하였습니다.");
                            }

                            try {
                                //참조자 리스트 설정
                                if (string.IsNullOrWhiteSpace(draftMail.MESSAGECCADDRESS) == false) {
                                    cb_r_args.dt_cc_addr = this.GetAddressTable(ReplaceEscape(draftMail.MESSAGECCADDRESS));
                                }
                            } catch (System.Exception ex) {
                                throw new SystemException("참조자의 메일주소를 지정하는데 오류가 발생하였습니다.");
                            }

                            try {
                                //숨은 참조자 리스트 설정
                                if (string.IsNullOrWhiteSpace(draftMail.MESSAGEBCCADDRESS) == false) {
                                    cb_r_args.dt_bcc_addr = this.GetAddressTable(ReplaceEscape(draftMail.MESSAGEBCCADDRESS));
                                }
                            } catch (System.Exception ex) {
                                throw new ExceptionManager("숨은 참조자의 메일주소를 지정하는데 오류가 발생하였습니다.", ex);
                            }
                            break;
                        case "fwd":
                            break;
                        case "tmp":
                            try {
                                //받는사람 리스트 설정
                                if (string.IsNullOrWhiteSpace(draftMail.MESSAGETOADDRESS) == false && draftMail.MESSAGETOADDRESS != GetResource("CSTRESX00136")) {
                                    var strToAddressList = hMailServerService.SocketLayer.StringFormat.StandardMailAddressFormat(ReplaceEscape(draftMail.MESSAGETOADDRESS));
                                    if (string.IsNullOrWhiteSpace(strToAddressList) == false) {
                                        cb_r_args.dt_to_addr = this.GetAddressTable(strToAddressList);
                                    }
                                }
                            } catch (System.Exception ex) {
                                throw new ExceptionManager("받는사람의 메일주소를 지정하는데 오류가 발생하였습니다.", ex);
                            }

                            try {
                                //참조자 리스트 설정
                                if (string.IsNullOrWhiteSpace(draftMail.MESSAGECCADDRESS) == false && draftMail.MESSAGETOADDRESS != GetResource("CSTRESX00137")) {
                                    var strCcAddressList = hMailServerService.SocketLayer.StringFormat.StandardMailAddressFormat(ReplaceEscape(draftMail.MESSAGECCADDRESS));
                                    if (string.IsNullOrWhiteSpace(strCcAddressList) == false) {
                                        cb_r_args.dt_cc_addr = this.GetAddressTable(strCcAddressList);
                                    }
                                }
                            } catch (System.Exception ex) {
                                throw new ExceptionManager("참조자의 메일주소를 지정하는데 오류가 발생하였습니다.", ex);
                            }

                            try {
                                //숨은 참조자 리스트 설정
                                if (string.IsNullOrWhiteSpace(draftMail.MESSAGEBCCADDRESS) == false && draftMail.MESSAGETOADDRESS != GetResource("CSTRESX00138")) {
                                    var strBccAddressList = hMailServerService.SocketLayer.StringFormat.StandardMailAddressFormat(ReplaceEscape(draftMail.MESSAGEBCCADDRESS));
                                    if (string.IsNullOrWhiteSpace(strBccAddressList) == false) {
                                        cb_r_args.dt_bcc_addr = this.GetAddressTable(strBccAddressList);
                                    }
                                }
                            } catch (System.Exception ex) {
                                throw new ExceptionManager("숨은 참조자의 메일주소를 지정하는데 오류가 발생하였습니다.", ex);
                            }
                            break;
                    }

                    //중요 메일 플레그 지정
                    cb_r_args.important = (draftMail.IMPORTANCE.ToLower() == "high" ? true : false);

                    switch (cb_args.Cmd) {
                        case "re":
                            cb_r_args.subject = string.Format(GetResource("CSTRESX00139"), draftMail.MESSAGESUBJECT);
                            break;
                        case "reall":
                            cb_r_args.subject = string.Format(GetResource("CSTRESX00140"), draftMail.MESSAGESUBJECT);
                            break;
                        case "fwd":
                            cb_r_args.subject = string.Format(GetResource("CSTRESX00141"), draftMail.MESSAGESUBJECT);
                            break;
                        case "tmp":
                            if (string.IsNullOrWhiteSpace(draftMail.MESSAGESUBJECT) == false && draftMail.MESSAGESUBJECT != GetResource("CSTRESX00142")) {
                                cb_r_args.subject = Title = draftMail.MESSAGESUBJECT;
                            }
                            break;
                        default:
                            break;
                    }

                    if (cb_args.Cmd == "re" || cb_args.Cmd == "reall" || cb_args.Cmd == "fwd") {
                        var sbReBody = new StringBuilder();
                        sbReBody.Append("<p>&nbsp;</p><p>&nbsp;</p>");
                        sbReBody.AppendLine("<blockquote style=\"padding: 0 0 0 5px; margin: 0 0 0 5px;\">");
                        sbReBody.AppendLine("<div style=\"border-top:2px solid #bdc8db; padding: 3px 0 0 2px;\">");
                        sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">From : </strong>{0}<br/>", hMailServerService.SocketLayer.StringFormat.LinkTypeMailAddressFormat(draftMail.MESSAGEFROMADDRESS, true)));
                        sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">Date : </strong>{0}<br/>", draftMail.MESSAGEDATE.ToString(CommonVariable.CDT_YY_MM_DD_DDD_HH_MM_SS)));
                        if (string.IsNullOrWhiteSpace(draftMail.MESSAGETOADDRESS) == false) {
                            sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">To:</strong>{0}<br/>", hMailServerService.SocketLayer.StringFormat.LinkTypeMailAddressFormat(draftMail.MESSAGETOADDRESS, true)));
                        }
                        if (string.IsNullOrWhiteSpace(draftMail.MESSAGECCADDRESS) == false) {
                            sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">Cc : </strong>{0}<br/>", hMailServerService.SocketLayer.StringFormat.LinkTypeMailAddressFormat(draftMail.MESSAGECCADDRESS, true)));
                        }
                        if (string.IsNullOrWhiteSpace(draftMail.MESSAGEBCCADDRESS) == false) {
                            sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">Bcc : </strong>{0}<br/>", hMailServerService.SocketLayer.StringFormat.LinkTypeMailAddressFormat(draftMail.MESSAGEBCCADDRESS, true)));
                        }
                        sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">Subject : </strong>{0}<br/>", draftMail.MESSAGESUBJECT));
                        sbReBody.Append("</div><p>&nbsp;</p>");
                        if (string.IsNullOrWhiteSpace(draftMail.MESSAGEHTMLBODY) == false) {
                            sbReBody.Append(draftMail.MESSAGEHTMLBODY);
                        } else {
                            sbReBody.Append(draftMail.MESSAGEBODY);
                        }
                        sbReBody.Append("<p>&nbsp;</p>");
                        sbReBody.AppendLine("</blockquote>");

                        cb_r_args.htmlbody = sbReBody.ToString();
                    } else if (cb_args.Cmd == "tmp") {
                        if (string.IsNullOrWhiteSpace(draftMail.MESSAGEHTMLBODY) == false) {
                            cb_r_args.htmlbody = draftMail.MESSAGEHTMLBODY;
                        } else {
                            cb_r_args.htmlbody = draftMail.MESSAGEBODY;
                        }
                    }
                    if ((cb_args.Cmd == "fwd" || cb_args.Cmd == "tmp") && draftMail.ATTACHFILECOUNT > 0) {
                        var dt_attachments = this.GetAttachments(cb_args.mid);
                        cb_r_args.attachments = dt_attachments;
                    }
                }
            } catch (System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }
        #endregion

        #region CallbackProcess

        protected class CustomCallBackArgs : BaseCallbackArgs {
            public DataTable MultiData { get; set; }
            public new int Data { get; set; }
            public long mid { get; set; }
        }
        private class CustomCallBackResultArgs : BaseCallbackResultArgs {
            public int mfid { get; set; }
            public string mfnm { get; set; }
        }

        protected void cbProcess_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs<CustomCallBackResultArgs>();

            var cb_args = default(CustomCallBackArgs);

            try {
                cb_args = CustomCallBackArgs.GetDeserialize<CustomCallBackArgs>(e.Parameter);

                if (cb_args == null) {
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                } else {
                    cb_r_args.Bind(cb_args);
                }
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
            }

            if (cb_r_args.InnerException != null) {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                var strSql = new StringBuilder();
                switch (cb_args.Cmd.ToLower()) {
                    case "list":
                        var strMsgIDs = string.Empty;
                        switch (cb_args.CmdDetail.ToLower()) {
                            case "read_state": //읽은 상태 변경
                                foreach (DataRow row in cb_args.MultiData.Rows) {
                                    var mfid = int.Parse(row["mfid"].ToString());
                                    var mid = long.Parse(row["mid"].ToString());
                                    var rowData = cb_args.Data;
                                    strMsgIDs += string.Format("{0},", mid);
                                }
                                if (string.IsNullOrWhiteSpace(strMsgIDs) == false) {
                                    var aParams = new SqlParameter[] {
                                        new SqlParameter("@ACCOUNT_ID", lgACT.AccountId), 
                                        new SqlParameter("@STR_IDS", strMsgIDs.Substring(0, strMsgIDs.LastIndexOf(','))),
                                        new SqlParameter("@FLAG", cb_args.Data == 0 ? -1 : 1)
                                    };
                                    lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_CHANGE_MESSAGES_FLAGS", aParams);
                                    Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                }
                                break;
                            case "add_spam": //스펨추가
                                break;
                            case "flagged": //중요 표시
                                if (cb_args.MultiData.Rows.Count > 0) {
                                    var row = cb_args.MultiData.Rows[0];
                                    var mid = long.Parse(row["mid"].ToString());
                                    var aParams = new SqlParameter[] {
                                        new SqlParameter("@ACCOUNT_ID", lgACT.AccountId), 
                                        new SqlParameter("@STR_IDS", mid),
                                        new SqlParameter("@FLAG", cb_args.Data == 0 ? (int)eMessageFlag.eMFFlagged * -1 : (int)eMessageFlag.eMFFlagged)
                                    };
                                    lgDbAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "USP_MAIL_CHANGE_MESSAGES_FLAGS", aParams);
                                    Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                }
                                break;
                            default: break;
                        }
                        break;
                    case "read":
                        var apiMessage = lgACT.MailServerProvider.GetAPIMessage(cb_args.mid);
                        switch (cb_args.CmdDetail.ToLower()) {
                            case "read_state":
                                if (cb_args.Data == 0) {
                                    apiMessage.set_Flag(eMessageFlag.eMFSeen, false);
                                } else {
                                    apiMessage.set_Flag(eMessageFlag.eMFSeen, true);
                                }
                                apiMessage.Save();
                                Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                break;
                            case "flagged":
                                if (cb_args.Data == 0) {
                                    apiMessage.set_Flag(eMessageFlag.eMFFlagged, false);
                                } else {
                                    apiMessage.set_Flag(eMessageFlag.eMFFlagged, true);
                                }
                                apiMessage.Save();
                                Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                                break;
                        }
                        break;
                    case "empty": //메일함 비우기
                        if (cb_args.Data == 0) {
                            return;
                        }
                        strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                        strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                        strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                        strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", cb_args.Data));
                        strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                        this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                        break;
                    case "flaged_read": //읽음으로 변경
                        if (cb_args.Data == 0) {
                            return;
                        }
                        strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 1 ");
                        strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                        strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                        strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", cb_args.Data));
                        strSql.AppendLine(" AND MESSAGEFLAGS & 1 != 1 ");
                        strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                        this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                        Global.SendToMailServerService(new RefreshAccountCach(Global.gMailServerServiceLoginName, Global.gMailServerServiceLicenseCode, lgACT.AccountId));
                        break;
                    case "flaged_read_delete": //읽은 메일 삭제
                        if (cb_args.Data == 0) {
                            return;
                        }
                        strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                        strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                        strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                        strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", cb_args.Data));
                        strSql.AppendLine(" AND MESSAGEFLAGS & 1 = 1 ");
                        strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                        this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                        break;
                    case "flaged_unread_delete": //읽지 않은 메일 삭제
                        if (cb_args.Data == 0) {
                            return;
                        }
                        strSql.AppendLine(" UPDATE A SET MESSAGEFLAGS = MESSAGEFLAGS + 2 ");
                        strSql.AppendLine(" FROM hMailServer..HM_MESSAGES A");
                        strSql.AppendLine(string.Format(" WHERE MESSAGEACCOUNTID = {0}", lgACT.AccountId));
                        strSql.AppendLine(string.Format(" AND MESSAGEFOLDERID = {0}", cb_args.Data));
                        strSql.AppendLine(" AND MESSAGEFLAGS & 1 != 1 ");
                        strSql.AppendLine(" AND MESSAGEFLAGS & 2 != 2 ");
                        this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                        break;
                }
            } catch (System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }
        #endregion

        #endregion

        #region ■■ 5.2.2 User-defined function group


        void LoadSystemIMAPFolders() {
            var dt = this._IMAPFolders.Where(folder => folder.FOLDERTYPE == 'S' && folder.FOLDERSECTION == 'D').OrderBy(key => key.SEQ_NO);
            this.rtSystemIMAPFolders.DataSource = dt;
            this.rtSystemIMAPFolders.DataBind();
        }

        void LoadMyIMAPFolers() {
            var dt = this._IMAPFolders.Where(folder => folder.FOLDERTYPE == 'U' && folder.FOLDERSECTION == 'D').OrderBy(key => key.SEQ_NO);
            if (dt.Count() != 0) {
                this.rtMyIMAPFolders.DataSource = dt;
                this.rtMyIMAPFolders.DataBind();
            } else {
                my_folder.Visible = false;
            }
        }

        void LoadTailIMAPFolders() {
            var dt = this._IMAPFolders.Where(folder => folder.FOLDERTYPE == 'S' && folder.FOLDERSECTION == 'M').OrderBy(key => key.SEQ_NO);
            this.rtTailIMAPFolders.DataSource = dt;
            this.rtTailIMAPFolders.DataBind();
        }

        //private class MailMenuCallBackArgs {
        //    public CommandType Command { get; set; }
        //}
        //protected enum CommandType : int {
        //    Query = 1,
        //    RemoveEmpty = 5
        //}


        protected string ReplaceEscape(string strInput) {
            strInput = strInput.Replace("（", "(");
            strInput = strInput.Replace("）", ")");

            return strInput;
        }

        protected string GetSe2LangPath() {
            switch(lgLang){
                default:
                case "KO": return "ko_KR";
                case "EN": return "en_US";
                case "CN": return "zh_CN";
                case "JP": return "ja_JP";
            }
        }

        protected string GetIMAPFolderCssClassName(string sFolderName) {
            var retCssNm = "Icon2 ";

            var folder = hMailServerProvider.GetGlobalIMAPFolder(sFolderName);
            
            switch (folder) {
                case hMailServerService.IMAPFolders.Inbox: retCssNm += "InBox"; break;
                case hMailServerService.IMAPFolders.InboxMe: retCssNm += "MyBox"; break;
                case hMailServerService.IMAPFolders.ExternalBox: retCssNm += "ExternalBox"; break;
                case hMailServerService.IMAPFolders.SentBox: retCssNm += "SendBox"; break;
                case hMailServerService.IMAPFolders.TempBox: retCssNm += "TempBox"; break;
                case hMailServerService.IMAPFolders.LongTermBox: retCssNm += "KeepBox"; break;
                case hMailServerService.IMAPFolders.TrashBox: retCssNm += "DeletedBox"; break;
                case hMailServerService.IMAPFolders.ReservationBox: retCssNm += "SendReserveBox"; break;
                case hMailServerService.IMAPFolders.SpamBox: retCssNm += "SpamBox"; break;
                case hMailServerService.IMAPFolders.JunkBox: retCssNm += "JunkBox"; break;
                default: retCssNm += "BoxAll"; break;
            }

            return retCssNm;
        }

        #endregion
        
        #endregion

        #endregion
    }
}