
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

#endregion

namespace eniFramework.WebApp.Views.ucHomeView {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("={}")]
    public partial class ucBoard : UserControl {

        public DataTable DataSource {
            get {
                return ucBoardList.DataSource as DataTable;
            }
            set {
                ucBoardList.DataSource = value;
                ucBoardList.DataBind();
            }
        }

        protected void ucBoardList_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            if (e.Item.ItemType == ListItemType.Footer) {
                if (ucBoardList.Items.Count <= 0) {
                    var boardFooterContainer = e.Item.FindControl("ucBoardListFooterContainer") as HtmlTable;
                    if (boardFooterContainer != null) {
                        boardFooterContainer.Visible = true;
                    }
                }
            }

            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            //    var dRowV = e.Item.DataItem as DataRowView;

            //    if (dRowV == null) return;

            //    var dBoardRow = dRowV.Row as tdsHome.UFN_TB_BOARD_LISTRow;

            //    if (dBoardRow == null) return;

            //    var boardContainer = e.Item.FindControl("ucBoardListContainer") as HtmlTable;
            //    var boardUserContainer = e.Item.FindControl("ucBoardListUserContainer") as HtmlTable;

            //    var enilblBox = e.Item.FindControl("eniLblSubject") as eniLabel;
            //    if (enilblBox != null) {
            //        if (dBoardRow.IsSUBJECTNull() == false) {
            //            enilblBox.Text = dBoardRow.SUBJECT;

            //            boardContainer.Attributes["onclick"] = string.Format("eni.RunPageFrame('/BoardView/{0}?no={1}', ViewType.ModuleView)", _category_CD, dBoardRow.NO);
            //            boardContainer.Attributes["title"] = dBoardRow.SUBJECT;
            //        }
            //    }
            //    enilblBox = e.Item.FindControl("eniLblDate") as eniLabel;
            //    if (enilblBox != null) {
            //        if (dBoardRow.IsDATENull() == false) {
            //            if (dBoardRow.DATE.ToShortDateString() == DateTime.Now.ToShortDateString()) {
            //                enilblBox.Text = dBoardRow.DATE.ToString("HH시 mm분 ss초");
            //            } else {
            //                enilblBox.Text = dBoardRow.DATE.ToString("yyyy년 MM월 dd일 (ddd) HH시 mm분 ss초");
            //            }
            //        }
            //    }
            //    var bimg = e.Item.FindControl("eniBIUserPhoto") as eniBinaryImage;
            //    if (bimg != null) {
            //        if (dBoardRow.IsWRITE_USER_PHOTONull() == false) {
            //            bimg.Value = dBoardRow.WRITE_USER_PHOTO;
            //        }
            //    }
            //    var lblBox = e.Item.FindControl("eniLblPlantName") as Label;
            //    if (lblBox != null) {
            //        if (dBoardRow.IsWRITE_USER_PLANT_NMNull() == false) {
            //            lblBox.Text = dBoardRow.WRITE_USER_PLANT_NM;
            //        }
            //    }
            //    lblBox = e.Item.FindControl("eniLblDeptName") as Label;
            //    if (lblBox != null) {
            //        if (dBoardRow.IsWRITE_USER_DEPT_NMNull() == false) {
            //            lblBox.Text = dBoardRow.WRITE_USER_DEPT_NM;
            //        }
            //    }
            //    lblBox = e.Item.FindControl("eniLblRolePstnName") as Label;
            //    if (lblBox != null) {
            //        if (dBoardRow.IsWRITE_USER_ROLE_PSTN_NMNull() == false) {
            //            lblBox.Text = dBoardRow.WRITE_USER_ROLE_PSTN_NM;
            //        }
            //    }
            //    lblBox = e.Item.FindControl("eniLblUserName") as Label;
            //    if (lblBox != null) {
            //        if (dBoardRow.IsWRITE_USER_NAMENull() == false) {
            //            lblBox.Text = dBoardRow.WRITE_USER_NAME;
            //        }
            //    }
            //} else if (e.Item.ItemType == ListItemType.Footer) {
            //    if (ucBoardList.Items.Count <= 0) {
            //        var boardFooterContainer = e.Item.FindControl("ucBoardListFooterContainer") as HtmlTable;
            //        if (boardFooterContainer != null) {
            //            boardFooterContainer.Visible = true;
            //        }
            //    }
            //}
        }
    }
}
