<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="B4002MA1.aspx.cs" Inherits="eniFramework.WebApp.Modules.B4.B4002MA1" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : B4002MA1.aspx
    *  4. Program Name         : 사용자권한관리
    *  5. Program Desc         : 사용자권한관리
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2016-04-21
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
        cntxtRole           = ASPxClientTextBox.Cast();
        cntxtRoleName       = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var B4002MA1 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var C_IDX = 1;
                var C_USR_ROLE_ID       = C_IDX++,
                    C_USR_ROLE_NM       = C_IDX++,
                    C_USR_ROLE_NM_KO    = C_IDX++,
                    C_USR_ROLE_NM_EN    = C_IDX++,
                    C_USR_ROLE_NM_CN    = C_IDX++,
                    C_USR_ROLE_NM_JP    = C_IDX++;
                C_IDX = 1;
                    //vspdData1
                var C1_USR_ROLE_ID  = C_IDX++,
                    C1_MENU_ID      = C_IDX++,
                    C1_MNU_BP       = C_IDX++,
                    C1_MENU_NM      = C_IDX++,
                    C1_MENU_DES     = C_IDX++,
                    C1_USE_YN       = C_IDX++;

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
                        cntxtRole.Focus();
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

                        cntxtRole.SetText("");
                        cntxtRoleName.SetText("");

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
                        ggoSpread.MakeColumns(C_USR_ROLE_NM_JP);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C_USR_ROLE_ID, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Left, 20, CellKind.Protected);
                        ggoSpread.SSSetEdit(C_USR_ROLE_NM, "<%= GetResource("CSTRESX00003") %>", 20, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_USR_ROLE_NM_KO, "<%= GetResource("CSTRESX00004") %>", 20, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_USR_ROLE_NM_EN, "<%= GetResource("CSTRESX00005") %>", 20, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_USR_ROLE_NM_CN, "<%= GetResource("CSTRESX00006") %>", 20, HAlign.Left, 50, CellKind.Required);
                        ggoSpread.SSSetEdit(C_USR_ROLE_NM_JP, "<%= GetResource("CSTRESX00007") %>", 20, HAlign.Left, 50, CellKind.Required);

                        ggoSpread.ReDraw(true);

                        //vspdData1
                        ggoSpread.Source = vspdData1;
                        ggoSpread.ReDraw(false);
                        ggoSpread.MakeColumns(C1_USE_YN);
                        ggoSpread.SetMaxRows(0);

                        ggoSpread.SSSetEdit(C1_USR_ROLE_ID, "<%= GetResource("CSTRESX00002") %>", 10, HAlign.Left, 20, CellKind.Protected, true);
                        ggoSpread.SSSetEdit(C1_MENU_ID, "<%= GetResource("CSTRESX00008") %>", 14, HAlign.Left, 50, CellKind.Protected, false, EditCharCase.UpperCase);
                        ggoSpread.SSSetButton(C1_MNU_BP, true);
                        ggoSpread.SSSetEdit(C1_MENU_NM, "<%= GetResource("CSTRESX00009") %>", 30, HAlign.Left, 50, CellKind.Protected);
                        ggoSpread.SSSetEdit(C1_MENU_DES, "<%= GetResource("CSTRESX00010") %>", 50, HAlign.Left, 50, CellKind.Protected);
                        ggoSpread.SSSetCheck(C1_USE_YN, "<%= GetResource("CSTRESX00011") %>", 7);

                        ggoSpread.ReDraw(true);

                        lgActiveSpread = vspdData;
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

                            for (var i = 0; i < lgSpreadArr.length; i++) {
                                ggoSpread.Source = lgSpreadArr[i];
                                ggoSpread.ClearSpreadData();
                            }

                            var strP1 = cntxtRole.GetText();

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
                        ggoSpread.Source = lgActiveSpread;
                        ggoSpread.ReDraw(false);

                        var activeRow = ggoSpread.InsertRows();

                        switch (lgActiveSpread) {
                            case vspdData:
                                ggoSpread.Source = vspdData;
                                ggoSpread.SpreadRequired(C_USR_ROLE_ID, activeRow);
                                break;
                            case vspdData1:
                                ggoSpread.Source = vspdData1;
                                ggoSpread.SpreadRequired(C1_MENU_ID, activeRow);
                                ggoSpread.SpreadUnLock(C1_MNU_BP, activeRow);
                                ggoSpread.SetValue(C1_USE_YN, activeRow, 1);

                                ggoSpread.Source = vspdData;
                                var roleId = ggoSpread.GetText(C_USR_ROLE_ID, vspdData.ActiveRow);
                                ggoSpread.Source = vspdData1;
                                ggoSpread.SetValue(C1_USR_ROLE_ID, activeRow, roleId);
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
                                    ggoSpread.Source = vspdData;
                                    ggoSpread.SpreadRequired(C_USR_ROLE_ID, copy_row, C_USR_ROLE_NM_JP, copy_row);

                                    ggoSpread.SetValue(C_USR_ROLE_ID, copy_row, "");
                                    ggoSpread.SetValue(C_USR_ROLE_NM, copy_row, ggoSpread.GetText(C_USR_ROLE_NM, active_row, false));
                                    ggoSpread.SetValue(C_USR_ROLE_NM_KO, copy_row, ggoSpread.GetText(C_USR_ROLE_NM_KO, active_row, false));
                                    ggoSpread.SetValue(C_USR_ROLE_NM_EN, copy_row, ggoSpread.GetText(C_USR_ROLE_NM_EN, active_row, false));
                                    ggoSpread.SetValue(C_USR_ROLE_NM_CN, copy_row, ggoSpread.GetText(C_USR_ROLE_NM_CN, active_row, false));
                                    ggoSpread.SetValue(C_USR_ROLE_NM_JP, copy_row, ggoSpread.GetText(C_USR_ROLE_NM_JP, active_row, false));
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
                this.cntxtRole_CodeBoxValueChanged = function (s, e) {
                    try {
                        var strCode = s.GetText();
                        if (strCode) {
                            var result = eni.DbAccess.ExecuteCodeName("S_USR_ROLE", strCode, "");
                            if (!result.Code) {
                                if (result.Value) {
                                    cntxtRoleName.SetText(result.Value);
                                } else {
                                    s.SetText("");
                                    cntxtRoleName.SetText("");
                                }
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003") + "(" + result.Code + ")", result.Message);
                            }
                        } else {
                            cntxtRoleName.SetText("");
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.cntxtRole_PopupButtonClick = function (s, e) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();
                        popArgs.Title = "<%= GetResource("CSTRESX00012") %>";
                        popArgs.AddColumn("USR_ROLE_ID", "<%= GetResource("CSTRESX00002") %>", 10);
                        popArgs.AddColumn("USR_ROLE_NM_" + lgLang, "<%= GetResource("CSTRESX00003") %>", 15);
                        popArgs.From = "S_USR_ROLE";
                        popArgs.WinSize = new WindowSize(400, 450);

                        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                            cntxtRole.SetText(arry.Tables[0].Rows[0]["USR_ROLE_ID"]);
                            cntxtRoleName.SetText(arry.Tables[0].Rows[0]["USR_ROLE_NM_" + lgLang]);
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

                    ggoSpread.Source = pSender;
                    if (ggoSpread.GetText(0, pNewRow) === pSender.InsertFlag) {
                        ggoSpread.Source = vspdData1;
                        ggoSpread.ClearSpreadData();
                        return;
                    }

                    if (vspdData1.MaxRows > 0) {
                        ggoSpread.Source = vspdData1;
                        ggoSpread.ClearSpreadData();
                    }

                    ggoSpread.Source = vspdData;

                    eni.LocalPage.DbQuery1(ggoSpread.GetText(C_USR_ROLE_ID, pNewRow));
                };

                this.vspdData_ButtonClicked = function (pSender, pCol, pRow) {
                    try {
                        //var popArgs = new CommonWinPopupArgsClass();

                        //switch (pCol) {
                        //    case C_USR_ROLE_BP:
                        //        popArgs.Title = "권한";
                        //        popArgs.AddColumn("USR_ROLE_ID", "권한코드", 10);
                        //        popArgs.AddColumn("USR_ROLE_NM", "권한명", 15);
                        //        popArgs.From = "S_USR_ROLE";
                        //        popArgs.WinSize = new WindowSize(400, 450);

                        //        var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                        //        if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                        //            ggoSpread.Source = vspdData;
                        //            ggoSpread.SetText(C_USR_ROLE_ID, pRow, arry.Tables[0].Rows[0]["USR_ROLE_ID"]);
                        //            ggoSpread.SetText(C_USR_ROLE_NM, pRow, arry.Tables[0].Rows[0]["USR_ROLE_NM"]);
                        //            ggoSpread.UpdateRow(pRow);
                        //        }
                        //        break;
                        //}
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
                            case C1_MENU_ID:
                                ggoSpread.Source = vspdData1;

                                lgStrSql = "";
                                lgStrSql += " SELECT MENU_ID, MENU_NM_" + lgLang + ", MENU_DES_" + lgLang + " FROM S_USR_MENU ";
                                lgStrSql += " WHERE MENU_ID = " + eni.Data.FilterVariable(ggoSpread.GetText(pCol, pRow));

                                var result = eni.DbAccess.ExecuteDataSet(lgStrSql, "S_USR_MENU");
                                if (result.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), result.Message);
                                } else {
                                    if (result.DataSet.S_USR_MENU && result.DataSet.S_USR_MENU.length > 0) {
                                        ggoSpread.SetText(C1_MENU_NM, pRow, result.DataSet.S_USR_MENU[0]["MENU_NM_" + lgLang]);
                                        ggoSpread.SetText(C1_MENU_DES, pRow, result.DataSet.S_USR_MENU[0]["MENU_DES_" + lgLang]);
                                    } else {
                                        ggoSpread.SetText(C1_MENU_ID, pRow, "");
                                        ggoSpread.SetText(C1_MENU_NM, pRow, "");
                                        ggoSpread.SetText(C1_MENU_DES, pRow, "");
                                    }
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.vspdData1_ButtonClicked = function (pSender, pCol, pRow) {
                    try {
                        var popArgs = new CommonWinPopupArgsClass();

                        switch (pCol) {
                            case C1_MNU_BP:
                                popArgs.Title = "<%= GetResource("CSTRESX00013") %>";
                                popArgs.AddColumn("MENU_ID", "<%= GetResource("CSTRESX00008") %>", 10);
                                popArgs.AddColumn("MENU_NM_" + lgLang, "<%= GetResource("CSTRESX00009") %>", 15);
                                popArgs.AddColumn("MENU_DES_" + lgLang, "<%= GetResource("CSTRESX00010") %>", 30);
                                popArgs.From = "S_USR_MENU";
                                popArgs.Where = "USE_YN = 'Y'";
                                popArgs.WinSize = new WindowSize(600, 450);

                                var arry = eni.Popup.ShowCommonWinPopup(popArgs);
                                if (arry && arry.Tables && arry.Tables[0].Rows.length > 0) {
                                    ggoSpread.Source = vspdData1;
                                    ggoSpread.SetText(C1_MENU_ID, pRow, arry.Tables[0].Rows[0]["MENU_ID"]);
                                    ggoSpread.SetText(C1_MENU_NM, pRow, arry.Tables[0].Rows[0]["MENU_NM_" + lgLang]);
                                    ggoSpread.SetText(C1_MENU_DES, pRow, arry.Tables[0].Rows[0]["MENU_DES_" + lgLang]);
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

                                                ggoSpread.Source = vspdData;
                                                eni.LocalPage.DbQuery1(ggoSpread.GetText(C_USR_ROLE_ID, 1));
                                                break;
                                            case "vspdData1":
                                                ggoSpread.Source = vspdData1;
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
                                                    cntxtRole.Focus();
                                                });
                                                break;
                                            case "vspdData1":
                                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111");
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
                            USR_ROLE_ID: strP1,
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
                            USR_ROLE_ID: strP1
                        };

                        vspdDataCbProcess.PerformCallback(cbArgs.Serialize());
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
                        tbData = dsData.CreateDataTable("vspdData");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("USR_ROLE_ID");
                        tbData.AddColumn("USR_ROLE_NM");
                        tbData.AddColumn("USR_ROLE_NM_KO");
                        tbData.AddColumn("USR_ROLE_NM_EN");
                        tbData.AddColumn("USR_ROLE_NM_CN");
                        tbData.AddColumn("USR_ROLE_NM_JP");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C_USR_ROLE_ID, i, true);
                                    nRow.USR_ROLE_NM = ggoSpread.GetText(C_USR_ROLE_NM, i, true);
                                    nRow.USR_ROLE_NM_KO = ggoSpread.GetText(C_USR_ROLE_NM_KO, i, true);
                                    nRow.USR_ROLE_NM_EN = ggoSpread.GetText(C_USR_ROLE_NM_EN, i, true);
                                    nRow.USR_ROLE_NM_CN = ggoSpread.GetText(C_USR_ROLE_NM_CN, i, true);
                                    nRow.USR_ROLE_NM_JP = ggoSpread.GetText(C_USR_ROLE_NM_JP, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C_USR_ROLE_ID, i, true);
                                    nRow.USR_ROLE_NM = ggoSpread.GetText(C_USR_ROLE_NM, i, true);
                                    nRow.USR_ROLE_NM_KO = ggoSpread.GetText(C_USR_ROLE_NM_KO, i, true);
                                    nRow.USR_ROLE_NM_EN = ggoSpread.GetText(C_USR_ROLE_NM_EN, i, true);
                                    nRow.USR_ROLE_NM_CN = ggoSpread.GetText(C_USR_ROLE_NM_CN, i, true);
                                    nRow.USR_ROLE_NM_JP = ggoSpread.GetText(C_USR_ROLE_NM_JP, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C_USR_ROLE_ID, i, true);
                                    nRow.USR_ROLE_NM = ggoSpread.GetText(C_USR_ROLE_NM, i, true);
                                    nRow.USR_ROLE_NM_KO = ggoSpread.GetText(C_USR_ROLE_NM_KO, i, true);
                                    nRow.USR_ROLE_NM_EN = ggoSpread.GetText(C_USR_ROLE_NM_EN, i, true);
                                    nRow.USR_ROLE_NM_CN = ggoSpread.GetText(C_USR_ROLE_NM_CN, i, true);
                                    nRow.USR_ROLE_NM_JP = ggoSpread.GetText(C_USR_ROLE_NM_JP, i, true);

                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }

                        tbData = dsData.CreateDataTable("vspdData1");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("USR_ROLE_ID");
                        tbData.AddColumn("MENU_ID");
                        tbData.AddColumn("USE_YN");

                        ggoSpread.Source = vspdData1;
                        for (var i = 1; i < ggoSpread.Source.MaxRows + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.InsertFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Create;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);
                                    nRow.MENU_ID = ggoSpread.GetText(C1_MENU_ID, i, true);
                                    nRow.USE_YN = (ggoSpread.GetText(C1_USE_YN, i, true) === "1" ? "Y" : "N");

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);
                                    nRow.MENU_ID = ggoSpread.GetText(C1_MENU_ID, i, true);
                                    nRow.USE_YN = (ggoSpread.GetText(C1_USE_YN, i, true) === "1" ? "Y" : "N");

                                    tbData.AddRow(nRow);
                                    break;
                                case ggoSpread.Source.DeleteFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Delete;
                                    nRow.USR_ROLE_ID = ggoSpread.GetText(C1_USR_ROLE_ID, i, true);
                                    nRow.MENU_ID = ggoSpread.GetText(C1_MENU_ID, i, true);
                                    nRow.USE_YN = (ggoSpread.GetText(C1_USE_YN, i, true) === "1" ? "Y" : "N");

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
            <dx:TabPage Name="tab1" Text="사용자권한관리">
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
                                    <ContentCollection>
                                        <dx:SplitterContentControl>
                                            <table class="BSL01TB" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <th class="TH4C">
                                                        <span class="CAP" onclick="txtErpNo.Focus()"><%= GetResource("CSTRESX00002")%></span>
                                                    </th>
                                                    <td class="TD4F">
                                                        <eni:eniCodeNameBox ID="cntxtRole" ClientInstanceName="cntxtRole" runat="server" SkinID="BSL" EnterActionQuery="true"
                                                            CodeBoxWidth="100px" NameBoxWidth="150px" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                                            <CodeNameClientSideEvents CodeBoxValueChanged="eni.LocalPage.cntxtRole_CodeBoxValueChanged" 
                                                                                    PopupButtonClick="eni.LocalPage.cntxtRole_PopupButtonClick" />
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
                                <dx:SplitterPane Name="tab1DataMultiMaster">
                                    <Panes>
                                        <dx:SplitterPane Name="tab1DataMulti" Size="450px" MaxSize="450px">
                                            <ContentCollection>
                                                <dx:SplitterContentControl>
                                                    <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData"  runat="server" ActiveXVersion="vspdDFPSPD6">
                                                        <ClientSideEvents   TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
                                                                            LeaveCell="eni.LocalPage.vspdData_LeaveCell" 
                                                                            MouseDown="eni.LocalPage.vspdData_MouseDown" />
                                                    </eni:eniSpread>
                                                </dx:SplitterContentControl>
                                            </ContentCollection>
                                        </dx:SplitterPane>
                                        <dx:SplitterPane Name="tab1DataMulti1">
                                            <ContentCollection>
                                                <dx:SplitterContentControl>
                                                    <eni:eniSpread ID="vspdData1" ClientInstanceName="vspdData1"  runat="server" ActiveXVersion="vspdDFPSPD6">
                                                        <ClientSideEvents   Change="eni.LocalPage.vspdData1_Change" 
                                                                            MouseDown="eni.LocalPage.vspdData1_MouseDown" 
                                                                            ButtonClicked="eni.LocalPage.vspdData1_ButtonClicked"/>
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