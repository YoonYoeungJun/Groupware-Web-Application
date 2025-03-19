/// <reference path="../../../../Scripts/_references.js" />

function gCl_frmViewMsgBox_Init(s, e) {
    gCl_frmViewMsgBox = ASPxClientPopupControl.Cast(gCl_frmViewMsgBox);
    gCl_frmViewMsgBox.DefaultHeaderText = "Alert";
    gCl_frmViewMsgBox.strLayer = ASPxClientSplitter.Cast(gCl_frmViewMsgBox_Split);
    gCl_frmViewMsgBox.lblMsg = ASPxClientLabel.Cast(gCl_frmViewMsgBox_lblMsg);
    gCl_frmViewMsgBox.btnOk = ASPxClientButton.Cast(gCl_frmViewMsgBox_btnOk);
    
    gCl_frmViewMsgBox.ShowMessage = function (pMsg, pCallBackF) {
        //var dfWidth = 400;
        //var dfHeight = 100;
        //gCl_frmViewMsgBox.SetWidth(dfWidth);
        //gCl_frmViewMsgBox.SetHeight(dfHeight);
        gCl_frmViewMsgBox.strLayer.SetWidth(gCl_frmViewMsgBox.GetWidth());
        gCl_frmViewMsgBox.strLayer.SetHeight(gCl_frmViewMsgBox.GetHeight());

        var pane = gCl_frmViewMsgBox.strLayer.GetPaneByName("frmViewMsgBox_MsgArea");
        gCl_frmViewMsgBox.lblMsg.SetWidth(pane.GetClientWidth());
        gCl_frmViewMsgBox.lblMsg.SetHeight(pane.GetClientHeight());
        gCl_frmViewMsgBox.lblMsg.SetText(pMsg);

        gCl_frmViewMsgBox.Show();

        if (pCallBackF) {
            gCl_frmViewMsgBox.CallbackF = pCallBackF;
        }
    }
         
    //var mainEl = gCl_frmViewMsgBox.GetMainElement();
    //alert(mainEl)
    //$(mainEl).keydown(function (pObj) {
    //    alert();
    //})
    try {
        ASPxClientUtils.AttachEventToElement(gCl_frmViewMsgBox.GetMainElement(), "onKeydown", function () {
            alert()
        })
    } catch (ex) {
        alert(ex.message)
    }
}

function gCl_frmViewMsgBox_Popup(s, e) {
    gCl_frmViewMsgBox.btnOk.Focus()
}

function frmViewMsgBox_btnOk_Click(s, e) {
    if (gCl_frmViewMsgBox.CallbackF) {
        gCl_frmViewMsgBox.CallbackF();
        gCl_frmViewMsgBox.Hide();
    } else {
        gCl_frmViewMsgBox.Hide();
    }
    gCl_frmViewMsgBox.SetHeaderText(gCl_frmViewMsgBox.DefaultHeaderText);
}
