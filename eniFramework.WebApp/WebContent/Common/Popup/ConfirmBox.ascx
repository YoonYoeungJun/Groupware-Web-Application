<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmBox.ascx.cs" Inherits="eniFramework.WebApp.Common.Popup.ConfirmBox" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 공통 대화상자 컨트롤
*  2. Function Name        :
*  3. Program ID           : ConfirmBox.ascx
*  4. Program Name         : 공통 대화상자 컨트롤
*  5. Program Desc         : 공통 대화상자 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-07-25
*  8. Modified date(Last)  : 2015-10-16
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="ConfirmBox_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../../../Scripts/devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            popConfirmBox = ASPxClientPopupControl.Cast();
            popConfirmBox.DefaultHeaderText = "입력하여주세요.";
            popConfirmBox.DefaultConfirmMessage = "아래에 입력하세요.";
            popConfirmBox.CallBackF = 0;
            popConfirmBox.lblMessage = ASPxClientLabel.Cast();
            popConfirmBox.txtValue = ASPxClientTextBox.Cast();
            popConfirmBox.btnOk = ASPxClientButton.Cast();
            popConfirmBox.btnCancel = ASPxClientButton.Cast();
            popConfirmBox.SetDefault = function () {};
            popConfirmBox.ShowConfirm = function (pArgs, pCallBackF) { };
            popConfirmBox.CloseConfirm = function (pRetVal) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        // 대화상자 초기화
        function popConfirmBox_Init(s, e) {
            //var popConfirmBox = ASPxClientPopupControl.Cast(popConfirmBox);
            //var popConfirmBoxKeyDownEvent = function (keydown) {
            //    if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ENTER")) {
            //        popConfirmBox_btnOk_Click(popConfirmBox, null);
            //    } else if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ESCAPE")) {
            //        popConfirmBox_btnCancel_Click(popConfirmBox, null);
            //    }
            //};
            //ASPxClientUtils.AttachEventToElement(document.getElementById(popConfirmBox.name + "_PW-1"), "keydown", popConfirmBoxKeyDownEvent);
            //ASPxClientUtils.AttachEventToElement(document.getElementById(popConfirmBox.name + "_DXPWMB-1"), "keydown", popConfirmBoxKeyDownEvent);
        };

        // 대화상자 팝업시 이벤트
        function popConfirmBox_Popup(s, e) {
            popConfirmBox.txtValue.Focus();
        };

        // 대화상자 확인버튼 클릭시 이벤트
        function popConfirmBox_btnOk_Click(s, e) {
            if (ASPxClientEdit.ValidateGroup("popConfirmBox_ValidGroup")) {
                popConfirmBox.CloseConfirm(DialogResult.Ok);
            }
        };

        // 대화상자 취소버튼 클릭시 이벤트
        function popConfirmBox_btnCancel_Click(s, e) {
            popConfirmBox.CloseConfirm(DialogResult.Cancel);
        };
    </script>
</asp:PlaceHolder>

<!-- 공통 대화상자 -->
<eni:eniPopupControl ID="popConfirmBox" ClientInstanceName="popConfirmBox" runat="server"
    CloseAction="CloseButton" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ShowHeader="True" HeaderText="사용자 아이디" 
    ShowFooter="True" FooterText="Copyright ⓒ 2014 DAE-IL Corp. All rights reserved."  FooterStyle-VerticalAlign="Middle" FooterStyle-HorizontalAlign="Center"
    AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" RenderIFrameForPopupElements="True">
     <ClientSideEvents Init="popConfirmBox_Init" PopUp="popConfirmBox_Popup" CloseButtonClick="popConfirmBox_btnCancel_Click"/>
    <ModalBackgroundStyle BackColor="Transparent" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxFormLayout ID="popConfirmBox_fltLayout" ClientInstanceName="popConfirmBox_fltLayout" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="메시지" ShowCaption="False" SettingsItemCaptions-HorizontalAlign="Right" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="popConfirmBox_lblMessage" ClientInstanceName="popConfirmBox_lblMessage" runat="server"></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="popConfirmBox_txtValue" ClientInstanceName="popConfirmBox_txtValue" runat="server" Width="100%">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="popConfirmBox_ValidGroup" SetFocusOnError="True"
                                                ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                <RequiredField ErrorText="값을 입력하세요." IsRequired="True" />
                                                <RegularExpression ErrorText="Login required" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table style="margin:0px auto">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="popConfirmBox_btnOk" ClientInstanceName="popConfirmBox_btnOK" runat="server" 
                                                        Text="확인" Width="80px" AutoPostBack="False" style="float: left; margin-right: 8px">
                                                        <ClientSideEvents Click="popConfirmBox_btnOk_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popConfirmBox_btnCancel" ClientInstanceName="popConfirmBox_btnCancel" runat="server" 
                                                        Text="취소" Width="80px" AutoPostBack="False" style="float: left; margin-right: 8px">
                                                        <ClientSideEvents Click="popConfirmBox_btnCancel_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniPopupControl>

<asp:PlaceHolder ID="ConfirmBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        popConfirmBox.DefaultHeaderText = "입력하여주세요.";
        popConfirmBox.DefaultConfirmMessage = "아래에 입력하세요.";
        popConfirmBox.CallBackF = 0;
        popConfirmBox.lblMessage = popConfirmBox_lblMessage;
        popConfirmBox.txtValue = popConfirmBox_txtValue;
        popConfirmBox.btnOk = popConfirmBox_btnOK;
        popConfirmBox.btnCancel = popConfirmBox_btnCancel;
        popConfirmBox.SetDefault = function () {
            this.CallBackF = 0;
            this.SetHeaderText(this.DefaultHeaderText);
            this.lblMessage.SetText(this.DefaultConfirmMessage);
            this.txtValue.SetText("");
            this.txtValue.SetValue("");

            lgDisplayMessageBox = false;
        };
        popConfirmBox.ShowConfirm = function (pArgs, pCallBackF) {

            if (pArgs) {
                if (pArgs.Title) {
                    this.SetHeaderText(pArgs.Title);
                } else {
                    this.SetHeaderText(this.DefaultHeaderText);
                }

                if (pArgs.ConfirmMessage) {
                    this.lblMessage.SetText(pArgs.ConfirmMessage);
                } else {
                    this.lblMessage.SetText(this.DefaultConfirmMessage);
                }

                if (pArgs.WinSize && typeof pWinSize === "object") {
                    this.SetWidth(pArgs.WinSize.Width);
                    this.SetHeight(pArgs.WinSize.Height);
                }
            } else {
                return;
            }

            if (pCallBackF) {
                this.CallBackF = pCallBackF;
            } else {
                this.pCallBackF = 0;
            }

            this.Show();
        };
        popConfirmBox.CloseConfirm = function (pRetVal) {
            var RetVal = {
                DialogResult: pRetVal
            };

            if (pRetVal === DialogResult.Ok) {
                RetVal.Result = this.txtValue.GetText();
            }

            if (this.CallBackF) {
                this.Hide();
                this.CallBackF(RetVal);
            } else {
                this.Hide();
            }
            this.SetDefault();

            
        };

        window['<%# ClientInstanceName %>'] = popConfirmBox;
        popConfirmBox = undefined;
    </script>
</asp:PlaceHolder>