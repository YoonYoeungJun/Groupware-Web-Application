﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfoBox.ascx.cs" Inherits="eniFramework.WebApp.Popup.UserInfoBox" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 사용자 정보
*  2. Function Name        :
*  3. Program ID           : UserInfoBox.ascx
*  4. Program Name         : 사용자 정보 컨트롤
*  5. Program Desc         : 사용자 정보 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-09-25
*  8. Modified date(Last)  : 2014-09-25
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="lgUserInfoBox_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery.Cookie.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../Scripts/devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            lgFrmUserInfoBox = ASPxClientPopupControl.Cast();
            lgFrmUserInfoBox.CallbackF = 0;
            lgFrmUserInfoBox.fitLayout = ASPxClientFormLayout.Cast();
            
            lgFrmUserInfoBox.SetDefault = function () { };
            lgFrmUserInfoBox.ShowMessage = function (pMsg, pMsgButtons, pWinSize, pCallBackF) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        function lgFrmUserInfoBox_Init(s, e) {
            
        };



        //메시지 박스 팝업시 발생한다.
        function lgFrmUserInfoBox_Popup(s, e) {
            
        };

        //메시지 박스의 버튼을 클릭하면 발생한다.
        function lgFrmUserInfoBox_btn_Click(s, e) {
            lgFrmUserInfoBox.Hide();

            lgFrmUserInfoBox.SetDefault();
        };
    </script>
</asp:PlaceHolder>

<!-- 공통 사용자 정보 박스 -->
<dx:ASPxPopupControl ID="lgFrmUserInfoBox" ClientInstanceName="lgFrmUserInfoBox" runat="server"
    Width="400px" Height="400px" Modal="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ShowHeader="True" HeaderText="사용자 정보보기" HeaderStyle-BorderBottom-BorderWidth="1px"
    ShowFooter="True" FooterText="Copyright ⓒ 2014 DAE-IL Corp. All rights reserved." FooterStyle-HorizontalAlign="Center"
    AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" HeaderImage-Height="10px">
    <ClientSideEvents Init="lgFrmUserInfoBox_Init" PopUp="lgFrmUserInfoBox_Popup"  CloseButtonClick="lgFrmUserInfoBox_btn_Click" />
    <ModalBackgroundStyle BackColor="Transparent" />
    <ContentStyle>
        <Paddings PaddingBottom="0px" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <asp:Repeater ID="eniRtUserInfoContainer" runat="server">
                <ItemTemplate>
                    <asp:Table runat="server" CssClass="FullScreen">
                        <asp:TableRow Height="60px">
                            <asp:TableCell RowSpan="3">
                                <dx:ASPxBinaryImage ID="eniBImgUserPhoto" runat="server" 
                                    Width="45px" Height="45px" EmptyImage-Url="~/Contents/Images/Photo.gif">
                                </dx:ASPxBinaryImage>
                            </asp:TableCell>
                            <asp:TableCell Width="16px">
                                <dx:ASPxImage runat="server"></dx:ASPxImage>
                            </asp:TableCell>
                            <asp:TableCell CssClass="Width100f">
                                <dx:ASPxLabel ID="eniLblBizAreaNm" runat="server">
                                </dx:ASPxLabel>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2">
                                <dx:ASPxLabel ID="eniLblDeptNm" runat="server">
                                </dx:ASPxLabel>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2">
                                <dx:ASPxLabel ID="eniLblUserName" runat="server">
                                </dx:ASPxLabel>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
            </asp:Repeater>


           <%-- <dx:ASPxFormLayout ID="lgFrmUserInfoBox_fltLayout" ClientInstanceName="lgFrmUserInfoBox_fltLayout" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="메시지" ShowCaption="False" SettingsItemCaptions-HorizontalAlign="Right" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem Caption="사진 및 이름" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <asp:Table runat="server" CssClass="FullScreen">
                                            <asp:TableRow Height="60px">
                                                <asp:TableCell RowSpan="3">
                                                    <dx:ASPxBinaryImage ID="eniBImgUserPhoto" runat="server" 
                                                        Width="45px" Height="45px" EmptyImage-Url="~/Contents/Images/Photo.gif">
                                                    </dx:ASPxBinaryImage>
                                                </asp:TableCell>
                                                <asp:TableCell Width="16px">
                                                    <dx:ASPxImage runat="server"></dx:ASPxImage>
                                                </asp:TableCell>
                                                <asp:TableCell CssClass="Width100f">
                                                    <dx:ASPxLabel ID="eniLblBizAreaNm" runat="server">
                                                    </dx:ASPxLabel>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell ColumnSpan="2">
                                                    <dx:ASPxLabel ID="eniLblDeptNm" runat="server">
                                                    </dx:ASPxLabel>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell ColumnSpan="2">
                                                    <dx:ASPxLabel ID="eniLblUserName" runat="server">
                                                    </dx:ASPxLabel>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="이메일">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="eniLblEmail" runat="server">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="내선번호">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="eniLblTelNo" runat="server">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="핸드폰">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="eniLblHandTelNo" runat="server">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>--%>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<asp:PlaceHolder ID="lgUserInfoBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        lgFrmUserInfoBox.CallbackF = 0;
        
        // 메세지 박스 디폴드 설정
        lgFrmUserInfoBox.SetDefault = function () {
           
        };

        // 메세지 박스 보여주기
        lgFrmUserInfoBox.ShowPopup = function (pUserId) {
            lgFrmUserInfoBox.Show();
            //this.PerformCallback(pUserId);
        };
    </script>
</asp:PlaceHolder>