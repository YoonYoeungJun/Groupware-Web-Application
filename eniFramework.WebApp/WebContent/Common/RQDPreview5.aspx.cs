using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using RQINTERFACELib;

namespace eniFramework.WebApp.Common {
    public partial class RQDPreview5 : Page {
        protected void Page_Load(object sender, EventArgs e) {
            var strTitle = Server.UrlDecode(Request.QueryString["t"]);
            var strDoc = Server.UrlDecode(Request.QueryString["doc"]);

            if (string.IsNullOrWhiteSpace(strTitle)) {
                if (string.IsNullOrWhiteSpace(strDoc)) {
                    this.Title = "RQView - " + GetGlobalResource("QuickName");
                } else {
                    this.Title = string.Format("RQView [{0}] - {1}", strDoc.ToUpper(), GetGlobalResource("QuickName"));
                }
            } else {
                if (string.IsNullOrWhiteSpace(strDoc)) {
                    this.Title = string.Format("{0} - {1}", strTitle, GetGlobalResource("QuickName"));
                } else {
                    this.Title = string.Format("{0} [{1}] - {2}", strTitle, strDoc.ToUpper(), GetGlobalResource("QuickName"));
                }
            }

            this.Header.Controls.Add(new LiteralControl("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>"));

            var direction = Request.QueryString["d"];

            this.Body.Attributes["style"] = "width:100%; height:100%; padding:0px; margin:0px; overflow-x:hidden;";
        }

        public string GetSource() {
            var strDoc = Server.UrlDecode(Request.QueryString["doc"]);
            var strRunVar = Server.UrlDecode(Request.QueryString["runvar"]);
            var strDocType = Request.QueryString["doctype"];
            if (string.IsNullOrWhiteSpace(strDocType)) {
                strDocType = "rqd";
            }
            var strDbName = Request.QueryString["dbname"];
            if (string.IsNullOrWhiteSpace(strDbName)) {
                strDbName = Global.gEnvironmonts.DbName;
            }
            var strLang = Request.QueryString["lang"];
            if (string.IsNullOrWhiteSpace(strLang)) {
                strLang = "ko";
            }
            var strDocMode = Request.QueryString["m"];
            if (string.IsNullOrWhiteSpace(strDocMode)) {
                strDocMode = "v";
            }

            var strRet = string.Empty;
            var strErrMsg = string.Empty;

            var strDocPath = string.Format("/reports/{0}/{1}/{2}.{3}", strLang.ToLower(), strDbName.ToLower(), strDoc.ToLower(), strDocType.ToLower());

            IRQConnect objRQC = new RQConnect();
            objRQC.bstrUser = Global.gEnvironmonts.EBId;
            objRQC.bstrPassword = Global.gEnvironmonts.EBPw;
            objRQC.bstrDoc = strDocPath;
            objRQC.bstrRunVar = strRunVar;
            
            var ret = objRQC.bExecutable;

            if (ret == 1) {
                objRQC.bstrIP = Global.gEnvironmonts.EBServerIP;
                objRQC.bstrServerIP = Global.gEnvironmonts.EBServerIP;
                objRQC.bstrServerPORT = Global.gEnvironmonts.EBServerPort.ToString();
                objRQC.bstrForm = "ACTIVEX";

                try {
                    if (strDocMode.ToLower() == "v") {
                        strRet = objRQC.View();
                    } else {
                        objRQC.Run();
                        strRet = objRQC.Print();
                    }
                } catch (System.Exception ex) {
                    strErrMsg = ex.Message;
                }
            } else {
                strErrMsg = "Permission to run document is denied.";
            }

            if (strRet == "") {
                return strErrMsg;
            } else {
                return strRet;
            }
        }

        protected string GetGlobalResource(string strKey) {
            return GetResource("Global", strKey);
        }
        protected string GetResource(string strKey) {
            var thisType = this.GetType();

            return GetResource(thisType.Name.Replace("_aspx", ""), strKey);
        }
        protected string GetResource(string strClassName, string strKey) {
            try {
                var gRObj = GetGlobalResourceObject(strClassName, strKey);
                if (gRObj != null) {
                    return gRObj.ToString();
                } else {
                    return string.Empty;
                }
            } catch {
                return string.Empty;
            }
        }
    }
}