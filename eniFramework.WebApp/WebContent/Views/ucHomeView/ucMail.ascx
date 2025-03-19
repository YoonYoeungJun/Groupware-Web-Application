<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMail.ascx.cs" Inherits="eniFramework.WebApp.Views.ucHomeView.ucMail" EnableTheming="True" %>

<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<style type="text/css">
    .ucMailContainer {
        position: absolute;
        display: block;
        left: 0px; 
        top: 0px; 
        right: 0px; 
        bottom: 0px;
    }
    .ucMailContainer .ucTitle {
        height:20px;
        padding:5px;
        background-color:#F3F3F6;
        border-bottom:1px solid #D6D6D6;
    }
    .ucMailContainer .dxtc-content {
        position: absolute;
        display: block;
        left: 0px; 
        top: 59px; 
        right: 0px; 
        bottom: 0px;
        padding:0px !important;
        overflow-y:auto;
    }

    .ucMailContainer .dxtc-content .row {
        height:20px;
        padding:8px 0px 0px 0px;
        border-bottom:1px solid #D6D6D6;
        color:#404040;
        cursor:pointer;
    }
    .ucMailContainer .dxtc-content .row:hover {
        background-color:#E7EDF9;
        color:black;
    }
    .ucMailContainer .dxtc-content .row .row_subject {
        text-overflow:ellipsis;
        overflow:hidden;
        white-space:nowrap;
        position:absolute;
        left:5px;
        right:200px;
    }
    .ucMailContainer .dxtc-content .row .row_from {
        text-overflow:ellipsis;
        overflow:hidden;
        white-space:nowrap;
        position:absolute;
        float:left;
        right:70px;
        width:130px;
        text-align:center;
    }
    .ucMailContainer .dxtc-content .row .row_date {
        position:absolute;
        float:left;
        right:0px;
        width:70px;
        text-align:center;
    }
</style>

<div class="ucMailContainer">
    <div class="ucTitle">
        <span class="Font-Large Font-Bold DisplayBlock Padding5L" style="line-height:24px; height:21px;">메일</span>
    </div>
    <eni:eniPageControl ID="pcMailTab" ClientInstanceName="pcMailTab" Width="100%" SkinID="Standard" runat="server"
        TabAlign="Left" EnableTabScrolling="true">
        <ActiveTabStyle ForeColor="#54A7D0" BackColor="White" Font-Bold="true"></ActiveTabStyle>
        <TabStyle BackColor="#F3F3F6" ForeColor="#989898" Font-Bold="true" HoverStyle-ForeColor="#54A7D0"></TabStyle>
        <TabPages>
            <dx:TabPage Name="AllPage" Text="전체 편지함">
                <ContentCollection>
                    <dx:ContentControl>
                        <%-- 전체 편지함 --%>
                        <asp:Repeater ID="rtAllboxMailList" runat="server" OnItemDataBound="rtAllboxMailList_ItemDataBound">
                            <ItemTemplate>
                                <div class="row" 
                                    onclick="<%# string.Format("eni.RunPageFrame('/mail?sfid={0}&mid={1}')", Eval("MESSAGEFOLDERID"), Eval("MESSAGEID")) %>">
                                    <span title="<%# Eval("MESSAGESUBJECT") %>" class="row_subject"><%# HttpUtility.HtmlEncode(Eval("MESSAGESUBJECT")) %></span>
                                    <span title="<%# Eval("MESSAGEFROMADDRESS") %>" class="row_from"><%# HttpUtility.HtmlEncode(Eval("MESSAGEFROMADDRESS")) %></span>
                                    <span title="<%# ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_YYYY_MM_DD) %>" 
                                        class="row_date"><%# ((DateTime)Eval("MESSAGEDATE")).ToShortDateString() == DateTime.Now.ToShortDateString() ? 
                                                            ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_HHMMSS) :
                                                            ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_YYYY_MM_DD) %></span>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <table id="rtAllBoxMailListFooterContainer" class="Width100f BorderClear Padding0 Margin0 CursorPoint" cellpadding="0" cellspacing="0" border="0" visible="false" runat="server"
                                    style="height:200px;"> 
                                        <tr>
                                            <td style="text-align:center;">
                                                최근에 받은 메일이 없습니다.
                                            </td>
                                        </tr>
                                    </table>            
                            </FooterTemplate>
                        </asp:Repeater>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="InboxPage" Text="받은 편지함">
                <ContentCollection>
                    <dx:ContentControl>
                        <%-- 받은 편지함 --%>
                        <asp:Repeater ID="rtInboxMailList" runat="server" OnItemDataBound="rtInboxMailList_ItemDataBound">
                            <ItemTemplate>
                                <div class="row" 
                                    onclick="<%# string.Format("eni.RunPageFrame('/MailView?sfid={0}&mid={1}')", Eval("MESSAGEFOLDERID"), Eval("MESSAGEID")) %>">
                                    <span title="<%# Eval("MESSAGESUBJECT") %>" class="row_subject"><%# HttpUtility.HtmlEncode(Eval("MESSAGESUBJECT")) %></span>
                                    <span title="<%# Eval("MESSAGEFROMADDRESS") %>" class="row_from"><%# HttpUtility.HtmlEncode(Eval("MESSAGEFROMADDRESS")) %></span>
                                    <span title="<%# ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_YYYY_MM_DD) %>" 
                                        class="row_date"><%# ((DateTime)Eval("MESSAGEDATE")).ToShortDateString() == DateTime.Now.ToShortDateString() ? 
                                                            ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_HHMMSS) :
                                                            ((DateTime)Eval("MESSAGEDATE")).ToString(CommonVariable.CDT_YYYY_MM_DD) %></span>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <table id="rtInboxMailListFooterContainer" class="Width100f BorderClear Padding0 Margin0 CursorPoint" cellpadding="0" cellspacing="0" border="0" visible="false" runat="server"
                                    style="height:200px;"> 
                                        <tr>
                                            <td style="text-align:center;">
                                                최근에 받은 메일이 없습니다.
                                            </td>
                                        </tr>
                                    </table>            
                            </FooterTemplate>
                        </asp:Repeater>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </eni:eniPageControl>
</div>