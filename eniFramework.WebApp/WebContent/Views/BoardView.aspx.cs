
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

using DevExpress.Web;
using hMailServerService;
using hMailServerService.SocketLayer;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Json.Linq;
using eniFramework.Exception;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common;
using eniFramework.Date;
//using eniFramework.SharpZipLib.Zip;
using eniFramework.DataAccess;
using eniFramework.DataAccess.Linq;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Common.JsonArgs;

#endregion

namespace eniFramework.WebApp.Modules {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class BoardView : BaseUIACTPage {
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

        public string sccd = string.Empty;
        public string scnm = string.Empty;
        protected long bbs_id = -1;
        string str_mv = string.Empty;
        string str_prov_mv = string.Empty;
        DataTable categorys = null;

        #endregion

        #region ■ 1.4 Class Global properties

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "BoardView"; } }
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

        public BoardView()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
            //splViewLayout.GetPaneByName("panRigthView").ContentUrl = string.Format("~/board/list/{0}", HiddenFields["categoryCD"]) + "?" + Request.QueryString.ToString();
        }

        protected override void OnWebUIPageLoadComplete() {
        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRoutingParams(RouteData pRoute) {
            if (this.HiddenFields.Contains("sccd")) {
                this.sccd = this.HiddenFields["sccd"].ToString();
                this.scnm = this.HiddenFields["scnm"].ToString();
            } else {
                this.sccd = pRoute.GetRequiredString("cid");
                this.HiddenFields.Add("sccd", this.sccd);
            }
        }

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {
            if (this.HiddenFields.Contains("mv")) {
                this.str_mv = this.HiddenFields["mv"].ToString().ToLower();
            } else {
                if (pQueryString["mv"] != null) {
                    this.str_mv = pQueryString["mv"].ToString();
                } else {
                    this.str_mv = "list";
                }
            }
            this.str_prov_mv = this.HiddenFields.Contains("prov_mv") ? this.HiddenFields["prov_mv"].ToString().ToLower() : string.Empty;
        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            if (!IsCallback && !IsPostBack && lgLang != "KO") {
                btnWrite.Text = GetResource("CSTRESX00025");
                btnWrite.ToolTip = GetResource("CSTRESX00026");
                //popmMoreMenu

                //popmListMenu

                btnBrowser.Text = GetResource("CSTRESX00002");
                btnBrowser.ToolTip = GetResource("CSTRESX00003");
                txtSearchText.NullText = GetResource("CSTRESX00004");
                btnSearch.Text = GetResource("CSTRESX00005");
                btnSearch.ToolTip = GetResource("CSTRESX00006");

                mnToolbar.Items[0].Text = GetResource("CSTRESX00007");
                mnToolbar.Items[0].ToolTip = GetResource("CSTRESX00008");
                mnToolbar.Items[1].Text = GetResource("CSTRESX00009");
                mnToolbar.Items[1].ToolTip = GetResource("CSTRESX00010");
                mnToolbar.Items[2].Text = GetResource("CSTRESX00011");
                mnToolbar.Items[2].ToolTip = GetResource("CSTRESX00012");
                mnToolbar.Items[3].Text = GetResource("CSTRESX00013");
                mnToolbar.Items[3].ToolTip = GetResource("CSTRESX00014");
                mnToolbar.Items[4].Text = GetResource("CSTRESX00015");
                mnToolbar.Items[4].ToolTip = GetResource("CSTRESX00016");
                mnToolbar.Items[5].Text = GetResource("CSTRESX00017");
                mnToolbar.Items[5].ToolTip = GetResource("CSTRESX00018");
                mnToolbar.Items[6].Text = GetResource("CSTRESX00019");
                mnToolbar.Items[6].ToolTip = GetResource("CSTRESX00020");
                mnToolbar.Items[7].Text = GetResource("CSTRESX00021");
                mnToolbar.Items[7].ToolTip = GetResource("CSTRESX00022");
                mnToolbar.Items[8].Text = GetResource("CSTRESX00023");
                mnToolbar.Items[8].ToolTip = GetResource("CSTRESX00024");
                mnToolbar.Items[9].Text = GetResource("CSTRESX00025");
                mnToolbar.Items[9].ToolTip = GetResource("CSTRESX00026");

                //읽기
                hlPrint.Text = GetResource("CSTRESX00104");
                hlPrint.ToolTip = GetResource("CSTRESX00105");
                //읽기 팝업의 서버 컨트롤 내의 언어변경 못함

                //글쓰기
                cboCategory.NullText = GetResource("CSTRESX00039");
                cboCategory.ToolTip = GetResource("CSTRESX00040");
                cboCategoryGroup.NullText = GetResource("CSTRESX00041");
                cboCategoryGroup.ToolTip = GetResource("CSTRESX00042");
                cboPreface.NullText = GetResource("CSTRESX00043");
                cboPreface.ToolTip = GetResource("CSTRESX00044");
                chkIsNotice.Text = GetResource("CSTRESX00045");
                chkIsNotice.ToolTip = GetResource("CSTRESX00046");
                txtSubject.NullText = GetResource("CSTRESX00048");
                txtSubject.ToolTip = GetResource("CSTRESX00049");
                colSubject.CancelButtonText = GetResource("CSTRESX00050");
                colSubject.OkButtonText = GetResource("CSTRESX00051");
                colSubject.CustomColorButtonText = GetResource("CSTRESX00052");
                colSubject.ToolTip = GetResource("CSTRESX00053");
                chkUseBold.Text = GetResource("CSTRESX00054");
                chkUseBold.ToolTip = GetResource("CSTRESX00055");

                btnAttachFromWebHard.Text = GetResource("CSTRESX00058");
                btnAttachFromWebHard.ToolTip = GetResource("CSTRESX00059");
                btnAttachFileDel.Text = GetResource("CSTRESX00060");
                btnAttachFileDel.ToolTip = GetResource("CSTRESX00061");

                txtTags.NullText = GetResource("CSTRESX00071");
                txtTags.HelpText = GetResource("CSTRESX00072");
                rdolPublicSetting.Items[0].Text = GetResource("CSTRESX00074");
                rdolPublicSetting.Items[1].Text = GetResource("CSTRESX00075");
                chkIsPublicBizArea.Text = GetResource("CSTRESX00076");
                chkIsPublicBizArea.ToolTip = GetResource("CSTRESX00077");
                chkIsPublicPlant.Text = GetResource("CSTRESX00078");
                chkIsPublicPlant.ToolTip = GetResource("CSTRESX00079");
                chkIsPublicDept.Text = GetResource("CSTRESX00080");
                chkIsPublicDept.ToolTip = GetResource("CSTRESX00081");
                chkIsWorkPlace.Text = GetResource("CSTRESX00082");
                chkIsWorkPlace.ToolTip = GetResource("CSTRESX00083");
                chkIsLocalPartner.Text = GetResource("CSTRESX00084");
                chkIsLocalPartner.ToolTip = GetResource("CSTRESX00085");
                chkIsCustomer.Text = GetResource("CSTRESX00086");
                chkIsCustomer.ToolTip = GetResource("CSTRESX00087");
                chkIsExternalPartner.Text = GetResource("CSTRESX00088");
                chkIsExternalPartner.ToolTip = GetResource("CSTRESX00089");
                chkIsSearch.Text = GetResource("CSTRESX00093");
                chkIsSearch.ToolTip = GetResource("CSTRESX00094");
            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.popWrite.IsCallback && lgLang != "KO")) {
                upcAttachment.AdvancedModeSettings.TemporaryFolder = lgACT.GetBoardACTDirectory(PathType.Temp, PathFormatter.FullPhysicalPath, HiddenFields["sccd"].ToString(), lgACT.DeptCode);
                upcAttachment.BrowseButton.Text = GetResource("CSTRESX00130");
                upcAttachment.ValidationSettings.GeneralErrorText = GetResource("CSTRESX00096");
                upcAttachment.ValidationSettings.MultiSelectionErrorText = GetResource("CSTRESX00097");
                upcAttachment.ValidationSettings.MaxFileSizeErrorText = GetResource("CSTRESX00098");
                upcAttachment.ValidationSettings.NotAllowedFileExtensionErrorText = GetResource("CSTRESX00099");
            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.gdvAttachList.IsCallback && lgLang != "KO")) {
                gdvAttachList.SettingsText.EmptyDataRow = GetResource("CSTRESX00062");
                gdvAttachList.Columns["ALLSELECT"].ToolTip = GetResource("CSTRESX00063");
                gdvAttachList.Columns["file_name"].Caption = GetResource("CSTRESX00064");
                gdvAttachList.Columns["file_name"].ToolTip = GetResource("CSTRESX00065");
                gdvAttachList.Columns["file_extantion"].Caption = GetResource("CSTRESX00066");
                gdvAttachList.Columns["file_extantion"].ToolTip = GetResource("CSTRESX00067");
                gdvAttachList.Columns["custom_file_size"].Caption = GetResource("CSTRESX00068");
                gdvAttachList.Columns["custom_file_size"].ToolTip = GetResource("CSTRESX00069");
            }

            if ((!IsCallback && !IsPostBack && lgLang != "KO") || (this.trlList.IsCallback && this.lgLang != "KO")) {
                trlList.Columns["NO"].ToolTip = GetResource("CSTRESX00027");
                trlList.Columns["SUBJECT"].Caption = GetResource("CSTRESX00028");
                trlList.Columns["SUBJECT"].ToolTip = GetResource("CSTRESX00029");
                trlList.Columns["WRITE_USER_ID"].Caption = GetResource("CSTRESX00030");
                trlList.Columns["WRITE_USER_ID"].ToolTip = GetResource("CSTRESX00031");
                trlList.Columns["DATE"].Caption = GetResource("CSTRESX00032");
                trlList.Columns["DATE"].ToolTip = GetResource("CSTRESX00033");
                trlList.Columns["VISIT"].Caption = GetResource("CSTRESX00034");
                trlList.Columns["VISIT"].ToolTip = GetResource("CSTRESX00035");
                trlList.Columns["RECOMMEND"].Caption = GetResource("CSTRESX00036");
                trlList.Columns["RECOMMEND"].ToolTip = GetResource("CSTRESX00037");
            }
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine("SELECT DISTINCT D.MENU_ID CATEGORY_CD,");
            this.lgStrSql.AppendLine("		D.PARENT_MENU_ID PARENT_CATEGORY_CD,");
            this.lgStrSql.AppendLine("		D.MENU_SEQ CATEGORY_SEQ,");
            this.lgStrSql.AppendLine(string.Format("		D.MENU_NM_{0} CATEGORY_NM,", this.lgLang));
            this.lgStrSql.AppendLine(string.Format("		D.MENU_DES_{0} CATEGORY_DES,", this.lgLang));
            this.lgStrSql.AppendLine("		ISNULL(F.RECENT_CNT, 0) RECENT_CNT,");
            this.lgStrSql.AppendLine("		D.MENU_TYPE CATEGORY_TYPE,");
            this.lgStrSql.AppendLine("		D.MENU_LVL CATEGORY_LVL,");
            this.lgStrSql.AppendLine("		ISNULL(E.SYSTEM_BBS, 'N') SYSTEM_BBS");
            this.lgStrSql.AppendLine("FROM S_USR_MST_S_USR_ROLE_ASSO A (NOLOCK)");
            this.lgStrSql.AppendLine("LEFT JOIN S_USR_ROLE B (NOLOCK) ON(A.USR_ROLE_ID = B.USR_ROLE_ID)");
            this.lgStrSql.AppendLine("LEFT JOIN S_USR_ROLE_S_USR_MENU_ASSO C (NOLOCK) ON(B.USR_ROLE_ID = C.USR_ROLE_ID)");
            this.lgStrSql.AppendLine("INNER JOIN S_USR_MENU D (NOLOCK) ON(C.MENU_ID = D.MENU_ID AND D.MENU_GROUP = 'BOARD' AND D.USE_YN = 'Y')");
            this.lgStrSql.AppendLine("LEFT JOIN S_BBS_MST E (NOLOCK) ON(D.MENU_ID = E.CATEGORY_CD)");
            this.lgStrSql.AppendLine("LEFT JOIN (SELECT CATEGORY_CD,");
            this.lgStrSql.AppendLine("				CATEGORY_GROUP_CD,");
            this.lgStrSql.AppendLine("				COUNT(*) RECENT_CNT");
            this.lgStrSql.AppendLine("			FROM B_BBS (NOLOCK)");
            this.lgStrSql.AppendLine("			WHERE CONVERT(VARCHAR(10), DATE, 121) = CONVERT(VARCHAR(10), GETDATE(), 121)");
            this.lgStrSql.AppendLine("			AND DELETED_YN = 'N'");
            this.lgStrSql.AppendLine(string.Format("			GROUP BY CATEGORY_CD, CATEGORY_GROUP_CD) F ON(D.MENU_ID = F.CATEGORY_CD AND ISNULL(F.CATEGORY_GROUP_CD, {0}) = {0})", Data.FilterVariable(lgACT.DeptCode)));
            this.lgStrSql.AppendLine(string.Format("WHERE A.USR_ID = {0}", Data.FilterVariable(this.lgACT.UserId)));
            this.lgStrSql.AppendLine("			AND D.MENU_ID != 'bbs_all'"); //임시

            categorys = this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];

            this.LoadSystemCategorys(categorys);
            this.LoadOtherCategorys(categorys);

            if (string.IsNullOrWhiteSpace(this.sccd) && string.IsNullOrWhiteSpace(this.scnm)) {
                var first_category_row = categorys.Rows[0];
                this.sccd = first_category_row.Field<string>("CATEGORY_CD");
                this.scnm = first_category_row.Field<string>("CATEGORY_NM");
            } else {
                if (!string.IsNullOrWhiteSpace(this.sccd)) {
                    this.scnm = categorys.Select(string.Format("CATEGORY_CD = {0}", Data.FilterVariable(this.sccd))).First().Field<string>("CATEGORY_NM");
                } else {
                    this.sccd = categorys.Select(string.Format("CATEGORY_NM = {0}", Data.FilterVariable(this.scnm))).First().Field<string>("CATEGORY_CD");
                }
            }

            this.HiddenFields["sccd"] = this.sccd;
            this.HiddenFields["scnm"] = this.scnm;

            //글쓰기 컨트롤 데이터 바인딩
            cboCategory.DataSource = cboCategory_DbQuery();
            cboCategory.DataBind();

            cboCategoryGroup.DataSource = cboCategoryGroup_DbQuery();
            cboCategoryGroup.DataBind();

            cboPreface.DataSource = cboPreface_DbQuery();
            cboPreface.DataBind();
        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            if (this.trlList.IsCallback) {
                if (!this.HiddenFields.Contains("mv") || !this.HiddenFields.Contains("cmd")) {
                    return;
                }

                var str_mv = this.HiddenFields["mv"].ToString();
                var str_cmd = this.HiddenFields["cmd"].ToString();
                var move_mfid = 0;
                var mfid = 0;
                var bid = 0L;

                switch (str_mv) {
                    //case "list":
                    //    var dt_multidata = default(DataTable);
                    //    var strMsgIDs = string.Empty;
                    //    if (!this.HiddenFields.Contains("data") || string.IsNullOrWhiteSpace(this.HiddenFields["data"].ToString())) {
                    //        return;
                    //    } else {
                    //        try {
                    //            dt_multidata = (DataTable)JsonConvert.DeserializeObject<DataTable>(this.HiddenFields["data"].ToString());
                    //        } catch {
                    //            return;
                    //        }
                    //    }
                    //    switch (str_cmd) {
                    //        case "delete": //삭제
                    //            break;
                    //        case "move": //이동
                    //            break;
                    //    }
                    //    break;
                    case "read":
                    case "edit":
                        if (!this.HiddenFields.Contains("bid") || !long.TryParse(this.HiddenFields["bid"].ToString(), out bid)) {
                            return;
                        }
                        switch (str_cmd) {
                            case "delete": //게시글 삭제
                                var attachments = this.GetAttachments(bid);
                                foreach (DataRow row in attachments.Rows) {
                                    if (System.IO.File.Exists(row.Field<string>("physical_file_path"))) {
                                        System.IO.File.Delete(row.Field<string>("physical_file_path"));
                                    }
                                }
                                this.lgStrSql = new StringBuilder();
                                this.lgStrSql.AppendLine(" UPDATE A SET ");
                                this.lgStrSql.AppendLine(string.Format(" DELETED_YN = {0}", Data.FilterVariable("Y", true)));
                                this.lgStrSql.AppendLine(string.Format(" EDIT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                                this.lgStrSql.AppendLine(" FROM B_BBS A ");
                                this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                                if (attachments.Rows.Count > 0) {
                                    this.lgStrSql.AppendLine(" UPDATE A SET ");
                                    this.lgStrSql.AppendLine(string.Format(" DELETED_YN = {0}", Data.FilterVariable("Y")));
                                    this.lgStrSql.AppendLine(" FROM B_BBS_ATTACH A ");
                                    this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                                }
                                this.lgDbAccess.ExecuteNonQuery(this.lgStrSql.ToString());

                                this.DeleteRelationBBS(bid);
                                break;
                            case "move": //게시글 이동
                                return;
                        }
                        break;
                   
                }
            }
        }

        void DeleteRelationBBS(long lNo) {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(string.Format(" SELECT NO, PARENT_NO FROM B_BBS (NOLOCK) WHERE PARENT_NO = {0} ", lNo));
            var dt_relations = this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];

            foreach (DataRow row in dt_relations.Rows) {
                this.lgStrSql = new StringBuilder();
                this.lgStrSql.AppendLine(string.Format(" SELECT NO FROM B_BBS (NOLOCK) WHERE PARENT_NO = {0} ", row["NO"]));
                var exists_sub_relation = this.lgDbAccess.ExecuteRowCountQuery(this.lgStrSql.ToString());

                if (exists_sub_relation > 0) {
                    this.DeleteRelationBBS(row.Field<long>("NO"));
                }

                this.lgStrSql.Clear();
                this.lgStrSql.AppendLine(" UPDATE A SET ");
                this.lgStrSql.AppendLine(string.Format(" DELETED_YN = {0}", Data.FilterVariable("Y", true)));
                this.lgStrSql.AppendLine(string.Format(" EDIT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                this.lgStrSql.AppendLine(" FROM B_BBS A ");
                this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(row["NO"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                this.lgDbAccess.ExecuteNonQuery(this.lgStrSql.ToString());
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

        #region Read
        protected DataTable S_BBS_MST_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT	A.CATEGORY_CD, ");
            this.lgStrSql.AppendLine(" 		B.MENU_NM CATEGORY_NM, ");
            this.lgStrSql.AppendLine(" 		B.PARENT_MENU_ID PARENT_CATEGORY_CD, ");
            this.lgStrSql.AppendLine(" 		C.MENU_NM PARENT_CATEGORY_NM, ");
            this.lgStrSql.AppendLine(" 		B.MENU_DES CATEGORY_DES, ");
            this.lgStrSql.AppendLine(" 		B.MENU_TYPE CATEGORY_TYPE, ");
            this.lgStrSql.AppendLine(" 		B.MENU_LVL CATEGORY_LVL, ");
            this.lgStrSql.AppendLine(" 		B.MENU_SEQ CATEGORY_SEQ, ");
            this.lgStrSql.AppendLine(" 		B.ROUTE_ID, ");
            this.lgStrSql.AppendLine(" 		D.ROUTE_NAME, ");
            this.lgStrSql.AppendLine(" 		A.USE_SEARCH_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_RIGHT_MOUSE_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_COMMENT_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_SECRET_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_ATT_FILE_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_ATT_FILE_PHOTO_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_ATT_FILE_VIDEO_YN, ");
            this.lgStrSql.AppendLine(" 		A.ATT_FILE_CNT, ");
            this.lgStrSql.AppendLine(" 		A.ATT_FILE_SIZE, ");
            this.lgStrSql.AppendLine(" 		A.VIRTUAL_YN, ");
            this.lgStrSql.AppendLine(" 		A.USE_YN ");
            this.lgStrSql.AppendLine("   FROM S_BBS_MST A ");
            this.lgStrSql.AppendLine("   LEFT JOIN S_USR_MENU B ON(A.CATEGORY_CD = B.MENU_ID) ");
            this.lgStrSql.AppendLine("   LEFT JOIN S_USR_MENU C ON(B.PARENT_MENU_ID = C.MENU_ID) ");
            this.lgStrSql.AppendLine("   LEFT JOIN S_ROUTE_HDR D ON(B.ROUTE_ID = D.ROUTE_ID) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE A.CATEGORY_CD = {0} ", Data.FilterVariable(this.sccd)));

            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), new string[] { "S_BBS_MST" }).Tables["S_BBS_MST"];
        }

        protected DataTable Comment_DbQuery(long lNo) {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT A.NO, ");
            this.lgStrSql.AppendLine("     A.CATEGORY_CD, ");
            this.lgStrSql.AppendLine("     A.CMT_NO, ");
            this.lgStrSql.AppendLine("     A.PARENT_CMT_NO, ");
            this.lgStrSql.AppendLine("     A.COMMENT, ");
            this.lgStrSql.AppendLine("     A.USER_ID, ");
            this.lgStrSql.AppendLine("     B.NAME, ");
            this.lgStrSql.AppendLine("     A.USER_IP, ");
            this.lgStrSql.AppendLine("     A.USER_AGENT, ");
            this.lgStrSql.AppendLine("     A.DATE, ");
            this.lgStrSql.AppendLine("     A.EDIT, ");
            this.lgStrSql.AppendLine("     A.DELETED_YN ");
            this.lgStrSql.AppendLine(" FROM B_BBS_COMMENT A (NOLOCK) ");
            this.lgStrSql.AppendLine(" LEFT JOIN S_USR_MST B (NOLOCK) ON(A.USER_ID = B.USR_ID) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE A.NO = {0} ", Data.FilterVariable(lNo, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
            this.lgStrSql.AppendLine(" ORDER BY A.DATE ");
            return lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }

        protected DataTable VisitHist_DbQuery(string strCategoryCd, long lNo) {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT NO, ");
            this.lgStrSql.AppendLine(" CATEGORY_CD, ");
            this.lgStrSql.AppendLine(" VISIT_USER_ID, ");
            this.lgStrSql.AppendLine(" VISIT_USER_IP, ");
            this.lgStrSql.AppendLine(" VISIT_USER_AGENT, ");
            this.lgStrSql.AppendLine(" VISIT_DATE, ");
            this.lgStrSql.AppendLine(" END_VISIT_DATE, ");
            this.lgStrSql.AppendLine(" VISIT_CNT ");
            this.lgStrSql.AppendLine(" FROM B_BBS_VISIT_HIST ");
            this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", lNo));
            if (strCategoryCd.ToLower() != "bbs_all") {
                this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0}", Data.FilterVariable(strCategoryCd)));
            }
            this.lgStrSql.AppendLine(" ORDER BY VISIT_USER_ID ");
            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }
        protected DataTable ReCommendHist_DbQuery(string strCategoryCd, long lNo) {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT NO, ");
            this.lgStrSql.AppendLine(" CATEGORY_CD, ");
            this.lgStrSql.AppendLine(" RECMT_USER_ID, ");
            this.lgStrSql.AppendLine(" RECMT_USER_IP, ");
            this.lgStrSql.AppendLine(" RECMT_USER_AGENT, ");
            this.lgStrSql.AppendLine(" RECMT_DATE ");
            this.lgStrSql.AppendLine(" FROM B_BBS_RECMT_HIST ");
            this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", lNo));
            if (strCategoryCd.ToLower() != "bbs_all") {
                this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0}", Data.FilterVariable(strCategoryCd)));
            }
            this.lgStrSql.AppendLine(" ORDER BY RECMT_USER_ID ");
            return lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];
        }
        #endregion

        #region Write
        protected DataTable cboCategory_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT A.CATEGORY_CD, ");
            this.lgStrSql.AppendLine(string.Format(" dbo.UFN_SC_MENU_PATH_NAMES_{0} (A.CATEGORY_CD,'BOARD') CATEGORY_NM ", lgLang));
            this.lgStrSql.AppendLine(" FROM S_BBS_MST A ");
            this.lgStrSql.AppendLine(" LEFT JOIN S_USR_MENU B ON(A.CATEGORY_CD = B.MENU_ID) ");
            this.lgStrSql.AppendLine(" WHERE A.USE_YN = 'Y' ");
            this.lgStrSql.AppendLine(" AND A.VIRTUAL_YN = 'N' ");
            this.lgStrSql.AppendLine(string.Format(" AND EXISTS(SELECT 1 FROM UFN_TB_GET_USER_ROLE({0}) WHERE MENU_ID = B.MENU_ID) ", Data.FilterVariable(lgACT.UserId)));
            this.lgStrSql.AppendLine(" ORDER BY A.CATEGORY_SEQ ");
            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), "cboCategory").Tables["cboCategory"];
        }
        protected DataTable cboCategoryGroup_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT	B.DEPT_CD CATEGORY_GROUP_CD, ");
            this.lgStrSql.AppendLine(string.Format(" 		B.DEPT_NM_{0} CATEGORY_GROUP_NM ", lgLang));
            this.lgStrSql.AppendLine(" FROM S_USR_MST A ");
            this.lgStrSql.AppendLine(" LEFT JOIN S_ACCT_DEPT B ON(A.DEPT_CD = B.DEPT_CD) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE A.USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
            this.lgStrSql.AppendLine("  ");
            this.lgStrSql.AppendLine(" UNION ALL ");
            this.lgStrSql.AppendLine(" SELECT	B.CATEGORY_GROUP_CD, ");
            this.lgStrSql.AppendLine(string.Format(" 		CASE WHEN B.CATEGORY_CD = 'BBS_DEPT' THEN D.PLANT_NM_{0} + ' > ' + C.DEPT_NM_{0} ELSE C.DEPT_NM_{0} END CATEGORY_GROUP_NM ", lgLang));
            this.lgStrSql.AppendLine(" FROM S_USR_MST A ");
            this.lgStrSql.AppendLine(" INNER JOIN B_BBS_ROLE B ON(A.USR_ID = B.USR_ID) ");
            this.lgStrSql.AppendLine(" INNER JOIN S_ACCT_DEPT C ON(B.CATEGORY_GROUP_CD = C.DEPT_CD) ");
            this.lgStrSql.AppendLine(" LEFT JOIN S_PLANT D ON(C.PLANT_CD = D.PLANT_CD) ");
            this.lgStrSql.AppendLine(string.Format(" WHERE A.USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));
            this.lgStrSql.AppendLine(string.Format(" AND C.DEPT_CD != (SELECT DEPT_CD FROM S_USR_MST WHERE USR_ID = {0}) ", Data.FilterVariable(lgACT.UserId)));
            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), "cboCategoryGroup").Tables["cboCategoryGroup"];
        }
        protected DataTable cboPreface_DbQuery() {
            this.lgStrSql = new StringBuilder();
            this.lgStrSql.AppendLine(" SELECT PREFACE_CD, ");
            this.lgStrSql.AppendLine(" PREFACE_NM ");
            this.lgStrSql.AppendLine(" FROM S_BBS_PR_MST ");
            this.lgStrSql.AppendLine(" ORDER BY PREFACE_NM ");
            return this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), "cboPreface").Tables["cboPreface"];
        }
        #endregion

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        #region Category
        protected void rtGroupCategorys_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            switch (e.Item.ItemType) {
                case ListItemType.Item:
                case ListItemType.AlternatingItem:
                    var rt_subcategorys = e.Item.FindControl("rtSubCategorys") as Repeater;
                    if (rt_subcategorys != null) {
                        var row_view = e.Item.DataItem as DataRowView;
                        var category_cd = row_view["CATEGORY_CD"].ToString();

                        var dt_sub_categorys = this.categorys.Select(string.Format("PARENT_CATEGORY_CD = {0} ", Data.FilterVariable(category_cd)));
                        if (dt_sub_categorys.Count() > 0){
                            var dt = dt_sub_categorys.OrderBy(row => row.Field<string>("CATEGORY_SEQ")).CopyToDataTable();
                            rt_subcategorys.DataSource = dt;
                        }
                        rt_subcategorys.DataBind();
                    }
                    break;
            }
        }
        #endregion
        #region List
        protected void trlList_CustomCallback(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomCallbackEventArgs e) {
            trlList.DataBind();
            trlList.ExpandAll();
        }
        protected void EntityDataSource_Selecting(object sender, Microsoft.AspNet.EntityDataSource.EntityDataSourceSelectingEventArgs e) {
            
            if (this.sccd.ToLower() == "bbs_all") {
                e.DataSource.Select = string.Format(@"IT.NO, IT.CATEGORY_CD, IT.CATEGORY_NM_{0}, IT.PATH_NAME_{0}, IT.CATEGORY_GROUP_CD, IT.CATEGORY_GROUP_NM, IT.PARENT_NO, IT.PREFACE_CD, IT.PREFACE_NM, IT.NOTICE_YN, IT.NOTICE_TO,
                                    IT.SECRET_YN, IT.SECRET_KEY, IT.SUBJECT, IT.SUBJECT_COLOR, IT.SUBJECT_BOLD_YN, IT.FILE_CNT, IT.CMT_CNT, IT.DATE, IT.EDIT, IT.VISIT, IT.RECOMMEND, IT.TAG,
                                    IT.OPTIONS_FLAG, IT.LOGIN_ID, IT.WRITE_USER_ID, IT.WRITE_USER_NM_{0}, IT.ROLE_PSTN, IT.ROLE_PSTN_NM_{0}, IT.SORT_BY", lgLang);
            } else {
                e.DataSource.Select = string.Format(@"IT.NO, IT.CATEGORY_CD, IT.CATEGORY_NM_{0}, IT.CATEGORY_GROUP_CD, IT.CATEGORY_GROUP_NM, IT.PARENT_NO, IT.PREFACE_CD, IT.PREFACE_NM, IT.NOTICE_YN, IT.NOTICE_TO,
                                    IT.SECRET_YN, IT.SECRET_KEY, IT.SUBJECT, IT.SUBJECT_COLOR, IT.SUBJECT_BOLD_YN, IT.FILE_CNT, IT.CMT_CNT, IT.DATE, IT.EDIT, IT.VISIT, IT.RECOMMEND, IT.TAG,
                                    IT.OPTIONS_FLAG, IT.LOGIN_ID, IT.WRITE_USER_ID, IT.WRITE_USER_NM_{0}, IT.ROLE_PSTN, IT.ROLE_PSTN_NM_{0}, IT.SORT_BY", lgLang);
            }

            e.DataSource.Where = string.Format("IT.LOGIN_ID = {0}", Data.FilterVariable(lgACT.UserId));
            if (this.sccd.ToLower() != "bbs_all") {
                e.DataSource.Where += string.Format(" AND IT.CATEGORY_CD = {0}", Data.FilterVariable(this.sccd));
            }
        }

        
        protected void trlList_HtmlRowPrepared(object sender, DevExpress.Web.ASPxTreeList.TreeListHtmlRowEventArgs e) {
            if (e.Row != null && e.RowKind == DevExpress.Web.ASPxTreeList.TreeListRowKind.Data) {
                var node = trlList.FindNodeByKeyValue(e.NodeKey);
                e.Row.Attributes["bid"] = e.NodeKey;
                e.Row.Attributes["bccd"] = node.GetValue("CATEGORY_CD").ToString().ToLower();
                e.Row.Attributes["user_id"] = node.GetValue("WRITE_USER_ID").ToString().ToLower();
            }
        }
        protected void trlList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxTreeList.TreeListHtmlDataCellEventArgs e) {
            if (e.CellValue == null)
                return;

            switch (e.Column.Name) {
                case "NO":
                    if (e.Level == 1) {
                        if ((long)e.CellValue < 0) {
                            e.Cell.Text = "";
                            var htmlNoticeIcoDiv = new HtmlGenericControl("div");
                            htmlNoticeIcoDiv.Attributes["class"] = "Icon16 Notice FloatN";
                            htmlNoticeIcoDiv.Attributes["style"] = "margin: -7px auto -5px";
                            htmlNoticeIcoDiv.Attributes["title"] = GetResource("CSTRESX00118");
                            e.Cell.Controls.Add(htmlNoticeIcoDiv);
                        }
                    } else {
                        e.Cell.Text = "";
                    }
                    break;
                case "SUBJECT":
                    e.Cell.Text = "";

                    //깊이 아이콘 추가
                    if (e.Level > 1) {
                        var htmlReplyImg = new HtmlGenericControl("img");
                        htmlReplyImg.Attributes["src"] = lgUrlInfo.VirtualPath + "contents/images/ico-reply.gif";
                        htmlReplyImg.Attributes["style"] = string.Format("float: left; padding:2px 5px 0 {0}px;", (e.Level - 1) * 5);
                        e.Cell.Controls.Add(htmlReplyImg);
                    }

                    //새로운글 아이콘 추가
                    if (DateTimeManager.DateDiffDay(((DateTime)e.GetValue("DATE")), DateTime.Now) <= 3) {
                        var htmlNewDiv = new HtmlGenericControl("div");
                        htmlNewDiv.Attributes["class"] = "Icon16 New FloatL";
                        htmlNewDiv.Attributes["style"] = "margin: -7px auto -5px";
                        htmlNewDiv.Attributes["title"] = GetResource("CSTRESX00119");
                        e.Cell.Controls.Add(htmlNewDiv);
                    }

                    //HOT 아이콘 추가
                    if ((int)e.GetValue("VISIT") > 40) {
                        var htmlHotDiv = new HtmlGenericControl("div");
                        htmlHotDiv.Attributes["class"] = "CSmallRadiusRed";
                        htmlHotDiv.Attributes["title"] = GetResource("CSTRESX00120");
                        var htmlHotSpan = new HtmlGenericControl("span") {
                            InnerText = "HOT"
                        };
                        htmlHotDiv.Controls.Add(htmlHotSpan);
                        e.Cell.Controls.Add(htmlHotDiv);
                    }

                    //전체 게시판일경우 게시판 명 표기
                    if (this.sccd.ToLower() == "bbs_all") {
                        var htmlCategoryNameDiv = new HtmlGenericControl("span");
                        htmlCategoryNameDiv.Attributes["class"] = "FloatL";
                        htmlCategoryNameDiv.Attributes["style"] = "color:#5C5C5C";
                        htmlCategoryNameDiv.Attributes["title"] = string.Format("[{0}]", (string)e.GetValue(string.Format("PATH_NAME_{0}", lgLang)));
                        htmlCategoryNameDiv.InnerText = string.Format("[{0}]", (string)e.GetValue(string.Format("PATH_NAME_{0}", lgLang)));
                        e.Cell.Controls.Add(htmlCategoryNameDiv);
                    }

                    //제목부 설정
                    var hlSubject = new eniHyperLink() {
                        CssClass = "OverHidden CursorPoint DisplayInlineBlock FloatL", // Text-Ellipsis
                        ToolTip = (string)e.CellValue,
                        Text = (string)e.CellValue
                    };

                    hlSubject.Attributes["style"] += "padding:0 0 0 5px;";

                    if ((string)e.GetValue("NOTICE_YN") == "Y" && (string)e.GetValue("SUBJECT_COLOR") == "#000000") {
                        hlSubject.ForeColor = Color.FromName("#F37247");
                        hlSubject.Font.Bold = true;
                    } else {
                        hlSubject.ForeColor = Color.FromName((string)e.GetValue("SUBJECT_COLOR"));
                        hlSubject.Font.Bold = (string)e.GetValue("SUBJECT_BOLD_YN") == "Y" ? true : false;
                    }

                    hlSubject.ClientSideEvents.Click = "eni.LocalPage.hiSubject_Click";
                    hlSubject.JSProperties["cp_no"] = Math.Abs((long)e.GetValue("NO"));

                    if ((int)e.GetValue("CMT_CNT") > 0) {
                        hlSubject.Text += string.Format(" [{0}]", e.GetValue("CMT_CNT"));
                    }

                    e.Cell.Controls.Add(hlSubject);

                    //첨부파일 아이콘 추가
                    if ((int)e.GetValue("FILE_CNT") > 0) {
                        var htmlAttachFileImg = new HtmlGenericControl("div");
                        htmlAttachFileImg.Attributes["class"] = "Icon Attachments DisplayBlock FloatL";
                        htmlAttachFileImg.Attributes["style"] = "margin-top:-1px; margin-left:5px;";
                        htmlAttachFileImg.Attributes["title"] = string.Format(GetResource("CSTRESX00121"), e.GetValue("FILE_CNT"));
                        e.Cell.Controls.Add(htmlAttachFileImg);
                    }

                    //덧글 갯수 아이콘 추가
                    if ((int)e.GetValue("CMT_CNT") > 0) {
                        var htmlCommentImg = new HtmlGenericControl("div");
                        htmlCommentImg.Attributes["class"] = "Icon16 Comment FloatL";
                        htmlCommentImg.Attributes["style"] = "margin:-4px 0 0 5px;";
                        htmlCommentImg.Attributes["title"] = string.Format(GetResource("CSTRESX00122"), e.GetValue("CMT_CNT"));
                        e.Cell.Controls.Add(htmlCommentImg);
                    }
                    break;
                case "WRITE_USER_ID":
                    e.Cell.Text = "";
                    var hypWriter = new eniHyperLink() {
                        CssClass = "OverHidden CursorPoint DisplayBlock Text-Ellipsis",
                        ForeColor = Color.FromName("#333333"),
                        ToolTip = string.Format("{0} {1} {2} {3}({4})", e.GetValue("BIZ_AREA_NM"), e.GetValue("PLANT_NM"), e.GetValue(string.Format("ROLE_PSTN_NM_{0}", lgLang)), e.GetValue(string.Format("WRITE_USER_NM_{0}", lgLang)), e.GetValue("WRITE_USER_ID")),
                        Text = string.Format("{0} {1}", e.GetValue(string.Format("ROLE_PSTN_NM_{0}", lgLang)), e.GetValue(string.Format("WRITE_USER_NM_{0}", lgLang))),
                    };
                    hypWriter.Attributes["style"] += "padding:0 0 0 5px;";

                    e.Cell.Controls.Add(hypWriter);
                    break;
                case "DATE":
                    var date = (DateTime)e.GetValue("DATE");
                    var edate = (DateTime)e.GetValue("EDIT");
                    if (date == edate) {
                        e.Cell.ToolTip = date.ToString(GetResource("CSTRESX00123"));
                        e.Cell.Text = date.ToString("yy.MM.dd HH:mm");
                    } else {
                        if (DateTimeManager.DateDiffDay(edate, DateTime.Now) <= 7) {
                            e.Cell.ToolTip = edate.ToString(GetResource("CSTRESX00123"));
                            e.Cell.Text = edate.ToString("yy.MM.dd HH:mm");
                        } else {
                            e.Cell.ToolTip = date.ToString(GetResource("CSTRESX00123"));
                            e.Cell.Text = date.ToString("yy.MM.dd HH:mm");
                        }
                    }
                    break;
                case "VISIT":
                    e.Cell.ToolTip = string.Format(GetResource("CSTRESX00124"), e.CellValue);
                    break;
                case "RECOMMEND":
                    e.Cell.ToolTip = string.Format(GetResource("CSTRESX00125"), e.CellValue);
                    break;
            }
        }
        #endregion
        #region Read
        protected class ReadCallBackArgs : BaseCallbackArgs {
            public new string Data { get; set; }
            public string bccd { get; set; }
            public long bid { get; set; }
            public string cmt_no { get; set; }
        }

        protected void popRead_WindowCallback(object source, PopupWindowCallbackArgs e) {
            var cb_args = default(ReadCallBackArgs);

            try {
                cb_args = ReadCallBackArgs.GetDeserialize<ReadCallBackArgs>(e.Parameter);

                if (cb_args == null) {
                    throw new SystemException(GetGlobalResource("GCSTRESX20016"));
                }
            } catch (SystemException ex) {
                throw ex;
            }

            var bid = (cb_args.bid < 0 ? cb_args.bid * -1 : cb_args.bid);

            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT TOP(1) NO, ");
            lgStrSql.AppendLine("       CATEGORY_CD, ");
            lgStrSql.AppendLine(string.Format("       CATEGORY_NM_{0} CATEGORY_NM, ", this.lgLang));
            lgStrSql.AppendLine(string.Format("       PATH_NAME_{0} PATH_NAME, ", this.lgLang));
            lgStrSql.AppendLine("       CATEGORY_GROUP_CD, ");
            lgStrSql.AppendLine("       CATEGORY_GROUP_NM, ");
            lgStrSql.AppendLine("       PARENT_NO, ");
            lgStrSql.AppendLine("       PREFACE_CD, ");
            lgStrSql.AppendLine("       PREFACE_NM, ");
            lgStrSql.AppendLine("       NOTICE_YN, ");
            lgStrSql.AppendLine("       NOTICE_TO, ");
            lgStrSql.AppendLine("       SECRET_YN, ");
            lgStrSql.AppendLine("       SECRET_KEY, ");
            lgStrSql.AppendLine("       SUBJECT, ");
            lgStrSql.AppendLine("       SUBJECT_COLOR, ");
            lgStrSql.AppendLine("       SUBJECT_BOLD_YN, ");
            lgStrSql.AppendLine("       CONTENT, ");
            lgStrSql.AppendLine("       FILE_CNT, ");
            lgStrSql.AppendLine("       CMT_CNT, ");
            lgStrSql.AppendLine("       DATE, ");
            lgStrSql.AppendLine("       EDIT, ");
            lgStrSql.AppendLine("       VISIT, ");
            lgStrSql.AppendLine("       RECOMMEND, ");
            lgStrSql.AppendLine("       TAG, ");
            lgStrSql.AppendLine("       OPTIONS_FLAG, ");
            lgStrSql.AppendLine("       WRITE_USER_ID, ");
            lgStrSql.AppendLine(string.Format("       WRITE_USER_NM_{0} WRITE_USER_NM, ", this.lgLang));
            lgStrSql.AppendLine("       ROLE_PSTN, ");
            lgStrSql.AppendLine(string.Format("       ROLE_PSTN_NM_{0} ROLE_PSTN_NM ", this.lgLang));
            lgStrSql.AppendLine("   FROM V_BBS ");
            lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", bid));

            var dt_bbs = this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString()).Tables[0];

            if (dt_bbs.Rows.Count == 0)
                return;

            var dr_bbs = dt_bbs.Rows[0];

            //방문 카운트
            if (dr_bbs.Field<string>("WRITE_USER_ID") != lgACT.UserId) {
                this.lgStrSql = new StringBuilder();
                this.lgStrSql.AppendLine(" SELECT VISIT_CNT ");
                this.lgStrSql.AppendLine(" FROM B_BBS_VISIT_HIST ");
                this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", bid));
                this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0} ", Data.FilterVariable(cb_args.bccd)));
                this.lgStrSql.AppendLine(string.Format(" AND VISIT_USER_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                var visitCnt = this.lgDbAccess.ExecuteScalar(lgStrSql.ToString());

                this.lgStrSql = new StringBuilder();
                if (visitCnt == null) {
                    this.lgStrSql.AppendLine(" INSERT INTO B_BBS_VISIT_HIST (NO, CATEGORY_CD, VISIT_USER_ID, VISIT_USER_IP, VISIT_USER_AGENT, VISIT_DATE, END_VISIT_DATE, VISIT_CNT) ");
                    this.lgStrSql.Append(" VALUES( ");
                    this.lgStrSql.Append(Data.FilterVariable(bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                    this.lgStrSql.Append(Data.FilterVariable(cb_args.bccd.ToUpper(), true));
                    this.lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                    this.lgStrSql.Append(Data.FilterVariable(Request.UserHostAddress, true));
                    this.lgStrSql.Append(Data.FilterVariable(Request.UserAgent, true));
                    this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true));
                    this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true));
                    this.lgStrSql.Append(1);
                    this.lgStrSql.Append(") ");
                } else {
                    this.lgStrSql.AppendLine(" UPDATE A SET ");
                    this.lgStrSql.AppendLine(string.Format(" A.VISIT_USER_IP = {0}", Data.FilterVariable(Request.UserHostAddress, true)));
                    this.lgStrSql.AppendLine(string.Format(" A.VISIT_USER_AGENT = {0}", Data.FilterVariable(Request.UserAgent, true)));
                    this.lgStrSql.AppendLine(string.Format(" A.END_VISIT_DATE = {0}", Data.FilterVariable(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), true)));
                    this.lgStrSql.AppendLine(" A.VISIT_CNT = A.VISIT_CNT + 1 ");
                    this.lgStrSql.AppendLine(" FROM B_BBS_VISIT_HIST A ");
                    this.lgStrSql.AppendLine(string.Format(" WHERE A.NO = {0}", bid));
                    this.lgStrSql.AppendLine(string.Format(" AND A.CATEGORY_CD = {0}", Data.FilterVariable(cb_args.bccd)));
                    this.lgStrSql.AppendLine(string.Format(" AND A.VISIT_USER_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                }

                this.lgDbAccess.ExecuteNonQuery(this.lgStrSql.ToString());
            }

            lblSubject.Text = lblSubject.ToolTip = dr_bbs.Field<string>("SUBJECT");
            lblBoardUrl.Text = lblBoardUrl.ToolTip = string.Format("{0}/board/{1}", lgUrlInfo.RequestFullAuthorityUrl, bid);
            hlCategoryName.Text = hlCategoryName.ToolTip = dr_bbs.Field<string>("CATEGORY_NM");

            if (dr_bbs.Field<DateTime>("DATE").ToShortDateString() == DateTime.Now.ToShortDateString()) {
                lblDate.Text = lblDate.ToolTip = dr_bbs.Field<DateTime>("DATE").ToString("HH:mm:ss");
            } else {
                lblDate.Text = lblDate.ToolTip = dr_bbs.Field<DateTime>("DATE").ToString("yy-MM-dd HH:mm");
            }

            hlWriter.Text = hlWriter.ToolTip = dr_bbs.Field<string>("WRITE_USER_NM") + " " + dr_bbs.Field<string>("ROLE_PSTN_NM");

            var htmlFiles = string.Empty;
            if (dr_bbs.Field<int>("FILE_CNT") > 0) {
                lgStrSql = new StringBuilder();
                lgStrSql.AppendLine(" SELECT A.NO, ");
                lgStrSql.AppendLine("     A.CATEGORY_CD, ");
                lgStrSql.AppendLine("     A.FILE_NO, ");
                lgStrSql.AppendLine("     A.FILE_NAME, ");
                lgStrSql.AppendLine("     B.FILE_DOWN_CNT, ");
                lgStrSql.AppendLine("     A.PHY_FILE_NAME, ");
                lgStrSql.AppendLine("     A.FILE_SIZE, ");
                lgStrSql.AppendLine("     A.FILE_EXT, ");
                lgStrSql.AppendLine("     A.CUST_FILE_SIZE, ");
                lgStrSql.AppendLine("     A.CONTENT_TYPE, ");
                lgStrSql.AppendLine("     A.DELETED_YN ");
                lgStrSql.AppendLine(" FROM B_BBS_ATTACH A (NOLOCK) ");
                lgStrSql.AppendLine(" LEFT JOIN (SELECT FILE_NO, SUM(DOWN_CNT) FILE_DOWN_CNT  ");
                lgStrSql.AppendLine(" 			FROM B_BBS_ATTACH_DWON_HIST (NOLOCK) ");
                lgStrSql.AppendLine(string.Format(" 			WHERE NO = {0} ", bid));
                lgStrSql.AppendLine(" 			GROUP BY FILE_NO) B ON(A.FILE_NO = B.FILE_NO) ");
                lgStrSql.AppendLine(string.Format(" WHERE A.NO = {0} ", bid));
                lgStrSql.AppendLine(" AND A.DELETED_YN = 'N' ");
                lgStrSql.AppendLine(" ORDER BY A.FILE_NO ");

                var dt_attachments = lgDbAccess.ExecuteDataSet(lgStrSql.ToString()).Tables[0];
                htmlFiles = GetHtmlAttachmentFiles(dt_attachments);
            }

            phBody.Controls.Add(new LiteralControl(htmlFiles + dr_bbs.Field<string>("CONTENT")));


            //조회수 데이터 로드
            lblVisitCnt.Text = dr_bbs.Field<int>("VISIT").ToString();

            //추천수 데이터 로드
            lblReCommendCnt.Text = dr_bbs.Field<int>("RECOMMEND").ToString();

            ////댓글 데이터 로드
            lblCommentCnt.Text = dr_bbs.Field<int>("CMT_CNT").ToString();

            if (dr_bbs.Field<int>("CMT_CNT") > 0) {
                var dt_cmmt = this.Comment_DbQuery(bid);
                if (dt_cmmt.Rows.Count > 0) {
                    trlCommentList.ClientVisible = true;
                    trlCommentList.DataSource = dt_cmmt;
                    trlCommentList.DataBind();
                    trlCommentList.ExpandAll();
                }
            }
        }

        protected void trlCommentList_CustomCallback(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomCallbackEventArgs e) {
            var cb_args = default(ReadCallBackArgs);
            try {
                cb_args = ReadCallBackArgs.GetDeserialize<ReadCallBackArgs>(e.Argument);

                if (cb_args == null) {
                    throw new SystemException(GetGlobalResource("GCSTRESX20016"));
                }
            } catch (SystemException ex) {
                throw ex;
            }

            try {
                switch (cb_args.DBAccessMode) {
                    case DBAccessMode.Create:
                        this.lgStrSql = new StringBuilder();
                        this.lgStrSql.AppendLine(" SELECT COUNT(CMT_NO) ");
                        this.lgStrSql.AppendLine(" FROM B_BBS_COMMENT ");
                        this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0} ", Data.FilterVariable(cb_args.bccd)));

                        var cmtMaxNo = this.lgDbAccess.ExecuteScalar(this.lgStrSql.ToString());

                        this.lgStrSql = new StringBuilder();
                        this.lgStrSql.AppendLine(" INSERT INTO B_BBS_COMMENT (NO, CATEGORY_CD, CMT_NO, PARENT_CMT_NO, COMMENT, USER_ID, USER_IP, USER_AGENT, DATE, EDIT, DELETED_YN) ");
                        this.lgStrSql.Append(" VALUES ( ");
                        this.lgStrSql.Append(Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        this.lgStrSql.Append(Data.FilterVariable(cb_args.bccd.ToUpper(), true));
                        this.lgStrSql.Append(Data.FilterVariable((cmtMaxNo == null ? 0 : int.Parse(cmtMaxNo.ToString()) + 1), FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        if (cb_args.cmt_no == null) {
                            this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        } else {
                            this.lgStrSql.Append(Data.FilterVariable(cb_args.cmt_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                        }
                        this.lgStrSql.Append(Data.FilterVariable(cb_args.Data.Replace("'", "''"), true, true));
                        this.lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                        this.lgStrSql.Append(Data.FilterVariable(lgHostInfo.UserHostAddress, true));
                        this.lgStrSql.Append(Data.FilterVariable(lgHostInfo.UserAgent, true));
                        this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                        this.lgStrSql.Append(Data.FilterVariable("N"));
                        this.lgStrSql.AppendLine(" ) ");
                        break;

                    case DBAccessMode.Update:
                        this.lgStrSql = new StringBuilder();
                        this.lgStrSql.AppendLine(" UPDATE A SET ");
                        this.lgStrSql.AppendLine(string.Format(" COMMENT = {0}", Data.FilterVariable(cb_args.Data.Replace("'", "''"), true, true)));
                        this.lgStrSql.AppendLine(string.Format(" USER_IP = {0}", Data.FilterVariable(lgHostInfo.UserHostAddress, true)));
                        this.lgStrSql.AppendLine(string.Format(" USER_AGENT = {0}", Data.FilterVariable(lgHostInfo.UserAgent, true)));
                        this.lgStrSql.AppendLine(string.Format(" EDIT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        this.lgStrSql.AppendLine(" FROM B_BBS_COMMENT A ");
                        this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0} ", Data.FilterVariable(cb_args.bccd)));
                        this.lgStrSql.AppendLine(string.Format(" AND CMT_NO = {0} ", Data.FilterVariable(cb_args.cmt_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        break;
                    case DBAccessMode.Delete:
                        this.lgStrSql = new StringBuilder();
                        this.lgStrSql.AppendLine(" UPDATE A SET ");
                        this.lgStrSql.AppendLine(string.Format(" DELETED_YN = {0}", Data.FilterVariable("Y", true)));
                        this.lgStrSql.AppendLine(string.Format(" EDIT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                        this.lgStrSql.AppendLine(" FROM B_BBS_COMMENT A ");
                        this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        this.lgStrSql.AppendLine(string.Format(" AND CATEGORY_CD = {0} ", Data.FilterVariable(cb_args.bccd)));
                        this.lgStrSql.AppendLine(string.Format(" AND CMT_NO = {0} ", Data.FilterVariable(cb_args.cmt_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        break;
                }

                this.lgDbAccess.ExecuteNonQuery(this.lgStrSql.ToString());
            } catch(System.Exception ex) {
                throw ex;
            }

            trlCommentList.ClientVisible = true;
            trlCommentList.DataSource = Comment_DbQuery(long.Parse(HiddenFields["bid"].ToString()));
            trlCommentList.DataBind();
            trlCommentList.ExpandAll();
        }

        #endregion

        #region Write
        protected void upcAttachment_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e) {
            var tempFileName = Guid.NewGuid().ToString();
            var physicalFileRootPath = lgACT.GetBoardACTDirectory(PathType.Temp, PathFormatter.FullPhysicalPath, this.HiddenFields["sccd"].ToString().ToUpper());
            var physicalFilePath = Path.Combine(physicalFileRootPath, tempFileName);
            var customFileSize = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(e.UploadedFile.ContentLength);
            var fileExtention = Path.GetExtension(e.UploadedFile.FileName).Replace(".", "").ToUpper();
            if (!Directory.Exists(physicalFileRootPath)) {
                Directory.CreateDirectory(physicalFileRootPath);
            }
            //로그인 사용자 개인별 임시폴더에 저장
            e.UploadedFile.SaveAs(physicalFilePath);
            e.CallbackData = JsonConvert.SerializeObject(new {
                temp_file_name = tempFileName,
                file_name = e.UploadedFile.FileName,
                file_size = e.UploadedFile.ContentLength,
                physical_file_path = physicalFilePath,
                custom_file_size = customFileSize,
                file_extantion = fileExtention,
                content_type = e.UploadedFile.ContentType,
                recent = "Y",
                deleted = "N"
            });
        }
        protected void gdvAttachList_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e) {
            if (e.RowType == GridViewRowType.EmptyDataRow) {
                e.Row.Attributes["style"] = "height: 100px";
            }
        }
        protected void gdvAttachList_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            if (string.IsNullOrWhiteSpace(e.Parameters)) {
                this.gdvAttachList.DataBind();
                return;
            }
            var cb_data = default(DataTable);
            try {
                cb_data = JsonConvert.DeserializeObject<DataTable>(e.Parameters);
            } catch (SystemException ex) {
                this.gdvAttachList.DataBind();
                return;
            }

            foreach (DataRow row in cb_data.Rows) {
                if (row.Field<string>("deleted") == "Y") {
                    if (System.IO.File.Exists(row.Field<string>("physical_file_path"))) {
                        System.IO.File.Delete(row.Field<string>("physical_file_path"));
                    }
                    if (this.HiddenFields["mv"].ToString() == "edit" && row.Field<string>("recent") == "N") {
                        this.lgStrSql = new StringBuilder();
                        this.lgStrSql.AppendLine(" UPDATE A SET ");
                        this.lgStrSql.AppendLine(" DELETED_YN = 'Y'");
                        this.lgStrSql.AppendLine(" FROM B_BBS_ATTACH A ");
                        this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(this.HiddenFields["bid"], FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        this.lgStrSql.AppendLine(string.Format(" AND PHY_FILE_NAME = {0} ", Data.FilterVariable(row.Field<string>("temp_file_name"))));
                        this.lgDbAccess.ExecuteNonQuery(this.lgStrSql.ToString());
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
            this.gdvAttachList.DataSource = filter_dt;
            this.gdvAttachList.DataBind();
        }
        protected class WriteCallBackArgs : BaseCallbackArgs {
            public string bccd { get; set; }
            public long bid { get; set; }
            public long parent_bid { get; set; }
            public DataTable attachments { get; set; }
            public string htmlbody { get; set; }
        }
        private class WriteCallBackResultArgs : BaseCallbackResultArgs {
            public string bccd { get; set; }
            public long bid { get; set; }
            public long parent_bid { get; set; }
            public string category_cd { get; set; }
            public string category_group_cd { get; set; }
            public string preface_cd { get; set; }
            public string notice_yn { get; set; }
            public string notice_to { get; set; }
            public int file_cnt { get; set; }
            public string subject { get; set; }
            public string subject_color { get; set;}
            public string subject_bold_yn { get; set; }
            public DataTable attachments { get; set; }
            public string htmlbody { get; set; }
            public string tag { get; set; }
            public int options_flag { get; set; }
        }
        protected void cbWriteProcess_Callback(object source, CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs<WriteCallBackResultArgs>();
            var cb_args = default(WriteCallBackArgs);
            try {
                cb_args = WriteCallBackArgs.GetDeserialize<WriteCallBackArgs>(e.Parameter);
                if (cb_args == null)
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                else
                    cb_r_args.Bind(cb_args);
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                if (cb_args.Cmd == "save") {
                    try {
                        this.lgDbBatAccess.BatchProcessStart();

                        if (cb_args.bid == 0) {
                            this.lgStrSql = new StringBuilder();
                            this.lgStrSql.AppendLine(" INSERT INTO B_BBS (CATEGORY_CD, CATEGORY_GROUP_CD, PARENT_NO, PREFACE_CD, NOTICE_YN, NOTICE_TO, SECRET_YN, SECRET_KEY, SUBJECT, SUBJECT_COLOR, SUBJECT_BOLD_YN,");
                            this.lgStrSql.AppendLine(" CONTENT, CONTENT_PLAIN, OPTIONS_FLAG, BIZ_AREA_CD, PLANT_CD, DEPT_CD, ROLE_PSTN, USER_ID, DATE, EDIT, TAG, DELETED_YN) ");
                            this.lgStrSql.Append(" VALUES ( ");
                            this.lgStrSql.Append(Data.FilterVariable(this.cboCategory.Value, true));
                            if (this.cboCategory.Value.ToString().ToLower() == "bbs_dept") {
                                this.lgStrSql.Append(Data.FilterVariable(this.cboCategoryGroup.Value, true));
                            } else {
                                this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            }
                            if (cb_args.parent_bid != 0) {
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.parent_bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            } else {
                                this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            }
                            if (this.cboPreface.Value == null) {
                                this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            } else {
                                this.lgStrSql.Append(Data.FilterVariable(this.cboPreface.Value, true));
                            }
                            if (this.chkIsNotice.Checked) {
                                this.lgStrSql.Append(Data.FilterVariable("Y", true));
                                this.lgStrSql.Append(Data.FilterVariable(this.dteNoticeEnd.Date.ToString(CommonVariable.CDT_YYYY_MM_DD), true));
                            } else {
                                this.lgStrSql.Append(Data.FilterVariable("N", true));
                                this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            }
                            this.lgStrSql.Append(Data.FilterVariable("N", true));
                            this.lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.txtSubject.Value, true, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.colSubject.Text, true));
                            if (this.chkUseBold.Checked) {
                                this.lgStrSql.Append(Data.FilterVariable("Y", true));
                            } else {
                                this.lgStrSql.Append(Data.FilterVariable("N", true));
                            }
                            this.lgStrSql.Append(Data.FilterVariable(cb_args.htmlbody.Replace("'", "''"), true, true));
                            //평문 가져오기
                            //using (MemoryStream mStream = new MemoryStream()) {
                            //    heContent.Export(DevExpress.Web.ASPxHtmlEditor.HtmlEditorExportFormat.Txt, mStream);
                            //    lgStrSql.Append(Data.FilterVariable(Encoding.UTF8.GetString(mStream.ToArray()), true, true));
                            //}
                            this.lgStrSql.Append(Data.FilterVariable(string.Empty, true, true));
                            var optionsFlag = 0;
                            if (this.chkIsSearch.Checked) {
                                optionsFlag += 1;
                            }
                            if (this.rdolPublicSetting.Value.ToString() == "L") {
                                optionsFlag += 2;
                            }
                            if (this.chkIsPublicBizArea.Checked) {
                                optionsFlag += 4;
                            }
                            if (this.chkIsPublicPlant.Checked) {
                                optionsFlag += 8;
                            }
                            if (this.chkIsPublicDept.Checked) {
                                optionsFlag += 16;
                            }
                            if (this.chkIsWorkPlace.Checked) {
                                optionsFlag += 32;
                            }
                            if (this.chkIsLocalPartner.Checked) {
                                optionsFlag += 64;
                            }
                            if (this.chkIsCustomer.Checked) {
                                optionsFlag += 128;
                            }
                            if (this.chkIsExternalPartner.Checked) {
                                optionsFlag += 256;
                            }

                            this.lgStrSql.Append(Data.FilterVariable(optionsFlag, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.lgACT.BizAreaCode, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.lgACT.PlantCode, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.lgACT.DeptCode, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.lgACT.RolePstnCode, true));
                            this.lgStrSql.Append(Data.FilterVariable(this.lgACT.UserId, true));
                            this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                            this.lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                            this.lgStrSql.Append(Data.FilterVariable(this.txtTags.Value, true, true));
                            this.lgStrSql.Append(Data.FilterVariable("N"));
                            this.lgStrSql.AppendLine(" ) ");
                            this.lgStrSql.AppendLine("  ");
                            this.lgStrSql.AppendLine(" SELECT @@IDENTITY ");

                            var identity = this.lgDbBatAccess.ExecuteScalar(this.lgStrSql.ToString());
                            if (identity == null) {
                                throw new ExceptionManager(GetGlobalResource("GCSTRESX20017"));
                            } else {
                                cb_r_args.bccd = (this.cboCategory.Value.ToString().ToLower() == "bbs_dept" ? this.lgACT.DeptCode.ToUpper() : this.cboCategory.Value.ToString().ToUpper());
                                cb_r_args.bid = long.Parse(identity.ToString());
                            }

                            //첨부파일 데이터 베이스에 저장
                            for (int i = 0; i < cb_args.attachments.Rows.Count; i++) {
                                if (System.IO.File.Exists(cb_args.attachments.Rows[i]["physical_file_path"].ToString())) {
                                    var fileName = Path.GetFileName(cb_args.attachments.Rows[i]["physical_file_path"].ToString());
                                    var moveFilePath = string.Empty;
                                    cb_args.attachments.Rows[i]["temp_file_name"] = string.Format("{0}_{1}", identity, fileName);
                                    moveFilePath = Path.Combine(Global.gDirectorys.GetSpecialDirectory(PathKind.Board, PathFormatter.FullPhysicalPath, PathType.Attach,
                                                                    (this.cboCategory.Value.ToString().ToLower() == "bbs_dept" ? this.lgACT.DeptCode.ToUpper() : this.cboCategory.Value.ToString().ToUpper()), false),
                                                                cb_args.attachments.Rows[i]["temp_file_name"].ToString());
                                    if (!Directory.Exists(Path.GetDirectoryName(moveFilePath))) {
                                        Directory.CreateDirectory(Path.GetDirectoryName(moveFilePath));
                                    }
                                    System.IO.File.Move(cb_args.attachments.Rows[i]["physical_file_path"].ToString(), moveFilePath);
                                }

                                this.lgStrSql = new StringBuilder();
                                this.lgStrSql.AppendLine("INSERT INTO B_BBS_ATTACH (NO, CATEGORY_CD, FILE_NO, FILE_NAME, PHY_FILE_NAME, FILE_SIZE, FILE_EXT, CUST_FILE_SIZE, CONTENT_TYPE, DELETED_YN)");
                                this.lgStrSql.Append(" VALUES ( ");
                                this.lgStrSql.Append(Data.FilterVariable(identity, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                this.lgStrSql.Append(Data.FilterVariable(this.cboCategory.Value, true));
                                this.lgStrSql.Append(Data.FilterVariable(i, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_name"], true, true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["temp_file_name"], true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_size"], true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_extantion"], true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["custom_file_size"], true));
                                this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["content_type"], true));
                                this.lgStrSql.Append(Data.FilterVariable("N"));
                                this.lgStrSql.AppendLine(" ) ");

                                this.lgDbBatAccess.ExecuteNonQuery(this.lgStrSql.ToString());
                            }
                        } else {
                            this.lgStrSql = new StringBuilder();
                            this.lgStrSql.AppendLine(" UPDATE A SET ");
                            this.lgStrSql.AppendLine(string.Format(" PREFACE_CD = {0}", Data.FilterVariable(this.cboPreface.Value, true)));
                            if (this.chkIsNotice.Checked) {
                                this.lgStrSql.AppendLine(string.Format(" NOTICE_YN = {0}", Data.FilterVariable("Y", true)));
                            } else {
                                this.lgStrSql.AppendLine(string.Format(" NOTICE_YN = {0}", Data.FilterVariable("N", true)));
                                this.lgStrSql.AppendLine(" NOTICE_TO = NULL,");
                            }
                            this.lgStrSql.AppendLine(string.Format(" SUBJECT = {0}", Data.FilterVariable(this.txtSubject.Value, true, true)));
                            this.lgStrSql.AppendLine(string.Format(" SUBJECT_COLOR = {0}", Data.FilterVariable(this.colSubject.Text, true)));
                            if (this.chkUseBold.Checked) {
                                this.lgStrSql.AppendLine(string.Format(" SUBJECT_BOLD_YN = {0}", Data.FilterVariable("Y", true)));
                            } else {
                                this.lgStrSql.AppendLine(string.Format(" SUBJECT_BOLD_YN = {0}", Data.FilterVariable("N", true)));
                            }
                            this.lgStrSql.AppendLine(string.Format(" CONTENT = {0}", Data.FilterVariable(cb_args.htmlbody.Replace("'", "''"), true, true)));
                            //using (MemoryStream mStream = new MemoryStream()) {
                            //    heContent.Export(DevExpress.Web.ASPxHtmlEditor.HtmlEditorExportFormat.Txt, mStream);
                            //    lgStrSql.AppendLine(string.Format(" CONTENT_PLAIN = {0}", Data.FilterVariable(Encoding.UTF8.GetString(mStream.ToArray()), true, true)));
                            //}
                            this.lgStrSql.AppendLine(string.Format(" CONTENT_PLAIN = {0}", Data.FilterVariable(string.Empty, true, true)));
                            var optionsEFlag = 0;
                            if (this.chkIsSearch.Checked) {
                                optionsEFlag += 1;
                            }
                            if (this.rdolPublicSetting.Value.ToString() == "L") {
                                optionsEFlag += 2;
                            }
                            if (this.chkIsPublicBizArea.Checked) {
                                optionsEFlag += 4;
                            }
                            if (this.chkIsPublicPlant.Checked) {
                                optionsEFlag += 8;
                            }
                            if (this.chkIsPublicDept.Checked) {
                                optionsEFlag += 16;
                            }
                            if (this.chkIsWorkPlace.Checked) {
                                optionsEFlag += 32;
                            }
                            if (this.chkIsLocalPartner.Checked) {
                                optionsEFlag += 64;
                            }
                            if (this.chkIsCustomer.Checked) {
                                optionsEFlag += 128;
                            }
                            if (this.chkIsExternalPartner.Checked) {
                                optionsEFlag += 256;
                            }
                            this.lgStrSql.Append(string.Format(" OPTIONS_FLAG = {0}", Data.FilterVariable(optionsEFlag, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true)));
                            this.lgStrSql.AppendLine(string.Format(" EDIT = {0}", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true)));
                            this.lgStrSql.AppendLine(string.Format(" TAG = {0}", Data.FilterVariable(this.txtTags.Value, true, false)));
                            this.lgStrSql.AppendLine(" FROM B_BBS A ");
                            this.lgStrSql.AppendLine(string.Format(" WHERE A.NO = {0}", cb_args.bid));

                            this.lgDbBatAccess.ExecuteNonQuery(this.lgStrSql.ToString());

                            this.lgStrSql = new StringBuilder();
                            this.lgStrSql.AppendLine(" SELECT MAX(FILE_NO) ");
                            this.lgStrSql.AppendLine(" FROM B_BBS_ATTACH (NOLOCK) ");
                            this.lgStrSql.AppendLine(string.Format(" WHERE NO = {0}", cb_args.bid));

                            var attachFileMaxNo = this.lgDbBatAccess.ExecuteScalar(this.lgStrSql.ToString());
                            var keyNo = 0;
                            if (string.IsNullOrWhiteSpace(attachFileMaxNo.ToString()) == false) {
                                keyNo = int.Parse(attachFileMaxNo.ToString()) + 1;
                            }
                            //첨부파일 데이터 베이스에 저장
                            for (int i = 0; i < cb_args.attachments.Rows.Count; i++) {
                                if (System.IO.File.Exists(cb_args.attachments.Rows[i]["physical_file_path"].ToString()) && cb_args.attachments.Rows[i]["recent"].ToString() == "Y") {
                                    var fileName = Path.GetFileName(cb_args.attachments.Rows[i]["physical_file_path"].ToString());
                                    var moveFilePath = string.Empty;
                                    cb_args.attachments.Rows[i]["temp_file_name"] = cb_args.bid + "_" + fileName;
                                    moveFilePath = Path.Combine(Global.gDirectorys.GetSpecialDirectory(PathKind.Board, PathFormatter.FullPhysicalPath, PathType.Attach,
                                                                    (this.cboCategory.Value.ToString().ToLower() == "bbs_dept" ? this.cboCategoryGroup.Value.ToString().ToUpper() : this.cboCategory.Value.ToString().ToUpper()), false),
                                                                cb_args.attachments.Rows[i]["temp_file_name"].ToString());
                                    if (!Directory.Exists(Path.GetDirectoryName(moveFilePath))) {
                                        Directory.CreateDirectory(Path.GetDirectoryName(moveFilePath));
                                    }
                                    System.IO.File.Move(cb_args.attachments.Rows[i]["physical_file_path"].ToString(), moveFilePath);
                                }

                                if (cb_args.attachments.Rows[i]["recent"].ToString() == "Y") {
                                    this.lgStrSql = new StringBuilder();
                                    this.lgStrSql.AppendLine("INSERT INTO B_BBS_ATTACH (NO, CATEGORY_CD, FILE_NO, FILE_NAME, PHY_FILE_NAME, FILE_SIZE, FILE_EXT, CUST_FILE_SIZE, CONTENT_TYPE, DELETED_YN)");
                                    this.lgStrSql.Append(" VALUES ( ");
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                    this.lgStrSql.Append(Data.FilterVariable((this.cboCategory.Value.ToString().ToLower() == "bbs_dept" ? this.cboCategoryGroup.Value.ToString().ToUpper() : this.cboCategory.Value.ToString().ToUpper()), true));
                                    this.lgStrSql.Append(Data.FilterVariable(keyNo++, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_name"], true, true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["temp_file_name"], true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_size"], true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["file_extantion"], true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["custom_file_size"], true));
                                    this.lgStrSql.Append(Data.FilterVariable(cb_args.attachments.Rows[i]["content_type"], true));
                                    this.lgStrSql.Append(Data.FilterVariable("N"));
                                    this.lgStrSql.AppendLine(" ) ");

                                    this.lgDbBatAccess.ExecuteNonQuery(this.lgStrSql.ToString());
                                }
                            }
                        }

                        this.lgDbBatAccess.BatchProcessEnd();
                    } catch(System.Exception ex) {
                        this.lgDbBatAccess.BatchProcessRollback();
                        this.lgDbBatAccess.BatchProcessEnd();
                        throw ex;
                    }
                } else if (cb_args.Cmd == "save_tmp") {
                    cb_r_args.bid = 0;
                } else {
                    lgStrSql = new StringBuilder();
                    lgStrSql.AppendLine(" SELECT TOP(1) CATEGORY_CD, ");
                    //lgStrSql.AppendLine(string.Format(" CATEGORY_NM_{0} CATEGORY_NM, ", lgLang));
                    //lgStrSql.AppendLine(string.Format(" PATH_NAME_{0} PATH_NAME, ", lgLang));
                    lgStrSql.AppendLine(" CATEGORY_GROUP_CD, ");
                    //lgStrSql.AppendLine(" CATEGORY_GROUP_NM, ");
                    lgStrSql.AppendLine(" PARENT_NO, ");
                    lgStrSql.AppendLine(" PREFACE_CD, ");
                    //lgStrSql.AppendLine(" PREFACE_NM, ");
                    lgStrSql.AppendLine(" NOTICE_YN, ");
                    lgStrSql.AppendLine(" NOTICE_TO, ");
                    lgStrSql.AppendLine(" SECRET_YN, ");
                    lgStrSql.AppendLine(" SECRET_KEY, ");
                    lgStrSql.AppendLine(" SUBJECT, ");
                    lgStrSql.AppendLine(" SUBJECT_COLOR, ");
                    lgStrSql.AppendLine(" SUBJECT_BOLD_YN, ");
                    lgStrSql.AppendLine(" CONTENT, ");
                    lgStrSql.AppendLine(" FILE_CNT, ");
                    //lgStrSql.AppendLine(" CMT_CNT, ");
                    lgStrSql.AppendLine(" DATE, ");
                    lgStrSql.AppendLine(" EDIT, ");
                    //lgStrSql.AppendLine(" VISIT, ");
                    //lgStrSql.AppendLine(" RECOMMEND, ");
                    lgStrSql.AppendLine(" TAG, ");
                    lgStrSql.AppendLine(" OPTIONS_FLAG, ");
                    //lgStrSql.AppendLine(" WRITE_USER_ID, ");
                    //lgStrSql.AppendLine(" WRITE_USER_NM, ");
                    lgStrSql.AppendLine(" ROLE_PSTN, ");
                    lgStrSql.AppendLine(string.Format(" ROLE_PSTN_NM_{0} ROLE_PSTN_NM ", lgLang));
                    lgStrSql.AppendLine(" FROM V_BBS ");
                    lgStrSql.AppendLine(string.Format(" WHERE NO = {0} ", Data.FilterVariable(cb_args.bid, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                    lgStrSql.AppendLine(string.Format(" AND LOGIN_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                    var dt_b_bbs_detail = this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), new string[] { "B_BBS_DETAIL" }).Tables["B_BBS_DETAIL"];

                    if (dt_b_bbs_detail.Rows.Count == 0) {
                        return;
                    }

                    var dr_b_bbs_detail = dt_b_bbs_detail.Rows[0];
                    cb_r_args.category_cd = dr_b_bbs_detail.Field<string>("CATEGORY_CD");
                    cb_r_args.category_group_cd = dr_b_bbs_detail.Field<string>("CATEGORY_GROUP_CD");
                    if (cb_args.Cmd != "re") {
                        cb_r_args.preface_cd = dr_b_bbs_detail.Field<string>("PREFACE_CD");
                        cb_r_args.notice_yn = dr_b_bbs_detail.Field<string>("NOTICE_YN");
                        cb_r_args.notice_to = dr_b_bbs_detail.Field<string>("NOTICE_TO");
                        //cb_r_args.category_cd = dr_b_bbs_detail.Field<string>("SECRET_YN");
                        //cb_r_args.category_cd = dr_b_bbs_detail.Field<string>("SECRET_KEY");
                        cb_r_args.attachments = this.GetAttachments(cb_args.bid);
                        cb_r_args.subject = dr_b_bbs_detail.Field<string>("SUBJECT");
                        cb_r_args.subject_color = dr_b_bbs_detail.Field<string>("SUBJECT_COLOR");
                        cb_r_args.subject_bold_yn = dr_b_bbs_detail.Field<string>("SUBJECT_BOLD_YN");
                        cb_r_args.htmlbody = dr_b_bbs_detail.Field<string>("CONTENT");
                        cb_r_args.file_cnt = dr_b_bbs_detail.Field<int>("FILE_CNT");
                        //cb_r_args.category_cd = dr_b_bbs_detail.Field<string>("CMT_CNT");
                        //cb_r_args.date = dr_b_bbs_detail.Field<DateTime>("DATE");
                        //cb_r_args.edit = dr_b_bbs_detail.Field<DateTime>("EDIT");
                        //cb_r_args.category_cd = dr_b_bbs_detail.Field<string>("VISIT");
                        cb_r_args.tag = dr_b_bbs_detail.Field<string>("TAG");
                        cb_r_args.options_flag = dr_b_bbs_detail.Field<int>("OPTIONS_FLAG");
                    } else {
                        cb_r_args.subject = string.Format("{0} : {1}", GetResource("CSTRESX00126"), dr_b_bbs_detail.Field<string>("SUBJECT"));
                        var sbReBody = new StringBuilder();
                        sbReBody.Append("<p>&nbsp;</p><p>&nbsp;</p>");
                        sbReBody.AppendLine("<blockquote style=\"padding: 0 0 0 5px; margin: 0 0 0 5px;\">");
                        sbReBody.AppendLine("<div style=\"border-top:2px solid #bdc8db; padding: 3px 0 0 2px;\">");
                        sbReBody.Append(string.Format("<strong style=\"font-size:12px;\">Subject : </strong>{0}<br/>", dr_b_bbs_detail.Field<string>("SUBJECT")));
                        sbReBody.Append("</div><p>&nbsp;</p>");
                        sbReBody.Append(dr_b_bbs_detail.Field<string>("CONTENT"));
                        sbReBody.Append("<p>&nbsp;</p>");
                        sbReBody.AppendLine("</blockquote>");
                        cb_r_args.htmlbody = sbReBody.ToString();
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
            public new string Data { get; set; }
            public string bccd { get; set; }
            public long bid { get; set; }
            public int cmt_no { get; set; }
        }
        private class CustomCallBackResultArgs : BaseCallbackResultArgs {
            public string bccd { get; set; }
            public string bcnm { get; set; }
        }
        protected void cbProcess_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs<CustomCallBackResultArgs>();
            var cb_args = default(CustomCallBackArgs);
            try {
                cb_args = CustomCallBackArgs.GetDeserialize<CustomCallBackArgs>(e.Parameter);
                if (cb_args == null)
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                else
                    cb_r_args.Bind(cb_args);
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
                e.Result = cb_r_args.GetSerialize();
                return;
            }
            
            try {
                
            } catch (System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }
        #endregion

        #endregion

        #region ■■ 5.2.2 User-defined function group
        void LoadSystemCategorys(DataTable dtCategorys) {
            var s_dt = dtCategorys.Select("CATEGORY_LVL = 0 AND CATEGORY_TYPE = 'P' AND SYSTEM_BBS = 'Y'");
            var recent_sum = dtCategorys.AsEnumerable().Sum(row => row.Field<int>("RECENT_CNT"));
            if (s_dt.Count() > 0) {
                var dt = s_dt.CopyToDataTable();
                var bbs_all = dt.NewRow();
                bbs_all.SetField<string>("CATEGORY_CD", "BBS_ALL");
                bbs_all.SetField<string>("PARENT_CATEGORY_CD", "BOARD");
                bbs_all.SetField<string>("CATEGORY_SEQ", "000");
                bbs_all.SetField<string>("CATEGORY_NM", GetResource("CSTRESX00127"));
                bbs_all.SetField<string>("CATEGORY_DES", GetResource("CSTRESX00128"));
                bbs_all.SetField<int>("RECENT_CNT", recent_sum);
                bbs_all.SetField<string>("CATEGORY_TYPE", "P");
                bbs_all.SetField<int>("CATEGORY_LVL", 0);
                bbs_all.SetField<string>("SYSTEM_BBS", "Y");
                dt.Rows.Add(bbs_all);
                dt.DefaultView.Sort = "CATEGORY_SEQ ASC";
                this.rtSystemCategorys.DataSource = dt.DefaultView.ToTable();
                this.rtSystemCategorys.DataBind();
            }
        }
        void LoadOtherCategorys(DataTable dtCategorys) {
            var s_dt = dtCategorys.Select("CATEGORY_LVL = 0 AND CATEGORY_TYPE = 'M' AND SYSTEM_BBS = 'N'");
            if (s_dt.Count() > 0) {
                var dt = s_dt.OrderBy(row => row.Field<string>("CATEGORY_SEQ")).CopyToDataTable();
                this.rtGroupCategorys.DataSource = dt;
                this.rtGroupCategorys.DataBind();
            }
        }
        protected string GetSe2LangPath() {
            switch (this.lgLang) {
                default:
                case "KO": return "ko_KR";
                case "EN": return "en_US";
                case "CN": return "zh_CN";
                case "JP": return "ja_JP";
            }
        }

        protected DataTable GetAttachments(long lNo) {
            var dt_datatable = this.GetAttachmentsDataTable();
            if (lNo <= 0) {
                return dt_datatable;
            }
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT A.CATEGORY_CD, ");
            lgStrSql.AppendLine(" 	A.FILE_NO, ");
            lgStrSql.AppendLine(" 	A.FILE_NAME, ");
            lgStrSql.AppendLine(" 	A.PHY_FILE_NAME, ");
            lgStrSql.AppendLine(" 	A.FILE_SIZE, ");
            lgStrSql.AppendLine(" 	A.FILE_EXT, ");
            lgStrSql.AppendLine(" 	A.CUST_FILE_SIZE, ");
            lgStrSql.AppendLine(" 	A.CONTENT_TYPE, ");
            lgStrSql.AppendLine(" 	B.DEPT_CD ");
            lgStrSql.AppendLine(" FROM B_BBS_ATTACH A (NOLOCK) ");
            lgStrSql.AppendLine(" LEFT JOIN B_BBS B (NOLOCK) ON(A.NO = B.NO) ");
            lgStrSql.AppendLine(string.Format(" WHERE A.NO = {0} ", lNo));
            lgStrSql.AppendLine(" AND A.DELETED_YN = 'N' ");

            var dt_attch = this.lgDbAccess.ExecuteDataSet(this.lgStrSql.ToString(), "B_BBS_ATTACH").Tables["B_BBS_ATTACH"];

            var str_root_path = string.Empty;
            foreach (DataRow row in dt_attch.Rows) {
                if (string.IsNullOrWhiteSpace(str_root_path)) {
                    str_root_path = Global.gDirectorys.GetSpecialDirectory(PathKind.Board, PathFormatter.FullPhysicalPath, PathType.Attach,
                                        (row.Field<string>("CATEGORY_CD").ToLower() == "bbs_dept" ? row.Field<string>("DEPT_CD").ToUpper() : row.Field<string>("CATEGORY_CD").ToUpper()), false);
                }
                var n_row = dt_datatable.NewRow();
                n_row["temp_file_name"] = row.Field<string>("PHY_FILE_NAME");
                n_row["file_name"] = row.Field<string>("FILE_NAME");
                n_row["file_size"] = row.Field<int>("FILE_SIZE");
                n_row["custom_file_size"] = hMailServerService.SocketLayer.StringFormat.ConvertFileSize(row.Field<int>("FILE_SIZE"));
                if (row.Field<string>("FILE_NAME").Contains(".")) {
                    n_row["file_extantion"] = Path.GetExtension(row.Field<string>("FILE_NAME")).Replace(".", "").ToUpper();
                } else {
                    n_row["file_extantion"] = GetResource("CSTRESX00135");
                }
                n_row["content_type"] = hMailServerProvider.GetFileType(row.Field<string>("CONTENT_TYPE"));
                n_row["physical_file_path"] = Path.Combine(str_root_path, n_row["temp_file_name"].ToString());
                n_row["recent"] = "N";
                n_row["deleted"] = "N";
                dt_datatable.Rows.Add(n_row);
            }
            return dt_datatable;
        }

        protected DataTable GetAttachmentsDataTable() {
            var attachment = new DataTable();
            attachment.Columns.Add("temp_file_name", typeof(string));
            attachment.Columns.Add("file_name", typeof(string));
            attachment.Columns.Add("file_size", typeof(long));
            attachment.Columns.Add("custom_file_size", typeof(string));
            attachment.Columns.Add("file_extantion", typeof(string));
            attachment.Columns.Add("content_type", typeof(string));
            attachment.Columns.Add("physical_file_path", typeof(string));
            attachment.Columns.Add("recent", typeof(string));
            attachment.Columns.Add("deleted", typeof(string));
            return attachment;
        }

        #region GetHtmlAttachmentFiles

        string GetHtmlAttachmentFiles(DataTable attachments) {
            if (attachments.Rows.Count > 0) {
                var sbHTMLAttachFiles = new StringBuilder();
                sbHTMLAttachFiles.AppendLine("<div style=\"width: 100%;\">");
                sbHTMLAttachFiles.AppendLine("<table width=\"100%\" style=\"border: 0px currentColor; border-image: none; table-layout: fixed;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
                sbHTMLAttachFiles.AppendLine("<tbody>");
                sbHTMLAttachFiles.AppendLine("<tr>");
                sbHTMLAttachFiles.AppendLine("<td width=\"15\" style=\"border: 0px currentColor; border-image: none;\">");
                sbHTMLAttachFiles.AppendLine(string.Format("&nbsp;<img width=\"12\" height=\"16\" alt=\"{0}\" src=\"{1}contents/images/ico-attachFile.png\" />", GetResource("CSTRESX00131"), lgUrlInfo.VirtualPath)); //style=\"padding-top: 5px;\"
                sbHTMLAttachFiles.AppendLine("</td>");
                sbHTMLAttachFiles.AppendLine("<td style=\"border: 0px currentColor; border-image: none;\">");
                sbHTMLAttachFiles.AppendLine(string.Format("<strong>&nbsp;{0}</strong>&nbsp;<span style=\"color: rgb(56, 182, 1);\"> {1}{2}</span>", GetResource("CSTRESX00131"), attachments.Rows.Count, GetResource("CSTRESX00101")));
                sbHTMLAttachFiles.AppendLine("</td>");
                sbHTMLAttachFiles.AppendLine("</tr>");
                sbHTMLAttachFiles.AppendLine("<tr><td height=\"5\" colspan=3 style=\"height: 5px; font-size: 0px; border: 0px currentColor; border-image: none;\"></td></tr>");
                sbHTMLAttachFiles.AppendLine("</tbody>");
                sbHTMLAttachFiles.AppendLine("</table>");
                sbHTMLAttachFiles.AppendLine("<table width=\"100%\" style=\"border: 0px currentColor; border-image: none; table-layout: fixed;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
                sbHTMLAttachFiles.AppendLine("<tbody>");

                for (int i = 0; i < attachments.Rows.Count; i++) {
                    sbHTMLAttachFiles.AppendLine("<tr>");
                    sbHTMLAttachFiles.AppendLine(string.Format("<td style=\"border-width: {0}px 1px 0px; border-style: solid solid none; border-color: rgb(237, 237, 238); border-image: none;\" colspan=\"2\">", (i == 0 ? 1 : 0)));
                    sbHTMLAttachFiles.AppendLine("<table width=\"100%\" height=\"100%\" style=\"border-width: 0px 0px 1px; border-bottom-color: #ededee; border-bottom-style: solid; table-layout: fixed; border-lef-width: 0px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
                    sbHTMLAttachFiles.AppendLine("<tbody>");
                    sbHTMLAttachFiles.AppendLine("<tr>");
                    sbHTMLAttachFiles.AppendLine("<td width=\"20\" align=\"center\" valign=\"middle\" style=\"border: 0px currentColor; border-image: none; width: 20px;\">");
                    sbHTMLAttachFiles.AppendLine(string.Format("<a href=\"" + lgUrlInfo.VirtualPath + "webcontent/common/filedown.ashx?cmd=boardfile&no={0}&fno={1}&userid={2}\" target=\"_blank\">", attachments.Rows[i]["NO"], attachments.Rows[i]["FILE_NO"], lgACT.UserId));
                    sbHTMLAttachFiles.AppendLine(string.Format("<img width=\"17\" height=\"17\" style=\"vertical-align: middle;\" alt=\"{0}\" src=\"{1}contents/Images/ico-savepc.png\" border=\"0\">", GetResource("CSTRESX00132"), lgUrlInfo.VirtualPath));
                    sbHTMLAttachFiles.AppendLine("</a>");
                    sbHTMLAttachFiles.AppendLine("</td>");
                    sbHTMLAttachFiles.AppendLine("<td width=\"100%\" align=\"left\" valign=\"middle\" style=\"border: 0px currentColor; border-image: none; padding: 3px 7px; width: auto; line-height: 17px;\">");
                    sbHTMLAttachFiles.AppendLine(string.Format(string.Format("<a title=\"{{0}}\" style=\"vertical-align: middle; color: rgb(51, 51, 51); overflow: hidden; font-size: 12px; text-decoration: none; display: block; white-space: nowrap; -ms-text-overflow: ellipsis;\" href=\"{0}webcontent/common/filedown.ashx?cmd=boardfile&no={{1}}&fno={{2}}&userid={{3}}\" target=\"_blank\">", lgUrlInfo.VirtualPath), attachments.Rows[i]["FILE_NAME"], attachments.Rows[i]["NO"], attachments.Rows[i]["FILE_NO"], lgACT.UserId));
                    sbHTMLAttachFiles.AppendLine(string.Format("{0} <span style=\"color: rgb(153, 153, 153); font-family: tahoma; font-size: 11px;\">{1}</span>", attachments.Rows[i]["FILE_NAME"], attachments.Rows[i]["CUST_FILE_SIZE"]));
                    sbHTMLAttachFiles.AppendLine("</a>");
                    sbHTMLAttachFiles.AppendLine("</td>");
                    sbHTMLAttachFiles.AppendLine("</tr>");
                    sbHTMLAttachFiles.AppendLine("</tbody>");
                    sbHTMLAttachFiles.AppendLine("</table>");
                    sbHTMLAttachFiles.AppendLine("</td>");
                    sbHTMLAttachFiles.AppendLine("</tr>");
                }

                sbHTMLAttachFiles.AppendLine("</tbody>");
                sbHTMLAttachFiles.AppendLine("</table>");
                sbHTMLAttachFiles.AppendLine("<table width=\"100%\" style=\"border: 0px currentColor; border-image: none; table-layout: fixed;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
                sbHTMLAttachFiles.AppendLine("<tbody>");
                sbHTMLAttachFiles.AppendLine("<tr><td height=\"7\" style=\"border: 0px currentColor; border-image: none;\"></td></tr>");
                sbHTMLAttachFiles.AppendLine("<tr><td height=\"1\" style=\"border-top-color: rgb(237, 237, 238); border-top-width: 1px; border-right-width: 0px; border-bottom-width: 0px; border-top-style: solid; border-lef-width: 0px;\"></td></tr>");
                sbHTMLAttachFiles.AppendLine("<tr><td height=\"20\" style=\"border: 0px currentColor; border-image: none;\"></td></tr>");
                sbHTMLAttachFiles.AppendLine("</tbody>");
                sbHTMLAttachFiles.AppendLine("</table>");
                sbHTMLAttachFiles.AppendLine("</div>");

                return sbHTMLAttachFiles.ToString();
            } else {
                return string.Empty;
            }
        }
       
        #endregion

        #endregion

        #endregion

        #endregion
    }
}