﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eniFramework.WebApp {
    public partial class test2 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //System.Diagnostics.Process.Start("script.vb");
            Session["a"] = "asdf";
            Response.Cookies.Add(new HttpCookie("test", "a"));

            //Request.Cookies.Get("ckDomain").Value,
        }
    }
}