<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B0000MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B0.B0000MA1" %>

<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>


<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 시스템설정
    *  2. Function Name        :
    *  3. Program ID           : B0000MA1.aspx
    *  4. Program Name         : 자동채번등록
    *  5. Program Desc         : 자동채번등록
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2016-04-16
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
        cntxtAutoNotype     = ASPxClientTextBox.Cast();
        cntxtAutoNotypeName = ASPxClientTextBox.Cast();
        deEffectFromDt      = ASPxClientDateEdit.Cast();
        vspdDataCbProcess = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B0000MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;
                
                var C_IDX = 1;
                var C_AUTO_NO_TYPE      = C_IDX++,
                    C_AUTO_NO_BP        = C_IDX++,
                    C_AUTO_NO_NM        = C_IDX++,
                    C_EFFECT_FROM_DT    = C_IDX++,
                    C_AUTO_FLAG_CD      = C_IDX++,
                    C_AUTO_FLAG_NM      = C_IDX++,
                    C_JOB_PREFIX        = C_IDX++,
                    C_DATE_TYPE         = C_IDX++,
                    C_SERIAL_LEN        = C_IDX++,
                    C_SERIAL_DIGIT      = C_IDX++,
                    C_DATE_INFO         = C_IDX++,
                    C_SERIAL_NO         = C_IDX++,
                    C_AUTO_NO           = C_IDX++;

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
                        cntxtAutoNotype.Focus();
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

                        cntxtAutoNotype.SetText("");
                        cntxtAutoNotypeName.SetText("");
                        var ret = eni.DbAccess.ExecuteQuery("SELECT CONVERT(VARCHAR(10), MIN(EFFECT_FROM_DT), 121) EFFECT_FROM_DT FROM B_AUTO_NUMBERING");
                        if (ret.DataTable && ret.DataTable.length > 0) {
                            deEffectFromDt.SetValue(new Date(ret.DataTable[0].EFFECT_FROM_DT));
                        }

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
                        ggoSpread.MakeColumns(C_AUTO_NO);
                        ggoSpread.SetMaxRows(0);
                        //ggoSpread.SetUserColAction(UserColAction.Sort);
                        
                        ggoSpread.SSSetEdit(C_AUTO_NO_TYPE, "<%= GetResource("CSTRESX00004") %>", 10, HAlign.Left, 10, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C_AUTO_NO_BP, true, false);
                        ggoSpread.SSSetEdit(C_AUTO_NO_NM, "<%= GetResource("CSTRESX00005") %>", 13, HAlign.Left, 30, CellKind.Protected, false, EditCharCase.NoCase);
                        ggoSpread.SSSetDate(C_EFFECT_FROM_DT, "<%= GetResource("CSTRESX00006") %>", 8, HAlign.Center, CellKind.Protected, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetCombo(C_AUTO_FLAG_CD, "<%= GetResource("CSTRESX00007") %>", 10, HAlign.Center, null, true, "A" + ggoSpread.Source.ColSep + "M");
                        ggoSpread.SSSetCombo(C_AUTO_FLAG_NM, "<%= GetResource("CSTRESX00007") %>", 10, HAlign.Center, CellKind.Protected, null, "<%= GetResource("CSTRESX00017") %>" + vspdData.ColSep + "<%= GetResource("CSTRESX00018") %>");
                        ggoSpread.SSSetEdit(C_JOB_PREFIX, "<%= GetResource("CSTRESX00008") %>", 10, HAlign.Left, 10, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetCombo(C_DATE_TYPE, "<%= GetResource("CSTRESX00009") %>", 10, HAlign.Left, CellKind.Protected);
                        ggoSpread.SSSetFloat(C_SERIAL_LEN, "<%= GetResource("CSTRESX00010") %>", 10, HAlign.Right, CellKind.Protected, false, ",", ".", 0, null, CurrencyLeadingZero.LeadingZeroYes, 0, 10);
                        ggoSpread.SSSetFloat(C_SERIAL_DIGIT, "<%= GetResource("CSTRESX00011") %>", 10, HAlign.Right, CellKind.Protected, false, ",", ".", 0, null, CurrencyLeadingZero.LeadingZeroYes, 0, 10);
                        ggoSpread.SSSetEdit(C_DATE_INFO, "<%= GetResource("CSTRESX00013") %>", 8, HAlign.Left, 10, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_SERIAL_NO, "<%= GetResource("CSTRESX00014") %>", 12, HAlign.Left, 12, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_AUTO_NO, "<%= GetResource("CSTRESX00015") %>", 15, HAlign.Left, 20, CellKind.Protected, false, EditCharCase.UpperCase);

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
                    try {
                        ggoSpread.Source = vspdData;
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YY");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YYYY");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YYMM");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YYYYMM");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YMMDD");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YYMMDD");
                        ggoSpread.SSetComboText(C_DATE_TYPE, "YYYYMMDD");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
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
                    //eni.Report.RQDReport("a");
                    //return;
                    try {
                        if (ASPxClientEdit.ValidateGroup("Condition")) {
                            eni.LocalPage.InitLocalVariables();

                            ggoSpread.Source = vspdData;
                            ggoSpread.ClearSpreadData();

                            var strP1 = cntxtAutoNotype.GetText();
                            var strP2 = deEffectFromDt.GetText();

                            eni.LocalPage.DbQuery(strP1, strP2);
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
                        ASPxClientEdit.ClearGroup("Condition");
                        ASPxClientEdit.ClearGroup("Data");

                        for (var i = 0; i < lgSpreadArr.length; i++) {
                            ggoSpread.Source = lgSpreadArr[i];
                            ggoSpread.ClearSpreadData();
                        }

                        eni.LocalPage.InitLocalVariables();
                        eni.LocalPage.SetLocalDefaultValue();
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

                        eni.LocalPage.DbQuery(strP1, strP2);
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
                        ggoSpread.SpreadRequired(C_AUTO_NO_TYPE, activeRow);
                        ggoSpread.SpreadUnLock(C_AUTO_NO_BP, activeRow);
                        ggoSpread.SpreadRequired(C_EFFECT_FROM_DT, activeRow);
                        ggoSpread.SpreadRequired(C_AUTO_FLAG_NM, activeRow);
                        ggoSpread.SpreadUnLock(C_JOB_PREFIX, activeRow);
                        ggoSpread.SpreadRequired(C_DATE_TYPE, activeRow);
                        ggoSpread.SpreadRequired(C_SERIAL_DIGIT, activeRow);
                        ggoSpread.SpreadRequired(C_SERIAL_LEN, activeRow);

                        if (cntxtAutoNotype.GetText() !== "") {
                            ggoSpread.SetText(C_AUTO_NO_TYPE, activeRow, cntxtAutoNotype.GetText());
                            ggoSpread.SetText(C_AUTO_NO_NM, activeRow, cntxtAutoNotypeName.GetText());
                        }
                        ggoSpread.SetText(C_EFFECT_FROM_DT, activeRow, deEffectFromDt.GetText());
                        ggoSpread.SetValue(C_AUTO_FLAG_CD, activeRow, 0);
                        ggoSpread.SetValue(C_AUTO_FLAG_NM, activeRow, 0);
                        if (cntxtAutoNotype.GetText() !== "") {
                            ggoSpread.SetText(C_JOB_PREFIX, activeRow, cntxtAutoNotype.GetText());
                        }
                        ggoSpread.SetValue(C_DATE_TYPE, activeRow, 0);
                        ggoSpread.SetValue(C_SERIAL_DIGIT, activeRow, 5);
                        ggoSpread.SetValue(C_SERIAL_LEN, activeRow, 1);

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

                            /*********************
                            * 개발자 정의 구간
                            *********************/

                            ggoSpread.SpreadRequired(C_AUTO_NO_TYPE, copy_row);
                            ggoSpread.SpreadLock(C_AUTO_NO_NM, copy_row);
                            ggoSpread.SpreadRequired(C_EFFECT_FROM_DT, copy_row);
                            ggoSpread.SpreadRequired(C_AUTO_FLAG_NM, copy_row);
                            ggoSpread.SpreadRequired(C_DATE_TYPE, copy_row);
                            ggoSpread.SpreadRequired(C_SERIAL_DIGIT, copy_row);
                            ggoSpread.SpreadRequired(C_SERIAL_LEN, copy_row);
                            ggoSpread.SpreadLock(C_DATE_INFO, copy_row);
                            ggoSpread.SpreadLock(C_SERIAL_NO, copy_row);
                            ggoSpread.SpreadLock(C_AUTO_NO, copy_row);

                            ggoSpread.SetText(C_AUTO_NO_TYPE, copy_row, ggoSpread.GetText(C_AUTO_NO_TYPE, active_row, false));
                            ggoSpread.SetText(C_AUTO_NO_NM, copy_row, ggoSpread.GetText(C_AUTO_NO_NM, active_row, false));
                            ggoSpread.SetText(C_EFFECT_FROM_DT, copy_row, ggoSpread.GetText(C_EFFECT_FROM_DT, active_row, false));
                            ggoSpread.SetText(C_AUTO_FLAG_CD, copy_row, ggoSpread.GetText(C_AUTO_FLAG_CD, active_row, false));
                            this.vspdData_ComboSelChange(lgActiveSpread, C_AUTO_FLAG_CD, copy_row);
                            ggoSpread.SetText(C_DATE_TYPE, copy_row, ggoSpread.GetText(C_DATE_TYPE, active_row, false));
                            this.vspdData_ComboSelChange(lgActiveSpread, C_DATE_TYPE, copy_row);
                            ggoSpread.SetText(C_JOB_PREFIX, copy_row, ggoSpread.GetText(C_JOB_PREFIX, active_row, false));
                            ggoSpread.SetText(C_SERIAL_DIGIT, copy_row, ggoSpread.GetText(C_SERIAL_DIGIT, active_row, false));
                            ggoSpread.SetText(C_SERIAL_LEN, copy_row, ggoSpread.GetText(C_SERIAL_LEN, active_row, false));
                            ggoSpread.SetText(C_DATE_INFO, copy_row, "");
                            ggoSpread.SetText(C_SERIAL_NO, copy_row, "");
                            ggoSpread.SetText(C_AUTO_NO, copy_row, "");

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
                this.cntxtAutoNotype_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("B_MINOR", strCode, "S0007");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtAutoNotypeName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtAutoNotypeName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtAutoNotype.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtAutoNotypeName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtAutoNotype_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00016") %>";
                        popArgs.AddColumn("MINOR_CD", "<%= GetResource("CSTRESX00004") %>", 10);
                        popArgs.AddColumn("MINOR_NM_<%= lgLang %>", "<%= GetResource("CSTRESX00005") %>", 15);
                        popArgs.From = "B_MINOR";
                        popArgs.Where = "MAJOR_CD = 'S0007'";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtAutoNotype.SetText(arry.Tables[0].Rows[0]["MINOR_CD"]);
                            cntxtAutoNotypeName.SetText(arry.Tables[0].Rows[0]["MINOR_NM_<%= lgLang %>"]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.vspdData_ButtonClicked = function (pSender, pCol, pRow) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();

                        switch (pCol) {
                            case C_AUTO_NO_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00016") %>";
                                popArgs.AddColumn("MINOR_CD", "<%= GetResource("CSTRESX00004") %>", 10);
                                popArgs.AddColumn("MINOR_NM_<%= lgLang %>", "<%= GetResource("CSTRESX00005") %>", 15);
                                popArgs.From = "B_MINOR";
                                popArgs.Where = "MAJOR_CD = 'S0007'";
                                popArgs.WinSize = new WindowSize(400, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SetText(C_AUTO_NO_TYPE, pRow, arry.Tables[0].Rows[0]["MINOR_CD"]);
                                    ggoSpread.SetText(C_AUTO_NO_NM, pRow, arry.Tables[0].Rows[0]["MINOR_NM_<%= lgLang %>"]);
                                    ggoSpread.UpdateRow(pRow);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.vspdData_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        switch (pCol) {
                            case C_AUTO_NO_TYPE:
                                ggoSpread.Source = vspdData;
                                var strCode = ggoSpread.GetText(pCol, pRow);
                                if (strCode) {
                                    var result = eni.DbAccess.ExecuteCodeName("B_MINOR", strCode, "S0007");
                                    if (!result.Code) {
                                        if (result.Value) {
                                            ggoSpread.SetText(C_AUTO_NO_NM, pRow, result.Value);
                                            if (ggoSpread.GetText(C_JOB_PREFIX, pRow, result.Value) === "") {
                                                ggoSpread.SetText(C_JOB_PREFIX, pRow, ggoSpread.GetText(C_AUTO_NO_TYPE, pRow));
                                            }
                                        } else {
                                            ggoSpread.SetText(pCol, pRow, "");
                                            ggoSpread.SetText(C_AUTO_NO_NM, pRow, "");
                                            ggoSpread.SetText(C_JOB_PREFIX, pRow, result.Value);

                                            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111");
                                        }
                                    } else {
                                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                                    }
                                } else {
                                    ggoSpread.SetText(pCol, pRow, "");
                                    ggoSpread.SetText(C_AUTO_NO_NM, pRow, "");
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
                            case C_AUTO_FLAG_CD: ggoSpread.SetValue(C_AUTO_FLAG_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_AUTO_FLAG_NM: ggoSpread.SetValue(C_AUTO_FLAG_CD, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }

                    vspdData.EditMode = false;
                };

                this.vspdData_BeforeEditMode = function (s, e, a, b, c, d) {
                    return;
                };
                this.vspdData_RightClick = function (s, e, a, b, c, d) {
                    return;
                    alert(c)
                    alert(s.offsetWidth)
                    alert(s.offsetWidth / c)
                    alert(c / s.offsetWidth)
                };

                this.vspdData_TopLeftChange = function (s, oldLeft, oldTop, newLeft, newTop) {
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

                            eni.LocalPage.DbQuery(strP1, strP2);
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
                                            cntxtAutoNotype.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cntxtAutoNotype.Focus();
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

                this.DbDelete = function () {
                    try {
                    } catch (ex) {
                        eni.RestoreToolBar();
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
                        cbArgs.Data = {
                            AUTO_NO_TYPE: strP1,
                            EFFECT_FROM_DT: strP2,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                        hidFields.Set("strP2", strP2);
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
                        var tbData = dsData.CreateDataTable("B0000MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("AUTO_NO_TYPE");
                        tbData.AddColumn("AUTO_NO_NM");
                        tbData.AddColumn("EFFECT_FROM_DT");
                        tbData.AddColumn("AUTO_FLAG");
                        tbData.AddColumn("JOB_PREFIX");
                        tbData.AddColumn("DATE_TYPE");
                        tbData.AddColumn("SERIAL_LEN");
                        tbData.AddColumn("SERIAL_DIGIT");
                        
                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.AUTO_NO_TYPE = ggoSpread.GetText(C_AUTO_NO_TYPE, i, true);
                                    nRow.AUTO_NO_NM = ggoSpread.GetText(C_AUTO_NO_NM, i, true);
                                    nRow.EFFECT_FROM_DT = ggoSpread.GetText(C_EFFECT_FROM_DT, i, true);
                                    nRow.AUTO_FLAG = ggoSpread.GetText(C_AUTO_FLAG_CD, i, true);
                                    nRow.JOB_PREFIX = ggoSpread.GetText(C_JOB_PREFIX, i, true);
                                    nRow.DATE_TYPE = ggoSpread.GetText(C_DATE_TYPE, i, true);
                                    nRow.SERIAL_LEN = ggoSpread.GetText(C_SERIAL_LEN, i, true);
                                    nRow.SERIAL_DIGIT = ggoSpread.GetText(C_SERIAL_DIGIT, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.AUTO_NO_TYPE = ggoSpread.GetText(C_AUTO_NO_TYPE, i, true);
                                    nRow.AUTO_NO_NM = ggoSpread.GetText(C_AUTO_NO_NM, i, true);
                                    nRow.EFFECT_FROM_DT = ggoSpread.GetText(C_EFFECT_FROM_DT, i, true);
                                    nRow.AUTO_FLAG = ggoSpread.GetText(C_AUTO_FLAG_CD, i, true);
                                    nRow.JOB_PREFIX = ggoSpread.GetText(C_JOB_PREFIX, i, true);
                                    nRow.DATE_TYPE = ggoSpread.GetText(C_DATE_TYPE, i, true);
                                    nRow.SERIAL_LEN = ggoSpread.GetText(C_SERIAL_LEN, i, true);
                                    nRow.SERIAL_DIGIT = ggoSpread.GetText(C_SERIAL_DIGIT, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.AUTO_NO_TYPE = ggoSpread.GetText(C_AUTO_NO_TYPE, i, true);
                                    nRow.AUTO_NO_NM = ggoSpread.GetText(C_AUTO_NO_NM, i, true);
                                    nRow.EFFECT_FROM_DT = ggoSpread.GetText(C_EFFECT_FROM_DT, i, true);
                                    nRow.AUTO_FLAG = ggoSpread.GetText(C_AUTO_FLAG_CD, i, true);
                                    nRow.JOB_PREFIX = ggoSpread.GetText(C_JOB_PREFIX, i, true);
                                    nRow.DATE_TYPE = ggoSpread.GetText(C_DATE_TYPE, i, true);
                                    nRow.SERIAL_LEN = ggoSpread.GetText(C_SERIAL_LEN, i, true);
                                    nRow.SERIAL_DIGIT = ggoSpread.GetText(C_SERIAL_DIGIT, i, true);
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
    <eni:eniPageControl ID="tabMain" ClientInstanceName="tabMain" SkinID="BSL" runat="server" style="min-width:900px;">
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
                                                        <span class="CAP" onclick="cntxtAutoNotype.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtAutoNotype" ClientInstanceName="cntxtAutoNotype" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtAutoNotype_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtAutoNotype_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="deEffectFromDt.Focus()"><%= GetResource("CSTRESX00003") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniDateEdit ID="deEffectFromDt" ClientInstanceName="deEffectFromDt" runat="server" SkinID="BSL" EnterActionQuery="true" Width="100px">
                                                            <ValidationSettings SetFocusOnError="true" ValidationGroup="Condition"></ValidationSettings>
                                                        </eni:eniDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1DataMulti">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData" runat="server">
                                                <ClientSideEvents ButtonClicked="eni.LocalPage.vspdData_ButtonClicked"
                                                                Change="eni.LocalPage.vspdData_Change"
                                                                ComboSelChange="eni.LocalPage.vspdData_ComboSelChange"
                                                                BeforeEditMode="eni.LocalPage.vspdData_BeforeEditMode"
                                                                RightClick="eni.LocalPage.vspdData_RightClick" 
                                                                TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"/>
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