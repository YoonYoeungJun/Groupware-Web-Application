﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="DashBoard.aspx.cs" Inherits="eniFramework.WebApp.Modules.DashBoard" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : DashBoard
    *  2. Function Name        :
    *  3. Program ID           : DashBoard.aspx
    *  4. Program Name         : 데쉬보드 페이지
    *  5. Program Desc         : 데쉬보드 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2017-07-04
    *  8. Modified date(Last)  : 2017-07-04
    *  9. Modifier (First)     : Yoon YoungJun
    *  9. Modifier (First)     : Yoon YoungJun
    * 11. Comment              :
    **************************************************************************************************************
    --%>
</asp:Content>

<%-- 2.해당 페이지 추가 Meta 코드 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Meta_Holder" runat="server">
    
</asp:Content>

<%-- 3.해당 페이지의 컨트롤 ScriptIntellisense 기능 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_ScriptIntelliSense_Holder" runat="server">
    <script type="text/javascript">
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
    </style>

    <script type="text/javascript">
        // <![CDATA[
        try {
            var board_list = eni.Initialize(new function () {
                var $area_content = null;

                this.Title = eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>";
                this.iFrameName = "_blank";
                this.ViewType = ViewType.ModuleView;
                this.Form_Load = function () {
                    $area_content = $("#area_content");
                };

                this.Form_Load_Complate = function () {

                };

                this.Form_UnLoad = function () {
                };

                this.ExecuteSubPageCommand = function (pCmd) {
                    try {
                        switch (pCmd) {
                            case "PageIndex":
                                return trlBoardList.GetPageIndex();
                                break;
                            default:
                                break;
                        }
                    } catch (ex) {
                        alert(ex.message);
                    }
                };

                this.PageResize = function (e) {
                    try {
                        switch (eni.UserAgent.Browser.Type) {
                            case "IE":
                                if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                                    //trlBoardList.SetHeight($area_content.height() + 3);
                                } else {//IE 10 미만
                                    //trlBoardList.SetHeight($area_content.height() + 3);
                                }
                                break;
                            case "OPERA":
                                trlBoardList.SetHeight($area_content.height() + 3);
                                break;
                            case "FIREFOX":
                                trlBoardList.SetHeight($area_content.height() + 3);
                                break;
                            case "CHROME":
                                trlBoardList.SetHeight($area_content.height() + 3);
                                break;
                            case "SAFARI":
                                trlBoardList.SetHeight($area_content.height() + 3);
                                break;
                            default:
                                trlBoardList.SetHeight($area_content.height() + 3);
                                break;
                        }
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };
            });

       
        } catch (ex) {
            alert(ex.message);
        }

        // ]]>
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    대시보드
    <eni:eniButton ID="btnQuery" ClientInstanceName="btnQuery" runat="server" SkinID="Advanced-M-01"
        Text='<%# GetGlobalResource("GCSTRESX00003") %>'>
        <Image IconID="find_find_16x16"></Image>
    </eni:eniButton>
</asp:Content>