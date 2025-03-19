<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B4000MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B4.B4000MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B4000MA1.aspx
    *  4. Program Name         : 사용자정보관리
    *  5. Program Desc         : 사용자정보관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2017-04-20
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
        cntxtBizArea        = ASPxClientTextBox.Cast();
        cntxtBizAreaName    = ASPxClientTextBox.Cast();
        cntxtPlant          = ASPxClientTextBox.Cast();
        cntxtPlantName      = ASPxClientTextBox.Cast();
        cntxtDept           = ASPxClientTextBox.Cast();
        cntxtDeptName       = ASPxClientTextBox.Cast();
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
            var B4000MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_USR_ID        = C_IDX++,
                    C_ERP_NO        = C_IDX++,
                    C_USR_VALID_DT  = C_IDX++,
                    C_ORG_PWD       = C_IDX++,
                    C_PWD           = C_IDX++,
                    C_PWD_VALID_DT  = C_IDX++,
                    C_PWD_SCT       = C_IDX++,
                    C_DOMAIN        = C_IDX++,
                    C_DOMAIN_NM     = C_IDX++,
                    C_FIRST_NAME    = C_IDX++,
                    C_LAST_NAME     = C_IDX++,
                    C_NAME          = C_IDX++,
                    C_ENG_NAME      = C_IDX++,
                    C_HANJA_NAME    = C_IDX++,
                    C_BIRT_DAY      = C_IDX++,
                    C_USR_KIND      = C_IDX++,
                    C_USR_KIND_NM   = C_IDX++,
                    C_USR_TYPE      = C_IDX++,
                    C_USR_TYPE_NM   = C_IDX++,
                    C_USR_GUBUN     = C_IDX++,
                    C_USR_GUBUN_NM  = C_IDX++,
                    C_BIZ_AREA_CD   = C_IDX++,
                    C_BIZ_AREA_NM   = C_IDX++,
                    C_PLANT_CD      = C_IDX++,
                    C_PLANT_NM      = C_IDX++,
                    C_DEPT_CD       = C_IDX++,
                    C_DEPT_NM       = C_IDX++,
                    C_ROLE_PSTN     = C_IDX++,
                    C_ROLE_PSTN_NM  = C_IDX++,
                    C_ENTR_DT       = C_IDX++,
                    C_EXT_MAIL_ADDR = C_IDX++,
                    C_ZIP_CODE      = C_IDX++,
                    C_ADDR          = C_IDX++,
                    C_TEL_NO        = C_IDX++,
                    C_EM_TEL_NO     = C_IDX++,
                    C_HAND_TEL_NO   = C_IDX++,
                    C_ORG_ADMIN_YN  = C_IDX++,
                    C_ADMIN_YN      = C_IDX++,
                    C_ORG_USE_MAIL_YN = C_IDX++,
                    C_USE_MAIL_YN   = C_IDX++,
                    C_MAIL_ADDR     = C_IDX++,
                    C_MAIL_SIZE     = C_IDX++,
                    C_MAIL_LEVEL    = C_IDX++,
                    C_REMARK        = C_IDX++,
                    C_ORG_USE_YN    = C_IDX++,
                    C_USE_YN        = C_IDX++

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
                        ggoSpread.Source = vspdData;
                        ggoSpread.ReDraw(false);
                        ggoSpread.MakeColumns(C_USE_YN);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_USR_ID, "<%= GetResource("CSTRESX00002") %>", 15, HAlign.Left, 20, CellKind.Protected, false);
                        ggoSpread.SSSetEdit(C_ERP_NO, "<%= GetResource("CSTRESX00003") %>", 7, HAlign.Center, 5);
                        ggoSpread.SSSetDate(C_USR_VALID_DT, "<%= GetResource("CSTRESX00004") %>", 8, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetEdit(C_ORG_PWD, "<%= GetResource("CSTRESX00005") %>", 10, HAlign.Left, 50, CellKind.Default, true, EditCharCase.NoCase);
                        ggoSpread.SSSetEdit(C_PWD, "<%= GetResource("CSTRESX00006") %>", 15, HAlign.Left, 50, CellKind.Required, false, EditCharCase.NoCase, null, true);
                        ggoSpread.SSSetDate(C_PWD_VALID_DT, "<%= GetResource("CSTRESX00007") %>", 12, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetEdit(C_PWD_SCT, "<%= GetResource("CSTRESX00008") %>", 10, HAlign.Left, 50, CellKind.Default, true);
                        ggoSpread.SSSetCombo(C_DOMAIN, "", 10, HAlign.Center, null, true);
                        ggoSpread.SSSetCombo(C_DOMAIN_NM, "<%= GetResource("CSTRESX00009") %>", 17, HAlign.Center, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_FIRST_NAME, "<%= GetResource("CSTRESX00010") %>", 6, HAlign.Left, 10, CellKind.Required);
                        ggoSpread.SSSetEdit(C_LAST_NAME, "<%= GetResource("CSTRESX00011") %>", 7, HAlign.Left, 20, CellKind.Required);
                        ggoSpread.SSSetEdit(C_NAME, "<%= GetResource("CSTRESX00012") %>", 8, HAlign.Left, 30, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_ENG_NAME, "<%= GetResource("CSTRESX00013") %>", 12, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_HANJA_NAME, "<%= GetResource("CSTRESX00014") %>", 12, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetDate(C_BIRT_DAY, "<%= GetResource("CSTRESX00015") %>", 8, HAlign.Center, CellKind.Required, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetCombo(C_USR_KIND, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_KIND_NM, "<%= GetResource("CSTRESX00016") %>", 11, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_USR_TYPE, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_TYPE_NM, "<%= GetResource("CSTRESX00017") %>", 9, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_USR_GUBUN, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_USR_GUBUN_NM, "<%= GetResource("CSTRESX00018") %>", 14, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_BIZ_AREA_CD, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_BIZ_AREA_NM, "<%= GetResource("CSTRESX00019") %>", 14, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_PLANT_CD, "", 10, HAlign.Left, CellKind.Protected, true);
                        ggoSpread.SSSetCombo(C_PLANT_NM, "<%= GetResource("CSTRESX00020") %>", 11, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_DEPT_CD, "", 10, HAlign.Left, CellKind.Protected, true);
                        ggoSpread.SSSetCombo(C_DEPT_NM, "<%= GetResource("CSTRESX00021") %>", 12, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetCombo(C_ROLE_PSTN, "", 10, HAlign.Left, null, true);
                        ggoSpread.SSSetCombo(C_ROLE_PSTN_NM, "<%= GetResource("CSTRESX00022") %>", 10, HAlign.Left, CellKind.Required);
                        ggoSpread.SSSetDate(C_ENTR_DT, "<%= GetResource("CSTRESX00023") %>", 8, HAlign.Center, CellKind.Default, false, DateFormat.YYMMDD);
                        ggoSpread.SSSetEdit(C_EXT_MAIL_ADDR, "<%= GetResource("CSTRESX00024") %>", 15, HAlign.Left, 50);
                        ggoSpread.SSSetEdit(C_ZIP_CODE, "<%= GetResource("CSTRESX00025") %>", 8, HAlign.Left, 10, CellKind.Default);
                        ggoSpread.SSSetEdit(C_ADDR, "<%= GetResource("CSTRESX00026") %>", 40, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetEdit(C_TEL_NO, "<%= GetResource("CSTRESX00027") %>", 10, HAlign.Left, 15, CellKind.Default);
                        ggoSpread.SSSetEdit(C_EM_TEL_NO, "<%= GetResource("CSTRESX00028") %>", 10, HAlign.Left, 15, CellKind.Default);
                        ggoSpread.SSSetEdit(C_HAND_TEL_NO, "<%= GetResource("CSTRESX00029") %>", 10, HAlign.Left, 15, CellKind.Required);
                        ggoSpread.SSSetCheck(C_ORG_ADMIN_YN, "<%= GetResource("CSTRESX00030") %>", 5, null, true);
                        ggoSpread.SSSetCheck(C_ADMIN_YN, "<%= GetResource("CSTRESX00031") %>", 5);
                        ggoSpread.SSSetCheck(C_ORG_USE_MAIL_YN, "<%= GetResource("CSTRESX00032") %>", 5, null, true);
                        ggoSpread.SSSetCheck(C_USE_MAIL_YN, "<%= GetResource("CSTRESX00033") %>", 5);
                        ggoSpread.SSSetEdit(C_MAIL_ADDR, "<%= GetResource("CSTRESX00034") %>", 20, HAlign.Left, 30, CellKind.Protected);
                        ggoSpread.SSSetFloat(C_MAIL_SIZE, "<%= GetResource("CSTRESX00035") %>", 8, HAlign.Right, CellKind.Required, false, ",", ".", 0, null, CurrencyLeadingZero.LeadingZeroYes, 0, 10240);
                        ggoSpread.SSSetFloat(C_MAIL_LEVEL, "<%= GetResource("CSTRESX00036") %>", 8, HAlign.Right, CellKind.Default, false, ",", ".", 0, null, CurrencyLeadingZero.LeadingZeroYes, 0, 3);
                        ggoSpread.SSSetEdit(C_REMARK, "<%= GetResource("CSTRESX00037") %>", 30, HAlign.Left, 100, CellKind.Default);
                        ggoSpread.SSSetCheck(C_ORG_USE_YN, "<%= GetResource("CSTRESX00038") %>", 7, null, true);
                        ggoSpread.SSSetCheck(C_USE_YN, "<%= GetResource("CSTRESX00039") %>", 7);

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
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.InitSpreadSheetCombo = function () {
                    var strSql = "SELECT DOMAINNAME, DOMAINSENDNAME FROM V_MAIL_DOMAINS WHERE DOMAINACTIVE = 1 ORDER BY DOMAINID ";
                    var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_DOMAIN, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_DOMAIN_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0003' ORDER BY MINOR_CD ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_KIND, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_KIND_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0004' ORDER BY MINOR_CD ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_TYPE, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_TYPE_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0005' ORDER BY MINOR_CD ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_USR_GUBUN, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_USR_GUBUN_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT BIZ_AREA_CD, BIZ_AREA_NM_" + lgLang + " FROM S_BIZ_AREA ORDER BY SEQ ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_BIZ_AREA_CD, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_BIZ_AREA_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT ORDER BY SEQ ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT DEPT_CD, DEPT_NM FROM S_ACCT_DEPT ORDER BY SEQ ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_DEPT_CD, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_DEPT_NM, cboDataArr[1]);
                        }
                    }

                    strSql = "SELECT MINOR_CD, MINOR_NM_" + lgLang + " MINOR_NM FROM B_MINOR WHERE MAJOR_CD = 'S0006' AND USE_YN = 'Y' ";
                    result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                    if (result.Value) {
                        if (result.Value) {
                            var cboDataArr = String(result.Value).split(vspdData.RowSep);
                            ggoSpread.Source = vspdData;
                            ggoSpread.SSetComboData(C_ROLE_PSTN, cboDataArr[0]);
                            ggoSpread.SSetComboData(C_ROLE_PSTN_NM, cboDataArr[1]);
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
                            var strP3 = cntxtDept.GetText();
                            var strP4 = txtErpNo.GetText();
                            var strP5 = txtName.GetText();
                            var strP6 = txtUsrId.GetText();

                            eni.LocalPage.DbQuery(strP1, strP2, strP3, strP4, strP5, strP6);
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
                      

                        ggoSpread.SpreadRequired(C_USR_ID, activeRow);
                        ggoSpread.SpreadRequired(C_DOMAIN_NM, activeRow);

                        ggoSpread.SetText(C_USR_VALID_DT, activeRow, "2999-12-31");
                        ggoSpread.SetText(C_PWD_VALID_DT, activeRow, "2999-12-31");
                        ggoSpread.SetValue(C_DOMAIN, activeRow, 0);
                        ggoSpread.SetValue(C_DOMAIN_NM, activeRow, 0);
                        ggoSpread.SetValue(C_USR_KIND, activeRow, 0);
                        ggoSpread.SetValue(C_USR_KIND_NM, activeRow, 0);
                        ggoSpread.SetValue(C_USR_TYPE, activeRow, 0);
                        ggoSpread.SetValue(C_USR_TYPE_NM, activeRow, 0);
                        ggoSpread.SetValue(C_USR_GUBUN, activeRow, 0);
                        ggoSpread.SetValue(C_USR_GUBUN_NM, activeRow, 0);
                        ggoSpread.SetValue(C_USE_MAIL_YN, activeRow, 1);
                        ggoSpread.SetValue(C_MAIL_SIZE, activeRow, 3072);
                        ggoSpread.SetValue(C_MAIL_LEVEL, activeRow, 0);
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
                           
                            ggoSpread.SpreadRequired(C_USR_ID, copy_row);
                            ggoSpread.SpreadRequired(C_USR_VALID_DT, copy_row, C_ORG_ADMIN_YN, copy_row);
                            ggoSpread.SpreadLock(C_NAME, copy_row);
                            ggoSpread.SpreadUnLock(C_ENTR_DT, copy_row, C_EM_TEL_NO, copy_row);
                            ggoSpread.SpreadLock(C_MAIL_ADDR, copy_row);
                            ggoSpread.SpreadRequired(C_MAIL_SIZE, copy_row);

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
                            ggoSpread.SetText(C_MAIL_SIZE, copy_row, ggoSpread.GetText(C_MAIL_SIZE, active_row, false));
                            ggoSpread.SetText(C_MAIL_LEVEL, copy_row, ggoSpread.GetText(C_MAIL_LEVEL, active_row, false));
                            ggoSpread.SetText(C_USE_YN, copy_row, ggoSpread.GetText(C_USE_YN, active_row, false));

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

                this.cntxtBizArea_CodeBoxValueChanged = function (s, e) {
                    try {
                        var result = eni.DbAccess.ExecuteCodeName("S_BIZ_AREA", s.GetText());
                        if (!result.Code) {
                            if (result.Value) {
                                cntxtBizAreaName.SetText(result.Value);
                            } else {
                                s.SetText("");
                                cntxtBizAreaName.SetText("");
                            }
                        } else {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtBizArea_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00046")%>";
                        popArgs.AddColumn("BIZ_AREA_CD", "<%= GetResource("CSTRESX00046")%>", 10);
                        popArgs.AddColumn("BIZ_AREA_NM_" + lgLang + " BIZ_AREA_NM", "<%= GetResource("CSTRESX00047")%>", 15);
                        popArgs.From = "S_BIZ_AREA";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtBizArea.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_CD"]);
                            cntxtBizAreaName.SetText(arry.Tables[0].Rows[0]["BIZ_AREA_NM"]);
                        }
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.cntxtPlant_CodeBoxValueChanged = function (s, e) {
                    try {
                        if (String(cntxtBizArea.GetText()).trim() === "") {
                            eni.Message.DisplayCodeMsgBox("common.error", "20B400");
                            return;
                        }

                        var result = eni.DbAccess.ExecuteCodeName("S_PLANT", s.GetText());
                        if (!result.Code) {
                            if (result.Value) {
                                cntxtPlantName.SetText(result.Value);
                            } else {
                                s.SetText("");
                                cntxtPlantName.SetText("");
                            }
                        } else {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
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
                        popArgs.Title = "<%= GetResource("CSTRESX00048")%>";
                        popArgs.AddColumn("PLANT_CD", "<%= GetResource("CSTRESX00048")%>", 10);
                        popArgs.AddColumn("PLANT_NM_" + lgLang + " PLANT_NM ", "<%= GetResource("CSTRESX00049")%>", 15);
                        popArgs.From = "S_PLANT";
                        popArgs.Where = "BIZ_AREA_CD = " + eni.Data.FilterVariable(cntxtBizArea.GetText());
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtPlant.SetText(arry.Tables[0].Rows[0]["PLANT_CD"]);
                            cntxtPlantName.SetText(arry.Tables[0].Rows[0]["PLANT_NM"]);
                        }
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.cntxtDept_CodeBoxValueChanged = function (s, e) {
                    try {
                        var result = eni.DbAccess.ExecuteCodeName("S_ACCT_DEPT", s.GetText());
                        if (!result.Code) {
                            if (result.Value) {
                                cntxtDeptName.SetText(result.Value);
                            } else {
                                s.SetText("");
                                cntxtDeptName.SetText("");
                            }
                        } else {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cntxtDept_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00050")%>";
                        popArgs.AddColumn("DEPT_CD", "<%= GetResource("CSTRESX00050")%>", 10);
                        popArgs.AddColumn("DEPT_NM_" + lgLang, "<%= GetResource("CSTRESX00051")%>", 15);
                        popArgs.From = "S_ACCT_DEPT";
                        if (cntxtPlant.GetText() != "") {
                            popArgs.Where = "PLANT_CD = " + eni.Data.FilterVariable(cntxtPlant.GetText());
                        }
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtDept.SetText(arry.Tables[0].Rows[0]["DEPT_CD"]);
                            cntxtDeptName.SetText(arry.Tables[0].Rows[0]["DEPT_NM_" + lgLang]);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                    }
                };

                this.vspdData_Change = function (pSender, pCol, pRow, pOrgData) {
                    try {
                        ggoSpread.Source = vspdData;

                        switch (pCol) {
                            case C_PWD:
                                ggoSpread.Source = pSender;
                                ggoSpread.SetText(C_PWD_SCT, pRow, ggoSpread.GetText(C_PWD, pRow));
                                break;
                            case C_FIRST_NAME:
                                ggoSpread.Source = pSender;
                                ggoSpread.SetText(C_NAME, pRow, ggoSpread.GetText(C_FIRST_NAME, pRow) + ggoSpread.GetText(C_LAST_NAME, pRow));
                                break;
                            case C_LAST_NAME:
                                ggoSpread.Source = pSender;
                                ggoSpread.SetText(C_NAME, pRow, ggoSpread.GetText(C_FIRST_NAME, pRow) + ggoSpread.GetText(C_LAST_NAME, pRow));
                                break;
                            case C_USR_ID:
                            case C_DOMAIN:
                                ggoSpread.SetValue(C_DOMAIN_NM, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.SetText(C_MAIL_ADDR, pRow, ggoSpread.GetText(C_USR_ID, pRow) + "@" + ggoSpread.GetText(C_DOMAIN_NM, pRow));
                                break;
                            case C_DOMAIN_NM:
                                ggoSpread.SetValue(C_DOMAIN, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.SetText(C_MAIL_ADDR, pRow, ggoSpread.GetText(C_USR_ID, pRow) + "@" + ggoSpread.GetText(C_DOMAIN_NM, pRow));
                                break;
                            case C_USR_KIND: ggoSpread.SetValue(C_USR_KIND_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_KIND_NM: ggoSpread.SetValue(C_USR_KIND, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE: ggoSpread.SetValue(C_USR_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE_NM: ggoSpread.SetValue(C_USR_TYPE, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN: ggoSpread.SetValue(C_USR_GUBUN_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN_NM: ggoSpread.SetValue(C_USR_GUBUN, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_BIZ_AREA_CD: ggoSpread.SetValue(C_BIZ_AREA_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_BIZ_AREA_NM:
                                ggoSpread.SetValue(C_BIZ_AREA_CD, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.Source = pSender;
                                var strSql = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT WHERE BIZ_AREA_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(C_BIZ_AREA_CD, pRow)) + " ORDER BY PLANT_CD ";
                                var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                if (result.Value) {
                                    if (result.Value) {
                                        var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                        ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0], pRow);
                                        ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1], pRow);
                                    }
                                }
                                ggoSpread.SSetComboData(C_DEPT_CD, "", pRow);
                                ggoSpread.SSetComboData(C_DEPT_NM, "", pRow);
                                break;
                            case C_PLANT_CD: ggoSpread.SetValue(C_PLANT_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_PLANT_NM:
                                ggoSpread.SetValue(C_PLANT_CD, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.Source = pSender;
                                var strSql = "SELECT DEPT_CD, DEPT_NM_" + lgLang + " FROM S_ACCT_DEPT WHERE PLANT_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(C_PLANT_CD, pRow)) + " ORDER BY PLANT_CD ";
                                var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                if (result.Value) {
                                    if (result.Value) {
                                        var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                        ggoSpread.SSetComboData(C_DEPT_CD, cboDataArr[0], pRow);
                                        ggoSpread.SSetComboData(C_DEPT_NM, cboDataArr[1], pRow);
                                    }
                                }
                                break;
                            case C_DEPT_CD: ggoSpread.SetValue(C_DEPT_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_DEPT_NM: ggoSpread.SetValue(C_DEPT_CD, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_ROLE_PSTN: ggoSpread.SetValue(C_ROLE_PSTN_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_ROLE_PSTN_NM: ggoSpread.SetValue(C_ROLE_PSTN, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData_ComboSelChange = function (pSender, pCol, pRow) {
                    try {
                        ggoSpread.Source = vspdData;

                        switch (pCol) {
                            case C_DOMAIN:
                                ggoSpread.SetValue(C_DOMAIN_NM, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.SetText(C_MAIL_ADDR, pRow, ggoSpread.GetText(C_USR_ID, pRow) + "@" + ggoSpread.GetText(C_DOMAIN_NM, pRow));
                                break;
                            case C_DOMAIN_NM:
                                ggoSpread.SetValue(C_DOMAIN, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.SetText(C_MAIL_ADDR, pRow, ggoSpread.GetText(C_USR_ID, pRow) + "@" + ggoSpread.GetText(C_DOMAIN_NM, pRow));
                                break;
                            case C_USR_KIND: ggoSpread.SetValue(C_USR_KIND_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_KIND_NM: ggoSpread.SetValue(C_USR_KIND, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE: ggoSpread.SetValue(C_USR_TYPE_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_TYPE_NM: ggoSpread.SetValue(C_USR_TYPE, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN: ggoSpread.SetValue(C_USR_GUBUN_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_USR_GUBUN_NM: ggoSpread.SetValue(C_USR_GUBUN, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_BIZ_AREA_CD: ggoSpread.SetValue(C_BIZ_AREA_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_BIZ_AREA_NM:
                                ggoSpread.SetValue(C_BIZ_AREA_CD, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.Source = pSender;
                                var strSql = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT WHERE BIZ_AREA_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(C_BIZ_AREA_CD, pRow)) + " ORDER BY PLANT_CD ";
                                var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                if (result.Value) {
                                    if (result.Value) {
                                        var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                        ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0], pRow);
                                        ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1], pRow);
                                    }
                                }
                                ggoSpread.SSetComboData(C_DEPT_CD, "", pRow);
                                ggoSpread.SSetComboData(C_DEPT_NM, "", pRow);
                                break;
                            case C_PLANT_CD: ggoSpread.SetValue(C_PLANT_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_PLANT_NM:
                                ggoSpread.SetValue(C_PLANT_CD, pRow, ggoSpread.GetValue(pCol, pRow));
                                ggoSpread.Source = pSender;
                                var strSql = "SELECT DEPT_CD, DEPT_NM_" + lgLang + " FROM S_ACCT_DEPT WHERE PLANT_CD = " + eni.Data.FilterVariable(ggoSpread.GetText(C_PLANT_CD, pRow)) + " ORDER BY PLANT_CD ";
                                var result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                if (result.Value) {
                                    if (result.Value) {
                                        var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                        ggoSpread.SSetComboData(C_DEPT_CD, cboDataArr[0], pRow);
                                        ggoSpread.SSetComboData(C_DEPT_NM, cboDataArr[1], pRow);
                                    }
                                }
                                break;
                            case C_DEPT_CD: ggoSpread.SetValue(C_DEPT_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_DEPT_NM: ggoSpread.SetValue(C_DEPT_CD, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_ROLE_PSTN: ggoSpread.SetValue(C_ROLE_PSTN_NM, pRow, ggoSpread.GetValue(pCol, pRow)); break;
                            case C_ROLE_PSTN_NM: ggoSpread.SetValue(C_ROLE_PSTN, pRow, ggoSpread.GetValue(pCol, pRow)); break;
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
                                        var strSql = "SELECT BIZ_AREA_CD, BIZ_AREA_NM_" + lgLang + " FROM S_BIZ_AREA ORDER BY SEQ ";
                                        result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                        if (result.Value) {
                                            if (result.Value) {
                                                var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                                ggoSpread.Source = vspdData;
                                                ggoSpread.SSetComboData(C_BIZ_AREA_CD, cboDataArr[0]);
                                                ggoSpread.SSetComboData(C_BIZ_AREA_NM, cboDataArr[1]);
                                            }
                                        }

                                        strSql = "SELECT PLANT_CD, PLANT_NM_" + lgLang + " FROM S_PLANT ORDER BY SEQ ";
                                        result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                        if (result.Value) {
                                            if (result.Value) {
                                                var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                                ggoSpread.Source = vspdData;
                                                ggoSpread.SSetComboData(C_PLANT_CD, cboDataArr[0]);
                                                ggoSpread.SSetComboData(C_PLANT_NM, cboDataArr[1]);
                                            }
                                        }

                                        strSql = "SELECT DEPT_CD, DEPT_NM_" + lgLang + " FROM S_ACCT_DEPT ORDER BY SEQ ";
                                        result = eni.DbAccess.ExecuteComboDataQuery(strSql);
                                        if (result.Value) {
                                            if (result.Value) {
                                                var cboDataArr = String(result.Value).split(vspdData.RowSep);
                                                ggoSpread.Source = vspdData;
                                                ggoSpread.SSetComboData(C_DEPT_CD, cboDataArr[0]);
                                                ggoSpread.SSetComboData(C_DEPT_NM, cboDataArr[1]);
                                            }
                                        }
                                        ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                        if (callbackResult.PageNo) {
                                            lgPageNo = callbackResult.PageNo;
                                        } else {
                                            lgPageNo = "";
                                        }
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                            txtErpNo.Focus();
                                        });
                                    }
                                } else {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        txtErpNo.Focus();
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
                            PLANT_CD: strP2,
                            DEPT_CD: strP3,
                            ERP_NO: strP4,
                            NAME: strP5,
                            USR_ID: strP6,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());

                        hidFields.Set("strP1", strP1);
                        hidFields.Set("strP2", strP2);
                        hidFields.Set("strP3", strP3);
                        hidFields.Set("strP1", strP4);
                        hidFields.Set("strP2", strP5);
                        hidFields.Set("strP3", strP6);
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
                        tbData.AddColumn("PWD_SCT");
                        tbData.AddColumn("DOMAIN");
                        tbData.AddColumn("FIRST_NAME");
                        tbData.AddColumn("LAST_NAME");
                        tbData.AddColumn("ENG_NAME");
                        tbData.AddColumn("HANJA_NAME");
                        tbData.AddColumn("BIRT_DAY");
                        tbData.AddColumn("USR_KIND");
                        tbData.AddColumn("USR_TYPE");
                        tbData.AddColumn("USR_GUBUN");
                        tbData.AddColumn("BIZ_AREA_CD");
                        tbData.AddColumn("PLANT_CD");
                        tbData.AddColumn("DEPT_CD");
                        tbData.AddColumn("ROLE_PSTN");
                        tbData.AddColumn("ENTR_DT");
                        tbData.AddColumn("EXT_MAIL_ADDR");
                        tbData.AddColumn("ZIP_CODE");
                        tbData.AddColumn("ADDR");
                        tbData.AddColumn("TEL_NO");
                        tbData.AddColumn("EM_TEL_NO");
                        tbData.AddColumn("HAND_TEL_NO");
                        tbData.AddColumn("ORG_ADMIN_YN");
                        tbData.AddColumn("ADMIN_YN");
                        tbData.AddColumn("ORG_USE_MAIL_YN");
                        tbData.AddColumn("USE_MAIL_YN");
                        tbData.AddColumn("MAIL_ADDR");
                        tbData.AddColumn("MAIL_SIZE");
                        tbData.AddColumn("MAIL_LEVEL");
                        tbData.AddColumn("REMARK");
                        tbData.AddColumn("ORG_USE_YN");
                        tbData.AddColumn("USE_YN");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.USR_ID = ggoSpread.GetText(C_USR_ID, i, true);
                                    nRow.ERP_NO = ggoSpread.GetText(C_ERP_NO, i, true);
                                    nRow.USR_VALID_DT = ggoSpread.GetText(C_USR_VALID_DT, i, true);
                                    nRow.ORG_PWD = ggoSpread.GetText(C_ORG_PWD, i, false);
                                    nRow.PWD = ggoSpread.GetText(C_PWD, i, true);
                                    nRow.PWD_VALID_DT = ggoSpread.GetText(C_PWD_VALID_DT, i, true);
                                    nRow.PWD_SCT = ggoSpread.GetText(C_PWD_SCT, i, false);
                                    nRow.DOMAIN = ggoSpread.GetText(C_DOMAIN, i, true);
                                    nRow.FIRST_NAME = ggoSpread.GetText(C_FIRST_NAME, i, true);
                                    nRow.LAST_NAME = ggoSpread.GetText(C_LAST_NAME, i, true);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, true);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, true);
                                    nRow.BIRT_DAY = ggoSpread.GetText(C_BIRT_DAY, i, true);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, true);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, true);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, true);
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, true);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, true);
                                    nRow.ROLE_PSTN = ggoSpread.GetText(C_ROLE_PSTN, i, true);
                                    nRow.ENTR_DT = ggoSpread.GetText(C_ENTR_DT, i, true);
                                    nRow.EXT_MAIL_ADDR = ggoSpread.GetText(C_EXT_MAIL_ADDR, i, true);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, true);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, true);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, true);
                                    nRow.EM_TEL_NO = ggoSpread.GetText(C_EM_TEL_NO, i, true);
                                    nRow.HAND_TEL_NO = ggoSpread.GetText(C_HAND_TEL_NO, i, true);
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
                                    if (ggoSpread.GetText(C_ORG_USE_MAIL_YN, i) === "1") {
                                        nRow.ORG_USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_MAIL_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_MAIL_YN, i) === "1") {
                                        nRow.USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.USE_MAIL_YN = "N";
                                    }
                                    nRow.MAIL_ADDR = ggoSpread.GetText(C_MAIL_ADDR, i, true);
                                    nRow.MAIL_SIZE = ggoSpread.GetText(C_MAIL_SIZE, i, true);
                                    nRow.MAIL_LEVEL = ggoSpread.GetText(C_MAIL_LEVEL, i, true);
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, true);
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

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.USR_ID = ggoSpread.GetText(C_USR_ID, i, false);
                                    nRow.ERP_NO = ggoSpread.GetText(C_ERP_NO, i, false);
                                    nRow.USR_VALID_DT = ggoSpread.GetText(C_USR_VALID_DT, i, false);
                                    nRow.ORG_PWD = ggoSpread.GetText(C_ORG_PWD, i, false);
                                    nRow.PWD = ggoSpread.GetText(C_PWD, i, false);
                                    nRow.PWD_VALID_DT = ggoSpread.GetText(C_PWD_VALID_DT, i, false);
                                    nRow.PWD_SCT = ggoSpread.GetText(C_PWD_SCT, i, false);
                                    nRow.DOMAIN = ggoSpread.GetText(C_DOMAIN, i, false);
                                    nRow.FIRST_NAME = ggoSpread.GetText(C_FIRST_NAME, i, false);
                                    nRow.LAST_NAME = ggoSpread.GetText(C_LAST_NAME, i, false);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, false);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, false);
                                    nRow.BIRT_DAY = ggoSpread.GetText(C_BIRT_DAY, i, false);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, false);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, false);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, false);
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, false);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, false);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, false);
                                    nRow.ROLE_PSTN = ggoSpread.GetText(C_ROLE_PSTN, i, false);
                                    nRow.ENTR_DT = ggoSpread.GetText(C_ENTR_DT, i, false);
                                    nRow.EXT_MAIL_ADDR = ggoSpread.GetText(C_EXT_MAIL_ADDR, i, false);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, false);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, false);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, false);
                                    nRow.EM_TEL_NO = ggoSpread.GetText(C_EM_TEL_NO, i, false);
                                    nRow.HAND_TEL_NO = ggoSpread.GetText(C_HAND_TEL_NO, i, false);
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
                                    if (ggoSpread.GetText(C_ORG_USE_MAIL_YN, i) === "1") {
                                        nRow.ORG_USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_MAIL_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_MAIL_YN, i) === "1") {
                                        nRow.USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.USE_MAIL_YN = "N";
                                    }
                                    nRow.MAIL_ADDR = ggoSpread.GetText(C_MAIL_ADDR, i, false);
                                    nRow.MAIL_SIZE = ggoSpread.GetText(C_MAIL_SIZE, i, false);
                                    nRow.MAIL_LEVEL = ggoSpread.GetText(C_MAIL_LEVEL, i, false);
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, false);
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
                                    nRow.PWD_SCT = ggoSpread.GetText(C_PWD_SCT, i, true);
                                    nRow.DOMAIN = ggoSpread.GetText(C_DOMAIN, i, true);
                                    nRow.FIRST_NAME = ggoSpread.GetText(C_FIRST_NAME, i, true);
                                    nRow.LAST_NAME = ggoSpread.GetText(C_LAST_NAME, i, true);
                                    nRow.ENG_NAME = ggoSpread.GetText(C_ENG_NAME, i, true);
                                    nRow.HANJA_NAME = ggoSpread.GetText(C_HANJA_NAME, i, true);
                                    nRow.BIRT_DAY = ggoSpread.GetText(C_BIRT_DAY, i, true);
                                    nRow.USR_KIND = ggoSpread.GetText(C_USR_KIND, i, true);
                                    nRow.USR_TYPE = ggoSpread.GetText(C_USR_TYPE, i, true);
                                    nRow.USR_GUBUN = ggoSpread.GetText(C_USR_GUBUN, i, true);
                                    nRow.BIZ_AREA_CD = ggoSpread.GetText(C_BIZ_AREA_CD, i, true);
                                    nRow.PLANT_CD = ggoSpread.GetText(C_PLANT_CD, i, true);
                                    nRow.DEPT_CD = ggoSpread.GetText(C_DEPT_CD, i, true);
                                    nRow.ROLE_PSTN = ggoSpread.GetText(C_ROLE_PSTN, i, true);
                                    nRow.ENTR_DT = ggoSpread.GetText(C_ENTR_DT, i, true);
                                    nRow.EXT_MAIL_ADDR = ggoSpread.GetText(C_EXT_MAIL_ADDR, i, true);
                                    nRow.ZIP_CODE = ggoSpread.GetText(C_ZIP_CODE, i, true);
                                    nRow.ADDR = ggoSpread.GetText(C_ADDR, i, true);
                                    nRow.TEL_NO = ggoSpread.GetText(C_TEL_NO, i, true);
                                    nRow.EM_TEL_NO = ggoSpread.GetText(C_EM_TEL_NO, i, true);
                                    nRow.HAND_TEL_NO = ggoSpread.GetText(C_HAND_TEL_NO, i, true);
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
                                    if (ggoSpread.GetText(C_ORG_USE_MAIL_YN, i) === "1") {
                                        nRow.ORG_USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.ORG_USE_MAIL_YN = "N";
                                    }
                                    if (ggoSpread.GetText(C_USE_MAIL_YN, i) === "1") {
                                        nRow.USE_MAIL_YN = "Y";
                                    } else {
                                        nRow.USE_MAIL_YN = "N";
                                    }
                                    nRow.MAIL_ADDR = ggoSpread.GetText(C_MAIL_ADDR, i, true);
                                    nRow.MAIL_SIZE = ggoSpread.GetText(C_MAIL_SIZE, i, true);
                                    nRow.MAIL_LEVEL = ggoSpread.GetText(C_MAIL_LEVEL, i, true);
                                    nRow.REMARK = ggoSpread.GetText(C_REMARK, i, true);
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

                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }

                        cbArgs.Data = dsData.Tables[0].Rows;
                        
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
                                <dx:SplitterPane Name="tab1Con" Size="84">
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <table class="BSL01TB" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtBizArea.Focus()"><%= GetResource("CSTRESX00040")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtBizArea" ClientInstanceName="cntxtBizArea" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtBizArea_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtBizArea_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtPlant.Focus()"><%= GetResource("CSTRESX00041") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtPlant" ClientInstanceName="cntxtPlant" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtPlant_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtPlant_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="cntxtDept.Focus()"><%= GetResource("CSTRESX00042")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtDept" ClientInstanceName="cntxtDept" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtDept_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtDept_PopupButtonClick" />
                                                        </eni:eniCodeNameBox>
                                                        
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtErpNo.Focus()"><%= GetResource("CSTRESX00043") %></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtErpNo" ClientInstanceName="txtErpNo" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtName.Focus()"><%= GetResource("CSTRESX00044")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtName" ClientInstanceName="txtName" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                        
                                                    </td>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtUsrId.Focus()"><%= GetResource("CSTRESX00045")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniTextBox ID="txtUsrId" ClientInstanceName="txtUsrId" runat="server" SkinID="BSL" EnterActionQuery="true"></eni:eniTextBox>
                                                    </td>
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
                                                                    ComboSelChange="eni.LocalPage.vspdData_ComboSelChange"/>
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