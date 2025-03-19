<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="N0000MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.N0.N0000MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : N0000MA1.aspx
    *  4. Program Name         : 게시판관리
    *  5. Program Desc         : 게시판관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2017-12-08
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
        tabMain                     = ASPxClientTabControl.Cast();
        tab1Layout                  = ASPxClientSplitter.Cast();
        frmLayout                   = ASPxClientFormLayout.prototype;
        cntxtCategoryCd             = ASPxClientTextBox.Cast();
        cntxtCategoryCdName         = ASPxClientTextBox.Cast();
        cntxtParentCategoryCd       = ASPxClientTextBox.Cast();
        cntxtParentCategoryCdName   = ASPxClientTextBox.Cast();
        cboCategoryType             = ASPxClientComboBox.Cast();
        cntxtRouteId                = ASPxClientTextBox.Cast();
        cntxtRouteIdName            = ASPxClientTextBox.Cast();
        vspdDataCbProcess           = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var N0000MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_CATEGORY_CD           = C_IDX++,
                    C_CATEGORY_NM           = C_IDX++,
                    C_PARENT_CATEGORY_CD    = C_IDX++,
                    C_PARENT_CATEGORY_BP    = C_IDX++,
                    C_PARENT_CATEGORY_NM    = C_IDX++,
                    C_CATEGORY_DES          = C_IDX++,
                    C_CATEGORY_NM_KO        = C_IDX++,
                    C_CATEGORY_NM_EN        = C_IDX++,
                    C_CATEGORY_NM_CN        = C_IDX++,
                    C_CATEGORY_NM_JP        = C_IDX++,
                    C_CATEGORY_TYPE         = C_IDX++,
                    C_CATEGORY_TYPE_NM      = C_IDX++,
                    C_CATEGORY_LVL          = C_IDX++,
                    C_CATEGORY_SEQ          = C_IDX++,
                    C_MENU_SEQ              = C_IDX++,
                    C_ROUTE_ID              = C_IDX++,
                    C_ROUTE_BP              = C_IDX++,
                    C_ROUTE_NM              = C_IDX++,
                    C_SYSTEM_BBS            = C_IDX++,
                    C_USE_SEARCH_YN         = C_IDX++,
                    C_USE_RIGHT_MOUSE_YN    = C_IDX++,
                    C_USE_COMMENT_YN        = C_IDX++,
                    C_USE_SECRET_YN         = C_IDX++,
                    C_USE_ATT_FILE_YN       = C_IDX++,
                    C_USE_ATT_FILE_PHOTO_YN = C_IDX++,
                    C_USE_ATT_FILE_VIDEO_YN = C_IDX++,
                    C_ATT_FILE_CNT          = C_IDX++,
                    C_ATT_FILE_SIZE         = C_IDX++,
                    C_VIRTUAL_YN            = C_IDX++,
                    C_USE_YN                = C_IDX++;

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
                        cntxtCategoryCd.Focus();
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

                        cntxtCategoryCd.SetText("");
                        cntxtCategoryCdName.SetText("");
                        cntxtParentCategoryCd.SetText("");
                        cntxtParentCategoryCdName.SetText("");
                        cboCategoryType.SetValue("");
                        cntxtRouteId.SetText("");
                        cntxtRouteIdName.SetText("");

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
                        ggoSpread.SetUserColAction(UserColAction.Sort);

                        ggoSpread.SSSetEdit(C_CATEGORY_CD, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Left, 20, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_CATEGORY_NM, "<%= GetResource("CSTRESX00003") %>", 15, HAlign.Left, 40, CellKind.Required);
                        ggoSpread.SSSetEdit(C_PARENT_CATEGORY_CD, "<%= GetResource("CSTRESX00004") %>", 12, HAlign.Left, 20, CellKind.Required, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C_PARENT_CATEGORY_BP, false, false);
                        ggoSpread.SSSetEdit(C_PARENT_CATEGORY_NM, "<%= GetResource("CSTRESX00005") %>", 15, HAlign.Left, 40, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_CATEGORY_DES, "<%= GetResource("CSTRESX00006") %>", 20, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_CATEGORY_NM_KO, "<%= GetResource("CSTRESX00007") %>", 15, HAlign.Left, 40, CellKind.Required);
                        ggoSpread.SSSetEdit(C_CATEGORY_NM_EN, "<%= GetResource("CSTRESX00008") %>", 15, HAlign.Left, 40, CellKind.Required);
                        ggoSpread.SSSetEdit(C_CATEGORY_NM_CN, "<%= GetResource("CSTRESX00009") %>", 15, HAlign.Left, 40, CellKind.Required);
                        ggoSpread.SSSetEdit(C_CATEGORY_NM_JP, "<%= GetResource("CSTRESX00010") %>", 15, HAlign.Left, 40, CellKind.Required);
                        ggoSpread.SSSetCombo(C_CATEGORY_TYPE, "<%= GetResource("CSTRESX00011") %>", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_CATEGORY_TYPE_NM, "<%= GetResource("CSTRESX00011") %>", 8, HAlign.Left, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_CATEGORY_LVL, "<%= GetResource("CSTRESX00012") %>", 8, HAlign.Center, 1, CellKind.Required);
                        ggoSpread.SSSetEdit(C_CATEGORY_SEQ, "<%= GetResource("CSTRESX00013") %>", 8, HAlign.Center, 5, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_SEQ, "<%= GetResource("CSTRESX00014") %>", 8, HAlign.Center, 5, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ROUTE_ID, "<%= GetResource("CSTRESX00015") %>", 10, HAlign.Left, 20, CellKind.Default, false);
                        ggoSpread.SSSetButton(C_ROUTE_BP, false, false);
                        ggoSpread.SSSetEdit(C_ROUTE_NM, "<%= GetResource("CSTRESX00016") %>", 18, HAlign.Left, 40, CellKind.Protected);
                        ggoSpread.SSSetCheck(C_SYSTEM_BBS, "<%= GetResource("CSTRESX00035") %>", 10);
                        ggoSpread.SSSetCheck(C_USE_SEARCH_YN, "<%= GetResource("CSTRESX00017") %>", 10);
                        ggoSpread.SSSetCheck(C_USE_RIGHT_MOUSE_YN, "<%= GetResource("CSTRESX00018") %>", 16);
                        ggoSpread.SSSetCheck(C_USE_COMMENT_YN, "<%= GetResource("CSTRESX00019") %>", 10);
                        ggoSpread.SSSetCheck(C_USE_SECRET_YN, "<%= GetResource("CSTRESX00020") %>", 11);
                        ggoSpread.SSSetCheck(C_USE_ATT_FILE_YN, "<%= GetResource("CSTRESX00021") %>", 10);
                        ggoSpread.SSSetCheck(C_USE_ATT_FILE_PHOTO_YN, "<%= GetResource("CSTRESX00022") %>", 14);
                        ggoSpread.SSSetCheck(C_USE_ATT_FILE_VIDEO_YN, "<%= GetResource("CSTRESX00023") %>", 14);
                        ggoSpread.SSSetEdit(C_ATT_FILE_CNT, "<%= GetResource("CSTRESX00024") %>", 13, HAlign.Center, 1, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ATT_FILE_SIZE, "<%= GetResource("CSTRESX00025") %>", 13, HAlign.Center, 1, CellKind.Required);
                        ggoSpread.SSSetCheck(C_VIRTUAL_YN, "<%= GetResource("CSTRESX00026") %>", 10);
                        ggoSpread.SSSetCheck(C_USE_YN, "<%= GetResource("CSTRESX00027") %>", 7);

                        ggoSpread.SSSetColHidden(C_USE_YN + 1, C_USE_YN + 1, true);

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
                    ggoSpread.Source = vspdData;
                    ggoSpread.SSetComboText(C_CATEGORY_TYPE, "P");
                    ggoSpread.SSetComboText(C_CATEGORY_TYPE, "M");
                    ggoSpread.SSetComboText(C_CATEGORY_TYPE_NM, "<%= GetResource("CSTRESX00028") %>");
                    ggoSpread.SSetComboText(C_CATEGORY_TYPE_NM, "<%= GetResource("CSTRESX00029") %>");
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

                            var strP1 = cntxtCategoryCd.GetText();
                            var strP2 = cntxtParentCategoryCd.GetText();
                            var strP3 = cboCategoryType.GetValue();
                            var strP4 = cntxtRouteId.GetText();

                            eni.LocalPage.DbQuery(strP1, strP2, strP3, strP4);
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
                        ggoSpread.SpreadRequired(C_CATEGORY_CD, activeRow);
                        ggoSpread.SpreadRequired(C_CATEGORY_NM, activeRow);
                        ggoSpread.SpreadRequired(C_CATEGORY_TYPE_NM, activeRow);
                        ggoSpread.SpreadRequired(C_CATEGORY_SEQ, activeRow);
                        ggoSpread.SpreadUnLock(C_ROUTE_ID, activeRow);
                        ggoSpread.SpreadUnLock(C_ROUTE_BP, activeRow);

                        ggoSpread.SetValue(C_CATEGORY_TYPE, activeRow, 0);
                        ggoSpread.SetValue(C_CATEGORY_TYPE_NM, activeRow, 0);
                        ggoSpread.SetValue(C_ATT_FILE_CNT, activeRow, 0);
                        ggoSpread.SetValue(C_ATT_FILE_SIZE, activeRow, 0);
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

                this.cntxtCategoryCd_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_USR_MENU", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtCategoryCdName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtCategoryCdName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtCategoryCdName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtCategoryCdName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtCategoryCd_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00028") %>";
                        popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00002") %>", 10);
                        popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00003") %>", 15);
                        popArgs.From = "S_USR_MENU";
                        popArgs.Where = "MENU_ID = 'BOARD' OR MENU_GROUP = 'BOARD'"
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtCategoryCd.SetText(arry.Tables[0].Rows[0]["MENU_ID"]);
                            cntxtCategoryCdName.SetText(arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtParentCategoryCd_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_USR_MENU", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtParentCategoryCdName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtParentCategoryCdName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtParentCategoryCdName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtParentCategoryCdName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtParentCategoryCd_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00030") %>";
                        popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00004") %>", 10);
                        popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00005") %>", 15);
                        popArgs.From = "S_USR_MENU";
                        popArgs.Where = "MENU_ID = 'BOARD' OR MENU_GROUP = 'BOARD'"
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtParentCategoryCd.SetText(arry.Tables[0].Rows[0]["MENU_ID"]);
                            cntxtParentCategoryCdName.SetText(arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtRouteId_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_ROUTE_HDR", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtRouteIdName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtRouteIdName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtRouteIdName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtRouteIdName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtRouteId_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00031") %>";
                        popArgs.AddColumn("ROUTE_ID", "<%= GetResource("CSTRESX00015") %>", 10);
                        popArgs.AddColumn("ROUTE_NAME_" + lgLang, "<%= GetResource("CSTRESX00016") %>", 15);
                        popArgs.From = "S_ROUTE_HDR";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtRouteId.SetText(arry.Tables[0].Rows[0]["ROUTE_ID"]);
                            cntxtRouteIdName.SetText(arry.Tables[0].Rows[0]["ROUTE_NAME_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        ggoSpread.Source = pSender;

                        switch (pCol) {
                            case C_PARENT_CATEGORY_CD:
                                lgStrSql = "";
                                lgStrSql += " SELECT MENU_ID, MENU_NM_" + lgLang + " FROM S_USR_MENU ";
                                lgStrSql += " WHERE MENU_ID = " + eni.Data.FilterVariable(ggoSpread.GetText(pCol, pRow));
                                lgStrSql += " AND (MENU_ID = 'BOARD' OR MENU_GROUP = 'BOARD') "

                                var result = eni.DbAccess.ExecuteDataSet(lgStrSql, "S_USR_MENU");
                                if (result.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), result.Message);
                                } else {
                                    if (result.DataSet.S_USR_MENU && result.DataSet.S_USR_MENU.length > 0) {
                                        ggoSpread.SetText(C_PARENT_CATEGORY_NM, pRow, result.DataSet.S_USR_MENU[0]["MENU_NM_" + lgLang]);
                                    } else {
                                        ggoSpread.SetText(C_PARENT_CATEGORY_CD, pRow, "");
                                        ggoSpread.SetText(C_PARENT_CATEGORY_NM, pRow, "");
                                    }
                                }
                                break;
                            case C_ROUTE_ID:
                                lgStrSql = "";
                                lgStrSql += " SELECT ROUTE_ID, ROUTE_NAME_" + lgLang + " FROM S_ROUTE_HDR ";
                                lgStrSql += " WHERE ROUTE_ID = " + eni.Data.FilterVariable(ggoSpread.GetText(pCol, pRow));
                                lgStrSql += " AND ROUTE_TYPE = 'S' "

                                var result = eni.DbAccess.ExecuteDataSet(lgStrSql, "S_ROUTE_HDR");
                                if (result.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), result.Message);
                                } else {
                                    if (result.DataSet.S_ROUTE_HDR && result.DataSet.S_ROUTE_HDR.length > 0) {
                                        ggoSpread.SetText(C_ROUTE_NM, pRow, result.DataSet.S_ROUTE_HDR[0]["ROUTE_NAME_" + lgLang]);
                                    } else {
                                        ggoSpread.SetText(C_ROUTE_ID, pRow, "");
                                        ggoSpread.SetText(C_ROUTE_NM, pRow, "");
                                    }
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_ButtonClick = function (pSender, pCol, pRow) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();

                        switch (pCol) {
                            case C_PARENT_CATEGORY_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00016") %>";
                                popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00016") %>", 10);
                                popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00016") %>", 15);
                                popArgs.From = "S_USR_MENU";
                                popArgs.Where = "(MENU_ID = 'BOARD' OR MENU_GROUP = 'BOARD') AND USE_YN = 'Y' ";
                                popArgs.WinSize = new WindowSize(400, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SetText(C_PARENT_CATEGORY_CD, pRow, arry.Tables[0].Rows[0]["MENU_ID"]);
                                    ggoSpread.SetText(C_PARENT_CATEGORY_NM, pRow, arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                                    ggoSpread.UpdateRow(pRow);
                                }
                                break;
                            case C_ROUTE_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00031") %>";
                                popArgs.AddColumn("ROUTE_ID", "<%= GetResource("CSTRESX00015") %>", 10);
                                popArgs.AddColumn("ROUTE_NAME_" + lgLang, "<%= GetResource("CSTRESX00016") %>", 15);
                                popArgs.AddColumn("ROUTE_DES", "<%= GetResource("CSTRESX00032") %>", 20);
                                popArgs.AddColumn("ROUTE_URL", "URL", 20);
                                popArgs.AddColumn("VIR_PATH", "<%= GetResource("CSTRESX00033") %>", 50);
                                popArgs.From = "S_ROUTE_HDR";
                                popArgs.Where = "ROUTE_TYPE = 'S'";
                                popArgs.WinSize = new WindowSize(700, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SetText(C_ROUTE_ID, pRow, arry.Tables[0].Rows[0]["ROUTE_ID"]);
                                    ggoSpread.SetText(C_ROUTE_NM, pRow, arry.Tables[0].Rows[0]["ROUTE_NAME_" + lgLang]);
                                    ggoSpread.UpdateRow(pRow);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_ComboSelChange = function (pSender, pCol, pRow) {
                    try {
                        ggoSpread.Source = vspdData;

                        switch (pCol) {
                            case C_CATEGORY_TYPE:
                                ggoSpread.SetValue(C_CATEGORY_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow));
                                break;
                            case C_CATEGORY_TYPE_NM:
                                ggoSpread.SetValue(C_CATEGORY_TYPE, pRow, ggoSpread.GetValue(pCol, pRow));
                                if (ggoSpread.GetValue(pCol, pRow) == "1") {
                                    ggoSpread.SpreadLock(C_PARENT_CATEGORY_CD, pRow, C_PARENT_CATEGORY_BP, pRow);
                                    ggoSpread.SetValue(C_PARENT_CATEGORY_CD, pRow, "BOARD");
                                    eni.LocalPage.vspdData_Change(pSender, C_PARENT_CATEGORY_CD, pRow);
                                    ggoSpread.SpreadLock(C_CATEGORY_SEQ, pRow);
                                    ggoSpread.SpreadLock(C_ROUTE_ID, pRow, C_VIRTUAL_YN, pRow);
                                    ggoSpread.SetValue(C_CATEGORY_SEQ, pRow, "");
                                    ggoSpread.SetValue(C_ROUTE_ID, pRow, "");
                                    ggoSpread.SetValue(C_ROUTE_NM, pRow, "");
                                    ggoSpread.SetValue(C_SYSTEM_BBS, pRow, "0");
                                    ggoSpread.SetValue(C_USE_SEARCH_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_RIGHT_MOUSE_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_COMMENT_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_SECRET_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_ATT_FILE_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_ATT_FILE_PHOTO_YN, pRow, "0");
                                    ggoSpread.SetValue(C_USE_ATT_FILE_VIDEO_YN, pRow, "0");
                                    ggoSpread.SetValue(C_ATT_FILE_CNT, pRow, "");
                                    ggoSpread.SetValue(C_ATT_FILE_SIZE, pRow, "");
                                    ggoSpread.SetValue(C_VIRTUAL_YN, pRow, "0");
                                } else {
                                    ggoSpread.SpreadRequired(C_PARENT_CATEGORY_CD, pRow);
                                    ggoSpread.SpreadUnLock(C_PARENT_CATEGORY_BP, pRow, C_PARENT_CATEGORY_BP, pRow);
                                    ggoSpread.SetValue(C_PARENT_CATEGORY_CD, pRow, "");
                                    ggoSpread.SpreadRequired(C_CATEGORY_SEQ, pRow);
                                    ggoSpread.SpreadUnLock(C_ROUTE_ID, pRow, C_VIRTUAL_YN, pRow);
                                    ggoSpread.SpreadLock(C_ROUTE_NM, pRow);
                                    ggoSpread.SpreadRequired(C_ATT_FILE_CNT, pRow, C_ATT_FILE_SIZE, pRow);
                                    ggoSpread.SetValue(C_ATT_FILE_CNT, pRow, "0");
                                    ggoSpread.SetValue(C_ATT_FILE_SIZE, pRow, "0");
                                }
                                break;
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

                                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                                            if (ggoSpread.GetText(C_CATEGORY_TYPE, i, false) === "M") {
                                                ggoSpread.SpreadLock(C_PARENT_CATEGORY_CD, i, C_PARENT_CATEGORY_BP, i);
                                                ggoSpread.SpreadLock(C_CATEGORY_LVL, i, C_CATEGORY_SEQ, i);
                                                ggoSpread.SpreadLock(C_ROUTE_ID, i, C_VIRTUAL_YN, i);
                                            }
                                        }

                                        if (callbackResult.PageNo) {
                                            lgPageNo = callbackResult.PageNo;
                                        } else {
                                            lgPageNo = "";
                                        }
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                            cntxtCategoryCd.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cntxtCategoryCd.Focus();
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
                        eni.Loading.DisplayLoadingAll(false);
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
                            CATEGORY_CD: strP1,
                            PARENT_CATEGORY_CD: strP2,
                            CATEGORY_TYPE: strP3,
                            ROUTE_ID: strP4,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                        hidFields.Set("strP2", strP2);
                        hidFields.Set("strP3", strP3);
                        hidFields.Set("strP4", strP4);
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
                        eni.DisableToolBar();

                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbSave";

                        var dsData = new DataSetClass();
                        var tbData = dsData.CreateDataTable("N0000MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("CATEGORY_CD");
                        tbData.AddColumn("CATEGORY_NM");
                        tbData.AddColumn("PARENT_CATEGORY_CD");
                        tbData.AddColumn("CATEGORY_DES");
                        tbData.AddColumn("CATEGORY_NM_KO");
                        tbData.AddColumn("CATEGORY_NM_EN");
                        tbData.AddColumn("CATEGORY_NM_CN");
                        tbData.AddColumn("CATEGORY_NM_JP");
                        tbData.AddColumn("CATEGORY_TYPE");
                        tbData.AddColumn("CATEGORY_LVL");
                        tbData.AddColumn("CATEGORY_SEQ");
                        tbData.AddColumn("MENU_SEQ");
                        tbData.AddColumn("ROUTE_ID");
                        tbData.AddColumn("SYSTEM_BBS");
                        tbData.AddColumn("USE_SEARCH_YN");
                        tbData.AddColumn("USE_RIGHT_MOUSE_YN");
                        tbData.AddColumn("USE_COMMENT_YN");
                        tbData.AddColumn("USE_SECRET_YN");
                        tbData.AddColumn("USE_ATT_FILE_YN");
                        tbData.AddColumn("USE_ATT_FILE_PHOTO_YN");
                        tbData.AddColumn("USE_ATT_FILE_VIDEO_YN");
                        tbData.AddColumn("ATT_FILE_CNT");
                        tbData.AddColumn("ATT_FILE_SIZE");
                        tbData.AddColumn("VIRTUAL_YN");
                        tbData.AddColumn("USE_YN");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.CATEGORY_CD = ggoSpread.GetText(C_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_NM = ggoSpread.GetText(C_CATEGORY_NM, i, true);
                                    nRow.PARENT_CATEGORY_CD = ggoSpread.GetText(C_PARENT_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_DES = ggoSpread.GetText(C_CATEGORY_DES, i, true);
                                    nRow.CATEGORY_NM_KO = ggoSpread.GetText(C_CATEGORY_NM_KO, i, true);
                                    nRow.CATEGORY_NM_EN = ggoSpread.GetText(C_CATEGORY_NM_EN, i, true);
                                    nRow.CATEGORY_NM_CN = ggoSpread.GetText(C_CATEGORY_NM_CN, i, true);
                                    nRow.CATEGORY_NM_JP = ggoSpread.GetText(C_CATEGORY_NM_JP, i, true);
                                    nRow.CATEGORY_TYPE = ggoSpread.GetText(C_CATEGORY_TYPE, i, true);
                                    nRow.CATEGORY_LVL = ggoSpread.GetText(C_CATEGORY_LVL, i, true);
                                    nRow.CATEGORY_SEQ = ggoSpread.GetText(C_CATEGORY_SEQ, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
                                    if (ggoSpread.GetText(C_SYSTEM_BBS, i) === "1") {
                                        nRow.SYSTEM_BBS = "Y";
                                    } else {
                                        nRow.SYSTEM_BBS = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SEARCH_YN, i) === "1") {
                                        nRow.USE_SEARCH_YN = "Y";
                                    }else {
                                        nRow.USE_SEARCH_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_RIGHT_MOUSE_YN, i) === "1") {
                                        nRow.USE_RIGHT_MOUSE_YN = "Y";
                                    } else {
                                        nRow.USE_RIGHT_MOUSE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_COMMENT_YN, i) === "1") {
                                        nRow.USE_COMMENT_YN = "Y";
                                    } else {
                                        nRow.USE_COMMENT_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SECRET_YN, i) === "1") {
                                        nRow.USE_SECRET_YN = "Y";
                                    } else {
                                        nRow.USE_SECRET_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_PHOTO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_VIDEO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "N";
                                    }
                                    nRow.ATT_FILE_CNT = ggoSpread.GetText(C_ATT_FILE_CNT, i, true);
                                    if (nRow.ATT_FILE_CNT == "") {
                                        nRow.ATT_FILE_CNT = 0;
                                    }
                                    nRow.ATT_FILE_SIZE = ggoSpread.GetText(C_ATT_FILE_SIZE, i, true);
                                    if (nRow.ATT_FILE_SIZE == "") {
                                        nRow.ATT_FILE_SIZE = 0;
                                    }
                                    if (ggoSpread.GetText(C_VIRTUAL_YN, i) === "1") {
                                        nRow.VIRTUAL_YN = "Y";
                                    } else {
                                        nRow.VIRTUAL_YN = "N";
                                    }
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
                                    nRow.CATEGORY_CD = ggoSpread.GetText(C_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_NM = ggoSpread.GetText(C_CATEGORY_NM, i, true);
                                    nRow.PARENT_CATEGORY_CD = ggoSpread.GetText(C_PARENT_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_DES = ggoSpread.GetText(C_CATEGORY_DES, i, true);
                                    nRow.CATEGORY_NM_KO = ggoSpread.GetText(C_CATEGORY_NM_KO, i, true);
                                    nRow.CATEGORY_NM_EN = ggoSpread.GetText(C_CATEGORY_NM_EN, i, true);
                                    nRow.CATEGORY_NM_CN = ggoSpread.GetText(C_CATEGORY_NM_CN, i, true);
                                    nRow.CATEGORY_NM_JP = ggoSpread.GetText(C_CATEGORY_NM_JP, i, true);
                                    nRow.CATEGORY_TYPE = ggoSpread.GetText(C_CATEGORY_TYPE, i, true);
                                    nRow.CATEGORY_LVL = ggoSpread.GetText(C_CATEGORY_LVL, i, true);
                                    nRow.CATEGORY_SEQ = ggoSpread.GetText(C_CATEGORY_SEQ, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
                                    if (ggoSpread.GetText(C_SYSTEM_BBS, i) === "1") {
                                        nRow.SYSTEM_BBS = "Y";
                                    } else {
                                        nRow.SYSTEM_BBS = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SEARCH_YN, i) === "1") {
                                        nRow.USE_SEARCH_YN = "Y";
                                    } else {
                                        nRow.USE_SEARCH_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_RIGHT_MOUSE_YN, i) === "1") {
                                        nRow.USE_RIGHT_MOUSE_YN = "Y";
                                    } else {
                                        nRow.USE_RIGHT_MOUSE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_COMMENT_YN, i) === "1") {
                                        nRow.USE_COMMENT_YN = "Y";
                                    } else {
                                        nRow.USE_COMMENT_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SECRET_YN, i) === "1") {
                                        nRow.USE_SECRET_YN = "Y";
                                    } else {
                                        nRow.USE_SECRET_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_PHOTO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_VIDEO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "N";
                                    }
                                    nRow.ATT_FILE_CNT = ggoSpread.GetText(C_ATT_FILE_CNT, i, true);
                                    if (nRow.ATT_FILE_CNT == "") {
                                        nRow.ATT_FILE_CNT = 0;
                                    }
                                    nRow.ATT_FILE_SIZE = ggoSpread.GetText(C_ATT_FILE_SIZE, i, true);
                                    if (nRow.ATT_FILE_SIZE == "") {
                                        nRow.ATT_FILE_SIZE = 0;
                                    }
                                    if (ggoSpread.GetText(C_VIRTUAL_YN, i) === "1") {
                                        nRow.VIRTUAL_YN = "Y";
                                    } else {
                                        nRow.VIRTUAL_YN = "N";
                                    }
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
                                    nRow.CATEGORY_CD = ggoSpread.GetText(C_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_NM = ggoSpread.GetText(C_CATEGORY_NM, i, true);
                                    nRow.PARENT_CATEGORY_CD = ggoSpread.GetText(C_PARENT_CATEGORY_CD, i, true);
                                    nRow.CATEGORY_DES = ggoSpread.GetText(C_CATEGORY_DES, i, true);
                                    nRow.CATEGORY_NM_KO = ggoSpread.GetText(C_CATEGORY_NM_KO, i, true);
                                    nRow.CATEGORY_NM_EN = ggoSpread.GetText(C_CATEGORY_NM_EN, i, true);
                                    nRow.CATEGORY_NM_CN = ggoSpread.GetText(C_CATEGORY_NM_CN, i, true);
                                    nRow.CATEGORY_NM_JP = ggoSpread.GetText(C_CATEGORY_NM_JP, i, true);
                                    nRow.CATEGORY_TYPE = ggoSpread.GetText(C_CATEGORY_TYPE, i, true);
                                    nRow.CATEGORY_LVL = ggoSpread.GetText(C_CATEGORY_LVL, i, true);
                                    nRow.CATEGORY_SEQ = ggoSpread.GetText(C_CATEGORY_SEQ, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
                                    if (ggoSpread.GetText(C_SYSTEM_BBS, i) === "1") {
                                        nRow.SYSTEM_BBS = "Y";
                                    } else {
                                        nRow.SYSTEM_BBS = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SEARCH_YN, i) === "1") {
                                        nRow.USE_SEARCH_YN = "Y";
                                    } else {
                                        nRow.USE_SEARCH_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_RIGHT_MOUSE_YN, i) === "1") {
                                        nRow.USE_RIGHT_MOUSE_YN = "Y";
                                    } else {
                                        nRow.USE_RIGHT_MOUSE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_COMMENT_YN, i) === "1") {
                                        nRow.USE_COMMENT_YN = "Y";
                                    } else {
                                        nRow.USE_COMMENT_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_SECRET_YN, i) === "1") {
                                        nRow.USE_SECRET_YN = "Y";
                                    } else {
                                        nRow.USE_SECRET_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_PHOTO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_PHOTO_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_ATT_FILE_VIDEO_YN, i) === "1") {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "Y";
                                    } else {
                                        nRow.USE_ATT_FILE_VIDEO_YN = "N";
                                    }
                                    nRow.ATT_FILE_CNT = ggoSpread.GetText(C_ATT_FILE_CNT, i, true);
                                    if (nRow.ATT_FILE_CNT == "") {
                                        nRow.ATT_FILE_CNT = 0;
                                    }
                                    nRow.ATT_FILE_SIZE = ggoSpread.GetText(C_ATT_FILE_SIZE, i, true);
                                    if (nRow.ATT_FILE_SIZE == "") {
                                        nRow.ATT_FILE_SIZE = 0;
                                    }
                                    if (ggoSpread.GetText(C_VIRTUAL_YN, i) === "1") {
                                        nRow.VIRTUAL_YN = "Y";
                                    } else {
                                        nRow.VIRTUAL_YN = "N";
                                    }
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
                                <dx:SplitterPane Name="tab1Con" Size="60px">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <table class="BSL01TB" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtCategoryCd.Focus()"><%= GetResource("CSTRESX00028")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtCategoryCd" ClientInstanceName="cntxtCategoryCd" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtCategoryCd_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtCategoryCd_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtParentCategoryCd.Focus()"><%= GetResource("CSTRESX00030")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtParentCategoryCd" ClientInstanceName="cntxtParentCategoryCd" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtParentCategoryCd_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtParentCategoryCd_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cboCategoryType.Focus()"><%= GetResource("CSTRESX00034")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniComboBox ID="cboCategoryType" ClientInstanceName="cboCategoryType" runat="server" SkinID="BSL" EnterActionQuery="true">
                                                            <ClearButton Visibility="True"></ClearButton>
                                                            <Items>
                                                                <dx:ListEditItem Value="P" Text="게시판"/>
                                                                <dx:ListEditItem Value="M" Text="메뉴"/>
                                                            </Items>
                                                        </eni:eniComboBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtRouteId.Focus()"><%= GetResource("CSTRESX00031")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtRouteId" ClientInstanceName="cntxtRouteId" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtRouteId_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtRouteId_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1DataMulti">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData"  runat="server">
                                                <ClientSideEvents TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
                                                                Change="eni.LocalPage.vspdData_Change" 
                                                                ButtonClicked="eni.LocalPage.vspdData_ButtonClick"
                                                                ComboSelChange="eni.LocalPage.vspdData_ComboSelChange" />
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
        <ClientSideEvents  BeginCallback="eni.LocalPage.vspdDataCbProcess_BeginCallback" 
            CallbackComplete="eni.LocalPage.vspdDataCbProcess_CallbackComplete" 
            CallbackError="eni.LocalPage.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>