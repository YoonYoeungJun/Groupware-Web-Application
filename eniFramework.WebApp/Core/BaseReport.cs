using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eniFramework.WebApp.Core
{
    public class BaseReport<TReport> : BaseUIACTPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //if (!IsPostBack && string.Equals(Request["fromDesigner"], bool.TrueString, StringComparison.OrdinalIgnoreCase))
            //{
            //    CleanDocument();

            //    var redirectUrl = Request.RawUrl.Substring(Request.ApplicationPath.Length);
            //    redirectUrl = ReportDesignerUrlLogic.CleanUrl(redirectUrl, false);
            //    Response.Redirect("~/" + redirectUrl);
            //}

            //var topRightMenuRegion = Master.FindControl("TopRightMenuRegion");
            //var showDesignerButton = topRightMenuRegion.FindControl("showDesignerButton") as IShowDesignerButtonControl;
            //if (showDesignerButton != null)
            //{
            //    showDesignerButton.ReportTypeName = ReportTypeName;
            //}

            //var contentPlaceHolder = Master.FindControl("ContentHolder");
            //var documentViewer = contentPlaceHolder.FindControl("documentViewer") as ASPxDocumentViewer;
            //if (documentViewer != null)
            //{
            //    documentViewer.Report = ReportStorageHelper.LoadReport(ReportTypeName, Session);
            //}
            //var webDocumentViewer = contentPlaceHolder.FindControl("webDocumentViewer") as ASPxWebDocumentViewer;
            //if (webDocumentViewer != null)
            //{
            //    webDocumentViewer.OpenReport(ReportStorageHelper.LoadReport(ReportTypeName, Session));
            //    ASPxWebControl.GlobalEmbedRequiredClientLibraries = true;
            //}
        }

        protected string ReportTypeName
        {
            get { return typeof(TReport).FullName; }
        }

        protected virtual void CleanDocument()
        {
        }
    }
}