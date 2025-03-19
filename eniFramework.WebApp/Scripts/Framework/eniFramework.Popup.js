/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.Popup = new function () {
        this.ShowUserIdContextMenu = function (pUserId, pAtElement, pContextMenuType) {
            try {
                if (window.lgFrmUserIdContextMenuBox) {
                    var frmUserIdContextMenuBox = ASPxClientPopupMenu.Cast(lgFrmUserIdContextMenuBox);

                    frmUserIdContextMenuBox.ShowContextMenu(pAtElement, pContextMenuType, function (pArgs) {
                        switch (pArgs) {
                            case "SendNote":
                                alert("아직 준비중입니다.");
                                break;
                            case "SendMail":
                                alert("아직 준비중입니다.");
                                break;
                            case "UserInfo":
                                eni.Popup.ShowUserInfo(pUserId);
                                break;
                            default:
                                break;
                        }
                    });
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("사용자 아이디 클릭용 컨텍스트 메뉴가 초기화 되지 않았습니다.", LogType.Error);
                    } else {
                        top.window.console.error("사용자 아이디 클릭용 컨텍스트 메뉴화 되지 않았습니다.");
                    }
                }
            } catch (ex) {
                alert(ex.message);
            }
        };

        this.ShowUserInfo = function (pUserId) {
            try {
                if (window.lgFrmUserInfoBox) {
                    var frmlgFrmUserInfoBox = ASPxClientPopupControl.Cast(lgFrmUserInfoBox);
                    frmlgFrmUserInfoBox.ShowPopup(pUserId);
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("사용자 세부 정보 팝업이 초기화 되지 않았습니다.", LogType.Error);
                    } else {
                        top.window.console.error("사용자 세부 정보 팝업이 초기화 되지 않았습니다.");
                    }
                }
            } catch (ex) {
                alert(ex.message);
            }
        };

        this.ShowContact = function (pJsonContactData, pCallbackF) {
            try {
                if (window.lgFrmContactBox) {
                    var frmlgFrmUserInfoBox = ASPxClientPopupControl.Cast(lgFrmContactBox);
                    frmlgFrmUserInfoBox.ShowPopup(pJsonContactData, pCallbackF);
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("주소록 팝업이 초기화 되지 않았습니다.", LogType.Error);
                    } else {
                        top.window.console.error("주소록 팝업이 초기화 되지 않았습니다.");
                    }
                }
            } catch (ex) {
                alert(ex.message);
            }
        };

        this.ShowCommonPopup = function () {
            try {
                if (window.lgFrmCommonBox) {
                    var frmlgFrmCommonBox = ASPxClientPopupControl.Cast(lgFrmCommonBox);
                    frmlgFrmCommonBox.ShowPopup(pUserId);
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("사용자 세부 정보 팝업이 초기화 되지 않았습니다.", LogType.Error);
                    } else {
                        top.window.console.error("사용자 세부 정보 팝업이 초기화 되지 않았습니다.");
                    }
                }
            } catch (ex) {
                alert(ex.message);
            }
        };

        this.ShowCommonWinPopup = function (pArgs) {
            if (!pArgs) {
                pArgs = {};
            }
            if (pArgs.WinSize === undefined || typeof pArgs.WinSize !== "object") {
                pArgs.WinSize = new WindowSize(400, 450);
            }
            return this.ShowWinModalPopup("./webContent/common/popup/commonwinpopup.aspx", pArgs);
        };

        this.ShowWinModalPopup = function (pUrl, pArgs, pCallback) {
            if (!pArgs) {
                pArgs = {};
            }
            if (pArgs.WinSize === undefined || typeof pArgs.WinSize !== "object") {
                pArgs.WinSize = new WindowSize(430, 450);
            }

            return window.showModalDialog(pUrl, pArgs, "dialogWidth:" + pArgs.WinSize.Width + "px; dialogHeight:" + pArgs.WinSize.Height + "px; center: Yes; help: No; toolbar: No; menubar: No; location: No; resizable: No; status: No;", pCallback);
        };
    };
})();
