using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Reflection;
using System.Collections.Specialized;
using System.Web.SessionState;
using System.Web.Security;
using System.Data.SqlClient;
using System.Threading;
using System.Globalization;

using eniFramework.Json;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.Security;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.JsonArgs;

namespace eniFramework.WebApp.Core {
    public class BaseHTTPHandler : IHttpHandler, IRequiresSessionState {
        protected HttpContext lgContext { get; private set; }
        protected HttpSessionState lgSession { get; private set; }
        protected HttpRequest lgRequest { get; private set; }
        protected HttpResponse lgResponse { get; private set; }
        protected HttpServerUtility lgServer { get; private set; }
        protected string lgLang { get; private set; }
        protected CultureInfo lgCulture { get; private set; }
        protected string lgContentType { get; private set; }
        protected NameValueCollection lgQueryString { get; private set; }
        protected DatabaseAccess lgDbAccess = new DatabaseAccess();
        public bool IsReusable { get { return false; } }
        public void ProcessRequest(HttpContext context) {
            lgDbAccess.SetApplicationName("BaseHTTPHandler");

            lgContext       = context;
            lgSession       = lgContext.Session;
            lgRequest       = lgContext.Request;
            lgResponse      = lgContext.Response;
            lgServer        = lgContext.Server;
            lgLang          = Utilities.GetLang(context);
            lgCulture       = EnumDef.ConvertLangToCultureInfo(lgLang);
            lgContentType   = lgRequest.ContentType.ToLower();

            System.Threading.Thread.CurrentThread.CurrentCulture = lgCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = lgCulture;

            //Post 전송일 경우
            if (lgContext.Request.HttpMethod.ToLower() == "post") {
                var readByte = lgContext.Request.BinaryRead(lgContext.Request.TotalBytes);
                string postParams = lgContext.Request.ContentEncoding.GetString(readByte);

                //Json 형태의 데이터 파싱
                if (lgContentType.ToLower().IndexOf("json") > 0) {
                    var reqArgs = JsonConvert.DeserializeObject<RequestArgs>(postParams);
                    lgQueryString = new NameValueCollection();
                    lgQueryString.Add("cmd", reqArgs.Cmd);
                    lgQueryString.Add("mode", reqArgs.Mode);
                    if (reqArgs.Data != null) {
                        lgQueryString.Add("data", reqArgs.Data.ToString());
                    }
                } else {
                    lgQueryString = HttpUtility.ParseQueryString(postParams);
                }
            } else {
                lgQueryString = lgContext.Request.QueryString;
            }

            lgDbAccess.Connect();
            lgDbAccess.ExecuteNonQuery(string.Format("SET LANGUAGE {0} ", Data.FilterVariable(EnumDef.ConvertLangToMsSqlLang(lgLang))));

            try {
                this.HTTPRequest();
            } catch (System.Threading.ThreadAbortException ex) {
                throw ex;
            } catch (System.Exception ex) {
                throw new ExceptionManager(ex);
            } finally {
                if (lgDbAccess.Connection.State == ConnectionState.Open) {
                    lgDbAccess.DisConnect();
                }
            }
        }

        protected void ResponseWrite(object oSendObject) {
            ResponseWrite(oSendObject, true);
        }

        protected void ResponseWrite(object oSendObject, bool pEndRequest) {
            lgResponse.ContentType = "application/json";
            lgResponse.Write(JsonConvert.SerializeObject(oSendObject));

            if (pEndRequest) {
                lgResponse.Flush();
                lgResponse.End();
            }
        }

        protected string GetGlobalResource(string strKey) {
            return Resources.Global.ResourceManager.GetString(strKey, EnumDef.ConvertLangToCultureInfo(lgLang));
        }

        protected virtual void HTTPRequest() { }
    }
}