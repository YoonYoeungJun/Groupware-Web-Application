<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTime.ascx.cs" Inherits="eniFramework.WebApp.Views.ucHomeView.ucTime" EnableTheming="true" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<style type="text/css">
    .ucTimeContainer {
        position: absolute;
        display: block;
        left: 0px; 
        top: 0px; 
        right: 0px; 
        bottom: 0px;
        background-color:#FAFAFC;
    }
    .ucTimeContainer .time {
        text-align: center; padding-top: 15px;
    }
    .ucTimeContainer .date {
        height: 20px; text-align: center; padding-top: 5px;
    }
</style>

<script type="text/javascript">
    function ucTimePrepareTimeValue(value) {
        if (value < 10)
            value = "0" + value;
        return value;
    };

    function ucTimeReleseTime(s, e) {
        var dateTime = new Date();
        var timeString = ucTimePrepareTimeValue(dateTime.getHours()) + ":" + ucTimePrepareTimeValue(dateTime.getMinutes()) + ":" +
            ucTimePrepareTimeValue(dateTime.getSeconds());
        lblTime.SetText(timeString);
    };
</script>

<eni:eniDockPanel ID="dpTime" PanelUID="dpTime" SkinID="HomeDockPanel" runat="server" LoadContentViaCallback="OnPageLoad">
    <Styles>
        <Content CssClass="PositionRelative"></Content>
    </Styles>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <eni:eniTimer ID="tmUpdateTime" ClientInstanceName="tmUpdateTime" runat="server" Interval="1000">
                <ClientSideEvents Init="ucTimeReleseTime" Tick="ucTimeReleseTime" />
            </eni:eniTimer>
            <div class="ucTimeContainer">
                <div class="time">
                    <eni:eniLabel ID="lblTime" ClientInstanceName="lblTime" runat="server" Font-Bold="true" Font-Size="X-Large"></eni:eniLabel>
                </div>
                <div class="date">
                    <eni:eniLabel ID="lblDate" ClientInstanceName="lblDate" runat="server" Font-Size="14px"></eni:eniLabel>
                </div>
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniDockPanel>
