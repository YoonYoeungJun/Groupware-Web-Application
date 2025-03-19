<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSchedule.ascx.cs" Inherits="eniFramework.WebApp.Views.ucHomeView.ucSchedule" EnableTheming="true" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<style type="text/css">
</style>

<eni:eniDockPanel ID="dpSchedule" PanelUID="dpSchedule"  SkinID="HomeDockPanel" runat="server">
    <Styles>
        <Content CssClass="PositionRelative"></Content>
    </Styles>
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCalendar ID="dteSchedule" Width="100%" runat="server" 
                BackColor="#FAFAFC" Border-BorderWidth="0px">
                <FooterStyle BackColor="#FAFAFC" />
            </dx:ASPxCalendar>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniDockPanel>
