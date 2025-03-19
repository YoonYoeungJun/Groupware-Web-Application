<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="RedirectSplash.aspx.cs" Inherits="eniFramework.WebApp.Common.RedirectSplash" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : RedirectSplash
    *  2. Function Name        :
    *  3. Program ID           : RedirectSplash.aspx
    *  4. Program Name         : 페이지 리다이렉트
    *  5. Program Desc         : 페이지 리다이렉트
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2016-04-25
    *  8. Modified date(Last)  : 2016-04-25
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
            var RedirectSplash = eni.Initialize(new function () {
                this.Title = "Redirect Splash";
                this.iFrameName = "_blank";
                this.ViewType = ViewType.None;
                this.Form_Load = function () {
                };
                this.Form_Load_Complate = function () {
                    var retUrl = eni.GetQueryString("ReturnUrl");
                    if (!retUrl) {
                        retUrl = "./login";
                    }
                    window.setTimeout(function () {
                        eni.RunPageTopFrame(retUrl);
                    }, 1000);
                };
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
    <div style="position:absolute; width:800px; height:90px; top:50%; left:50%; margin: -45px 0 0 -400px;">
        <table class="FullScreen BorderClear Padding0" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="text-align:center; font-size:30px; color:darkblue; font-weight:bold;">
                    <span><%= GetGlobalResource("GCSTRESX00103") %></span>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="text-align:center; font-size:15px; color:#4C46CC;"> 
                        <p>
                            <img src="./contents/images/splash_00.gif" width="238" height="4"/><br/>
                            <span><br/><asp:PlaceHolder ID="phRedirectText" runat="server"></asp:PlaceHolder><br/></span>
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
