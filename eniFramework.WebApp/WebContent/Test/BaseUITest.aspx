<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="BaseUITest.aspx.cs" Inherits="eniFramework.WebApp.BaseUITest" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : BaseUITest
    *  2. Function Name        :
    *  3. Program ID           : BaseUITest.aspx
    *  4. Program Name         : 베이스 페이지 성능 테스트
    *  5. Program Desc         : 베이스 페이지 성능 테스트
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2017-09-16
    *  8. Modified date(Last)  : 2016-09-16
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
    <script type="text/javascript">
        // <![CDATA[
        var base_test_view = eni.Initialize(new function () {
            this.iFrameName = "ModuleView";
            this.ViewType = ViewType.ModuleView;
            this.Form_Load = function () {
                
            };
            this.Form_Load_Complate = function () {
            };
            this.btn = function () {
                ASPxClientCallback.Cast(cbProcess).PerformCallback();
            };
            this.cbProcess_BeginCallback = function () {
            };
            this.cbProcess_CallbackComplete = function () {
            };
        });
        // ]]>
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
</asp:Content>

<%-- 6.컨텐트 Form 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <eni:eniButton ID="btn" ClientInstanceName="btn" runat="server">
        <ClientSideEvents Click="eni.LocalPage.btn" />
    </eni:eniButton>
    <%-- 콜백데이터 컨트롤 --%>
    <eni:eniCallback ID="cbProcess" ClientInstanceName="cbProcess" CreateMode="DefaultMode" runat="server"
        OnCallback="cbProcess_Callback">
        <ClientSideEvents BeginCallback="eni.LocalPage.cbProcess_BeginCallback"
                            CallbackComplete="eni.LocalPage.cbProcess_CallbackComplete"/>
    </eni:eniCallback>
</asp:Content>

