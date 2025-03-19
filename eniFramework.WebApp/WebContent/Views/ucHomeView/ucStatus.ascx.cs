
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

using hMailServerService;
#endregion

namespace eniFramework.WebApp.Views.ucHomeView {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("PopMsgBox={PopMsgBox}, LblBox={LblBox}, BtnOk={BtnOk}")]
    public partial class ucStatus : UserControl {

        public string OwnerZoneUID {
            get {
                return this.dpStatus.OwnerZoneUID;
            }
            set {
                this.dpStatus.OwnerZoneUID = value;
            }
        }

        public string ClientInstanceName {
            get {
                return this.dpStatus.ClientInstanceName;
            }
            set {
                this.dpStatus.ClientInstanceName = value;
            }
        }

        public Unit Height {
            get {
                return this.dpStatus.Height;
            }
            set {
                this.dpStatus.Height = value;
            }
        }

        public Unit Width {
            get {
                return this.dpStatus.Width;
            }
            set {
                this.dpStatus.Width = value;
            }
        }

        public int VisibleIndex {
            get {
                return this.dpStatus.VisibleIndex;
            }
            set {
                this.dpStatus.VisibleIndex = value;
            }
        }

        public bool ShowHeader {
            get {
                return this.dpStatus.ShowHeader;
            }
            set {
                this.dpStatus.ShowHeader = value;
            }
        }

        public void SetUser(Account oAccount) {
            if (oAccount.UserPhoto != null) {
                eniBIUserPhoto.Value = Utilities.EncodeBinaryImageToByte(oAccount.UserPhoto);
            }
            eniLblUserName.Text = oAccount.Name;
            eniLblRolePstnName.Text = oAccount.RolePstnName;
            eniLblBizAreaName.Text = oAccount.BizAreaName;
            eniLblPlantName.Text = oAccount.PlantName;
            eniLblDeptName.Text = oAccount.DeptName;


            var imapFolders = oAccount.MailServerProvider.GetIMAPFoldersDetail();

            foreach (tdsData.V_MAIL_IMAPFOLDERS_DETAILRow row in imapFolders) {
                switch (row.FOLDERNAME) {
                    case "받은 편지함":
                        lblInbox.Text = row.FOLDERNAME;
                        lblInboxUnSeenCnt.Text = row.UNSEEN.ToString();
                        break;
                    case "내게쓴 편지함":
                        lblMy.Text = row.FOLDERNAME;
                        lblMyUnSeenCnt.Text = row.UNSEEN.ToString();
                        break;
                    case "보낸 편지함":
                        lblSendBox.Text = row.FOLDERNAME;
                        lblSendBoxUnSeenCnt.Text = row.UNSEEN.ToString();
                        break;
                    case "장기 보관함":
                        lblOldBox.Text = row.FOLDERNAME;
                        lblOldBoxUnSeenCnt.Text = row.UNSEEN.ToString();
                        break;
                    
                }
            }
        }
    }
}
