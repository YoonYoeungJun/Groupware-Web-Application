<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B3002MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B3.B3002MA1" Theme="eniThm" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B3002MA1.aspx
    *  4. Program Name         : 부서정보관리
    *  5. Program Desc         : 부서정보관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2014-07-25
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
        cntxtPlant          = ASPxClientTextBox.Cast();
        cntxtPlantName      = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B3002MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_BIZ_AREA_CD   = C_IDX++,
                    C_BIZ_AREA_NM   = C_IDX++,
                    C_PLANT_CD      = C_IDX++,
                    C_PLANT_NM      = C_IDX++,
                    C_DEPT_CD       = C_IDX++,
                    C_DEPT_NM       = C_IDX++,
                    C_PAR_DEPT_CD   = C_IDX++,
                    C_PAR_DEPT_BP   = C_IDX++,
                    C_PAR_DEPT_NM   = C_IDX++,
                    C_DEPT_FULL_NM  = C_IDX++,
                    C_DEPT_ENG_NM   = C_IDX++,
                    C_DEPT_NM_KO    = C_IDX++,
                    C_DEPT_NM_EN    = C_IDX++,
                    C_DEPT_NM_CN    = C_IDX++,
                    C_DEPT_NM_JP    = C_IDX++,
                    C_SEQ           = C_IDX++,
                    C_LVL           = C_IDX++,
                    C_END_DEPT_YN   = C_IDX++;

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
                        cntxtPlant.SetText("");
                        cntxtPlantName.SetText("");

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
                        ggoSpread.MakeColumns(C_END_DEPT_YN);
                        ggoSpread.SetMaxRows(0);
                        ggoSpread.SetUserColAction(UserColAction.Sort);

                        ggoSpread.SSSetCombo(C_BIZ_AREA_CD, "<%= GetResource("CSTRESX00002") %>", 10, null, null, true);
                        ggoSpread.SSSetCombo(C_BIZ_AREA_NM, "<%= GetResource("CSTRESX00003") %>", 12, HAlign.Left, CellKind.Protected);
                        ggoSpread.SSSetCombo(C_PLANT_CD, "<%= GetResource("CSTRESX00004") %>", 10, null, null, true);
                        ggoSpread.SSSetCombo(C_PLANT_NM, "<%= GetResource("CSTRESX00005") %>", 12, HAlign.Left, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_DEPT_CD, "<%= GetResource("CSTRESX00006") %>", 8, HAlign.Left, 5, CellKind.Protected, null, EditCharCase.UpperCase);
                        ggoSpread.SSSetEdit(C_DEPT_NM, "<%= GetResource("CSTRESX00007") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_PAR_DEPT_CD, "<%= GetResource("CSTRESX00008") %>", 8, HAlign.Left, 5, CellKind.Default, null, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C_PAR_DEPT_BP);
                        ggoSpread.SSSetEdit(C_PAR_DEPT_NM, "<%= GetResource("CSTRESX00009") %>", 17, HAlign.Left, 50, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_DEPT_FULL_NM, "<%= GetResource("CSTRESX00010") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_DEPT_ENG_NM, "<%= GetResource("CSTRESX00011") %>", 20, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_DEPT_NM_KO, "<%= GetResource("CSTRESX00012") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_DEPT_NM_EN, "<%= GetResource("CSTRESX00013") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_DEPT_NM_CN, "<%= GetResource("CSTRESX00014") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_DEPT_NM_JP, "<%= GetResource("CSTRESX00015") %>", 17, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_SEQ, "<%= GetResource("CSTRESX00016") %>", 8, HAlign.Center, 5, CellKind.Required);
                        ggoSpread.SSSetEdit(C_LVL, "<%= GetResource("CSTRESX00017") %>", 5, HAlign.Center, 2, CellKind.Required);
                        ggoSpread.SSSetCheck(C_END_DEPT_YN, "<%= GetResource("CSTRESX00018") %>", 10);

                        //ggoSpread.SSSetColHidden(C_END_DEPT_YN + 1, C_END_DEPT_YN + 1, true);

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
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.InitSpreadSheetCombo = function () {
                    var strSql = "SELECT BIZ_AREA_CD, BIZ_AREA_NM_" + lgLang + " FROM S_BIZ_AREA ORDER BY BIZ_AREA_CD ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_BIZ_AREA_CD, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_BIZ_AREA_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT ORDER BY PLANT_CD ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1]);
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

                            var strP1 = cntxtBizArea.GetText();
                            var strP2 = cntxtPlant.GetText();

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
                        ggoSpread.SpreadRequired(C_BIZ_AREA_NM, activeRow);
                        ggoSpread.SpreadRequired(C_PLANT_NM, activeRow);
                        ggoSpread.SpreadRequired(C_DEPT_CD, activeRow);

                        ggoSpread.SSetComboData(C_PLANT_CD, "", activeRow);
                        ggoSpread.SSetComboData(C_PLANT_NM, "", activeRow);

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
                        popArgs.Title = "<%= GetResource("CSTRESX00019")%>";
                        popArgs.AddColumn("BIZ_AREA_CD", "<%= GetResource("CSTRESX00002")%>", 10);
                        popArgs.AddColumn("BIZ_AREA_NM_" + lgLang, "<%= GetResource("CSTRESX00003")%>", 15);
                        popArgs.From = "S_BIZ_AREA";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtBizArea.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_CD"]);
                            cntxtBizAreaName.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtPlant_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_PLANT", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtPlantName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtPlantName.SetText("");
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                        cntxtPlantName.Focus();
                                    });
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtPlantName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtPlant_PopupButtonClick = function (s, e) {
                    try {
                        if (String(cntxtBizArea.GetText()).trim() === "") {
                            eni.Message.DisplayCodeMsgBox("common.error", "20B400");
                            return;
                        }

                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00020")%>";
                        popArgs.AddColumn("PLANT_CD", "<%= GetResource("CSTRESX00004")%>", 10);
                        popArgs.AddColumn("PLANT_NM_" + lgLang, "<%= GetResource("CSTRESX00005")%>", 15);
                        popArgs.From = "S_PLANT";
                        popArgs.Where = "BIZ_AREA_CD = " + eni.Data.FilterVariable(cntxtBizArea.GetText());
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtPlant.SetText(arry.Tables[0].Rows[0]["PLANT_CD"]);
                            cntxtPlantName.SetText(arry.Tables[0].Rows[0]["PLANT_NM_" + lgLang]);
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

                this.vspdData_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        ggoSpread.Source = pSender;

                        switch (pCol) {
                            case C_PAR_DEPT_CD:
                                lgStrSql = "";
                                lgStrSql += " SELECT * FROM S_ACCT_DEPT ";
                                lgStrSql += " WHERE DEPT_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(pCol, pRow));
                                lgStrSql += " AND DEPT_CD != " + eni.Data.FilterVariable(ggoSpread.GetText(C_DEPT_CD, pRow));

                                var result = eni.DbAccess.ExecuteDataSet(lgStrSql, "S_ACCT_DEPT");
                                if (result.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), result.Message);
                                } else {
                                    if (result.DataSet.S_ACCT_DEPT && result.DataSet.S_ACCT_DEPT.length > 0) {
                                        ggoSpread.SetText(C_PAR_DEPT_NM, pRow, result.DataSet.S_ACCT_DEPT[0]["DEPT_NM_" + lgLang]);
                                    } else {
                                        ggoSpread.SetText(C_PAR_DEPT_CD, pRow, "");
                                        ggoSpread.SetText(C_PAR_DEPT_NM, pRow, "");
                                    }
                                }
                                break;
                        }
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.vspdData_ButtonClick = function (pSender, pCol, pRow) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();

                        switch (pCol) {
                            case C_PAR_DEPT_BP:
                                popArgs.Title = "부서";
                                popArgs.AddColumn("DEPT_CD", "부서코드", 10);
                                popArgs.AddColumn("DEPT_NM_" + lgLang, "부서명", 15);
                                popArgs.From = "S_ACCT_DEPT";
                                popArgs.WinSize = new WindowSize(400, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SetText(C_PAR_DEPT_CD, pRow, arry.Tables[0].Rows[0]["DEPT_CD"]);
                                    ggoSpread.SetText(C_PAR_DEPT_NM, pRow, arry.Tables[0].Rows[0]["DEPT_NM_" + lgLang]);
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
                            case C_BIZ_AREA_CD: ggoSpread.SetValue(C_BIZ_AREA_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_BIZ_AREA_NM:
                                ggoSpread.SetValue(C_BIZ_AREA_CD, pRow, ggoSpread.GetValue(pCol, pRow));

                                var plantData = function (result) {
                                    if (result.Value) {
                                        if (result.Value) {
                                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                            ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0], pRow);
                                            ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1], pRow);
                                        }
                                    }
                                };
                                
                                ggoSpread.Source = pSender;
                                var cmd = new DbAccessCommandClass();
                                cmd.CommandType = DbAccess.CommandType.Text;
                                cmd.CommandText = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT WHERE BIZ_AREA_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(C_BIZ_AREA_CD, pRow)) + " ORDER BY PLANT_CD ";
                                eni.DbAccess.ExcuteComboDataQuery(cmd, plantData);
                                break;
                            case C_PLANT_CD: ggoSpread.SetValue(C_PLANT_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_PLANT_NM: ggoSpread.SetValue(C_PLANT_CD, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                        }
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
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
                            BIZ_AREA_CD: strP1,
                            PLANT_CD: strP2,
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
                        var tbData = dsData.CreateDataTable("B3002MA1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("BIZ_AREA_CD");
                        tbData.AddColumn("PLANT_CD");
                        tbData.AddColumn("DEPT_CD");
                        tbData.AddColumn("DEPT_NM");
                        tbData.AddColumn("PAR_DEPT_CD");
                        tbData.AddColumn("PAR_DEPT_NM");
                        tbData.AddColumn("DEPT_FULL_NM");
                        tbData.AddColumn("DEPT_ENG_NM");
                        tbData.AddColumn("DEPT_NM_KO");
                        tbData.AddColumn("DEPT_NM_EN");
                        tbData.AddColumn("DEPT_NM_CN");
                        tbData.AddColumn("DEPT_NM_JP");
                        tbData.AddColumn("SEQ");
                        tbData.AddColumn("LVL");
                        tbData.AddColumn("END_DEPT_YN");
    
                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, true);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, true);
                                    nRow.DEPT_NM = ggoSpread.GetText(C_DEPT_NM, i, true);
                                    nRow.PAR_DEPT_CD = ggoSpread.GetText(C_PAR_DEPT_CD, i, true);
                                    nRow.PAR_DEPT_NM = ggoSpread.GetText(C_PAR_DEPT_NM, i, true);
                                    nRow.DEPT_FULL_NM = ggoSpread.GetText(C_DEPT_FULL_NM, i, true);
                                    nRow.DEPT_ENG_NM = ggoSpread.GetText(C_DEPT_ENG_NM, i, true);
                                    nRow.DEPT_NM_KO = ggoSpread.GetText(C_DEPT_NM_KO, i, true);
                                    nRow.DEPT_NM_EN = ggoSpread.GetText(C_DEPT_NM_EN, i, true);
                                    nRow.DEPT_NM_CN = ggoSpread.GetText(C_DEPT_NM_CN, i, true);
                                    nRow.DEPT_NM_JP = ggoSpread.GetText(C_DEPT_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.LVL = ggoSpread.GetText(C_LVL, i, true);
                                    if (ggoSpread.GetText(C_END_DEPT_YN, i) === "1") {
                                        nRow.END_DEPT_YN = "Y";
                                    } else {
                                        nRow.END_DEPT_YN = "N";
                                    }
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, true);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, true);
                                    nRow.DEPT_NM = ggoSpread.GetText(C_DEPT_NM, i, true);
                                    nRow.PAR_DEPT_CD = ggoSpread.GetText(C_PAR_DEPT_CD, i, true);
                                    nRow.PAR_DEPT_NM = ggoSpread.GetText(C_PAR_DEPT_NM, i, true);
                                    nRow.DEPT_FULL_NM = ggoSpread.GetText(C_DEPT_FULL_NM, i, true);
                                    nRow.DEPT_ENG_NM = ggoSpread.GetText(C_DEPT_ENG_NM, i, true);
                                    nRow.DEPT_NM_KO = ggoSpread.GetText(C_DEPT_NM_KO, i, true);
                                    nRow.DEPT_NM_EN = ggoSpread.GetText(C_DEPT_NM_EN, i, true);
                                    nRow.DEPT_NM_CN = ggoSpread.GetText(C_DEPT_NM_CN, i, true);
                                    nRow.DEPT_NM_JP = ggoSpread.GetText(C_DEPT_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.LVL = ggoSpread.GetText(C_LVL, i, true);
                                    if (ggoSpread.GetText(C_END_DEPT_YN, i) === "1") {
                                        nRow.END_DEPT_YN = "Y";
                                    } else {
                                        nRow.END_DEPT_YN = "N";
                                    }
                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, true);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, true);
                                    nRow.DEPT_NM = ggoSpread.GetText(C_DEPT_NM, i, true);
                                    nRow.PAR_DEPT_CD = ggoSpread.GetText(C_PAR_DEPT_CD, i, true);
                                    nRow.PAR_DEPT_NM = ggoSpread.GetText(C_PAR_DEPT_NM, i, true);
                                    nRow.DEPT_FULL_NM = ggoSpread.GetText(C_DEPT_FULL_NM, i, true);
                                    nRow.DEPT_ENG_NM = ggoSpread.GetText(C_DEPT_ENG_NM, i, true);
                                    nRow.DEPT_NM_KO = ggoSpread.GetText(C_DEPT_NM_KO, i, true);
                                    nRow.DEPT_NM_EN = ggoSpread.GetText(C_DEPT_NM_EN, i, true);
                                    nRow.DEPT_NM_CN = ggoSpread.GetText(C_DEPT_NM_CN, i, true);
                                    nRow.DEPT_NM_JP = ggoSpread.GetText(C_DEPT_NM_JP, i, true);
                                    nRow.SEQ = ggoSpread.GetText(C_SEQ, i, true);
                                    nRow.LVL = ggoSpread.GetText(C_LVL, i, true);
                                    if (ggoSpread.GetText(C_END_DEPT_YN, i) === "1") {
                                        nRow.END_DEPT_YN = "Y";
                                    } else {
                                        nRow.END_DEPT_YN = "N";
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
                                                        <span class="CAP" onclick="cntxtBizArea.Focus()"><%= GetResource("CSTRESX00019")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtBizArea" ClientInstanceName="cntxtBizArea" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtBizArea_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtBizArea_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtPlant.Focus()"><%= GetResource("CSTRESX00020")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtPlant" ClientInstanceName="cntxtPlant" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtPlant_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtPlant_PopupButtonClick" />
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
                                            <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData"  runat="server" ActiveXVersion="vspdDFPOBSPD7">
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
        <ClientSideEvents  CallbackComplete="eni.LocalPage.vspdDataCbProcess_CallbackComplete" 
                        CallbackError="eni.LocalPage.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>