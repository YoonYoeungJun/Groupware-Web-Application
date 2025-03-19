<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="eniFramework.WebApp.Test.test3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="margin:0; padding:0; height:100%">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
    <script type="text/javascript" src="/Scripts/jQuery/jQuery.1.10.1.min.js"></script>
    <!--[if lt IE 9]>
        <script type="text/javascript" src="/Scripts/PIE/PIE.js"></script>
    <![endif]-->


    <title></title>
    <style>
        #left {
            position:absolute;
            top:0;
            bottom:0;
            left:0;
            right:0;
            margin:0;
            padding:0;
            width:300px;
            overflow:auto;
        }
        .popLoadingBox {
            border:3px solid #8C8C8C;
            border-radius:50%;
            background-size: 50px 50px;
            background-color: #0ae;
            background-image: -webkit-linear-gradient(rgba(255, 255, 255, .2) 50%, transparent 50%, transparent);
            background-image: -moz-linear-gradient(rgba(255, 255, 255, .2) 50%, transparent 50%, transparent);
            background-image: linear-gradient(rgba(255, 255, 255, .2) 50%, transparent 50%, transparent);
            -pie-background: linear-gradient(rgba(255, 255, 255, .2) 50%, transparent 50%, transparent) 0 0 / 50px #0ae;
            behavior: url(/Scripts/PIE/PIE.htc);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Layout Header">
        </div>
        <div class="Layout Container">
        </div>
        <div class="Layout Footer">
        </div>
        <div class="popLoadingBox" style="width:100px; height:100px;">

        </div>
        <a href="#" onclick="window.open()">aaa</a>
    </form>
</body>
</html>

