
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
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
    [DebuggerDisplay("={}")]
    public partial class ucMail : UserControl {

        public DataTable DataSource {
            set {
                var dtMessages = value as tdsData.V_MAIL_MESSAGESDataTable;

                if (dtMessages != null && dtMessages.Rows.Count > 0) {
                    var messages = from msgs in dtMessages
                                   where msgs.MESSAGEFOLDERNAME != "보낸 편지함" && msgs.MESSAGEFOLDERNAME != "임시 보관함" && msgs.MESSAGEFOLDERNAME != "지운 편지함" && msgs.MESSAGEFOLDERNAME != "예약 발송함"
                                    orderby msgs.MESSAGEDATE descending
                                    select msgs;
                    if (messages.Count() > 0) {
                        rtAllboxMailList.DataSource = messages.Take(20).CopyToDataTable();
                    }

                    messages = from msgs in dtMessages
                                    where msgs.MESSAGEFOLDERNAME == "받은 편지함"
                                    orderby msgs.MESSAGEDATE descending
                                    select msgs;
                    if (messages.Count() > 0) {
                        rtInboxMailList.DataSource = messages.Take(20).CopyToDataTable();
                    }
                }

                rtAllboxMailList.DataBind();
                rtInboxMailList.DataBind();
            }
        }
        protected void rtAllboxMailList_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            if (e.Item.ItemType == ListItemType.Footer) {
                if (rtAllboxMailList.Items.Count <= 0) {
                    var boardFooterContainer = e.Item.FindControl("rtAllboxMailListFooterContainer") as HtmlTable;
                    if (boardFooterContainer != null) {
                        boardFooterContainer.Visible = true;
                    }
                }
            }
        }

        protected void rtInboxMailList_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            if (e.Item.ItemType == ListItemType.Footer) {
                if (rtInboxMailList.Items.Count <= 0) {
                    var boardFooterContainer = e.Item.FindControl("rtInboxMailListFooterContainer") as HtmlTable;
                    if (boardFooterContainer != null) {
                        boardFooterContainer.Visible = true;
                    }
                }
            }
        }
    }
}
