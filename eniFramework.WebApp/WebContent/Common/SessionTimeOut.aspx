<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionAbandon.aspx.cs" Inherits="eniFramework.WebApp.Common.SessionTimeOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="SessionTimeOutHeader" runat="server">
        <title><%: Title %></title>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
        <meta name="CODE_LANGUAGE" content="C#"/>
        <meta name="vs_defaultClientScript" content="JavaScript"/>
        <meta name="application-name" content="DIC Groupware" />
        <meta name="author" content="(주)디아이씨" />
        <meta name="keywords" content="(주)디아이씨" />
        <meta name="description" content="(주)디아이씨 포털 그룹웨어 입니다." />
        <meta name="robots" content="noindex,nofollow" />
        <meta name="viewport" content="width=device-width" />
        <meta http-equiv="imagetoolbar" content="no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)"/>
        <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)"/>
        <asp:PlaceHolder ID="SessionTimeOutPlaceHolder" runat="server">
            <%-- 디자인 모드일때만 ScriptIntellisense 기능 사용 --%>
            <% if (DesignMode == true){ %>
                <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
                <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
                <script type="text/javascript" src="../../Scripts/jQuery/jQuery.Cookie.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/jQuery.Extends.js"></script>
                <script type="text/javascript" src="../../Scripts/Json/Json2.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Extends.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Resources.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Enum.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Classs.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.js"></script>
                <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
                <script type="text/javascript" src="../../Scripts/Devexpress/ASPxScriptIntellisense.js"></script>
            <% } else { %>
                <%-- 디버그 모드일때는 스크립트를 각각 요청 --%>
                <% #if DEBUG %>
                    <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
                    <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
                    <script type="text/javascript" src="../../Scripts/jQuery/jQuery.Cookie.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/jQuery.Extends.js"></script>
                    <script type="text/javascript" src="../../Scripts/Json/Json2.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Extends.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Resources.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Enum.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Classs.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
                <% #else %>
                <%-- 릴리스 모드일땐 Css / Script 압축 --%>
                    <link type="text/css" rel="stylesheet" href="/DX.ashx?cssfile=~/Contents/eniWeb.css" />
                    <script type="text/javascript" src="/DX.ashx?jsfileset=~/Scripts/jQuery/jQuery-1.9.1.min.js;~/Scripts/jQuery/jQuery.Cookie.js;~/Scripts/Framework/jQuery.Extends.js;~/Scripts/Json/Json2.js;~/Scripts/Framework/eniFramework.Extends.js;~/Scripts/Framework/eniFramework.Resources.js;~/Scripts/Framework/eniFramework.Enum.js;~/Scripts/Framework/eniFramework.Classs.js;~/Scripts/Framework/eniFramework.js;~/Scripts/Framework/eniFramework.UserAgent.js;"></script>
                <% #endif %>
            <% } %>
        </asp:PlaceHolder>
        <script type="text/javascript">
            try {
                var SessionTimeOut = eni.Initialize(new function () {
                    this.Title = "aaa";
                    this.iFrameName = "_blank";
                    this.ViewType = ViewType.None;
                    this.Form_Load = function () {
                        eni.SetTitle("세션이 만료되었습니다 : " + "<%= lgCommons.GroupwareQuickName %>");
                    };
                    this.Form_Load_Complate = function () {
                    };
                    this.btnHome_OnClick = function (e) {
                        eni.RunPageTopFrame("/");
                    }
                    this.btnHistoryBack_OnClick = function (e) {
                        eni.RunPageHistoryBack(false);
                    };
                });
            } catch (ex) {
                alert(ex.message);
            }
        </script>
    </head>
    <body id="SessionTimeOutBody" class="SessionTimeOutBody" scroll="no">
        <form id="SessionTimeOutForm" name="SessionTimeOutForm" class="SessionTimeOutForm" runat="server" style="vertical-align:middle;">
            <div style="position:absolute; width:800px; height:200px; top:50%; left:50%; margin: -100px 0 0 -400px;">
                <table class="FullScreen BorderClear Padding0" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:30px;">
                        <td style="text-align:center; font-size:50px; color:darkblue; font-weight:bold;">
                            Groupware DIC
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size:15px; color:#4C46CC; text-align:center;">
                            해당세션은 만료되었습니다.<br />
                            하지만 로그인 상태는 유지됩니다.<br />
                            홈버튼과 이전페이지 버튼을 이용하여 로그인 없이 그룹웨어에 접속하세요.
                            <asp:PlaceHolder ID="Message" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr style="height:30px; text-align:center;">
                        <td>
                            <div class="CButtonLWhite CButtonLWhiteHover" onclick="SessionTimeOut.btnHome_OnClick(event)">
                                <div>
                                    <span>홈으로</span>
                                </div>
                            </div>
                            <div class="CButtonLWhite CButtonLWhiteHover" onclick="SessionTimeOut.btnHistoryBack_OnClick(event)">
                                <div>
                                    <span>이전페이지</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>