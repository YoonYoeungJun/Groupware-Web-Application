<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucStatus.ascx.cs" Inherits="eniFramework.WebApp.Views.ucHomeView.ucStatus" %>

<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<style type="text/css">
    .ucStatusContainer { }
    .ucStatusContainer tr:hover {
        background-color:#E7EDF9;
        color:black;
    }
    .ucStatusContainer .time {
        text-align: center; padding-top: 15px;
    }
    .ucStatusContainer .date {
        height: 20px; text-align: center; padding-top: 5px;
    }
</style>

<script type="text/javascript">
    
</script>

<eni:eniDockPanel ID="dpStatus" PanelUID="dpStatus" SkinID="HomeDockPanel" runat="server">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <table class="Width100f BorderClear Padding0 Margin0 ucStatusContainer" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="border-bottom:1px solid #D6D6D6;">
                        <table class="Width100f BorderClear Margin0" style="padding:10px; border-collapse:separate" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td rowspan="4" style="width:80px">
                                    <eni:eniBinaryImage ID="eniBIUserPhoto" runat="server"
                                        Width="70px" Height="80px"
                                        ImageAlign="Middle"
                                        AlternateText="Groupware"
                                        ToolTip="1231231"
                                        EmptyImage-Url="~/Contents/Images/Photo.gif"
                                        EmptyImage-Width="70px"
                                        EmptyImage-Height="105px"
                                        EmptyImage-AlternateText="UserPhoto"
                                        Border-BorderWidth="1px"
                                        Border-BorderStyle="Solid"
                                        Border-BorderColor="#D6D6D6"
                                        meta:resourcekey="eniBIUserPhoto" StoreContentBytesInViewState="True">
                                    </eni:eniBinaryImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:40px; font-size:12px; color:#AEAEAE;">
                                    <asp:Label ID="eniLblUserName" runat="server" Font-Size="24px" Font-Bold="true" ForeColor="#666666"></asp:Label>&nbsp;/&nbsp;<asp:Label ID="eniLblRolePstnName" runat="server" Font-Bold="true"></asp:Label>
                                   <%-- <div class="CSmallRadiusRed">
                                        <span>1</span>
                                    </div>--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:20px; font-size:12px; color:#AEAEAE;">
                                    <asp:Label ID="eniLblBizAreaName" runat="server" Font-Bold="true"></asp:Label>&nbsp;/&nbsp;<asp:Label ID="eniLblPlantName" runat="server" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="height:20px; font-size:12px; color:#AEAEAE;">
                                    <asp:Label ID="eniLblDeptName" runat="server" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height:35px; border-bottom:1px solid #D6D6D6; cursor:pointer;" onclick="eni.RunPageFrame('/mail?sfnm=받은 편지함')"
                        title="받은 편지함 으로 링크됩니다.">
                        <span class="Font-Medium DisplayBlock Padding5L" style="line-height:20px; height:17px;">
                            <%--받은 편지함--%>
                            <asp:Label ID="lblInbox" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblInboxUnSeenCnt" ForeColor="Silver" runat="server"></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td style="height:35px; border-bottom:1px solid #D6D6D6; cursor:pointer;" onclick="eni.RunPageFrame('/mail?sfnm=내게쓴 편지함')"
                        title="내게쓴 편지함 으로 링크됩니다.">
                        <span class="Font-Medium DisplayBlock Padding5L" style="line-height:20px; height:17px;">
                            <%--공지 편지함--%>
                            <asp:Label ID="lblMy" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMyUnSeenCnt" ForeColor="Silver" runat="server"></asp:Label>
                        </span>
                    </td>
                </tr>
               
                <tr>
                    <td style="height:35px; cursor:pointer;" onclick="eni.RunPageFrame('/mail?sfnm=보낸 편지함')"
                        title="보낸 편지함 으로 링크됩니다.">
                        <span class="Font-Medium DisplayBlock Padding5L" style="line-height:20px; height:17px;">
                            <%--보낸 편지함--%>
                            <asp:Label ID="lblSendBox" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSendBoxUnSeenCnt" ForeColor="Silver" runat="server"></asp:Label>
                        </span>
                    </td>
                </tr>
                 <tr>
                    <td style="height:35px; border-bottom:1px solid #D6D6D6; cursor:pointer;" onclick="eni.RunPageFrame('/mail?sfnm=장기 보관함')"
                        title="장기 보관함 으로 링크됩니다.">
                        <span class="Font-Font-Medium DisplayBlock Padding5L" style="line-height:20px; height:17px;">
                            <%--사내 편지함--%>
                            <asp:Label ID="lblOldBox" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblOldBoxUnSeenCnt" ForeColor="Silver" runat="server"></asp:Label>
                        </span>
                    </td>
                </tr>
                <%--<tr>
                    <td style="height:35px; cursor:pointer;" onclick="eni.RunPageFrame('/MailView?sfnm=임시 보관함', ViewType.ModuleView)"
                        title="임시 편지함 으로 링크됩니다.">
                        <span class="Font-Medium DisplayBlock Padding5L" style="line-height:20px; height:17px;">
                            임시 보관함
                            <asp:Label ID="lblTempBox"></asp:Label>
                        </span>
                    </td>
                </tr>--%>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniDockPanel>


