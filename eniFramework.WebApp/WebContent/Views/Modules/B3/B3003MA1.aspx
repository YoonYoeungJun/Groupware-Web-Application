<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B3003MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B3.B3003MA1" Theme="eniThm" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B3003MA1.aspx
    *  4. Program Name         : 직위정보관리
    *  5. Program Desc         : 직위정보관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2015-04-24
    *  9. Modifier (First)     : Yoon YoungJun
    * 10. Modifier (Last)      : Yoon YoungJun
    * 11. Comment              :
    **************************************************************************************************************
    --%>
</asp:Content>

<%-- 2.해당 페이지 추가 Meta 코드 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Meta_Holder" runat="server">
</asp:Content>

<%-- 3.해당 페이지의 컨트롤 ScriptIntellisense 기능 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_ScriptIntelliSense_Holder" runat="server">
    <script type="text/javascript">
        tabMain             = ASPxClientTabControl.Cast();
        tab1Layout          = ASPxClientSplitter.Cast();
        frmLayout           = ASPxClientFormLayout.prototype;
        cntxtMinor          = ASPxClientTextBox.Cast();
        cntxtMinorName      = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B3003MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_MINOR_CD      = C_IDX++,
                    C_MINOR_NM      = C_IDX++,
                    C_MINOR_NM_KO   = C_IDX++,
                    C_MINOR_NM_EN   = C_IDX++,
                    C_MINOR_NM_CN   = C_IDX++,
                    C_MINOR_NM_JP   = C_IDX++,
                    C_USE_YN        = C_IDX++;

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/
                this.Title = eni.GetTitle() + " - " + "[<%= lgPageInfo.RequestParentMenuID %>]" + "[<%= lgPageInfo.RequestMenuID %>]" + " : " + "<%= GetGlobalResource("QuickName") %>";
                // 뷰 타입
                this.ViewType = ViewType.ModuleView;
                // 모듈 타입
                this.ModuleType = ModuleType.Multi;

                /*********************************************************************************************
                 * [END] Class Variables Parts
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Form Event Part
                 * Remark : 폼 기본 이벤트 입니다.
                 *********************************************************************************************/

                //폼 로드시 발생합니다.
                this.Form_Load = function () {
                    try {
                        this.InitSpreadSheet();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {
                    try {
                        cntxtMinor.Focus();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 언 로드 되기전 발생합니다.
                this.Before_Form_UnLoad = function () {
                    try {

                        return true;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        return false;
                    }
                };

                //키 다운시 발생합니다.
                this.PageKeyDown = function (e) {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //페이지 크기가 변경되면 발생합니다.
                this.PageResize = function (e) {
                    try {
                        tab1Layout.SetHeight(document.documentElement.clientHeight - 30);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                /*********************************************************************************************
                 * [END] Form Event Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Framework Init Method Part
                 * Remark : 초기화 메소드 입니다.
                 *********************************************************************************************/

                this.InitLocalVariables = function () {
                    try {
                        lgStrSql = new String();
                        lgBlnFlgChgValue = false;
                        lgSortKey1 = 1;
                        lgPageNo = 0;
                        lgPageRowCount = 100;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.SetLocalDefaultValue = function () {
                    try {
                        eni.SetToolbar("1001100011000001");

                        cntxtMinor.SetText("");
                        cntxtMinorName.SetText("");

                        for (var i = 0; i < lgSpreadArr.length; i++) {
                            ggoSpread.Source = lgSpreadArr[i];
                            ggoSpread.ClearSpreadData();
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.InitData = function () {
                    try {
                        hidFields.Remove("strP1");
                        hidFields.Remove("strP2");
                        hidFields.Remove("strP3");
                        hidFields.Remove("strP4");
                        hidFields.Remove("strP5");
                        hidFields.Remove("strP6");
                        hidFields.Remove("strP7");
                        hidFields.Remove("strP8");
                        hidFields.Remove("strP9");
                        hidFields.Add("strP1", "");
                        hidFields.Add("strP2", "");
                        hidFields.Add("strP3", "");
                        hidFields.Add("strP4", "");
                        hidFields.Add("strP5", "");
                        hidFields.Add("strP6", "");
                        hidFields.Add("strP7", "");
                        hidFields.Add("strP8", "");
                        hidFields.Add("strP9", "");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.InitSpreadSheet = function () {
                    try {
                        ggoSpread.Source = vspdData;
                        ggoSpread.ReDraw(false);
                        ggoSpread.MakeColumns(C_USE_YN);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_MINOR_CD, "<%= GetResource("CSTRESX00002")%>", 8, HAlign.Left, 5, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_MINOR_NM, "<%= GetResource("CSTRESX00003")%>", 25, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MINOR_NM_KO, "<%= GetResource("CSTRESX00004")%>", 25, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MINOR_NM_EN, "<%= GetResource("CSTRESX00005")%>", 25, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MINOR_NM_CN, "<%= GetResource("CSTRESX00006")%>", 25, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MINOR_NM_JP, "<%= GetResource("CSTRESX00007")%>", 25, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetCheck(C_USE_YN, "<%= GetResource("CSTRESX00008")%>", 8);

                        //ggoSpread.SSSetEdit(1, "글짜", 10, HAlign.Left, 20, CellKind.Required, false, EditCharCase.UpperCase);
                        //ggoSpread.SSSetDate(1, "글짜", 10, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD, false, 2);
                        //ggoSpread.SSSetDate(2, "날짜", 10, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        //ggoSpread.SSSetCombo(3, "콤보", 10, HAlign.Center, CellKind.Required, false, "Maple\tOak\tAsh");
                        //var a = new Array();
                        //a.push("b");
                        //a.push("c");
                        //ggoSpread.SSSetCombo(4, "콤보1", 10, HAlign.Left, CellKind.Required, false, a);
                        //ggoSpread.SSSetButton(5, false, false);
                        //ggoSpread.SSSetCheck(6, "체크", 8, true, null, "test", null, CheckType.TwoState);
                        //ggoSpread.SSSetFloat(7, "플롯", 10, HAlign.Right, CellKind.Required, false, ",", ".", 6, null, CurrencyLeadingZero.LeadingZeroNo, -10, 10000);
                        //ggoSpread.SSSetFloat(8, "플롯", 10, HAlign.Right, CellKind.Required, false, ",", ".", 0, null, CurrencyLeadingZero.LeadingZeroNo, -10, 10000);

                        ggoSpread.SSSetColHidden(C_USE_YN + 1, C_USE_YN + 1, true);

                        this.InitSpreadSheetCombo();

                        ggoSpread.ReDraw(true);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.InitSpreadSheetCombo = function () {

                };

                this.SetSpreadCellKind = function (pStartRow, pEndRow) {
                };

                this.SetSpreadColor = function (pStartRow, pEndRow) {
                };

                /*********************************************************************************************
                 * [END] Framework Init Method Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Toolbar Method Part
                 * Remark : 상위 프레임에서 호출하주는 툴바 메소드를 작성합니다.
                 *********************************************************************************************/

                //조회 버튼 클릭시 발생합니다.
                this.OnFncQuery = function () {
                    try {
                        if (ASPxClientEdit.ValidateGroup("Condition")) {
                            eni.LocalPage.InitLocalVariables();

                            ggoSpread.Source = vspdData;
                            ggoSpread.ClearSpreadData();

                            var strP1 = cntxtMinor.GetText();

                            eni.LocalPage.DbQuery(strP1);
                        } else {
                            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00118");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //신규 버튼 클릭시 발생합니다.
                this.OnFncNew = function () {
                    try {
                        eni.Loading.DisplayLoading(true, eni.Message.StrBundle("MSGBD00124"));

                        ASPxClientEdit.ClearGroup("Condition");
                        ASPxClientEdit.ClearGroup("Data");

                        for (var i = 0; i < lgSpreadArr.length; i++) {
                            ggoSpread.Source = lgSpreadArr[i];
                            ggoSpread.ClearSpreadData();
                        }

                        eni.LocalPage.InitLocalVariables();
                        eni.LocalPage.SetLocalDefaultValue();

                        eni.Loading.DisplayLoading(false);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //삭제 버튼 클릭시 발생합니다.
                this.OnFncDelete = function () {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //저장 버튼 클릭시 발생합니다.
                this.OnFncSave = function () {
                    try {
                        ggoSpread.Source = lgActiveSpread;
                        if (ggoSpread.GetRowCounts() < 1) {
                            return;
                        }

                        if (ASPxClientEdit.ValidateGroup("Data")) {
                            eni.LocalPage.DbSave();
                        } else {
                            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00118");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //새로고침 버튼 클릭시 발생합니다.
                this.OnFncRefresh = function () {
                    try {
                        eni.LocalPage.InitLocalVariables();

                        for (var i = 0; i < lgSpreadArr.length; i++) {
                            ggoSpread.Source = lgSpreadArr[i];
                            ggoSpread.ClearSpreadData();
                        }

                        var strP1 = hidFields.Get("strP1");
                        var strP2 = hidFields.Get("strP2");
                        var strP3 = hidFields.Get("strP3");
                        var strP4 = hidFields.Get("strP4");
                        var strP5 = hidFields.Get("strP5");
                        var strP6 = hidFields.Get("strP6");
                        var strP7 = hidFields.Get("strP7");
                        var strP8 = hidFields.Get("strP8");
                        var strP9 = hidFields.Get("strP9");

                        eni.LocalPage.DbQuery(strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //취소버튼을 클릭시 발생합니다.
                this.OnFncCancel = function () {
                    try {
                        ggoSpread.Source = lgActiveSpread;
                        if (ggoSpread.GetRowCounts() < 1) {
                            return;
                        }

                        ggoSpread.Source = lgActiveSpread;
                        ggoSpread.EditUndo(ggoSpread.GetSelectedFirstRow(), ggoSpread.GetSelectedLastRow());
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //이전 데이터를 클릭시 발생합니다.
                this.OnFncPrev = function () {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //다음 데이터를 클릭시 발생합니다.
                this.OnFncNext = function () {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //행추가 버틍클릭시 발생합니다.
                this.OnFncInsertRow = function () {
                    try {
                        ggoSpread.Source = vspdData;
                        ggoSpread.ReDraw(false);

                        var activeRow = ggoSpread.InsertRows();
                        ggoSpread.SpreadRequired(C_MINOR_CD, activeRow);

                        ggoSpread.SetValue(C_USE_YN, activeRow, 1);

                        ggoSpread.ReDraw(true);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //행삭제 버튼클릭시 발생합니다.
                this.OnFncDeleteRows = function () {
                    try {
                        ggoSpread.Source = vspdData;
                        ggoSpread.DeleteRows();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                ////행취소 버튼클릭시 발생합니다.
                this.OnFncCencelRow = function () {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //행복사 버튼클릭시 발생합니다.
                this.OnFncCopyRow = function (e) {
                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        e.Cancel = true;
                    }
                };
                this.OnFncExport = function (e) {
                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        e.Cancel = true;
                    }
                };
                this.OnFncPrint = function (e) {
                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        e.Cancel = true;
                    }
                };
                this.OnFncHelp = function (e) {
                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        e.Cancel = true;
                    }
                };
                this.OnFncSettings = function (e) {
                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        e.Cancel = true;
                    }
                };

                /*********************************************************************************************
                 * [END] Toolbar Method Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Event Method Part
                 * Remark : 페이지 이벤트 및 함수를 작성합니다.
                 *********************************************************************************************/
                this.chkUniCode_CheckedChanged = function (s, e) {
                    //한국어, 영어일때 유니코드 지원 컨트롤을 설정시 호출된다.
                    var setUniCode = function () {
                        eni.SetToolbar("0000000000000000");
                        if (chkUniCode.GetValue()) {
                            eni.Cookie.SetCookie("ckUniCode", "1");
                        } else {
                            eni.Cookie.SetCookie("ckUniCode", "0");
                        }
                        __doPostBack();
                    };
                    if (lgBlnFlgChgValue || ggoSpread.CheckChange()) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                            if (pDialogResult === DialogResult.Yes) {
                                setUniCode();
                            }
                        });
                    } else {
                        setUniCode();
                    }
                };
                this.cntxtMinor_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("B_MINOR", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtMinorName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtMinorName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtMinorName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtMinorName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtMinor_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00009")%>";
                        popArgs.AddColumn("MINOR_CD", "<%= GetResource("CSTRESX00002")%>", 10);
                        popArgs.AddColumn("MINOR_NM_" + lgLang, "<%= GetResource("CSTRESX00003")%>", 25);
                        popArgs.From = "B_MINOR";
                        popArgs.Where = "MAJOR_CD = 'S0006'";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtMinor.SetText(arry.Tables[0].Rows[0]["MINOR_CD"]);
                            cntxtMinorName.SetText(arry.Tables[0].Rows[0]["MINOR_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_TopLeftChange = function (oSender, oldLeft, oldTop, newLeft, newTop) {
                    if (oldLeft != newLeft || lgProcessServer) {
                        return;
                    }

                    ggoSpread.Source = vspdData;
                    if (vspdData.MaxRows < newTop + ggoSpread.VisibleRowCount(newTop)) {
                        if (!window.lgPageNo || window.lgPageNo === "") {
                            return;
                        }

                        if (window.lgPageNo > 0) {
                            var strP1 = hidFields.Get("strP1");
                            var strP2 = hidFields.Get("strP2");
                            var strP3 = hidFields.Get("strP3");
                            var strP4 = hidFields.Get("strP4");
                            var strP5 = hidFields.Get("strP5");
                            var strP6 = hidFields.Get("strP6");
                            var strP7 = hidFields.Get("strP7");
                            var strP8 = hidFields.Get("strP8");
                            var strP9 = hidFields.Get("strP9");

                            eni.LocalPage.DbQuery(strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9);
                        }
                    }
                };

                this.vspdDataCbProcess_CallbackComplete = function (s, e) {
                    try {
                        var callbackResult = BaseCallbackResultArgsClass.Deserialize(e.result);
                        switch (callbackResult.Cmd) {
                            case "DbQuery":
                                ggoSpread.Source = lgActiveSpread = vspdData;
                                ggoSpread.Focus();

                                if (!callbackResult.Code) {
                                    if (callbackResult.MultiResult !== "") {
                                        ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                        if (callbackResult.PageNo) {
                                            lgPageNo = callbackResult.PageNo;
                                        } else {
                                            lgPageNo = "";
                                        }
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                            cntxtMinor.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cntxtMinor.Focus();
                                    });
                                }

                                eni.RestoreToolBar();
                                eni.Loading.DisplayLoadingAll(false);
                                break;
                            case "DbSave":
                                if (!callbackResult.Code) {
                                    eni.LocalPage.OnFncQuery();
                                } else {
                                    eni.RestoreToolBar();
                                    eni.Loading.DisplayLoadingAll(false);
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdDataCbProcess_CallbackError = function (s, e) {
                    try {

                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.DbQuery = function (strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9) {
                    try {
                        eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00108"));
                        eni.DisableToolBar();

                        strP1 = eni.Utils.IsNullOrUndefinedToString(strP1);
                        strP2 = eni.Utils.IsNullOrUndefinedToString(strP2);
                        strP3 = eni.Utils.IsNullOrUndefinedToString(strP3);
                        strP4 = eni.Utils.IsNullOrUndefinedToString(strP4);
                        strP5 = eni.Utils.IsNullOrUndefinedToString(strP5);
                        strP6 = eni.Utils.IsNullOrUndefinedToString(strP6);
                        strP7 = eni.Utils.IsNullOrUndefinedToString(strP7);
                        strP8 = eni.Utils.IsNullOrUndefinedToString(strP8);
                        strP9 = eni.Utils.IsNullOrUndefinedToString(strP9);
                        
                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbQuery";
                        cbArgs.CmdDetail = "vspdData";
                        cbArgs.Data = {
                            MINOR_CD: strP1,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.DbDelete = function () {
                    try {
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.DbSave = function () {
                    try {
                        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00108"));

                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbSave";

                        var dsData = new DataSetClass();
                        var tbData = dsData.CreateDataTable("B3003MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("MINOR_CD");
                        tbData.AddColumn("MINOR_NM");
                        tbData.AddColumn("MINOR_NM_KO");
                        tbData.AddColumn("MINOR_NM_EN");
                        tbData.AddColumn("MINOR_NM_CN");
                        tbData.AddColumn("MINOR_NM_JP");
                        tbData.AddColumn("USE_YN");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.MINOR_CD = ggoSpread.GetText(C_MINOR_CD, i, true);
                                    nRow.MINOR_NM = ggoSpread.GetText(C_MINOR_NM, i, true);
                                    nRow.MINOR_NM_KO = ggoSpread.GetText(C_MINOR_NM_KO, i, true);
                                    nRow.MINOR_NM_EN = ggoSpread.GetText(C_MINOR_NM_EN, i, true);
                                    nRow.MINOR_NM_CN = ggoSpread.GetText(C_MINOR_NM_CN, i, true);
                                    nRow.MINOR_NM_JP = ggoSpread.GetText(C_MINOR_NM_JP, i, true);
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.MINOR_CD = ggoSpread.GetText(C_MINOR_CD, i, true);
                                    nRow.MINOR_NM = ggoSpread.GetText(C_MINOR_NM, i, true);
                                    nRow.MINOR_NM_KO = ggoSpread.GetText(C_MINOR_NM_KO, i, true);
                                    nRow.MINOR_NM_EN = ggoSpread.GetText(C_MINOR_NM_EN, i, true);
                                    nRow.MINOR_NM_CN = ggoSpread.GetText(C_MINOR_NM_CN, i, true);
                                    nRow.MINOR_NM_JP = ggoSpread.GetText(C_MINOR_NM_JP, i, true);
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.MINOR_CD = ggoSpread.GetText(C_MINOR_CD, i, true);
                                    nRow.MINOR_NM = ggoSpread.GetText(C_MINOR_NM, i, true);
                                    nRow.MINOR_NM_KO = ggoSpread.GetText(C_MINOR_NM_KO, i, true);
                                    nRow.MINOR_NM_EN = ggoSpread.GetText(C_MINOR_NM_EN, i, true);
                                    nRow.MINOR_NM_CN = ggoSpread.GetText(C_MINOR_NM_CN, i, true);
                                    nRow.MINOR_NM_JP = ggoSpread.GetText(C_MINOR_NM_JP, i, true);
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }

                        vspdDataCbProcess.PerformCallback(dsData.Tables[0].Serialize(cbArgs, "Data"));
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
            });
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
        };
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    <%-- 유니코드 지원 옵션 --%>
    <div class="area_hearder_option <%= lgLang.ToLower() %>">
        <eni:eniCheckBox ID="chkUniCode" ClientInstanceName="chkUniCode" runat="server" SkinID="Advanced-01"
            Text='<%# GetGlobalResource("GCSTRESX00000") %>'>
            <ClientSideEvents CheckedChanged="eni.LocalPage.chkUniCode_CheckedChanged" />
        </eni:eniCheckBox>
    </div>
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- 탭 레이아웃 --%>
    <eni:eniPageControl ID="tabMain" ClientInstanceName="tabMain" SkinID="BSL" runat="server">
        <TabPages>
            <dx:TabPage Name="tab1">
                <ContentCollection>
                    <dx:ContentControl>
                        <eni:eniSplitter ID="tab1Layout" ClientInstanceName="tab1Layout" runat="server" SkinID="BSL">
                            <Panes>
                                <dx:SplitterPane Name="tab1Top" Size="30px" MaxSize="30px" Visible="false">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1Con" Size="32px" MinSize="32px">
                                    <PaneStyle>
                                        <Paddings PaddingBottom="0" />
                                    </PaneStyle>
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <table class="BSL01TB" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtMinor.Focus()"><%= GetResource("CSTRESX00009")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtMinor" ClientInstanceName="cntxtMinor" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtMinor_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtMinor_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C"></th>
                                                    <td class="TD4F"></td>
                                                </tr>
                                            </table>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1DataMulti">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData"  runat="server" ActiveXVersion="vspdDFPSPD6">
                                                <ClientSideEvents Change="eni.LocalPage.vspdData_Change"/>
                                            </eni:eniSpread>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1Bottom" Size="30px" MaxSize="30px" Visible="false">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                            </Panes>
                        </eni:eniSplitter>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </eni:eniPageControl>
    <eni:eniCallback ID="vspdDataCbProcess" ClientInstanceName="vspdDataCbProcess" runat="server" CreateMode="StandardMode"
        OnCallback="vspdDataCbProcess_Callback">
        <ClientSideEvents  CallbackComplete="eni.LocalPage.vspdDataCbProcess_CallbackComplete" 
                        CallbackError="eni.LocalPage.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>