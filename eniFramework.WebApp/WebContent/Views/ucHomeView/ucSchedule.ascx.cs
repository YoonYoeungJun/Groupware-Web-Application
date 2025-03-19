
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
    public partial class ucSchedule : BaseUIACTControl {

        public string OwnerZoneUID {
            get {
                return this.dpSchedule.OwnerZoneUID;
            }
            set {
                this.dpSchedule.OwnerZoneUID = value;
            }
        }

        public string ClientInstanceName {
            get {
                return this.dpSchedule.ClientInstanceName;
            }
            set {
                this.dpSchedule.ClientInstanceName = value;
            }
        }

        public Unit Height {
            get {
                return this.dpSchedule.Height;
            }
            set {
                this.dpSchedule.Height = value;
            }
        }

        public Unit Width {
            get {
                return this.dpSchedule.Width;
            }
            set {
                this.dpSchedule.Width = value;
            }
        }

        public int VisibleIndex {
            get {
                return this.dpSchedule.VisibleIndex;
            }
            set {
                this.dpSchedule.VisibleIndex = value;
            }
        }

        public bool ShowHeader {
            get {
                return this.dpSchedule.ShowHeader;
            }
            set {
                this.dpSchedule.ShowHeader = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e) {
            
        }
    }
}
