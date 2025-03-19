/// <reference path="../_references.js" />

// eniFramework Web Page
var eni;
window.eni = new function() {
    //window.location.search.substr(1).split('&')
    var __preparing = false;
    var __required_val = ["iFrameName", "ViewType"];
    var __required_method = ["Form_Load", "Form_Load_Complate", "", ""];

    //외부 이벤트에서 내부 함수호출하였을시 'this'키워드 사용되지 않음을 방지하기 위해 'that'을 사용
    var that = this;

    var Title = document.title;
    this.GetTitle = function () {
        return Title;
    };

    // 프레임워크 이름
    var FrameworkName = "eniFramework";
    // protected 프레임워크 이름
    this.getFrameworkName = function () {
        return FrameworkName;
    };
    // 프레임워크 버전
    var Version = "1.0.0.1";

    // protected 프레임워크 버전
    this.getVersion = function () {
        return Version;
    };

    // 첫페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    var LocalPage = new PageClass();
    // protected 첫페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    this.getLocalPage = function () {
        return LocalPage;
    };
    
    // LocalPage 변수 초기화
    this.Initialize = function (pPageJs) {
        //생성자 초기화 검사
        if (__preparing) return this;

        if (pPageJs[__required_val[1]]) {
            if (pPageJs[__required_val[0]] && pPageJs[__required_val[1]] !== ViewType.View) {
                LocalPage = new PageClass(pPageJs[__required_val[0]])
            } else if (!pPageJs[__required_val[0]] && pPageJs[__required_val[1]] !== ViewType.View) {
                if (eni.Log) {
                    eni.Log.WriteLog("필수 지역변수를 찾지 못하였습니다.", LogType.Error, "eniFramework.Initialize");
                } else {
                    if (top.window.console && top.window.console.error) {
                        top.window.console.error("[eniFramework.Initialize] 필수 지역변수를 찾지 못하였습니다.");
                    }
                }
                alert("필수 지역변수를 찾지 못하였습니다.");
                return LocalPage;
            } else {
                LocalPage = new PageClass("_blank");
            }
        } else {
            if (eni.Log) {
                eni.Log.WriteLog("필수 지역변수를 찾지 못하였습니다.", LogType.Error, "eniFramework.Initialize");
            } else {
                if (top.window.console && top.window.console.error) {
                    top.window.console.error("[eniFramework.Initialize] 필수 지역변수를 찾지 못하였습니다.");
                }
            }
            alert("필수 지역변수를 찾지 못하였습니다.");
            return LocalPage;
        }
        

        //필수 메서드 검사
        if (pPageJs[__required_method[0]] && pPageJs[__required_method[1]]) {

            for (var propertis in pPageJs) {
                LocalPage[propertis] = pPageJs[propertis];
            }
            LocalPage.__preparing = true;
            LocalPage.base = this;
            LocalPage.window = window;
            __preparing = true
        } else {
            if (eni.Log) {
                eni.Log.WriteLog("필수 구성요소를 찾지 못하였습니다.", LogType.Error, "eniFramework.Initialize");
            } else {
                if (top.window.console && top.window.console.error) {
                    top.window.console.error("[eniFramework.Initialize] 필수 구성요소를 찾지 못하였습니다.");
                }
            }
            alert("필수 구성요소를 찾지 못하였습니다.");
        }

        if (LocalPage.ViewType && LocalPage.ViewType === ViewType.View) {
            if (LocalPage.Title) {
                that.SetTitle(LocalPage.Title);
            } else {
                that.SetTitle(Title);
            }
        }

        return LocalPage;
    };

    //Query String을 가져옵니다.
    this.GetQueryString = function (pName) {
        pName = pName.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");

        var regexS = "[\\?&]" + pName + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(window.location.href);

        if (results !== null) {
            return decodeURIComponent(results[1].replace(/\+/g, " "));
        } else {
            return "";
        }
    };

    this.RunPageFrame = function (pLocation, pShowLoadingPanel) {
        if (pShowLoadingPanel === undefined || pShowLoadingPanel === true) {
            if (eni.Loading) {
                if (eni.Message) {
                    eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00109"));
                } else {
                    eni.Loading.DisplayStatusLoading(true, "페이지 전환중입니다.<br>잠시만 기다려주세요.");
                }
            }
        }

        pLocation = encodeURI(pLocation);

        window.open(pLocation, LocalPage.iFrameName);
    };

    this.RunPageHistoryBack = function (pShowLoadingPanel) {
        var runFrame = function () {
            if (pShowLoadingPanel === undefined || pShowLoadingPanel === true) {
                if (eni.Loading) {
                    if (eni.Message) {
                        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00109"));
                    } else {
                        eni.Loading.DisplayStatusLoading(true, "페이지 전환중입니다.<br>잠시만 기다려주세요.");
                    }
                }
            }

            top.history.back();
        };

        if (this.IsDirty()) {
            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                if (pDialogResult === DialogResult.Yes) {
                    runFrame();
                }
            });
        } else {
            runFrame();
        }
    };
    this.SetTitle = function (pTitle) {
        top.document.title = pTitle;
    };

    /* [STA] Base Method */

    this.BaseForm_Load = function () {
        try{
            if (LocalPage.Form_Load) {
                LocalPage.Form_Load();
            }
            this.BaseInitGolbalVariables();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseForm_Load_Complate = function () {
        try{
            if (LocalPage.Form_Load_Complate) {
                LocalPage.Form_Load_Complate();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.BaseBefore_Form_UnLoad = function () {
        if (LocalPage.Before_Form_UnLoad) {
            var localRet = LocalPage.Before_Form_UnLoad();
            if (localRet === false) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    };

    this.BasePageKeyDown = function (e) {
        var objEl = (e ? e.srcElement : window.event.srcElement);
        var keyCode = (e = e || window.event).keyCode;
        
        if (LocalPage.PageKeyDown) {
            LocalPage.PageKeyDown(e);
        }

        if (keyCode) {
            //18 alter
        }
        switch (keyCode) {
            case 116: // F5
                if (eni.Loading) {
                    eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00107"));
                }
                if (eni.UserAgent.Browser.Type === "IE") {
                    if (eni.UserAgent.Browser.Version < 10) {
                        location.href = location.href;
                    } else { //IE9 버젼의 Dev 컨트롤 오류로 인해 리로드는 사용할수 없음
                        document.location.reload(true);
                    }
                } else {
                    document.location.reload(true);
                }
                return false;
                break;
            case 118: // F7
                //var aaaa = document.all(window.event.srcElement.sourceIndex + 1);
                //aaaa.onclick();
                break;
            case 123: // F12
                parent.focus();
                break;
            default:
                break;
        }
    };
    this.BasePageResize = function (e) {
        try{
            if (LocalPage.PageResize) {
                LocalPage.PageResize(e);
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseInitGolbalVariables = function () {
        try{
            if (LocalPage.InitGolbalVariables) {
                LocalPage.InitGolbalVariables();
            }
            this.BaseInitLocalVariables()
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseInitLocalVariables = function () {
        try{
            if (LocalPage.InitLocalVariables) {
                LocalPage.InitLocalVariables();
            }
            this.BaseSetGlobalDefaultValue();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.BaseSetGlobalDefaultValue = function () {
        try{
            if (LocalPage.SetGlobalDefaultValue) {
                LocalPage.SetGlobalDefaultValue();
            }
            this.BaseSetLocalDefaultValue();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseSetLocalDefaultValue = function () {
        try{
            if (LocalPage.SetLocalDefaultValue) {
                LocalPage.SetLocalDefaultValue();
            }
            this.BaseInitConditionData();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseInitConditionData = function () {
        try{
            if (LocalPage.InitConditionData) {
                LocalPage.InitConditionData();
            }
            this.BaseInitData();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseInitData = function () {
        try{
            if (LocalPage.InitData) {
                LocalPage.InitData();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    }


    /* [END] Base Method */

    /* [STA] Virtual Method */

    //this.CommonCallback = function (pCallbackObj, pCallbackType, pArgs, pCallback) {
    //    if (pCallbackObj && pCallbackType) {
    //        switch (pCallbackType) {
    //            case CallbackType.PerformCallback:
    //                pCallbackObj.PerformCallback(pArgs);
    //                break;
    //            case CallbackType.GetValuesOnCustomCallback:
    //                if (pCallback) {
    //                    pCallbackObj.GetValuesOnCustomCallback(pArgs, pCallback);
    //                } else {
    //                    pCallbackObj.GetValuesOnCustomCallback(pArgs);
    //                }
    //                break;
    //            default: break;
    //        }
    //    }
    //};

    /* [END] Virtual Method */
};

//window Event 금지
document.onkeydown = eni.BasePageKeyDown;
//document.onkeypress = function () { return false };
//document.onkeyup = function () { return false };

//$(window).keydown(eni.BasePageKeyDown);
$(window).resize(eni.BasePageResize);

var dxCustomJS = function () {
    //ASPxClientControl
    //if (ASPxPostHandler) {
    //    ASPxPostHandler.ReplaceDoCallback = function () {
    //        var original = WebForm_DoCallback;
    //        WebForm_DoCallback = function (eventTarget, eventArgument, eventCallback, context, errorCallback, useAsync) {
    //            var postHandler = aspxGetPostHandler();
    //            if (postHandler.dxCallbackHandled)
    //                delete postHandler.dxCallbackHandled;
    //            else
    //                _aspxRaisePostHandlerOnPost(eventTarget, true);
    //            if (postHandler.cancelPostProcessing)
    //                return;
    //            return original(eventTarget, eventArgument, eventCallback, context, errorCallback, useAsync);
    //        };
    //    };
    //}
};
dxCustomJS();

if ($ && jQuery) {
    $(document).ready(function () {
        if (eni.getLocalPage()) {
            if (eni.getLocalPage().ViewType === ViewType.Index) {
                if (eni.Loading) {
                    if (eni.Message) {
                        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00105"));
                    } else {
                        eni.Loading.DisplayStatusLoading(true, "불러오는 중입니다.<br>잠시만 기다려주십시요.");
                    }
                }
            }
            
            eni.BaseForm_Load();
            eni.BaseForm_Load_Complate();
            eni.BasePageResize()

            if (eni.getLocalPage().ViewType === ViewType.View) {
                if (eni.Loading) {
                    eni.Loading.DisplayStatusLoading(false);
                }
            }
        }
    });
} else {
    document.onload = function () {
        if (eni.getLocalPage()) {
            //if (eni.getLocalPage().Title) eni.SetTitle(eni.getLocalPage().Title);
            if (eni.getLocalPage().ViewType === ViewType.Index) {
                if (eni.Message) {
                    eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00105"));
                } else {
                    eni.Loading.DisplayStatusLoading(true, "불러오는 중입니다.<br>잠시만 기다려주십시요.");
                }
            }

            eni.BaseForm_Load();
            eni.BaseForm_Load_Complate();

            if (eni.getLocalPage().ViewType === ViewType.View) {
                if (eni.Loading) {
                    eni.Loading.DisplayStatusLoading(false);
                }
            }
        }
    };
}
