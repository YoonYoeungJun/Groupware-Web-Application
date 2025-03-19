using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// MailReceved의 요약 설명입니다.
    /// </summary>
    public class ConfirmMessage : IHttpHandler {

        public void ProcessRequest(HttpContext context) {
            try {
                var mid = context.Request.QueryString["mid"];
                var recipientID = context.Request.QueryString["rcptid"];

                if (string.IsNullOrWhiteSpace(mid) == false && string.IsNullOrWhiteSpace(recipientID) == false) {
                    var dbAccess = (DatabaseAccess)Global.gDbAccess;
                    var strSql = new StringBuilder();
               
                    strSql = new StringBuilder();
                    strSql.AppendLine(" UPDATE A SET ");
                    strSql.AppendLine(string.Format(" A.RECIPIENTDATE = {0} ", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                    strSql.AppendLine(" FROM hMailServer..HM_MESSAGE_RECIPIENTS_CHECK A ");
                    strSql.AppendLine(string.Format(" WHERE A.MESSAGEID = {0}", Data.FilterVariable(mid)));
                    strSql.AppendLine(string.Format(" AND A.RECIPIENTID = {0}", Data.FilterVariable(recipientID)));
                    strSql.AppendLine(" AND A.RECIPIENTDATE IS NULL ");

                    var executeRowCount = dbAccess.ExecuteNonQuery(strSql.ToString());

                    context.Response.ContentType = "image/png";
                    context.Response.WriteFile("~/Contents/Images/Common/blank.png");
                    context.Response.End();
                }
            }catch (System.Exception ex) {
                new ExceptionManager(ex);
            }
        }

        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}