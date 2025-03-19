using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.Common.Popup;
using eniFramework.WebApp.Common.Annotations;

namespace eniFramework.WebApp.Common {
    public partial class CommonPage : MasterPage {
       
        readonly string CST_APP_VERSION = null;
        const string CST_LINK_HREF_CSS = "../../Contents/eniWeb.css";
        const string CST_SCRT_SRC_JSON = "Scripts/Json/Json2.js";
        const string CST_SCRT_SRC_JQUERY = "Scripts/jQuery/jQuery-1.9.1.js";
        const string CST_SCRT_SRC_JQUERY_MIN = "Scripts/jQuery/jQuery-1.9.1.min.js";
        const string CST_SCRT_SRC_JQUERY_MIGRATE = "Scripts/jQuery/jQuery-Migrate-1.2.1.js";
        const string CST_SCRT_SRC_JQUERY_MIGRATE_MIN = "Scripts/jQuery/jQuery-Migrate-1.2.1.min.js";
        const string CST_SCRT_SRC_JQUERY_COOKIE = "Scripts/jQuery/jQuery.Cookie.js";
        const string CST_SCRT_SRC_JQUERY_BLOCKUI = "Scripts/jQuery/jQuery.BlockUI.js";
        const string CST_SCRT_SRC_JQUERY_HISTORY = "Scripts/jQuery/jQuery.History.js";
        const string CST_SCRT_SRC_JQUERY_HISTORY_MIN = "Scripts/jQuery/jQuery.History.min.js";
        const string CST_SCRT_SRC_FRAMEWORK_JQUERY_EXTENDS = "Scripts/jQuery/jQuery.Extends.js";
        const string CST_SCRT_SRC_FRAMEWORK_EXTENDS = "Scripts/Framework/eniFramework.Extends.js";
        //const string CST_SCRT_SRC_FRAMEWORK_RESOURCES = "Scripts/Framework/eniFramework.Resources.js";
        const string CST_SCRT_SRC_FRAMEWORK_ENUM = "Scripts/Framework/eniFramework.Enum.js";
        const string CST_SCRT_SRC_FRAMEWORK_CLASSS = "Scripts/Framework/eniFramework.Classs.js";
        const string CST_SCRT_SRC_FRAMEWORK = "Scripts/Framework/eniFramework.js";
        const string CST_SCRT_SRC_FRAMEWORK_COOKIE = "Scripts/Framework/eniFramework.Cookie.js";
        const string CST_SCRT_SRC_FRAMEWORK_VARIABLES = "Scripts/Framework/eniFramework.Variables.js";
        const string CST_SCRT_SRC_FRAMEWORK_MESSAGE = "Scripts/Framework/eniFramework.Message.js";
        const string CST_SCRT_SRC_FRAMEWORK_SUB_MESSAGE = "Scripts/Framework/eniFramework.Sub.Message.js";
        const string CST_SCRT_SRC_FRAMEWORK_LOADING = "Scripts/Framework/eniFramework.Loading.js";
        const string CST_SCRT_SRC_FRAMEWORK_SUB_LOADING = "Scripts/Framework/eniFramework.Sub.Loading.js";
        const string CST_SCRT_SRC_FRAMEWORK_CONTROLBASE = "Scripts/Framework/eniFramework.ControlBase.js";
        const string CST_SCRT_SRC_FRAMEWORK_USERAGENT = "Scripts/Framework/eniFramework.UserAgent.js";
        const string CST_SCRT_SRC_FRAMEWORK_LOG = "Scripts/Framework/eniFramework.Log.js";
        const string CST_SCRT_SRC_FRAMEWORK_REPORT = "Scripts/Framework/eniFramework.Report.js";
        const string CST_SCRT_SRC_FRAMEWORK_POPUP = "Scripts/Framework/eniFramework.Popup.js";
        const string CST_SCRT_SRC_FRAMEWORK_SUB_POPUP = "Scripts/Framework/eniFramework.Sub.Popup.js";
        const string CST_SCRT_SRC_FRAMEWORK_AJAX = "Scripts/Framework/eniFramework.Ajax.js";
        const string CST_SCRT_SRC_FRAMEWORK_DBACCESS = "Scripts/Framework/eniFramework.DbAccess.js";
        const string CST_SCRT_SRC_FRAMEWORK_DATE = "Scripts/Framework/eniFramework.Date.js";
        const string CST_SCRT_SRC_FRAMEWORK_SECURITY = "Scripts/Framework/eniFramework.Security.js";
        const string CST_SCRT_SRC_FRAMEWORK_UTILS = "Scripts/Framework/eniFramework.Utils.js";

        const string CST_LINK_EXT_3_HREF_CSS = "../../Scripts/ExtJS/ExtJS-3.3.0/resources/css/ext-all.css";
        const string CST_LINK_EXT_3_XTHEME_GRAY_HREF_CSS = "../../Scripts/ExtJS/ExtJS-3.3.0/resources/css/xtheme-gray.css";
        const string CST_SCRT_SRC_EXT_3_BASE = "Scripts/ExtJS/ExtJS-3.3.0/adapter/ext/ext-base.js";
        const string CST_SCRT_SRC_EXT_3_ALL = "Scripts/ExtJS/ExtJS-3.3.0/ext-all.js";
        const string CST_SCRT_SRC_EXT_3_UX_ALL = "Scripts/ExtJS/ExtJS-3.3.0/ext-ux-all.js";
        const string CST_SCRT_SRC_EXT_3_LANG = "Scripts/ExtJS/ExtJS-3.3.0/locale/ext-lang-";

        const string CST_LG_MESSAGEBOX_VIR_PATH = "WebContent/Common/Control/Popup/MessageBox.ascx";
        const string CST_LG_MESSAGEBOX_CLIENT_INSTANCE_NM = "gMessageBox";
        const string CST_LG_LOADINGBOX_VIR_PATH = "WebContent/Common/Control/Popup/LoadingBox.ascx";
        const string CST_LG_LOADINGBOX_CLIENT_INSTANCE_NM = "gLoadingBox";
        const string CST_LG_CONFIRMBOX_VIR_PATH = "WebContent/Common/Control/Popup/ConfirmBox.ascx";
        const string CST_LG_CONFIRMBOX_CLIENT_INSTANCE_NM = "gConfirmBox";

        public IBaseUIPage BasePage { get { return this.Page as IBaseUIPage; ;} }
        public eniHiddenField HiddenFields { 
            get {
                if(BasePage.RegisteredHiddenField) {
                    return hidFileds;
                } else {
                    return null;
                }
            } 
        }

        public CommonPage() {
            CST_APP_VERSION = Global.gEnvironmonts.ApplicationVersion.Replace(".", "");
        }

       
        protected void Page_Init(object sender, EventArgs e) {
            if (hidFileds != null & BasePage != null) {
                hidFileds.Enabled = BasePage.RegisteredHiddenField && BasePage.RegisteredServerControls;
            }

            var ctr_index = 1;
#if DEBUG
            var app_path = ResolveUrl("~");
#else
            var app_path = "/";
#endif

            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"vs_defaultClientScript\" content=\"JavaScript\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"vs_targetSchema\" content=\"http://schemas.microsoft.com/intellisense/ie5\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta charset=\"utf-8\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"referrer\" content=\"always\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"format-detection\" content=\"telephone=no,address=no,email=no\" />"));

            if (BasePage != null) {
                if (!string.IsNullOrWhiteSpace(BasePage.MetaAppName)) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetControl(string.Format("<meta name=\"application-name\" content=\"{0}\" />", BasePage.MetaAppName)));
                }
                if (!string.IsNullOrWhiteSpace(BasePage.MetaAuthor)) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetControl(string.Format("<meta name=\"author\" content=\"{0}\" />", BasePage.MetaAuthor)));
                }
                if (!string.IsNullOrWhiteSpace(this.Page.MetaKeywords)) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetControl(string.Format("<meta name=\"keywords\" lang=\"{0}\" content=\"{1}\" />", EnumDef.ConvertLangToCulture(BasePage.lgLang.ToLower()), this.Page.MetaKeywords)));
                }
                if (!string.IsNullOrWhiteSpace(this.Page.MetaDescription)) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetControl(string.Format("<meta name=\"description\" lang=\"{0}\" content=\"{1}\" />", EnumDef.ConvertLangToCulture(BasePage.lgLang.ToLower()), this.Page.MetaDescription)));
                }
            }

            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"robots\" content=\"noindex,nofollow\" />"));
            //모바일 페이지에만 삽입하자 스윙브라우저에서 오판한다.(나중에 개발)
            //this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta name=\"viewport\" content=\"width=device-width\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta http-equiv=\"imagetoolbar\" content=\"no\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"));
            this.Page.Header.Controls.AddAt(ctr_index++, GetControl("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"));

            //if ((BasePage.RegisteredScriptExt & JScriptExt.Ext3) == JScriptExt.Ext3) {
            //    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_EXT_3_HREF_CSS", CST_LINK_EXT_3_HREF_CSS));
            //    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_EXT_3_XTHEME_GRAY_HREF_CSS", CST_LINK_EXT_3_XTHEME_GRAY_HREF_CSS));
            //}
            //this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_HREF_CSS", CST_LINK_HREF_CSS));

            if(BasePage != null) {
#if DEBUG
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Json) == JScriptKind.Json) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JSON", app_path + CST_SCRT_SRC_JSON));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery) == JScriptKind.jQuery) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JQUERY", app_path + CST_SCRT_SRC_JQUERY));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_Migrate) == JScriptKind.jQuery_Migrate) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JQUERY_MIGRATE", app_path + CST_SCRT_SRC_JQUERY_MIGRATE));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_Cookie) == JScriptKind.jQuery_Cookie) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JQUERY_COOKIE", app_path + CST_SCRT_SRC_JQUERY_COOKIE));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_BlockUI) == JScriptKind.jQuery_BlockUI) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JQUERY_BLOCKUI", app_path + CST_SCRT_SRC_JQUERY_BLOCKUI));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_History) == JScriptKind.jQuery_History) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_JQUERY_HISTORY", app_path + CST_SCRT_SRC_JQUERY_HISTORY));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_jQuery_Extends) == JScriptKind.Framework_jQuery_Extends) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_JQUERY_EXTENDS", app_path + CST_SCRT_SRC_FRAMEWORK_JQUERY_EXTENDS));
                }

                if ((BasePage.RegisteredScriptExt & JScriptExt.Ext3) == JScriptExt.Ext3) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_EXT_3_BASE", app_path + CST_SCRT_SRC_EXT_3_BASE));
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_EXT_3_ALL", app_path + CST_SCRT_SRC_EXT_3_ALL));
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_EXT_3_UX_ALL", app_path + CST_SCRT_SRC_EXT_3_UX_ALL));
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_EXT_3_LANG", app_path + CST_SCRT_SRC_EXT_3_LANG + BasePage.lgLang.ToLower() + ".js"));
                }

                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Extends) == JScriptKind.Framework_Extends) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_EXTENDS", app_path + CST_SCRT_SRC_FRAMEWORK_EXTENDS));
                }
                //if((BasePage.RegisteredScripts & JScriptKind.Framework_Resources) == JScriptKind.Framework_Resources) {
                //    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CTR_FRAMEWORK_RESOURCES", CST_SCRT_SRC_FRAMEWORK_RESOURCES));
                //}
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Enum) == JScriptKind.Framework_Enum) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_ENUM", app_path + CST_SCRT_SRC_FRAMEWORK_ENUM));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Classs) == JScriptKind.Framework_Classs) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_CLASSS", app_path + CST_SCRT_SRC_FRAMEWORK_CLASSS));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework) == JScriptKind.Framework) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK", app_path + CST_SCRT_SRC_FRAMEWORK));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Cookie) == JScriptKind.Framework_Cookie) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_COOKIE", app_path + CST_SCRT_SRC_FRAMEWORK_COOKIE));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Variables) == JScriptKind.Framework_Variables) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_VARIABLES", app_path + CST_SCRT_SRC_FRAMEWORK_VARIABLES));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Message) == JScriptKind.Framework_Message) {
                    if (this.CheckReiterationPage()) {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_SUB_MESSAGE", app_path + CST_SCRT_SRC_FRAMEWORK_SUB_MESSAGE));
                    } else {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_MESSAGE", app_path + CST_SCRT_SRC_FRAMEWORK_MESSAGE));
                    }
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Loading) == JScriptKind.Framework_Loading) {
                    if (this.CheckReiterationPage()) {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_SUB_LOADING", app_path + CST_SCRT_SRC_FRAMEWORK_SUB_LOADING));
                    } else {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_LOADING", app_path + CST_SCRT_SRC_FRAMEWORK_LOADING));
                    }
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_ControlBase) == JScriptKind.Framework_ControlBase) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_CONTROLBASE", app_path + CST_SCRT_SRC_FRAMEWORK_CONTROLBASE));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_UserAgent) == JScriptKind.Framework_UserAgent) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_USERAGENT", app_path + CST_SCRT_SRC_FRAMEWORK_USERAGENT));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Log) == JScriptKind.Framework_Log) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_LOG", app_path + CST_SCRT_SRC_FRAMEWORK_LOG));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Report) == JScriptKind.Framework_Report) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_REPORT", app_path + CST_SCRT_SRC_FRAMEWORK_REPORT));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Popup) == JScriptKind.Framework_Popup) {
                    if (this.CheckReiterationPage()) {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_SUB_POPUP", app_path + CST_SCRT_SRC_FRAMEWORK_SUB_POPUP));
                    } else {
                        this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_POPUP", app_path + CST_SCRT_SRC_FRAMEWORK_POPUP));
                    }
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Ajax) == JScriptKind.Framework_Ajax) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_AJAX", app_path + CST_SCRT_SRC_FRAMEWORK_AJAX));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_DbAccess) == JScriptKind.Framework_DbAccess) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_DBACCESS", app_path + CST_SCRT_SRC_FRAMEWORK_DBACCESS));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Date) == JScriptKind.Framework_Date) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_DATE", app_path + CST_SCRT_SRC_FRAMEWORK_DATE));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Security) == JScriptKind.Framework_Security) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_SECURITY", app_path + CST_SCRT_SRC_FRAMEWORK_SECURITY));
                }
                if ((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Utils) == JScriptKind.Framework_Utils) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralScriptControl("CST_SCRT_SRC_FRAMEWORK_UTILS", app_path + CST_SCRT_SRC_FRAMEWORK_UTILS));
                }
#else
                //CSS 안의 이미지 상대경로문제로 사용하지 않음
                //if ((BasePage.RegisteredScriptExt & JScriptExt.Ext3) == JScriptExt.Ext3) {
                //    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_EXT_3_HREF_CSS", string.Format("./DX.ashx?cssfile={0}", ConvertReleseTypeHref(app_path + CST_LINK_EXT_3_HREF_CSS))));
                //    this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_EXT_3_XTHEME_GRAY_HREF_CSS", string.Format("./DX.ashx?cssfile={0}", ConvertReleseTypeHref(app_path + CST_LINK_EXT_3_XTHEME_GRAY_HREF_CSS))));
                //}
                //this.Page.Header.Controls.AddAt(ctr_index++, GetLiteralLinkControl("CST_LINK_HREF_CSS", string.Format("./DX.ashx?cssfile={0}", ConvertReleseTypeHref(app_path + CST_LINK_HREF_CSS))));

                var sb_scripts_url = new StringBuilder();
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Json) == JScriptKind.Json) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JSON));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery) == JScriptKind.jQuery) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JQUERY_MIN));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_Migrate) == JScriptKind.jQuery_Migrate) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JQUERY_MIGRATE_MIN));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_Cookie) == JScriptKind.jQuery_Cookie) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JQUERY_COOKIE));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_BlockUI) == JScriptKind.jQuery_BlockUI) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JQUERY_BLOCKUI));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.jQuery_History) == JScriptKind.jQuery_History) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_JQUERY_HISTORY_MIN));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_jQuery_Extends) == JScriptKind.Framework_jQuery_Extends) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_JQUERY_EXTENDS));
                }

                if ((BasePage.RegisteredScriptExt & JScriptExt.Ext3) == JScriptExt.Ext3) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_EXT_3_BASE));
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_EXT_3_ALL));
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_EXT_3_UX_ALL));
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_EXT_3_LANG + BasePage.lgLang.ToLower() + ".js"));
                }

                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Extends) == JScriptKind.Framework_Extends) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_EXTENDS));
                }
                //if((BasePage.RegisteredScripts & JScriptKind.Framework_Resources) == JScriptKind.Framework_Resources) {
                //    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_RESOURCES));
                //}
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Enum) == JScriptKind.Framework_Enum) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_ENUM));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Classs) == JScriptKind.Framework_Classs) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_CLASSS));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework) == JScriptKind.Framework) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Cookie) == JScriptKind.Framework_Cookie) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_COOKIE));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Variables) == JScriptKind.Framework_Variables) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_VARIABLES));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Message) == JScriptKind.Framework_Message) {
                    if(this.CheckReiterationPage()) {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_SUB_MESSAGE));
                    } else {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_MESSAGE));
                    }
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Loading) == JScriptKind.Framework_Loading) {
                    if(this.CheckReiterationPage()) {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_SUB_LOADING));
                    } else {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_LOADING));
                    }
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_ControlBase) == JScriptKind.Framework_ControlBase) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_CONTROLBASE));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_UserAgent) == JScriptKind.Framework_UserAgent) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_USERAGENT));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Log) == JScriptKind.Framework_Log) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_LOG));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Report) == JScriptKind.Framework_Report) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_REPORT));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Popup) == JScriptKind.Framework_Popup) {
                    if(this.CheckReiterationPage()) {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_SUB_POPUP));
                    } else {
                        sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_POPUP));
                    }
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Ajax) == JScriptKind.Framework_Ajax) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_AJAX));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_DbAccess) == JScriptKind.Framework_DbAccess) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_DBACCESS));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Date) == JScriptKind.Framework_Date) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_DATE));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Security) == JScriptKind.Framework_Security) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_SECURITY));
                }
                if((BasePage.RegisteredScripts & JScriptKind.All) == JScriptKind.All || (BasePage.RegisteredScripts & JScriptKind.Framework_Utils) == JScriptKind.Framework_Utils) {
                    sb_scripts_url.Append(ConvertReleseTypeSrc(app_path + CST_SCRT_SRC_FRAMEWORK_UTILS));
                }

                if (sb_scripts_url.Length > 0) {
                    this.Page.Header.Controls.AddAt(ctr_index++, GetGenericScriptControl("CTR_SCRIPT_SET", string.Format("{0}/DX.ashx?jsfileset={1}", (ResolveUrl("~/") == "/" ? string.Empty : ResolveUrl("~/")), sb_scripts_url)));
                }
#endif
                if (string.IsNullOrWhiteSpace(this.html.Attributes["class"])) {
                    this.html.Attributes["class"] = "eni_Web";
                } else {
                    this.html.Attributes["class"] += " eni_Web";
                }

                if (BasePage != null && !string.IsNullOrWhiteSpace(BasePage.lgLang)) {
                    this.html.Attributes["lang"] = EnumDef.ConvertLangToCulture(BasePage.lgLang.ToLower());
                }

                if(string.IsNullOrWhiteSpace(BasePage.PageID) == false) {
                    this.html.Attributes["class"] += " " + BasePage.PageID;
                }

                if (string.IsNullOrWhiteSpace(this.head.Attributes["class"])) {
                    this.head.Attributes["class"] = "eni_Head";
                } else {
                    this.head.Attributes["class"] += " eni_Head";
                }

                if(string.IsNullOrWhiteSpace(BasePage.BodyClassName) == false) {
                    if(string.IsNullOrWhiteSpace(this.body.Attributes["class"])) {
                        this.body.Attributes["class"] = "eni_Body " + BasePage.BodyClassName;
                    } else {
                        this.body.Attributes["class"] += "eni_Body " + BasePage.BodyClassName;
                    }
                }

                if (string.IsNullOrWhiteSpace(this.frm.Attributes["class"])) {
                    this.frm.Attributes["class"] = "eni_Form";
                } else {
                    this.frm.Attributes["class"] += " eni_Form";
                }

                if (!BasePage.EnableContextMenu) {
                    this.body.Attributes["oncontextmenu"] = "return false;";
                }

                if (!BasePage.EnableDragable) {
                    this.body.Attributes["ondragstart"] = "return false;";
                }

                if (!BasePage.EnableSelectable) {
                    this.body.Attributes["onselectstrat"] = "return false;";
                    this.body.Attributes["style"] = "-webkit-touch-callout: none; -webkit-user-select: none; -khtml-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;";
                }

                return;

                //if (!BasePage.RegisteredServerControls)
                //    return;

                //if(this.Page.IsCallback == false) {
                //    var u_ctr_confirmbox = DynamicLoadControl<ConfirmBox>(CST_LG_CONFIRMBOX_VIR_PATH);
                //    if(u_ctr_confirmbox != null) {
                //        u_ctr_confirmbox.ID = CST_LG_CONFIRMBOX_CLIENT_INSTANCE_NM;
                //        //u_ctr_confirmbox.ClientInstanceName = CST_LG_CONFIRMBOX_CLIENT_INSTANCE_NM;
                //        this.Page.Form.Controls.Add(u_ctr_confirmbox);
                //    }

                //    var u_ctr_loadingbox = DynamicLoadControl<LoadingBox>(CST_LG_LOADINGBOX_VIR_PATH);
                //    if(u_ctr_loadingbox != null) {
                //        u_ctr_loadingbox.ID = CST_LG_LOADINGBOX_CLIENT_INSTANCE_NM;
                //        u_ctr_loadingbox.ClientInstanceName = CST_LG_LOADINGBOX_CLIENT_INSTANCE_NM;
                //        this.Page.Form.Controls.Add(u_ctr_loadingbox);
                //    }

                //    var u_ctr_messagebox = DynamicLoadControl<MessageBox>(CST_LG_MESSAGEBOX_VIR_PATH);
                //    if(u_ctr_messagebox != null) {
                //        u_ctr_messagebox.ID = CST_LG_MESSAGEBOX_CLIENT_INSTANCE_NM;
                //        u_ctr_messagebox.ClientInstanceName = CST_LG_MESSAGEBOX_CLIENT_INSTANCE_NM;
                //        this.Page.Form.Controls.Add(u_ctr_messagebox);
                //    }
                //} else {
                //    //var a = this.Page.Form.FindControl("lgConfirmBox");
                //    //var b = this.Page.Form.FindControl(CST_LG_LOADINGBOX_CLIENT_INSTANCE_NM);
                //    //var c = this.Page.Form.FindControl(CST_LG_MESSAGEBOX_CLIENT_INSTANCE_NM);
                //}
            }
        }


        protected void Page_Load(object sender, EventArgs e) {
            
        }

        protected void Page_PreRender(object sender, EventArgs e) {
            //aspx에 코딩된 서버측 바인딩 식에 연결한다.
            //이거하지 않으면 asp.net 코드 블록 코드들이 실행이 되지 않는다.
            //if (BasePage.EnableAutoBind) {
            //    DataBind();
            //}
        }

        public T DynamicLoadControl<T>(string sVirPath) {
            try {
                var ctr = this.Page.LoadControl(sVirPath);
                if(ctr is T) {
                    return (T)((object)ctr);
                } else {
                    return default(T);
                }
            } catch(System.Exception) {
                return default(T);
            }
        }

        public string ConvertReleseTypeSrc(string sUrl) {
            return string.Format("~{0};", sUrl);
        }
        public string ConvertReleseTypeHref(string sUrl) {
            return string.Format("~{0}", sUrl);
        }

        public LiteralControl GetControl(string strHtmlCode) {
            return new LiteralControl(strHtmlCode);
        }

        public LiteralControl GetLiteralLinkControl(string sID, string sHref) {

            if(string.IsNullOrWhiteSpace(sHref))
                return null;

            return new LiteralControl(string.Format("<link type=\"text/css\" rel=\"stylesheet\" href=\"{0}?v={1}\" />{2}", sHref, CST_APP_VERSION, Environment.NewLine)) {
                ID = sID
            };
//#if DEBUG
//            return new LiteralControl(string.Format("<link type=\"text/css\" rel=\"stylesheet\" href=\"{0}?v={1}\" />{2}", sHref, CST_APP_VERSION, Environment.NewLine)) { 
//                ID = sID 
//            };
//#else
//            return new LiteralControl(string.Format("<link type=\"text/css\" rel=\"stylesheet\" href=\"{0}&v={1}\" />{2}", sHref, CST_APP_VERSION, Environment.NewLine)) {
//                ID = sID
//            };
//#endif
        }

        public HtmlGenericControl GetGenericLinkControl(string sID, string sHref) {
            if(string.IsNullOrWhiteSpace(sHref))
                return null;

            var hg_ctr = new HtmlGenericControl("link") { 
                ID = sID 
            };
            hg_ctr.Attributes["rel"] = "stylesheet";
            hg_ctr.Attributes.Add("type", "text/css");
            
#if DEBUG
            hg_ctr.Attributes.Add("href", string.Format("{0}?v={1}", sHref, CST_APP_VERSION));
#else
            hg_ctr.Attributes.Add("href", string.Format("{0}&v={1}", sHref, CST_APP_VERSION));
#endif
            return hg_ctr;
        }

        public LiteralControl GetLiteralScriptControl(string sID, string sSrc) {
            if(string.IsNullOrWhiteSpace(sSrc))
                return null;
#if DEBUG
            return new LiteralControl(string.Format("<script type=\"text/javascript\" src=\"{0}?v={1}\"></script>{2}", sSrc, CST_APP_VERSION, Environment.NewLine)) {
                ID = sID
            };
#else
            return new LiteralControl(string.Format("<script type=\"text/javascript\" src=\"{0}&v={1}\"></script>{2}", sSrc, CST_APP_VERSION, Environment.NewLine)) {
                ID = sID
            };
#endif
        }

        public HtmlGenericControl GetGenericScriptControl(string sID, string sSrc) {
            if(string.IsNullOrWhiteSpace(sSrc))
                return null;

            var hg_ctr = new HtmlGenericControl("script") {
                ID = sID
            };
            hg_ctr.Attributes.Add("type", "text/javascript");

#if DEBUG
            hg_ctr.Attributes.Add("src", string.Format("{0}?v={1}", sSrc, CST_APP_VERSION));
#else
            hg_ctr.Attributes.Add("src", string.Format("{0}&v={1}", sSrc, CST_APP_VERSION));
#endif
            return hg_ctr;
        }

        private bool CheckReiterationPage() {
            return this.BasePage.GetType().GetCustomAttributes(typeof(ReiterationPageAttribute), true).Length > 0;
        }
    }
}