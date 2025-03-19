/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.Log = new function () {
        var logTypeConsoleWrite = function (pLogType, pMsg, pPreFix) {
            var strPreFix = "";
            if (pPreFix) {
                strPreFix = "[" + pPreFix + "] ";
            } else {
                strPreFix = "[" + eni.getFrameworkName() + "] ";
            }

            if (top.window.console) {
                switch (pLogType) {
                    case LogType.Info:
                        if (top.window.console.info) {
                            top.window.console.info(strPreFix + pMsg);
                        }
                        break;
                    case LogType.Warn:
                        if (top.window.console.warn) {
                            top.window.consoleconsol.warn(strPreFix + pMsg);
                        }
                        break;
                    case LogType.Error:
                        if (top.window.console.error) {
                        top.window.console.error(strPreFix + pMsg);
                        }
                        break;
                    case LogType.Default:
                        if (top.window.console.log) {
                            top.window.console.log(strPreFix + pMsg);
                        }
                        break;
                    default:
                        if (top.window.console.log) {
                            top.window.console.log(strPreFix + pMsg);
                        }
                        break;
                }
            }
        }

        var logWrite = function (pLogType, pMsg, pPreFix, pProp) {
            try {
                //오브젝트일시
                if (typeof pMsg === "object") {
                    for (var prop in pMsg) {
                        //내부 속석의 값이 오브젝트일때
                        if (typeof pMsg[prop] !== "object") {
                            //Array같은경우 프로토 타입이기때문에 function코드는 빼준다
                            if (typeof pMsg[prop] !== "function") {
                                if (pProp) {
                                    if (!isNaN(parseInt(prop))) {
                                        logTypeConsoleWrite(pLogType, "Array[" + prop + "] : " + pMsg[prop], pPreFix);
                                    } else {
                                        logTypeConsoleWrite(pLogType, pProp + " - " + prop + " : " + pMsg[prop], pPreFix);
                                    }
                                } else {
                                    // Array 일때
                                    if (!isNaN(parseInt(prop))) {
                                        logTypeConsoleWrite(pLogType, "Array[" + prop + "] : " + pMsg[prop], pPreFix);
                                    } else {
                                        logTypeConsoleWrite(pLogType, prop + " : " + pMsg[prop], pPreFix);
                                    }
                                }
                            }
                        } else {
                            var tmpProp = "";
                            if (pProp) {
                                tmpProp = pProp + " - " + prop;
                            } else {
                                tmpProp = prop;
                            }
                            // 재귀호출시 현재 속성명을 작성하여 넣어준다.
                            logWrite(pLogType, pMsg[prop], pPreFix, tmpProp);
                        }
                    }
                } else {
                    logTypeConsoleWrite(pLogType, pMsg, pPreFix);
                }
            } catch (ex) {
                logTypeConsoleWrite(LogType.Error, "[eni.Log Class Error] " + ex.message);
                logTypeConsoleWrite(LogType.Error, ex.message);
            }
        };
        this.WriteLog = function (pMsg, pLogType, pPreFix) {
            if (eni.CommonVariable && (eni.CommonVariable.gIsLogWrite === IsLogWrite.True)) {
                logWrite(pLogType, pMsg, pPreFix)
            }
        };

        this.WritObjFunc = function(pObj) {

        };
    }
})();

