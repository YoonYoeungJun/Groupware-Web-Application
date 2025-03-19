<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTMLPrint.aspx.cs" Inherits="eniFramework.WebApp.Common.HTMLPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="HTMLPrintHeader" runat="server">
        <title><%: Server.UrlDecode(Request.QueryString["HTMLPrintTitle"]) %></title>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
        <meta name="CODE_LANGUAGE" content="C#"/>
        <meta name="vs_defaultClientScript" content="JavaScript"/>
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
        <meta name="application-name" content="DIC Groupware" />
        <meta name="author" content="(주)디아이씨" />
        <meta name="keywords" content="(주)디아이씨" />
        <meta name="description" content="(주)디아이씨 포털 그룹웨어 입니다." />
        <meta name="robots" content="noindex,nofollow" />
        <meta name="viewport" content="width=device-width" />
        <meta http-equiv="imagetoolbar" content="no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)"/>
        <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)"/>
        <asp:PlaceHolder ID="HTMLPrintPlaceHolder" runat="server">
            <%-- 디자인 모드일때만 ScriptIntellisense 기능 사용 --%>
            <% if (DesignMode == true){ %>
                <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
                <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
                <script type="text/javascript" src="../../Framework/showModalDialogCallee.js"></script>
            <% } else { %>
                <%-- 디버그 모드일때는 스크립트를 각각 요청 --%>
                <% #if DEBUG %>
                    <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
                    <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
                    <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Extends.js"></script>
                <% #else %>
                <%-- 릴리스 모드일땐 Css / Script 압축 --%>
                    <link type="text/css" rel="stylesheet" href="/DX.ashx?cssfile=~/Contents/eniWeb.css" />
                    <script type="text/javascript" src="/DX.ashx?jsfileset=~/Scripts/jQuery/jQuery-1.9.1.min.js;~/Scripts/Framework/eniFramework.Extends.js"></script>
                <% #endif %>
            <% } %>
        </asp:PlaceHolder>
        <style type="text/css">
            /* 메일 읽기 */
            html, body, form, iframe {
                overflow:visible;
            }
            .body {
                background-color:white;
                overflow:auto !important;
                -webkit-user-select: auto;
                -khtml-user-select: auto;
                -moz-user-select: text;
                -ms-user-select: text;
                user-select: text;
                cursor:auto;
            }
            .con_title {
                padding:10px;
                border-bottom:1px solid #C0C0C0;
            }
            .con_body {
                padding:10px;
                word-break:break-all;
            }
            .con_body,
            .con_body p,
            .con_body li,
            .con_body div {
                line-height:1.5;
            }
            .con_body table,
            .con_body tr,
            .con_body td {
                line-height:normal;
                font-size:0px;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                var args = getDialogArguments();
                if (args.PrintBody) {
                    try{
                        $("#HTMLPrintBody").html(args.PrintBody);
                    } catch (ex) { }
                }
                window.focus();
                window.print();
            });
        </script>
    </head>
    <body id="HTMLPrintBody" class="HTMLPrintBody"></body>
</html>