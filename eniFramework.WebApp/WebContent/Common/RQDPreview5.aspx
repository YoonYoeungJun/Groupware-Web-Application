<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RQDPreview5.aspx.cs" Inherits="eniFramework.WebApp.Common.RQDPreview5" EnableTheming="false" %>

<html runat="server">
    <head id="Head" runat="server">
        <title></title>
        <%--<script type="text/javascript">
            window.onload = function () {
            };
        </script>--%>
    </head>
    <body id="Body" runat="server">
        <% this.Response.Write(GetSource()); %>
    </body>
</html>

