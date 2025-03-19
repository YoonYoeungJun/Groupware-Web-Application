
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Timers;
using System.Data;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Data.SqlClient;
using SystemThreading = System.Threading;

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Data.Linq;

// eniFramework Reperence part
using eniFramework.Log;
using eniFramework.Configuration;
using eniFramework.WebApp.Variables;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Themes;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.Network.AsyncSocketClient;

using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

using hMailServerService;
using hMailServerService.SocketLayer;

#endregion

namespace eniFramework.WebApp {
    /// <summary>
    /// Global
    /// </summary>
    public class Global : HttpApplication {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp</NameSpace>
        /// <Module>②WebSiteNET</Module>
        /// <Class>③Global</Class>
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

        const string BACKUP_FILE_NAME = "Data.bin";

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables
        static string _dataPath = ConfigManager.CurrentDir + "\\App_Data\\Backup";

        static List<Account> _loginUsers = new List<Account>();
        static object _loginUsers_lock = new object();
        static Queue<IServiceQueueBase> _sending_queue = null;
        static object _sending_queue_lock = new object();
        static Stream st_backup_list_io = null;
        static SystemThreading.Thread _sending_thread = null;

        static System.Threading.Timer _tmhMailServerService_ReConnector = null;
        static Lang eLang = Lang.KOR;
        static string _strMailServerService_IP = string.Empty;
        static int _iMailServerService_Port = 0;
        static string _strMailServerService_EndPacket = string.Empty;
        static object _mailserverservice_lock = new object();
        static bool bClientLicenseOk = false;
        static bool bIsConnecting = false;
        static bool bIsStop = false;

        #endregion

        #region ■ 1.4 Class Global properties
        /// <summary>
        /// 전역 메일 서버 서비스 통신을 제어 합니다.
        /// </summary>
        public static AdvancedAsyncSocketClient gMailServerService { get; private set; }
        /// <summary>
        /// 전역 환경변수를 관리합니다.
        /// </summary>
        public static Environments gEnvironmonts { get; private set; }
        /// <summary>
        /// 전역 설정을 관리합니다.
        /// </summary>
        public static Settings gSettings { get; private set; }
        /// <summary>
        /// 전역 보안에 관련된 변수를 관리합니다.
        /// </summary>
        public static Securitys gSecuritys { get; private set; }
        /// <summary>
        /// 전역 디렉토리를 관리합니다.
        /// </summary>
        public static Directorys gDirectorys { get; private set; }
        /// <summary>
        /// 전역 로그를 관리합니다.
        /// </summary>
        public static Logger gLogger { get; private set; }
        /// <summary>
        /// 전역 데이터 베이스 엑세스 클리스를 반환합니다.
        /// </summary>
        public static IDatabaseAccess gDbAccess { get { return new DatabaseBatchAccess(); } }
        public static Lang hMailServerLang { get { return eLang; } }
        /// <summary>
        /// 메일서버 서비스에 로그인될 이름을 가져옵니다.
        /// </summary>
        public static string gMailServerServiceLoginName { get; private set; }
        /// <summary>
        /// 메일 서버 서비스에 로그인시 필요한 라이센스 코드를 가져옵니다.
        /// </summary>
        public static string gMailServerServiceLicenseCode { get; private set; }
        /// <summary>
        /// 서버 점검중인지 여부를 설정하거나 가져옵니다.
        /// </summary>
        public static bool gChecking { get; set; }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        #endregion

        #region ■ 2.2 WebUIPage event part

        #endregion

        #region ■ 2.3 Initializatize Dynamic WebControls

        #endregion

        #region ■ 2.4 Initializatize variables

        #endregion

        #region ■ 2.5 Set local default variables

        private void SetDefaultMode() {
        }

        private void SetStandardMode() {

        }

        #endregion

        #endregion

        #region ▶ 3. Event Method part

        #region ■ 3.1 SubClass Event part

        void Application_Start(object sender, EventArgs e) {
            LogManager.DebugWrite("[Global.Application_Start] 웹서버 시작중...");

            try {
                //eniFrameworkLocalizer.Activate();
                //eniFrameworkEditorsLocalizer.Activate();
                //eniFrameworkGridLocalizer.Activate();
                
                DatabaseAccessBase.ContectionStringPrefix = "";
                

                LogManager.DebugWrite("[Global.Application_Start] 글로벌 변수 초기화.");

                gEnvironmonts   = new Environments();
                gSettings       = new Settings();
                gSecuritys      = new Securitys();
                gDirectorys     = new Directorys();
                gLogger         = new Logger();


                //WebAuthSettings.RegisterOpenAuth();
                RouteInfo.RegisterRoutes(RouteTable.Routes);
                Utilities.EnsureRequestValidationMode();
                ThemesProviderEx.Register();
                CriteriaToEFExpressionConverter.EntityFunctionsType = typeof(System.Data.Entity.DbFunctions);
                CriteriaToEFExpressionConverter.SqlFunctionsType = typeof(System.Data.Entity.SqlServer.SqlFunctions);
                ASPxWebControl.CallbackError +=ASPxWebControl_CallbackError;

                LogManager.DebugWrite("[Global.Application_Start] 기본 데이터 베이스 연결 테스트.");

                var dbAccess = (DatabaseAccess)gDbAccess;
                try {
                    dbAccess.Connect();
                } catch (System.Exception ex) {
                    throw new ExceptionManager("Web.Config에 설정된 ConnectionString으로 데이터 베이스 연결을 생성할수 없습니다.", ex);
                } finally {
                    dbAccess.DisConnect();
                }

                LogManager.DebugWrite("[Global.Application_Start] hMailServerService 변수 초기화.");

                switch (ConfigManager.GetApplicationSetting("hMailServerIP").ToLower()) {
                    case "ko": eLang = Lang.KOR; break;
                    case "en": eLang = Lang.USA; break;
                    case "cn": eLang = Lang.CHN; break;
                    case "jp": eLang = Lang.JPN; break;
                }
                _strMailServerService_IP        = Configuration.ConfigManager.GetApplicationSetting("MailServerServiceIP");
                var strProt                     = Configuration.ConfigManager.GetApplicationSetting("MailServerServicePort");
                int.TryParse(strProt, out _iMailServerService_Port);
                _strMailServerService_EndPacket = Configuration.ConfigManager.GetApplicationSetting("MailServerServiceEndPacket");
                gMailServerServiceLoginName     = Configuration.ConfigManager.GetApplicationSetting("MailServerServiceLoginName");
                gMailServerServiceLicenseCode   = Configuration.ConfigManager.GetApplicationSetting("MailServerServiceLicenseCode");

                gMailServerService              = new AdvancedAsyncSocketClient(Encoding.Default.GetBytes(_strMailServerService_EndPacket));
                gMailServerService.OnConnect    += gMailServerService_OnConnect;
                gMailServerService.OnError      += gMailServerService_OnError;
                gMailServerService.OnReceive    += gMailServerService_OnReceive;
                gMailServerService.OnSend       += gMailServerService_OnSend;
                gMailServerService.OnClose      += gMailServerService_OnClose;
                _tmhMailServerService_ReConnector = new System.Threading.Timer(Callback);
                CallerStateChage(true);

                LogManager.DebugWrite("[Global.Application_Start] 배경 작업 큐 초기화.");

                _sending_queue = new Queue<IServiceQueueBase>();
                _sending_thread = new SystemThreading.Thread(Background_ScanWork);
                _sending_thread.Start();

                if (!Directory.Exists(_dataPath)) {
                    Directory.CreateDirectory(_dataPath);
                }
                LogManager.DebugWrite("[Global.Application_Start] -> 배경 작업 큐 백업파일 생성");

                st_backup_list_io = System.IO.File.Open(Path.Combine(_dataPath, BACKUP_FILE_NAME), FileMode.OpenOrCreate);
                if (st_backup_list_io.Length > 0) {
                    LogManager.DebugWrite("[Global.Application_Start] -> 배경 작업 큐 백업파일 리딩");

                    var bin = new BinaryFormatter();
                    var backup_list = (List<IServiceQueueBase>)bin.Deserialize(st_backup_list_io);

                    lock(_sending_queue_lock){
                        foreach (var item in backup_list) {
                            _sending_queue.Enqueue(item);
                        }
                    }
                    st_backup_list_io.SetLength(0);
                }

                st_backup_list_io.Close();

                gChecking = false;

                LogManager.DebugWrite("[Global.Application_Start] -> Application 정상 시작");
            } catch (System.Exception ex) {
                LogManager.DebugWrite(string.Format("[Global.Application_Start] Error -> {0}", ex.Message));

                throw new ExceptionManager(ex, true);
            }
        }


        void Application_End(object sender, EventArgs e) {
            LogManager.DebugWrite("[Global.Application_End] 웹서버 중지중...");
            //  응용 프로그램 종료 시 실행되는 코드
            this.Dispose();
        }

        void Session_Start(object sender, EventArgs e) {
            if (this.Session == null) {                          // ashx 등 IRequiresSessionState을 상속받지 않은 요청대상은 Session 객체가 없다
                LogManager.DebugWrite("[Global.Session_Start] 세션 Null.");
                return;
            }
            if (this.Request == null) {
                LogManager.DebugWrite("[Global.Session_Start] Request Null.");
                return;
            }

            LogManager.DebugWrite("[Global.Session_Start] 세션 발급.");

            //세션이 만들어질 때 발생하는 이벤트입니다.
            try {
                var cur_dt = DateTime.Now;
                var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) {
                    Direction = ParameterDirection.Output
                };
                var aParams = new SqlParameter[] {
                    new SqlParameter("@TYPE", "SH"), 
                    new SqlParameter("@TEMP_GL_DATE", cur_dt.ToString(CommonVariable.CDT_YYYYMMDD)),
                    new SqlParameter("@USR_ID", "GroupwareAspNet"),
                    retParam
                };

                var dbAccess = (DatabaseAccess)gDbAccess;
                dbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                var strSHNo = retParam.Value.ToString();
                var strSql = new StringBuilder();
                strSql.AppendLine(" INSERT INTO S_SESSION_HIST (SH_NO, SESSION_ID, START_DT, URL_SCHEME, HTTP_METHOD, USER_AGENT, USER_BROWSER, USER_BROWSER_VER, USER_HOST_ADDR, USER_HOST_NAME, USER_LANG, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                strSql.AppendLine(" VALUES ( ");
                strSql.Append(Data.FilterVariable(strSHNo, true));
                strSql.Append(Data.FilterVariable(this.Session.SessionID, true));
                strSql.Append(Data.FilterVariable(cur_dt.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                strSql.Append(Data.FilterVariable(this.Request.Url.Scheme, true));
                strSql.Append(Data.FilterVariable(this.Request.HttpMethod, true));
                strSql.Append(Data.FilterVariable(this.Request.UserAgent, true));
                strSql.Append(Data.FilterVariable(this.Request.Browser.Browser, true));
                strSql.Append(Data.FilterVariable(this.Request.Browser.Version, true));
                strSql.Append(Data.FilterVariable(this.Request.UserHostAddress, true));
                strSql.Append(Data.FilterVariable(this.Request.UserHostName, true));
                if (this.Request.UserLanguages != null && this.Request.UserLanguages.Length > 0) {
                    strSql.Append(Data.FilterVariable(this.Request.UserLanguages[0], true));
                } else {
                    strSql.Append(Data.FilterVariable("None", true));
                }
                strSql.Append(Data.FilterVariable("GroupwareAspNet", true));
                strSql.Append(Data.FilterVariable(cur_dt.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                strSql.Append(Data.FilterVariable("GroupwareAspNet", true));
                strSql.Append(Data.FilterVariable(cur_dt.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                strSql.AppendLine(" ) ");

                dbAccess.ExecuteNonQuery(strSql.ToString());

                this.Session[CommonResource.SessionHistoryNo] = strSHNo;
            } catch (System.Exception ex) {
                LogManager.DebugWrite(string.Format("[Global.Session_Start.Error] 세션 에러  -> {0}", ex.Message));
            }
        }

        void Session_End(object sender, EventArgs e) {
            if (this.Session == null) {
                return;
            }

            LogManager.DebugWrite("[Global.Session_End] 세션 타임아웃.");

            //세션이 종료될 때 발생하는 이벤트입니다.
            try {
                var oSHNo = this.Session[CommonResource.SessionHistoryNo];
                var strSHNo = string.Empty;
                if (oSHNo == null) {
                    return;
                } else {
                    strSHNo = oSHNo.ToString();
                    if (string.IsNullOrWhiteSpace(strSHNo)) {
                        return;
                    }
                }

                var dbAccess = (DatabaseAccess)gDbAccess;
                var endDate = DateTime.Now;

                //세션이 종료될 때 발생합니다. 
                var strSql = new StringBuilder();
                strSql.AppendLine("SELECT ISNULL(USR_ID, '')");
                strSql.AppendLine("FROM S_SESSION_HIST (NOLOCK)");
                strSql.AppendLine(string.Format("WHERE SH_NO = {0}", Data.FilterVariable(strSHNo)));

                var strUserId = dbAccess.ExecuteScalar(strSql.ToString()); 

                if (strUserId != null && string.IsNullOrWhiteSpace(strUserId.ToString()) == false) {
                    strSql.Clear();
                    strSql.AppendLine("UPDATE A SET");
                    strSql.AppendLine(string.Format("A.LOGOUT_DT = {0}", Data.FilterVariable(endDate.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                    strSql.AppendLine("FROM S_LOGIN_HIST A");
                    strSql.AppendLine(string.Format("WHERE A.SH_NO = {0}", Data.FilterVariable(strSHNo)));
                    strSql.AppendLine(string.Format("AND A.SESSION_ID = {0}", Data.FilterVariable(this.Session.SessionID)));
                    strSql.AppendLine(string.Format("AND A.USR_ID = {0}", Data.FilterVariable(strUserId)));

                    dbAccess.ExecuteNonQuery(strSql.ToString());
                }

                strSql.Clear();
                strSql.AppendLine("UPDATE A SET");
                strSql.AppendLine(string.Format("A.END_DT = {0}", Data.FilterVariable(endDate.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true)));
                strSql.AppendLine(string.Format("A.UPDT_USER_ID = {0}", Data.FilterVariable("GroupwareAspNet", true)));
                strSql.AppendLine(string.Format("A.UPDT_DT = {0}", Data.FilterVariable(endDate.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                strSql.AppendLine("FROM S_SESSION_HIST A");
                strSql.AppendLine(string.Format("WHERE A.SH_NO = {0}", Data.FilterVariable(strSHNo)));
                strSql.AppendLine(string.Format("AND A.SESSION_ID = {0}", Data.FilterVariable(this.Session.SessionID)));

                dbAccess.ExecuteNonQuery(strSql.ToString());

                this.Session.RemoveAll();
                this.Session.Abandon();
            } catch (System.Exception ex) {
                LogManager.DebugWrite(string.Format("[Global.Session_End.Error] -> {0}", ex.Message));
            }
        }

        void Application_Error(object sender, EventArgs e) {
            var strMsg = string.Empty;
            var ex = HttpContext.Current.Server.GetLastError();
            if (ex != null) {
                strMsg = ex.Message;
                new ExceptionManager(ex, true);
            }
            if (!string.IsNullOrWhiteSpace(strMsg)) {
                LogManager.DebugWrite(string.Format("[Global.Application_Error] -> {0}", strMsg));
            }
        }
        void ASPxWebControl_CallbackError(object sender, EventArgs e) {
            
            var strCallbackMsg = ASPxWebControl.GetCallbackErrorMessage();
            var ex = HttpContext.Current.Server.GetLastError();
            if (ex != null) {
                strCallbackMsg = ex.Message;
            }

            if (!string.IsNullOrWhiteSpace(strCallbackMsg)) {
                LogManager.DebugWrite(string.Format("[Global.ASPxWebControl_CallbackError] -> {0}", strCallbackMsg));
                ASPxWebControl.SetCallbackErrorMessage(strCallbackMsg);
            }
        }

        void Application_BeginRequest(object sender, EventArgs e) {
            //ASP.NET이 요청에 응답할 때 HTTP 파이프라인 형태의 첫 번째 이벤트로 발생합니다.
            //mvc일대
            //ASPxWebControl.SetIECompatibilityMode(Convert.ToInt32(double.Parse(Request.Browser.Version)));
            ASPxWebControl.SetIECompatibilityModeEdge();

            //HttpContext.Current.Response.Redirect("~/Error");
        }

        void Application_AuthenticateRequest(object sender, EventArgs e) {
            //보안 모듈에서 사용자의 ID를 설정한 경우 발생합니다.
            AccountAuth.AttachRolesToUser();
        }

        void Application_AuthorizeRequest(object sender, EventArgs e) {
            //보안 모듈에서 사용자 인증을 확인한 경우 발생합니다.
        }

        void Application_ResolveRequestCache(object sender, EventArgs e) {
            //ASP.NET에서 인증 이벤트를 완료하여 이벤트 처리기(예: 페이지 또는 XML Web services)의 실행을 무시하고 캐싱 모듈이 캐시 요청을 처리하도록 하는 경우 발생합니다.

        }

        void Application_AcquireRequestState(object sender, EventArgs e) {
            //ASP.NET에서 현재 요청과 관련된 현재 상태(예: 세션 상태)를 가져오는 경우 발생합니다

        }

        void Application_PreRequestHandlerExecute(object sender, EventArgs e) {
            //ASP.NET에서 페이지 또는 XML Web services 같은 이벤트 처리기의 실행을 시작하기 바로 전에 발생합니다.

        }
        void Application_PreSendRequestHeaders(object sender, EventArgs e) {
            // ASP.NET에서 클라이언트로 HTTP 헤더를 보내기 바로 전에 발생합니다. 
            //HttpServerUtility wServer = HttpContext.Current.Server;

        }
        void Application_PreSendRequestContent(object sender, EventArgs e) {
            //ASP.NET에서 클라이언트로 내용을 보내기 바로 전에 발생합니다.
        }

        void Application_PostRequestHandlerExecute(object sender, EventArgs e) {
            //ASP.NET 이벤트 처리기(예: 페이지 또는 XML Web services)가 실행을 완료하는 경우 발생합니다.

        }
        void Application_ReleaseRequestState(object sender, EventArgs e) {
            //ASP.NET에서 모든 요청 이벤트 처리기 실행을 완료한 후 발생합니다. 이 이벤트는 상태 모듈이 현재 상태 데이터를 저장할 수 있도록 합니다.
        }
        void Application_UpdateRequestCache(object sender, EventArgs e) {
            //ASP.NET이 이벤트 처리기 실행을 완료하여 캐싱 모듈이 캐시의 다음 요청을 처리하는 데 사용할 응답을 저장하도록 하는 경우 발생합니다.
        }
        void Application_EndRequest(object sender, EventArgs e) {
            //ASP.NET이 요청에 응답할 때 실행의 HTTP 파이프라인 체인에서 마지막 이벤트로 발생합니다.
        }

        #endregion

        #region ■ 3.2 Class Event part

        protected static void Background_ScanWork() {
            try {
                var reconnect = false;
                while (!bIsStop) {
                    lock (_sending_queue_lock) {
                        while (_sending_queue.Count == 0) {
                            //SystemThreading.ThreadInterruptedException 발생함
                            SystemThreading.Monitor.Wait(_sending_queue_lock);
                        }

                        if (!bIsConnecting && bClientLicenseOk) {
                            reconnect = false;

                            var faild_list = new List<IServiceQueueBase>();

                            lock (_mailserverservice_lock) {
                                while (_sending_queue.Count != 0) {
                                    var message = _sending_queue.Dequeue();

                                    try {
                                        gMailServerService.Send(message.GetSerialize());
                                    } catch (System.Exception ex) {
                                        LogManager.DebugWrite(string.Format("[Global.Background_ScanWork.Error] : 메일 서버 서비스 데이터 보내기 오류. -> {0}", ex.Message));

                                        faild_list.Add(message);
                                    }
                                }
                                SystemThreading.Monitor.Pulse(_mailserverservice_lock);
                            }

                            foreach (var item in faild_list) {
                                _sending_queue.Enqueue(item);
                            }
                        } else {
                            reconnect = true;
                            SystemThreading.Monitor.Pulse(_sending_queue_lock);
                        }
                    }

                    if (reconnect) {
                        SystemThreading.Thread.Sleep(30000);
                    }
                }
            } catch (SystemThreading.ThreadInterruptedException) {
            } catch (System.Exception ex) {
                LogManager.DebugWrite(string.Format("[Global.Background_ScanWork.Error] -> 큐 배경작업이 종료되었습니다 -> {0}", ex.Message));
            } finally {
            }
        }

        /// <summary>
        /// 메일 서버 서비스 프록시 서버로 작업 데이터를 보냅니다.
        /// </summary>
        /// <param name="iServiceQueue">작업 데이터</param>
        public static void SendToMailServerService(IServiceQueueBase iServiceQueue) {
            LogManager.DebugWrite("[Global.SendToMailServerService] 큐 배경작업에 리스트 추가");

            lock (_sending_queue_lock) {
                _sending_queue.Enqueue(iServiceQueue);
                SystemThreading.Monitor.Pulse(_sending_queue_lock);
            }
        }

        static void gMailServerService_OnConnect(object sender, AsyncSocketConnectionEventArgs e) {
            LogManager.DebugWrite(string.Format("[Global.gMailServerService_OnConnect] 서버에 연결됨 -> {0}:{1}", _strMailServerService_IP, _iMailServerService_Port));

            CallerStateChage(false);

            bIsConnecting = false;

            //서버에 로그인 시도
            var mailserverservice = (AdvancedAsyncSocketClient)sender;
            var clientBase = new ClientBase(DuplexCommand.CTOS_LOGIN, gMailServerServiceLoginName, gMailServerServiceLicenseCode);
            mailserverservice.Send(clientBase.GetSerialize());
        }


        static void gMailServerService_OnError(object sender, AsyncSocketErrorEventArgs e) {
            LogManager.DebugWrite("[Global.gMailServerService_OnError] 서버 통신 소캣 오류 -> 재접속 시작.");

            //서버와의 통신중 오류발생 
            bIsConnecting = false;
            bClientLicenseOk = false;

            CallerStateChage(true);
        }
        static void gMailServerService_OnReceive(object sender, AsyncSocketReceiveEventArgs e) {
            LogManager.DebugWrite("[Global.gMailServerService_OnReceive] 서버로부터 데이터 수신");

            var clientsocket = (AdvancedAsyncSocketClient)sender;

            try {
                var deSer = SerializableBase.GetDeSerialize<ServerBase>(e.ReceiveByte);
                if (deSer.Command == DuplexCommand.STOC_LOGIN_RESULT_OK) {
                    LogManager.DebugWrite("[Global.gMailServerService_OnReceive] 인증됨");
                    //서버에서 로그인 허용 할때
                    bClientLicenseOk = true;
                }
            } catch { }
        }
        static void gMailServerService_OnSend(object sender, AsyncSocketSendEventArgs e) {
        }
        static void gMailServerService_OnClose(object sender, AsyncSocketConnectionEventArgs e) {
            LogManager.DebugWrite(string.Format("[Global.gMailServerService_OnConnect] 서버에 접속 해지 -> {0}:{1}", _strMailServerService_IP, _iMailServerService_Port));

            bClientLicenseOk = false;

            //재연결 시도
            CallerStateChage(true);
        }

        static void Callback(object status) {
            CallerStateChage(false);

            if (!bIsConnecting) {
                bIsConnecting = true;
                gMailServerService.Connect(_strMailServerService_IP, _iMailServerService_Port);
            }
        }

        static void CallerStateChage(bool pEnable) {
            if (pEnable == true && !bIsStop) {
                _tmhMailServerService_ReConnector.Change(30000, 30000);
            } else {
                _tmhMailServerService_ReConnector.Change(System.Threading.Timeout.Infinite, 30000);
            }
        }

        #endregion

        #endregion

        #region ▶ 4. User-defined function group

        /// <summary>
        /// 사용자 계정정보를 웹서버 메모리 캐시에 저장합니다.
        /// </summary>
        /// <param name="oLoginUser">사용자 계정정보</param>
        public static void AddLoginCach(Account oLoginUser) {
            try {
                lock (_loginUsers_lock) {
                    var user = _loginUsers.Where(row_user => row_user.UserId == oLoginUser.UserId);
                    if (user.Count() > 0) {
                        _loginUsers.Remove(user.First());
                    }

                    _loginUsers.Add(oLoginUser);

                    SystemThreading.Monitor.Pulse(_loginUsers_lock);
                }
            } catch (System.Exception ex) {
                new ExceptionManager("[Global.AddLoginCach.Error] -> Global.AddLoginCach", ex, true);
                LogManager.DebugWrite(string.Format("[Global.AddLoginCach.Error] -> {0}", ex.Message));
            }
        }
        /// <summary>
        /// 사용자 계정정보를 웹서버 메모리 캐시에서 가져옵니다.
        /// </summary>
        /// <param name="strUserId">사용자 아이디</param>
        /// <returns>사용자 계쩡정보</returns>
        public static Account GetLoginCach(string strUserId) {
            try {
                var account = default(Account);
                lock (_loginUsers_lock) {
                    var user = _loginUsers.Where(row_user => row_user.UserId == strUserId);
                    if (user.Count() > 0) {
                        account = user.First();
                    }

                    SystemThreading.Monitor.Pulse(_loginUsers_lock);
                }

                return account;
            } catch (System.Exception ex) {
                new ExceptionManager("[Global.GetLoginCach.Error] -> Global.RemoveLoginCach", ex, true);
                LogManager.DebugWrite(string.Format("[Global.GetLoginCach.Error] -> {0}", ex.Message));
                return null;
            }
        }
        /// <summary>
        /// 사용자 계정정보를 웹서버 메모리 캐시에서 제거합니다.
        /// </summary>
        /// <param name="oLoginUser">사용자 계정정보</param>
        public static void RemoveLoginCach(Account oLoginUser) {
            try {
                lock (_loginUsers_lock) {
                    var user = _loginUsers.Where(row_user => row_user.UserId == oLoginUser.UserId);
                    if (user.Count() > 0) {
                        _loginUsers.Remove(user.First());
                    }

                    SystemThreading.Monitor.Pulse(_loginUsers_lock);
                }
            } catch (System.Exception ex) {
                new ExceptionManager("[Global.RemoveLoginCach.Error] -> Global.RemoveLoginCach", ex, true);
                LogManager.DebugWrite(string.Format("[Global.RemoveLoginCach.Error] -> {0}", ex.Message));
            }
        }

        new void Dispose() {
            bIsStop = true;

            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        void Dispose(bool disposing) {
            LogManager.DebugWrite("[Global.Dispose] Application 종료 절차 시작");

            if (disposing) {
                // 이 클래스가 관리중인 리소스 정리
                if (_sending_queue.Count > 0) {
                    LogManager.DebugWrite(string.Format("[Global.Dispose] Data 백업 시작 -> [Queue{0}] 건", _sending_queue.Count));

                    var tmp_list = new List<IServiceQueueBase>();
                    while (_sending_queue.Count != 0) {
                        var temp = _sending_queue.Dequeue();
                        if (temp is IServiceQueueBase) {
                            tmp_list.Add(temp);
                        }
                    }

                    LogManager.DebugWrite("[Global.Dispose] Data 백업 저장");

                    var bin = new BinaryFormatter();

                    st_backup_list_io = System.IO.File.Open(Path.Combine(_dataPath, BACKUP_FILE_NAME), FileMode.OpenOrCreate);
                    bin.Serialize(st_backup_list_io, tmp_list);
                }

                LogManager.DebugWrite("[Global.Dispose] Data 백업 파일 리소스 해제");

                st_backup_list_io.Close();
                st_backup_list_io.Dispose();
                st_backup_list_io = null;

                LogManager.DebugWrite("[Global.Dispose] Application 스레드 종료");

                if (_sending_thread.ThreadState == SystemThreading.ThreadState.WaitSleepJoin) {
                    _sending_thread.Interrupt();
                }
                _sending_thread.Join();
            }

            // 비관리 객체 정리 - 관리되지 않는 자원을 해제 (큰 변수들을 null로 설정한다.)
        }

        #endregion
    }
}