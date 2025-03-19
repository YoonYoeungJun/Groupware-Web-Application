using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Drawing;
using System.Reflection;
using System.Net.Mail;
using System.Collections;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;

namespace eniFramework.WebApp.Common.Popup {
    public partial class LoadingBox : UserControl {
        string _clientInstanceName = "popLoadingBox";
        [Bindable(true)]
        [Category("eniFramework")]
        [DefaultValue("")]
        public new string ID { get; set; }
        [Bindable(true)]
        [Category("eniFramework")]
        [DefaultValue("")]
        public string ClientInstanceName { 
            get {
                return _clientInstanceName;
            }
            set {
                if(string.IsNullOrWhiteSpace(_clientInstanceName) == false) {
                    _clientInstanceName = value;
                }
            }
        }
        public LoadingBox() {
        }

        protected void Page_Load(object sender, EventArgs e) {
        }
    }
}