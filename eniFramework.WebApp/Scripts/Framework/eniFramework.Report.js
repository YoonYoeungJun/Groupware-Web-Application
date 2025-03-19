/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.Report = new function () {
        var prWidth = 1024;
        var prHeight = 768;
        this.EBRPreviewRun = function () {
            try {
                window.showModalDialog("http://173.0.9.3/REQUBE/bin/RQISAPI.dll?View?doc=Report/KO/EBR/DIC/a4103oa1_ko376.ebr&runvar=fr_dt|2014-01-01|to_dt|2014-01-01|fr_bp|1|to_bp|1|biz_area|p10|VatType|a|", null, "dialogWidth=" + prWidth + "px; dialogHeight=" + prHeight + "px; center: Yes; help: No; resizable: Yes; status: No;")
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }
        };
        this.RQDReport = function (strTitle, strReportId, strRunVar, eRQDocType, eRQDocMode, eRQDocDirection, strDbName, eLang, oWindowSize) {
            try {
                var iWidth = (eRQDocDirection ? eRQDocDirection : RQDocDirection.Height) == RQDocDirection.Height ? 810 : 1140;
                var iHight = (eRQDocDirection ? eRQDocDirection : RQDocDirection.Height) == RQDocDirection.Height ? 800 : 800;

                if (oWindowSize) {
                    if (oWindowSize.Width) {
                        iWidth = oWindowSize.Width;
                    }
                    if (oWindowSize.Height) {
                        iHight = oWindowSize.Height;
                    }
                }

                var docMode = (eRQDocMode || RQDocMode.View);
                var strRQUrl = "./RQDPrint?";
                strRQUrl += "doc=" + (strReportId || "");
                strRQUrl += "&runvar=" + (strRunVar || "");
                strRQUrl += "&doctype=" + (eRQDocType || RQDDocType.RQD);
                strRQUrl += "&dbname=" + (strDbName || eni.CommonVariable.DbName);
                strRQUrl += "&lang=" + (eLang || lgLang);
                strRQUrl += "&t=" + (strTitle || "");
                strRQUrl += "&m=" + (RQDocMode.View);
                strRQUrl += "&d=" + (eRQDocDirection || RQDocDirection.Height);
                
                //if (docMode == RQDocMode.View) {
                    window.showModalDialog(encodeURI(strRQUrl), null, "dialogWidth=" + iWidth + "px; dialogHeight=" + iHight + "px; center: Yes; help: No; resizable: No; status: No;");
                //} else {
                    //if (window.ebPrint) {
                    //    var objForm = window.ebPrint;
                    //    strUrl = strUrl & EBParent.gServerIP
                    //    strUrl = strUrl & EBParent.gEbEnginePath
                    //    strUrl = strUrl & "ExecuteWinReportForPrint"
    
                    //    objForm.uname.Value = EBParent.gEbUserName
                    //    objForm.dbname.Value = EBParent.gEbDbName
                    //    objForm.FileName.Value = EBParent.gEbPkgRptPath & "\" & gLang & "\EBR\" & EBRName
                    //    objForm.condvar.Value = condvar & strPolicy
                    //    objForm.Date.Value = "-2"
    
                    //    objForm.Action = strUrl
                    //    objForm.submit
                    //}
                //}
            } catch (ex) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            }
        };
        this.HTMLPrintRun = function (pTitle, pPrintBody) {
            try {
                var args = {};
                args.PrintBody = pPrintBody;
                window.showModalDialog(encodeURI("/HTMLPrint?HTMLPrintTitle=" + pTitle), args, "dialogWidth=" + prWidth + "px; dialogHeight=" + prHeight + "px; scrollbars=YES; center: Yes; help: No; resizable: Yes; status: No;");
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }
        };
        this.WindowPopup = function () {
        };
    };
})();
