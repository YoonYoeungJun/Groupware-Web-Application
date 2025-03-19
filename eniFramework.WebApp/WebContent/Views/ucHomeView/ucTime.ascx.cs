
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Drawing;
using System.Drawing.Imaging;

using DevExpress.Web;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Variables.Menu;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.ACT;

#endregion

namespace eniFramework.WebApp.Views.ucHomeView {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("PopMsgBox={PopMsgBox}, LblBox={LblBox}, BtnOk={BtnOk}")]
    public partial class ucTime : UserControl {
        public string OwnerZoneUID {
            get {
                return this.dpTime.OwnerZoneUID;
            }
            set {
                this.dpTime.OwnerZoneUID = value;
            }
        }

        public string ClientInstanceName {
            get {
                return this.dpTime.ClientInstanceName;
            }
            set {
                this.dpTime.ClientInstanceName = value;
            }
        }

        public Unit Height {
            get {
                return this.dpTime.Height;
            }
            set {
                this.dpTime.Height = value;
            }
        }

        public Unit Width {
            get {
                return this.dpTime.Width;
            }
            set {
                this.dpTime.Width = value;
            }
        }

        public int VisibleIndex {
            get {
                return this.dpTime.VisibleIndex;
            }
            set {
                this.dpTime.VisibleIndex = value;
            }
        }

        public bool ShowHeader {
            get {
                return this.dpTime.ShowHeader;
            }
            set {
                this.dpTime.ShowHeader = value;
            }
        }



        protected void Page_Load(object sender, EventArgs e) {
            lblDate.Text = DateTime.Now.ToLongDateString();
        }
    }
}
