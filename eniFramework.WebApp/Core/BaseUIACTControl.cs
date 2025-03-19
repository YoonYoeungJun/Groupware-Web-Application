
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Collections.Specialized;
using System.IO;
using System.Web.UI.WebControls;
using System.Threading;
using System.Reflection;
using System.Web.Routing;
using System.Web.SessionState;
using System.ComponentModel;

// eniFramework Reperence part
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.ACT;
using eniFramework.Json;
using eniFramework.WebApp.Common;
//using eniFramework.WebApp.Common.Extentions;
using eniFramework.WebApp.Common.Properties;

#endregion

namespace eniFramework.WebApp.Core {
    /// <summary>
    /// BaseUIControl
    /// </summary>
    [DebuggerDisplay("?={?}")]
    public partial class BaseUIACTControl : UserControl {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Base</NameSpace>
        /// <Module>②Control</Module>
        /// <Class>③BaseUIControl</Class>
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

        private System.Exception _lgException = null;
        protected StringBuilder lgStrSql = new StringBuilder();

        #endregion

        #region ■ 1.4 Class Global properties
        /// <summary>
        /// 사용자 컨트롤에서 세션에 저장되는 데이터 저장소를 사용할지 여부입니다.
        /// </summary>
        [AutoFormatDisable]
        [Category("eniFramework")]
        [DefaultValue(false)]
        public virtual bool lgUseSessionDataSet { get; set; }
        /// <summary>
        /// 데이터 베이스 엑세스를 가져옵니다.
        /// </summary>
        [AutoFormatDisable]
        [Category("eniFramework")]
        public DatabaseAccess lgDbAccess { get; set; }
        /// <summary>
        /// 현재 작업 데이터 집합을 가져옵니다.
        /// </summary>
        protected DataSet lgControlWorkDataSet { get; private set; }
        /// <summary>
        /// 공통 변수를 가져옵니다.
        /// </summary>
        [AutoFormatDisable]
        [Category("eniFramework")]
        public CommonVariable lgCommons { get; private set; }
        /// <summary>
        /// 로그인 사용자를 가져옵니다.
        /// </summary>
        [AutoFormatDisable]
        [Category("eniFramework")]
        public Account lgAccount { get; private set; }

        /// <summary>
        /// 시작스크립트를 등록하는 스크립트 집합을 가져옵니다.
        /// </summary>
        protected StringBuilder lgStartUpScriptBlock { get; private set; }

        /// <summary>
        /// 오류클래스를 설정하거나 가져옵니다.
        /// </summary>
        [AutoFormatDisable]
        [Category("eniFramework")]
        [Browsable(false)]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public System.Exception lgException {
            get {
                return _lgException;
            }
            set {
                if (_lgException == value)
                    return;
                _lgException = value;
            }
        }


        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public BaseUIACTControl()
            : base() {
                BaseSetDefulatValues();
        }

        ~BaseUIACTControl() {
            //if (lgDbAccess != null) {
            //    if (lgDbAccess.Connection.State == ConnectionState.Open) {
            //        lgDbAccess.Connection.Close();
            //    }
            //}

            //if (Session != null) {
            //    Session.Remove(UniqueID);
            //}
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

        protected override void OnInit(EventArgs e) {

            //var a = Request.ServerVariables["APPL_MD_PATH"];
            //var b = Request.ServerVariables["APPL_PHYSICAL_PATH"];
            //var c = Request.ServerVariables["REMOTE_USER"];
            //var d = Request.ServerVariables["INSTANCE_I"];
            //var ee = Request.ServerVariables["INSTANCE_META_PATH"];
            //var f = Request.ServerVariables["LOCAL_ADDR"];
            //var g = Request.ServerVariables["QUERY_STRING"];
            //var h = Request.ServerVariables["REMOTE_ADDR"];
            //var i = Request.ServerVariables["REMOTE_HOST"];
            //var j = Request.ServerVariables["REMOTE_PORT"];
            //var k = Request.ServerVariables["REQUEST_METHOD"];
            //var l = Request.ServerVariables["SERVER_NAME"];
            //var m = Request.ServerVariables["SERVER_PORT"];
            //var n = Request.ServerVariables["SERVER_PROTOCOL"];
            //var o = Request.ServerVariables["URL"];
            //var p = Request.ServerVariables["HTTP_CONNECTION"];
            //var q = Request.ServerVariables["HTTP_ACCEPT"];
            //var r = Request.ServerVariables["HTTP_ACCEPT_ENCODING"];
            //var s = Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
            //var ss = Request.ServerVariables["HTTP_COOKIE"];
            //var ssss = Request.ServerVariables["HTTP_HOST"];
            //var sssss = Request.ServerVariables["HTTP_USER_AGENT"];
            base.OnInit(e);

            var parentPage = Parent.Page as BaseUIACTPage;
            if (parentPage != null) {
                lgDbAccess = parentPage.lgDbAccess;
                lgAccount = parentPage.lgACT;
                lgCommons = parentPage.lgCommons;
            }

            OnInit();
            OnInitDynamicControls();
        }

        protected override void OnLoad(EventArgs e) {
            try {
                base.OnLoad(e);

                BaseInitSessionObj(Session);

                try {
                    BaseInitRequestParams(Request.QueryString);
                    OnInitVariables();
                    SetDefulatValues();
                } catch (System.Exception ex) {
                    new ExceptionManager(ex);
                }

                BaseInitSessionObj(Session);
                OnUserControlLoad();

                if (IsPostBack == false) {
                    OnReqProcessing();
                } else {
                    OnPostBackReqProcessing();
                }
                
            } catch (System.Exception ex) {
                new ExceptionManager(ex);
            }
        }

        protected override void OnUnload(EventArgs e) {
            base.OnUnload(e);
        }
       
        #endregion

        #region ■ 4.2 Class Event part

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group

        private void BaseSetDefulatValues() {

        }

        /// <summary>
        /// Session에 저장된 Object를 초기화하거나 저장합니다.
        /// </summary>
        private void BaseInitSessionObj(HttpSessionState pSession) {
            if(lgUseSessionDataSet) {
                //var aq = Session[UniqueID];
                //if (Session[UniqueID] == null) {
                //    Session[UniqueID] = lgControlWorkDataSet = new DataSet();
                //} else {
                //    eniFramework.WebApp.Common.Properties.Resources.SessionWorkDataSet
                //    lgControlWorkDataSet = Session[UniqueID] as DataSet;
                //}
                if (Session[eniFramework.WebApp.Common.Properties.Resources.SessionWorkDataSet] != null) {
                    lgControlWorkDataSet = Session[eniFramework.WebApp.Common.Properties.Resources.SessionWorkDataSet] as DataSet;
                }
            }

            OnInitSessionObj(pSession);
        }
        /// <summary>
        /// 요청(Request)로부터 QueryString에서 파라미터를 추출합니다.
        /// </summary>
        private void BaseInitRequestParams(NameValueCollection pRequestQueryString) {
            OnInitRequestParams(pRequestQueryString);
        }

        protected void SetViewState(string sKeyName, object oViewStateData) {
            if (ViewState[sKeyName] != null) {
                ViewState[sKeyName] = oViewStateData;
            } else {
                ViewState.Add(sKeyName, oViewStateData);
            }
        }

        protected T GetViewStateTable<T>(string sKeyName) {
            return (T)GetViewStateTable(sKeyName);
        }

        protected object GetViewStateTable(string sKeyName) {
            if (ViewState[sKeyName] != null) {
                return ViewState[sKeyName];
            } else {
                return null;
            }
        }

        #endregion

        protected class BaseCallBackArgs {
            /// <summary>
            /// 커맨드를 가져오거나 설정합니다.
            /// </summary>
            public string Cmd { get; set; }
            /// <summary>
            /// 세부 커맨드를 가져오거나 설정합니다.
            /// </summary>
            public string CmdDetail { get; set; }
            /// <summary>
            /// 저장 모드를 가져오거나 설정합니다.
            /// </summary>
            public DBAccessMode Mode { get; set; }
            /// <summary>
            /// 데이터를 가져오거나 설정합니다.
            /// </summary>
            public object Data { get; set; }
        }

        /// <summary>
        /// 콜백으로 반환데이터를 생성하는 베이스 클래스 입니다.
        /// </summary>
        protected class BaseCallBackResultArgs {
            /// <summary>
            /// 커맨드를 가져오거나 설정합니다.
            /// </summary>
            public string Cmd { get; set; }
            /// <summary>
            /// 세부 커맨드를 가져오거나 설정합니다.
            /// </summary>
            public string CmdDefault { get; set; }
            /// <summary>
            /// 저장 모드를 가져오거나 설정합니다.
            /// </summary>
            public DBAccessMode Mode { get; set; }
            /// <summary>
            /// 데이터를 가져오거나 설정합니다.
            /// </summary>
            public object Data { get; set; }
            /// <summary>
            /// 에러 발생여부를 가져오거나 설정합니다.
            /// </summary>
            public bool Error { get; set; }
            /// <summary>
            /// 에러 메세지를 가져오거나 설정합니다.
            /// </summary>
            public string ErrorMessage { get; set; }
        }

        #region ■ 5.2 User-defined virtual function group
        protected virtual void OnInit() { }
        protected virtual void OnInitDynamicControls() { }
        /// <summary>
        /// Session에 저장된 Object를 초기화하거나 저장합니다.
        /// </summary>
        protected virtual void OnInitSessionObj(HttpSessionState pSession) { }
        /// <summary>
        /// 요청(Request)로부터 QueryString에서 파라미터를 추출합니다.
        /// </summary>
        protected virtual void OnInitRequestParams(NameValueCollection pRequestQueryString) { }
        /// <summary>
        /// 요청을 처리하기전 데이터를 초기화 합니다.
        /// </summary>
        protected virtual void OnInitVariables() { }
        /// <summary>
        /// 데이터를 초기화 하고 기본 데이터를 설정합니다.
        /// </summary>
        protected virtual void SetDefulatValues() { }
        /// <summary>
        /// 컨트롤 로드가 시작되면 호출됩니다.
        /// </summary>
        protected virtual void OnUserControlLoad() { }
        /// <summary>
        /// 컨트롤 로드가 완료되면 호출됩니다.
        /// </summary>
        protected virtual void OnUserControlLoadComplete() { }
        /// <summary>
        /// 새로운 요청일때 호출됩니다.
        /// </summary>
        protected virtual void OnReqProcessing() { }
        /// <summary>
        /// PostBack 의 경우 호출됩니다.
        /// </summary>
        protected virtual void OnPostBackReqProcessing() { }

        #endregion

        #endregion
    }
}
