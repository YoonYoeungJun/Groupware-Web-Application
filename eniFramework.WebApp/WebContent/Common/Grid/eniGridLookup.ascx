﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eniGridLookup.ascx.cs" Inherits="eniFramework.WebApp.Common.Grid.eniGridLookup" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxGridLookup ID="eniGridLookupControl" runat="server" AutoPostBack="false"
    Width="100%" SelectionMode="Single"  AutoGenerateColumns="False" AutoResizeWithContainer="True" PopupHorizontalAlign="LeftSides">
    <Columns>
        <dx:GridViewDataColumn Caption="No" FieldName="ROW_NUM" Width="60px" VisibleIndex="0" ReadOnly="True">
            <Settings AllowAutoFilter="False" AllowDragDrop="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
            <CellStyle HorizontalAlign="Center" BackColor="#ECECEC"></CellStyle>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataColumn>
        <%--<dx:GridViewDataColumn Width="100%" VisibleIndex="9999">
            <Settings AllowAutoFilter="False" AllowDragDrop="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
            <EditFormSettings Visible="False" />
        </dx:GridViewDataColumn>--%>
    </Columns>
    <GridViewProperties>
        <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
    </GridViewProperties>
</dx:ASPxGridLookup>