
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web;
using System.Data;
using System.Reflection;
using System.Diagnostics;
using System.Web.Routing;
using System.Threading;
using System.Web.Security;
using System.Web.SessionState;
using System.Globalization;
using System.Collections.Specialized;

using DevExpress.Web;

// eniFramework Reperence part
using eniFramework.Exception;
using eniFramework.Configuration;
using eniFramework.Security;
using eniFramework.Log;
using eniFramework.WebApp.Variables;
using eniFramework.DataAccess;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common.Properties;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.Annotations;


using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

#endregion

namespace eniFramework.WebApp.Core {
    /// <summary>
    /// BaseUIPage
    /// </summary>
    [DebuggerDisplay("lgPageID={lgPageID}, lgRouteID={lgRouteID}, lgRouteName={lgRouteName}, lgReqUrl={lgReqUrl}")]
    public class BaseUIACTPage : Page, IBaseUIPage {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Common.Base</NameSpace>
        /// <Module>②Base</Module>
        /// <Class>③BaseUIPage</Class>
        /// <Desc>④
        /// This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        /// <FirstCreated>
        /// <history name="creator"Date="created date">Make …</history>
        /// </FirstCreated>
        /// <Lastmodified>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        /// Page Event Sequence
        /// 01. BaseUIPage // Constructor
        /// 02. OnPreInit -> base.OnPreInit 
        /// 03. OnInit -> base.OnInit
        /// 04. OnPreLoad -> base.OnPreLoad
        /// 05. OnLoad -> base.OnLoad
        /// 06. OnLoadComplete -> base.OnLoadComplete
        /// 07. OnPreRender -> base.OnPreRender
        /// 08. OnPreRenderComplete -> base.OnPreRenderComplete
        /// 09. OnUnload -> base.OnUnload
        /// 99. OnError
        /// 
        /// eniFramework Page Event Sequence
        /// 01. BaseUIPage // Constructor
        /// 02. OnPreInit
        /// 03. BaseInitLocalGlobalVariables
        /// 04. BaseInitRoutingModuleInfo
        /// 05. BaseInitRequestParams
        /// 06. BaseInitViewHidFields
        /// 07. BaseInitSessionObj
        /// 08. BaseInitCommonVariables
        /// 09. BaseInitWebUser
        /// 10. base.OnPreInit
        /// 11. OnInit
        /// 12. OnInitWebUIPage
        /// 13. OnInitRoutingParams
        /// 14. OnInitRequestParams
        /// 15. OnInitDynamicControls
        /// 16. OnInitViewHidFields
        /// 17. OnInitVariables
        /// 18. OnInitConditionData
        /// 19. OnRequesting
        /// 20. OnReqProcessing, OnPostBackOrCallBackReqProcessing
        /// 21. base.OnPreLoad
        /// 22. OnLoad
        /// 23. base.OnLoad
        /// 24. SetDefulatValues
        /// 25. OnWebUIPageLoad
        /// 26. OnLoadComplete
        /// 27. OnWebUIPageLoadComplete
        /// 28. OnPreRender
        /// 29. OnPreRenderComplete
        /// 30. OnWebUIPageRenderComplete
        /// 31. OnUnload
        /// 32. base.OnUnload
        /// 98. OnError
        /// 99. base.OnError
        /// 
        /// Request.ServerVariables["APPL_MD_PATH"];
        /// Request.ServerVariables["APPL_PHYSICAL_PATH"];
        /// Request.ServerVariables["REMOTE_USER"];
        /// Request.ServerVariables["INSTANCE_I"];
        /// Request.ServerVariables["INSTANCE_META_PATH"];
        /// Request.ServerVariables["LOCAL_ADDR"];
        /// Request.ServerVariables["QUERY_STRING"];
        /// Request.ServerVariables["REMOTE_ADDR"];
        /// Request.ServerVariables["REMOTE_HOST"];
        /// Request.ServerVariables["REMOTE_PORT"];
        /// Request.ServerVariables["REQUEST_METHOD"];
        /// Request.ServerVariables["SERVER_NAME"];
        /// Request.ServerVariables["SERVER_PORT"];
        /// Request.ServerVariables["SERVER_PROTOCOL"];
        /// Request.ServerVariables["URL"];
        /// Request.ServerVariables["HTTP_CONNECTION"];
        /// Request.ServerVariables["HTTP_ACCEPT"];
        /// Request.ServerVariables["HTTP_ACCEPT_ENCODING"];
        /// Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
        /// Request.ServerVariables["HTTP_COOKIE"];
        /// Request.ServerVariables["HTTP_HOST"];
        /// Request.ServerVariables["HTTP_USER_AGENT"];
        /// 
        /// <remark name="modifier"Date="modified date">… </remark>
        /// <remark name="modifier"Date="modified date">… </remark>
        /// </Remarks>
        #endregion

        #region ▶ 1. Declaration part

        #region ■ 1.1 Global Constants

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        private NameValueCollection if_client_member_ = null;

        /// <summary>
        /// 전역 SQL 을 작성하는 문자열 변수입니다.
        /// </summary>
        protected StringBuilder lgStrSql = null;
        /// <summary>
        /// 전역 암호화 클래스 변수 입니다.
        /// </summary>
        private TripleDES lgSecurety_ = null;
        /// <summary>
        /// 서버측에 저장되는 메모리 데이터셋 변수 입니다.
        /// </summary>
        [Obsolete]
        private DataSet lgWorkDataSet_ = null;

        
        #endregion

        #region ■ 1.4 Class Global properties

        /// <summary>
        /// 데이터 베이스 엑세스를 가져옵니다.
        /// </summary>
        public DatabaseAccess lgDbAccess {
            get {
                if (this.CheckAuthorizePage()) {
                    if (this.lgACT != null) {
                        return (DatabaseAccess)lgACT.DbAccess;
                    } else {
                        return null;
                    }
                } else {
                    return (DatabaseAccess)Global.gDbAccess;
                }
            }
        }
        /// <summary>
        /// 데이터 베이스 배치형 엑세스를 가져옵니다.
        /// </summary>
        public DatabaseBatchAccess lgDbBatAccess {
            get {
                if (this.CheckAuthorizePage()) {
                    if (this.lgACT != null) {
                        return (DatabaseBatchAccess)lgACT.DbAccess;
                    } else {
                        return null;
                    }
                } else {
                    return (DatabaseBatchAccess)Global.gDbAccess;
                }
            }
        }
        /// <summary>
        /// 현재 작업 데이터 집합을 가져옵니다.
        /// </summary>
        [Obsolete]
        protected DataSet lgWorkDataSet { 
            get{
                if (lgWorkDataSet_ == null) {
                    throw new ExceptionManager(GetGlobalResource("GCSTRESX00105"));
                }
                return lgWorkDataSet_;
            }
            private set{
                if (value == null)
                    return;

                lgWorkDataSet_ = value;
            }
        }
        /// <summary>
        /// 공통 변수를 가져옵니다.
        /// </summary>
        public CommonVariable lgCommons { get; private set; }
        /// <summary>
        /// 로그인 사용자를 가져옵니다.
        /// </summary>
        public Account lgACT { get; private set; }

        /// <summary>
        /// 오류 리스트를 가져오거나 설정합니다.
        /// </summary>
        public ExceptionCollection lgExceptions { get; protected set; }
        /// <summary>
        /// 오류클래스를 설정하거나 가져옵니다.
        /// </summary>
        public System.Exception lgException { get; protected set; }
        protected TripleDES lgSecurety {
            get {
                if (this.lgSecurety_ == null) {
                    this.lgSecurety = new TripleDES(Global.gSecuritys.TripleDESKey, Global.gSecuritys.TripleDESBeginningKey);
                }
                return this.lgSecurety_;
            }
            set {
                if (value == null) {
                    return;
                }
                this.lgSecurety_ = value;
            }
        }

        public UrlInfo lgUrlInfo { get; private set; }
        public HostInfo lgHostInfo { get; private set; }
        public PageInfo lgPageInfo { get; private set; }
        public string SessionID { get; private set; }
        public string SessionHistoryNo { get; private set; }
        public Unit ClientWidth { get; private set; }
        public Unit ClientHeight { get; private set; }
        public virtual string PageID { get { return this.GetType().Name.Replace("_aspx", string.Empty); } }
        public virtual string BodyClassName { get { return this.GetType().Name.Replace("_aspx", string.Empty); } }
        public virtual string MetaAppName { get { return Global.gEnvironmonts.ApplicationName; } }
        public virtual string MetaAuthor { get { return string.Empty; } }
        /// <summary>
        /// 로그인이 필요한 페이지인지 여부를 가져옵니다.
        /// </summary>
        [DefaultValue(true)]
        [Obsolete]
        protected virtual bool NeedsToAuthenticate { get { return true; } }
        /// <summary>
        /// Sesssion 데이터 셋을 사용할것인지 여부를 설정합니다.
        /// </summary>
        [DefaultValue(false)]
        [Obsolete]
        protected virtual bool UsedSessionDataSet { get { return false; } }

        public string lgLang { get; protected set; }
        public virtual JScriptExt RegisteredScriptExt { get { return JScriptExt.None; } }
        public virtual JScriptKind RegisteredScripts { get { return JScriptKind.None; } }
        [Obsolete]
        public virtual bool IsSubPage { get { return true; } }
        public virtual bool RegisteredServerControls { get { return false; } }
        public virtual bool RegisteredHiddenField { get { return false; } }
        public virtual bool EnableDragable { get { return false; } }
        public virtual bool EnableSelectable { get { return false; } }
        public virtual bool EnableContextMenu { get { return false; } }
        public virtual bool EnableAutoBind { get { return true; } }
        
        protected eniHiddenField HiddenFields { 
            get {
                if(RegisteredHiddenField == false)
                    return null;

                if(Master != null && Master is CommonPage) {
                    return ((CommonPage)Master).HiddenFields;
                } else {
                    return null;
                }
            }
        }
        

        #endregion

        #region ■ 1.5 Class Global events

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        /// <summary>
        /// BaseUIPage 
        /// </summary>
        public BaseUIACTPage() {
            
            //[Defaultvalue] 어트리뷰터 값넣기인데 잘안됨(public 이 아이라서 안됨 ㅡ.ㅡㅋ)
            //var b = TypeDescriptor.GetProperties(this);
            //foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(this)) {
            //    DefaultValueAttribute baseAttribute = (DefaultValueAttribute)property.Attributes[typeof(DefaultValueAttribute)];
            //    var a = property.DisplayName;
            //    if (baseAttribute != null) {
            //        property.SetValue(this, baseAttribute.Value);
            //    }
            //}

            this.lgStrSql        = new StringBuilder();
            this.lgExceptions    = new ExceptionCollection();
            this.if_client_member_ = new NameValueCollection();
        }

        #endregion

        #region ■ 2.2 Initializatize SubClass variables

        #endregion

        #region ■ 2.3 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. SubClass Override Method part


        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        /// <summary>
        /// 페이지별 언어 설정
        /// </summary>
        protected override void InitializeCulture() {
            /* 개발 요구사항
            * 1. 기본 익스플로러 언어를 따른다.
            * 2. Session 언어 설정을 따른다.
            * 3. Session 안의 언어 설정이 있어도 QueryString안에 Lang정보가 있으면 QueryString 안의 언어설정을 따른다.
            */
            //브라우저 언어 설정
            var cur_cul = System.Threading.Thread.CurrentThread.CurrentCulture;
            var str_cur_cul = EnumDef.ConvertCultureToLang(cur_cul);
            var str_rq_cul = Utilities.GetLang(this.Context);

            var str_sub_lang = OnInitCulture(str_cur_cul);
            if (str_sub_lang == null || string.IsNullOrWhiteSpace(str_sub_lang) || str_sub_lang.ToLower() == str_cur_cul.ToLower()) {
                if (!string.IsNullOrWhiteSpace(str_rq_cul) && str_cur_cul != str_rq_cul) {
                    this.lgLang = str_rq_cul;
                    cur_cul = new CultureInfo(EnumDef.ConvertLangToCulture(str_rq_cul));
                    this.Culture = EnumDef.ConvertLangToCulture(this.lgLang);
                    this.UICulture = EnumDef.ConvertLangToCulture(this.lgLang);
                    System.Threading.Thread.CurrentThread.CurrentCulture = cur_cul;
                    System.Threading.Thread.CurrentThread.CurrentUICulture = cur_cul;
                } else {
                    this.lgLang = str_cur_cul;
                    this.Culture = EnumDef.ConvertLangToCulture(this.lgLang);
                    this.UICulture = EnumDef.ConvertLangToCulture(this.lgLang);
                }
            } else {
                this.lgLang = str_sub_lang;
                cur_cul = new CultureInfo(EnumDef.ConvertLangToCulture(str_sub_lang));
                this.Culture = EnumDef.ConvertLangToCulture(this.lgLang);
                this.UICulture = EnumDef.ConvertLangToCulture(this.lgLang);
                System.Threading.Thread.CurrentThread.CurrentCulture = cur_cul;
                System.Threading.Thread.CurrentThread.CurrentUICulture = cur_cul;
            }
            var ck_lang = this.GetCookie("ckLang");
            if (ck_lang == null || string.IsNullOrWhiteSpace(ck_lang)) {
                this.SetCookie("ckLang", lgLang);
            }

            base.InitializeCulture();
        }

        /// <summary>
        /// OnPreInit
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnPreInit(EventArgs e) {
            try {
                this.SessionID = Session.SessionID;
                var shNo = this.Session[CommonResource.SessionHistoryNo];
                if (shNo != null) {
                    this.SessionHistoryNo = shNo.ToString();
                }

                //bool IE7CompatModeAllowed = !Browsers.IsIE10();
                //if(IE7CompatModeAllowed) {
                //    Browsers.InjectIE7CompatModeMeta(Master);
                //} else {
                //    Browsers.InjectIEEdgeCompatModeMeta(Master);
                //}
                //Browsers.InjectDescriptionMeta(Master);

                //쿠키에 저장되어있는 ActiveX 값을 판단하여 미설치 상태이면 로그인 페이지로(문제가 발생됨)
                //if (true) {
                //    lgACT.LogoutProcess(this);
                //}

                /* 사용자 로그인 검증
                 * - 로그인이 필요한 페이지인데 로그인이 되어있지 않으면 로그인 페이지로 리다이렉트 한다.
                 * - 콜벡을 이용한 요청이면 요청이 끝난후 스크립트로 처리하고 그렇지않으면 스크립트를 요청 스트림에 바로쓴다.
                 */

                if (this.User.Identity.IsAuthenticated == false && this.CheckAuthorizePage()) {
                    if (this.IsCallback) {
                        this.RedirectURL(string.Format("~/redirect?returnurl={0}", this.ResolveUrl("~/login")), true);
                    } else {
                        var strLogionUrl = ResolveUrl("~/");
                        if (!string.IsNullOrWhiteSpace(strLogionUrl)) {
                            strLogionUrl = strLogionUrl.ToLower();
                        }

                        var strScript = new StringBuilder();
                        strScript.AppendLine("<script type=\"text/javascript\">");
                        strScript.AppendLine("if (window.frm) {");
                        strScript.AppendLine("    if (window.frm.ifrmTop) {");
                        strScript.AppendLine(string.Format("        window.top.open(\"{0}\", \"ifrmTop\");", strLogionUrl));
                        strScript.AppendLine("    } else {");
                        strScript.AppendLine(string.Format("        window.top.location.href = \"{0}\";", strLogionUrl));
                        strScript.AppendLine("    }");
                        strScript.AppendLine("} else {");
                        strScript.AppendLine(string.Format("    window.top.location.href = \"{0}\";", strLogionUrl));
                        strScript.AppendLine("}");
                        strScript.AppendLine("</script>");

                        Response.Write(strScript.ToString());
                        Response.End();
                    }
                }

                this.BaseInitSessionObj();
                this.BaseInitCommonVariables();                                                              // ☜ 공통 코드 초기화

                this.lgUrlInfo    = new UrlInfo(this);
                this.lgHostInfo   = new HostInfo(this);
                this.lgPageInfo   = new PageInfo(this);
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (ExceptionManager ex) {
                this.SetError(GetGlobalResource("GCSTRESX10000"), ex, true);
            }

            base.OnPreInit(e);
        }

        /// <summary>
        /// 페이지 Init 시점에 컨트롤 초기 생성을 해줘야한다.
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnInit(EventArgs e) {
            base.OnInit(e);

            this.Response.Buffer = true;

            try {
                if (string.IsNullOrWhiteSpace(this.lgPageInfo.RequestMenuName) == false) {
                    this.Title = lgPageInfo.RequestMenuName;
                }

                //요청 클라이언트의 페이지 범위 가로크기를 설정한다.
                var tmpSize = 0;
                if (!string.IsNullOrWhiteSpace(lgUrlInfo.RequestQueryString["w"])) {
                    if (int.TryParse(lgUrlInfo.RequestQueryString["w"].ToString(), out tmpSize)) {
                        ClientWidth = Unit.Parse(tmpSize.ToString());
                    } else {
                        ClientWidth = Unit.Pixel(0);
                    }
                }// else {
                //    ClientWidth = Unit.Pixel(0);
                //}

                //요청 클라이언트의 페이지 범위 세로크기를 설정한다.
                if (!string.IsNullOrWhiteSpace(lgUrlInfo.RequestQueryString["h"])) {
                    if (int.TryParse(lgUrlInfo.RequestQueryString["h"].ToString(), out tmpSize)) {
                        ClientHeight = Unit.Parse(tmpSize.ToString());
                    } else {
                        ClientHeight = Unit.Pixel(0);
                    }
                } 
                //else {
                //    ClientHeight = Unit.Pixel(0);
                //}
                
                /* 페이지의 언어에 따라 SQL 전역 언어 설정한다.
                 * - SQL 연결은 OnInit 이벤트에서 연결이 시작된후 UnLoad 이벤트에서 연결이 끊긴다.
                 * - 연결되어 있는동안의 설정된 열결은 유지되며 설정된 SQL 언어또한 유지된다.
                 */
                this.lgDbAccess.Connect();
                //this.lgDbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(lgLang))));

                this.OnInitWebUIPage();
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                SetError(GetGlobalResource("GCSTRESX10000"), ex, true);
            }
        }

        /// <summary>
        /// OnPreLoad
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnPreLoad(EventArgs e) {
            //페이지에 요청정보가 포함된다
            //Trace.IsEnabled = true;
            base.OnPreLoad(e);
        }

        /// <summary>
        /// OnLoad
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);

            try {
                OnInitRoutingParams(RouteData);
                OnInitRequestParams(lgUrlInfo.RequestQueryString);
                OnInitDynamicControls();
                OnInitSessionObj(Session);
                OnInitVariables();
                OnInitConditionData();
                OnRequesting();
                if (!this.IsPostBack && !this.IsCallback) {
                    OnReqProcessing();
                    SetDefulatValues();
                } else {
                    OnPostBackOrCallBackReqProcessing();
                }
                OnWebUIPageLoad();
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                SetError(GetGlobalResource("GCSTRESX10000"), ex, true);
            }
        }

        /// <summary>
        /// OnLoadComplete
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnLoadComplete(EventArgs e) {
            base.OnLoadComplete(e);

            try {
                if (this.EnableAutoBind && !this.IsCallback && !this.IsPostBack) {
                    this.DataBind();
                }
                OnWebUIPageLoadComplete();
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                SetError(GetGlobalResource("GCSTRESX10000"), ex, true);
            }
        }
        /// <summary>
        /// OnPreRender
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnPreRender(EventArgs e) {
            this.Response.CacheControl = "no-cache";
            this.Response.AddHeader("Pragma", "no-cache");
            this.Response.Expires = -1;
            base.OnPreRender(e);

            try {
                var sbStartUpScript = new StringBuilder();
                //lgStartUpScriptBlock.AppendLine(string.Format(@"eni.setTimeOutMS({0} * 60 * 1000);", Session.Timeout));
                if (!this.IsCallback && !this.IsPostBack) {
                    try {
                        this.BaseInitStartScripts(ref sbStartUpScript);
                    } catch (ThreadAbortException ex) {
                        throw ex;
                    } catch (System.Exception ex) {
                        this.SetError(this.GetGlobalResource("GCSTRESX10000"), ex);
                    }

                    if (this.lgExceptions.Count > 0) {
                        var ex1 = lgExceptions[lgExceptions.Count - 1];
                        sbStartUpScript.AppendLine(string.Format(@"eni.Message.DisplayMsgBox(eni.Message.StrBundle(""MSGBD00003""), ""{0}"");", ex1.Message.Replace("\"", "'").Replace(Environment.NewLine, "<br>")));
                    }
                }
                if (sbStartUpScript.Length > 0) {
                    string strStartUpScript = string.Empty;
                    strStartUpScript = string.Format("<script type=\"text/javascript\">{0}</script>", sbStartUpScript);
                    this.ClientScript.RegisterStartupScript(this.GetType(), "StartUpScriptBock", strStartUpScript);
                }
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                this.SetError(this.GetGlobalResource("GCSTRESX10000"), ex, true);
            }
        }
        /// <summary>
        /// OnPreRenderComplete
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnPreRenderComplete(EventArgs e) {
            try {
                OnWebUIPageRenderComplete();
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                SetError(GetGlobalResource("GCSTRESX10000"), ex, true);
            }
            base.OnPreRenderComplete(e);
        }

        /// <summary>
        /// OnUnload
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnUnload(EventArgs e) {
            try {
                this.OnWebUIPageUnLoad();
                if (this.lgDbAccess != null) {
                    this.lgDbAccess.DisConnect();
                    this.lgDbAccess.Dispose();
                }
            } catch (ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                this.SetError(this.GetGlobalResource("GCSTRESX10000"), ex, true);
            }
            base.OnUnload(e);
        }
        /// <summary>
        /// OnError
        /// </summary>
        /// <param name="e">이벤트 발생자</param>
        protected override void OnError(EventArgs e) {
            this.SetError(this.Server.GetLastError(), true);
        }

        #endregion

        #region ■ 4.2 Class Event part

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group

        protected void RedirectURL(string strResolveUrl) {
            this.RedirectURL(strResolveUrl, false);
        }
        protected void RedirectURL(string strResolveUrl, bool bEndRequest) {
            if (this.IsCallback == true) {
                this.Response.RedirectLocation = this.ResolveUrl(strResolveUrl);
                if (bEndRequest) {
                    this.Response.End();
                }
            } else {
                this.Response.Redirect(this.ResolveUrl(strResolveUrl), bEndRequest);
            }
        }

        [Obsolete("아직 구현하지 않음")]
        protected void RedirectTransfer() {
            //this.Server.Transfer();
        }

        protected void BaseInitStartScripts(ref StringBuilder sStartUpStringBlock) {
            if (this.if_client_member_.Count > 0) {
                var try_int = 0;
                foreach (var key in this.if_client_member_.Keys) {
                    if (int.TryParse(this.if_client_member_.Get(key.ToString()), out try_int)) {
                        sStartUpStringBlock.AppendLine(string.Format("var {0} = {1};", key, try_int));
                    } else {
                        sStartUpStringBlock.AppendLine(string.Format("var {0} = \"{1}\";", key, this.if_client_member_.Get(key.ToString())));
                    }
                }
            }

            sStartUpStringBlock.AppendLine("if (window.eni) {");
            try { 
                sStartUpStringBlock.AppendLine(string.Format("lgCookieId = \"{0}\"", Properties.Resources.SessionCookieID));
                sStartUpStringBlock.AppendLine("if (eni.CommonVariable) {");
                try { 
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.DbName = \"{0}\"", lgCommons.DbName));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.ApplicationName = \"{0}\"", lgCommons.ApplicationName));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.ApplicationVersion = \"{0}\"", lgCommons.ApplicationVersion));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.ApplicationASMVersion = \"{0}\"", lgCommons.ApplicationASMVersion));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.QuickName = \"{0}\"", lgCommons.QuickName));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.IsDebugWrite = {0}", lgCommons.IsDebugWrite ? "true" : "false"));
                    sStartUpStringBlock.AppendLine(string.Format("eni.CommonVariable.IsLogWrite = {0}", lgCommons.IsLogWrite ? "true" : "false"));
                    if (this.CheckAuthorizePage()) {
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.UserId = \"{0}\"", lgACT.UserId));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.ErpNo = \"{0}\"", lgACT.ErpNo));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.Domain = \"{0}\"", lgACT.DomainName));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.Name = \"{0}\"", lgACT.Name));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.EngNm = \"{0}\"", lgACT.EnglishName));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.HanjaNm = \"{0}\"", lgACT.HanjaName));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.UserKindCd = \"{0}\"", lgACT.UserKind));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.UserTypeCd = \"{0}\"", lgACT.UserType));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.UserGubunCd = \"{0}\"", lgACT.UserGubun));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.BizAreaCd = \"{0}\"", lgACT.BizAreaCode));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.PlantCd = \"{0}\"", lgACT.PlantCode));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.DeptCd = \"{0}\"", lgACT.DeptCode));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.RolePstnCd = \"{0}\"", lgACT.RolePstnCode));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.AdminYn = \"{0}\"", lgACT.AdminYn));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.MailAddr = \"{0}\"", lgACT.MailAddress));
                        sStartUpStringBlock.AppendLine(string.Format("lgAccount.LoginTime = \"{0}\"", lgACT.LoginDt.ToLongTimeString()));
                    } else {
                        sStartUpStringBlock.AppendLine("lgAccount.UserId = \"Guest\"");
                    }
                } catch { }
                sStartUpStringBlock.AppendLine("}");
            } catch { }
            sStartUpStringBlock.AppendLine("}");

            this.OnInitStartScripts(ref sStartUpStringBlock);
        }

        #region BaseInit
        /// <summary>
        /// 세션 정보 저장
        /// </summary>
        private void BaseInitSessionObj() {
            /* 해당 페이지가 로그인이 필요한 서비스인지 판단하여 로그인 객체를 설정한다.
             * - 로그인이 필요한 페이지이면 세션에서 사용자 객체를 꺼내었을때 로그인이 되어있으면 세션에 넣어주고
             *   세션이 만료되어 객체가 없으면 재로그인을 하여 세션과 전역에 설정해준다.
             * - 로그인이 필요없는 페이지라도 로그인 된상태이면 로그인 객체를 설정하여 준다.
             */
            if (this.User.Identity.IsAuthenticated) { //로그인 된상태
                var web_accnt = this.Session[CommonResource.SessionAccount] as Account;
                if (web_accnt != null) {
                    this.lgACT = web_accnt;
                    if (this.lgACT.Lang != this.lgLang) {
                        this.lgACT.SetLang(lgLang);
                    }
                } else {
                    this.Session[CommonResource.SessionAccount] = this.lgACT = Account.ReleseAuth(this);
                }
            }

            if (this.lgACT == null && this.CheckAuthorizePage()) {
                if (this.IsCallback) {
                    RedirectURL(string.Format("~/redirect?returnurl={0}", this.ResolveUrl("~/login")), true);
                } else {
                    RedirectURL("~/login", true);
                }
            }

            //사용자 세션에서 Work DataSet 가져온다.
            if (UsedSessionDataSet) {
                if (!IsPostBack) {
                    Session[CommonResource.SessionWorkDataSet] = lgWorkDataSet = new DataSet();
                } else {
                    lgWorkDataSet = Session[CommonResource.SessionWorkDataSet] as DataSet;
                }
            }
        }

        /// <summary>
        /// 공통 정보 생성
        /// </summary>
        private void BaseInitCommonVariables() {
            this.lgCommons = new CommonVariable(Global.gEnvironmonts.ApplicationVersion,
                Global.gEnvironmonts.ApplicationASMVersion,
                Global.gSettings.ApplicationStartMode == ApplicationStartMode.Release ? "0" : "1",
                Global.gLogger.DebugWrite ? "0" : "1",
                Global.gLogger.LogWrite ? "0" : "1",
                Global.gEnvironmonts.ServerName,
                GetGlobalResource("QuickName"),
                Global.gEnvironmonts.ServerName,
                Global.gEnvironmonts.DbIP,
                Global.gEnvironmonts.DbName);
        }

        private bool CheckAuthorizePage() {
            return this.GetType().BaseType.GetCustomAttributes(typeof(AllowAnonymousAttribute), false).Length > 0;
        }

        #endregion


        #region SetError

        /// <summary>
        /// 에러를 설정합니다.
        /// </summary>
        /// <param name="pEx">발생한 에러</param>
        protected void SetError(string sErrorMessage) {
            this.SetError(sErrorMessage, null);
        }
        /// <summary>
        /// 에러를 설정합니다.
        /// </summary>
        /// <param name="pEx">발생한 에러</param>
        protected void SetError(System.Exception pEx) {
            this.SetError(pEx, false);
        }
        /// <summary>
        /// 에러를 설정합니다.
        /// </summary>
        /// <param name="pDebugMsg">콘솔창 메시지</param>
        /// <param name="oEx">발생한 에러</param>
        protected void SetError(string sErrorMessage, System.Exception oEx) {
            this.SetError(sErrorMessage, oEx, false);
        }
        /// <summary>
        /// 에러를 설정합니다.
        /// </summary>
        /// <param name="oEx">발생한 에러</param>
        /// <param name="pRedirectErrorPage">에러페이지로 리다이렉션 여부</param>
        protected void SetError(System.Exception oEx, bool pRedirectErrorPage) {
            this.SetError(string.Empty, oEx, pRedirectErrorPage);
        }
        /// <summary>
        /// 에러를 설정합니다.
        /// </summary>
        /// <param name="sErrorMessage">콘솔창 메시지</param>
        /// <param name="oEx">발생한 에러</param>
        /// <param name="bRedirectErrorPage">에러페이지로 리다이렉션 여부</param>
        protected void SetError(string sErrorMessage, System.Exception oEx, bool bRedirectErrorPage) {
            if (oEx != null) {
                if (oEx is ExceptionManager) {
                    this.lgException = oEx;
                } else {
                    if (string.IsNullOrWhiteSpace(sErrorMessage)) {
                        this.lgException = new ExceptionManager(oEx);
                    } else {
                        this.lgException = new ExceptionManager(oEx.Message, sErrorMessage, oEx);
                    }
                }
                this.lgExceptions.Add(this.lgException);
                if (string.IsNullOrWhiteSpace(sErrorMessage)) {
                    sErrorMessage = this.lgException.Message;
                }
            }

            if (string.IsNullOrWhiteSpace(sErrorMessage) == false) {
                this.ConsoleWrite(string.Format("[ERROR]-[{0}] : {1}", this.GetType().FullName, sErrorMessage));
            } else {
                this.ConsoleWrite(string.Format("[ERROR]-[{0}]", this.GetType().FullName));
            }

            if (bRedirectErrorPage) {
                this.Session[CommonResource.SessionMessage] = sErrorMessage == this.lgException.Message ? string.Empty : sErrorMessage;
                this.Session[CommonResource.SessionRequestUrl] = this.lgUrlInfo.RequestUrl; // lgReqStrQueryString == null ? Request.QueryString.ToString() : lgReqStrQueryString.ToString();
                this.Session[CommonResource.SessionRequestEncodeUrl] = this.lgUrlInfo.RequestStrQueryString == null ? Request.QueryString.ToString() : lgUrlInfo.RequestStrQueryString.ToString();
                this.Session[CommonResource.SessionLastError] = this.lgException;
                this.Session[CommonResource.SessionErrorCollection] = this.lgExceptions;
                this.RedirectURL("~/webcontent/common/error.aspx", bRedirectErrorPage);
            }
        }

        #endregion

        #region PermissionError
        protected void SetPermissionError(string pDebugMsg, string sMessage) {
            if (string.IsNullOrWhiteSpace(pDebugMsg) == false) {
                this.ConsoleWrite(string.Format("[ERROR]-[{0}] : {1}", GetType().FullName, pDebugMsg));
            } else {
                this.ConsoleWrite(string.Format("[ERROR]-[{0}]", GetType().FullName));
            }

            this.ConsoleWrite(pDebugMsg);
            this.Session[CommonResource.SessionMessage] = sMessage;
            this.RedirectURL("~/webcontent/common/permissionerror.aspx");
        }
        #endregion

        #region Client Interface
        protected void AddInterfaceData(string strValiableName, string strValue) {
            if (!this.IsCallback && !this.IsPostBack) {
                this.if_client_member_.Add(strValiableName, strValue);
            }
        }
        protected void RemoveInterfaceData(string strValiableName) {
            this.if_client_member_.Remove(strValiableName);
        }

        #endregion

        #region Cookie
        protected string GetCookie(string strKeyName) {
            if (this.Request.Cookies[strKeyName] != null) {
                return Request.Cookies[strKeyName].Value;
            } else {
                return null;
            }
        }
        protected void SetCookie(string strKeyName, string value) {
            var cookie = this.Request.Cookies[strKeyName];
            if (cookie == null || string.IsNullOrWhiteSpace(cookie.Value)) {
                if (this.Response.Cookies[strKeyName] != null) {
                    this.Response.Cookies.Remove(strKeyName);
                }
                this.Response.Cookies.Add(new HttpCookie(strKeyName, value));
            }
        }
        

        #endregion
        #region GetGlobalResource
        protected string GetGlobalResource(string strKey) {
            return this.GetResource("Global", strKey);
        }
        #endregion
        #region GetResource
        protected string GetResource(string strKey) {
            return this.GetResource(this.GetType().Name.Replace("_aspx", ""), strKey);
        }
        protected string GetResource(string strClassName, string strKey) {
            try {
                var gRObj = this.GetGlobalResourceObject(strClassName, strKey);
                if (gRObj != null) {
                    return gRObj.ToString();
                } else {
                    return string.Empty;
                }
            } catch {
                return string.Empty;
            }
        }
        #endregion

        #region GetRequestArg

        protected string GetRequestArg(string pArgName) {
            var param = this.Request[pArgName];
            if (param != null) {
                return param;
            } else {
                return string.Empty;
            }
        }

        protected T GetRequestArg<T>(string pArgName) {
            return ConvertTypeToValue<T>(GetRequestArg(pArgName));
        }

        #endregion

        #region GetBaseCallbackArgs

        protected BaseCallbackArgs GetBaseCallBackArgs() {
            return new BaseCallbackArgs();
        }

        #endregion

        #region GetBaseCallbackResultArgs

        protected BaseCallbackResultArgs GetBaseCallbackResultArgs() {
            return new BaseCallbackResultArgs();
        }
        protected T GetBaseCallbackResultArgs<T>() {
            try {
                return (T)typeof(T).InvokeMember(null, BindingFlags.CreateInstance, null, null, null);
            } catch {
                return default(T);
            }
        }

        #endregion

        #region ConvertTypeToValue
        /// <summary>
        /// 타입으로 변환한다.
        /// </summary>
        /// <typeparam name="T">Type</typeparam>
        /// <param name="pValue">value</param>
        /// <returns>value</returns>
        protected T ConvertTypeToValue<T>(string pValue) {
            //스트링 타입일때
            if (typeof(T) == typeof(string)) {
                return (T)(object)pValue;
            }

            //열거형일떄
            if (typeof(T).BaseType == typeof(Enum)) {
                try {
                    return (T)Enum.Parse(typeof(T), pValue);
                } catch {
                    return (T)(Enum.GetValues(typeof(T)).GetValue(0));
                }
            }

            // 나머지 타입일때
            var parseMethod = typeof(T).GetMethod("Parse", BindingFlags.Public | BindingFlags.Static, null, new Type[] { typeof(string) }, null);
            if (parseMethod == null) {
                throw new ArgumentException(GetGlobalResource("GCSTRESX00107"), "<T>Key");
            }

            try {
                return (T)parseMethod.Invoke(null, new object[] { pValue });
            } catch {
                return (T)parseMethod.Invoke(null, new object[] { "False" });
            }
        }
        #endregion
        #region Security Method
        /// <summary>
        /// 삼중 DES로 지정된 키를 사용하여 암호화 합니다.
        /// </summary>
        /// <param name="pEncryptStr">암호화할 문자열</param>
        /// <returns>암호화된 문자열</returns>
        protected string TripleDESEncrypt(string pEncryptStr) {
            return Global.gSecuritys.TripleDESEncrypt(pEncryptStr);
        }

        /// <summary>
        /// 삼중 DES로 지정된 키를 사용하여 복호화 합니다.
        /// </summary>
        /// <param name="pDecrtyptStr">복호화할 암호화 문자열</param>
        /// <returns>복호화된 문자열</returns>
        protected string TripleDESDecrypt(string pDecrtyptStr) {
            return Global.gSecuritys.TripleDESDecrypt(pDecrtyptStr);
        }

        #endregion

        #region GetWorkDataSet
        [Obsolete]
        protected DataTable GetWorkDataSetTable(string sTableName) {

            if (lgWorkDataSet == null)
                return null;

            if (lgWorkDataSet.Tables.Contains(sTableName) == false)
                return null;

            return lgWorkDataSet.Tables[sTableName] as DataTable;
        }

        [Obsolete]
        protected void SetWorkDataSetTable<T>(DataTable pSource){
            if (lgWorkDataSet == null)
                return;

            if(pSource == null)
                return;

            Data.MergeDataSet<T>(lgWorkDataSet, pSource, true);
        }
        [Obsolete]
        protected void SetViewState(string sKeyName, object oViewStateData) {
            if (ViewState[sKeyName] != null) {
                ViewState[sKeyName] = oViewStateData;
            } else {
                ViewState.Add(sKeyName, oViewStateData);
            }
        }
        [Obsolete]
        protected T GetViewStateTable<T>(string sKeyName) {
            return (T)GetViewStateTable(sKeyName);
        }
        [Obsolete]
        protected object GetViewStateTable(string sKeyName) {
            if (ViewState[sKeyName] != null) {
                return ViewState[sKeyName];
            } else {
                return null;
            }
        }
        [Obsolete]
        protected void WorkDataSetCommitChanges() {
            if(lgWorkDataSet == null) {
                return;
            }
            if(lgWorkDataSet.HasChanges()) {
                lgWorkDataSet.AcceptChanges();
            }
        }

        #endregion

        #endregion

        #region ■ 5.2 User-defined virtual function group
        /// <summary>
        /// 디버그 메시지를 출력합니다.
        /// </summary>
        /// <param name="strDebugMessage">디버그 메세지</param>
        //[Conditional("DEBUG")]//컴파일 기호가 DEBUG일때만 작동한다.
        protected void ConsoleWrite(string strDebugMessage) {
            Global.gLogger.ConsoleWrite(strDebugMessage);
        }
        /// <summary>
        /// 해당 페이지의 언어를 설정합니다.
        /// </summary>
        /// <param name="strCurrentCulture">현재 설정 언어</param>
        /// <returns></returns>
        protected virtual string OnInitCulture(string strCurrentCulture) { return strCurrentCulture; }
        /// <summary>
        /// 웹 페이지를 초기화 합니다.
        /// </summary>
        protected virtual void OnInitWebUIPage() { }
        /// <summary>
        /// 라우팅 데이터를 초기화 합니다.
        /// </summary>
        /// <param name="pRoute">라우팅 데이터</param>
        protected virtual void OnInitRoutingParams(RouteData pRoute) { }
        /// <summary>
        /// 쿼리 스트링 데이터를 초기화 합니다.
        /// </summary>
        /// <param name="pQueryString"></param>
        protected virtual void OnInitRequestParams(NameValueCollection pQueryString) { }
        /// <summary>
        /// 동적 컨트롤을 생성합니다.
        /// </summary>
        protected virtual void OnInitDynamicControls() { }
        /// <summary>
        /// Session 오브젝트의 데이터를 초기화 합니다.
        /// </summary>
        protected virtual void OnInitSessionObj(HttpSessionState pSession) { }
        /// <summary>
        /// ViewState 오브젝트의 데이터를 초기화 합니다.
        /// </summary>
        [Obsolete]
        protected virtual void OnInitViewState(StateBag pViewState) { }
        /// <summary>
        /// 변수를 초기화 합니다.
        /// </summary>
        protected virtual void OnInitVariables() { }
        /// <summary>
        /// 컨디션 데이터를 초기화 합니다.
        /// </summary>
        protected virtual void OnInitConditionData() { }
        /// <summary>
        /// 웹 페이지가 호출될떄마다 호출됩니다.
        /// </summary>
        protected virtual void OnRequesting() { }
        /// <summary>
        /// 콜백 포스트백을 제외한 호출만 호출됩니다.
        /// </summary>
        protected virtual void OnReqProcessing() { }
        /// <summary>
        /// 콜백 포스트백만 호출됩니다.
        /// </summary>
        protected virtual void OnPostBackOrCallBackReqProcessing() { }
        /// <summary>
        /// 변수를 디폴드 값으로 초기화 합니다.
        /// </summary>
        protected virtual void SetDefulatValues() { }
        /// <summary>
        /// 웹 페이지를 로드 합니다.
        /// </summary>
        protected virtual void OnWebUIPageLoad() { }
        /// <summary>
        /// 웹 페이지 로드를 완료합니다.
        /// </summary>
        protected virtual void OnWebUIPageLoadComplete() { }
        /// <summary>
        /// 웹페이지 언로드 합니다.
        /// </summary>
        protected virtual void OnWebUIPageUnLoad() { }
        /// <summary>
        /// 웹 페이지 렌더링 완료합니다.
        /// </summary>
        protected virtual void OnWebUIPageRenderComplete() { }
        /// <summary>
        /// 페이지 로드후 시작스크립트를 작성합니다.
        /// </summary>
        /// <param name="sStartUpStringBlock">시작스크립트 작성 스크립트 블럭</param>
        protected virtual void OnInitStartScripts(ref StringBuilder sStartUpStringBlock) { }

        #endregion
        #endregion
    }
}
