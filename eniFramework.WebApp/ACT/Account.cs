using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Security.Principal;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;

using hMailServerService;
using hMailServerService.SocketLayer;

//using eniFramework.WebApp.Properties;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.Security;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Common;

using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

namespace eniFramework.WebApp.ACT {
    [Serializable]
    public class Account : ICloneable {
        IDatabaseAccess _IDbAccess { get; set; }
        /// <summary>
        /// 사용자별로 생성된 데이터 베이스 접근 객채를 가져옵니다.
        /// </summary>
        public DatabaseAccess DbAccess { get { return (DatabaseAccess)_IDbAccess; } }
        /// <summary>
        /// 사용자별로 생성된 데이터 베이스 접근 객채를 가져옵니다.(배치형)
        /// </summary>
        public DatabaseBatchAccess DbBatchAccess { get { return (DatabaseBatchAccess)_IDbAccess; } }
        /// <summary>
        /// 사용자별로 생성된 메일서버 공급자를 가져옵니다.
        /// </summary>
        public hMailServerProvider MailServerProvider { get; private set; }
        /// <summary>
        /// 사용자가 설정한 언어를 가저옵니다.
        /// </summary>
        public string Lang { get; private set; }
        /// <summary>
        /// 웹서버 고유 세션 번호를 가져옵니다.
        /// </summary>
        public string ShNo { get; private set; }
        /// <summary>
        /// 웹서버에 로그인한 고유 번호를 가져옵니다.
        /// </summary>
        public string LhNo { get; private set; }
        /// <summary>
        /// 웹서버에서 발행된 세션의 고유 아이디를 가져옵니다.
        /// </summary>
        public string SessionID { get; private set; }
        

        /// <summary>
        /// 사용자 아이디를 가져옵니다.
        /// </summary>
        public string UserId { get; private set; }
        /// <summary>
        /// 사용자 비밀번호를 가져옵니다.
        /// </summary>
        public string UserPwd { get; private set; }
        /// <summary>
        /// ERP 번호를 가져옵니다.
        /// 외부사용자가 아니라면 사번을 가져오고, 외부사용자이면 거래처 코드를 가져옵니다.
        /// </summary>
        public string ErpNo { get; private set; }
        /// <summary>
        /// 사용자 유효일을 가져옵니다.
        /// </summary>
        public DateTime UserValidDt { get; private set; }
        /// <summary>
        /// 사용자 비밀번호 유효일을 가져옵니다.
        /// </summary>
        public DateTime UserPwdValidDt { get; private set; }
        /// <summary>
        /// 사용자 암호화된 비밀번호를 가져옵니다.
        /// </summary>
        public string UserPwdSct { get; private set; }
        /// <summary>
        /// 사용가 설정한 사진을 가져옵니다.
        /// </summary>
        public byte[] UserPhoto { get; private set; }
        /// <summary>
        /// 사용자 도메인 그룹을 가져옵니다.
        /// </summary>
        public string Domain { get; private set; }
        /// <summary>
        /// ERP 이름을 가져옵니다.
        /// 외부사용자가 아니라면 인사마스터의 이름을 가져오고, 외부사용자이면 거래처 명을 가져옵니다.
        /// </summary>
        public string Name { get; private set; }
        /// <summary>
        /// 사용자 영문 이름을 가져옵니다.
        /// </summary>
        public string EnglishName { get; private set; }
        /// <summary>
        /// 사용자 한자 이름을 가져옵니다.
        /// </summary>
        public string HanjaName { get; private set; }
        /// <summary>
        /// 사용자 생일을 가져옵니다.
        /// </summary>
        public DateTime BirtDay { get; private set; }
        /// <summary>
        /// 사용자 종류를 가져옵니다.
        /// </summary>
        public string UserKind { get; private set; }
        /// <summary>
        /// 사용자 종류명을 가져옵니다.
        /// </summary>
        public string UserKindName { get; private set; }
        /// <summary>
        /// 사용자 타입을 가져옵니다.
        /// </summary>
        public string UserType { get; private set; }
        /// <summary>
        /// 사용자 타입명을 가져옵니다.
        /// </summary>
        public string UserTypeName { get; private set; }
        /// <summary>
        /// 사용자 구분을 가져옵니다.
        /// </summary>
        public string UserGubun { get; private set; }
        /// <summary>
        /// 사용자 구분명을 가져옵니다.
        /// </summary>
        public string UserGubunName { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장 코드를 가져옵니다.
        /// </summary>
        public string BizAreaCode { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장명을 가져옵니다.
        /// </summary>
        public string BizAreaName { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 영문 사업장명을 가져옵니다.
        /// </summary>
        public string BizAreaEnglishName { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장명 전화번호를 가져옵니다.
        /// </summary>
        public string BizAreaTelNo { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장명 팩스번호를 가져옵니다.
        /// </summary>
        public string BizAreaFaxNo { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장 대표메일을 가져옵니다.
        /// </summary>
        public string BizAreaMailAddress { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장 우편번호를 가져옵니다.
        /// </summary>
        public string BizAreaZipCode { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장 주소를 가져옵니다.
        /// </summary>
        public string BizAreaAddress { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 사업장 영문 주소를 가져옵니다.
        /// </summary>
        public string BizAreaEnglishAddress { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 공장 코드를 가져옵니다.
        /// </summary>
        public string PlantCode { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 공장명을 가져옵니다.
        /// </summary>
        public string PlantName { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 부서 코드를 가져옵니다.
        /// </summary>
        public string DeptCode { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 부서명을 가져옵니다.
        /// </summary>
        public string DeptName { get; private set; }
        /// <summary>
        /// 영문 부서명을 가져옵니다.
        /// </summary>
        public string DeptEnglishName { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 직위 코드를 가져옵니다.
        /// </summary>
        public string RolePstnCode { get; private set; }
        /// <summary>
        /// 그룹웨어에 설정된 직위명을 가져옵니다.
        /// </summary>
        public string RolePstnName { get; private set; }
        /// <summary>
        /// 영문 직위명을 가져옵니다.
        /// </summary>
        public string RolePstnEnglishName { get; private set; }
        /// <summary>
        /// 입사일을 가져옵니다.
        /// </summary>
        public DateTime EntrDt { get; private set; }
        /// <summary>
        /// 외부메일 주소를 가져옵니다.
        /// </summary>
        public string ExternalMailAddress { get; private set; }
        /// <summary>
        /// 우편번호를 가져옵니다.
        /// </summary>
        public string ZipCode { get; private set; }
        /// <summary>
        /// 주소를 가져옵니다.
        /// </summary>
        public string Address { get; private set; }
        /// <summary>
        /// 전화번호를 가져옵니다.
        /// </summary>
        public string TelNo { get; private set; }
        /// <summary>
        /// 팩스 번호를 가져옵니다.
        /// </summary>
        public string FaxNo { get; private set; }
        /// <summary>
        /// 긴급 전화번호를 가져옵니다.
        /// </summary>
        public string EmergencyTelNo { get; private set; }
        /// <summary>
        /// 핸드폰번호를 가져옵니다.
        /// </summary>
        public string HandTelNo { get; private set; }
        /// <summary>
        /// 메일 주소를 가져옵니다.
        /// </summary>
        public string MailAddress { get; private set; }
        /// <summary>
        /// 관리자인지 여부를 가져옵니다.
        /// </summary>
        public UseYN AdminYn { get; private set; }
        /// <summary>
        /// 메일계정을 사용하는지 여부를 가져옵니다.
        /// </summary>
        public UseYN UseMailYn { get; private set; }
        
        /// <summary>
        /// 메일 서버의 고유 아이디를 가져옵니다.
        /// </summary>
        public int AccountId { get; private set; }
        /// <summary>
        /// 메일 서버의 도메인에 해당하는 고유 아이디를 가져옵니다.
        /// </summary>
        public int DomainId { get; private set; }
        /// <summary>
        /// 메일 서버의 실제 도메인을 가져옵니다.
        /// </summary>
        public string DomainName { get; private set; }
        /// <summary>
        /// 메일 서버의 실제 도메인이 외부로 노출되는 도메인을 가져옵니다.
        /// </summary>
        public string DomainSendName { get; private set; }
        /// <summary>
        /// 계정의 최대 용량을 가져옵니다.
        /// </summary>
        public int AccountMaxSize { get; private set; }
        /// <summary>
        /// 시스템 로그인 시간을 가져옵니다.
        /// </summary>
        public DateTime LoginDt { get; private set; }
        /// <summary>
        /// 사용자가 접근가능한 메뉴 컬랙션을 반환합니다.
        /// </summary>
        public AccountMNUs RoleMNUs { get; private set; }


        internal Account() {
            this._IDbAccess = new DatabaseBatchAccess();
            this.RoleMNUs = new AccountMNUs();
        }
        internal Account(string strUserId)
            : this() {
            if (string.IsNullOrWhiteSpace(strUserId)) 
                throw new ExceptionManager("사용자 아이디는 공백일수 없습니다.");

            this.UserId = strUserId.ToLower();
            
            this.DbAccess.SetApplicationName(strUserId);
        }

        /// <summary>
        /// 로그인을 처리 합니다.
        /// </summary>
        /// <param name="oPage"></param>
        /// <param name="sUserPwd"></param>
        internal void LoginProcess(Page oPage, string sUserPwd) {
            if (oPage == null) 
                throw new ArgumentNullException("oPage", "Page Object is null.");

            LoginProcess(oPage, UserId, sUserPwd);
        }

        /// <summary>
        /// 로그인을 처리 합니다.
        /// </summary>
        /// <param name="oPage">Page</param>
        /// <param name="strUserId">아이디</param>
        /// <param name="strUserPwd">비밀번호</param>
        internal void LoginProcess(Page oPage, string strUserId, string strUserPwd) {
            if (oPage == null)
                throw new ArgumentNullException("oPage", "Page Object is null.");

            Lang = Utilities.GetLang(oPage);
            _IDbAccess.Language = EnumDef.ConvertLangToMsSqlLang(Lang);

            var oServer = oPage.Server;
            var oSession = oPage.Session;
            var oResponse = oPage.Response;

            if (string.IsNullOrWhiteSpace(ShNo))
                ShNo = oSession[CommonResource.SessionHistoryNo].ToString();
            if (string.IsNullOrWhiteSpace(SessionID))
                SessionID = oSession.SessionID;
            if (string.IsNullOrWhiteSpace(UserId))
                UserId = strUserId;

            if (oSession[CommonResource.SessionAccount] != null) {
                var provSession = oSession[CommonResource.SessionAccount] as Account;
                if (provSession != null) {
                    provSession.LogoutProcess(oPage);
                }
            }

            var pwdHash = MD5.GetHash(Encoding.ASCII.GetBytes(strUserPwd));
            UserPwd = SecurityManager.ConvertToString(pwdHash);

            try {
                LoginDt = DateTime.Now;

                var retParam = new SqlParameter("@RETURN_VALUE", DBNull.Value) {
                    Direction = ParameterDirection.ReturnValue
                };
                var outParam = new SqlParameter("@LH_NO", DBNull.Value) {
                    Direction = ParameterDirection.Output
                };
                var aParams = new SqlParameter[] {
                    retParam,
                    new SqlParameter("@SH_NO", ShNo),
                    new SqlParameter("@SESSION_ID", SessionID),
                    new SqlParameter("@USR_ID", UserId), 
                    new SqlParameter("@USR_PWD", UserPwd),
                    outParam
                };

                DbAccess.Connect();

                DbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(Lang))));

                //로그인 처리 프로시저 실행
                DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_LOGIN", aParams);

                DbAccess.DisConnect();

                var retMsgId = (int)retParam.Value;
                if (retMsgId != 0) {
                    throw new ExceptionManager(retMsgId, DbAccess.GetMessage(Lang, retMsgId.ToString()));
                }

                LhNo = outParam.Value.ToString();

                SetAccountInfo();

                CreateRoleMNU();

                //Response 객체를 받은건 쿠기를 넣을때 사용
                //pResponse.Cookies.Add(new HttpCookie("ckUserId", pServer.UrlEncode(UserId)));

                if (UseMailYn == UseYN.Y) {
                    MailServerProvider = new hMailServerProvider(this.DbAccess, this.UserId, this.AccountId, this.DomainId, this.DomainName, this.DomainSendName, 
                                                                string.Format("{0}@{1}", this.UserId, this.DomainName), this.MailAddress, this.AccountMaxSize);
                }

                //사용자 세션에 Account 객체 포함
                oSession[CommonResource.SessionAccount] = this;

                Global.AddLoginCach(this);

                //인증 쿠키 생성
                FormsAuthentication.SetAuthCookie(UserId, false);

                AccountAuth.RedirectFromLoginPage(UserId, UserId, false);
            } catch (System.Threading.ThreadAbortException) {
            } catch (SqlException ex) {
                throw new ExceptionManager(ex.Number, ex.Message, ex.StackTrace, ex);
            }
        }

        public string LoginProcess(HttpContext oContext, string sUserPwd, string sSsId, string sShNo) {
            if (oContext == null)
                throw new ArgumentNullException("oContext", "HttpContext Object is null.");

            return LoginProcess(oContext, UserId, sUserPwd, sSsId, sShNo);
        }

        public string LoginProcess(HttpContext oContext, string strUserId, string strUserPwd, string sSsId, string sShNo) {
            if (oContext == null)
                throw new ArgumentNullException("oContext", "HttpContext Object is null.");

            Lang = Utilities.GetLang(oContext);

            var oServer = oContext.Server;
            var oSession = oContext.Session;
            var oResponse = oContext.Response;

            SessionID = sSsId;
            ShNo = sShNo;
            if (string.IsNullOrWhiteSpace(ShNo))
                ShNo = oSession[CommonResource.SessionHistoryNo].ToString();
            if (string.IsNullOrWhiteSpace(SessionID))
                SessionID = oSession.SessionID;
            if (string.IsNullOrWhiteSpace(UserId))
                UserId = strUserId;

            if (oSession[CommonResource.SessionAccount] != null) {
                var provSession = oSession[CommonResource.SessionAccount] as Account;
                if (provSession != null) {
                    provSession.LogoutProcess(oContext);
                }
            }

            var pwdHash = MD5.GetHash(Encoding.ASCII.GetBytes(strUserPwd));
            UserPwd = SecurityManager.ConvertToString(pwdHash);

            try {
                LoginDt = DateTime.Now;

                var retParam = new SqlParameter("@RETURN_VALUE", DBNull.Value) {
                    Direction = ParameterDirection.ReturnValue
                };
                var outParam = new SqlParameter("@LH_NO", DBNull.Value) {
                    Direction = ParameterDirection.Output
                };
                var aParams = new SqlParameter[] {
                    retParam,
                    new SqlParameter("@SH_NO", ShNo),
                    new SqlParameter("@SESSION_ID", SessionID),
                    new SqlParameter("@USR_ID", UserId), 
                    new SqlParameter("@USR_PWD", UserPwd),
                    outParam
                };

                DbAccess.Connect();

                DbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(Lang))));

                //로그인 처리 프로시저 실행
                DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_LOGIN", aParams);

                DbAccess.DisConnect();

                var retMsgId = (int)retParam.Value;
                if (retMsgId != 0) {
                    throw new ExceptionManager(retMsgId, DbAccess.GetMessage(retMsgId, Lang));
                }

                LhNo = outParam.Value.ToString();

                SetAccountInfo();

                CreateRoleMNU();

                //Response 객체를 받은건 쿠기를 넣을때 사용
                //pResponse.Cookies.Add(new HttpCookie("ckUserId", pServer.UrlEncode(UserId)));

                if (UseMailYn == UseYN.Y) {
                    MailServerProvider = new hMailServerProvider(this.DbAccess, this.UserId, this.AccountId, this.DomainId, this.DomainName, this.DomainSendName,
                                                                string.Format("{0}@{1}", this.UserId, this.DomainName), this.MailAddress, this.AccountMaxSize);
                }

                //사용자 세션에 WebAccount 객체 포함
                oSession[CommonResource.SessionAccount] = this;

                Global.AddLoginCach(this);

                //인증 쿠키 생성
                FormsAuthentication.SetAuthCookie(UserId, false);

                AccountAuth.SetAuthCookie(UserId, UserId, false, null);
                
            } catch (System.Threading.ThreadAbortException) {
            } catch (SqlException ex) {
                throw new ExceptionManager(ex.Number, ex.Message, ex.StackTrace, ex);
            }

            return LhNo;
        }

        public void LogoutProcess(HttpContext oContext) {
            if (oContext == null)
                throw new ArgumentNullException("oContext", "HttpContext Object is null.");

            Lang = Utilities.GetLang(oContext);

            var oServer = oContext.Server;
            var oSession = oContext.Session;
            var oResponse = oContext.Response;

            try {
                var retParam = new SqlParameter("@RETURN_VALUE", DBNull.Value) {
                    Direction = ParameterDirection.ReturnValue
                };
                var aParams = new SqlParameter[] {
                    retParam,
                    new SqlParameter("@LH_NO", LhNo), 
                    new SqlParameter("@SH_NO", ShNo), 
                    new SqlParameter("@SESSION_ID", SessionID),
                    new SqlParameter("@USR_ID", UserId),
                };

                DbAccess.Connect();

                DbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(Lang))));

                //로그인 처리 저장 프로시저 실행
                DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_LOGOUT", aParams);

                DbAccess.DisConnect();

                var retMsgId = (int)retParam.Value;
                if (retMsgId != 0) {
                    throw new ExceptionManager(retMsgId, DbAccess.GetMessage(Lang, retMsgId.ToString()));
                }

                Global.RemoveLoginCach(this);

                //사용자 세션 제거
                //oSession.Clear();
                oSession.Abandon();

                //인증 쿠키 폐기
                FormsAuthentication.SignOut();
            } catch (System.Threading.ThreadAbortException) {
            } catch (SqlException ex) {
                var errMessage = DbAccess.GetMessage(ex.Message);
                if (string.IsNullOrWhiteSpace(errMessage)) {
                    throw new ExceptionManager(ex.Number, ex.Message, ex.StackTrace, ex);
                } else {
                    throw new ExceptionManager(ex.Number, errMessage, ex.Message, ex);
                }
            }
        }

        public void LogoutProcess(Page oPage) {
            if (oPage == null)
                throw new ArgumentNullException("oPage", "Page Object is null.");

            Lang = Utilities.GetLang(oPage);

            var oServer = oPage.Server;
            var oSession = oPage.Session;
            var oResponse = oPage.Response;

            try {
                var retParam = new SqlParameter("@RETURN_VALUE", DBNull.Value) {
                    Direction = ParameterDirection.ReturnValue
                };
                var aParams = new SqlParameter[] {
                    retParam,
                    new SqlParameter("@LH_NO", LhNo), 
                    new SqlParameter("@SH_NO", ShNo), 
                    new SqlParameter("@SESSION_ID", SessionID),
                    new SqlParameter("@USR_ID", UserId),
                };

                DbAccess.Connect();

                DbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(Lang))));

                //로그인 처리 저장 프로시저 실행
                DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_LOGOUT", aParams);

                DbAccess.DisConnect();

                var retMsgId = (int)retParam.Value;
                if (retMsgId != 0) {
                    throw new ExceptionManager(retMsgId, DbAccess.GetMessage(Lang, retMsgId.ToString()));
                }

                Global.RemoveLoginCach(this);

                //사용자 세션 제거
                //oSession.Clear();
                oSession.Abandon();

                //인증 쿠키 폐기
                FormsAuthentication.SignOut();

                oResponse.Redirect("~/");
            } catch (System.Threading.ThreadAbortException) {
            } catch (SqlException ex) {
                var errMessage = DbAccess.GetMessage(ex.Message);
                if (string.IsNullOrWhiteSpace(errMessage)) {
                    throw new ExceptionManager(ex.Number, ex.Message, ex.StackTrace, ex);
                } else {
                    throw new ExceptionManager(ex.Number, errMessage, ex.Message, ex);
                }
            }
        }

        public void SessionTimeOutProcess(HttpServerUtility pServer, HttpResponse pResponse, HttpSessionState pSession) {
            if (pServer == null) throw new ExceptionManager("Server 객체는 Null값을 사용 할 수 없습니다.");
            if (pResponse == null) throw new ExceptionManager("Response 객체는 Null값을 사용 할 수 없습니다.");
            if (pSession == null) throw new ExceptionManager("Session 객체는 Null값을 사용 할 수 없습니다.");

            var aParams = new SqlParameter[] {
                    new SqlParameter("@USR_ID", UserId), 
                    new SqlParameter("@SESSION_ID", SessionID)
                };

            try {
                //로그아웃 처리 저장 프로시저 실행
                var iRet = DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_LOGOUT", aParams);

                //사용자 세션 제거
                pSession.RemoveAll();
                pSession.Timeout = 1;

                //pSession.Clear();<- Clear 을 호출하면 Session 종료되면서 다시 생성한다. 그렇게 되면 설정한 시간만큼 한세션을 또 만들기때문에 클리어만 하고 Timeout을 1분으로 준다.
                //pSession.Abandon(); <- Abandon 을 호출하면 Session 종료되면서 다시 생성한다. 그렇게 되면 설정한 시간만큼 한세션을 또 만들기때문에 클리어만 하고 Timeout을 1분으로 준다.
            } catch (SqlException ex) {
                var errMessage = DbAccess.GetMessage(ex.Message);
                if (string.IsNullOrWhiteSpace(errMessage)) {
                    throw new ExceptionManager(ex.Number, ex.Message, ex.StackTrace, ex);
                } else {
                    throw new ExceptionManager(ex.Number, errMessage, ex.Message, ex);
                }
            }
        }

        public static Account ReleseAuth(Page oPage/*, IPrincipal pUser*/) {
            if (oPage == null) throw new ExceptionManager("Page 객체는 Null값을 사용 할 수 없습니다.");

            var strLang = Utilities.GetLang(oPage);

            var oSessionNo = oPage.Session[CommonResource.SessionHistoryNo];
            var strSessionNo = (oSessionNo == null ? string.Empty : oSessionNo.ToString());
            var account = new Account(oPage.User.Identity.Name) {
                ShNo = strSessionNo,
                SessionID = oPage.Session.SessionID,
                Lang = strLang
            };
            
            try {
                var retParam = new SqlParameter("@RETURN_VALUE", DBNull.Value) {
                    Direction = ParameterDirection.ReturnValue
                };
                var outParamLhNo = new SqlParameter("@LH_NO", DBNull.Value) {
                    Direction = ParameterDirection.Output
                };
                var outParamProvShNo = new SqlParameter("@PROV_SH_NO", DBNull.Value) {
                    Direction = ParameterDirection.Output
                };
                var aParams = new SqlParameter[] {
                    retParam,
                    new SqlParameter("@SH_NO", strSessionNo), 
                    new SqlParameter("@SESSION_ID", account.SessionID),
                    new SqlParameter("@USR_ID", account.UserId),
                    outParamLhNo,
                    outParamProvShNo
                };

                account.DbAccess.Connect();

                //로그인 처리 저장 프로시저 실행
                account.DbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_USER_SESSION_RELESE", aParams);

                var retMsgId = (int)retParam.Value;
                if (retMsgId == -1) {
                    FormsAuthentication.SignOut();
                    if (oPage.IsCallback) {
                        oPage.Response.RedirectLocation = oPage.ResolveUrl("~/login");
                    } else {
                        oPage.Response.Redirect(oPage.ResolveUrl("~/login"));
                    }
                    return null;
                }

                //사용자 세션에 WebAccount 객체 포함
                account.LhNo = outParamLhNo.Value.ToString();

                var cachAccount = Global.GetLoginCach(account.UserId);

                if (cachAccount == null) {
                    account.SetAccountInfo();

                    account.CreateRoleMNU();

                    if (account.UseMailYn == UseYN.Y) {
                        account.MailServerProvider = new hMailServerProvider(account.DbAccess, account.UserId, account.AccountId, account.DomainId, account.DomainName, account.DomainSendName,
                                                                    string.Format("{0}@{1}", account.UserId, account.DomainName), account.MailAddress, account.AccountMaxSize);
                    }
                } else {
                    account.SetAccountInfo(cachAccount);
                }

                //Response 객체를 받은건 쿠기를 넣을때 사용
                //pResponse.Cookies.Add(new HttpCookie("ckUserId", pServer.UrlEncode(UserId)));

                //사용자 세션에 WebAccount 객체 포함
                oPage.Session[CommonResource.SessionAccount] = account;
            } catch (System.Threading.ThreadAbortException) {
            } catch (SqlException) {
                if (oPage.IsCallback) {
                    oPage.Response.RedirectLocation = oPage.ResolveUrl(oPage.Server.UrlEncode(string.Format("~/redirect?returnurl={0}", oPage.ResolveUrl("~/login"))));
                    oPage.Response.End();
                } else {
                    oPage.Response.Redirect(oPage.ResolveUrl(oPage.Server.UrlEncode("~/login")));
                }
            }

            return account;
        }

        public void SetLang(string strLang) {
            if (Lang != strLang) {
                Lang = strLang;
                _IDbAccess.Language = EnumDef.ConvertLangToMsSqlLang(Lang);

                RoleMNUs.Clear();

                CreateRoleMNU();
            }
        }

        public object Clone() {
            var cloneWebAccount = new Account() {
                UserId      = this.UserId,
                SessionID   = this.SessionID,
                UserPwd     = this.UserPwd,
                LoginDt     = this.LoginDt,
                RoleMNUs    = this.RoleMNUs
            };
            
            cloneWebAccount.SetAccountInfo(this);
            return cloneWebAccount;
        }

        private void SetAccountInfo(Account pAccount) {
            pAccount.DbAccess.SetApplicationName(this.UserId);

            this.UserId             = pAccount.UserId ;
            this.ErpNo              = pAccount.ErpNo ;
            this.UserValidDt        = pAccount.UserValidDt ;
            this.UserPwdValidDt     = pAccount.UserPwdValidDt ;
            this.UserPwdSct         = pAccount.UserPwdSct ;
            this.UserPhoto          = pAccount.UserPhoto ;
            this.Domain             = pAccount.Domain ;
            this.Name               = pAccount.Name ;
            this.EnglishName        = pAccount.EnglishName ;
            this.HanjaName          = pAccount.HanjaName ;
            this.BirtDay            = pAccount.BirtDay ;
            this.UserKind           = pAccount.UserKind ;
            this.UserKindName       = pAccount.UserKindName ;
            this.UserType           = pAccount.UserType ;
            this.UserTypeName       = pAccount.UserTypeName ;
            this.UserGubun          = pAccount.UserGubun ;
            this.UserGubunName      = pAccount.UserGubunName ;
            this.BizAreaCode        = pAccount.BizAreaCode ;
            this.BizAreaName        = pAccount.BizAreaName ;
            this.BizAreaEnglishName = pAccount.BizAreaEnglishName ;
            this.BizAreaTelNo       = pAccount.BizAreaTelNo ;
            this.BizAreaFaxNo       = pAccount.BizAreaFaxNo ;
            this.BizAreaMailAddress = pAccount.BizAreaMailAddress ;
            this.BizAreaZipCode     = pAccount.BizAreaZipCode ;
            this.BizAreaAddress     = pAccount.BizAreaAddress ;
            this.BizAreaEnglishAddress  = pAccount.BizAreaEnglishAddress ;
            this.PlantCode          = pAccount.PlantCode ;
            this.PlantName          = pAccount.PlantName ;
            this.DeptCode           = pAccount.DeptCode ;
            this.DeptName           = pAccount.DeptName ;
            this.DeptEnglishName    = pAccount.DeptEnglishName ;
            this.RolePstnCode       = pAccount.RolePstnCode ;
            this.RolePstnName       = pAccount.RolePstnName ;
            this.RolePstnEnglishName= pAccount.RolePstnEnglishName ;
            this.EntrDt             = pAccount.EntrDt ;
            this.MailAddress        = pAccount.MailAddress;
            this.ExternalMailAddress= pAccount.ExternalMailAddress ;
            this.ZipCode            = pAccount.ZipCode ;
            this.Address            = pAccount.Address ;
            this.TelNo              = pAccount.TelNo ;
            this.FaxNo              = pAccount.FaxNo ;
            this.EmergencyTelNo     = pAccount.EmergencyTelNo ;
            this.HandTelNo          = pAccount.HandTelNo ;
            this.AdminYn            = pAccount.AdminYn ;
            this.UseMailYn          = pAccount.UseMailYn ;
            this.AccountId          = pAccount.AccountId ;
            this.DomainId           = pAccount.DomainId ;
            this.DomainName         = pAccount.DomainName ;
            this.DomainSendName     = pAccount.DomainSendName ;
            this.AccountMaxSize     = pAccount.AccountMaxSize;

            if (pAccount.MailServerProvider != null) {
                this.MailServerProvider = pAccount.MailServerProvider;
            }
        }
         

        private void SetAccountInfo() {
            var strSql = new StringBuilder();
            strSql.AppendLine(" SELECT TOP(1) A.USR_ID, ");
            strSql.AppendLine("       A.ERP_NO, ");
            strSql.AppendLine("       A.USR_VALID_DT, ");
            strSql.AppendLine("       A.PWD_VALID_DT, ");
            strSql.AppendLine("       A.PWD_SCT, ");
            strSql.AppendLine("       A.PHOTO, ");
            strSql.AppendLine("       A.DOMAIN, ");
            strSql.AppendLine("       A.NAME, ");
            strSql.AppendLine("       A.ENG_NAME, ");
            strSql.AppendLine("       A.HANJA_NAME, ");
            strSql.AppendLine("       A.BIRT_DAY, ");
            strSql.AppendLine("       A.USR_KIND, ");
            strSql.AppendLine(string.Format("       A.USR_KIND_NM_{0} USR_KIND_NM, ", Lang));
            strSql.AppendLine("       A.USR_TYPE, ");
            strSql.AppendLine(string.Format("       A.USR_TYPE_NM_{0} USR_TYPE_NM, ", Lang));
            strSql.AppendLine("       A.USR_GUBUN, ");
            strSql.AppendLine(string.Format("       A.USR_GUBUN_NM_{0} USR_GUBUN_NM, ", Lang));
            strSql.AppendLine("       A.BIZ_AREA_CD, ");
            strSql.AppendLine("       A.BIZ_AREA_NM, ");
            strSql.AppendLine("       A.BIZ_AREA_ENG_NM, ");
            strSql.AppendLine("       A.BIZ_AREA_TEL_NO, ");
            strSql.AppendLine("       A.BIZ_AREA_FAX_NO, ");
            strSql.AppendLine("       A.BIZ_AREA_MAIL_ADDR, ");
            strSql.AppendLine("       A.BIZ_AREA_ZIP_CODE, ");
            strSql.AppendLine("       A.BIZ_AREA_ADDR, ");
            strSql.AppendLine("       A.BIZ_AREA_ENG_ADDR, ");
            strSql.AppendLine("       A.PLANT_CD, ");
            strSql.AppendLine("       A.PLANT_NM, ");
            strSql.AppendLine("       A.DEPT_CD, ");
            strSql.AppendLine("       A.DEPT_NM, ");
            strSql.AppendLine("       A.DEPT_ENG_NM, ");
            strSql.AppendLine("       A.ROLE_PSTN, ");
            strSql.AppendLine(string.Format("       A.ROLE_PSTN_NM_{0} ROLE_PSTN_NM, ", Lang));
            strSql.AppendLine("       A.ROLE_PSTN_ENG_NM, ");
            strSql.AppendLine("       A.ENTR_DT, ");
            strSql.AppendLine("       A.MAIL_ADDR, ");
            strSql.AppendLine("       A.EXT_MAIL_ADDR, ");
            strSql.AppendLine("       A.ZIP_CODE, ");
            strSql.AppendLine("       A.ADDR, ");
            strSql.AppendLine("       A.TEL_NO, ");
            strSql.AppendLine("       A.FAX_NO, ");
            strSql.AppendLine("       A.EM_TEL_NO, ");
            strSql.AppendLine("       A.HAND_TEL_NO, ");
            strSql.AppendLine("       A.ADMIN_YN, ");
            strSql.AppendLine("       A.USE_MAIL_YN, ");
            strSql.AppendLine("       B.ACCOUNTID, ");
            strSql.AppendLine("       B.DOMAINID, ");
            strSql.AppendLine("       B.DOMAINNAME, ");
            strSql.AppendLine("       B.DOMAINSENDNAME, ");
            strSql.AppendLine("       B.ACCOUNTMAXSIZE ");
            strSql.AppendLine(" FROM V_S_USR_MST A ");
            strSql.AppendLine(" LEFT JOIN V_MAIL_ACCOUNT B ON(A.USR_ID = B.USR_ID) ");
            strSql.AppendLine(string.Format("WHERE (A.USR_ID = {0}", Data.FilterVariable(UserId)));
            strSql.AppendLine(string.Format("OR A.ERP_NO = {0})", Data.FilterVariable(UserId)));

            var ds_usr_mst = DbAccess.ExecuteDataSet(strSql.ToString(), "V_S_USR_MST");
            var dr_usr_mst = ds_usr_mst.Tables["V_S_USR_MST"].Rows[0];

            UserId              = dr_usr_mst.Field<string>("USR_ID");
            ErpNo               = dr_usr_mst.Field<string>("ERP_NO");
            UserValidDt         = dr_usr_mst.Field<DateTime>("USR_VALID_DT");
            UserPwdValidDt      = dr_usr_mst.Field<DateTime>("PWD_VALID_DT");
            UserPwdSct          = dr_usr_mst.Field<string>("PWD_SCT");
            UserPhoto           = dr_usr_mst.Field<byte[]>("PHOTO");
            Domain              = dr_usr_mst.Field<string>("DOMAIN");
            Name                = dr_usr_mst.Field<string>("NAME");
            EnglishName         = dr_usr_mst.Field<string>("ENG_NAME");
            HanjaName           = dr_usr_mst.Field<string>("HANJA_NAME");
            BirtDay             = dr_usr_mst.Field<DateTime>("BIRT_DAY");
            UserKind            = dr_usr_mst.Field<string>("USR_KIND");
            UserKindName        = dr_usr_mst.Field<string>("USR_KIND_NM");
            UserType            = dr_usr_mst.Field<string>("USR_TYPE");
            UserTypeName        = dr_usr_mst.Field<string>("USR_TYPE_NM");
            UserGubun           = dr_usr_mst.Field<string>("USR_GUBUN");
            UserGubunName       = dr_usr_mst.Field<string>("USR_GUBUN_NM");
            BizAreaCode         = dr_usr_mst.Field<string>("BIZ_AREA_CD");
            BizAreaName         = dr_usr_mst.Field<string>("BIZ_AREA_NM");
            BizAreaEnglishName  = dr_usr_mst.Field<string>("BIZ_AREA_ENG_NM");
            BizAreaTelNo        = dr_usr_mst.Field<string>("BIZ_AREA_TEL_NO");
            BizAreaFaxNo        = dr_usr_mst.Field<string>("BIZ_AREA_FAX_NO");
            BizAreaMailAddress  = dr_usr_mst.Field<string>("BIZ_AREA_MAIL_ADDR");
            BizAreaZipCode      = dr_usr_mst.Field<string>("BIZ_AREA_ENG_ADDR");
            BizAreaAddress      = dr_usr_mst.Field<string>("BIZ_AREA_ZIP_CODE");
            BizAreaEnglishAddress = dr_usr_mst.Field<string>("BIZ_AREA_ADDR");
            PlantCode           = dr_usr_mst.Field<string>("PLANT_CD");
            PlantName           = dr_usr_mst.Field<string>("PLANT_NM");
            DeptCode            = dr_usr_mst.Field<string>("DEPT_CD");
            DeptName            = dr_usr_mst.Field<string>("DEPT_NM");
            DeptEnglishName     = dr_usr_mst.Field<string>("DEPT_ENG_NM");
            RolePstnCode        = dr_usr_mst.Field<string>("ROLE_PSTN");
            RolePstnName        = dr_usr_mst.Field<string>("ROLE_PSTN_NM");
            RolePstnEnglishName = dr_usr_mst.Field<string>("ROLE_PSTN_ENG_NM");
            EntrDt              = dr_usr_mst.Field<DateTime>("ENTR_DT");
            MailAddress         = dr_usr_mst.Field<string>("MAIL_ADDR");
            ExternalMailAddress = dr_usr_mst.Field<string>("EXT_MAIL_ADDR");
            ZipCode             = dr_usr_mst.Field<string>("ZIP_CODE");
            Address             = dr_usr_mst.Field<string>("ADDR");
            TelNo               = dr_usr_mst.Field<string>("TEL_NO");
            FaxNo               = dr_usr_mst.Field<string>("FAX_NO");
            EmergencyTelNo      = dr_usr_mst.Field<string>("EM_TEL_NO");
            HandTelNo           = dr_usr_mst.Field<string>("HAND_TEL_NO");
            if (dr_usr_mst.Field<string>("ADMIN_YN") == "Y") {
                AdminYn = UseYN.Y;
            } else {
                AdminYn = UseYN.N;
            }
            if (dr_usr_mst.Field<string>("USE_MAIL_YN") == "Y") {
                UseMailYn = UseYN.Y;
            } else {
                UseMailYn = UseYN.N;
            }
            AccountId           = dr_usr_mst.Field<int>("ACCOUNTID");
            DomainId            = dr_usr_mst.Field<int>("DOMAINID");
            DomainName          = dr_usr_mst.Field<string>("DOMAINNAME");
            DomainSendName      = dr_usr_mst.Field<string>("DOMAINSENDNAME");
            AccountMaxSize      = dr_usr_mst.Field<int>("ACCOUNTMAXSIZE");


            //UserId 
            //ErpNo 
            //UserValidDt 
            //UserPwdValidDt 
            //UserPwdSct 
            //UserPhoto 
            //Domain 
            //Name 
            //EnglishName 
            //HanjaName 
            //BirtDay 
            //UserKind 
            //UserKindName 
            //UserType 
            //UserTypeName 
            //UserGubun 
            //UserGubunName 
            //BizAreaCode 
            //BizAreaName 
            //BizAreaEnglishName 
            //BizAreaTelNo 
            //BizAreaFaxNo 
            //BizAreaMailAddress 
            //BizAreaZipCode 
            //BizAreaAddress 
            //BizAreaEnglishAddress 
            //PlantCode 
            //PlantName 
            //DeptCode 
            //DeptName 
            //DeptEnglishName 
            //RolePstnCode 
            //RolePstnName 
            //RolePstnEnglishName 
            //EntrDt 
            //MailAddress
            //ExternalMailAddress 
            //ZipCode 
            //Address 
            //TelNo 
            //FaxNo 
            //EmergencyTelNo 
            //HandTelNo 
            //AdminYn 
            //UseMailYn 
            //AccountId 
            //DomainId 
            //DomainName 
            //DomainSendName 
        }
        private void CreateRoleMNU() {
            var strSql = new StringBuilder();
            strSql.AppendLine("SELECT	MENU_ID,");
            strSql.AppendLine("		PARENT_MENU_ID,");
            strSql.AppendLine(string.Format("		MENU_NM_{0} MENU_NM,", Lang));
            strSql.AppendLine(string.Format("		MENU_DES_{0} MENU_DES,", Lang));
            strSql.AppendLine("		MENU_GROUP,");
            strSql.AppendLine("		MENU_GROUP_NM,");
            strSql.AppendLine("		MENU_TYPE,");
            strSql.AppendLine("		MENU_LVL,");
            strSql.AppendLine("		MENU_SEQ,");
            strSql.AppendLine("		ROUTE_URL");
            strSql.AppendLine("FROM V_S_USR_MNU_MST");
            strSql.AppendLine(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(UserId)));
            strSql.AppendLine("ORDER BY PARENT_MENU_ID, MENU_SEQ");

            var ds_usr_mnu_mst = DbAccess.ExecuteDataSet(strSql.ToString(), "V_S_USR_MNU_MST");
            var dt_usr_mnu_mst = ds_usr_mnu_mst.Tables["V_S_USR_MNU_MST"];

            if (dt_usr_mnu_mst.Rows.Count <= 0) {
                throw new ExceptionManager(110011, DbAccess.GetMessage(110011, Lang));
            }

            foreach (DataRow dRow in dt_usr_mnu_mst.Rows) {
                RoleMNUs.Add(new AccountMNU(
                    dRow.Field<string>("MENU_ID"),
                    dRow.Field<string>("PARENT_MENU_ID"),
                    dRow.Field<string>("MENU_NM"),
                    dRow.Field<string>("MENU_DES"),
                    dRow.Field<string>("MENU_GROUP"),
                    dRow.Field<string>("MENU_GROUP_NM"),
                    dRow.Field<string>("MENU_TYPE"),
                    dRow.Field<int>("MENU_LVL"),
                    dRow.Field<string>("MENU_SEQ"),
                    dRow.Field<string>("ROUTE_URL")));
            }
        }

        public AccountMNUs GetGroupMenus(string strGroupName) {
            if (RoleMNUs.Count >= 0) {
                var customMenus = new AccountMNUs();
                
                foreach (AccountMNU menu in RoleMNUs) {
                    if (menu.MenuGroup.ToLower() == strGroupName.ToLower() && menu.MenuLvl == 0) {
                        customMenus.Add(menu);
                    }
                }
                return customMenus;
            } else {
                return RoleMNUs;
            }
        }

        /// <summary>
        /// 부모 메뉴 아이디로 하위 메뉴 컬랙션을 가져옵니다.
        /// </summary>
        /// <param name="pStrMenuId">부모 메뉴 아이디</param>
        /// <param name="pIntLvl">메뉴 레벨</param>
        /// <returns>메뉴 컬랙션</returns>
        public AccountMNUs GetSubMenus(string pStrMenuId, int pIntLvl) {
            if (RoleMNUs.Count >= 0) {
                var customMenus = new AccountMNUs();

                foreach (AccountMNU menu in RoleMNUs) {
                    if (menu.ParentMenuId == pStrMenuId && menu.MenuLvl == pIntLvl) {
                        customMenus.Add(menu);
                    }
                }
                return customMenus;
            } else {
                return RoleMNUs;
            }
        }

        /// <summary>
        /// 자식 메뉴 아이디로 상위 메뉴를 가져옵니다.
        /// </summary>
        /// <param name="pStrMenuId">자식 메뉴 아이디</param>
        /// <param name="pIntLvl">메뉴 레벨</param>
        /// <returns>메뉴 컬랙션</returns>
        public AccountMNU GetParentMenu(string pStrMenuId) {
            if (RoleMNUs.Count >= 0) {
                var subMenu = default(AccountMNU);
                foreach (AccountMNU menu in RoleMNUs) {
                    if (menu.MenuId == pStrMenuId) {
                        subMenu = menu;
                        continue;
                    }
                }

                foreach (AccountMNU menu in RoleMNUs) {
                    if (menu.MenuId == subMenu.ParentMenuId) {
                        return menu;
                    }
                }

                return null;
            } else {
                return null;
            }
        }

        /// <summary>
        /// 사용자의 타입별 파일 경로를 가져옵니다.
        /// </summary>
        /// <param name="pPathKind">패스 종류</param>
        /// <param name="pPathFormatter">경로 유형</param>
        /// <returns>경로</returns>
        public string GetAttachFilePath(PathKind pPathKing, PathFormatter pPathFormatter) {
            return Global.gDirectorys.GetSpecialDirectory(pPathKing, pPathFormatter, PathType.Attach, UserId, true);
        }
        /// <summary>
        /// 사용자의 타입별 파일 경로를 가져옵니다.
        /// </summary>
        /// <param name="pPathKind">패스 종류</param>
        /// <param name="pPathType">패스 타입</param>
        /// <param name="pPathFormatter">경로 유형</param>
        /// <returns>경로</returns>
        public string GetAttachFilePath(PathKind pPathKing, PathType pPathType, PathFormatter pPathFormatter) {
            if (pPathKing == PathKind.Board) {
            } else {
            }
            return Global.gDirectorys.GetSpecialDirectory(pPathKing, pPathFormatter, pPathType, UserId, false);
        }
        /// <summary>
        /// 사용자의 타입별 파일 경로를 가져옵니다.
        /// </summary>
        /// <param name="pPathKind">패스 종류</param>
        /// <param name="pPathType">패스 타입</param>
        /// <param name="pPathFormatter">경로 유형</param>
        /// <param name="pIsRoot">사용자 계정의 Root경로 만 반환할지 여부</param>
        /// <returns>경로</returns>
        public string GetAttachFilePath(PathKind pPathKing, PathType pPathType, PathFormatter pPathFormatter, bool pIsRoot) {
            return Global.gDirectorys.GetSpecialDirectory(pPathKing, pPathFormatter, pPathType, UserId, pIsRoot);
        }

        public string GetMailACTDirectory(PathType pPathType, PathFormatter pPathFormatter) {
            return GetMailACTDirectory(pPathType, pPathFormatter, false);
        }
        public string GetMailACTDirectory(PathType pPathType, PathFormatter pPathFormatter, bool bRoot) {
            return Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, pPathFormatter, pPathType, UserId, bRoot);
        }
        public string GetNoteACTDirectory(PathType pPathType, PathFormatter pPathFormatter) {
            return GetNoteACTDirectory(pPathType, pPathFormatter, false);
        }
        public string GetNoteACTDirectory(PathType pPathType, PathFormatter pPathFormatter, bool bRoot) {
            return Global.gDirectorys.GetSpecialDirectory(PathKind.Note, pPathFormatter, pPathType, UserId, bRoot);
        }
        public string GetBoardACTDirectory(PathType pPathType, PathFormatter pPathFormatter, string sCategoryCd) {
            return GetBoardACTDirectory(pPathType, pPathFormatter, sCategoryCd, false);
        }

        public string GetBoardACTDirectory(PathType pPathType, PathFormatter pPathFormatter, string sCategoryCd, bool bRoot) {
            //return GetWebBoardAccountDirectory(pPathType, pPathFormatter, sCategoryCd, DeptCode, bRoot);
            return GetBoardACTDirectory(pPathType, pPathFormatter, sCategoryCd, string.Empty, bRoot);
        }

        public string GetBoardACTDirectory(PathType pPathType, PathFormatter pPathFormatter, string sCategoryCd, string sDeptCode) {
            return GetBoardACTDirectory(pPathType, pPathFormatter, sCategoryCd, sDeptCode, false);
        }

        public string GetBoardACTDirectory(PathType pPathType, PathFormatter pPathFormatter, string sCategoryCd, string sDeptCode, bool bRoot) {
            if (string.IsNullOrWhiteSpace(sCategoryCd)) {
                throw new ExceptionManager("게시판 코드는 공백일수 없습니다.");
            }

            if (string.IsNullOrWhiteSpace(sDeptCode)) {
                sDeptCode = this.DeptCode;
            }

            if (pPathType == PathType.Image || pPathType == PathType.Thumb) {
                if (sCategoryCd.ToLower() == "bbs_dept") {
                    return Global.gDirectorys.GetSpecialDirectory(PathKind.Board, pPathFormatter, pPathType, UserId + "\\" + sDeptCode, bRoot);
                } else {
                    return Global.gDirectorys.GetSpecialDirectory(PathKind.Board, pPathFormatter, pPathType, UserId + "\\" + sCategoryCd, bRoot);
                }
            } else {
                if (sCategoryCd.ToLower() == "bbs_dept") {
                    return Global.gDirectorys.GetSpecialDirectory(PathKind.Board, pPathFormatter, pPathType, sDeptCode, bRoot);
                } else {
                    return Global.gDirectorys.GetSpecialDirectory(PathKind.Board, pPathFormatter, pPathType, sCategoryCd, bRoot);
                }
            }
        }
        public string GetWebHardACTDirectory(PathType pPathType, PathFormatter pPathFormatter) {
            return Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, pPathFormatter, pPathType, UserId, false);
        }
        public string GetWebHardACTDirectory(PathType pPathType, PathFormatter pPathFormatter, bool bRoot) {
            return Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, pPathFormatter, pPathType, UserId, bRoot);
        }
    }
}