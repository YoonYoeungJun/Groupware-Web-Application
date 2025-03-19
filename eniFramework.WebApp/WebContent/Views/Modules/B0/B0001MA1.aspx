<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B0001MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B0.B0001MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 시스템설정
    *  2. Function Name        :
    *  3. Program ID           : B0001MA1.aspx
    *  4. Program Name         : 메세지 등록
    *  5. Program Desc         : 메세지 등록
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25InitSpreadSheetCombo
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
        chkUniCode      = ASPxClientCheckBox.Cast();
        tabMain         = ASPxClientTabControl.Cast();
        tab1Layout      = ASPxClientSplitter.Cast();
        cboMessageKind  = ASPxClientComboBox.Cast();
        cboMessageLevel = ASPxClientComboBox.Cast();
        txtMsgCode      = ASPxClientTextBox.Cast();
        txtMsgText      = ASPxClientTextBox.Cast();
        vspdDataCbProcess = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B0001MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_MSG_CD        = C_IDX++,
                    C_LANG          = C_IDX++,
                    C_MSG_ID        = C_IDX++,
                    C_MSG_TYPE      = C_IDX++,
                    C_MSG_TYPE_NM   = C_IDX++,
                    C_SERVERITY     = C_IDX++,
                    C_SERVERITY_NM  = C_IDX++,
                    C_MSG_TEXT      = C_IDX++;

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
                        cboMessageKind.Focus();
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

                        cboMessageKind.SetValue(null);
                        cboMessageLevel.SetValue(null);
                        txtMsgCode.SetText("");
                        txtMsgText.SetText("");

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
                        ggoSpread.MakeColumns(C_MSG_TEXT);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_MSG_CD, "<%= GetResource("CSTRESX00004") %>", 10, HAlign.Center, 7, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetCombo(C_LANG, "<%= GetResource("CSTRESX00006") %>", 8, HAlign.Center, CellKind.Protected, false, "KO" + ggoSpread.Source.ColSep + "EN" + ggoSpread.Source.ColSep + "CN" + ggoSpread.Source.ColSep + "JP");
                        ggoSpread.SSSetEdit(C_MSG_ID, "<%= GetResource("CSTRESX00007") %>", 10, HAlign.Center, 7, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetCombo(C_MSG_TYPE, "", 10, HAlign.Center, null, true);
                        ggoSpread.SSSetCombo(C_MSG_TYPE_NM, "<%= GetResource("CSTRESX00002") %>", 18, HAlign.Center, CellKind.Protected);
                        ggoSpread.SSSetCombo(C_SERVERITY, "", 15, HAlign.Center, null, true);
                        ggoSpread.SSSetCombo(C_SERVERITY_NM, "<%= GetResource("CSTRESX00003") %>", 10, HAlign.Center, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_MSG_TEXT, "<%= GetResource("CSTRESX00005") %>", 80, HAlign.Left, 5000, CellKind.Default);

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
                    lgStrSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0001' ORDER BY MINOR_CD ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(lgStrSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_MSG_TYPE, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_MSG_TYPE_NM, cboDataArr[1]);
                        }
                    }

                    lgStrSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0002' ORDER BY MINOR_CD ";
                    result = eni.DbAccess.ExecuteComboDataQuery(lgStrSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_SERVERITY, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_SERVERITY_NM, cboDataArr[1]);
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

                            ggoSpread.Source = vspdData;
                            ggoSpread.ClearSpreadData();

                            var strP1 = cboMessageKind.GetValue();
                            var strP2 = cboMessageLevel.GetValue();
                            var strP3 = txtMsgCode.GetText();
                            var strP4 = txtMsgText.GetText();

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
                        ggoSpread.Source = lgActiveSpread;
                        ggoSpread.ReDraw(false);

                        var activeRow = ggoSpread.InsertRows();
                        ggoSpread.SpreadRequired(C_MSG_CD, activeRow);
                        ggoSpread.SpreadRequired(C_LANG, activeRow);
                        ggoSpread.SpreadLock(C_MSG_ID, activeRow);
                        ggoSpread.SpreadRequired(C_MSG_TYPE_NM, activeRow);
                        ggoSpread.SpreadRequired(C_SERVERITY_NM, activeRow);

                        ggoSpread.SetValue(C_LANG, activeRow, 0);
                        ggoSpread.SetValue(C_MSG_TYPE, activeRow, 0);
                        ggoSpread.SetValue(C_MSG_TYPE_NM, activeRow, 0);
                        ggoSpread.SetValue(C_SERVERITY, activeRow, 0);
                        ggoSpread.SetValue(C_SERVERITY_NM, activeRow, 0);

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

                            ggoSpread.SpreadRequired(C_MSG_CD, copy_row);
                            ggoSpread.SpreadRequired(C_LANG, copy_row);
                            ggoSpread.SpreadLock(C_MSG_ID, copy_row);
                            ggoSpread.SpreadRequired(C_MSG_TYPE_NM, copy_row);
                            ggoSpread.SpreadRequired(C_SERVERITY_NM, copy_row);

                            ggoSpread.SetText(C_MSG_CD, copy_row, "");
                            ggoSpread.SetText(C_LANG, copy_row, ggoSpread.GetText(C_LANG, active_row, false));
                            ggoSpread.SetText(C_MSG_ID, copy_row, "");
                            ggoSpread.SetText(C_MSG_TYPE, copy_row, ggoSpread.GetText(C_MSG_TYPE, active_row, false));
                            this.vspdData_ComboSelChange(lgActiveSpread, C_MSG_TYPE, copy_row);
                            ggoSpread.SetText(C_SERVERITY, copy_row, ggoSpread.GetText(C_SERVERITY, active_row, false));
                            this.vspdData_ComboSelChange(lgActiveSpread, C_SERVERITY, copy_row);

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
                this.vspdData_ComboSelChange = function (pSender, pCol, pRow) {
                    try {
                        ggoSpread.Source = vspdData;

                        switch (pCol) {
                            case C_MSG_TYPE: ggoSpread.SetValue(C_MSG_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_MSG_TYPE_NM: ggoSpread.SetValue(C_MSG_TYPE, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_SERVERITY: ggoSpread.SetValue(C_SERVERITY_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_SERVERITY_NM: ggoSpread.SetValue(C_SERVERITY, pRow, ggoSpread.GetValue(pCol, pRow)); break;
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
                                            cboMessageKind.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        cboMessageKind.Focus();
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
                            MSG_TYPE: strP1,
                            SERVERITY: strP2,
                            MSG_CD: strP3,
                            MSG_TEXT: strP4,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                        hidFields.Set("strP2", strP2);
                        hidFields.Set("strP3", strP3);
                        hidFields.Set("strP4", strP4);
                        hidFields.Set("strP5", strP5);
                        hidFields.Set("strP6", strP6);
                        hidFields.Set("strP7", strP7);
                        hidFields.Set("strP8", strP8);
                        hidFields.Set("strP9", strP9);
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
                        var tbData = dsData.CreateDataTable("B0001MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("MSG_CD");
                        tbData.AddColumn("LANG");
                        tbData.AddColumn("MSG_ID");
                        tbData.AddColumn("MSG_TYPE");
                        tbData.AddColumn("SERVERITY");
                        tbData.AddColumn("MSG_TEXT");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.MSG_CD = ggoSpread.GetText(C_MSG_CD, i, true);
                                    nRow.LANG = ggoSpread.GetText(C_LANG, i, true);
                                    nRow.MSG_ID = ggoSpread.GetText(C_MSG_ID, i, true);
                                    nRow.MSG_TYPE = ggoSpread.GetText(C_MSG_TYPE, i, true);
                                    nRow.SERVERITY = ggoSpread.GetText(C_SERVERITY, i, true);
                                    nRow.MSG_TEXT = ggoSpread.GetText(C_MSG_TEXT, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.MSG_CD = ggoSpread.GetText(C_MSG_CD, i, true);
                                    nRow.LANG = ggoSpread.GetText(C_LANG, i, true);
                                    nRow.MSG_ID = ggoSpread.GetText(C_MSG_ID, i, true);
                                    nRow.MSG_TYPE = ggoSpread.GetText(C_MSG_TYPE, i, true);
                                    nRow.SERVERITY = ggoSpread.GetText(C_SERVERITY, i, true);
                                    nRow.MSG_TEXT = ggoSpread.GetText(C_MSG_TEXT, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.MSG_CD = ggoSpread.GetText(C_MSG_CD, i, true);
                                    nRow.LANG = ggoSpread.GetText(C_LANG, i, true);
                                    nRow.MSG_ID = ggoSpread.GetText(C_MSG_ID, i, true);
                                    nRow.MSG_ID = "";
                                    nRow.MSG_TYPE = "";
                                    nRow.SERVERITY = "";
                                    nRow.MSG_TEXT = "";
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
            <dx:TabPage Text="메세지 등록">
                <ContentCollection>
                    <dx:ContentControl>
                        <eni:eniSplitter ID="tab1Layout" ClientInstanceName="tab1Layout" runat="server" SkinID="BSL" ResizingMode="Live" SeparatorVisible="False">
                            <Panes>
                                <dx:SplitterPane Name="tab1Top" Size="30px" MaxSize="30px" Visible="false">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                        </dx:SplitterContentControl>
                                    </ContentCollection>
                                </dx:SplitterPane>
                                <dx:SplitterPane Name="tab1Con" Size="59px" MinSize="59px">
                                    <PaneStyle>
                                        <Paddings PaddingBottom="0" />
                                    </PaneStyle>
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <table class="BSL01TB" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cboMessageKind.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniComboBox ID="cboMessageKind" ClientInstanceName="cboMessageKind" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            ValueField="MINOR_CD" TextField="MINOR_NM">
                                                        </eni:eniComboBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cboMessageLevel.Focus()"><%= GetResource("CSTRESX00003") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniComboBox ID="cboMessageLevel" ClientInstanceName="cboMessageLevel" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            ValueField="MINOR_CD" TextField="MINOR_NM" >
                                                        </eni:eniComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtMsgCode.Focus()"><%= GetResource("CSTRESX00004")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtMsgCode" ClientInstanceName="txtMsgCode" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtMsgText.Focus()"><%= GetResource("CSTRESX00005") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtMsgText" ClientInstanceName="txtMsgText" runat="server" Width="80%" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
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
                                                <ClientSideEvents   TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
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