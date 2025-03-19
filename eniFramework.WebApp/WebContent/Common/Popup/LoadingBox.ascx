<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoadingBox.ascx.cs" Inherits="eniFramework.WebApp.Common.Popup.LoadingBox" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 공통 로딩박스 컨트롤
*  2. Function Name        :
*  3. Program ID           : LoadingBox.ascx
*  4. Program Name         : 공통 로딩박스 컨트롤
*  5. Program Desc         : 공통 로딩박스 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-07-25
*  8. Modified date(Last)  : 2015-04-21
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="LoadingBox_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../Contents/eniWeb.css" />
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
        <script type="text/javascript" src="../../../../Scripts/Devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            popLoadingBox = ASPxClientPopupControl.Cast();
            popLoadingBox.Text = ASPxClientLabel.Cast();
            popLoadingBox.DefaultMsgText = "";
            popLoadingBox.SetDefault = function () {};
            popLoadingBox.ShowLoading = function (pMessage) {};
            popLoadingBox.ShowTimeLoading = function (pMessage, pTickCount, pCallbackF) {};
            popLoadingBox.CloseLoading = function () {};
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
        .popLoadingBox {
            border-radius:50%;
        }
        .popLoadingBox_opacity {
            opacity:0.3;
            filter:alpha(opacity='30');
        }
         /*.popLoadingBox {
            width:100%;
            height:100%;
            left:0;
            top:0;
            position:absolute;
            z-index:9999;
            background-color:#000000;
            opacity:0.6;
            filter:alpha(opacity:'60')
        }*/
    </style>

    <!--[if lt IE 9]>
    <style type="text/css">
        .popLoadingBox {
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            behavior: url(/Scripts/PIE/PIE.htc);
        }
    </style>
    <![endif]-->

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
    </script>

</asp:PlaceHolder>

<eni:eniPopupControl ID="popLoadingBox" ClientInstanceName="popLoadingBox" runat="server"
    Width="96px" Height="96px" CssClass="popLoadingBox" Cursor="wait" Modal="true" BackColor="#C5C5C5"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
    ShowHeader="false" ShowFooter="false" AllowResize="false" 
    AllowDragging="false" PopupAnimationType="None" CloseAnimationType="None" 
    EnableViewState="False" RenderIFrameForPopupElements="True"
    ShowCloseButton="False" ShowSizeGrip="False" ShowShadow="False" 
    CloseAction="None">
    <Border BorderWidth="3px" BorderStyle="Solid" BorderColor="#8C8C8C" />
    <SettingsLoadingPanel ShowImage="False" Enabled="False" />
    <ModalBackgroundStyle CssClass="popLoadingBox_opacity" BackColor="Black" Cursor="wait" />
    <ContentStyle>
        <Paddings Padding="8px" />
    </ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <img src="../../../../Contents/Images/Loading/Loading_64x64.gif" alt="로드중..." title="로드중..." style="width:64px; height:64px; padding:0px; margin:5px 0px 0px 5px;"/>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniPopupControl>

<asp:PlaceHolder ID="LoadingBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        var _iFrameWin = $("#<%# popLoadingBox.ClientID %>_DXPWIF-1");
        var _divWin = $("#<%# popLoadingBox.ClientID %>_DXPWMB-1");
        
        // 로딩박스 디폴드 셋팅
        popLoadingBox.SetDefault = function () {
            lgDisplayStatusLoadingBox = false;
        };
        popLoadingBox.SetBackColorBlack = function () {
            var strStyle = _divWin.attr("style");
            _divWin.attr("style", strStyle.replace("transparent", "black"));
        };
        popLoadingBox.SetBackColorTransparent = function () {
            var strStyle = _divWin.attr("style");
            _divWin.attr("style", strStyle.replace("black", "transparent"));
        };

        // 로딩박스 보이기
        popLoadingBox.ShowLoading = function () {
            if (this.GetVisible() === false) {
                this.Show();
            }
        };

        // 로딩박스 타입
        popLoadingBox.ShowTimeLoading = function (pTickCount, pCallbackF) {
            if (this.GetVisible() === false) {
                this.Show();
            } else {
                return;
            }

            var count = (pTickCount || pTickCount === 0 ? 5 : pTickCount);

            var timeTick = function () {
                count--;
                if (count == 0) {
                    this.CloseLoading();

                    if (pCallbackF) {
                        pCallbackF();
                    }
                } else {
                    window.setTimeout(timeTick, 1000);
                }
            }
            window.setTimeout(timeTick, 1000);
        };

        // 로딩박스 닫기
        popLoadingBox.CloseLoading = function () {
            if (this.GetVisible() === true) {
                this.Hide();
                this.SetDefault();
            }
        };

        window['<%# ClientInstanceName %>'] = popLoadingBox;
        popLoadingBox = undefined;
    </script>
</asp:PlaceHolder>
