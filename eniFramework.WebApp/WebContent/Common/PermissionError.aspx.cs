using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using eniFramework.WebApp.Common;
using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

namespace eniFramework.WebApp.Common {
    public partial class PermissionError : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

            //Global Error 이벤트 발생후 발생된다.

            var exceptionCollection = Session[CommonResource.SessionErrorCollection] as ExceptionCollection;
            var exception = Session[CommonResource.SessionLastError] as System.Exception;
            var exceptionPath = Request.QueryString["aspxerrorpath"];

            Session.Remove(CommonResource.SessionLastError);
            Session.Remove(CommonResource.SessionErrorCollection);

            if (exception != null) {
                ErrorReport.Controls.Add(new LiteralControl(exception.Message));
            } else {
                ErrorReport.Controls.Add(new LiteralControl("네트워크 또는 서버에 문제가 발생하여 페이지를 표시할수 없습니다."));
            }
        }
    }
}