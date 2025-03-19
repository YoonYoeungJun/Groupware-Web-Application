<%@ Page Language="VB" AutoEventWireup="true"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        html, body, form {
            width:100%;
            height:100%;
            padding: 0px;
            margin:0px;
            scrollbar-face-color:#fff;
            scrollbar-shadow-color:#d5d5d5;
            scrollbar-highlight-color:#fff;
            scrollbar-darkshadow-color:#d5d5d5;
            scrollbar-arrow-color:#939393;
            scrollbar-track-color:#f3f3f3;
            scrollbar-3dlight-color:#d5d5d5;
            scrollbar-highlight-color:#fff;
        }
    </style>
</head>
<body style="height:100%; width:100%; border:0px; margin:0px">
    <form id="form1" runat="server">
        <%--<asp:Table runat="server" Width="100%" Height="100%" BorderWidth="0">
            <asp:TableRow Height="30px">
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="100%">
                <asp:TableCell Width="55px" Height="100%">
                    <iframe id="IdxMenu" name="IdxMenu" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" 
                        class="FullScreen NoScroll BorderClear Margin0 Padding0" style="height:100%;" >
                    </iframe>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>
        <eni:eniSplitter ID="ser" runat="server" FullscreenMode="true" Orientation="Vertical">
            <Panes>
                <dx:SplitterPane>
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane>
                    <ContentCollection>
                        <dx:SplitterContentControl runat="server" style="padding:0px">
                            <iframe id="IdxMenu" name="IdxMenu" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" 
                                class="FullScreen NoScroll BorderClear Margin0 Padding0" style="height:100%;" >
                            </iframe>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </eni:eniSplitter>
       <%--<table id="IndexContainer" cellpadding="0" cellspacing="0" border="0" style="background-color:red; width:100%; height:100%; border:0px; margin:0px;">
        <tr>
            <td id="IndexTopContainer" style="height:30px;" colspan="2">
                
            </td>
        </tr>
        <tr>
            <td id="IndexLeftContainer" style="width:55px; height:100%; vertical-align:top;">
                <iframe id="IdxMenu" name="IdxMenu" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" 
                    class="FullScreen NoScroll BorderClear Margin0 Padding0" style="height:100%;" >
                </iframe>
            </td>
            <td id="IndexRightContainer" class="FullScreen">
                <iframe id="IdxContent" name="IdxContent" runat="server" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" 
                    class="FullScreen NoScroll BorderClear Margin0 Padding0" style="height:100%">
                </iframe>
            </td>
        </tr>
    </table>--%>
    </form>
</body>
</html>
