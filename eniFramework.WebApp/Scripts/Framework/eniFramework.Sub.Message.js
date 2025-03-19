/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.Message = new function () {
        this.StrBundle = function (pStrID) {
            if (eni.getParentFramework()) {
                return eni.getParentFramework().Message.StrBundle(pStrID);
            } else {

            }
        };

        this.DisplayMsgBox = function (pTitle, pMessage, pMessageBoxButtons, pWindowSize, pCallback) {
            if (eni.getParentFramework()) {
                eni.getParentFramework().Message.DisplayMsgBox(pTitle, pMessage, pMessageBoxButtons, pWindowSize, pCallback);
            } else {

            }
        };

        this.DisplayBundleMsgBox = function (pStrTitleBundleID, pStrMessageBudleID, pMessageBoxButtons, pWindowSize, pCallback) {
            if (eni.getParentFramework()) {
                eni.getParentFramework().Message.DisplayBundleMsgBox(pStrTitleBundleID, pStrMessageBudleID, pMessageBoxButtons, pWindowSize, pCallback);
            } else {

            }
        };

        this.DisplayCodeMsgBox = function (pTitle, pMessageCode, pMessageBoxButtons, pWindowSize, pCallback) {
            if (eni.getParentFramework()) {
                eni.getParentFramework().Message.DisplayCodeMsgBox(pTitle, pMessageCode, pMessageBoxButtons, pWindowSize, pCallback);
            } else {

            }
        };

        this.DisplayConfirmBox = function (pTitle, pConfirmMessage, pWindowSize, pCallback) {
            if (eni.getParentFramework()) {
                eni.getParentFramework().Message.DisplayConfirmBox(pTitle, pConfirmMessage, pWindowSize, pCallback);
            } else {

            }
        };
    };
})();
