<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonList.aspx.cs" Inherits="eniFramework.WebApp.DesignForm.ButtonList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>개발된 버튼 디자인 프레임 워크(eniFrmaework)</title>
        <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
    </head>
    <body>
        <form id="frm" runat="server">
            <br /><br />
            <dx:ASPxButton runat="server" EnableTheming="false" AutoPostBack="false" 
                CssClass="CButtonMSilver Font" 
                HoverStyle-CssClass="CButtonMSilverHover" 
                PressedStyle-CssClass="CButtonMSilverPress"
                Text="디자인프레임워크">
                <Image IconID="actions_add_16x16"></Image>
            </dx:ASPxButton>
            <br /><br />
            <div class="CButtonSWhite">
                <span>수신확인</span>
            </div>
            <br /><br />
            <div class="CButtonLBlue CButtonLBlueHover">
                <div>
                    <img style="background-color:black; width:16px; height:16px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
            <div class="CButtonLWhite">
                <div>
                    <img style="background-color:black; width:16px; height:16px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
            <div class="CButtonLWhite CButtonLWhiteHover">
                <div>
                    <img style="background-color:black; width:16px; height:16px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
            <div class="CButtonXLWhite">
                <div>
                    <img style="background-color:black; width:16px; height:16px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
            <div class="CButtonXLWhite CButtonXLWhiteHover">
                <div>
                    <img style="background-color:black; width:18px; height:18px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
            <div class="CButtonXLWhite CButtonXLWhitePress">
                <div>
                    <img style="background-color:black; width:18px; height:18px;" />
                    <span>한글zzzzzzzz</span>
                </div>
            </div>
            <br /><br />
        </form>
    </body>
</html>
