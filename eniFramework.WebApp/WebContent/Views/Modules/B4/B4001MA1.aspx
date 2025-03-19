<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B4001MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B4.B4001MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B4001MA1.aspx
    *  4. Program Name         : 사용자정보관리(권한 포함)
    *  5. Program Desc         : 사용자정보관리(권한 포함)
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2016-04-20
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
        txtErpNo            = ASPxClientTextBox.Cast();
        txtName             = ASPxClientTextBox.Cast();
        txtUsrId            = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B4001MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_USR_ID        = C_IDX++,
                    C_ERP_NO        = C_IDX++,
                    C_USR_VALID_DT  = C_IDX++,
                    C_ORG_PWD       = C_IDX++,
                    C_PWD           = C_IDX++,
                    C_PWD_VALID_DT  = C_IDX++,
                    C_NAME          = C_IDX++,
                    C_ENG_NAME      = C_IDX++,
                    C_HANJA_NAME    = C_IDX++,
                    C_USR_KIND      = C_IDX++,
                    C_USR_KIND_NM   = C_IDX++,
                    C_USR_TYPE      = C_IDX++,
                    C_USR_TYPE_NM   = C_IDX++,
                    C_USR_GUBUN     = C_IDX++,
                    C_USR_GUBUN_NM  = C_IDX++,
                    C_ORG_ADMIN_YN  = C_IDX++,
                    C_ADMIN_YN      = C_IDX++,
                    C_ORG_USE_YN    = C_IDX++,
                    C_USE_YN        = C_IDX++,
                    C_REMARK        = C_IDX++;

                C_IDX = 1;
                    //vspdData1
                var C1_USR_ID = C_IDX++,
                    C1_USR_ROLE_ID = C_IDX++,
                    C1_USR_ROLE_BP = C_IDX++,
                    C1_USR_ROLE_NM = C_IDX++;

                C_IDX = 1;
                    //vspdData2
                var C2_USR_ID   = C_IDX++,
                    C2_MNU_ID   = C_IDX++,
                    C2_MENU_NM  = C_IDX++,
                    C2_MENU_DES = C_IDX++;

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/
                this.Title = eni.GetTitle() + " - " + "[<%= lgPageInfo.RequestParentMenuID %>]" + "[<%= lgPageInfo.RequestMenuID %>]" + " : " + "<%= GetGlobalResource("QuickName") %>";
                // 뷰 타입
                this.ViewType = ViewType.ModuleView;
                // 모듈 타입
                this.ModuleType = ModuleType.MultiMulti;
                
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
                        txtErpNo.Focus();
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

                        txtErpNo.SetText("");
                        txtName.SetText("");
                        txtUsrId.SetText("");

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
                        //vspdData
                        ggoSpread.Source = vspdData;
                        ggoSpread.ReDraw(false);
                        ggoSpread.MakeColumns(C_REMARK);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_USR_ID, "<%= GetResource("CSTRESX00004") %>", 10, HAlign.Left, 30, CellKind.Protected, false);
                        ggoSpread.SSSetEdit(C_ERP_NO, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Center, 10);
                        ggoSpread.SSSetDate(C_USR_VALID_DT, "<%= GetResource("CSTRESX00005") %>", 8, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetEdit(C_ORG_PWD, "<%= GetResource("CSTRESX00006") %>", 10, HAlign.Left, 50, CellKind.Default, true, EditCharCase.NoCase);
                        ggoSpread.SSSetEdit(C_PWD, "<%= GetResource("CSTRESX00007") %>", 15, HAlign.Left, 50, CellKind.Required, false, EditCharCase.NoCase, null, true);
                        ggoSpread.SSSetDate(C_PWD_VALID_DT, "<%= GetResource("CSTRESX00008") %>", 12, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetEdit(C_NAME, "<%= GetResource("CSTRESX00003") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_ENG_NAME, "<%= GetResource("CSTRESX00009") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_HANJA_NAME, "<%= GetResource("CSTRESX00010") %>", 15, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetCombo(C_USR_KIND, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_KIND_NM, "<%= GetResource("CSTRESX00011") %>", 11, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_USR_TYPE, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_TYPE_NM, "<%= GetResource("CSTRESX00012") %>", 9, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_USR_GUBUN, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_GUBUN_NM, "<%= GetResource("CSTRESX00013") %>", 14, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCheck(C_ORG_ADMIN_YN, "<%= GetResource("CSTRESX00014") %>", 5, null, true);
                        ggoSpread.SSSetCheck(C_ADMIN_YN, "<%= GetResource("CSTRESX00015") %>", 5);
                        ggoSpread.SSSetCheck(C_ORG_USE_YN, "<%= GetResource("CSTRESX00016") %>", 7, null, true);
                        ggoSpread.SSSetCheck(C_USE_YN, "<%= GetResource("CSTRESX00017") %>", 7);
                        ggoSpread.SSSetEdit(C_REMARK, "<%= GetResource("CSTRESX00018") %>", 30, HAlign.Left, 100, CellKind.Default);

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
                        
                        ggoSpread.SetColsFrozen(2);
                        ggoSpread.ReDraw(true);

                        //vspdData1
                        ggoSpread.Source = vspdData1;
                        ggoSpread.ReDraw(false);
                        ggoSpread.MakeColumns(C1_USR_ROLE_NM);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C1_USR_ID, "<%= GetResource("CSTRESX00004") %>", 12, HAlign.Left, 30, CellKind.Default, true);
                        ggoSpread.SSSetEdit(C1_USR_ROLE_ID, "<%= GetResource("CSTRESX00019") %>", 10, HAlign.Left, 20, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C1_USR_ROLE_BP, true, false);
                        ggoSpread.SSSetEdit(C1_USR_ROLE_NM, "<%= GetResource("CSTRESX00020") %>", 30, HAlign.Left, 50, CellKind.Protected);

                        ggoSpread.ReDraw(true);

                        //vspdData2
                        ggoSpread.Source = vspdData2;
                        ggoSpread.ReDraw(false);
                        ggoSpread.SetOperationMode(OperationMode.ExtendedSelect);
                        ggoSpread.MakeColumns(C2_MENU_DES);

                        ggoSpread.SSSetEdit(C2_USR_ID, "<%= GetResource("CSTRESX00004") %>", 10, HAlign.Left, 30, CellKind.Default, true);
                        ggoSpread.SSSetEdit(C2_MNU_ID, "<%= GetResource("CSTRESX00021") %>", 14, HAlign.Left, 50, CellKind.Default);
                        ggoSpread.SSSetEdit(C2_MENU_NM, "<%= GetResource("CSTRESX00022") %>", 30, HAlign.Left, 50, CellKind.Default);
                        ggoSpread.SSSetEdit(C2_MENU_DES, "<%= GetResource("CSTRESX00023") %>", 50, HAlign.Left, 50, CellKind.Default);

                        ggoSpread.SpreadLockWithOddEvenRow();
                        ggoSpread.ReDraw(true);

                        lgActiveSpread = vspdData;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.InitSpreadSheetCombo = function () {
                    lgStrSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0003' AND USE_YN = 'Y' ORDER BY MINOR_CD ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(lgStrSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_KIND, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_KIND_NM, cboDataArr[1]);
                        }
                    }

                    lgStrSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0004' AND USE_YN = 'Y' ORDER BY MINOR_CD ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(lgStrSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_TYPE, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_TYPE_NM, cboDataArr[1]);
                        }
                    }

                    lgStrSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0005' AND USE_YN = 'Y' ORDER BY MINOR_CD ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(lgStrSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_GUBUN, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_GUBUN_NM, cboDataArr[1]);
                        }
                    }
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

                            for (var i = 0; i < lgSpreadArr.length; i++) {
                                ggoSpread.Source = lgSpreadArr[i];
                                ggoSpread.ClearSpreadData();
                            }

                            var strP1 = txtErpNo.GetText();
                            var strP2 = txtName.GetText();
                            var strP3 = txtUsrId.GetText();

                            eni.LocalPage.DbQuery(strP1, strP2, strP3);
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
                        ggoSpread.Source = lgActiveSpread;
                        ggoSpread.ReDraw(false);

                        var activeRow = ggoSpread.InsertRows();

                        switch (lgActiveSpread) {
                            case vspdData:
                                ggoSpread.SpreadRequired(C_USR_ID, activeRow);
                                
                                ggoSpread.SetText(C_USR_VALID_DT, activeRow, "2999-12-31");
                                ggoSpread.SetText(C_PWD_VALID_DT, activeRow, "2999-12-31");
                                ggoSpread.SetValue(C_USR_KIND, activeRow, 0);
                                ggoSpread.SetValue(C_USR_KIND_NM, activeRow, 0);
                                ggoSpread.SetValue(C_USR_TYPE, activeRow, 1);
                                ggoSpread.SetValue(C_USR_TYPE_NM, activeRow, 1);
                                ggoSpread.SetValue(C_USR_GUBUN, activeRow, 0);
                                ggoSpread.SetValue(C_USR_GUBUN_NM, activeRow, 0);
                                ggoSpread.SetValue(C_ADMIN_YN, activeRow, 0);
                                ggoSpread.SetValue(C_USE_YN, activeRow, 1);

                                ggoSpread.Source = vspdData1;
                                ggoSpread.ClearSpreadData();
                                ggoSpread.Source = vspdData2;
                                ggoSpread.ClearSpreadData();
                                break;
                            case vspdData1:
                                ggoSpread.Source = vspdData;
                                if (ggoSpread.GetText(0, vspdData.ActiveRow) === vspdData.InsertFlag) {
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00119");
                                    return;
                                }
                                var usr_id = ggoSpread.GetText(C_USR_ID, vspdData.ActiveRow);

                                ggoSpread.Source = vspdData1;
                                ggoSpread.SpreadRequired(C1_USR_ROLE_ID, activeRow);
                                ggoSpread.SpreadUnLock(C1_USR_ROLE_BP, activeRow);

                                ggoSpread.SetText(C1_USR_ID, activeRow, usr_id);
                                break;
                        }

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

                            switch (lgActiveSpread) {
                                case vspdData:
                                    ggoSpread.SpreadRequired(C_USR_ID, copy_row);
                                    ggoSpread.SpreadRequired(C_USR_VALID_DT, copy_row, C_ORG_ADMIN_YN, copy_row);

                                    ggoSpread.SetText(C_USR_ID, copy_row, "");
                                    ggoSpread.SetText(C_ERP_NO, copy_row, "");
                                    ggoSpread.SetText(C_USR_VALID_DT, copy_row, ggoSpread.GetText(C_USR_VALID_DT, active_row, false));
                                    ggoSpread.SetText(C_ORG_PWD, copy_row, "");
                                    ggoSpread.SetText(C_PWD, copy_row, "");
                                    ggoSpread.SetText(C_PWD_VALID_DT, copy_row, ggoSpread.GetText(C_PWD_VALID_DT, active_row, false));
                                    ggoSpread.SetText(C_NAME, copy_row, "");
                                    ggoSpread.SetText(C_ENG_NAME, copy_row, "");
                                    ggoSpread.SetText(C_HANJA_NAME, copy_row, "");
                                    ggoSpread.SetText(C_USR_KIND, copy_row, ggoSpread.GetText(C_USR_KIND, active_row, false));
                                    ggoSpread.SetText(C_USR_KIND_NM, copy_row, ggoSpread.GetText(C_USR_KIND_NM, active_row, false));
                                    ggoSpread.SetText(C_USR_TYPE, copy_row, ggoSpread.GetText(C_USR_TYPE, active_row, false));
                                    ggoSpread.SetText(C_USR_TYPE_NM, copy_row, ggoSpread.GetText(C_USR_TYPE_NM, active_row, false));
                                    ggoSpread.SetText(C_USR_GUBUN, copy_row, ggoSpread.GetText(C_USR_GUBUN, active_row, false));
                                    ggoSpread.SetText(C_USR_GUBUN_NM, copy_row, ggoSpread.GetText(C_USR_GUBUN_NM, active_row, false));
                                    ggoSpread.SetText(C_ADMIN_YN, copy_row, ggoSpread.GetText(C_ADMIN_YN, active_row, false));
                                    ggoSpread.SetText(C_USE_YN, copy_row, ggoSpread.GetText(C_USE_YN, active_row, false));
                                    break;
                                case vspdData1:
                                    
                                    break;
                            }

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
                this.vspdData_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        switch (pCol) {
                            //case C_FIRST_NAME:
                            //    ggoSpread.Source = pSender;
                            //    ggoSpread.SetText(C_NAME, pRow, ggoSpread.GetText(C_FIRST_NAME, pRow) + ggoSpread.GetText(C_LAST_NAME, pRow));
                            //    break;
                            //case C_LAST_NAME:
                            //    ggoSpread.Source = pSender;
                            //    ggoSpread.SetText(C_NAME, pRow, ggoSpread.GetText(C_FIRST_NAME, pRow) + ggoSpread.GetText(C_LAST_NAME, pRow));
                            //    break;
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

                this.vspdData_LeaveCell = function (pSender, pCol, pRow, pNewCol, pNewRow, pCancel) {
                    if (pRow == pNewRow || pNewRow == 0 || pNewRow < 0) return;
                    if (vspdDataCbProcess.InCallback()) return;

                    var runDbQuery = function () {
                        ggoSpread.Source = pSender;
                        if (ggoSpread.GetText(0, pNewRow) === pSender.InsertFlag) {
                            ggoSpread.Source = vspdData1;
                            ggoSpread.ClearSpreadData();
                            ggoSpread.Source = vspdData2;
                            ggoSpread.ClearSpreadData();
                            return;
                        }

                        if (vspdData1.MaxRows > 0) {
                            ggoSpread.Source = vspdData1;
                            ggoSpread.ClearSpreadData();
                        }

                        if (vspdData2.MaxRows > 0) {
                            ggoSpread.Source = vspdData2;
                            ggoSpread.ClearSpreadData();
                        }

                        ggoSpread.Source = vspdData;
                        eni.LocalPage.DbQuery1(ggoSpread.GetText(C_USR_ID, pNewRow));
                    };

                    ggoSpread.Source = vspdData1;
                    if (ggoSpread.CheckChange()) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00102", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                            if (pDialogResult === DialogResult.Yes) {
                                runDbQuery();
                            }
                        });
                    } else {
                        runDbQuery();
                    }
                };

                this.vspdData_ComboSelChange = function (pSender, pCol, pRow) {
                    try {
                        ggoSpread.Source = vspdData;

                        switch (pCol) {
                            case C_USR_KIND: ggoSpread.SetValue(C_USR_KIND_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_KIND_NM: ggoSpread.SetValue(C_USR_KIND, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE: ggoSpread.SetValue(C_USR_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE_NM: ggoSpread.SetValue(C_USR_TYPE, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN: ggoSpread.SetValue(C_USR_GUBUN_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN_NM: ggoSpread.SetValue(C_USR_GUBUN, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_MouseDown = function (pButton, pShift, pX, pY) {
                    try {
                        eni.SetToolbar("1101110011100000");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData1_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        switch (pCol) {
                            case C1_USR_ROLE_ID:
                                var strCode = ggoSpread.GetText(pCol, pRow);
                                if (strCode) {
                                    var result = eni.DbAccess.ExecuteCodeName("S_USR_ROLE", strCode, "");
                                    if (!result.Code) {
                                        if (result.Value) {
                                            ggoSpread.Source = vspdData1;
                                            ggoSpread.SetText(C1_USR_ROLE_NM, pRow, result.Value);
                                        } else {
                                            ggoSpread.Source = vspdData1;
                                            ggoSpread.SetText(pCol, pRow, "");
                                            ggoSpread.SetText(C1_USR_ROLE_NM, pRow, "");
                                        }
                                    } else {
                                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                                    }
                                } else {
                                    ggoSpread.Source = vspdData1;
                                    ggoSpread.SetText(C1_USR_ROLE_NM, pRow, result.Value);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData1_LeaveCell = function (pSender, pCol, pRow, pNewCol, pNewRow, pCancel) {
                    if (pRow == pNewRow || pNewRow == 0 || pNewRow < 0) return;
                    if (vspdDataCbProcess.InCallback()) return;

                    ggoSpread.Source = pSender;
                    if (ggoSpread.GetText(0, pNewRow) === pSender.InsertFlag) {
                        ggoSpread.Source = vspdData2;
                        ggoSpread.ClearSpreadData();
                        return;
                    }

                    if (vspdData2.MaxRows > 0) {
                        ggoSpread.Source = vspdData2;
                        ggoSpread.ClearSpreadData();
                    }

                    ggoSpread.Source = vspdData1;
                    B4001MA1.DbQuery2(ggoSpread.GetText(C1_USR_ID, pNewRow), ggoSpread.GetText(C1_USR_ROLE_ID, pNewRow));
                };
                this.vspdData1_ButtonClicked = function (pSender, pCol, pRow) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();

                        switch (pCol) {
                            case C1_USR_ROLE_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00024") %>";
                                popArgs.AddColumn("USR_ROLE_ID", "<%= GetResource("CSTRESX00019") %>", 10);
                                popArgs.AddColumn("USR_ROLE_NM_" + lgLang, "<%= GetResource("CSTRESX00020") %>", 15);
                                popArgs.From = "S_USR_ROLE";
                                popArgs.WinSize = new WindowSize(400, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData1;
                                    ggoSpread.SetText(C1_USR_ROLE_ID, pRow, arry.Tables[0].Rows[0]["USR_ROLE_ID"]);
                                    ggoSpread.SetText(C1_USR_ROLE_NM, pRow, arry.Tables[0].Rows[0]["USR_ROLE_NM_" + lgLang]);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData1_MouseDown = function (pButton, pShift, pX, pY) {
                    try {
                        eni.SetToolbar("1101110011000000");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.vspdData2_MouseDown = function (pButton, pShift, pX, pY) {
                    try {
                        eni.SetToolbar("1101100000000000");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
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
                                        switch (callbackResult.CmdDetail) {
                                            case "vspdData":
                                                ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                                if (callbackResult.PageNo) {
                                                    lgPageNo = callbackResult.PageNo;
                                                } else {
                                                    lgPageNo = "";
                                                }

                                                ggoSpread.Source = vspdData1;
                                                ggoSpread.ClearSpreadData();
                                                ggoSpread.Source = vspdData2;
                                                ggoSpread.ClearSpreadData();

                                                ggoSpread.Source = vspdData;
                                                eni.LocalPage.DbQuery1(ggoSpread.GetText(C_USR_ID, 1));
                                                break;
                                            case "vspdData1":
                                                ggoSpread.Source = vspdData1;
                                                ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                                ggoSpread.Source = vspdData2;
                                                ggoSpread.ClearSpreadData();

                                                ggoSpread.Source = vspdData1;
                                                eni.LocalPage.DbQuery2(ggoSpread.GetText(C1_USR_ID, 1), ggoSpread.GetText(C1_USR_ROLE_ID, 1));
                                                break;
                                            case "vspdData2":
                                                ggoSpread.Source = vspdData2;
                                                ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                                eni.RestoreToolBar();
                                                eni.Loading.DisplayLoadingAll(false);
                                                break;
                                        }
                                    } else {
                                        eni.RestoreToolBar();
                                        eni.Loading.DisplayLoadingAll(false);
                                        switch (callbackResult.CmdDetail) {
                                            case "vspdData":
                                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                                    txtErpNo.Focus();
                                                });
                                                break;
                                            case "vspdData1":
                                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111");
                                                break;
                                            case "vspdData2":
                                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                                    ggoSpread.Source = vspdData1;
                                                    ggoSpread.Focus();
                                                });
                                                break;
                                        }
                                    }
                                } else {
                                    eni.RestoreToolBar();
                                    eni.Loading.DisplayLoadingAll(false);
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message);
                                    return;
                                }
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
                            ERP_NO: strP1,
                            NAME: strP2,
                            USR_ID: strP3,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                        hidFields.Set("strP2", strP2);
                        hidFields.Set("strP3", strP3);
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.DbQuery1 = function (strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9) {
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
                        cbArgs.CmdDetail = "vspdData1";
                        cbArgs.Data = {
                            USR_ID: strP1
                        }

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());
                    } catch (ex) {
                        eni.RestoreToolBar();
                        eni.Loading.DisplayLoadingAll(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.DbQuery2 = function (strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9) {
                    try {
                        eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00108"));
                        eni.DisableToolBar();

                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbQuery";
                        cbArgs.CmdDetail = "vspdData2";
                        cbArgs.Data = {
                            USR_ID: strP1,
                            USR_ROLE_ID: strP2
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());
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
                        var tbData = dsData.CreateDataTable("vspdData");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("USR_ID");
                        tbData.AddColumn("ERP_NO");
                        tbData.AddColumn("USR_VALID_DT");
                        tbData.AddColumn("ORG_PWD");
                        tbData.AddColumn("PWD");
                        tbData.AddColumn("PWD_VALID_DT");
                        tbData.AddColumn("NAME");
                        tbData.AddColumn("ENG_NAME");
                        tbData.AddColumn("HANJA_NAME");
                        tbData.AddColumn("USR_KIND");
                        tbData.AddColumn("USR_TYPE");
                        tbData.AddColumn("USR_GUBUN");
                        tbData.AddColumn("ORG_ADMIN_YN");
                        tbData.AddColumn("ADMIN_YN");
                        tbData.AddColumn("ORG_USE_YN");
                        tbData.AddColumn("USE_YN");
                        tbData.AddColumn("REMARK");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.USR_ID = ggoSpread.GetText(C_USR_ID, i, true);
                                    nRow.ERP_NO = ggoSpread.GetText(C_ERP_NO, i, true);
                                    nRow.USR_VALID_DT = ggoSpread.GetText(C_USR_VALID_DT, i, true);
                                    nRow.ORG_PWD = ggoSpread.GetText(C_ORG_PWD, i, true);
                                    nRow.PWD = ggoSpread.GetText(C_PWD, i, true);
                                    nRow.PWD_VALID_DT = ggoSpread.GetText(C_PWD_VALID_DT, i, true);
                                    nRow.NAME = ggoSpread.GetText(C_NAME, i, true);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, true);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, true);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, true);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, true);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, true);
                                    if (ggoSpread.GetText(C_ORG_ADMIN_YN, i) === "1") {
                                        nRow.ORG_ADMIN_YN = "Y";
                                    } else {
                                        nRow.ORG_ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ADMIN_YN, i) === "1") {
                                        nRow.ADMIN_YN = "Y";
                                    } else {
                                        nRow.ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ORG_USE_YN, i) === "1") {
                                        nRow.ORG_USE_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.USR_ID = ggoSpread.GetText(C_USR_ID, i, true);
                                    nRow.ERP_NO = ggoSpread.GetText(C_ERP_NO, i, true);
                                    nRow.USR_VALID_DT = ggoSpread.GetText(C_USR_VALID_DT, i, true);
                                    nRow.ORG_PWD = ggoSpread.GetText(C_ORG_PWD, i, true);
                                    nRow.PWD = ggoSpread.GetText(C_PWD, i, true);
                                    nRow.PWD_VALID_DT = ggoSpread.GetText(C_PWD_VALID_DT, i, true);
                                    nRow.NAME = ggoSpread.GetText(C_NAME, i, true);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, true);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, true);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, true);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, true);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, true);
                                    if (ggoSpread.GetText(C_ORG_ADMIN_YN, i) === "1") {
                                        nRow.ORG_ADMIN_YN = "Y";
                                    } else {
                                        nRow.ORG_ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ADMIN_YN, i) === "1") {
                                        nRow.ADMIN_YN = "Y";
                                    } else {
                                        nRow.ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ORG_USE_YN, i) === "1") {
                                        nRow.ORG_USE_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.USR_ID = ggoSpread.GetText(C_USR_ID, i, true);
                                    nRow.ERP_NO = ggoSpread.GetText(C_ERP_NO, i, true);
                                    nRow.USR_VALID_DT = ggoSpread.GetText(C_USR_VALID_DT, i, true);
                                    nRow.ORG_PWD = ggoSpread.GetText(C_ORG_PWD, i, true);
                                    nRow.PWD = ggoSpread.GetText(C_PWD, i, true);
                                    nRow.PWD_VALID_DT = ggoSpread.GetText(C_PWD_VALID_DT, i, true);
                                    nRow.NAME = ggoSpread.GetText(C_NAME, i, true);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, true);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, true);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, true);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, true);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, true);
                                    if (ggoSpread.GetText(C_ORG_ADMIN_YN, i) === "1") {
                                        nRow.ORG_ADMIN_YN = "Y";
                                    } else {
                                        nRow.ORG_ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ADMIN_YN, i) === "1") {
                                        nRow.ADMIN_YN = "Y";
                                    } else {
                                        nRow.ADMIN_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_ORG_USE_YN, i) === "1") {
                                        nRow.ORG_USE_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_YN, i) === "1") {
                                        nRow.USE_YN = "Y";
                                    } else {
                                        nRow.USE_YN = "N";
                                    }
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }

                        tbData = dsData.CreateDataTable("vspdData1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("USR_ID");
                        tbData.AddColumn("USR_ROLE_ID");

                        ggoSpread.Source = vspdData1;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.USR_ID = ggoSpread.GetText(C1_USR_ID, i);
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.USR_ID = ggoSpread.GetText(C1_USR_ID, i);
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.USR_ID = ggoSpread.GetText(C1_USR_ID, i);
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }

                        cbArgs.Data = dsData.Tables[0].Rows;
                        cbArgs.Data1 = dsData.Tables[1].Rows;
                        
                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());
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
        function resize() {
            vspdDataContainerResize(); vspdData1ContainerResize(); vspdData2ContainerResize();
        }
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
            <dx:TabPage Name="tab1"  Text="사용자정보관리(권한 포함)">
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
                                                        <span class="CAP" onclick="txtErpNo.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtErpNo" ClientInstanceName="txtErpNo" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtName.Focus()"><%= GetResource("CSTRESX00003") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtName" ClientInstanceName="txtName" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtUsrId.Focus()"><%= GetResource("CSTRESX00004")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtUsrId" ClientInstanceName="txtUsrId" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
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
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData" runat="server" ActiveXVersion="vspdDFPOBUCSPD7">
                                                <ClientSideEvents   TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
                                                                    Change="eni.LocalPage.vspdData_Change" 
                                                                    LeaveCell="eni.LocalPage.vspdData_LeaveCell"
                                                                    ComboSelChange="eni.LocalPage.vspdData_ComboSelChange" 
                                                                    MouseDown="eni.LocalPage.vspdData_MouseDown"/>
                                            </eni:eniSpread>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1DetailData" Size="200px" MaxSize="200px">
                                    <Panes>
                                        <dx:SplitterPane Name="tab1DetailData1" Size="400px" MaxSize="400px">
                                            <ContentCollection>
                                                <dx:SplitterContentControl>
                                                    <eni:eniSpread ID="vspdData1" ClientInstanceName="vspdData1"  runat="server" ActiveXVersion="vspdDFPSPD6">
                                                        <ClientSideEvents   Change="eni.LocalPage.vspdData1_Change" 
                                                                            LeaveCell="eni.LocalPage.vspdData1_LeaveCell" 
                                                                            ButtonClicked="eni.LocalPage.vspdData1_ButtonClicked" 
                                                                            MouseDown="eni.LocalPage.vspdData1_MouseDown" />
                                                    </eni:eniSpread>
                                                </dx:SplitterContentControl>
                                            </ContentCollection>
                                        </dx:SplitterPane>
                                        <dx:SplitterPane Name="tab2DetailData1">
                                            <ContentCollection>
                                                <dx:SplitterContentControl>
                                                    <eni:eniSpread ID="vspdData2" ClientInstanceName="vspdData2"  runat="server" ActiveXVersion="vspdDFPSPD6">
                                                        <ClientSideEvents   MouseDown="eni.LocalPage.vspdData2_MouseDown" />
                                                    </eni:eniSpread>
                                                </dx:SplitterContentControl>
                                            </ContentCollection>
                                        </dx:SplitterPane>
                                    </Panes>
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