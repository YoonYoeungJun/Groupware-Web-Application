using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Protocols;

namespace eniFramework.WebApp.WS.Security {
    public class WSAuthentication : SoapHeader {
        public string User;
        public string Password;
    }
}