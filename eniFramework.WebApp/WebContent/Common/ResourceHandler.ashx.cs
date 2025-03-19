using System;
using System.Web;
using System.Net;

using IO = System.IO;

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// ResourceHandler의 요약 설명입니다.
    /// </summary>
    public class ResourceHandler : IHttpHandler {
        private HttpRequest Request = null;
        private HttpResponse Response = null;
        private HttpServerUtility Server = null;


        public void ProcessRequest(HttpContext context) {
            Request = context.Request;
            Response = context.Response;
            Server = context.Server;

            var strUrl = Request.QueryString["src"];
            var strPath = Server.MapPath(strUrl);
            var oFileInfo = new IO.FileInfo(strPath);
            var strFileEx = oFileInfo.Extension;
            Response.ContentType = GetResourceType(oFileInfo);
            if (oFileInfo.Exists) {
                Response.BinaryWrite(IO.File.ReadAllBytes(strPath));
            }




            //string sResourceUrl = string.Empty;

            //sResourceUrl = context.Request.QueryString["sUrl"] ?? string.Empty;

            //if (string.IsNullOrWhiteSpace(sResourceUrl)) {
            //    return;
            //}

            //using (var wc = GetWebClient_()) {
            //    context.Response.ContentType = wc.Headers[HttpRequestHeader.ContentType];
            //    context.Response.BinaryWrite(wc.DownloadData(sResourceUrl));
            //}
        }

        private string GetResourceType(IO.FileInfo oFileInfo) {
            string strMimeType = string.Empty;

            switch (oFileInfo.Extension.ToLower()) {
                case "jpg": case ".jpg":
                    strMimeType = "image/jpeg";
                    break;
                case "png": case ".png":
                    strMimeType = "image/png";
                    break;
                case "gif": case ".gif":
                    strMimeType = "image/gif";
                    break;
            }

            return strMimeType;
        }

        private byte[] GetRemoteResourceBytes_(string sUrl) {
            byte[] resBytes = null;

            using (var wc = GetWebClient_()) {
                resBytes = wc.DownloadData(sUrl);
            }

            return resBytes;
        }

        private WebClient GetWebClient_() {
            // Accept: */*
            //Accept-Language: ko-KR
            //User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; .NET4.0C; .NET4.0E; InfoPath.2; InfoPath.3)
            //Accept-Encoding: gzip, deflate
            // */
            var wc = new WebClient();
            wc.Headers[HttpRequestHeader.Accept] = "*/*";
            wc.Headers[HttpRequestHeader.AcceptLanguage] = "ko-KR";
            wc.Headers[HttpRequestHeader.UserAgent] = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; .NET4.0C; .NET4.0E; InfoPath.2; InfoPath.3)";
            wc.Headers[HttpRequestHeader.AcceptEncoding] = "gzip, deflate";

            return wc;
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}