<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBoard.ascx.cs" Inherits="eniFramework.WebApp.Views.ucHomeView.ucBoard" EnableTheming="true" %>

<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<style type="text/css">
    .ucBoardContainer {
        position: absolute;
        display: block;
        left: 0px; 
        top: 0px; 
        right: 0px; 
        bottom: 0px;
    }
    .ucBoardContainer .ucTitle {
        height:20px;
        padding:5px;
        background-color:#F3F3F6;
        border-bottom:1px solid #D6D6D6;
    }
    .ucBoardContainer .dxtc-content {
        position: absolute;
        display: block;
        left: 0px; 
        top: 59px; 
        right: 0px; 
        bottom: 0px;
        padding:0px !important;
        overflow-y:auto;
    }
    .ucBoardContainer .dxtc-content .row {
        height:20px;
        padding:8px 0px 0px 0px;
        border-bottom:1px solid #D6D6D6;
        color:#404040;
        cursor:pointer;
    }
    .ucBoardContainer .dxtc-content .row:hover {
        background-color:#E7EDF9;
        color:black;
    }
    .ucBoardContainer .dxtc-content .row .row_subject {
        text-overflow:ellipsis;
        overflow:hidden;
        white-space:nowrap;
        position:absolute;
        left:5px;
        right:190px;
    }
    .ucBoardContainer .dxtc-content .row .row_name {
        text-overflow:ellipsis;
        overflow:hidden;
        white-space:nowrap;
        position:absolute;
        float:left;
        right:70px;
        width:120px;
    }
    .ucBoardContainer .dxtc-content .row .row_date {
        position:absolute;
        float:left;
        right:0px;
        width:70px;
        text-align:center;
    }
</style>

<div class="ucBoardContainer">
    <div class="ucTitle">
        <span class="Font-Large Font-Bold DisplayBlock Padding5L" style="line-height:24px; height:21px;">게시판</span>
    </div>
    <eni:eniPageControl ID="pcBoardTab" ClientInstanceName="pcBoardTab" Width="100%" SkinID="Standard" runat="server"
        TabAlign="Left" EnableTabScrolling="true">
        <ActiveTabStyle ForeColor="#54A7D0" BackColor="White" Font-Bold="true"></ActiveTabStyle>
        <TabStyle BackColor="#F3F3F6" ForeColor="#989898" Font-Bold="true" HoverStyle-ForeColor="#54A7D0"></TabStyle>
        <TabPages>
            <dx:TabPage Text="게시판">
                <ContentCollection>
                    <dx:ContentControl>
                        <%-- 받은 편지함 --%>
                        <asp:Repeater ID="ucBoardList" runat="server" OnItemDataBound="ucBoardList_ItemDataBound">
                            <ItemTemplate>
                                    <div class="row" 
                                        title="<%# Eval("SUBJECT") %>"
                                        onclick="<%# string.Format("eni.RunPageFrame('/board/{0}?no={1}')", Eval("CATEGORY_CD"), Math.Abs((long)Eval("NO"))) %>">
                                        <span title="<%# HttpUtility.HtmlEncode(Eval("SUBJECT")) %>" class="row_subject"><%# HttpUtility.HtmlEncode(Eval("SUBJECT")) %></span>
                                        <span title="<%# HttpUtility.HtmlEncode(Eval("DEPT_NM").ToString() + " " + Eval("USER_NAME").ToString()) %>" class="row_name"><%# HttpUtility.HtmlEncode(Eval("DEPT_NM").ToString() + " " + Eval("USER_NAME").ToString()) %></span>
                                        <span class="row_date"><%# ((DateTime)Eval("DATE")).ToString(CommonVariable.CDT_YYYY_MM_DD) %></span>
                                    </div>
                                </table>
                            </ItemTemplate>
                            <FooterTemplate>
                                <table id="ucBoardListFooterContainer" class="Width100f BorderClear Padding0 Margin0 CursorPoint" cellpadding="0" cellspacing="0" border="0" visible="false" runat="server"
                                    style="height:200px;"> 
                                        <tr>
                                            <td style="text-align:center;">
                                                최근에 등록된 게시글이 없습니다.
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
       