/// <reference path="../_references.js" />

(function () {
    if (window.eni) {
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
                if (eni.getParentFramework() && eni.getParentFramework().Popup) {
                    eni.getParentFramework().Popup.ShowUserInfo(pUserId);
                } else {
                    
                }
            };
            this.ShowContact = function (pJsonContactData, pCallbackF) {
                if (eni.getParentFramework() && eni.getParentFramework().Popup) {
                    eni.getParentFramework().Popup.ShowContact(pJsonContactData, pCallbackF);
                } else {

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
        }
    }
})();
