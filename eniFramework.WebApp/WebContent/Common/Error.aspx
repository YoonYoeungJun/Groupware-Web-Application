<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="eniFramework.WebApp.Common.Error" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Error
    *  2. Function Name        :
    *  3. Program ID           : Error.aspx
    *  4. Program Name         : 에러
    *  5. Program Desc         : 에러
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2016-04-25
    *  8. Modified date(Last)  : 2017-07-06
    *  9. Modifier (First)     : Yoon YoungJun
    * 10. Modifier (Last)      : Yoon YoungJun
    * 11. Comment              :
    **************************************************************************************************************
    --%>
</asp:Content>

<%-- 2.해당 페이지 추가 Meta 코드 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Meta_Holder" runat="server">
</asp:Content>

<%-- 3.해당 페이지의 컨트롤 ScriptIntellisense 기능 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_ScriptIntelliSense_Holder" runat="server">
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
    </style>
    <script type="text/javascript">
        try {
            var Error = eni.Initialize(new function () {
                this.Title = "Error",
                this.iFrameName = "_blank";
                this.ViewType = ViewType.ModuleView;
                this.Form_Load = function () {
                };
                this.Form_Load_Complate = function () {
                };
                this.btnHome_OnClick = function (e) {
                    eni.RunPageTopFrame("<%=lgUrlInfo.VirtualPath%>index");
                }

            });
        } catch (ex) {
            alert(ex.message);
        }
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
</asp:Content>

<%-- 6.컨텐트 Form 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <div style="position:absolute; width:800px; height:200px; top:30%; left:50%; margin: -100px 0 0 -400px;">
        <table class="FullScreen BorderClear Padding0" cellpadding="0" cellspacing="0" border="0">
            <tr style="height:30px;">
                <td style="text-align:center; font-size:50px; color:darkblue; font-weight:bold;">
                    <span><%= GetGlobalResource("ApplicationName") %></span>
                </td>
            </tr>
            <tr>
                <td style="font-size:15px; color:#4C46CC;">
                    <asp:PlaceHolder ID="ErrorReport" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr style="height:30px; text-align:center;">
                <td>
                    <div class="CButtonLWhite CButtonLWhiteHover" onclick="Error.btnHome_OnClick(event)">
                        <div>
                            <span>홈으로</span>
                        </div>
                    </div>
                    <div class="CButtonLWhite CButtonLWhiteHover">
                        <div>
                            <span>이전페이지</span>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
