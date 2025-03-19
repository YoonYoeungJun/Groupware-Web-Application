<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B2002MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B2.B2002MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B2002MA1.aspx
    *  4. Program Name         : 시스템메뉴정보관리
    *  5. Program Desc         : 시스템메뉴정보관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2016-04-18
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
        chkUniCode          = ASPxClientCheckBox.Cast();
        tabMain             = ASPxClientTabControl.Cast();
        tab1Layout          = ASPxClientSplitter.Cast();
        frmLayout           = ASPxClientFormLayout.prototype;
        cntxtMenuId         = ASPxClientTextBox.Cast();
        cntxtMenuIdName     = ASPxClientTextBox.Cast();
        cntxtParentMenuId   = ASPxClientTextBox.Cast();
        cntxtParentMenuIdName = ASPxClientTextBox.Cast();
        //cboMenuGroup      = ASPxClientComboBox.Cast();
        cboMenuType         = ASPxClientComboBox.Cast();
        cntxtRouteId        = ASPxClientTextBox.Cast();
        cntxtRouteIdName    = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B2002MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_MENU_ID           = C_IDX++,
                    C_MENU_NM           = C_IDX++,
                    C_PARENT_MENU_ID    = C_IDX++,
                    C_PARENT_MENU_BP    = C_IDX++,
                    C_PARENT_MENU_NM    = C_IDX++,
                    C_MENU_DES          = C_IDX++,
                    C_MENU_NM_KO        = C_IDX++,
                    C_MENU_DES_KO       = C_IDX++,
                    C_MENU_NM_EN        = C_IDX++,
                    C_MENU_DES_EN       = C_IDX++,
                    C_MENU_NM_CN        = C_IDX++,
                    C_MENU_DES_CN       = C_IDX++,
                    C_MENU_NM_JP        = C_IDX++,
                    C_MENU_DES_JP       = C_IDX++,
                    //C_MENU_GROUP        = C_IDX++,
                    //C_MENU_GROUP_NM     = C_IDX++,
                    C_MENU_TYPE         = C_IDX++,
                    C_MENU_TYPE_NM      = C_IDX++,
                    C_MENU_LVL          = C_IDX++,
                    C_MENU_SEQ          = C_IDX++,
                    C_ROUTE_ID          = C_IDX++,
                    C_ROUTE_BP          = C_IDX++,
                    C_ROUTE_NM          = C_IDX++,
                    C_USE_YN            = C_IDX++;

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
                        cntxtMenuId.Focus();
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
                        eni.SetToolbar("1101110011100000");

                        cntxtMenuId.SetText("");
                        cntxtMenuIdName.SetText("");
                        cntxtParentMenuId.SetText("");
                        cntxtParentMenuIdName.SetText("");
                        //cboMenuGroup.SetValue(null);
                        cboMenuType.SetValue(null);
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

                        ggoSpread.SSSetEdit(C_MENU_ID, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Left, 20, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_MENU_NM, "<%= GetResource("CSTRESX00003") %>", 20, HAlign.Left, 60, CellKind.Required);
                        ggoSpread.SSSetEdit(C_PARENT_MENU_ID, "<%= GetResource("CSTRESX00004") %>", 10, HAlign.Left, 20, CellKind.Default, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C_PARENT_MENU_BP, false, false);
                        ggoSpread.SSSetEdit(C_PARENT_MENU_NM, "<%= GetResource("CSTRESX00005") %>", 20, HAlign.Left, 60, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_MENU_DES, "<%= GetResource("CSTRESX00010") %>", 25, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_MENU_NM_KO, "<%= GetResource("CSTRESX00011") %>", 20, HAlign.Left, 60, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_DES_KO, "<%= GetResource("CSTRESX00012") %>", 25, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_MENU_NM_EN, "<%= GetResource("CSTRESX00013") %>", 20, HAlign.Left, 60, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_DES_EN, "<%= GetResource("CSTRESX00014") %>", 25, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_MENU_NM_CN, "<%= GetResource("CSTRESX00015") %>", 20, HAlign.Left, 60, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_DES_CN, "<%= GetResource("CSTRESX00016") %>", 25, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_MENU_NM_JP, "<%= GetResource("CSTRESX00017") %>", 20, HAlign.Left, 60, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_DES_JP, "<%= GetResource("CSTRESX00018") %>", 25, HAlign.Left, 100, CellKind.Default);
                        <%--ggoSpread.SSSetCombo(C_MENU_GROUP, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_MENU_GROUP_NM, "<%= GetResource("CSTRESX00019") %>", 10, HAlign.Left, CellKind.Protected);--%>
                        ggoSpread.SSSetCombo(C_MENU_TYPE, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_MENU_TYPE_NM, "<%= GetResource("CSTRESX00020") %>", 8, HAlign.Left, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_MENU_LVL, "<%= GetResource("CSTRESX00021") %>", 7, HAlign.Center, 1, CellKind.Required);
                        ggoSpread.SSSetEdit(C_MENU_SEQ, "<%= GetResource("CSTRESX00022") %>", 8, HAlign.Center, 5, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ROUTE_ID, "<%= GetResource("CSTRESX00023") %>", 10, HAlign.Left, 20, CellKind.Default, false);
                        ggoSpread.SSSetButton(C_ROUTE_BP, false, false);
                        ggoSpread.SSSetEdit(C_ROUTE_NM, "<%= GetResource("CSTRESX00024") %>", 18, HAlign.Left, 40, CellKind.Protected);
                        ggoSpread.SSSetCheck(C_USE_YN, "<%= GetResource("CSTRESX00025") %>", 7);

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
                    ggoSpread.SSetComboText(C_MENU_TYPE, "P");
                    ggoSpread.SSetComboText(C_MENU_TYPE, "M");
                    ggoSpread.SSetComboText(C_MENU_TYPE_NM, "<%= GetResource("CSTRESX00026") %>");
                    ggoSpread.SSetComboText(C_MENU_TYPE_NM, "<%= GetResource("CSTRESX00027") %>");
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

                            var strP1 = cntxtMenuId.GetValue();
                            var strP2 = cntxtParentMenuId.GetValue();
                            var strP3 = cboMenuType.GetValue();
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
                        ggoSpread.SpreadRequired(C_MENU_ID, activeRow);
                        ggoSpread.SpreadRequired(C_MENU_NM, activeRow);
                        //ggoSpread.SpreadRequired(C_MENU_GROUP_NM, activeRow);
                        ggoSpread.SpreadRequired(C_MENU_TYPE_NM, activeRow);
                        ggoSpread.SpreadRequired(C_MENU_SEQ, activeRow);
                        ggoSpread.SpreadUnLock(C_ROUTE_ID, activeRow);
                        ggoSpread.SpreadUnLock(C_ROUTE_BP, activeRow);

                        //ggoSpread.SetValue(C_MENU_GROUP, activeRow, 0);
                        //ggoSpread.SetValue(C_MENU_GROUP_NM, activeRow, 0);
                        ggoSpread.SetValue(C_MENU_TYPE, activeRow, 0);
                        ggoSpread.SetValue(C_MENU_TYPE_NM, activeRow, 0);
                        ggoSpread.SetValue(C_USE_YN, activeRow, 1);

                        ggoSpread.ReDraw(true);
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //행삭제 버튼클릭시 발생합니다.
                this.OnFncDeleteRows = function () {
                    try {
                        ggoSpread.Source = lgActiveSpread;
                        if (ggoSpread.GetRowCounts() < 1) {
                            return;
                        }

                        ggoSpread.Source = lgActiveSpread;
                        ggoSpread.DeleteRows();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                //행복사 버튼클릭시 발생합니다.
                this.OnFncCopyRow = function () {
                    try {
                        ggoSpread.Source = lgActiveSpread;
                        if (ggoSpread.Source.MaxRows == 0) {
                            return;
                        } else {
                            var active_row = -1;
                            ggoSpread.ReDraw(false);
                            active_row = ggoSpread.GetActiveRow();
                            var copy_row = ggoSpread.InsertRows();
                            for (var i = 1; i < ggoSpread.Source.MaxCols + 1; i++) {
                                ggoSpread.Source.Row = active_row;
                                ggoSpread.Source.Col = i;

                                if (ggoSpread.IsRequired() || ggoSpread.IsHiddenRowCol(i)) {
                                    ggoSpread.Source.Row = copy_row;
                                    ggoSpread.Source.Text = "";
                                } else {
                                    var copy_data = ggoSpread.Source.Text;
                                    ggoSpread.Source.Row = copy_row;
                                    ggoSpread.Source.Text = copy_data;
                                }
                            }

                            ggoSpread.SpreadUnLock(1, copy_row, ggoSpread.Source.MaxCols, copy_row);

                            ggoSpread.SpreadRequired(C_MENU_ID, copy_row, C_MENU_NM, copy_row);
                            ggoSpread.SpreadLock(C_PARENT_MENU_NM, copy_row);
                            ggoSpread.SpreadRequired(C_MENU_NM_KO, copy_row);
                            ggoSpread.SpreadRequired(C_MENU_NM_EN, copy_row);
                            ggoSpread.SpreadRequired(C_MENU_NM_CN, copy_row);
                            ggoSpread.SpreadRequired(C_MENU_NM_JP, copy_row);
                            ggoSpread.SpreadRequired(C_MENU_TYPE_NM, copy_row, C_MENU_SEQ, copy_row);
                            ggoSpread.SpreadLock(C_ROUTE_NM, copy_row);

                            ggoSpread.SetValue(C_MENU_ID, copy_row, "");
                            ggoSpread.SetValue(C_MENU_NM, copy_row, ggoSpread.GetText(C_MENU_NM, active_row, false));
                            ggoSpread.SetValue(C_PARENT_MENU_ID, copy_row, ggoSpread.GetText(C_PARENT_MENU_ID, active_row, false));
                            ggoSpread.SetValue(C_PARENT_MENU_NM, copy_row, ggoSpread.GetText(C_PARENT_MENU_NM, active_row, false));
                            ggoSpread.SetValue(C_MENU_DES, copy_row, ggoSpread.GetText(C_MENU_DES, active_row, false));
                            ggoSpread.SetValue(C_MENU_NM_KO, copy_row, ggoSpread.GetText(C_MENU_NM_KO, active_row, false));
                            ggoSpread.SetValue(C_MENU_DES_KO, copy_row, ggoSpread.GetText(C_MENU_DES_KO, active_row, false));
                            ggoSpread.SetValue(C_MENU_NM_EN, copy_row, ggoSpread.GetText(C_MENU_NM_EN, active_row, false));
                            ggoSpread.SetValue(C_MENU_DES_EN, copy_row, ggoSpread.GetText(C_MENU_DES_EN, active_row, false));
                            ggoSpread.SetValue(C_MENU_NM_CN, copy_row, ggoSpread.GetText(C_MENU_NM_CN, active_row, false));
                            ggoSpread.SetValue(C_MENU_DES_CN, copy_row, ggoSpread.GetText(C_MENU_DES_CN, active_row, false));
                            ggoSpread.SetValue(C_MENU_NM_JP, copy_row, ggoSpread.GetText(C_MENU_NM_JP, active_row, false));
                            ggoSpread.SetValue(C_MENU_DES_JP, copy_row, ggoSpread.GetText(C_MENU_DES_JP, active_row, false));
                            ggoSpread.SetValue(C_ROUTE_ID, copy_row, ggoSpread.GetText(C_ROUTE_ID, active_row, false));
                            ggoSpread.SetValue(C_ROUTE_NM, copy_row, ggoSpread.GetText(C_ROUTE_NM, active_row, false));
                            ggoSpread.SetValue(C_MENU_TYPE, copy_row, ggoSpread.GetText(C_MENU_TYPE, active_row, false));
                            ggoSpread.SetValue(C_MENU_TYPE, copy_row, ggoSpread.GetText(C_MENU_TYPE, active_row, false));
                            ggoSpread.SetValue(C_MENU_TYPE_NM, copy_row, ggoSpread.GetText(C_MENU_TYPE_NM, active_row, false));
                            ggoSpread.SetValue(C_MENU_LVL, copy_row, ggoSpread.GetText(C_MENU_LVL, active_row, false));
                            ggoSpread.SetValue(C_MENU_SEQ, copy_row, "");
                            ggoSpread.SetValue(C_USE_YN, copy_row, ggoSpread.GetText(C_USE_YN, active_row, false));

                            ggoSpread.ReDraw(true);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.OnFncExport = function () {
                    try {
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.OnFncPrint = function () {
                    try {
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.OnFncHelp = function () {
                    try {
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.OnFncSettings = function () {
                    try {
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
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
                this.cntxtMenuId_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_USR_MENU", strCode);
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtMenuIdName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtMenuIdName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtMenuIdName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtMenuIdName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtMenuId_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00027") %>";
                        popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00002") %>", 10);
                        popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00003") %>", 40);
                        popArgs.From = "S_USR_MENU";
                        popArgs.WinSize = new WindowSize(500, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtMenuId.SetText(arry.Tables[0].Rows[0]["MENU_ID"]);
                            cntxtMenuIdName.SetText(arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtParentMenuId_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_USR_MENU", strCode);
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtParentMenuIdName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtParentMenuIdName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtParentMenuIdName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtParentMenuIdName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtParentMenuId_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00028") %>";
                        popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00004") %>", 10);
                        popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00005") %>", 40);
                        popArgs.From = "S_USR_MENU";
                        popArgs.Where = "MENU_TYPE = 'M'"
                        popArgs.WinSize = new WindowSize(500, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtParentMenuId.SetText(arry.Tables[0].Rows[0]["MENU_ID"]);
                            cntxtParentMenuIdName.SetText(arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtRouteId_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_ROUTE_HDR", strCode);
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
                        popArgs.Title = "<%= GetResource("CSTRESX00029") %>";
                        popArgs.AddColumn("ROUTE_ID", "<%= GetResource("CSTRESX00023") %>", 10);
                        popArgs.AddColumn("ROUTE_NAME_" + lgLang, "<%= GetResource("CSTRESX00024") %>", 40);
                        popArgs.From = "S_ROUTE_HDR";
                        popArgs.WinSize = new WindowSize(500, 450);

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
                            case C_PARENT_MENU_ID:
                                lgStrSql = "";
                                lgStrSql += " SELECT MENU_ID, MENU_NM_" + lgLang + " FROM S_USR_MENU ";
                                lgStrSql += " WHERE MENU_ID = " + eni.Data.FilterVariable(ggoSpread.GetText(pCol, pRow));
                                lgStrSql += " AND MENU_TYPE = 'M' "
                                
                                var result = eni.DbAccess.ExecuteDataSet(lgStrSql, "S_USR_MENU");
                                if (result.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), result.Message);
                                } else {
                                    if (result.DataSet.S_USR_MENU && result.DataSet.S_USR_MENU.length > 0) {
                                        ggoSpread.SetText(C_PARENT_MENU_NM, pRow, result.DataSet.S_USR_MENU[0]["MENU_NM_" + lgLang]);
                                    } else {
                                        ggoSpread.SetText(C_PARENT_MENU_ID, pRow, "");
                                        ggoSpread.SetText(C_PARENT_MENU_NM, pRow, "");
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
                            case C_PARENT_MENU_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00028") %>";
                                popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00002") %>", 10);
                                popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00003") %>", 40);
                                popArgs.From = "S_USR_MENU";
                                popArgs.Where = "MENU_TYPE = 'M' AND USE_YN = 'Y' ";
                                popArgs.WinSize = new WindowSize(500, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SetText(C_PARENT_MENU_ID, pRow, arry.Tables[0].Rows[0]["MENU_ID"]);
                                    ggoSpread.SetText(C_PARENT_MENU_NM, pRow, arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                                    ggoSpread.UpdateRow(pRow);
                                }
                                break;
                            case C_ROUTE_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00029") %>";
                                popArgs.AddColumn("ROUTE_ID", "<%= GetResource("CSTRESX00023") %>", 10);
                                popArgs.AddColumn("ROUTE_NAME_" + lgLang, "<%= GetResource("CSTRESX00024") %>", 40);
                                popArgs.AddColumn("ROUTE_DES", "<%= GetResource("CSTRESX00024") %>", 20);
                                popArgs.AddColumn("ROUTE_URL", "<%= GetResource("CSTRESX00024") %>", 20);
                                popArgs.AddColumn("VIR_PATH", "<%= GetResource("CSTRESX00032") %>", 50);
                                popArgs.From = "S_ROUTE_HDR";
                                popArgs.Where = "ROUTE_TYPE = 'S'";
                                popArgs.WinSize = new WindowSize(500, 450);

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
                            //case C_MENU_GROUP: ggoSpread.SetValue(C_MENU_GROUP_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            //case C_MENU_GROUP_NM: ggoSpread.SetValue(C_MENU_GROUP, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_MENU_TYPE: ggoSpread.SetValue(C_MENU_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_MENU_TYPE_NM: ggoSpread.SetValue(C_MENU_TYPE, pRow, ggoSpread.GetValue(pCol, pRow)); break;
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
                                            cntxtMenuId.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cntxtMenuId.Focus();
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
                            MENU_ID : strP1,
                            PARENT_MENU_ID : strP2,
                            MENU_TYPE : strP3,
                            ROUTE_ID : strP4,
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
                        eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00108"));
                        eni.DisableToolBar();
                        
                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbSave";

                        var dsData = new DataSetClass();
                        var tbData = dsData.CreateDataTable("B2002MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("MENU_ID");
                        tbData.AddColumn("MENU_NM");
                        tbData.AddColumn("PARENT_MENU_ID");
                        tbData.AddColumn("MENU_DES");
                        tbData.AddColumn("MENU_NM_KO");
                        tbData.AddColumn("MENU_DES_KO");
                        tbData.AddColumn("MENU_NM_EN");
                        tbData.AddColumn("MENU_DES_EN");
                        tbData.AddColumn("MENU_NM_CN");
                        tbData.AddColumn("MENU_DES_CN");
                        tbData.AddColumn("MENU_NM_JP");
                        tbData.AddColumn("MENU_DES_JP");
                        //tbData.AddColumn("MENU_GROUP");
                        tbData.AddColumn("MENU_TYPE");
                        tbData.AddColumn("MENU_LVL");
                        tbData.AddColumn("MENU_SEQ");
                        tbData.AddColumn("ROUTE_ID");
                        tbData.AddColumn("USE_YN");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.MENU_ID = ggoSpread.GetText(C_MENU_ID, i, true);
                                    nRow.MENU_NM = ggoSpread.GetText(C_MENU_NM, i, true);
                                    nRow.PARENT_MENU_ID = ggoSpread.GetText(C_PARENT_MENU_ID, i, true);
                                    nRow.MENU_DES = ggoSpread.GetText(C_MENU_DES, i, true);
                                    nRow.MENU_NM_KO = ggoSpread.GetText(C_MENU_NM_KO, i, true);
                                    nRow.MENU_DES_KO = ggoSpread.GetText(C_MENU_DES_KO, i, true);
                                    nRow.MENU_NM_EN = ggoSpread.GetText(C_MENU_NM_EN, i, true);
                                    nRow.MENU_DES_EN = ggoSpread.GetText(C_MENU_DES_EN, i, true);
                                    nRow.MENU_NM_CN = ggoSpread.GetText(C_MENU_NM_CN, i, true);
                                    nRow.MENU_DES_CN = ggoSpread.GetText(C_MENU_DES_CN, i, true);
                                    nRow.MENU_NM_JP = ggoSpread.GetText(C_MENU_NM_JP, i, true);
                                    nRow.MENU_DES_JP = ggoSpread.GetText(C_MENU_DES_JP, i, true);
                                    //nRow.MENU_GROUP = ggoSpread.GetText(C_MENU_GROUP, i, true);
                                    nRow.MENU_TYPE = ggoSpread.GetText(C_MENU_TYPE, i, true);
                                    nRow.MENU_LVL = ggoSpread.GetText(C_MENU_LVL, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    }else {
                                        nRow.USE_YN = "N";
                                    }
                                    
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.MENU_ID = ggoSpread.GetText(C_MENU_ID, i, true);
                                    nRow.MENU_NM = ggoSpread.GetText(C_MENU_NM, i, true);
                                    nRow.PARENT_MENU_ID = ggoSpread.GetText(C_PARENT_MENU_ID, i, true);
                                    nRow.MENU_DES = ggoSpread.GetText(C_MENU_DES, i, true);
                                    nRow.MENU_NM_KO = ggoSpread.GetText(C_MENU_NM_KO, i, true);
                                    nRow.MENU_DES_KO = ggoSpread.GetText(C_MENU_DES_KO, i, true);
                                    nRow.MENU_NM_EN = ggoSpread.GetText(C_MENU_NM_EN, i, true);
                                    nRow.MENU_DES_EN = ggoSpread.GetText(C_MENU_DES_EN, i, true);
                                    nRow.MENU_NM_CN = ggoSpread.GetText(C_MENU_NM_CN, i, true);
                                    nRow.MENU_DES_CN = ggoSpread.GetText(C_MENU_DES_CN, i, true);
                                    nRow.MENU_NM_JP = ggoSpread.GetText(C_MENU_NM_JP, i, true);
                                    nRow.MENU_DES_JP = ggoSpread.GetText(C_MENU_DES_JP, i, true);
                                    //nRow.MENU_GROUP = ggoSpread.GetText(C_MENU_GROUP, i, true);
                                    nRow.MENU_TYPE = ggoSpread.GetText(C_MENU_TYPE, i, true);
                                    nRow.MENU_LVL = ggoSpread.GetText(C_MENU_LVL, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
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
                                    nRow.MENU_ID = ggoSpread.GetText(C_MENU_ID, i, true);
                                    nRow.MENU_NM = ggoSpread.GetText(C_MENU_NM, i, true);
                                    nRow.PARENT_MENU_ID = ggoSpread.GetText(C_PARENT_MENU_ID, i, true);
                                    nRow.MENU_DES = ggoSpread.GetText(C_MENU_DES, i, true);
                                    nRow.MENU_NM_KO = ggoSpread.GetText(C_MENU_NM_KO, i, true);
                                    nRow.MENU_DES_KO = ggoSpread.GetText(C_MENU_DES_KO, i, true);
                                    nRow.MENU_NM_EN = ggoSpread.GetText(C_MENU_NM_EN, i, true);
                                    nRow.MENU_DES_EN = ggoSpread.GetText(C_MENU_DES_EN, i, true);
                                    nRow.MENU_NM_CN = ggoSpread.GetText(C_MENU_NM_CN, i, true);
                                    nRow.MENU_DES_CN = ggoSpread.GetText(C_MENU_DES_CN, i, true);
                                    nRow.MENU_NM_JP = ggoSpread.GetText(C_MENU_NM_JP, i, true);
                                    nRow.MENU_DES_JP = ggoSpread.GetText(C_MENU_DES_JP, i, true);
                                    //nRow.MENU_GROUP = ggoSpread.GetText(C_MENU_GROUP, i, true);
                                    nRow.MENU_TYPE = ggoSpread.GetText(C_MENU_TYPE, i, true);
                                    nRow.MENU_LVL = ggoSpread.GetText(C_MENU_LVL, i, true);
                                    nRow.MENU_SEQ = ggoSpread.GetText(C_MENU_SEQ, i, true);
                                    nRow.ROUTE_ID = ggoSpread.GetText(C_ROUTE_ID, i, true);
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
                                                        <span class="CAP" onclick="cntxtMenuId.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtMenuId" ClientInstanceName="cntxtMenuId" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="200px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtMenuId_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtMenuId_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtParentMenuId.Focus()"><%= GetResource("CSTRESX00004")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtParentMenuId" ClientInstanceName="cntxtParentMenuId" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="200px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtParentMenuId_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtParentMenuId_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cboMenuType.Focus()"><%= GetResource("CSTRESX00020")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniComboBox ID="cboMenuType" ClientInstanceName="cboMenuType" runat="server" SkinID="BSL" EnterActionQuery="true">
                                                            <ClearButton Visibility="True"></ClearButton>
                                                            <Items>
                                                                <dx:ListEditItem Value="P" Text="프로그램"/>
                                                                <dx:ListEditItem Value="M" Text="메뉴"/>
                                                            </Items>
                                                        </eni:eniComboBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtRouteId.Focus()"><%= GetResource("CSTRESX00023")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtRouteId" ClientInstanceName="cntxtRouteId" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="200px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
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
                                                <ClientSideEvents   TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
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