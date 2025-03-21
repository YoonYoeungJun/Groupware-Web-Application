﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserIdContextMenuBox.ascx.cs" Inherits="eniFramework.WebApp.Popup.UserIdContextMenuBox" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 사용자 아이디 클릭용 컨텍스트 메뉴
*  2. Function Name        :
*  3. Program ID           : UserIdContextMenu.ascx
*  4. Program Name         : 사용자 아이디 클릭용 컨텍스트 메뉴 컨트롤
*  5. Program Desc         : 사용자 아이디 클릭용 컨텍스트 메뉴 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-09-25
*  8. Modified date(Last)  : 2014-09-25
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="lgUserIdContextMenuBox_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../.Contents/eniWeb.css" />
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
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Popup.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../Scripts/devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            lgFrmUserIdContextMenuBox = ASPxClientPopupMenu.Cast();
            lgFrmUserIdContextMenuBox.CallbackF = 0;
            lgFrmUserIdContextMenuBox.SetDefault = function () { };
            lgFrmUserIdContextMenuBox.ShowContextMenu = function (pAtElement, pContextMenuType, pCallBackF) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">

    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        //컨텍스트 메뉴 아이템을 클릭하면 발생한다.
        function lgFrmUserIdContextMenuBox_ItemClick(s, e) {
            lgFrmUserIdContextMenuBox.Hide();
            lgFrmUserIdContextMenuBox.CallbackF(e.item.name);
            lgFrmUserIdContextMenuBox.SetDefault();
        };
    </script>
</asp:PlaceHolder>
<%-- ShowLoadingPanel="False" --%>
<dx:ASPxPopupMenu ID="lgFrmUserIdContextMenuBox" ClientInstanceName="lgFrmUserIdContextMenuBox" runat="server" 
    ShowPopOutImages="True" 
    AutoPostBack="false" 
    PopupHorizontalAlign="Center" 
    PopupVerticalAlign="Below" 
    CloseAction="OuterMouseClick" ItemLinkMode="TextAndImage" 
     
    PopupVerticalOffset="5"
    SeparatorPaddings-PaddingLeft="0"
    LinkStyle-HoverColor="Red" AllowSelectItem="False" BackgroundImage-HorizontalPosition="center" EnableHotTrack="true" LoadingPanelStyle-VerticalAlign="NotSet" GutterCssClass="BgColorWhite" BackgroundImage-Repeat="NoRepeat" SelectParentItem="True" ApplyItemStyleToTemplates="True">
    <ItemStyle Width="130px"></ItemStyle>
    <Items>
        <dx:MenuItem GroupName="Send" Name="SendNote" Text="쪽지 보내기" Checked="false">
        </dx:MenuItem>
        <dx:MenuItem GroupName="Send" Name="SendMail" Text="메일 보내기" Checked="false"></dx:MenuItem>
        <dx:MenuItem GroupName="User" Name="UserInfo" Text="사용자 정보" BeginGroup="True" Checked="false"></dx:MenuItem>
    </Items>
    <ClientSideEvents ItemClick="lgFrmUserIdContextMenuBox_ItemClick" />
</dx:ASPxPopupMenu>

<asp:PlaceHolder ID="lgUserIdContextMenuBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        lgFrmUserIdContextMenuBox.CallbackF = 0;

        // 메세지 박스 디폴드 설정
        lgFrmUserIdContextMenuBox.SetDefault = function () {
            lgFrmUserIdContextMenuBox.CallbackF = null;
        };

        // 아디이 클릭 컨텍스트 박스 보여주기
        lgFrmUserIdContextMenuBox.ShowContextMenu = function (pAtElement, pContextMenuType, pCallBackF) {
            if (pAtElement) {
                if (pCallBackF) {
                    this.CallbackF = pCallBackF;
                }

                this.ShowAtElement(pAtElement);
            }
        };
    </script>
</asp:PlaceHolder>