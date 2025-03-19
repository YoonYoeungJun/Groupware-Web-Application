/// <reference path="../_references.js" />

// eniFramework Web Page
var eni;
window.eni = new function() {
    //window.location.search.substr(1).split('&')
    var __preparing = false;
    var __required_val = ["iFrameName", "ViewType"];
    var __required_method = ["Form_Load"];

    //외부 이벤트에서 내부 함수호출하였을시 'this'키워드 사용되지 않음을 방지하기 위해 'that'을 사용
    var that = this;
    this.GetTitle = function () {
        return document.title;
    };

    // 프레임워크 이름
    var FrameworkName = "eniFramework";
    // protected 프레임워크 이름
    this.getFrameworkName = function () {
        return FrameworkName;
    };
    // 프레임워크 버전
    var Version = "1.2.0.1";

    // protected 프레임워크 버전
    this.getVersion = function () {
        return Version;
    };
    //부모 프레임 워크
    var ParentFramework = parent.eni ? parent.eni : null;
    // protected 부모 프레임 워크
    this.getParentFramework = function () {
        return ParentFramework;
    };
    // 첫페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    that.LocalPage = new PageClass();
    // protected 첫페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    this.getLocalPage = function () {
        return that.LocalPage;
    };
    // 내장 페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    var SubPage = new PageClass();
    // protected 내장 페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    this.getSubPage = function () {
        return SubPage;
    };
    // ViewType에 해당하는 PageClass를 찾는다.
    this.getPage = function (eViewType) {
        if (eViewType) {
            if (that.LocalPage.ViewType === eViewType) {
                return that.LocalPage;
            } else if (that.LocalPage.ViewType < eViewType) {
                if (SubPage && SubPage.base && SubPage.base.getPage) {
                    return SubPage.base.getPage(eViewType);
                } else {
                    return null;
                }
            } else if (that.LocalPage.ViewType > eViewType) {
                if (ParentFramework && ParentFramework.getPage) {
                    return ParentFramework.getPage(eViewType);
                } else {
                    return null;
                }
            }
        }

        return null;
    };
    // protected 내장 페이지(Intellisense 때문에 초기에 객채를 생성한다. '__preparing'속성으로 초기화 여부 판단한다)
    this.setSubPage = function (pSubPage) {
        SubPage = pSubPage;
    };
    // LocalPage 변수 초기화
    this.Initialize = function (pPageJs) {
        //생성자 초기화 검사
        if (__preparing) return that.LocalPage;

        //Page 클래스 생성
        if (pPageJs[__required_val[0]]) {
            that.LocalPage = new PageClass(pPageJs[__required_val[0]]);
        } else {
            that.LocalPage = new PageClass(pPageJs["_blank"]);
        }

        //속성 추가
        for (var propertis in pPageJs) {
            that.LocalPage[propertis] = pPageJs[propertis];
        }

        //부모 프레임 워크에 로컬 프레임 워크 등록
        if (that.LocalPage.ViewType !== ViewType.Top && that.LocalPage.ViewType !== ViewType.PopupView) {
            if (parent && parent.eni) {
                parent.eni.setSubPage(that.LocalPage);
            }
        }

        //RequestMenuID = this.GetQueryString("strRequestMenuID")
        //RequestUpperMenuID = this.GetQueryString("strRequestUpperMenuID")
        //RequestMenuNM = this.GetQueryString("strRequestMenuNm")

        that.LocalPage.window = window;
        that.LocalPage.document = document;

        that.LocalPage.base = this;
        that.LocalPage.__preparing = true;
        __preparing = true
        

        if (that.LocalPage.Title) {
            that.SetTitle(that.LocalPage.Title);
        } else {
            that.SetTitle(that.GetTitle());
        }

        return that.LocalPage;
    };

    this.GetWindowSize = function () {
        return new WindowSize(document.documentElement.clientWidth, document.documentElement.clientHeight);
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

    //변경된 데이터가 있는지 확인한다.
    this.IsDirty = function (skipLocal) {
        //try {
        //    //if (SubPage && SubPage.__preparing) {
        //    //    //if (LocalPage === reqPage) return false;

        //    //    if (SubPage.base && SubPage.base.IsDirty(LocalPage)) {
        //    //        return true;
        //    //    }
        //    //}

        //    var locHaschange = false;

        //    //if (LocalPage.ModuleType && LocalPage.ModuleType !== ModuleType.None) {
        //    //    if (LocalPage.ModuleType === ModuleType.SingleMulti || LocalPage.ModuleType === ModuleType.Multi) {
        //    //        var activeGridView = LocalPage.window.lgActiveGridView;
        //    //        if (activeGridView && activeGridView.batchEditApi.HasChanges) {
        //    //            locHaschange = activeGridView.batchEditApi.HasChanges();
        //    //        }
                    
        //    //        ggoSpread.Source = LocalPage.window.lgActiveSpread;
        //    //        if (ggoSpread.Source) {
        //    //            locHaschange = ggoSpread.CheckChange();
        //    //        }
        //    //    } else {
        //    //        var gridList = LocalPage.window.lgGridViewArr;
                    
        //    //        for (var i = 0; i < gridList.length; i++) {
        //    //            if (gridList[i] && gridList[i].batchEditApi && gridList[i].batchEditApi.HasChanges) {
        //    //                locHaschange = gridList[i].batchEditApi.HasChanges();
        //    //            }
        //    //        }

        //    //        gridList = LocalPage.window.lgSpreadArr;
        //    //        for (var i = 0; i < gridList.length; i++) {
        //    //            ggoSpread.Source = gridList[i];
        //    //            if (ggoSpread.Source) {
        //    //                locHaschange = ggoSpread.CheckChange();
        //    //            }
        //    //        }
        //    //    }
        //    //}

        //    if (lgBlnFlgChgValue) {
        //        return lgBlnFlgChgValue || locHaschange;
        //    } else {
        //        return locHaschange;
        //    }
        //} catch (ex) {
        //    return false;
        //}
        
        var hasChanged = false;

        if (SubPage && SubPage.__preparing) {
            if (SubPage.base && SubPage.base.IsDirty()) {
                return true;
            }
        }

        if (skipLocal) {
            return false;
        }
        
        if (window.lgBlnFlgChgValue !== undefined && window.lgSpreadArr) {
            for (var i = 0; i < window.lgSpreadArr.length; i++) {
                ggoSpread.Source = window.lgSpreadArr[i];
                hasChanged = (window.lgBlnFlgChgValue || ggoSpread.CheckChange());
                if (hasChanged) {
                    return hasChanged;
                }
            }
        } else if (window.lgBlnFlgChgValue !== undefined && !window.lgSpreadArr) {
            return lgBlnFlgChgValue || hasChanged;
        } else {
            return hasChanged;
        }
    };

    this.IsSubPageChagedData = function () {
        var subWind = eni.getSubPage().window;
        var subChang = false;

        for (var i = 0; i < subWind.lgSpreadArr.length; i++) {
            ggoSpread.Source = subWind.lgSpreadArr[i];
            subChang = (subWind.lgBlnFlgChgValue || ggoSpread.CheckChange());
        }

        return subChang;
    };
    
    this.GetHistoryState = function () {
        return window.history.state;
    };

    this.SetHistoryState = function (pState) {
        window.history.state = pState;
    };
    this.ReplaceHistory = function (sTitle, sUrl, oData) {
        if (new String(sTitle).toLowerCase() === "x" || sTitle === 'undefined') {
            sTitle = "";
        }

        if (new String(sUrl).indexOf(window.location.pathname, 0) <= 0) {
            sUrl = window.location.pathname + sUrl;
        }

        sUrl = encodeURI(sUrl);

        window.history.replaceState(oData, sTitle, sUrl);
    };
    var a = 1
    this.PushHistory = function (sTitle, sUrl, oData, bQueue) {
        if (new String(sTitle).toLowerCase() === "x" || sTitle === 'undefined') {
            sTitle = "";
        }

        if (new String(sUrl).indexOf(window.location.pathname, 0) <= 0) {
            sUrl = window.location.pathname + sUrl;
        }

        //sUrl = encodeURI(sUrl);
        
        History.pushState({}, "page " + a, sUrl);
        a += 1;

        //if (window.history.pushState) {
        //    window.history.pushState(oData, sTitle, sUrl);
        //} else {
        //    $.History.setState(sUrl)
        //}
    };

    this.RunPageFrame = function (pLocation, pViewTypeOrFrameName) {
        var runFrame = function (sFrameName) {
            SubPage = null;
            pLocation = encodeURI(pLocation);
            window.open(pLocation, sFrameName);

            //페이지 프레임 실행시에는 변경을 채크하지 않고 바로 실행하는것으로 변경(이전 단계에서 전부 채크하세요)
            //if (SubPage && SubPage.base && SubPage.base.IsDirty()) {
            //    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
            //        if (pDialogResult === DialogResult.Yes) {
            //            SubPage = null;
            //            pLocation = encodeURI(pLocation);
            //            window.open(pLocation, sFrameName);
            //        }
            //    });
            //} else {
            //    SubPage = null;
            //    pLocation = encodeURI(pLocation);
            //    window.open(pLocation, sFrameName);
            //}
        };

        if (typeof (pViewTypeOrFrameName) === "number" || pViewTypeOrFrameName === null || pViewTypeOrFrameName === undefined) {
            if (pViewTypeOrFrameName > ViewType.ModuleView) {
                return;
            }

            if (that.LocalPage.ViewType !== pViewTypeOrFrameName && pViewTypeOrFrameName) {
                //ViewType으로 선택적 프레임 실행
                var pageClass = that.getPage(pViewTypeOrFrameName);
                if (pageClass) {
                    pageClass.base.RunPageFrame(pLocation, pViewTypeOrFrameName);
                }
            } else {
                if (that.LocalPage.iFrameName !== "_blank" && that.LocalPage.iFrameName !== undefined) {
                    runFrame(that.LocalPage.iFrameName);
                } else {
                    if (ParentFramework) {
                        ParentFramework.RunPageFrame(pLocation, --pViewTypeOrFrameName)
                    }
                }
            }
        } else {
            runFrame(pViewTypeOrFrameName);
        }
    };

    this.RunPageTopFrame = function (pLocation) {
        pLocation = encodeURI(pLocation);
        if (window.top && window.top.ifrmTop) {
            window.top.open(pLocation, "ifrmTop");
        } else {
            window.top.location.href = pLocation;
        }
    };

    this.RunPageHistoryBack = function () {
        var runFrame = function () {
            top.history.back();
        };

        if (that.IsDirty()) {
            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                if (pDialogResult === DialogResult.Yes) {
                    runFrame();
                }
            });
        } else {
            runFrame();
        }
    };

    this.SetToolbar = function (pToolbarArgs) {
        try{
            if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.ModuleView
                && ParentFramework
                && ParentFramework.getLocalPage().ViewType === ViewType.View) {
                ParentFramework.SetToolbar(pToolbarArgs);
            } else if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.View) {
                if (that.LocalPage.SetToolbar) {
                    that.LocalPage.SetToolbar(pToolbarArgs);
                }
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.DisableToolBar = function (pToolbarArgs) {
        try {
            if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.ModuleView
                && ParentFramework
                && ParentFramework.getLocalPage().ViewType === ViewType.View) {
                ParentFramework.DisableToolBar(pToolbarArgs);
            } else if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.View) {
                if (that.LocalPage.DisableToolBar) {
                    that.LocalPage.DisableToolBar(pToolbarArgs);
                }
            }

            that.DisableControls();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.RestoreToolBar = function (pToolbarArgs) {
        try {
            if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.ModuleView
                && ParentFramework
                && ParentFramework.getLocalPage().ViewType === ViewType.View) {
                ParentFramework.RestoreToolBar(pToolbarArgs);
            } else if (that.LocalPage.ModuleType
                && that.LocalPage.ViewType === ViewType.View) {
                if (that.LocalPage.RestoreToolBar) {
                    that.LocalPage.RestoreToolBar(pToolbarArgs);
                }
            }

            that.EnableControls();
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.DisableControls = function () {
        this.DisableEditors();
        this.DisableButtons();
    };

    this.EnableControls = function () {
        this.EnableEditors();
        this.EnableButtons();
    };

    this.DisableEditors = function () {
        if (window.lgEditorArr) {
            for (var i = 0; i < lgEditorArr.length; i++) {
                if (lgEditorArr[i].GetEnabled()) {
                    lgEditorArr[i].SetEnabled(false);
                    lgEditorArr[i].CustomEnabled = true;
                }
            }
        }
    };

    this.EnableEditors = function () {
        if (window.lgEditorArr) {
            for (var i = 0; i < lgEditorArr.length; i++) {
                if (lgEditorArr[i].CustomEnabled) {
                    lgEditorArr[i].SetEnabled(true);
                    lgEditorArr[i].CustomEnabled = false;
                }
            }
        }
    };

    this.DisableButtons = function () {
        if (window.lgButtonArr) {
            for (var i = 0; i < lgButtonArr.length; i++) {
                if (lgButtonArr[i].GetEnabled()) {
                    lgButtonArr[i].SetEnabled(false);
                    lgButtonArr[i].CustomEnabled = true;
                }
            }
        }
    };

    this.EnableButtons = function () {
        if (window.lgButtonArr) {
            for (var i = 0; i < lgButtonArr.length; i++) {
                if (lgButtonArr[i].CustomEnabled) {
                    lgButtonArr[i].SetEnabled(true);
                    lgButtonArr[i].CustomEnabled = false;
                }
            }
        }
    };

    this.SetTitle = function (pTitle) {
        top.document.title = pTitle;
    };

    /* [STA] Base Method */

    this.BaseForm_Load = function () {
        try{
            if (that.LocalPage.Form_Load) {
                that.LocalPage.Form_Load();
            }
            this.BaseInitLocalVariables();
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
            if (that.LocalPage.Form_Load_Complate) {
                that.LocalPage.Form_Load_Complate();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.BaseForm_UnLoad = function () {
        try {
            if (that.LocalPage.Form_UnLoad) {
                that.LocalPage.Form_UnLoad();
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
        if (SubPage && SubPage.__preparing) {
            var subRet = SubPage.base.BaseBefore_Form_UnLoad();
            if (subRet === false) {
                return false;
            }
        }
        
        if (that.LocalPage.Before_Form_UnLoad) {
            var localRet = that.LocalPage.Before_Form_UnLoad();
            if (localRet === false) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }

        //콜백함수를 넘겨받아서 작성되게되면 하위 함수를 타면서 호출된 수만큼 콜백 함수가 호출되는 문제가 발생함.
        //var checkUnLoadProcess = function (pDialogResult) {
        //    var isCalledCallback = false;
        //    if (pDialogResult) {
        //        if (pDialogResult === DialogResult.No) {
        //            pCallbackResult(false);
        //            return;
        //        }
        //    }
            
        //    //하위프레임에 
        //    if (SubPage && SubPage.__preparing) {
        //        var subRet = SubPage.base.BaseBefore_Form_UnLoad(pCallbackResult);
        //        if (subRet === false) {
        //            pCallbackResult(false);
        //            return;
        //        }
        //    }

        //    if (LocalPage.Before_Form_UnLoad) {
        //        var localRet = LocalPage.Before_Form_UnLoad();
        //        if (localRet === false) {
        //            pCallbackResult(false);
        //            return;
        //        }
        //    }
        //    if (!isCalledCallback) {
        //        pCallbackResult(true);
        //    }
        //};
        //if (this.IsDirty()) {
        //    if (eni.Message) {
        //        eni.Message.DisplayMsgBox("알림", "변경된 데이터가 있습니다.<br>그래도 작업을 수행하시겠습니까?", MessageBoxButtons.YesNo, null, checkUnLoadProcess);
        //    } else {
        //        if (eni.Log) {
        //            eni.Log.WriteLog("변경된 데이터가 존재하여 사용자한테 입력을 받아야하지만<br>메시지 박스 클래스가 초기화되어있지 않아 묻지않고 자동으로 취소가 됩니다..", LogType.Error);
        //        } else {
        //            if (top.window.console && top.window.console.error) {
        //                top.window.console.error("변경된 데이터가 존재하여 사용자한테 입력을 받아야하지만<br>메시지 박스 클래스가 초기화되어있지 않아 묻지않고 자동으로 취소가 됩니다..");
        //            }
        //        }
        //        pCallbackResult(false);
        //    }
        //} else {
        //    checkUnLoadProcess();
        //}
    };

    this.BasePageKeyDown = function (e) {
        //e = e.browserEvent || e;
        //if (e.preventDefault) {
        //    e.preventDefault();
        //} else {
        //    e.returnValue = false;
        //}

        var objEl = (e ? e.srcElement : window.event.srcElement);
        var keyCode = (e = e || window.event).keyCode;
        
        if (that.LocalPage.PageKeyDown) {
            that.LocalPage.PageKeyDown(e);
        }

        if (keyCode) {
            //18 alter
        }
        switch (keyCode) {
            case 116: // F5
                var reloadFrame = function () {
                    eni.RestoreToolBar();
                    eni.SetToolbar("0000000000000000");
                    if (eni.Loading) {
                        eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00107"));
                    }
                    if (eni.UserAgent.Browser.Type == "IE") {
                        if (eni.UserAgent.Browser.Version < 10 || eni.UserAgent.Browser.Version == 11) {
                            location.href = location.href;
                        } else { //IE9 버젼의 Dev 컨트롤 오류로 인해 리로드는 사용할수 없음
                            document.location.reload(true);
                        }
                    } else {
                        document.location.reload(true);
                    }
                };
                if (eni.IsDirty()) {
                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                        if (pDialogResult === DialogResult.Yes) {
                            reloadFrame();
                        }
                    });
                } else {
                    reloadFrame();
                }
                return false;
                break;
            case 118: // F7
                //var nextElement = document.all(window.event.srcElement.sourceIndex + 1);
                //if (nextElement && nextElement.focus) {
                //    nextElement.focus();
                //}
                break;
            case 123: // F12
                //parent.focus();
                //return false;
                break;
            default:
                break;
        }
    };

    this.BasePageResize = function (e) {
        try{
            if (that.LocalPage.PageResize) {
                that.LocalPage.PageResize(e);
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.BasePopState = function (e) {
        try {
            if (that.LocalPage.PopState) {
                that.LocalPage.PopState(e);
            }
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
            if (that.LocalPage.InitLocalVariables) {
                that.LocalPage.InitLocalVariables();
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
            if (that.LocalPage.SetLocalDefaultValue) {
                that.LocalPage.SetLocalDefaultValue();
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
            if (that.LocalPage.InitData) {
                that.LocalPage.InitData();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    }

    /*
    [STA] Toolbar 관련 함수
    */
    this.BaseOnFncQuery = function () {
        try {
            if (that.LocalPage.ViewType != ViewType.PopupView) {
                if (SubPage && SubPage.OnFncQuery) {
                    if (that.getSubPage().window.lgProcessServer) {
                        return;
                    }
                    SubPage.OnFncQuery();
                }
            } else {
                if (window.lgProcessServer) {
                    return;
                }
                if (that.LocalPage.OnFncQuery) {
                    that.LocalPage.OnFncQuery();
                }
            }
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
        }
    };
    this.BaseOnFncNew = function () {
        try{
            if (SubPage && SubPage.OnFncNew) {
                SubPage.OnFncNew();
            }
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
        }
    };
    this.BaseOnFncDelete = function () {
        try{
            if (SubPage && SubPage.OnFncDelete) {
                SubPage.OnFncDelete();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncSave = function () {
        try{
            if (SubPage && SubPage.OnFncSave) {
                SubPage.OnFncSave();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncRefresh = function () {
        try{
            if (SubPage && SubPage.OnFncRefresh) {
                SubPage.OnFncRefresh();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncCancel = function () {
        try{
            if (SubPage && SubPage.OnFncCancel) {
                SubPage.OnFncCancel();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncPrev = function () {
        try{
            if (SubPage && SubPage.OnFncPrev) {
                SubPage.OnFncPrev();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncNext = function () {
        try{
            if (SubPage && SubPage.OnFncNext) {
                SubPage.OnFncNext();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncInsertRow = function () {
        try{
            if (SubPage && SubPage.OnFncInsertRow) {
                SubPage.OnFncInsertRow();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncDeleteRows = function () {
        try{
            if (SubPage && SubPage.OnFncDeleteRows) {
                SubPage.OnFncDeleteRows();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncCopyRow = function () {
        try{
            if (SubPage && SubPage.OnFncCopyRow) {
                SubPage.OnFncCopyRow();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncExport = function () {
        try{
            if (SubPage && SubPage.OnFncExport) {
                SubPage.OnFncExport();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncPrint = function () {
        try{
            if (SubPage && SubPage.OnFncPrint) {
                SubPage.OnFncPrint();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncHelp = function () {
        try{
            if (SubPage && SubPage.OnFncHelp) {
                SubPage.OnFncHelp();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    this.BaseOnFncSettings = function () {
        try{
            if (SubPage && SubPage.OnFncSettings) {
                SubPage.OnFncSettings();
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };
    /*
    [END] Toolbar 관련 함수
    */


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

    this.ExecuteParentPageCommand = function (pCmd, pArgs, pCallback) {
        try {
            if (ParentFramework && ParentFramework.getLocalPage().ExecuteParentPageCommand) {
                return ParentFramework.getLocalPage().ExecuteParentPageCommand(pCmd, pArgs, pCallback);
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    this.ExecuteSubPageCommand = function (pCmd, pArgs, pCallback) {
        try{
            if (SubPage && SubPage.ExecuteSubPageCommand) {
                return SubPage.ExecuteSubPageCommand(pCmd, pArgs, pCallback);
            }
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    };

    /* [END] Virtual Method */
};

//window Event 금지
//document.onkeydown = eni.BasePageKeyDown;
//document.onkeypress = function () { return false };
//document.onkeyup = function () { return false };



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
    $(window).ready(function () {
        if (eni.getLocalPage()) {
            try {
                eni.BaseForm_Load();
                eni.BaseForm_Load_Complate();
                eni.BasePageResize();
                if (eni.getLocalPage().ViewType === ViewType.ModuleView) {
                    if (eni.Loading) {
                        eni.Loading.DisplayLoadingAll(false);
                    }
                }
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }
        }
    });

    $(window).keydown(eni.BasePageKeyDown);
    $(window).resize(eni.BasePageResize);
    //$(window).bind("popstate", null, function (e) {
    //    eni.BasePopState(e);
    //});
    //로드시 포커스에 문제가 생기면 등록해야하는데 이상하다(조금더 지켜보자)
    //$(window).load(function () {
        
    //});
    $(window).unload(eni.BaseForm_UnLoad);

    if ($.browser && $.browser.version > 9) {
        if (History && History.Adapter) {
            History.Adapter.bind(window, "statechange", function () {
                try {
                    eni.BasePopState();
                } catch (ex) {
                    alert(ex.message)
                }
            });
        }
    }
} else {
    window.onload = function () {
        if (eni.getLocalPage()) {
            if (eni.getLocalPage().Title) eni.SetTitle(eni.getLocalPage().Title);
            if (eni.getLocalPage().ViewType === ViewType.Index) {
                if (eni.Message) {
                    eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00105"));
                } else {
                    eni.Loading.DisplayStatusLoading(true, "불러오는 중입니다.<br>잠시만 기다려주십시요.");
                }
            }

            try {
                eni.BaseForm_Load();
                eni.BaseForm_Load_Complate();
                eni.BasePageResize();

                if (eni.getLocalPage().ViewType === ViewType.ModuleView) {
                    if (eni.Loading) {
                        eni.Loading.DisplayLoadingAll(false);
                    }
                }
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }
        }
    };

    window.onkeydown = eni.BasePageKeyDown;
    window.onresize = eni.BasePageResize;
    window.onpopstate = eni.BasePopState;
    window.onunload = eni.BaseForm_UnLoad;
}


