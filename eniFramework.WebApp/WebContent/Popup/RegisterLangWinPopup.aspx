<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="RegisterLangWinPopup.aspx.cs" Inherits="eniFramework.WebApp.Popup.SCM1004PA3" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Popup
    *  2. Function Name        :
    *  3. Program ID           : RegisterLangWinPopup.aspx
    *  4. Program Name         : 언어 설정 팝업
    *  5. Program Desc         : 언어 설정 팝업
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2016-05-05
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
        cntxtProgram        = ASPxClientTextBox.Cast();
        cntxtProgramName    = ASPxClientTextBox.Cast();
        cboLang             = ASPxClientComboBox.Cast();
        btnQuery            = ASPxClientButton.prototype;
        btnSave             = ASPxClientButton.prototype;
        btnClose            = ASPxClientButton.prototype;
        vspdDataCbProcess   = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            var SCM1004PA3 = eni.Initialize(new function () {
                lgPageRowCount = 100;

                var args = null;
                var C_IDX = 1;
                var C_LANG      = C_IDX++,
                    C_ID        = C_IDX++,
                    C_KOR_TEXT  = C_IDX++,
                    C_TEXT      = C_IDX++;
                    
                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/
                this.Title = eni.GetTitle() + "<%= GetResource("CSTRESX00000") + " - " + GetGlobalResource("QuickName") %>";
                // 뷰 타입
                this.ViewType = ViewType.PopupView;
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
                        Ext.useShims = true;

                        this.InitSpreadSheet();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {
                    try {
                        cboLang.Focus();
                        
                        eni.LocalPage.OnFncQuery();
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
                            eni.LocalPage.Return();
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
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.SetLocalDefaultValue = function () {
                    args = window.dialogArguments;

                    try {
                        if (args) {
                            if (args.ProgramID) {
                                cntxtProgram.SetText(args.CustCd);
                            }
                            if (args.ProgramName) {
                                cntxtProgramName.SetText(args.CustNm);
                            }
                        }

                        cboLang.SetValue(lgLang);
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
                    ggoSpread.MakeColumns(C_TEXT);
                    ggoSpread.SetMaxRows(0);

                    ggoSpread.SSSetEdit(C_LANG, "Lang", 8, HAlign.Center, 10, CellKind.Protected, true, EditCharCase.UpperCase);
                    ggoSpread.SSSetEdit(C_ID, "<%= GetResource("CSTRESX00003") %>", 13, HAlign.Center, 20, CellKind.Protected, false, EditCharCase.UpperCase);
                    ggoSpread.SSSetEdit(C_KOR_TEXT, "<%= GetResource("CSTRESX00004") %>", 15, HAlign.Left, 40, CellKind.Protected, false, EditCharCase.UpperCase);
                    ggoSpread.SSSetEdit(C_TEXT, "<%= GetResource("CSTRESX00005") %>", 15, HAlign.Left, 40, CellKind.Required, false, EditCharCase.UpperCase);

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

                        var strP1 = cntxtProgram.GetText();
                        var strP2 = cboLang.GetValue();

                        eni.LocalPage.DbQuery(strP1, strP2);
                    }
                };

                //this.chkUniCode_CheckedChanged = function (s, e) {
                //    //한국어, 영어일때 유니코드 지원 컨트롤을 설정시 호출된다.
                //    var setUniCode = function () {
                //        eni.SetToolbar("0000000000000000");
                //        if (chkUniCode.GetValue()) {
                //            eni.Cookie.SetCookie("ckUniCode", "1");
                //        } else {
                //            eni.Cookie.SetCookie("ckUniCode", "0");
                //        }
                //        __doPostBack();
                //    };
                //    if (lgBlnFlgChgValue || ggoSpread.CheckChange()) {
                //        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                //            if (pDialogResult === DialogResult.Yes) {
                //                setUniCode();
                //            }
                //        });
                //    } else {
                //        setUniCode();
                //    }
                //};

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

                this.vspdData_Change = function (oSender, iCol, iRow, org_data) {
                    try {
                        switch (iCol) {
                            //case C_BOX_COUNT:
                            //case C_ITEM_COUNT:
                            //case C_QUAN_COUNT:
                            //    ggoSpread.Source = oSender;
                            //    ggoSpread.SetText(C_CHECK, iRow, "1");
                            //    break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.btnQuery_Click = function (s, e) {
                    eni.LocalPage.OnFncQuery();
                };

                this.btnSave_Click = function (s, e) {
                    try {
                        eni.Loading.DisplayLoading(true, eni.Message.StrBundle("MSGBD00108"));
                        eni.DisableControls();

                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbSave";

                        var dsData = new DataSetClass();
                        var tbData = dsData.CreateDataTable("vspdData");
                        tbData.AddColumn("DBAccessMode");
                        tbData.AddColumn("LANG");
                        tbData.AddColumn("ID");
                        tbData.AddColumn("TEXT");

                        ggoSpread.Source = vspdData;
                        for (var i = 1; i < ggoSpread.GetMaxRows() + 1; i++) {
                            switch (ggoSpread.GetText(0, i)) {
                                case ggoSpread.Source.UpdateFlag:
                                    var nRow = tbData.NewRow();
                                    nRow.DBAccessMode = DBAccessMode.Update;
                                    nRow.LANG       = ggoSpread.GetText(C_LANG, i, true);
                                    nRow.ID         = ggoSpread.GetText(C_ID, i, true);
                                    nRow.TEXT       = ggoSpread.GetText(C_TEXT, i, true);
                                    tbData.AddRow(nRow);
                                    break;
                            }
                        }
                        
                        if (dsData.Tables[0].Rows.length <= 0) {
                            eni.EnableControls();
                            eni.Loading.DisplayLoading(false);
                            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00127");
                            return;
                        }

                        vspdDataCbProcess.PerformCallback(dsData.Tables[0].Serialize(cbArgs, "Data"));
                    } catch (ex) {
                        eni.EnableControls();
                        eni.Loading.DisplayLoading(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                this.btnClose_Click = function (s, e) {
                    self.close();
                };

                this.vspdDataCbProcess_CallbackComplete = function (s, e) {
                    try {
                        var callbackResult = BaseCallbackResultArgsClass.Deserialize(e.result);
                        switch (callbackResult.Cmd) {
                            case "DbQuery":
                                ggoSpread.Source = lgActiveSpread = vspdData;
                                ggoSpread.Focus();

                                if (callbackResult.Code) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message);
                                } else {
                                    if (callbackResult.MultiResult !== "") {
                                        ggoSpread.ShowDataFromStr(callbackResult.MultiResult);
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00111");
                                    }
                                }

                                eni.EnableControls();
                                eni.Loading.DisplayLoading(false);
                                break;
                            case "DbSave":
                                if (!callbackResult.Code) {
                                    eni.LocalPage.OnFncQuery();
                                    //self.close();
                                } else {
                                    eni.EnableControls();
                                    eni.Loading.DisplayLoading(false);
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), callbackResult.Message);
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
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

                        var cbArgs = new BaseCallbackArgsClass();
                        cbArgs.Cmd = "DbQuery";
                        cbArgs.Data = {
                            CUST_CD: strP1,
                            DVRY_NO: strP2,
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
                        eni.EnableControls();
                        eni.Loading.DisplayLoading(false);
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.Return = function () {
                    try {
                        if (window.opener) {
                            window.returnValue = window.opener.returnValue = self.returnValue = null;
                        } else {
                            window.returnValue = self.returnValue = null;
                        }
                        self.close();
                    } catch (ex) {
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
            <dx:SplitterPane Name="tabCon" Size="32px" MaxSize="32px">
                <PaneStyle>
                    <Paddings PaddingBottom="0" />
                </PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <table class="BSL01TB" cellpadding="0" cellspacing="0">
                            <tr>
                                <th class="TH4C">
                                    <span class="CAP"><%= GetResource("CSTRESX00001")%></span>
                                </th>
                                <td class="TD4F">
                                    <eni:eniCodeNameBox ID="cntxtProgram" ClientInstanceName="cntxtProgram" runat="server" SkinID="BSL" EnterActionQuery="true"
                                        CodeBoxWidth="100px" NameBoxWidth="150px" CodeBoxClientReadOnly="true" VisiblePopupButton="false" NameBoxClientReadOnly="true" CodeBoxUpperCase="true" NameBoxUpperCase="true">
                                    </eni:eniCodeNameBox>
                                </td>
                                <th class="TH4C">
                                    <span class="CAP"><%= GetResource("CSTRESX00002") %></span>
                                </th>
                                <td class="TD4F">
                                    <eni:eniComboBox ID="cboLang" ClientInstanceName="cboLang" runat="server" SkinID="BSL" Width="80px" EnterActionQuery="true">
                                        <Items>
                                            <dx:ListEditItem Value="KO" Text="한국어" />
                                            <dx:ListEditItem Value="CN" Text="중국어" />
                                        </Items>
                                    </eni:eniComboBox>
                                    <%--팝업창에서는 포스트백이 안되어서 주석
                                        <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <eni:eniComboBox ID="cboLang" ClientInstanceName="cboLang" runat="server" SkinID="BSL" Width="80px" EnterActionQuery="true">
                                                   <Items>
                                                       <dx:ListEditItem Value="KO" Text="한국어" />
                                                       <dx:ListEditItem Value="CN" Text="중국어" />
                                                   </Items>
                                                </eni:eniComboBox>
                                            </td>
                                            <td>
                                                <eni:eniCheckBox ID="chkUniCode" ClientInstanceName="chkUniCode" runat="server" SkinID="Advanced-01"
                                                    Text='<%# GetGlobalResource("GCSTRESX00000") %>'>
                                                    <ClientSideEvents CheckedChanged="eni.LocalPage.chkUniCode_CheckedChanged" />
                                                </eni:eniCheckBox>
                                            </td>
                                        </tr>
                                    </table>--%>
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
                                            Change="eni.LocalPage.vspdData_Change"/>
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
                                <td class="Padding5R">
                                    <eni:eniButton ID="btnSave" ClientInstanceName="btnSave" runat="server" SkinID="Advanced-M-01"
                                        Text='<%# GetResource("GCSTRESX00010") %>'>
                                        <Image IconID="toolboxitems_barcode2_16x16"></Image>
                                        <ClientSideEvents Click="eni.LocalPage.btnSave_Click" />
                                    </eni:eniButton>
                                </td>
                                <td>
                                    <eni:eniButton ID="btnClose" ClientInstanceName="btnCancel" runat="server" SkinID="Advanced-M-01"
                                        Text='<%# GetGlobalResource("GCSTRESX00007") %>'>
                                        <Image IconID="edit_delete_16x16"></Image>
                                        <ClientSideEvents Click="eni.LocalPage.btnClose_Click" />
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
        <ClientSideEvents  BeginCallback="eni.LocalPage.vspdDataCbProcess_BeginCallback" 
            CallbackComplete="eni.LocalPage.vspdDataCbProcess_CallbackComplete" 
            CallbackError="eni.LocalPage.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>
