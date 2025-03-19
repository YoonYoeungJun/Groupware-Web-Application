<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B3000MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B3.B3000MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B3000MA1.aspx
    *  4. Program Name         : 사업장정보관리
    *  5. Program Desc         : 사업장정보관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2015-04-23
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
        cntxtBizArea        = ASPxClientTextBox.Cast();
        cntxtBizAreaName    = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B3000MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_BIZ_AREA_CD           = C_IDX++,
                    C_BIZ_AREA_NM           = C_IDX++,
                    C_BIZ_AREA_FULL_NM      = C_IDX++,
                    C_BIZ_AREA_ENG_NM       = C_IDX++,
                    C_REPORT_BIZ_AREA_NM    = C_IDX++,
                    C_REPORT_BIZ_AREA_FULL_NM = C_IDX++,
                    C_REPORT_BIZ_AREA_ENG_NM = C_IDX++,
                    C_BIZ_AREA_NM_KO        = C_IDX++,
                    C_BIZ_AREA_NM_EN        = C_IDX++,
                    C_BIZ_AREA_NM_CN        = C_IDX++,
                    C_BIZ_AREA_NM_JP        = C_IDX++,
                    C_SEQ                   = C_IDX++,
                    C_OWN_RGST_NO           = C_IDX++,
                    C_REPRE_NM              = C_IDX++,
                    C_FAX_NO                = C_IDX++,
                    C_TEL_NO                = C_IDX++,
                    C_ZIP_CODE              = C_IDX++,
                    C_ADDR                  = C_IDX++,
                    C_ENG_ADDR              = C_IDX++;

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
                        cntxtBizArea.Focus();
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

                        cntxtBizArea.SetText("");
                        cntxtBizAreaName.SetText("");

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
                        ggoSpread.MakeColumns(C_ENG_ADDR);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_BIZ_AREA_CD, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Center, 5, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_NM, "<%= GetResource("CSTRESX00003") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_FULL_NM, "<%= GetResource("CSTRESX00004") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_ENG_NM, "<%= GetResource("CSTRESX00005") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_REPORT_BIZ_AREA_NM, "<%= GetResource("CSTRESX00006") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_REPORT_BIZ_AREA_FULL_NM, "<%= GetResource("CSTRESX00007") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_REPORT_BIZ_AREA_ENG_NM, "<%= GetResource("CSTRESX00008") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_NM_KO, "<%= GetResource("CSTRESX00009") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_NM_EN, "<%= GetResource("CSTRESX00010") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_NM_CN, "<%= GetResource("CSTRESX00011") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_BIZ_AREA_NM_JP, "<%= GetResource("CSTRESX00012") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_SEQ, "<%= GetResource("CSTRESX00013") %>", 8, HAlign.Center, 5, CellKind.Required);
                        ggoSpread.SSSetEdit(C_OWN_RGST_NO, "<%= GetResource("CSTRESX00014") %>", 13, HAlign.Left, 12, CellKind.Required);
                        ggoSpread.SSSetEdit(C_REPRE_NM, "<%= GetResource("CSTRESX00015") %>", 10, HAlign.Left, 10, CellKind.Required);
                        ggoSpread.SSSetEdit(C_FAX_NO, "<%= GetResource("CSTRESX00016") %>", 10, HAlign.Left, 13, CellKind.Default);
                        ggoSpread.SSSetEdit(C_TEL_NO, "<%= GetResource("CSTRESX00017") %>", 10, HAlign.Left, 13, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ZIP_CODE, "<%= GetResource("CSTRESX00018") %>", 8, HAlign.Center, 10, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ADDR, "<%= GetResource("CSTRESX00019") %>", 40, HAlign.Left, 500, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ENG_ADDR, "<%= GetResource("CSTRESX00020") %>", 40, HAlign.Left, 500, CellKind.Required);

                        ggoSpread.SSSetColHidden(C_ENG_ADDR + 1, C_ENG_ADDR + 1, true);

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

                            var strP1 = cntxtBizArea.GetText();

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
                        ggoSpread.SpreadRequired(C_BIZ_AREA_CD, activeRow);

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

                this.cntxtBizArea_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_BIZ_AREA", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtBizAreaName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtBizAreaName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtBizAreaName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtBizAreaName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtBizArea_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00021")%>";
                        popArgs.AddColumn("BIZ_AREA_CD", "<%= GetResource("CSTRESX00002")%>", 10);
                        popArgs.AddColumn("BIZ_AREA_NM_<%= lgLang %> BIZ_AREA_NM", "<%= GetResource("CSTRESX00003")%>", 15);
                        popArgs.From = "S_BIZ_AREA";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtBizArea.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_CD"]);
                            cntxtBizAreaName.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_NM"]);
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
                                            cntxtBizArea.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cntxtBizArea.Focus();
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
                            BIZ_AREA_CD: strP1,
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
                        var tbData = dsData.CreateDataTable("B3000MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("BIZ_AREA_CD");
                        tbData.AddColumn("BIZ_AREA_NM");
                        tbData.AddColumn("BIZ_AREA_FULL_NM");
                        tbData.AddColumn("BIZ_AREA_ENG_NM");
                        tbData.AddColumn("REPORT_BIZ_AREA_NM");
                        tbData.AddColumn("REPORT_BIZ_AREA_FULL_NM");
                        tbData.AddColumn("REPORT_BIZ_AREA_ENG_NM");
                        tbData.AddColumn("BIZ_AREA_NM_KO");
                        tbData.AddColumn("BIZ_AREA_NM_EN");
                        tbData.AddColumn("BIZ_AREA_NM_CN");
                        tbData.AddColumn("BIZ_AREA_NM_JP");
                        tbData.AddColumn("SEQ");
                        tbData.AddColumn("OWN_RGST_NO");
                        tbData.AddColumn("REPRE_NM");
                        tbData.AddColumn("FAX_NO");
                        tbData.AddColumn("ZIP_CODE");
                        tbData.AddColumn("TEL_NO");
                        tbData.AddColumn("ADDR");
                        tbData.AddColumn("ENG_ADDR");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.BIZ_AREA_NM = ggoSpread.GetText(C_BIZ_AREA_NM, i, true);
                                    nRow.BIZ_AREA_FULL_NM = ggoSpread.GetText(C_BIZ_AREA_FULL_NM, i, true);
                                    nRow.BIZ_AREA_ENG_NM = ggoSpread.GetText(C_BIZ_AREA_ENG_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_FULL_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_FULL_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_ENG_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_ENG_NM, i, true);
                                    nRow.BIZ_AREA_NM_KO = ggoSpread.GetText(C_BIZ_AREA_NM_KO, i, true);
                                    nRow.BIZ_AREA_NM_EN = ggoSpread.GetText(C_BIZ_AREA_NM_EN, i, true);
                                    nRow.BIZ_AREA_NM_CN = ggoSpread.GetText(C_BIZ_AREA_NM_CN, i, true);
                                    nRow.BIZ_AREA_NM_JP = ggoSpread.GetText(C_BIZ_AREA_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.OWN_RGST_NO = ggoSpread.GetText(C_OWN_RGST_NO, i, true);
                                    nRow.REPRE_NM = ggoSpread.GetText(C_REPRE_NM, i, true);
                                    nRow.FAX_NO = ggoSpread.GetText(C_FAX_NO, i, true);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, true);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, true);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, true);
                                    nRow.ENG_ADDR = ggoSpread.GetText(C_ENG_ADDR, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.BIZ_AREA_NM = ggoSpread.GetText(C_BIZ_AREA_NM, i, true);
                                    nRow.BIZ_AREA_FULL_NM = ggoSpread.GetText(C_BIZ_AREA_FULL_NM, i, true);
                                    nRow.BIZ_AREA_ENG_NM = ggoSpread.GetText(C_BIZ_AREA_ENG_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_FULL_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_FULL_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_ENG_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_ENG_NM, i, true);
                                    nRow.BIZ_AREA_NM_KO = ggoSpread.GetText(C_BIZ_AREA_NM_KO, i, true);
                                    nRow.BIZ_AREA_NM_EN = ggoSpread.GetText(C_BIZ_AREA_NM_EN, i, true);
                                    nRow.BIZ_AREA_NM_CN = ggoSpread.GetText(C_BIZ_AREA_NM_CN, i, true);
                                    nRow.BIZ_AREA_NM_JP = ggoSpread.GetText(C_BIZ_AREA_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.OWN_RGST_NO = ggoSpread.GetText(C_OWN_RGST_NO, i, true);
                                    nRow.REPRE_NM = ggoSpread.GetText(C_REPRE_NM, i, true);
                                    nRow.FAX_NO = ggoSpread.GetText(C_FAX_NO, i, true);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, true);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, true);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, true);
                                    nRow.ENG_ADDR = ggoSpread.GetText(C_ENG_ADDR, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.BIZ_AREA_NM = ggoSpread.GetText(C_BIZ_AREA_NM, i, true);
                                    nRow.BIZ_AREA_FULL_NM = ggoSpread.GetText(C_BIZ_AREA_FULL_NM, i, true);
                                    nRow.BIZ_AREA_ENG_NM = ggoSpread.GetText(C_BIZ_AREA_ENG_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_FULL_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_FULL_NM, i, true);
                                    nRow.REPORT_BIZ_AREA_ENG_NM = ggoSpread.GetText(C_REPORT_BIZ_AREA_ENG_NM, i, true);
                                    nRow.BIZ_AREA_NM_KO = ggoSpread.GetText(C_BIZ_AREA_NM_KO, i, true);
                                    nRow.BIZ_AREA_NM_EN = ggoSpread.GetText(C_BIZ_AREA_NM_EN, i, true);
                                    nRow.BIZ_AREA_NM_CN = ggoSpread.GetText(C_BIZ_AREA_NM_CN, i, true);
                                    nRow.BIZ_AREA_NM_JP = ggoSpread.GetText(C_BIZ_AREA_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.OWN_RGST_NO = ggoSpread.GetText(C_OWN_RGST_NO, i, true);
                                    nRow.REPRE_NM = ggoSpread.GetText(C_REPRE_NM, i, true);
                                    nRow.FAX_NO = ggoSpread.GetText(C_FAX_NO, i, true);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, true);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, true);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, true);
                                    nRow.ENG_ADDR = ggoSpread.GetText(C_ENG_ADDR, i, true);
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
                                                        <span class="CAP" onclick="cntxtBizArea.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtBizArea" ClientInstanceName="cntxtBizArea" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtBizArea_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtBizArea_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP"></span>
                                                    </th>
                                                    <td class="TD4F"></td>
                                                </tr>
                                            </table>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1DataMulti">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData"  runat="server">
                                                <ClientSideEvents   TopLeftChange="eni.LocalPage.vspdData_TopLeftChange" />
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