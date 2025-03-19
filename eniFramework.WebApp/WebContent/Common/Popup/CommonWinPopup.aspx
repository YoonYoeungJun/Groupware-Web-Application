<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="CommonWinPopup.aspx.cs" Inherits="eniFramework.WebApp.Common.Popup.CommonWinPopup"%>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 시스템설정
    *  2. Function Name        :
    *  3. Program ID           : CommonWinPopup.aspx
    *  4. Program Name         : 자동채번등록
    *  5. Program Desc         : 자동채번등록
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2015-02-17
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
        tabLayout           = ASPxClientSplitter.Cast();
        txtCode             = ASPxClientTextBox.Cast();
        txtName             = ASPxClientTextBox.Cast();
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var CommonWinPopup = eni.Initialize(new function () {
                var popupArgs = new CommonWinPopupArgsClass().Cast(new Object(window.dialogArguments));

                lgPageRowCount = 100;

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/
                this.Title = popupArgs.Title !== undefined && String(popupArgs.Title).trim() !== "" ? popupArgs.Title + " " + "<%= GetResource("CSTRESX00000") %>" : "<%= GetResource("CSTRESX00000") %>";
                // 뷰 타입
                this.ViewType = ViewType.PopupView;
                // 모듈 타입
                this.ModuleType = ModuleType.Multi;

                var $area_commonpop = null;

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
                        Ext.useShims = true;

                        this.InitSpreadSheet();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {

                    try {
                        txtCode.Focus();

                        var strP1 = txtCode.GetText();
                        var strP2 = txtName.GetText();

                        eni.LocalPage.DbQuery(strP1, strP2);
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
                    var objEl = (e ? e.srcElement : window.event.srcElement);
                    var keyCode = (e = e || window.event).keyCode;

                    try {
                        if (keyCode === 27) {
                            eni.LocalPage.Return(null, true);
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //페이지 크기가 변경되면 발생합니다.
                this.PageResize = function (e) {
                    try {
                       
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
                        lgPageNo = "";
                        lgPageRowCount = 100;

                        $area_commonpop = $(".commonwinpopup");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.SetLocalDefaultValue = function () {

                    try {
                        if (popupArgs && popupArgs.Columns[0] && popupArgs.Columns[0].Caption) {
                            var codeItem = $area_commonpop.find("#code");
                            codeItem.text(popupArgs.Columns[0].Caption);
                        }
                        if (popupArgs && popupArgs.Columns[0] && popupArgs.Columns[1].Caption) {
                            var nameItem = $area_commonpop.find("#name");
                            nameItem.text(popupArgs.Columns[1].Caption)
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
                    ggoSpread.Source = vspdData;
                    ggoSpread.ReDraw(false);
                    ggoSpread.MakeColumns(popupArgs.Columns.length);
                    ggoSpread.SetOperationMode(OperationMode.SingleSelect);

                    for (var i = 0; i < popupArgs.Columns.length; i++) {
                        ggoSpread.SSSetEdit(i + 1, popupArgs.Columns[i].Caption, popupArgs.Columns[i].Width, popupArgs.Columns[i].Align, 100, CellKind.Default, popupArgs.Columns[i].Hidden, EditCharCase.NoCase);
                    }

                    ggoSpread.SpreadLockWithOddEvenRow();
                    ggoSpread.ReDraw(true);
                };

                /*********************************************************************************************
                 * [END] Framework Init Method Part
                 *********************************************************************************************/


                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Event Method Part
                 * Remark : 페이지 이벤트 및 함수를 작성합니다.
                 *********************************************************************************************/
                this.OnFncQuery = function () {
                    if (ASPxClientEdit.ValidateGroup("Condition")) {
                        eni.LocalPage.InitLocalVariables();

                        ggoSpread.Source = vspdData;
                        ggoSpread.ClearSpreadData();

                        var strP1 = txtCode.GetText();
                        var strP2 = txtName.GetText();

                        eni.LocalPage.DbQuery(strP1, strP2);
                    }
                };

                this.txtCode_KeyDown = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            eni.BaseOnFncQuery();
                            break;
                    }
                };
                this.txtName_KeyDown = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            eni.BaseOnFncQuery();
                            break;
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

                            eni.LocalPage.DbQuery(strP1, strP2);
                        }
                    }
                };

                this.vspdData_DbClick = function (pSender, pCol, pRow) {
                    if (pRow === 0) return;

                    eni.LocalPage.Return(pRow);
                };

                this.vspdData_KeyDown = function (pSpreadObj, pKeyCode, pShift) {
                    if (vspdData.ActiveRow === 0 || pKeyCode !== KeyCode.Enter) return;

                    eni.LocalPage.Return();
                };

                this.btnQuery_Click = function (s, e) {
                    eni.BaseOnFncQuery();
                };

                this.btnOk_Click = function (s, e) {
                    eni.LocalPage.Return();
                };

                this.btnCancel_Click = function (s, e) {
                    eni.LocalPage.Return(null, true);
                };

                this.vspdDataCbProcess_CallbackComplete = function (s, e) {
                    try {
                        var callbackResult = BaseCallbackResultArgsClass.Deserialize(e.result);
                        switch (callbackResult.Cmd) {
                            case "DbQuery":
                                ggoSpread.Source = lgActiveSpread = vspdData;
                                ggoSpread.Focus();

                                if (callbackResult.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message, null, null, function () {
                                        txtCode.Focus();
                                    });
                                } else {
                                    if (callbackResult.MultiResult !== "") {
                                        ggoSpread.ShowDataFromStr(callbackResult.MultiResult);

                                        if (callbackResult.PageNo) {
                                            lgPageNo = callbackResult.PageNo;
                                        } else {
                                            lgPageNo = "";
                                        }
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111", null, null, function () {
                                            txtCode.Focus();
                                        });
                                    }
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    } finally {
                        eni.EnableControls();
                        eni.Loading.DisplayLoading(false);
                    }
                };

                this.vspdDataCbProcess_CallbackError = function (s, e) {

                };

                this.DbQuery = function (strP1, strP2, strP3, strP4, strP5, strP6, strP7, strP8, strP9) {
                    try {
                        eni.Loading.DisplayLoading(true, eni.Message.StrBundle("MSGBD00108"));
                        eni.DisableControls();

                        strP1 = eni.Utils.IsNullOrUndefinedToString(strP1);
                        strP2 = eni.Utils.IsNullOrUndefinedToString(strP2);
                        strP3 = eni.Utils.IsNullOrUndefinedToString(strP3);
                        strP4 = eni.Utils.IsNullOrUndefinedToString(strP4);
                        strP5 = eni.Utils.IsNullOrUndefinedToString(strP5);
                        strP6 = eni.Utils.IsNullOrUndefinedToString(strP6);
                        strP7 = eni.Utils.IsNullOrUndefinedToString(strP7);
                        strP8 = eni.Utils.IsNullOrUndefinedToString(strP8);
                        strP9 = eni.Utils.IsNullOrUndefinedToString(strP9);

                        var CommocbArgs = new BaseCallbackArgsClass();
                        CommocbArgs.Cmd = "DbQuery";
                        CommocbArgs.Data = {
                            Code: strP1,
                            Name: strP2,
                            Columns: popupArgs.Columns,
                            From: popupArgs.From,
                            Where: popupArgs.Where,
                            OrderBy: popupArgs.OrderBy,
                            GroupBy: popupArgs.GroupBy,
                            PageNo: lgPageNo,
                            PageRowCount: lgPageRowCount
                        };
                        
                        vspdDataCbProcess.PerformCallback(CommocbArgs.Serialize());

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
                        eni.EnableControls();
                        eni.Loading.DisplayLoading(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    };
                };

                this.CreateReturnObject = function (iRow, bCancel) {
                    var dsReturnValues = new DataSetClass();
                    dsReturnValues.CreateDataTable("Result");

                    for (var i = 0; i < popupArgs.Columns.length; i++) {
                        var fieldName = popupArgs.Columns[i].FieldName;
                        var lastIndex = fieldName.lastIndexOf(".");
                        if (lastIndex != -1) {
                            fieldName = fieldName.substring(lastIndex + 1, fieldName.length);
                        }
                        lastIndex = fieldName.lastIndexOf(" ");
                        if (lastIndex != -1) {
                            fieldName = fieldName.substring(lastIndex + 1, fieldName.length);
                        }
                        dsReturnValues.Tables[0].AddColumn(fieldName);
                    }

                    if (!bCancel && vspdData.MaxRows > 0) {
                        var row = dsReturnValues.Tables[0].NewRow();
                        vspdData.Row = (iRow || vspdData.ActiveRow);
                        for (var i = 0; i < popupArgs.Columns.length; i++) {
                            vspdData.Col = i + 1;
                            var fieldName = popupArgs.Columns[i].FieldName;
                            var lastIndex = fieldName.lastIndexOf(".");
                            if (lastIndex != -1) {
                                fieldName = fieldName.substring(lastIndex + 1, fieldName.length);
                            }
                            lastIndex = fieldName.lastIndexOf(" ");
                            if (lastIndex != -1) {
                                fieldName = fieldName.substring(lastIndex + 1, fieldName.length);
                            }
                            row[fieldName] = vspdData.Text;
                        }
                        dsReturnValues.Tables[0].AddRow(row);
                    }

                    return dsReturnValues;
                };
                this.Return = function (iRow, bCancel) {
                    var dsReturnValues = eni.LocalPage.CreateReturnObject(iRow, bCancel);

                    if (window.opener) {
                        window.returnValue = window.opener.returnValue = self.returnValue = dsReturnValues;
                    } else {
                        window.returnValue = self.returnValue = dsReturnValues;
                    }
                    self.close();
                };
            });
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
        };
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server"></asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- 레이아웃 --%>
    <eni:eniSplitter ID="tabLayout" ClientInstanceName="tabLayout" runat="server" SkinID="BSL">
        <Panes>
            <dx:SplitterPane Name="tabTop" Size="30px" MaxSize="30px" Visible="false">
                <ContentCollection>
                    <dx:SplitterContentControl>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="tabCon" Size="59px">
                <PaneStyle>
                    <Paddings PaddingBottom="0" />
                </PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <table class="BSL01TB" cellpadding="0" cellspacing="0">
                            <tr>
                                <th class="TH4C">
                                    <span id="code" class="CAP" onclick="txtCode.Focus()"><%= GetResource("CSTRESX00001")%></span>
                                </th>
                                <td class="TD4F">
                                    <eni:eniTextBox ID="txtCode" ClientInstanceName="txtCode" runat="server" Width="100%" CreateMode="UserControlMode">
                                        <ClientSideEvents KeyDown="CommonWinPopup.txtCode_KeyDown" />
                                    </eni:eniTextBox>
                                </td>
                            </tr>
                            <tr>
                                <th class="TH4C">
                                    <span id="name" class="CAP" onclick="txtName.Focus()"><%= GetResource("CSTRESX00002") %></span>
                                </th>
                                <td class="TD4F">
                                    <eni:eniTextBox ID="txtName" ClientInstanceName="txtName" runat="server" Width="100%" CreateMode="UserControlMode">
                                        <ClientSideEvents KeyDown="CommonWinPopup.txtName_KeyDown" />
                                    </eni:eniTextBox>
                                </td>
                            </tr>
                        </table>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="tabData">
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <eni:eniSpread ID="vspdData" ClientInstanceName="vspdData" runat="server" ActiveXVersion="vspdDFPSPD6">
                            <ClientSideEvents TopLeftChange="eni.LocalPage.vspdData_TopLeftChange"
                                            DblClick="eni.LocalPage.vspdData_DbClick"
                                            KeyDown="eni.LocalPage.vspdData_KeyDown" />
                        </eni:eniSpread>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="tabBottom" Size="30px" MinSize="30px">
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <table class="FullScreen" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <eni:eniButton ID="btnQuery" ClientInstanceName="btnQuery" runat="server" SkinID="Advanced-M-01"
                                        Text='<%# GetGlobalResource("GCSTRESX00003") %>'>
                                        <Image IconID="find_find_16x16"></Image>
                                        <ClientSideEvents Click="eni.LocalPage.btnQuery_Click" />
                                    </eni:eniButton>
                                </td>
                                <td style="width:100%;"></td>
                                <td>
                                    <eni:eniButton ID="btnOk" ClientInstanceName="btnOk" runat="server" SkinID="Advanced-M-01"
                                        Text='<%# GetGlobalResource("GCSTRESX00004") %>'>
                                        <Image IconID="mode_mousemode_16x16"></Image>
                                        <ClientSideEvents Click="eni.LocalPage.btnOk_Click" />
                                    </eni:eniButton>
                                </td>
                                <td class="Padding5L">
                                    <eni:eniButton ID="btnCancel" ClientInstanceName="btnCancel" runat="server" SkinID="Advanced-M-01"
                                        Text='<%# GetGlobalResource("GCSTRESX00005") %>'>
                                        <Image IconID="edit_delete_16x16"></Image>
                                        <ClientSideEvents Click="eni.LocalPage.btnCancel_Click" />
                                    </eni:eniButton>
                                </td>
                            </tr>
                        </table>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </eni:eniSplitter>
    <eni:eniCallback ID="vspdDataCbProcess" ClientInstanceName="vspdDataCbProcess" runat="server" CreateMode="StandardMode"
        OnCallback="vspdDataCbProcess_Callback">
        <ClientSideEvents  CallbackComplete="CommonWinPopup.vspdDataCbProcess_CallbackComplete" 
            CallbackError="CommonWinPopup.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>
