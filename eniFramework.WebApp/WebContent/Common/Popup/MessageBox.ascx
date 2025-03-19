<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MessageBox.ascx.cs" Inherits="eniFramework.WebApp.Common.Popup.MessageBox" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 공통 메세지 박스
*  2. Function Name        :
*  3. Program ID           : MessageBox.ascx
*  4. Program Name         : 공통 메세지 박스 컨트롤
*  5. Program Desc         : 공통 메세지 박스 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-07-25
*  8. Modified date(Last)  : 2015-10-16
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="MessageBox_Before_Event_Holder" runat="server">
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
            popMessageBox = ASPxClientPopupControl.Cast();
            popMessageBox.DefaultHeaderText = "Alert";
            popMessageBox.MessageBoxButtons = MessageBoxButtons.Ok;
            popMessageBox.CallbackF = 0;
            popMessageBox.fitLayout = ASPxClientFormLayout.Cast();
            popMessageBox.lblMsg = ASPxClientLabel.Cast();
            popMessageBox.btnOk = ASPxClientButton.Cast();
            popMessageBox.btnAbort = ASPxClientButton.Cast();
            popMessageBox.btnRetry = ASPxClientButton.Cast();
            popMessageBox.btnIgnore = ASPxClientButton.Cast();
            popMessageBox.btnYes = ASPxClientButton.Cast();
            popMessageBox.btnNo = ASPxClientButton.Cast();
            popMessageBox.btnCancel = ASPxClientButton.Cast();
            popMessageBox.SetDefault = function () { };
            popMessageBox.ShowMessage = function (pMsg, pMsgButtons, pWinSize, pCallBackF) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        function popMessageBox_Init(s, e) {
            //키다운 이벤트 오동작이 많아 차후 개발
            //var popMessageBox = ASPxClientPopupControl.Cast(popMessageBox);
            //var popMessageBoxKeyDownEvent = function (keydown) {
            //    if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ENTER")) {
            //        switch (popMessageBox.popMessageBoxButtons) {
            //            case popMessageBoxButtons.Ok:
            //                popMessageBox_btn_Click(popMessageBox.btnOk, null);
            //                break;
            //            case popMessageBoxButtons.OkCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnOk, null);
            //                break;
            //            case popMessageBoxButtons.RetryCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnRetry, null);
            //                break;
            //            case popMessageBoxButtons.AbortRetryIgnore:
            //                popMessageBox_btn_Click(popMessageBox.btnRetry, null);
            //                break;
            //            case popMessageBoxButtons.YesNo:
            //                popMessageBox_btn_Click(popMessageBox.btnYes, null);
            //                break;
            //            case popMessageBoxButtons.YesNoCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnYes, null);
            //                break;
            //            default:
            //                popMessageBox_btn_Click(popMessageBox.btnOk, null);
            //                break;
            //        }
            //    } else if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ESCAPE")) {
            //        switch (popMessageBox.popMessageBoxButtons) {
            //            case popMessageBoxButtons.Ok:
            //                popMessageBox_btn_Click(popMessageBox.btnOk, null);
            //                break;
            //            case popMessageBoxButtons.OkCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnCancel, null);
            //                break;
            //            case popMessageBoxButtons.RetryCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnCancel, null);
            //                break;
            //            case popMessageBoxButtons.AbortRetryIgnore:
            //                popMessageBox_btn_Click(popMessageBox.btnIgnore, null);
            //                break;
            //            case popMessageBoxButtons.YesNo:
            //                popMessageBox_btn_Click(popMessageBox.btnNo, null);
            //                break;
            //            case popMessageBoxButtons.YesNoCancel:
            //                popMessageBox_btn_Click(popMessageBox.btnCancel, null);
            //                break;
            //            default:
            //                popMessageBox_btn_Click(popMessageBox.btnOk, null);
            //                break;
            //        }
            //    }
            //    popMessageBox_SetDefault();
            //};
            //ASPxClientUtils.AttachEventToElement(document.getElementById(popMessageBox.name + "_PW-1"), "keydown", popMessageBoxKeyDownEvent);
            //ASPxClientUtils.AttachEventToElement(document.getElementById(popMessageBox.name + "_DXPWMB-1"), "keydown", popMessageBoxKeyDownEvent);
        };



        //메시지 박스 팝업시 발생한다.
        function popMessageBox_Popup(s, e) {
            var message_box = ASPxClientPopupControl.Cast(<%# ClientInstanceName %>);

            message_box.btnOk.Focus();
        };

        //메시지 박스의 버튼을 클릭하면 발생한다.
        function popMessageBox_btn_Click(s, e) {
            var message_box = ASPxClientPopupControl.Cast(<%# ClientInstanceName %>);
            message_box.Hide();
            
            var message_box_btn = s;
            
            if (message_box.CallbackF) {
                switch (message_box_btn.name) {
                    case message_box.btnOk.name:
                        message_box.CallbackF(DialogResult.Ok);
                        break;
                    case message_box.btnCancel.name:
                        message_box.CallbackF(DialogResult.Cancel);
                        break;
                    case message_box.btnAbort.name:
                        message_box.CallbackF(DialogResult.Abort);
                        break;
                    case message_box.btnRetry.name:
                        message_box.CallbackF(DialogResult.Retry);
                        break;
                    case message_box.btnIgnore.name:
                        message_box.CallbackF(DialogResult.Ignore);
                        break;
                    case message_box.btnYes.name:
                        message_box.CallbackF(DialogResult.Yes);
                        break;
                    case message_box.btnNo.name:
                        message_box.CallbackF(DialogResult.No);
                        break;
                    default:
                        message_box.CallbackF(DialogResult.Ok);
                        break;
                }
            }
            message_box.SetDefault();
        };
    </script>
</asp:PlaceHolder>

<%--<script type="text/javascript" src="./Scripts/popMessageBox.js"></script>--%>
<!-- 공통 메시지 박스 -->
<eni:eniPopupControl ID="popMessageBox" ClientInstanceName="popMessageBox" runat="server"
    CloseAction="CloseButton" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ShowHeader="True" HeaderText="Alert" ShowFooter="false" HeaderStyle-BorderBottom-BorderWidth="1px"
    AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" HeaderImage-Height="10px" RenderIFrameForPopupElements="True">
    <ClientSideEvents Init="popMessageBox_Init" PopUp="popMessageBox_Popup"  CloseButtonClick="popMessageBox_btn_Click" />
    <ModalBackgroundStyle BackColor="Transparent" />
    <ContentStyle>
        <Paddings PaddingBottom="0px" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxFormLayout ID="popMessageBox_fltLayout" ClientInstanceName="popMessageBox_fltLayout" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="메시지" ShowCaption="False" SettingsItemCaptions-HorizontalAlign="Right" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem Caption="메시지" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="popMessageBox_lblMsg" ClientInstanceName="popMessageBox_lblMsg" runat="server"></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="확인버튼" ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table style="margin:0px auto">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnOk" ClientInstanceName="popMessageBox_btnOk" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="확인" ClientVisible="true" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnAbort" ClientInstanceName="popMessageBox_btnAbort" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="Abort" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnRetry" ClientInstanceName="popMessageBox_btnRetry" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="Abort" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnIgnore" ClientInstanceName="popMessageBox_btnIgnore" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="Ignore" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnYes" ClientInstanceName="popMessageBox_btnYes" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="예" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnNo" ClientInstanceName="popMessageBox_btnNo" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="아니오" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="popMessageBox_btnCancel" ClientInstanceName="popMessageBox_btnCancel" runat="server"
                                                        Width="60px" AutoPostBack="false" Text="취소" ClientVisible="false" style="float:left; margin:0px 3px 0px 3px">
                                                        <ClientSideEvents Click="popMessageBox_btn_Click" />
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
            <%--<dx:ASPxSplitter ID="popMessageBox_Split" ClientInstanceName="popMessageBox_Split" runat="server" 
                Width="500"
                SeparatorVisible="False" Orientation="Vertical">
                <Panes>
                    <dx:ASPxSplitterPane Name="popMessageBox_MsgArea" PaneStyle-CssClass="noborder" ScrollBars="Auto">
                        <ContentCollection>
                            <dx:SplitterContentControl>
                                <eni:eniLabel ID="popMessageBox_lblMsg" ClientInstanceName="popMessageBox_lblMsg" runat="server"></eni:eniLabel>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:ASPxSplitterPane>
                    <dx:ASPxSplitterPane Name="popMessageBox_BtnArea" Size="45" PaneStyle-HorizontalAlign="Center" PaneStyle-CssClass="noborder">
                        <ContentCollection>
                            <dx:SplitterContentControl>
                                <eni:eniButton ID="popMessageBox_btnOk" ClientInstanceName="popMessageBox_btnOk" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="확인" ClientVisible="true">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnAbort" ClientInstanceName="popMessageBox_btnAbort" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="Abort" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnRetry" ClientInstanceName="popMessageBox_btnRetry" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="Abort" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnIgnore" ClientInstanceName="popMessageBox_btnIgnore" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="Ignore" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnYes" ClientInstanceName="popMessageBox_btnYes" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="예" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnNo" ClientInstanceName="popMessageBox_btnNo" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="아니오" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                                <eni:eniButton ID="popMessageBox_btnCancel" ClientInstanceName="popMessageBox_btnCancel" runat="server"
                                    Width="80px" Height="30px" AutoPostBack="false" Text="취소" ClientVisible="false">
                                    <ClientSideEvents Click="popMessageBox_btn_Click" />
                                </eni:eniButton>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:ASPxSplitterPane>
                </Panes>
            </dx:ASPxSplitter>--%>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniPopupControl>

<asp:PlaceHolder ID="MessageBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        popMessageBox.DefaultHeaderText = "Alert";
        popMessageBox.MessageBoxButtons = MessageBoxButtons.Ok;
        popMessageBox.CallbackF = 0;
        popMessageBox.fitLayout = popMessageBox_fltLayout;
        popMessageBox.lblMsg = popMessageBox_lblMsg;
        popMessageBox.btnOk = popMessageBox_btnOk;
        popMessageBox.btnAbort = popMessageBox_btnAbort;
        popMessageBox.btnRetry = popMessageBox_btnRetry;
        popMessageBox.btnIgnore = popMessageBox_btnIgnore;
        popMessageBox.btnYes = popMessageBox_btnYes;
        popMessageBox.btnNo = popMessageBox_btnNo;
        popMessageBox.btnCancel = popMessageBox_btnCancel;
        
        // 메세지 박스 디폴드 설정
        popMessageBox.SetDefault = function () {
            lgDisplaypopMessageBox = false;

            this.MessageBoxButtons = MessageBoxButtons.Ok;
            this.CallbackF = null;
            //this.SetWidth(null);
            //this.SetHeight(null);
            this.SetHeaderText(this.DefaultHeaderText);
            this.btnOk.SetVisible(true);
            this.btnAbort.SetVisible(false);
            this.btnRetry.SetVisible(false);
            this.btnIgnore.SetVisible(false);
            this.btnYes.SetVisible(false);
            this.btnNo.SetVisible(false);
            this.btnCancel.SetVisible(false);

            //if (eni.UserAgent.browser.version == 7) {

            //}
        };

        // 메세지 박스 보여주기
        popMessageBox.ShowMessage = function (pMsg, pMsgButtons, pWinSize, pCallBackF) {
            if (eni.Loading.IsVisible()) {
                eni.Loading.DisplayStatusLoading(false);
            }

            //메시지 박스 메시지 설정
            this.lblMsg.SetText(pMsg);

            //메시지 박스 사이즈 설정
            if (pWinSize && typeof pWinSize === "object") {
                this.SetWidth(pWinSize.Width);
                this.SetHeight(pWinSize.Height);
            } else {
                /* 팝업의 동적크기를 할당하기 위해 기본적으로 가로 세로 크기를 지정하지 않지만
                 * IE 7 버젼의 렌더링 방식때문에 배경이 동적으로 늘어나지 않는다.
                 * 때문에 기본값으로 크기를 지정해야한다.
                 */
                //if (eni.UserAgent.browser.version == 7) {
                //    this.SetWidth(400);
                //}
            }

            //메시지 박스 버튼 설정
            if (pMsgButtons) {
                switch (pMsgButtons) {
                    case MessageBoxButtons.Ok:
                        this.btnOk.SetVisible(true);
                        this.btnAbort.SetVisible(false);
                        this.btnRetry.SetVisible(false);
                        this.btnIgnore.SetVisible(false);
                        this.btnYes.SetVisible(false);
                        this.btnNo.SetVisible(false);
                        this.btnCancel.SetVisible(false);
                        break;
                    case MessageBoxButtons.OkCancel:
                        this.btnOk.SetVisible(true);
                        this.btnAbort.SetVisible(false);
                        this.btnRetry.SetVisible(false);
                        this.btnIgnore.SetVisible(false);
                        this.btnYes.SetVisible(false);
                        this.btnNo.SetVisible(false);
                        this.btnCancel.SetVisible(true);
                        break;
                    case MessageBoxButtons.RetryCancel:
                        this.btnOk.SetVisible(false);
                        this.btnAbort.SetVisible(false);
                        this.btnRetry.SetVisible(true);
                        this.btnIgnore.SetVisible(false);
                        this.btnYes.SetVisible(false);
                        this.btnNo.SetVisible(false);
                        this.btnCancel.SetVisible(true);
                        break;
                    case MessageBoxButtons.AbortRetryIgnore:
                        this.btnOk.SetVisible(false);
                        this.btnAbort.SetVisible(true);
                        this.btnRetry.SetVisible(true);
                        this.btnIgnore.SetVisible(true);
                        this.btnYes.SetVisible(false);
                        this.btnNo.SetVisible(false);
                        this.btnCancel.SetVisible(false);
                        break;
                    case MessageBoxButtons.YesNo:
                        this.btnOk.SetVisible(false);
                        this.btnAbort.SetVisible(false);
                        this.btnRetry.SetVisible(false);
                        this.btnIgnore.SetVisible(false);
                        this.btnYes.SetVisible(true);
                        this.btnNo.SetVisible(true);
                        this.btnCancel.SetVisible(false);
                        break;
                    case MessageBoxButtons.YesNoCancel:
                        this.btnOk.SetVisible(false);
                        this.btnAbort.SetVisible(false);
                        this.btnRetry.SetVisible(false);
                        this.btnIgnore.SetVisible(false);
                        this.btnYes.SetVisible(true);
                        this.btnNo.SetVisible(true);
                        this.btnCancel.SetVisible(true);
                        break;
                }
            }
            if (pCallBackF) {
                this.CallbackF = pCallBackF;
            }

            this.Show();
        };

        window['<%# ClientInstanceName %>'] = popMessageBox;
        popMessageBox = undefined;
    </script>
</asp:PlaceHolder>