<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="MailView.aspx.cs" Inherits="eniFramework.WebApp.Modules.MailView" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%@ Import Namespace="eniFramework" %>
<%@ Import Namespace="hMailServerService" %>
<%@ Import Namespace="hMailServerService.SocketLayer" %>

<%@ Register Src="~/WebContent/Common/Popup/UploadStatusBox.ascx" TagPrefix="eni" TagName="UploadStatusBox" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : MailView.aspx
    *  4. Program Name         : 메일 모듈
    *  5. Program Desc         : 메일 모듈
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2017-07-17
    *  8. Modified date(Last)  : 2017-09-26
    *  9. Modifier (First)     : Yoon YoungJun
    * 10. Modifier (Last)      : Yoon YoungJun
    * 11. Comment              :
    **************************************************************************************************************
    --%>
</asp:Content>

<%-- 2.해당 페이지 추가 Meta 코드 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Meta_Holder" runat="server">
    <link rel="stylesheet" type="text/css" href="../../../Scripts/jQuery/css/jQuery-UI-1.12.1.css"/>
    <link rel="stylesheet" type="text/css" href="../../../Scripts/Token/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../Scripts/Token/css/bootstrap-tokenfield.css"/>
    <link rel="stylesheet" type="text/css" href="../../../Scripts/Se2/css/<%= GetSe2LangPath() %>/smart_editor2.css"/>
    <script type="text/javascript" src="../../../Scripts/jQuery/jQuery-UI.1.12.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../Scripts/Token/bootstrap-tokenfield.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../Scripts/Se2/js/lib/jindo2.all.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../Scripts/Se2/js/lib/jindo_component.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../Scripts/Se2/js/service/husky_SE2B_Lang_<%= GetSe2LangPath() %>.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        window.nhn = window.nhn || {};
        nhn.husky = nhn.husky || {};
        nhn.husky.SE2M_Configuration = nhn.husky.SE2M_Configuration || {};
        nhn.husky.SE2M_Configuration.SE2B_CSSLoader = {
            sCSSBaseURI: "../../Scripts/Se2/css"
        };
        nhn.husky.SE2M_Configuration.SE_EditingAreaManager = {
            sCSSBaseURI: "../../Scripts/Se2/css",					// smart_editor2_inputarea.html 파일의 상대경로
            sBlankPageURL: "../../Scripts/Se2/smart_editor2_inputarea.html",
            sBlankPageURL_EmulateIE7: "../../Scripts/Se2/smart_editor2_inputarea_ie8.html",
            aAddtionalEmulateIE7: [] // IE8 default 사용, IE9 ~ 선택적 사용
        };
        nhn.husky.SE2M_Configuration.SE2M_Accessibility = {
            sBeforeElementId: 'cc_addr',
            sNextElementId: 'to_addr',
            sTitleElementId: 'Sub_Content_Form_Holder_popWrite_txtSubject_I'
        };
        nhn.husky.SE2M_Configuration.SE2M_Hyperlink = {
            bAutolink: true	// 자동링크기능 사용여부(기본값:true)
        };
        nhn.husky.SE2M_Configuration.Quote = {
            sImageBaseURL: '../../Scripts/Se2/img'
        };
        nhn.husky.SE2M_Configuration.SE2M_ColorPalette = {
            bUseRecentColor: false
        };
    </script>	
    <!-- 설정 파일 -->
    <script type="text/javascript" src="../../../Scripts/Se2/js/service/SE2BasicCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../Scripts/Se2/js/smarteditor2.min<%= (lgLang == "CN" ? ".zh" : string.Empty) %>.js" charset="utf-8"></script>
</asp:Content>

<%-- 3.해당 페이지의 컨트롤 ScriptIntellisense 기능 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_ScriptIntelliSense_Holder" runat="server">
    <script type="text/javascript">
        popmMoreMenu            = ASPxClientPopupMenu.Cast();
        btnMailWrite            = ASPxClientButton.Cast();
        btnMailWriteMe          = ASPxClientButton.Cast();
        cbpFolders              = ASPxClientCallbackPanel.Cast();
        lblMaxSize              = ASPxClientLabel.Cast();
        prbUsedTotalSize        = ASPxClientProgressBar.Cast();
        txtSearchText           = ASPxClientTextBox.prototype;
        splContant              = ASPxClientSplitter.Cast();
        mnToolbar               = ASPxClientMenu.Cast();
        popmListMenu            = ASPxClientPopupMenu.Cast();
        gdvList                 = ASPxClientGridView.Cast();
        chkAllSelectRow         = ASPxClientCheckBox.Cast();

        cbpRedView              = ASPxClientCallbackPanel.Cast();
        popRead                 = ASPxClientPopupControl.Cast();
        imgFlagged              = ASPxClientImage.Cast();
        lblSubject              = ASPxClientLabel.Cast();
        lblDate                 = ASPxClientLabel.Cast();
        imgExpand               = ASPxClientImage.Cast();
        lblFromAddrText         = ASPxClientLabel.Cast();
        lblFromAddr             = ASPxClientLabel.Cast();
        lblToAddrs              = ASPxClientLabel.Cast();
        lblToAddr               = ASPxClientLabel.Cast();
        lblCcAddrText           = ASPxClientLabel.Cast();
        lblCcAddr               = ASPxClientLabel.Cast();
        lblBccAddrText          = ASPxClientLabel.Cast();
        lblBccAddr              = ASPxClientLabel.Cast();
        
        ldpWriteLoader          = ASPxClientLoadingPanel.Cast();
        popWrite                = ASPxClientPopupControl.Cast();
        tkbToAddr               = ASPxClientTokenBox.prototype;
        btnContactTo            = ASPxClientButton.prototype;
        btnContactToClear       = ASPxClientButton.prototype;
        chkIndividul            = ASPxClientCheckBox.prototype;
        tkbCcAddr               = ASPxClientTokenBox.prototype;
        btnContactCc            = ASPxClientButton.prototype;
        btnContactCcClear       = ASPxClientButton.prototype;
        btnCcExpand             = ASPxClientImage.prototype;
        tkbBccAddr              = ASPxClientTokenBox.prototype;
        btnContactBcc           = ASPxClientButton.prototype;
        btnContactBccClear      = ASPxClientButton.prototype;
        txtSubject              = ASPxClientTextBox.prototype;
        cboLang                 = ASPxClientComboBox.prototype;
        chkImportant            = ASPxClientCheckBox.prototype;
        upcAttachment           = ASPxClientUploadControl.prototype;
        btnAttachExpand         = ASPxClientButton.prototype;
        btnAttachFileDel        = ASPxClientButton.prototype;
        prbTotFileSize          = ASPxClientProgressBar.prototype;
        gdvAttachList           = ASPxClientGridView.prototype;
        //자동저장 타이머
        tmAutoSave = ASPxClientTimer.Cast();
        //파일 업로드 관련 컨트롤
        popUpload               = ASPxClientPopupControl.prototype;
        lblFileName             = ASPxClientLabel.prototype;
        lblCurrentFileLength    = ASPxClientLabel.prototype;
        prbFilesCnt             = ASPxClientProgressBar.prototype;
        prbFilesLength          = ASPxClientProgressBar.prototype;
        lblUploadedFiles        = ASPxClientLabel.prototype;
        lblUploadedFileLength   = ASPxClientLabel.prototype;
        lblProgressTime         = ASPxClientLabel.prototype;
        lblProgressSpeed        = ASPxClientLabel.prototype;
        btnFileUploadCancel     = ASPxClientButton.prototype;
        cbWriteProcess          = ASPxClientCallback.Cast();
        cbProcess               = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        /* 메일 모듈 전체 레이아웃 */
        .MailView {
        }
        .MailView a:focus,
        .MailView .btn:focus {
            outline:none;
            outline-offset:0;
        }
        .MailView .wrap_left {
            width:230px; 
            max-width:230px; 
            height:100%;
            border-right:1px solid #b5b5b5;
            background-color:white;
        }
        .MailView .wrap_left .used_info {
            width: 229px; 
            height: 50px; 
            bottom: 0px; 
            border-top: 1px solid #E6E6E6; 
            display: inline-block; 
            position: absolute;
        }
        .MailView .wrap_right {
            width:auto; 
            height:100%; 
            position:absolute; 
            left:231px; 
            right:0; 
            bottom:0;
        }
        
        .MailView .wrap_left *,
        .MailView .wrap_left *::after,
        .MailView .wrap_left *::before,
        .MailView .wrap_right .dxm-popup *,
        .MailView .wrap_right .dxm-popup *::after,
        .MailView .wrap_right .dxm-popup *::before,
        .MailView #Sub_Content_Body_Holder_popmMoreMenu *,
        .MailView #Sub_Content_Body_Holder_popmMoreMenu *::after,
        .MailView #Sub_Content_Body_Holder_popmMoreMenu *::before {
            -webkit-box-sizing:content-box;
            -moz-box-sizing:content-box;
            box-sizing:content-box;
        }
        .MailView .area_header .dxsplLCC {
            border-bottom:1px solid #b5b5b5;
        }
        /*.MailView .area_content {
            top: 80px; bottom: 0px; display: inline-block; position: absolute;
        }*/
        /* 퀵 버튼 배경 */
        .MailView .btnMailWrite > div {
            line-height:27px;
            line-height:35px \0/IE8+9;
            width:80px;
        }
        .MailView .btnMailWriteMe > div {
            line-height:27px;
            line-height:35px \0/IE8+9;
            width:80px;
        }

        /* 왼쪽 메일 함 디자인 */
        .MailView .bar {
            margin:7px 4px 0 4px;
            background-color:#e0e0e0;
            opacity:1;
            height:11px;
            float:left;
            width:1px;
        }
        .MailView .mailbox:first-child .menu_group {
            padding-top:21px;
            border-top: 1px solid #E6E6E6;
        }
        .MailView .mailbox:first-child .menu_group .list_menu li:first-child {
            padding:0 15px 0 15px;
        }

        .MailView .mailbox .menu_group {
            padding:6px 0 7px;
        }
        .MailView .mailbox .emph_color {
            color:#0294e8 !important;
        }
        .MailView .mailbox .menu_group .list_menu .link_mail {
            overflow:hidden;
            float:left;
            height:25px;
            max-width:125px;
            text-overflow:ellipsis;
            white-space:nowrap;
            text-decoration:none;
            color:#111;
        }
        .MailView .mailbox .menu_group .list_menu .txt_count {
            margin-left:6px;
            font-size:12px;
            font-family:tahoma,sans-sarif;
        }
        .MailView .mailbox .menu_group .list_menu .link_more {
            position:absolute;
            top:4px;
            right:15px;
            width:17px;
            height:17px;
        }
        .MailView .mailbox .menu_group .list_menu .link_empty {
            position:absolute;
            top:5px;
            right:15px;
            width:14px;
            height:16px;
        }
        .MailView .mailbox .menu_group .list_menu .link_check {
            position:absolute;
            top:1px;
            right:15px;
            width:57px;
            height:24px;
            color:#444;
            letter-spacing:-1px;
            text-align:center;
            text-decoration:none;
            text-indent:0px;
            cursor:pointer;
        }
        .MailView .mailbox .menu_group .list_menu li {
            height:25px;
            line-height:27px;
            overflow:hidden;
            position:relative;
            padding: 0 15px 0 15px;
            margin:0px;
        }
        .MailView .mailbox .menu_group .list_menu li .link_mail {
            -webkit-transform-origin:50% 50%;
            transform-origin:50% 50%;
        }
        .MailView .mailbox .menu_group .list_menu .on.link_mail {
            color:#0294e8;
            font-weight:bold;
        }
        .MailView .mailbox .menu_group .list_menu li .link_mail:hover {
            color:#0294e8;
        }
        .MailView .mailbox .menu_group .list_menu li .link_mail.fst {
            color:#6d7a87;
            padding:0 4px;
            font-weight:normal;
        }
        .MailView .mailbox .menu_group .list_menu li .on.link_mail.fst {
            color:#0294e8;
            font-weight:bold;
        }
        
        .MailView .mailbox .menu_group .list_menu li .link_mail.fst:hover {
            color:#0294e8;
        }

        .MailView .mailbox .menu_group .list_menu .link_receivenum {
            display:inline-block;
            height:25px;
            margin:1px 0 0 5px;
            text-decoration:none;
            /*vertical-align:middle;*/
        }
        .MailView .mailbox .menu_group .accordion_group {
            
        }
        .MailView .mailbox .menu_group .accordion_group .box_menu {
            padding: 0px 15px 0px 16px; 
            height: 25px; 
            line-height: 25px;
        }
        .MailView .mailbox .menu_group .accordion_group .box_menu .link_action {
            width:18px;
            height:18px;
            margin-top:4px;
            vertical-align:middle;
            float:right;
        }
        .MailView .mailbox .menu_group .accordion_group .my_folder .input-sm {
            width:140px;
            height:23px;
            padding:0px 4px;
        }
        .MailView .mailbox .menu_group .accordion_group .link_menu {
            white-space:nowrap;
            text-decoration:none;
            color:#111
        }
        .MailView .mailbox .menu_group .accordion_group .link_menu:hover {
            color:#0294e8;
        }
        .MailView .mailbox .menu_group .accordion_group .link_menu.on {
            font-weight:bold;
        }
        .MailView .mailbox .menu_group .accordion_group .list_menu {
            margin-left:16px;
        }
        
        .MailView .mailbox .menu_group .accordion_group .ico_arrow {
            margin:7px 6px 0 0; 
            display:block; 
            float:left;
        }

        /* 리스트 옵션 */
        .MailView .wrap_right .search {
            height:32px;
            position:relative;
            white-space:nowrap;
            overflow:hidden;
            padding-right:20px;
        }
        .MailView .wrap_right .search span.dx-vam, 
        .MailView .wrap_right .search span.dx-vat, 
        .MailView .wrap_right .search span.dx-vab, 
        .MailView .wrap_right .search a.dx-vam, 
        .MailView .wrap_right .search a.dx-vat, 
        .MailView .wrap_right .search a.dx-vab {
            padding:0px;
        }
        .MailView .wrap_right .search .search_option {
            padding:7px 10px 0 10px;
            float:left;
            white-space:nowrap;
            position:relative;
        }
        .MailView .wrap_right .search .list_head {
            padding-top:16px;
            position:relative;
            overflow:hidden;
            max-width:100%;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        /* 메뉴 디자인 */
        .MailView .wrap_right .dxmLite_eniThm .dx.dxm-image-l {
            width:100%;
        }
        .MailView .wrap_right .dxmLite_eniThm .dxm-horizontal.dxmtb .dxm-item,
        .MailView .wrap_right .dxmLite_eniThm .dxm-horizontal.dxmtb .dxm-hovered.dxm-item,
        .MailView .wrap_right .dxmLite_eniThm .dxm-horizontal.dxmtb .dxm-selected.dxm-item,
        .MailView .wrap_right .dxmLite_eniThm .dxm-horizontal.dxmtb .dxm-checked.dxm-item {
            padding:0px;
        }
        .MailView .wrap_right .dxmLite_eniThm .dxm-popup .dxm-hovered,
        .MailView .wrap_right .dxmLite_eniThm .dxm-main .dxm-hovered.dxm-dropDownMode .dxm-popOut,
        .MailView .wrap_right .dxmLite_eniThm .dxm-popup .dxm-hovered.dxm-dropDownMode .dxm-popOut {
            border-color:transparent;
        }
        .MailView .wrap_right .mnit_options {
            width:30px;
            min-width:30px !important;
        }
        .MailView .wrap_right .mnit_options .dxm-content{
            display:none !important;
        }
        .MailView .wrap_right .mnit_options .dxm-popOut,
        .MailView .wrap_right .mnit_options .dxm-disabled {
            width:22px;
            height:6px;
            background: url("../../contents/images/ico-set19.png") no-repeat;
        }
        .MailView .wrap_right .mnit_options .dxm-popOut {
            background-position:-476px -230px;
        }
        .MailView .wrap_right .mnit_options .dxm-disabled {
            background-position:-476px -212px;
        }
        .MailView .wrap_right .mnit_options .dxm-popOut img {
            display:none;
        }

        /* 그리드 디자인(default) */
        .MailView .wrap_right {
            -webkit-user-select: auto;
            -khtml-user-select: auto;
            -moz-user-select: text;
            -ms-user-select: text;
            user-select: text;
            cursor:auto;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 {
            background-color:white;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_hRow {
            height: 22px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_hRow.dxgvHeader_eniThm {
            padding: 0px 0px 0px 8px;
            border:1px solid #C0C0C0;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_hRow.dxgvHeader_eniThm td {
            vertical-align:bottom;
            line-height:13px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_gRow {
            height: 22px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_gRow td.dxgv {
            padding: 3px 0px 1px 8px;
            position:static !important;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_dRow {
            height: 22px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_dRow:hover {
            background-color:#DAF2FF;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_dRow td.dxgv {
            padding: 3px 0px 1px 0px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_sdRow,
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_fdRow {
            background-color: #BFE7FF;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .Advanced-01_edRow {
            border-bottom:0px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .dxgvFSDC {
            border-top:1px solid #C0C0C0;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .dxpLite_eniThm {
            margin-left: auto;
            margin-right: auto;
            float:none;
            width:10% !important;
            height:33px;
            overflow:hidden;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .dxpLite_eniThm .dxp-pageSizeItem.dxp-right {
            position:absolute;
            right:0px;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 .dxgvPagerTopPanel_eniThm,
        .MailView .wrap_right .eniGridView-Advanced-01 .dxgvPagerBottomPanel_eniThm {
            height:30px;
            background:none;
        }

        .MailView .wrap_right .eniGridView-Advanced-01 #hdr_flagged {
            padding:0 0 0 3px;
            padding:0 0 0 3px \0/IE8+9;
        }
        .MailView .wrap_right .eniGridView-Advanced-01 #hdr_attach {
            padding:0 0 0 3px;
            padding:0 0 0 3px \0/IE8+9;
        }
        
        /* 메일 읽기 */
        .MailView .mailread {
            background-color:white;
            overflow:auto !important;
            -webkit-user-select: auto;
            -khtml-user-select: auto;
            -moz-user-select: text;
            -ms-user-select: text;
            user-select: text;
            cursor:auto;
        }
        .MailView .mailread .con_title {
            padding:10px;
            border-bottom:1px solid #C0C0C0;
        }
        .MailView .mailread .con_body {
            padding:10px;
            word-break:break-all;
        }
        .MailView .mailread .con_body,
        .MailView .mailread .con_body p,
        .MailView .mailread .con_body li,
        .MailView .mailread .con_body div {
            line-height:1.5;
        }
        .MailView .mailread .con_body img {
            max-width:100%;
        }
        .MailView .mailread .con_body table,
        .MailView .mailread .con_body tr {
            line-height:normal;
            font-size:0px;
        }
        .MailView .mailread .con_body td {
            line-height:1.5;
            font-size:12px;
        }
        .MailView .mailread .con_body blockquote p {
            font-size:12px;
            font-weight:normal;
            line-height:normal;
        }
        .MailView .mailread .con_body .to_top {
            padding:0 33px 5px;
            text-align:right;
        }
        .MailView .mailread .con_body .to_top a {
            padding-right:8px;
            font-size:11px;
            color:#666;
            letter-spacing:-1px;
            text-decoration:none;
            text-align:right;
        }
        .MailView .mailread .con_body .ref_mails {
            padding-left:39px;
            padding-right:33px;
            position:relative;
        }
        .MailView .mailread .con_body .ref_mails .ref_box {
            border:1px solid #ececec;
            position:relative;
            padding-top:11px;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .title {
            padding-left:15px;
            vertical-align:top;
            font-weight:700;
            color:#333;
        }
        .MailView .mailread .con_body .ref_mails .ref_box strong {
            color:blue;
        }
        .MailView .mailread .con_body .ref_mails .ref_box ol,
        .MailView .mailread .con_body .ref_mails .ref_box ul {
            list-style:none;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list {
            border-top:solid 1px #f0f0f0;
            border-bottom:0px;
            padding:0px;
            width:auto;
            position:relative;
            zoom:1;
            overflow:hidden;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row {
            padding:0 113px 7px 10px;
            min-height:21px;
            position:relative;
            line-height:18px;
            vertical-align:top;
            width:auto;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row .flaged {
            width:23px;
            padding-top: 6px;
            padding-bottom:7px;
            float:left;
            height:auto;
            color:#666;
            border:0px;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row .attachment {
            width:23px;
            padding-top: 6px;
            padding-bottom:7px;
            float:left;
            height:auto;
            color:#666;
            border:0px;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row .sender {
            width:30px;
            padding-top: 6px;
            padding-bottom:7px;
            float:left;
            height:auto;
            color:#666;
            border:0px;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row .subject {
            width:auto;
            padding-top: 6px;
            padding-bottom:7px;
            float:left;
            height:auto;
            color:#666;
            border:0px;
        }
        .MailView .mailread .con_body .ref_mails .ref_box .ref_list .ref_row .date {
            width:30px;
            padding-top: 6px;
            padding-bottom:7px;
            float:right;
            height:auto;
            color:#666;
            border:0px;
        }

        /* 메일 쓰기 */
        .MailView .mailwrite .con_header,
        .MailView .mailwrite .con_footer {
            margin-bottom:5px;
        }
        .MailView .mailwrite .con_header .item,
        .MailView .mailwrite .con_footer .item {
            position:relative;
            padding-top: 6px;
        }
        .MailView .mailwrite .con_header .item .title,
        .MailView .mailwrite .con_footer .item .title {
            position:absolute;
            left:0px;
            top: 5px;
            width: 60px;
            color:#444444;
        }
        .MailView .mailwrite .con_header .item .field,
        .MailView .mailwrite .con_footer .item .field {
            padding: 0 0 0 80px;
        }
        .MailView .mailwrite .con_header .item .field .expand_btn,
        .MailView .mailwrite .con_footer .item .field .expand_btn {
            padding: 0px; 
            margin: 7px 0px 0px -20px; 
            display:inline-block; 
            position:absolute;
        }
        .MailView .mailwrite .con_header .item .field .option,
        .MailView .mailwrite .con_footer .item .field .option {
            position:absolute;
            right:0px;
        }
        .MailView .mailwrite .con_to_addr .title,
        .MailView .mailwrite .con_cc_addr .title,
        .MailView .mailwrite .con_bcc_addr .title,
        .MailView .mailwrite .con_attach .title,
        .MailView .mailwrite .con_attach_list .title,
        .MailView .mailwrite .con_subject .title {
            width: 60px;
            min-width: 60px;
            height: 18px;
            text-align: right;
            font-weight: bold;
            padding-top: 8px;
            padding-right: 5px;
            color: #363636;
            cursor: default;
            vertical-align: top;
        }
        .MailView .mailwrite .con_attach_list {
            padding-top:0px;
        }
        .MailView .mailwrite .con_subject .dxeTextBoxSys td.dxic {
            padding:2px 0px 0px 0px;
        }
        .MailView .mailwrite .con_subject .input-sm {
            height:25px;
        }
        .MailView .mailwrite .con_subject .input-sm.focus {
            border-color:#66afe9;
            outline:0;
            -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
            box-shadow:inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(102,175,233,0.6);
        }
        .MailView .mailwrite .con_content *,
        .MailView .mailwrite .con_content *::after,
        .MailView .mailwrite .con_content *::before  {
            -webkit-box-sizing:content-box;
            -moz-box-sizing:content-box;
            box-sizing:content-box;
        }
        .MailView .mailwrite .con_content .con_auto_save_msg {
            text-align: right;
            color: silver;
        }
        .MailView .mailwrite .input-sm {
            /*height:26px;*/
            padding:3px 3px;
            line-height:1.7;
        }
        .MailView .mailwrite .input-sm.tokenfield,
        .MailView .mailwrite .input-group-sm .tokenfield {
            min-height:25px;
            padding-bottom:0px;
        }
        .MailView .mailwrite .input-group-sm .token,
        .MailView .mailwrite .input-sm.tokenfield .token {
            height:20px;
            margin-bottom:1px;
        }
        .MailView .mailwrite .input-group-sm .token-input,
        .MailView .mailwrite .input-sm.tokenfield .token-input {
            height:20px;
            margin-bottom:1px;
        }
        .MailView .mailwrite .token-label {
            max-width:none;
        }
        .MailView .ui-front {
            z-index:13000;
        }
        
    </style>
    <script type="text/javascript">
        // <![CDATA[
        try {
            var MailMenuCallBackArgs = function () {
                this.Command = CommandType.None;
            };
            // DataType : Enum
            // Desc : 비하인드 코드에 콜백 요청을 보낼때 명시적인 값을 사용하여 요청을 보낸다.
            var CommandType = {
                None: -1, Query: 1, RemoveEmpty: 5
            };

            var mail_view = eni.Initialize(new function () {
                var history_enable = History.enabled;
                var history_set = false;

                var $mail_view = {};                                            <%-- ☞ 뷰 컨테이너--%>
                var $wrap_left = {};                                            <%-- ☞ 왼쪽 메뉴--%>
                var $wrap_right = {};                                            <%-- ☞ 오른쪽 컨테이너--%>
                var $imap_folders = {};
                var $wrap_read = {};

                var cur_folder_id = "";
                var cur_folder_name = "";
                var cur_message_id = 0;

                var $cur_message = {};

                var firstSetSubject = false;
                var se2_html = "";

                <%--this.Title = "<%= selectFolderName %>" + " - " + eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>";--%>
                this.iFrameName = "ModuleView";
                this.ViewType = ViewType.ModuleView,
                this.Form_Load = function () {
                    hidFields.Set("mv", String(eni.GetQueryString("mv")).toLowerCase())

                    $mail_view = jQuery("#body");
                    $wrap_right = $mail_view.find("#wrap_right");
               
                    //히스토리 지원 브라우저 일경우
                    if (history_enable) {
                        //히스토리 아답터 이벤트 바인딩
                        History.Adapter.bind(window, "statechange", function () {
                            var state = History.getState();
                            if (!history_set) {
                                var org_str_mv = hidFields.Get("mv");
                                var str_mv = String(eni.GetQueryString("mv")).toLowerCase();
                                switch (str_mv) {
                                    case "list":
                                        var cur_folder = $imap_folders.GetCurrentFolder();
                                        if (org_str_mv != "read" && ((org_str_mv != str_mv || cur_folder.folder_id != eni.GetQueryString("sfid")) ||
                                                                    (cur_folder.folder_id == 0 && cur_folder.folder_option != eni.GetQueryString("sfop")))) {
                                            var sfid = eni.GetQueryString("sfid");
                                            if (sfid == 0) {
                                                var sfop = eni.GetQueryString("sfop");
                                                cur_folder = $imap_folders.SelectFolderById(sfid, sfop);
                                            } else {
                                                cur_folder = $imap_folders.SelectFolderById(sfid);
                                            }

                                            var move_folders = mnToolbar.GetItemByName("btnMove");
                                            var move_folders_cnt = move_folders.GetItemCount();
                                            for (var i = 0; i < move_folders_cnt; i++) {
                                                if (move_folders.GetItem(i).GetText() == cur_folder.folder_name) {
                                                    move_folders.GetItem(i).SetVisible(false);
                                                } else {
                                                    move_folders.GetItem(i).SetVisible(true);
                                                }
                                            }

                                            hidFields.Set("sfid", cur_folder.folder_id);
                                            hidFields.Set("sfnm", cur_folder.folder_name);
                                            if (cur_folder.folder_id == 0) {
                                                hidFields.Set("sfop", cur_folder.folder_option);
                                                hidFields.Set("sfopnm", cur_folder.folder_option_name);
                                            }
                                            hidFields.Set("prov_mv", state.data.prov_mv);
                                            hidFields.Set("mv", "list");
                                            gdvList.Refresh();
                                        } else {
                                            eni.LocalPage.ChangeMVMode("list");
                                        }
                                        break;
                                    case "receive_check":
                                        if (org_str_mv != eni.GetQueryString("mv")) {
                                            hidFields.Set("prov_mv", state.data.prov_mv);
                                            hidFields.Set("mv", eni.GetQueryString("mv"));
                                            $imap_folders.ClearSelect();
                                            gdvList.Refresh();
                                        }
                                        break;
                                    case "read":
                                        if (cur_message_id != eni.GetQueryString("mid")) {
                                            eni.Loading.DisplayStatusLoading(true);

                                            cur_folder_id = eni.GetQueryString("mfid");
                                            cur_folder_name = state.data.folder_name;

                                            var cbArgs = new BaseCallbackArgsClass();
                                            cbArgs.mfid = cur_folder_id;
                                            cbArgs.mid = cur_message_id = eni.GetQueryString("mid");

                                            hidFields.Set("mfid", eni.GetQueryString("mfid"));
                                            hidFields.Set("mfnm", state.data.folder_name);
                                            hidFields.Set("mid", cur_message_id);
                                            hidFields.Set("prov_mv", state.data.prov_mv);
                                            hidFields.Set("mv", "read");

                                            popRead.PerformCallback(cbArgs.Serialize());
                                        } else {
                                            eni.LocalPage.ChangeMVMode("read");
                                        }
                                        break;
                                    case "new":
                                    case "newme":
                                        hidFields.Set("prov_mv", state.data.prov_mv);
                                        popWrite.Clear();
                                        eni.LocalPage.ChangeMVMode(str_mv);
                                        break;
                                    case "re":
                                    case "reall":
                                    case "fwd":
                                    case "tmp":
                                        ldpWriteLoader.Show();

                                        cur_folder_id = eni.GetQueryString("mfid");
                                        cur_folder_name = state.data.folder_name;

                                        var cbArgs = new BaseCallbackArgsClass();
                                        cbArgs.mfid = cur_folder_id;
                                        cbArgs.mid = cur_message_id = eni.GetQueryString("mid");

                                        hidFields.Set("mfid", cur_folder_id);
                                        hidFields.Set("mfnm", cur_folder_name);
                                        hidFields.Set("mid", cur_message_id);
                                        if (str_mv != "tmp") {
                                            hidFields.Set("parent_mid", cur_message_id);
                                        } else {
                                            hidFields.Set("tmp_mid", cur_message_id);
                                        }
                                        hidFields.Set("prov_mv", state.data.prov_mv);
                                        hidFields.Set("mv", str_mv);

                                        popWrite.Clear();

                                        cbArgs = new BaseCallbackArgsClass();
                                        cbArgs.cmd = str_mv;
                                        cbArgs.mfid = cur_folder_id;
                                        cbArgs.mid = cur_message_id;
                                        cbWriteProcess.PerformCallback(cbArgs.Serialize());
                                        break;
                                }
                            } else {
                                history_set = false;
                            }
                        });
                        switch (hidFields.Get("mv")) {
                            case "list":
                                history_set = true;
                                History.pushState({ folder_name: hidFields.Get("sfnm") }, document.title, "?mv=list&sfid=" + hidFields.Get("sfid"));
                                break;
                        }
                    } else {
                        $wrap_right.html("<iframe id='" + this.iFrameName + "' name='" + this.iFrameName + "' class='eni_Frame' marginwidth='0' marginheight='0' frameborder='0' framespacing='0' scrolling='no' src='" + eni.GetQueryString("mv") + "'></iframe>");
                    }
                };
                this.Form_Load_Complate = function () {
                    splContant.SetVisible(true);
                };
                this.PageResize = function (e) {
                    try {
                        var arr_resize_control = [];
                        var str_mv = hidFields.Get("mv");
                        var add_height_size = splContant.GetPaneByName("ToolbarPane").GetSize().replaceAll("px", "") * -1;
                        switch (str_mv) {
                            default:
                            case "list":
                                arr_resize_control.insert(arr_resize_control.length, { control: gdvList, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: popRead, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: popWrite, add_height: add_height_size });
                                break;
                            case "read":
                                arr_resize_control.insert(arr_resize_control.length, { control: popRead, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: gdvList, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: popWrite, add_height: add_height_size });
                                break;
                            case "new":
                            case "newme":
                            case "re":
                            case "reall":
                            case "fwd":
                                arr_resize_control.insert(arr_resize_control.length, { control: popWrite, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: gdvList, add_height: add_height_size });
                                arr_resize_control.insert(arr_resize_control.length, { control: popRead, add_height: add_height_size });
                                break;
                        }
                        var ctl_SetSize = function (ctl, iWidth, iHeight) {
                            if (ctl.control != gdvList) {
                                ctl.control.SetWidth($wrap_right.width() + (ctl.add_width || 0) - (iWidth || 0));
                            }
                            ctl.control.SetHeight($wrap_right.height() + (ctl.add_height || 0) - (iHeight || 0));
                        };
                        switch (eni.UserAgent.Browser.Type) {
                            case "IE":
                                if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                                    $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                    ctl_SetSize(arr_resize_control[0], 0, 0);
                                    ctl_SetSize(arr_resize_control[1], 0, 0);
                                    ctl_SetSize(arr_resize_control[2], 0, 0);
                                } else {//IE 10 미만
                                    $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                    ctl_SetSize(arr_resize_control[0], 0, 0);
                                    ctl_SetSize(arr_resize_control[1], 0, 0);
                                    ctl_SetSize(arr_resize_control[2], 0, 0);
                                }
                                break;
                            case "OPERA":
                                $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                ctl_SetSize(arr_resize_control[0], 0, 0);
                                ctl_SetSize(arr_resize_control[1], 0, 0);
                                ctl_SetSize(arr_resize_control[2], 0, 0);
                                break;
                            case "FIREFOX":
                                $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                ctl_SetSize(arr_resize_control[0], 0, 0);
                                ctl_SetSize(arr_resize_control[1], 0, 0);
                                ctl_SetSize(arr_resize_control[2], 0, 0);
                                break;
                            case "CHROME":
                                $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                ctl_SetSize(arr_resize_control[0], 0, 0);
                                ctl_SetSize(arr_resize_control[1], 0, 0);
                                ctl_SetSize(arr_resize_control[2], 0, 0);
                                break;
                            case "SAFARI":
                                $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                ctl_SetSize(arr_resize_control[0], 0, 0);
                                ctl_SetSize(arr_resize_control[1], 0, 0);
                                ctl_SetSize(arr_resize_control[2], 0, 0);
                                break;
                            default:
                                $wrap_left.find("#rt_folder_container").height(document.documentElement.offsetHeight - 111);
                                ctl_SetSize(arr_resize_control[0], 0, 0);
                                ctl_SetSize(arr_resize_control[1], 0, 0);
                                ctl_SetSize(arr_resize_control[2], 0, 0);
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                    }
                };
                this.btnMailWrite_Click = function (s, e) {
                    eni.LocalPage.DisplayChange("new");
                };
                this.btnMailWriteMe_Click = function (s, e) {
                    eni.LocalPage.DisplayChange("newme");
                };
                this.cbpFolders_BeginCallback = function (s, e) {
                };
                this.cbpFolders_EndCallback = function (s, e) {
                    eni.LocalPage.IMAPFolderEventBind();
                };
                this.IMAPFolderEventBind = function () {
                    (function (imap_folders) {
                        imap_folders.Items = [];
                        imap_folders.ClearSelect = function () {
                            for (var i = 0; i < this.Items.length; i++) {
                                this.Items[i].LoseFocus();
                                this.CurrentFolder = null;
                            }
                        };
                        imap_folders.SelectFolderByItem = function (folder_item) {
                            if (folder_item && folder_item.folder_id) {
                                return this.SelectFolderById(folder_item.folder_id, folder_item.folder_option);
                            } else {
                                return null;
                            }
                        };
                        imap_folders.SelectFolderById = function (folder, sfop) {
                            for (var i = 0; i < this.Items.length; i++) {
                                if (folder == 0) {
                                    if ((this.Items[i].folder_id == folder || this.Items[i].folder_name == folder) && this.Items[i].folder_option == sfop) {
                                        this.Items[i].SetFocus();
                                        this.CurrentFolder = this.Items[i];
                                    } else {
                                        this.Items[i].LoseFocus();
                                    }
                                } else {
                                    if (this.Items[i].folder_id == folder || this.Items[i].folder_name == folder) {
                                        this.Items[i].SetFocus();
                                        this.CurrentFolder = this.Items[i];
                                    } else {
                                        this.Items[i].LoseFocus();
                                    }
                                }
                            }
                            //전체, 안읽음 옵션 폴더 옵션 설정
                            if (this.CurrentFolder.folder_id != 0 && hidFields.Contains("sfop")) {
                                hidFields.Remove("sfop");
                                hidFields.Remove("sfopnm");
                            }
                            //제목설정
                            if (Number(this.CurrentFolder.unseen_cnt) > 0) {
                                eni.SetTitle(this.CurrentFolder.folder_name + " (" + this.CurrentFolder.unseen_cnt + ")" + " - " + eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>");
                            } else {
                                eni.SetTitle(this.CurrentFolder.folder_name + " - " + eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>");
                            }

                            return this.CurrentFolder;
                        };
                        imap_folders.SelectFolderByName = function (folder_name) {
                            return this.SelectFolderById(folder_name);
                        };
                        imap_folders.RefreshTotalUnSeen = function () {
                            var total_cnt = 0;
                            for (var i = 0; i < this.Items.length; i++) {
                                if (this.Items[i].folder_id != 0) {
                                    total_cnt += Number(this.Items[i].unseen_cnt);
                                }
                            }

                            this.Items[1].SetUnSeenCount(total_cnt);
                        };
                        imap_folders.GetCurrentFolder = function () {
                            return this.CurrentFolder;
                        };
                        imap_folders.GetCurrentFolderId = function () {
                            return this.CurrentFolder ? this.GetCurrentFolder().folder_id : null;
                        };
                        imap_folders.GetCurrentFolderName = function () {
                            return this.CurrentFolder ? this.GetCurrentFolder().folder_name : null;
                        };
                        imap_folders.GetFolder = function (el) {
                            el = jQuery(el.target || el);
                            for (var i = 0; i < this.Items.length; i++) {
                                if (el.parent().attr("folder-id") == 0) {
                                    if (this.Items[i].folder_id == 0 && this.Items[i].folder_option == el.attr("folder-option")) {
                                        return this.Items[i];
                                    }
                                } else {
                                    if (this.Items[i].folder_id == el.parent().attr("folder-id")) {
                                        return this.Items[i];
                                    }
                                }
                            }
                            return null;
                        };
                        imap_folders.GetFolderByIdOrName = function (folder, fop) {
                            for (var i = 0; i < this.Items.length; i++) {
                                if ((this.Items[i].folder_id == folder || this.Items[i].folder_name == folder) && this.Items[i].folder_option == fop) {
                                    return this.Items[i];
                                }
                            }
                            return null;
                        };
                        imap_folders.CreateIMAPFolder = function (el) {
                            this.wrap_left = $wrap_left = jQuery(el);
                            this.wrap_left.find(".link_menu").each(function (i, el) {
                                var $el = jQuery(el);
                                $el.click(function (event) {
                                    eni.LocalPage.EventBubblingStop(event);
                                    var target = jQuery(event.target);
                                    var ico = target.find(".ico_arrow");
                                    if (ico.hasClass("SilverArrowRight")) {
                                        target.addClass("on");
                                        ico.removeClass("SilverArrowRight").addClass("SilverArrowDown");
                                    } else {
                                        target.removeClass("on");
                                        ico.removeClass("SilverArrowDown").addClass("SilverArrowRight");
                                    }
                                    target.parent().parent().find(".list_menu").toggle("fast");
                                    return false;
                                });
                            });
                            this.wrap_left.find(".link_mail").each(function (i, el) {
                                var $el = jQuery(el);
                                $el.click(function (event) {
                                    eni.LocalPage.EventBubblingStop(event);
                                    if (!eni.LocalPage.IsCallbackProcess()) {
                                        var event_folder = imap_folders.GetFolder(event);
                                        if (event_folder) {
                                            if (imap_folders.GetCurrentFolder() != event_folder) {
                                                imap_folders.SelectFolderByItem(event_folder);
                                            }
                                            eni.LocalPage.DisplayChange("list");
                                        }
                                    }
                                    return false;
                                });
                                $el.SetFocus = function(){
                                    this.addClass("on");
                                };
                                $el.LoseFocus = function(){
                                    this.removeClass("on");
                                };
                                $el.SetUnSeenCount = function (cnt) {
                                    this.parent().attr("unseen-cnt", cnt);
                                    this.unseen_cnt = cnt;
                                    if (this.folder_id == 0) {
                                        imap_folders.Items[1].unseen_cnt = cnt;
                                        imap_folders.Items[0].unseen_cnt = cnt;
                                    }
                                    if (Number(cnt) > 99) {
                                        cnt = "99+";
                                    }
                                    if (this.unseen_cnt != 0) {
                                        if (this.folder_id == 0) {
                                            this.parent().find(".mails_unread").text(cnt);
                                        } else {
                                            this.parent().find(".link_receivenum").text(cnt);
                                            imap_folders.RefreshTotalUnSeen();
                                        }
                                    } else {
                                        if (this.folder_id == 0) {
                                            this.parent().find(".mails_unread").text("");
                                        } else {
                                            this.parent().find(".link_receivenum").text("");
                                            imap_folders.RefreshTotalUnSeen();
                                        }
                                    }
                                };
                                $el.AddUnSeenCount = function (cnt) {
                                    var unseen_cnt = Number(this.GetUnSeenCount());
                                    cnt = Number(cnt) + unseen_cnt;
                                    this.SetUnSeenCount(cnt);
                                    return cnt;
                                };
                                $el.GetUnSeenCount = function (cnt) {
                                    return this.parent().attr("unseen-cnt");
                                };
                                $el.folder_id = $el.parent().attr("folder-id");
                                $el.folder_name = $el.parent().attr("folder-name");
                                $el.unseen_cnt = $el.parent().attr("unseen-cnt");
                                if ($el.hasClass("fst")) {
                                    $el.folder_option = $el.attr("folder-option");
                                    $el.folder_option_name = $el.attr("title");
                                }
                                imap_folders.Items.insert(i, $el);
                            });
                            
                            //메일 편지함 마우스 호버 이벤트 바인딩
                            this.wrap_left.find(".link_mail:not(.fst), .link_menu").parent().hover(function () {
                                jQuery(this).find(".link_more, .link_empty, .link_action").show();
                            }, function () {
                                jQuery(this).find(".link_more, .link_empty, .link_action").hide();
                            });
                            //메일 편지함 옵션 버튼 바인딩
                            this.wrap_left.find(".link_more").click(function (event) {
                                eni.LocalPage.EventBubblingStop(event);
                                var more = jQuery(this);
                                var folder_id = more.parent().attr("folder-id");
                                popmMoreMenu.SelectFolder = $imap_folders.GetFolderByIdOrName(folder_id);
                                if (folder_id == 0) {
                                    popmMoreMenu.GetItemByName("btnEmpty").SetVisible(false);
                                    popmMoreMenu.GetItemByName("btnFlagedRead").SetVisible(false);
                                    popmMoreMenu.GetItemByName("btnFlagedReadDelete").SetVisible(false);
                                    popmMoreMenu.GetItemByName("btnFlagedUnReadDelete").SetVisible(false);
                                    popmMoreMenu.GetItemByName("btnMyFolderReName").SetVisible(false);
                                    popmMoreMenu.GetItemByName("btnMyFolderDelete").SetVisible(false);
                                } else {
                                    popmMoreMenu.GetItemByName("btnEmpty").SetVisible(true);
                                    popmMoreMenu.GetItemByName("btnFlagedRead").SetVisible(true);
                                    popmMoreMenu.GetItemByName("btnFlagedReadDelete").SetVisible(true);
                                    popmMoreMenu.GetItemByName("btnFlagedUnReadDelete").SetVisible(true);
                                    if (more.parent().parent().hasClass("my_folder")) {
                                        popmMoreMenu.GetItemByName("btnMyFolderReName").SetVisible(true);
                                        popmMoreMenu.GetItemByName("btnMyFolderDelete").SetVisible(true);
                                    } else {
                                        popmMoreMenu.GetItemByName("btnMyFolderReName").SetVisible(false);
                                        popmMoreMenu.GetItemByName("btnMyFolderDelete").SetVisible(false);
                                    }
                                }
                                popmMoreMenu.ShowAtElement(this);
                                return false;
                            }).hover(function () {
                                jQuery(this).removeClass("MoreMenu");
                                jQuery(this).addClass("MoreMenuHover");
                            }, function () {
                                jQuery(this).removeClass("MoreMenuHover");
                                jQuery(this).addClass("MoreMenu");
                            });
                            //메일 편지함 비우기 버튼 바인딩
                            this.wrap_left.find(".link_empty").click(function (event) {
                                eni.LocalPage.EventBubblingStop(event);
                                eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult == DialogResult.Yes) {
                                        var cur_folder = $imap_folders.GetCurrentFolder();
                                        var empty_folder_id = jQuery(event.target).parent().attr("folder-id");
                                        if (cur_folder.folder_id != empty_folder_id) {
                                            var cb_data = new BaseCallbackArgsClass();
                                            cb_data.Cmd = "empty";
                                            cb_data.Data = empty_folder_id;
                                            cbProcess.PerformCallback(cb_data.Serialize());
                                        } else {
                                            hidFields.Set("cmd", "empty");
                                            hidFields.Set("data", JSON.stringify([{ folder_id: empty_folder_id }]));
                                            gdvList.Refresh();
                                        }
                                    }
                                });
                                return false;
                            }).hover(function () {
                                jQuery(this).removeClass("Empty");
                                jQuery(this).addClass("EmptyHover");
                            }, function () {
                                jQuery(this).removeClass("EmptyHover");
                                jQuery(this).addClass("Empty");
                            });
                            //메일 수신확인 버튼 바인딩
                            this.wrap_left.find(".link_check").click(function (event) {
                                eni.LocalPage.EventBubblingStop(event);
                                if (!eni.LocalPage.IsCallbackProcess()) {
                                    eni.SetTitle("<%= GetResource("CSTRESX00009") %> - " + eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>");
                                    eni.LocalPage.DisplayChange("receive_check");
                                    imap_folders.ClearSelect();
                                }
                                return false;
                            }).hover(function () {
                                jQuery(this).removeClass("BgButton");
                                jQuery(this).addClass("BgButtonHover");
                            }, function () {
                                jQuery(this).removeClass("BgButtonHover");
                                jQuery(this).addClass("BgButton");
                            });
                            //내 메일함 편지함 추가
                            imap_folders.MyFolder = this.wrap_left.find(".my_folder");
                            this.wrap_left.find(".link_action").click(function (event) {
                                eni.LocalPage.EventBubblingStop(event);
                                //폴더 추가는 한번에 하나만
                                if (imap_folders.MyFolder.new_folder) {
                                    return false;
                                }

                                imap_folders.MyFolder.new_folder = jQuery("<li id=\"add\"><input type=\"text\" class=\"form-control input-sm\" maxlength=\"15\"></input></li>");
                                imap_folders.MyFolder.new_input = imap_folders.MyFolder.new_folder.find("input");
                                imap_folders.MyFolder.new_input.focusout(function () {
                                    var str_name = imap_folders.MyFolder.new_input.val();
                                    if (str_name == "") {
                                        eni.Utils.Invoke(function () {
                                            imap_folders.MyFolder.new_input.focus();
                                        });
                                    } else {
                                        var cb_data = new BaseCallbackArgsClass();
                                        cb_data.Cmd = "my_folder";
                                        cb_data.DBAccessMode = DBAccessMode.Create;
                                        cb_data.Data = imap_folders.MyFolder.new_input.val();
                                        cbpFolders.PerformCallback(cb_data.Serialize());
                                    }
                                }).keydown(function (e) {
                                    var objEl = (e ? e.srcElement : window.event.srcElement);
                                    var keyCode = (e = e || window.event).keyCode;
                                    
                                    switch (keyCode) {
                                        case 13://endter
                                            var cb_data = new BaseCallbackArgsClass();
                                            cb_data.Cmd = "my_folder";
                                            cb_data.DBAccessMode = DBAccessMode.Create;
                                            cb_data.Data = imap_folders.MyFolder.new_input.val();
                                            cbpFolders.PerformCallback(cb_data.Serialize());
                                            return false;
                                            break;
                                        case 27: //esc
                                            imap_folders.MyFolder.new_folder.detach();
                                            imap_folders.MyFolder.new_folder = null;
                                            imap_folders.MyFolder.new_input = null;
                                            return false;
                                            break;
                                    }
                                }).keyup(function (e) {
                                    var str_name = imap_folders.MyFolder.new_input.val();
                                    if (str_name.length > 15) {
                                        imap_folders.MyFolder.new_input.val(str_name.substring(0, 15));
                                    }
                                });

                                imap_folders.MyFolder.append(imap_folders.MyFolder.new_folder);
                                imap_folders.MyFolder.new_input.focus();
                                return false;
                            });
                            
                            if (hidFields.Contains("sfid")) {
                                imap_folders.SelectFolderById(hidFields.Get("sfid"));
                            } else {
                                imap_folders.SelectFolderByItem(imap_folders.Items[2]);
                            }
                        }

                        return imap_folders;
                    }($imap_folders).CreateIMAPFolder("#wrap_left"));
                };
                this.popmMoreMenu_ItemClick = function (s, e) {
                    switch (e.item.name) {
                        case "btnEmpty":
                            eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                if (pDialogResult == DialogResult.Yes) {
                                    var cur_folder = $imap_folders.GetCurrentFolder();
                                    if (cur_folder.folder_id != s.SelectFolder.folder_id) {
                                        var cb_data = new BaseCallbackArgsClass();
                                        cb_data.Cmd = "empty";
                                        cb_data.Data = s.SelectFolder.folder_id;
                                        cbProcess.PerformCallback(cb_data.Serialize());
                                    } else {
                                        hidFields.Set("cmd", "empty");
                                        hidFields.Set("data", JSON.stringify([{ folder_id: s.SelectFolder.folder_id }]));
                                        gdvList.Refresh();
                                    }
                                }
                            });
                            break;
                        case "btnFlagedRead":
                            var cur_folder = $imap_folders.GetCurrentFolder();
                            if (cur_folder.folder_id != s.SelectFolder.folder_id) {
                                var cb_data = new BaseCallbackArgsClass();
                                cb_data.Cmd = "flaged_read";
                                cb_data.Data = s.SelectFolder.folder_id;
                                cbProcess.PerformCallback(cb_data.Serialize());
                            } else {
                                hidFields.Set("cmd", "flaged_read");
                                hidFields.Set("data", JSON.stringify([{ folder_id: s.SelectFolder.folder_id }]));
                                gdvList.Refresh();
                            }
                            break;
                        case "btnFlagedReadDelete":
                            eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                if (pDialogResult == DialogResult.Yes) {
                                    var cur_folder = $imap_folders.GetCurrentFolder();
                                    if (cur_folder.folder_id != s.SelectFolder.folder_id) {
                                        var cb_data = new BaseCallbackArgsClass();
                                        cb_data.Cmd = "flaged_read_delete";
                                        cb_data.Data = s.SelectFolder.folder_id;
                                        cbProcess.PerformCallback(cb_data.Serialize());
                                    } else {
                                        hidFields.Set("cmd", "flaged_read_delete");
                                        hidFields.Set("data", JSON.stringify([{ folder_id: s.SelectFolder.folder_id }]));
                                        gdvList.Refresh();
                                    }
                                }
                            });
                            break;
                        case "btnFlagedUnReadDelete":
                            eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                if (pDialogResult == DialogResult.Yes) {
                                    var cur_folder = $imap_folders.GetCurrentFolder();
                                    if (cur_folder.folder_id != s.SelectFolder.folder_id) {
                                        var cb_data = new BaseCallbackArgsClass();
                                        cb_data.Cmd = "flaged_unread_delete";
                                        cb_data.Data = s.SelectFolder.folder_id;
                                        cbProcess.PerformCallback(cb_data.Serialize());
                                    } else {
                                        hidFields.Set("cmd", "flaged_unread_delete");
                                        hidFields.Set("data", JSON.stringify([{ folder_id: s.SelectFolder.folder_id }]));
                                        gdvList.Refresh();
                                    }
                                }
                            });
                            break;
                        case "btnMyFolderReName":
                            eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                            break;
                        case "btnMyFolderDelete":
                            eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                            break;
                        default:
                            eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                            break;
                    }
                };
                this.popmListMenu_ItemClick = function (s, e) {
                    switch(e.item.name){
                        case "btnNewMail":
                            popWrite.to_address = s.CurrentAddress;
                            eni.LocalPage.DisplayChange("new");
                            break;
                        default:
                            eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                            break;
                    }
                };
                this.mnToolbar_Click = function (s, e) {
                    var str_mv = hidFields.Get("mv");
                    try {
                        switch (e.item.name) {
                            case "btnAllSelect":
                                chkAllSelectRow.SetChecked(!chkAllSelectRow.GetChecked());
                                gdvList.SelectAllRowsOnPage(chkAllSelectRow.GetChecked());
                                if (chkAllSelectRow.GetChecked()) {
                                    e.item.SetText('<%= GetResource("CSTRESX00146") %>');
                                } else {
                                    e.item.SetText('<%= GetResource("CSTRESX00011") %>');
                                }
                                break;
                            case "btnChangeSeen":
                                var cb_data = new BaseCallbackArgsClass();
                                cb_data.Cmd = str_mv;
                                cb_data.CmdDetail = "read_state";
                                if (str_mv == "list") {
                                    if (gdvList.InCallback()) {
                                        eni.Message.DisplayBundleMsgBox("common.waite", "common.callback.requesting");
                                        return;
                                    }
                                    var select_data = eni.LocalPage.GetSelectRowData();
                                    if (select_data) {
                                        cb_data.Data = (e.item.GetText() == '<%= GetResource("CSTRESX00127") %>' ? 1 : 0);
                                        var update_cnt = select_data.Rows.length;
                                        for (var i = 0; i < select_data.Rows.length; i++) {
                                            if (cb_data.Data == 1) {
                                                if ((Number(select_data.Rows[i].mf) & 1) != 1) {
                                                    select_data.Rows[i].row.SetData(select_data.Rows[i], select_data.Rows[i].mfid, select_data.Rows[i].mid, Number(select_data.Rows[i].mf) + 1)
                                                    gdvList.keys[select_data.Rows[i].row.row_no] = select_data.Rows[i].row.data;
                                                    select_data.Rows[i].row.flag.removeClass("UnSeen").addClass("Seen");
                                                    select_data.Rows[i].row.from_addr.attr("style", String(select_data.Rows[i].row.from_addr.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                                                    select_data.Rows[i].row.subject.attr("style", String(select_data.Rows[i].row.subject.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                                                } else {
                                                    update_cnt -= 1;
                                                }
                                            } else {
                                                if ((Number(select_data.Rows[i].mf) & 1) == 1) {
                                                    select_data.Rows[i].row.SetData(select_data.Rows[i], select_data.Rows[i].mfid, select_data.Rows[i].mid, Number(select_data.Rows[i].mf) - 1)
                                                    gdvList.keys[select_data.Rows[i].row.row_no] = select_data.Rows[i].row.data;
                                                    select_data.Rows[i].row.flag.removeClass("Seen").addClass("UnSeen");
                                                    select_data.Rows[i].row.from_addr.attr("style", String(select_data.Rows[i].row.from_addr.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                                                    select_data.Rows[i].row.subject.attr("style", String(select_data.Rows[i].row.subject.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                                                } else {
                                                    update_cnt -= 1;
                                                }
                                            }
                                        }
                                        var cur_folder = $imap_folders.GetCurrentFolder();
                                        if (cb_data.Data == 1) {
                                            if (cur_folder.sfid != 0) {
                                                cur_folder.AddUnSeenCount(update_cnt * -1);
                                            }
                                        } else {
                                            if (cur_folder.sfid != 0) {
                                                cur_folder.AddUnSeenCount(update_cnt);
                                            }
                                        }
                                        cb_data.MultiData = select_data.ToArray();
                                    } else {
                                        eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.selectmessages");
                                    }
                                } else {
                                    var cur_folder = $imap_folders.GetCurrentFolder();
                                    if (e.item.GetText() == '<%= GetResource("CSTRESX00127") %>') {
                                        if (cur_folder.folder_id != 0) {
                                            cur_folder.AddUnSeenCount(-1);
                                        } else {
                                            cur_folder = $imap_folders.GetFolderByIdOrName($cur_message.mfid);
                                            cur_folder.AddUnSeenCount(-1);
                                        }
                                        e.item.SetText('<%= GetResource("CSTRESX00128") %>');
                                        cb_data.Data = 1;
                                    } else {
                                        if (cur_folder.folder_id != 0) {
                                            cur_folder.AddUnSeenCount(1);
                                        } else {
                                            cur_folder = $imap_folders.GetFolderByIdOrName($cur_message.mfid);
                                            cur_folder.AddUnSeenCount(1);
                                        }
                                        e.item.SetText('<%= GetResource("CSTRESX00127") %>');
                                        cb_data.Data = 0;
                                    }
                                    cb_data.mid = $cur_message.mid;
                                    if (cb_data.Data == 1) {
                                        if (($cur_message.mf & 1) != 1) {
                                            $cur_message.SetData($cur_message.mfid, $cur_message.mid, Number($cur_message.mf) + 1)
                                            gdvList.keys[$cur_message.row_no] = $cur_message.data;
                                            $cur_message.flag.removeClass("UnSeen").addClass("Seen");
                                            $cur_message.from_addr.attr("style", String($cur_message.from_addr.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                                            $cur_message.subject.attr("style", String($cur_message.subject.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                                        }
                                    } else {
                                        if (($cur_message.mf & 1) == 1) {
                                            $cur_message.SetData($cur_message.mfid, $cur_message.mid, Number($cur_message.mf) - 1)
                                            gdvList.keys[$cur_message.row_no] = $cur_message.data;
                                            $cur_message.flag.removeClass("Seen").addClass("UnSeen");
                                            $cur_message.from_addr.attr("style", String($cur_message.from_addr.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                                            $cur_message.subject.attr("style", String($cur_message.subject.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                                        }
                                    }
                                }
                                cbProcess.PerformCallback(cb_data.Serialize());
                                break;
                            case "btnDelete":
                            case "btnDeleteCheck":
                                hidFields.Set("cmd", "delete");
                                if (str_mv == "list" || str_mv == "receive_check") {
                                    var runDeleteMessage = function () {
                                        if (gdvList.InCallback()) {
                                            hidFields.Remove("cmd");
                                            eni.Message.DisplayBundleMsgBox("common.waite", "common.callback.requesting");
                                            return;
                                        }
                                        var select_data = eni.LocalPage.GetSelectRowData();
                                        if (select_data) {
                                            chkAllSelectRow.SetChecked(false);
                                            gdvList.UnselectAllRowsOnPage();
                                            hidFields.Set("data", select_data.ToJson());
                                            gdvList.Refresh();
                                        } else {
                                            hidFields.Remove("cmd");
                                            eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.selectmessages");
                                        }
                                    };
                                    if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                                        eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                            if (pDialogResult === DialogResult.Yes) {
                                                runDeleteMessage();
                                            } else {
                                                hidFields.Remove("cmd");
                                            }
                                        });
                                    } else {
                                        runDeleteMessage();
                                    }
                                } else {
                                    var runDeleteMessage = function () {
                                        if (gdvList.InCallback()) {
                                            hidFields.Remove("cmd");
                                            eni.Message.DisplayBundleMsgBox("common.waite", "common.callback.requesting");
                                            return;
                                        }
                                        chkAllSelectRow.SetChecked(false);
                                        gdvList.UnselectAllRowsOnPage();
                                        hidFields.Set("data", hidFields.Get("mid"));
                                        gdvList.Refresh();
                                    };

                                    if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                                        eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                            if (pDialogResult === DialogResult.Yes) {
                                                runDeleteMessage();
                                            } else {
                                                hidFields.Remove("cmd");
                                            }
                                        });
                                    } else {
                                        runDeleteMessage();
                                    }
                                }
                                break;
                            case "btnDeleteFull":
                                hidFields.Set("cmd", "delete_full");

                                if (str_mv == "list") {
                                    if (gdvList.InCallback()) {
                                        hidFields.Remove("cmd");
                                        eni.Message.DisplayBundleMsgBox("common.waite", "common.callback.requesting");
                                        return;
                                    }
                                    var runDeleteFullMessage = function () {
                                        var select_data = eni.LocalPage.GetSelectRowData();

                                        if (select_data) {
                                            chkAllSelectRow.SetChecked(false);
                                            gdvList.UnselectAllRowsOnPage();

                                            hidFields.Set("data", select_data.ToJson());
                                            gdvList.Refresh();
                                        } else {
                                            hidFields.Remove("cmd");
                                            eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.selectmessages");
                                        }
                                    };
                                    eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                        if (pDialogResult === DialogResult.Yes) {
                                            runDeleteFullMessage();
                                        } else {
                                            hidFields.Remove("cmd");
                                        }
                                    });
                                } else {
                                    eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.confirmdeletemessages", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                        if (pDialogResult === DialogResult.Yes) {
                                            chkAllSelectRow.SetChecked(false);
                                            gdvList.UnselectAllRowsOnPage();

                                            hidFields.Set("data", hidFields.Get("mid"));
                                            gdvList.Refresh();
                                        } else {
                                            hidFields.Remove("cmd");
                                        }
                                    });
                                }
                                break;
                            case "btnAddSpam":
                                eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                                break;
                            case "btnReply":
                            case "btnAllReply":
                            case "btnDelivery":
                                var cmd = "re";
                                switch (e.item.name) {
                                    case "btnReply": cmd = "re"; break;
                                    case "btnAllReply": cmd = "reall"; break;
                                    case "btnDelivery": cmd = "fwd"; break;
                                }

                                if (str_mv == "list") {
                                    var select_data = eni.LocalPage.GetSelectRowData();
                                    if (select_data) {
                                        eni.LocalPage.DisplayChange(cmd, select_data.Rows[0].mfid, select_data.Rows[0].mfnm, select_data.Rows[0].mid);
                                    }
                                } else {
                                    if (hidFields.Contains("mid") && hidFields.Get("mid") != "") {
                                        eni.LocalPage.DisplayChange(cmd, hidFields.Get("mfid"), hidFields.Get("mfnm"), hidFields.Get("mid"));
                                    }
                                }
                                break;
                            case "btnMove":
                                eni.Message.DisplayBundleMsgBox("common.alter", "common.devtime");
                                break;
                            case "btnPrint":
                                if (hidFields.Get("mv") == "read") {
                                    eni.Loading.DisplayLoading(true);
                                    eni.Report.HTMLPrintRun(eni.GetTitle(), popRead.GetContentHTML());
                                    eni.Loading.DisplayLoading(false);
                                }
                                break;
                            case "btnSend":
                                var str_addr = popWrite.to_addr.tokenfield("getTokensList", ",");
                                if (str_mv != "newme") {
                                    if (!str_addr) {
                                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00001"), "<%=GetResource("CSTRESX00183")%>");
                                        return;
                                    }
                                }
                                if (popWrite.Editor.getIR() == "") {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00001"), "<%=GetResource("CSTRESX00184")%>");
                                    return;
                                }
                                
                                var cb_data = new BaseCallbackArgsClass();
                                cb_data.Cmd = "send";
                                cb_data.to_addr = str_addr;
                                cb_data.cc_addr = popWrite.cc_addr.tokenfield("getTokensList", ",");
                                cb_data.bcc_addr = popWrite.bcc_addr.tokenfield("getTokensList", ",");
                                cb_data.attachments = popWrite.Attachments.length > 0 ? popWrite.Attachments : [];
                                cb_data.htmlbody = popWrite.Editor.getIR();
                                cbWriteProcess.PerformCallback(cb_data.Serialize());
                                break;
                            case "btnPreveiw":
                                eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                                break;
                            case "btnSaveTemp":
                                var cb_data = new BaseCallbackArgsClass();
                                cb_data.Cmd = "save_tmp";
                                if (hidFields.Contains("tmp_mid")) {
                                    cb_data.mfid = hidFields.Get("mfid");
                                    cb_data.mid = hidFields.Get("tmp_mid");
                                }
                                cb_data.to_addr = popWrite.to_addr.tokenfield("getTokensList", ",");
                                cb_data.cc_addr = popWrite.cc_addr.tokenfield("getTokensList", ",");
                                cb_data.bcc_addr = popWrite.bcc_addr.tokenfield("getTokensList", ",");
                                cb_data.attachments = popWrite.Attachments.length > 0 ? popWrite.Attachments : [];
                                cb_data.htmlbody = popWrite.Editor.getIR();
                                cbWriteProcess.PerformCallback(cb_data.Serialize());
                                break;
                            case "btnList":
                                eni.LocalPage.DisplayChange("list");
                                break;
                            default:
                                if (e.item.parent) {
                                    switch (e.item.parent.name) {
                                        case "btnMove":
                                            hidFields.Set("cmd", "move");
                                            hidFields.Set("move_mfid", e.item.name);
                                            if (str_mv == "list") {
                                                var select_data = eni.LocalPage.GetSelectRowData();
                                                if (select_data) {
                                                    hidFields.Set("data", select_data.ToJson());
                                                    gdvList.Refresh();
                                                } else {
                                                    hidFields.Remove("cmd");
                                                    hidFields.Remove("move_mfid");
                                                    eni.Message.DisplayBundleMsgBox("common.alert", "mail.maillist.selectmessages");
                                                }
                                            } else {
                                                hidFields.Set("data", hidFields.Get("mid"));
                                                gdvList.Refresh();
                                            }
                                            break;
                                        case "btnOptions":
                                            switch (e.item.name) {
                                                case "btnSavePC":
                                                    var selectedRows = gdvList.GetSelectedKeysOnPage();
                                                    if (selectedRows.length > 0) {
                                                        var sRow = new String(selectedRows).split(",");
                                                        var mids = "";
                                                        for (var i = 0; i < sRow.length; i++) {
                                                            var sCol = sRow[i].split("|")
                                                            if (i === 0) {
                                                                mids += sCol[1];
                                                            } else {
                                                                mids += "|" + sCol[1];
                                                            }
                                                        }
                                                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>webcontent/common/filedown.ashx?cmd=eml&mids=" + mids, "_blank");
                                                        chkAllSelectRow.SetChecked(false);
                                                        gdvList.UnselectAllRowsOnPage();
                                                    }
                                                    break;
                                                case "btnViewOriginal":
                                                    break;
                                            }
                                            break;
                                    }
                                }
                                break;
                        }
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                    }
                };
                this.gdvList_SelectionChanged = function (s, e) {
                    var selectRowCnt = gdvList.GetSelectedRowCount();
                    if (selectRowCnt > 0) {
                        mnToolbar.GetItemByName("btnChangeSeen").SetEnabled(true);
                        if (mnToolbar.GetItemByName("btnDelete")) {
                            mnToolbar.GetItemByName("btnDelete").SetEnabled(true);
                            mnToolbar.GetItemByName("btnDeleteCheck").SetEnabled(true);
                        }
                        mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(true);
                        if (selectRowCnt > 1) {
                            mnToolbar.GetItemByName("btnAddSpam").SetEnabled(false);
                            mnToolbar.GetItemByName("btnReply").SetEnabled(false);
                            mnToolbar.GetItemByName("btnAllReply").SetEnabled(false);
                            mnToolbar.GetItemByName("btnDelivery").SetEnabled(false);
                        } else {
                            mnToolbar.GetItemByName("btnAddSpam").SetEnabled(true);
                            mnToolbar.GetItemByName("btnReply").SetEnabled(true);
                            mnToolbar.GetItemByName("btnAllReply").SetEnabled(true);
                            mnToolbar.GetItemByName("btnDelivery").SetEnabled(true);
                        }
                        if (mnToolbar.GetItemByName("btnMove")) {
                            mnToolbar.GetItemByName("btnMove").SetEnabled(true);
                        }
                        mnToolbar.GetItemByName("btnOptions").SetEnabled(true);

                        var selectRowKey, rowIndex;
                        if (e.visibleIndex == -1) {
                            rowIndex = 1;
                        } else {
                            rowIndex = e.visibleIndex;
                        }
                        selectRowKey = new String(gdvList.GetRowKey(rowIndex)).split("|");
                        if ((selectRowKey[2] & 1) == 1) {
                            mnToolbar.GetItemByName("btnChangeSeen").SetText('<%= GetResource("CSTRESX00128") %>');
                        } else {
                            mnToolbar.GetItemByName("btnChangeSeen").SetText('<%= GetResource("CSTRESX00127") %>');
                        }
                    } else {
                        mnToolbar.GetItemByName("btnChangeSeen").SetEnabled(false);
                        if (mnToolbar.GetItemByName("btnDelete")) {
                            mnToolbar.GetItemByName("btnDelete").SetEnabled(false);
                        }
                        mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(false);
                        mnToolbar.GetItemByName("btnAddSpam").SetEnabled(false);
                        mnToolbar.GetItemByName("btnReply").SetEnabled(false);
                        mnToolbar.GetItemByName("btnAllReply").SetEnabled(false);
                        mnToolbar.GetItemByName("btnDelivery").SetEnabled(false);
                        if (mnToolbar.GetItemByName("btnMove")) {
                            mnToolbar.GetItemByName("btnMove").SetEnabled(false);
                        }
                        mnToolbar.GetItemByName("btnOptions").SetEnabled(false);
                        mnToolbar.GetItemByName("btnAllSelect").SetText('<%= GetResource("CSTRESX00011") %>');
                        mnToolbar.GetItemByName("btnChangeSeen").SetText('<%= GetResource("CSTRESX00013") %>');
                    }
                };
                this.chkAllSelectRow_CheckedChanged = function (s, e) {
                    gdvList.SelectAllRowsOnPage(s.GetChecked());
                    if (s.GetChecked()) {
                        mnToolbar.GetItemByName("btnAllSelect").SetText('<%= GetResource("CSTRESX00146") %>');
                    } else {
                        mnToolbar.GetItemByName("btnAllSelect").SetText('<%= GetResource("CSTRESX00011") %>');
                    }
                };
                this.gdvList_BeginCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(true);
                };
                this.gdvList_EndCallback = function (s, e) {
                    var str_mv = hidFields.Get("mv");
                    if (hidFields.Contains("cmd")) {
                        var str_cmd = hidFields.Get("cmd");
                        if (str_cmd == "delete" || str_cmd == "delete_full" || str_cmd == "move") {
                            if (str_mv != "list" && str_mv != "receive_check") {
                                eni.LocalPage.ChangeMVMode("list");
                            } else {
                                eni.LocalPage.ChangeMVMode(str_mv);
                            }
                        } else {
                            eni.LocalPage.ChangeMVMode(str_mv);
                        }
                        hidFields.Remove("cmd");
                    } else {
                        eni.LocalPage.ChangeMVMode(str_mv);
                    }
                    if (hidFields.Contains("data")) {
                        hidFields.Remove("data");
                    }
                    if (hidFields.Contains("move_mfid")) {
                        hidFields.Remove("move_mfid");
                    }
                    eni.Loading.DisplayStatusLoading(false);
                };
                this.gdvList_Flaged_Click = function (event) {
                    eni.LocalPage.EventBubblingStop(event);
                    var cur_row = eni.LocalPage.CreateCurrentRow(jQuery(event.target).parent().parent());
                    var cb_data = new BaseCallbackArgsClass();
                    cb_data.Cmd = "read";
                    cb_data.CmdDetail = "flagged";
                    cb_data.mid = cur_row.mid;
                    if (cur_row.flaged.hasClass("Flagged")) {
                        cur_row.flaged.removeClass("Flagged").addClass("UnFlagged");
                        cb_data.Data = 0;
                    } else {
                        cur_row.flaged.removeClass("UnFlagged").addClass("Flagged");
                        cb_data.Data = 1;
                    }

                    cbProcess.PerformCallback(cb_data.Serialize());
                };
                this.gdvList_Flag_Click = function (event) {
                    eni.LocalPage.EventBubblingStop(event);
                    var cur_row = eni.LocalPage.CreateCurrentRow(jQuery(event.target).parent().parent());
                    var cur_folder = $imap_folders.GetCurrentFolder();
                    var cb_data = new BaseCallbackArgsClass();
                    cb_data.Cmd = "read";
                    cb_data.CmdDetail = "read_state";
                    cb_data.mid = cur_row.mid;
                    if (cur_row.flag.hasClass("Seen")) {
                        if (cur_folder.mfid != 0) {
                            if (cur_folder.folder_id != 0) {
                                cur_folder.AddUnSeenCount(1);
                            } else {
                                var target_folder = $imap_folders.GetFolderByIdOrName(cur_row.mfid);
                                target_folder.AddUnSeenCount(1);
                            }
                        }
                        cur_row.flag.removeClass("Seen").addClass("UnSeen");
                        cb_data.Data = 0;
                        if ((cur_row.mf & 1) == 1) {
                            cur_row.SetData(cur_row.mfid, cur_row.mid, Number(cur_row.mf) - 1)
                            gdvList.keys[cur_row.row_no] = cur_row.data;
                            cur_row.flag.removeClass("Seen").addClass("UnSeen");
                            cur_row.from_addr.attr("style", String(cur_row.from_addr.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                            cur_row.subject.attr("style", String(cur_row.subject.attr("style")).replace("rgb(0, 0, 0)", "rgb(51, 153, 255)"));
                        }
                    } else {
                        if (cur_folder.folder_id != 0) {
                            cur_folder.AddUnSeenCount(-1);
                        } else {
                            var target_folder = $imap_folders.GetFolderByIdOrName(cur_row.mfid);
                            target_folder.AddUnSeenCount(-1);
                        }
                        cur_row.flag.removeClass("UnSeen").addClass("Seen");
                        cb_data.Data = 1;
                        if ((cur_row.mf & 1) != 1) {
                            cur_row.SetData(cur_row.mfid, cur_row.mid, Number(cur_row.mf) + 1)
                            gdvList.keys[cur_row.row_no] = cur_row.data;
                            cur_row.flag.removeClass("UnSeen").addClass("Seen");
                            cur_row.from_addr.attr("style", String(cur_row.from_addr.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                            cur_row.subject.attr("style", String(cur_row.subject.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                        }
                    }
                    cbProcess.PerformCallback(cb_data.Serialize());
                };
                this.gdvList_Attachment_Click = function (event) {
                    eni.LocalPage.EventBubblingStop(event);
                    var cur_row = eni.LocalPage.CreateCurrentRow(jQuery(event.target).parent().parent());
                };
                
                this.gdvList_Folder_Click = function (event) {
                    eni.LocalPage.EventBubblingStop(event);
                    if (!eni.LocalPage.IsCallbackProcess()) {
                        var cur_row = eni.LocalPage.CreateCurrentRow(jQuery(event.target).parent().parent());
                        var cur_folder = $imap_folders.GetCurrentFolder();
                        if (cur_row.mfid != cur_folder.folder_id) {
                            $imap_folders.SelectFolderById(cur_row.mfid);
                            eni.LocalPage.DisplayChange("list");
                        }
                    }
                    return false;
                };
                this.hiAddress_Click = function (s, e, strAddr) {
                    var cur_folder = $imap_folders.GetCurrentFolder();
                    if (cur_folder.folder_id == 0) {
                        popmListMenu.GetItemByName("btnCurBoxFromSearch").SetVisible(false);
                        popmListMenu.GetItemByName("btnCurBoxToSearch").SetVisible(false);
                        //popmListMenu.GetItemByName("btnAllBoxFromSearch").SetVisible(true);
                        //popmListMenu.GetItemByName("btnAllBoxToSearch").SetVisible(true);
                    } else {
                        popmListMenu.GetItemByName("btnCurBoxFromSearch").SetVisible(true);
                        popmListMenu.GetItemByName("btnCurBoxToSearch").SetVisible(true);
                        //popmListMenu.GetItemByName("btnAllBoxFromSearch").SetVisible(true);
                        //popmListMenu.GetItemByName("btnAllBoxToSearch").SetVisible(true);
                    }
                    popmListMenu.CurrentAddress = strAddr;
                    popmListMenu.ShowAtElement(s.GetMainElement());
                };
                this.hiSubject_Click = function (s, e, iTemp) {
                    var item = mnToolbar.GetItemByName("btnChangeSeen");
                    item.SetText('<%= GetResource("CSTRESX00013") %>');
                    var cur_row = $cur_message = eni.LocalPage.CreateCurrentRow(jQuery(s.GetMainElement()).parent().parent());
                    var target_folder = $imap_folders.GetFolderByIdOrName(cur_row.mfid);
                    if ((cur_row.mf & 1) != 1) {
                        target_folder.AddUnSeenCount(-1);
                        cur_row.SetData(cur_row.mfid, cur_row.mid, Number(cur_row.mf) + 1);
                        gdvList.keys[cur_row.row_no] = cur_row.data;
                        cur_row.flag.removeClass("UnSeen").addClass("Seen");
                        cur_row.from_addr.attr("style", String(cur_row.from_addr.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                        cur_row.subject.attr("style", String(cur_row.subject.attr("style")).replace("rgb(51, 153, 255)", "rgb(0, 0, 0)"));
                    }
                    if (iTemp == 0) {
                        eni.LocalPage.DisplayChange("read", cur_row.mfid, target_folder.folder_name, cur_row.mid);
                    } else {
                        eni.LocalPage.DisplayChange("tmp", cur_row.mfid, target_folder.folder_name, cur_row.mid);
                    }
                };
                this.popRead_BeginCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(true);
                }
                this.popRead_EndCallback = function (s, e) {
                    $wrap_read = jQuery("#" + s.name + "_PW-1");
                    if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.InboxMe, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                        $wrap_read.find(".FromAddress").hide();
                    } else {
                        $wrap_read.find(".FromAddress").show();
                    }
                    eni.LocalPage.ChangeMVMode("read");
                };
                this.imgFlagged_Click = function (s, e) {
                    var cb_data = new BaseCallbackArgsClass();
                    cb_data.Cmd = hidFields.Get("mv");
                    cb_data.CmdDetail = "flagged";
                    cb_data.mid = hidFields.Get("mid");
                    
                    if (s.GetMainElement().className.indexOf("UnFlagged") > 0) {
                        s.GetMainElement().className = "Icon Flagged";
                        s.GetMainElement().setAttribute("title", '<%= GetResource("CSTRESX00125") %>');
                        $cur_message.flaged.removeClass("UnFlagged").addClass("Flagged").attr("title", '<%= GetResource("CSTRESX00125") %>');
                        cb_data.Data = 1;
                    } else {
                        s.GetMainElement().className = "Icon UnFlagged";
                        s.GetMainElement().setAttribute("title", '<%= GetResource("CSTRESX00126") %>');
                        $cur_message.flaged.removeClass("Flagged").addClass("UnFlagged").attr("title", '<%= GetResource("CSTRESX00126") %>');
                        cb_data.Data = 0;
                    }

                    cbProcess.PerformCallback(cb_data.Serialize());
                };
                this.imgExpand_Click = function (s, e) {
                    $wrap_read.find(".ExpandAdress")
                    var expandArea = $wrap_read.find(".ExpandAdress");
                    if (s.GetMainElement().className.indexOf("UnExpand") > 0) {
                        s.GetMainElement().className = "Icon6 Expand";
                        expandArea.each(function (idx, elment) {
                            jQuery(elment).addClass("DisplayNone");
                        });
                    } else {
                        s.GetMainElement().className = "Icon6 UnExpand";
                        expandArea.each(function (idx, elment) {
                            jQuery(elment).removeClass("DisplayNone");
                        });
                    }
                };
                this.popWrite_Init = function (s, e) {
                    s.Attachments = [];
                    s.Items = [];
                    s.GetButton = function (action) {
                        for (var i = 0; i < this.Items.length; i++) {
                            if (this.Items[i].action == action) {
                                return this.Items[i];
                            }
                        }
                        return null;
                    };
                    s.Clear = function () {
                        //if (hidFields.Contains("mfid")) hidFields.Remove("mfid");
                        //if (hidFields.Contains("mfnm")) hidFields.Remove("mfnm");
                        //if (hidFields.Contains("mid")) hidFields.Remove("mid");
                        //if (hidFields.Contains("parent_mid")) hidFields.Remove("parent_mid");

                        popWrite.Attachments = [];
                        if (popWrite.to_address) {
                            popWrite.to_addr.tokenfield("destroy").val(popWrite.to_address);
                            popWrite.to_address = null;
                        } else {
                            popWrite.to_addr.tokenfield("destroy").val("");
                        }
                        popWrite.CreateToken(popWrite.to_addr);
                        popWrite.cc_addr.tokenfield("destroy").val("");
                        popWrite.CreateToken(popWrite.cc_addr);
                        popWrite.bcc_addr.tokenfield("destroy").val("");
                        popWrite.CreateToken(popWrite.bcc_addr);
                        for (var i = 0; i < popWrite.Items.length; i++) {
                            popWrite.Items[i].UnExpand();
                        }
                        chkImportant.SetChecked(false);
                        txtSubject.SetText("");
                        cboLang.SetValue(lgLang);
                        popWrite.Editor.setIR("");
                        //if (hidFields.Get("mv") == "new" || hidFields.Get("mv") == "newme") {
                            gdvAttachList.PerformCallback("");
                        //}
                    };
                    s.Focus = function () {
                        //popWrite.to_addr.$imput.focus();
                    };
                    s.CreateToken = function ($el) {
                        return $el.attr("tabindex", 0)
                        .off("tokenfield:initialize").on("tokenfield:initialize", function (e) {
                            jQuery(e.currentTarget).parent().find(".token-input").on("mousedown", function (s, e) {
                                
                            });
                        })
                        .off("tokenfield:createtoken").on("tokenfield:createtoken", function (e) {
                            if ((e.attrs.value && e.attrs.label) && (e.attrs.value != e.attrs.label)) {
                                e.attrs.value = e.attrs.value;
                                e.attrs.label = e.attrs.label;
                            } else {
                                var data = e.attrs.value.split(" <");
                                if (data && data.length == 1) {
                                    data = e.attrs.value.split("<");
                                }
                                e.attrs.value = (data[1] ? data[0] + " <" + data[1].replaceAll(">", "") + ">" : data[1]) || data[0];
                                e.attrs.label = data[0] ? data[0] : data[1];
                            }
                        })
                        //.on("tokenfield:createdtoken", function (e) {
                        //    // Über-simplistic e-mail validation
                        //    var re = /\S+@\S+\.\S+/;
                        //    var valid = re.test(e.attrs.value);
                        //    if (!valid) {
                        //        jQuery(e.relatedTarget).addClass("invalid");
                        //    }
                        //})
                        .off("tokenfield:edittoken").on("tokenfield:edittoken", function (e) {
                            if (e.attrs.value && e.attrs.label) {
                                e.attrs.value = e.attrs.value;
                            } else {
                                if (e.attrs.label != e.attrs.value) {
                                    var label = e.attrs.label.split(" <");
                                    if (!label) {
                                        e.attrs.label.split("<");
                                    }
                                    e.attrs.value = label[0] + " <" + e.attrs.value + ">";
                                }
                            }
                        })
                        //.on("tokenfield:removedtoken", function (e) {
                        //    //alert('Token removed! Token value was: ' + e.attrs.value);
                        //})
                        .tokenfield({
                            minWidth: 200,
                            showAutocompleteOnFocus: true,
                            createTokensOnBlur: true,
                            delimiter: ",",
                            //autocomplete: {
                            //    source: ['red', 'blue', 'green', 'yellow', 'violet', 'brown', 'purple', 'black', 'white'],
                            //    delay: 100,
                            //    autoFocus: false
                            //},
                            inputType: "email"
                        });
                    };
                    s.BeforShow = function () {
                        eni.Loading.DisplayStatusLoading(true, "<%= GetGlobalResource("GCTRRESX10084")%>");
                        this.Container = jQuery("#<%# popWrite.ClientID %>_PW-1");
                        this.bcc_addr = this.CreateToken(this.Container.find("#bcc_addr"));
                        this.Container.find(".Expand").each(function (i, el) {
                            var $el = jQuery(el);
                            $el.click(function (event) {
                                var btn = popWrite.GetButton(jQuery(event.target).attr("action"))
                                if (btn.hasClass("Expand")) {
                                    btn.removeClass("Expand");
                                    btn.addClass("UnExpand");
                                    if (btn.action == "addr") {
                                        popWrite.Con_Bcc_Addr.show();
                                        popWrite.bcc_addr.tokenfield("update");
                                    } else {
                                        popWrite.Con_Attach_List.show();
                                    }
                                } else {
                                    btn.removeClass("UnExpand");
                                    btn.addClass("Expand");
                                    if (btn.action == "addr") {
                                        popWrite.Con_Bcc_Addr.hide();
                                    } else {
                                        popWrite.Con_Attach_List.hide();
                                    }
                                }
                                return false;
                            });
                            $el.Expand = function () {
                                if (this.hasClass("Expand")) {
                                    this.removeClass("Expand");
                                    this.addClass("UnExpand");
                                    if (this.action == "addr") {
                                        popWrite.Con_Bcc_Addr.show();
                                    } else {
                                        popWrite.Con_Attach_List.show();
                                    }
                                }
                            };
                            $el.UnExpand = function () {
                                if (this.hasClass("UnExpand")) {
                                    this.removeClass("UnExpand");
                                    this.addClass("Expand");
                                    if (this.action == "addr") {
                                        popWrite.Con_Bcc_Addr.hide();
                                    } else {
                                        popWrite.Con_Attach_List.hide();
                                    }
                                }
                            };
                            $el.action = $el.attr("action");
                            popWrite.Items.insert(i, $el);
                        });
                        this.Con_To_Addr = this.Container.find("#con_to_addr");
                        this.Con_Cc_Addr = this.Container.find("#con_cc_addr");
                        if (hidFields.Get("mv") == "newme") {
                            this.Con_To_Addr.hide();
                            this.Con_Cc_Addr.hide();
                        } else {
                            this.Con_To_Addr.show();
                            this.Con_Cc_Addr.show();
                        }
                        this.Con_Bcc_Addr = this.Container.find("#con_bcc_addr").hide();
                        this.Con_Attach_List = this.Container.find("#con_attach_list").hide();
                    };
                    s.CreateWrite = function (el) {
                        cboLang.SetValue(lgLang);
                        if (this.to_address) {
                            this.Container.find("#to_addr").val(this.to_address);
                            this.to_address = null;
                        }
                        this.to_addr = this.CreateToken(this.Container.find("#to_addr"));
                        this.cc_addr = this.CreateToken(this.Container.find("#cc_addr"));
                        this.Content = this.Container.find("#con_content");
                        this.AutoSaveMsg = this.Content.find("#autoSaveMsg");
                        this.EditorTextArea = this.Content.find("#ir1");
                        this.EditorTextArea.height(document.documentElement.offsetHeight - 300);
                        this.Editor = createSEditor2(jindo.$("ir1"), {
                            bUseToolbar: true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                            bUseVerticalResizer: true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                            bUseModeChanger: true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                            //bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
                            //aAdditionalFontList : [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]],	// 추가 글꼴 목록
                            fOnBeforeUnload: function () {
                                //예제 코드
                                //return "내용이 변경되었습니다.";
                            }
                        });
                        this.Editor.run({
                            fnOnAppReady: function () {
                                ldpWriteLoader.Hide();
                                popWrite.Loaded = true;
                                if (popWrite.AfterShownCallback) {
                                    popWrite.AfterShownCallback();
                                }
                                eni.Loading.DisplayStatusLoading(false);
                            }
                        });
                    }
                };
                this.popWrite_BeginCallback = function (s, e) {
                    if (!popWrite.Loaded) {
                        eni.Loading.DisplayStatusLoading(true, "<%=GetGlobalResource("GCTRRESX10085")%>");
                    } else {
                        eni.Loading.DisplayStatusLoading(true);
                    }
                };
                this.popWrite_EndCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(false);
                };
                this.popWrite_Shown = function (s, e) {
                    if (!popWrite.Loaded) {
                        s.CreateWrite();
                    } else {
                        s.to_addr.tokenfield("update");
                        s.cc_addr.tokenfield("update");
                        s.bcc_addr.tokenfield("update");
                        ldpWriteLoader.Hide();
                        s.Focus();
                        if (s.AfterShownCallback) {
                            s.AfterShownCallback();
                        }
                    }
                };
                this.btnContact_Click = function (s, e) {
                    var return_callback = function (oRet) {
                        if (oRet.DialogResult === DialogResult.Ok) {
                            lgBlnFlgChgValue = true;

                            popWrite.to_addr.tokenfield("destroy").val("");
                            popWrite.CreateToken(popWrite.to_addr);
                            popWrite.cc_addr.tokenfield("destroy").val("");
                            popWrite.CreateToken(popWrite.cc_addr);
                            popWrite.bcc_addr.tokenfield("destroy").val("");
                            popWrite.CreateToken(popWrite.bcc_addr);

                            if (oRet.ToList) {
                                for (var i = 0; i < oRet.ToList.length; i++) {
                                    var data = oRet.ToList[i].split(" <");
                                    if (data.length == 1) {
                                        data = oRet.ToList[i].split("<");
                                    }
                                    if (data.length == 1) {
                                        popWrite.to_addr.tokenfield("createToken", { value: data[0], label: data[0] });
                                    } else {
                                        popWrite.to_addr.tokenfield("createToken", { value: data[0] + " <" + data[1].replaceAll(">", "") + ">", label: data[0] });
                                    }
                                }
                            }
                            if (oRet.CcList) {
                                for (var i = 0; i < oRet.CcList.length; i++) {
                                    var data = oRet.CcList[i].split(" <");
                                    if (data.length == 1) {
                                        data = oRet.CcList[i].split("<");
                                    }
                                    if (data.length == 1) {
                                        popWrite.cc_addr.tokenfield("createToken", { value: data[0], label: data[0] });
                                    } else {
                                        popWrite.cc_addr.tokenfield("createToken", { value: data[0] + " <" + data[1].replaceAll(">", "") + ">", label: data[0] });
                                    }
                                }
                            }

                            if (oRet.BccList) {
                                popWrite.GetButton("addr").Expand();
                                for (var i = 0; i < oRet.BccList.length; i++) {
                                    var data = oRet.BccList[i].split(" <");
                                    if (data.length == 1) {
                                        data = oRet.BccList[i].split("<");
                                    }
                                    if (data.length == 1) {
                                        popWrite.bcc_addr.tokenfield("createToken", { value: data[0], label: data[0] });
                                    } else {
                                        popWrite.bcc_addr.tokenfield("createToken", { value: data[0] + " <" + data[1].replaceAll(">", "") + ">", label: data[0] });
                                    }
                                }
                            } else {
                                popWrite.GetButton("addr").UnExpand();
                            }
                        }
                    };
                    var args = {};
                    args.WinSize = new WindowSize(1024, 700);
                    var str_addr = popWrite.to_addr.tokenfield("getTokensList", ",");
                    args.ToList = str_addr ? str_addr.split(",") : null;
                    str_addr = popWrite.cc_addr.tokenfield("getTokensList", ",");
                    args.CcList = str_addr ? str_addr.split(",") : null;
                    str_addr = popWrite.bcc_addr.tokenfield("getTokensList", ",");
                    args.BccList = str_addr ? str_addr.split(",") : null;
                    var ret = eni.Popup.ShowWinModalPopup("/webcontent/popup/contactwinpopup.aspx", args, return_callback);
                    if (ret) {
                        return_callback(ret);
                    }
                };
                this.btnAttachFromWebHard_Click = function (s, e) {
                    eni.Message.DisplayBundleMsgBox("common.devtime", "common.devtime");
                };
                this.upcAttachment_FileUploadStart = function (s, e) {
                    popUploadStatus.ShowUploadStatus();
                };
                this.upcAttachment_FileUploadComplete = function (s, e) {
                    var data = JSON.parse(e.callbackData);
                    var cur_idx = popWrite.Attachments.length;
                    
                    popWrite.Attachments[cur_idx] = data;

                    if (txtSubject.GetText() == "" && firstSetSubject == false && cur_idx == 0) {
                        txtSubject.SetText('<%= GetResource("CSTRESX00145")%> ' + popWrite.Attachments[cur_idx].file_name);
                        firstSetSubject = true;
                    }
                };
                this.upcAttachment_UploadingProgressChanged = function (s, e) {
                    popUploadStatus.SetChangeUploadingStatus(e);
                };
                this.upcAttachment_FilesUploadComplete = function (s, e) {
                    popUploadStatus.CloseUploadStatus();

                    var generalFileCount = 0;
                    var generalFileSize = 0;
                    var periodFileCount = 0;
                    var periodFileSize = 0;
                    var periodDate = new Date();
                    var year = periodDate.getFullYear();
                    var month = (periodDate.getMonth() + 2).toString();
                    month = month.length == 1 ? "0" + month : month;
                    var day = periodDate.getDate().toString();
                    day = day.length == 1 ? "0" + day : day;
                    periodDate = "" + year + "." + month + "." + day;

                    for (var i = 0; i < popWrite.Attachments.length; i++) {
                        if (!popWrite.Attachments[i].upload_type) {
                            if (popWrite.Attachments[i].file_size > 5242880 || (generalFileSize + popWrite.Attachments[i].file_size) > 5242880) {
                                periodFileCount++;
                                periodFileSize += popWrite.Attachments[i].file_size;
                                popWrite.Attachments[i].upload_type = "Period";
                                popWrite.Attachments[i].down_period = "~ " + periodDate + '<%= GetResource("CSTRESX00144") %>';
                            } else {
                                generalFileCount++;
                                generalFileSize += popWrite.Attachments[i].FileSize;
                                popWrite.Attachments[i].upload_type = "General";
                                popWrite.Attachments[i].down_period = '<%= GetResource("CSTRESX00134") %>';
                            }
                        }
                    }
                    gdvAttachList.PerformCallback(JSON.stringify(popWrite.Attachments));
                };
                
                this.btnFileUploadCancel_Click = function (s, e) {
                    //파일 첨부 취소시 파일 삭제 메커니즘 개발
                    //upcAttachment.Cancel();
                    //popUpload.Hide();
                };
                this.btnAttachFileDel_Click = function (s, e) {
                    if (gdvAttachList.GetSelectedRowCount() <= 0) {
                        eni.Message.DisplayMsgBox("", "<%=GetGlobalResource("GCTRRESX10086")%>");
                        return;
                    }

                    var data = String(gdvAttachList.GetSelectedKeysOnPage()).split(",");
                    data.forEach(function (item, idx, array) {
                        popWrite.Attachments.forEach(function (attr, idx2, attr_array) {
                            if (item == attr.temp_file_name) {
                                attr.deleted = "Y";
                            }
                        });
                    });
                    gdvAttachList.PerformCallback(JSON.stringify(popWrite.Attachments));
                };
                this.gdvAttachList_BeginCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(true);
                };
                this.gdvAttachList_EndCallback = function (s, e) {
                    if (popWrite.Attachments) {
                        eni.Loading.DisplayStatusLoading(false);
                        popWrite.Attachments = popWrite.Attachments.filter(function (item, index, array) {
                            return item.deleted == "N";
                        });
                        if (popWrite.Attachments.length > 0) {
                            popWrite.GetButton("attachment").Expand();
                            btnAttachFileDel.SetEnabled(true);
                        } else {
                            popWrite.GetButton("attachment").UnExpand();
                            btnAttachFileDel.SetEnabled(false);
                        }
                    }
                };  
                this.tmAutoSave_Tick = function (s, e) {
                    if (popWrite.Editor.getIR() == se2_html) {
                        return;
                    }
                    se2_html = popWrite.Editor.getIR();

                    if (txtSubject.GetText() === "" && firstSetSubject === false) {
                        var strHtml = new String(se2_html);
                        if (strHtml.indexOf("<br/>", 0) > 0) {
                            var htmlArr = strHtml.split("<br/>");
                            var html = htmlArr[0].replace(/(<([^>]+)>)/ig, "");
                            if (html.length < 100) {
                                if (html.length > 0 && html !== "") {
                                    txtSubject.SetText(html);
                                } else {
                                    txtSubject.SetText("<%=GetGlobalResource("GCTRRESX10087")%>");
                                }
                            }
                            firstSetSubject = true;
                        }
                    }

                    hidFields.Set("heBody", se2_html);

                    var mailWriteBaseObj = new BaseCallbackArgsClass();
                    mailWriteBaseObj.Cmd = "SAVE_TEMP";

                    cbProcess.PerformCallback(JSON.stringify(mailWriteBaseObj));
                };
                this.heBody_HtmlChanged = function (s, e) {
                    if (tmAutoSave.GetEnabled() === false) {
                        tmAutoSave.SetEnabled(true);
                    }
                };
                this.cbWriteProcess_BeginCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(true);
                };
                this.cbWriteProcess_CallbackComplete = function (s, e) {
                    eni.Loading.DisplayStatusLoading(false);
                    var cb_r_args = BaseCallbackResultArgsClass.Deserialize(e.result);
                    if (cb_r_args.Error == true) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), cb_r_args.ErrorMessage);
                        return;
                    }
                    switch (cb_r_args.Cmd) {
                        case "re":
                        case "reall":
                        case "fwd":
                        case "tmp":
                            if (!cb_r_args.Code) {
                                if (cb_r_args.Cmd == "fwd") {
                                    if (cb_r_args.attachments && cb_r_args.attachments.length > 0) {
                                        popWrite.Attachments = cb_r_args.attachments;
                                        gdvAttachList.PerformCallback(JSON.stringify(cb_r_args.attachments));
                                    } else {
                                        gdvAttachList.PerformCallback("");
                                    }
                                } else {
                                    gdvAttachList.PerformCallback("");
                                }
                                popWrite.AfterShownCallback = function () {
                                    if (cb_r_args.dt_to_addr) {
                                        for (var i = 0; i < cb_r_args.dt_to_addr.length; i++) {
                                            popWrite.to_addr.tokenfield("createToken", { value: cb_r_args.dt_to_addr[i].mail_address, label: cb_r_args.dt_to_addr[i].name });
                                        }
                                    }
                                    if (cb_r_args.Cmd == "reall" && cb_r_args.dt_cc_addr) {
                                        for (var i = 0; i < cb_r_args.dt_cc_addr.length; i++) {
                                            popWrite.cc_addr.tokenfield("createToken", { value: cb_r_args.dt_cc_addr[i].mail_address, label: cb_r_args.dt_cc_addr[i].name });
                                        }
                                    
                                        if (cb_r_args.dt_bcc_addr && cb_r_args.dt_bcc_addr.length > 0) {
                                            popWrite.GetButton("addr").Expand();
                                            for (var i = 0; i < cb_r_args.dt_bcc_addr.length; i++) {
                                                popWrite.bcc_addr.tokenfield("createToken", { value: cb_r_args.dt_bcc_addr[i].mail_address, label: cb_r_args.dt_bcc_addr[i].name });
                                            }
                                        } else {
                                            popWrite.GetButton("addr").UnExpand();
                                        }
                                    }

                                    if (cb_r_args.important) {
                                        chkImportant.SetChecked(true);
                                    }
                                    if (cb_r_args.Cmd == "fwd") {

                                    }
                                    if (cb_r_args.subject) {
                                        txtSubject.SetText(cb_r_args.subject);
                                    }
                                    if (cb_r_args.htmlbody) {
                                        popWrite.Editor.setIR(cb_r_args.htmlbody);
                                    }

                                    this.AfterShownCallback = null;
                                };
                                eni.LocalPage.ChangeMVMode(cb_r_args.Cmd);
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), cb_r_args.Message);
                            }
                            break;
                        case "send":
                            if (!cb_r_args.Code) {
                                if (hidFields.Contains("parent_mid")) hidFields.Remove("parent_mid");
                                if (hidFields.Contains("tmp_mid")) hidFields.Remove("tmp_mid");
                                eni.LocalPage.ChangeMVMode("list");
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), cb_r_args.Message);
                            }
                            break;
                        case "save_temp":
                            if (!cb_r_args.Code) {
                                //tmAutoSave.SetEnabled(false);
                                //lgBlnFlgChgValue = false;
                                hidFields.Set("tmp_mid", cb_r_args.mid);
                                //var nowTime = "현재까지 작성된 본문이 " + eni.Date.GetCurrentTimeString() + " 에 임시저장 되었습니다.";
                                //$autoSaveMsg[0].innerText = nowTime;
                            } else {
                                eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), cb_r_args.Message);
                            }
                            break;
                    }
                };
                this.cbProcess_BeginCallback = function (s, e) {
                    eni.Loading.DisplayStatusLoading(true);
                };
                this.cbProcess_CallbackComplete = function (s, e) {
                    var cb_r_args = BaseCallbackResultArgsClass.Deserialize(e.result);

                    eni.Loading.DisplayStatusLoading(false);

                    if (cb_r_args.Error == true) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), cb_r_args.ErrorMessage);
                        return;
                    }

                    switch (cb_r_args.Cmd) {
                        case "list":
                            switch (cb_r_args.CmdDetail) {
                                case "read_state":
                                    chkAllSelectRow.SetChecked(false);
                                    gdvList.UnselectAllRowsOnPage();
                                    break;
                                case "flagged":
                                    chkAllSelectRow.SetChecked(false);
                                    gdvList.UnselectAllRowsOnPage();
                                    break;
                            }
                            break;
                        case "read":
                            switch (cb_r_args.CmdDetail) {
                                case "read_state":
                                    break;
                                case "flagged":
                                    break;
                            }
                            break;
                    }
                };
                this.IsCallbackProcess = function () {
                    return gdvList.InCallback() || cbProcess.InCallback() || popRead.InCallback() || popWrite.InCallback();
                };
                this.CreateCurrentRow = function (row_main_el) {
                    var cur_row = jQuery(row_main_el);
                    cur_row.row_no = cur_row.attr("row_no");
                    cur_row.data = cur_row.attr("data");
                    var data_split = cur_row.data.split("|")
                    cur_row.mfid = data_split[0];
                    cur_row.mid = data_split[1];
                    cur_row.mf = data_split[2];
                    cur_row.SetData = function (mfid, mid, mf) {
                        this.mfid = mfid;
                        this.mid = mid;
                        this.mf = mf;
                        this.data = String(mfid) + "|" + String(mid) + "|" + String(mf);
                        this.attr("data", this.data);
                    };
                    cur_row.flaged = cur_row.find("#MESSAGEFLAGEDCLASS span");
                    cur_row.flag = cur_row.find("#MESSAGEFLAGCLASS span");
                    cur_row.attach = cur_row.find("#ATTACHFILECOUNT span");
                    cur_row.from_addr = cur_row.find("#MESSAGEFROMADDRESS a");
                    cur_row.to_addr = cur_row.find("#MESSAGETOADDRESS a");
                    cur_row.subject = cur_row.find("#MESSAGESUBJECT a");
                    
                    return cur_row;
                };
                this.DisplayChange = function (strMode, message_folder_id, message_folder_name, message_id) {
                    strMode = String(strMode).toLocaleLowerCase();
                    if (hidFields.Get("mv") == strMode && strMode == "receive_check") {
                        return;
                    }
                    var org_mode = hidFields.Get("mv");
                    var org_folder_id = hidFields.Get("sfid");
                    var org_folder_name = hidFields.Get("sfnm");
                    var org_folder_option = hidFields.Get("sfop");
                    var org_folder_option_name = hidFields.Get("sfopnm");
                    var cur_folder = $imap_folders.GetCurrentFolder();
                    var cur_folder_id = cur_folder.folder_id;
                    var cur_folder_name = cur_folder.folder_name;
                    var cur_folder_option = cur_folder.folder_option;
                    var cur_folder_option_name = cur_folder.folder_option_name;
                    var org_message_id = hidFields.Get("mid");

                    var req_url = "";

                    if (org_mode != strMode) {
                        history_set = true;

                        hidFields.Set("prov_mv", org_mode);
                        hidFields.Set("mv", strMode);
                        //툴바의 메일 이동 메뉴 선택된 메일 폴더 숨김
                        var move_folders = mnToolbar.GetItemByName("btnMove");
                        var move_folders_cnt = move_folders.GetItemCount();
                        for (var i = 0; i < move_folders_cnt; i++) {
                            if (move_folders.GetItem(i).GetText() == cur_folder.folder_name) {
                                move_folders.GetItem(i).SetVisible(false);
                            } else {
                                move_folders.GetItem(i).SetVisible(true);
                            }
                        }
                        if (strMode == "receive_check") {
                            cur_folder_id = 0;
                            cur_folder_name = '<%= GetResource("CSTRESX00143") %>';
                        }
                    }
                    req_url += "?mv=" + strMode;
                    
                    if ((org_folder_id != cur_folder_id) || (cur_folder_id == 0 && org_folder_option != cur_folder_option)) {
                        history_set = true;

                        hidFields.Set("sfid", cur_folder_id);
                        hidFields.Set("sfnm", cur_folder_name);
                        if (cur_folder_id == 0) {
                            hidFields.Set("sfop", cur_folder.folder_option);
                            hidFields.Set("sfopnm", cur_folder.folder_option_name);
                        }
                    }

                    if (cur_folder_id) {
                        req_url += "&sfid=" + cur_folder_id;
                        req_url += "&sfnm=" + cur_folder_name;
                        if (cur_folder_id == 0) {
                            req_url += "&sfop=" + cur_folder.folder_option;
                            req_url += "&sfnm=" + cur_folder.folder_option_name;
                        }
                    }

                    if (message_id && org_message_id != message_id) {
                        history_set = true;

                        hidFields.Set("mfid", message_folder_id);
                        hidFields.Set("mfnm", message_folder_name);
                        hidFields.Set("mid", message_id);
                    }
                    if (strMode == "re" || strMode == "reall" || strMode == "fwd") {
                        hidFields.Set("parent_mid", message_id);
                    } else if (strMode == "tmp") {
                        hidFields.Set("tmp_mid", message_id);
                    }
                    if (message_folder_id) {
                        req_url += "&mfid=" + message_folder_id;
                        req_url += "&mfnm=" + message_folder_name;
                    }
                    if (message_id) {
                        req_url += "&mid=" + message_id;
                    }
                    if (history_set) {
                        var data = {
                            prov_mv: org_mode,
                            folder_name: message_folder_name
                        };
                        History.pushState(data, document.title, req_url);
                    }
                    switch (strMode) {
                        case "list":
                            if (org_folder_id == cur_folder_id && org_folder_option == cur_folder_option) {
                                eni.LocalPage.ChangeMVMode(strMode);
                            } else {
                                gdvList.Refresh();
                            }
                            break;
                        case "receive_check":
                            gdvList.Refresh();
                            break;
                        case "read":
                            if (org_mode != strMode || org_message_id != message_id) {
                                var cbArgs = new BaseCallbackArgsClass();
                                cbArgs.mfid = message_folder_id;
                                cbArgs.mid = cur_message_id = message_id;
                                popRead.PerformCallback(cbArgs.Serialize());
                            } else {
                                eni.LocalPage.ChangeMVMode(strMode);
                            }
                            break;
                        case "new":
                        case "newme":
                            if (popWrite.Loaded || org_mode == strMode) {
                                popWrite.Clear();
                            }
                            eni.LocalPage.ChangeMVMode(strMode);
                            break;
                        case "re":
                        case "reall":
                        case "fwd":
                        case "tmp":
                            if (popWrite.Loaded) {
                                popWrite.Clear();
                            }
                            cbArgs = new BaseCallbackArgsClass();
                            cbArgs.cmd = strMode;
                            cbArgs.mfid = message_folder_id;
                            cbArgs.mid = message_id;
                            cbWriteProcess.PerformCallback(cbArgs.Serialize());
                            break;
                    }
                };
                this.ChangeMVMode = function (strMode) {
                    if (hidFields.Get("mv") != strMode) {
                        hidFields.Set("prov_mv", hidFields.Get("mv"));
                        hidFields.Set("mv", strMode);
                    }
                    var adjustResizeble = function () {
                        splContant.GetPaneByName("ToolbarPane")
                    };
                    switch (String(strMode).toLocaleLowerCase()) {
                        case "list":
                            splContant.GetPaneByName("ToolbarPane").SetSize(70);
                            eni.LocalPage.PageResize();

                            mnToolbar.GetItemByName("btnAllSelect").SetVisible(true);
                            
                            var select_data = eni.LocalPage.GetSelectRowData();
                            if (select_data) {
                                mnToolbar.GetItemByName("btnChangeSeen").SetEnabled(true);
                                mnToolbar.GetItemByName("btnDelete").SetEnabled(true);
                                if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                                    mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(true);
                                } else {
                                    mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(true);
                                }
                                if (select_data && select_data.Rows.length == 1) {
                                    mnToolbar.GetItemByName("btnReply").SetEnabled(true);
                                    mnToolbar.GetItemByName("btnAllReply").SetEnabled(true);
                                    mnToolbar.GetItemByName("btnDelivery").SetEnabled(true);
                                    mnToolbar.GetItemByName("btnMove").SetEnabled(true);
                                    mnToolbar.GetItemByName("btnOptions").SetEnabled(true);
                                } else {
                                    mnToolbar.GetItemByName("btnReply").SetEnabled(false);
                                    mnToolbar.GetItemByName("btnAllReply").SetEnabled(false);
                                    mnToolbar.GetItemByName("btnDelivery").SetEnabled(false);
                                    mnToolbar.GetItemByName("btnMove").SetEnabled(false);
                                    mnToolbar.GetItemByName("btnOptions").SetEnabled(false);
                                }
                            } else {
                                mnToolbar.GetItemByName("btnChangeSeen").SetEnabled(false);
                                mnToolbar.GetItemByName("btnDelete").SetEnabled(false);
                                if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                                    mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(false);
                                } else {
                                    mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(false);
                                }
                                mnToolbar.GetItemByName("btnReply").SetEnabled(false);
                                mnToolbar.GetItemByName("btnAllReply").SetEnabled(false);
                                mnToolbar.GetItemByName("btnDelivery").SetEnabled(false);
                                mnToolbar.GetItemByName("btnMove").SetEnabled(false);
                                mnToolbar.GetItemByName("btnOptions").SetEnabled(false);
                            }
                            mnToolbar.GetItemByName("btnChangeSeen").SetVisible(true);
                            mnToolbar.GetItemByName("btnDelete").SetVisible(true);
                            if ($imap_folders.GetCurrentFolderName() == '<%= hMailServerProvider.GetGlobalIMAPFolderName(hMailServerService.IMAPFolders.TrashBox, EnumDef.ConvertLangToEnumLang(lgLang)) %>') {
                                mnToolbar.GetItemByName("btnDeleteFull").SetVisible(false);
                            } else {
                                mnToolbar.GetItemByName("btnDeleteFull").SetVisible(true);
                            }
                            mnToolbar.GetItemByName("btnReply").SetVisible(true);
                            mnToolbar.GetItemByName("btnAllReply").SetVisible(true);
                            mnToolbar.GetItemByName("btnDelivery").SetVisible(true);
                            mnToolbar.GetItemByName("btnMove").SetVisible(true);
                            mnToolbar.GetItemByName("btnOptions").SetVisible(true);
                            mnToolbar.GetItemByName("btnPrint").SetVisible(false);
                            mnToolbar.GetItemByName("btnSend").SetVisible(false);
                            mnToolbar.GetItemByName("btnSaveTemp").SetVisible(false);
                            //mnToolbar.GetItemByName("btnPreview").SetVisible(false);
                            mnToolbar.GetItemByName("btnDeleteCheck").SetVisible(false);
                            mnToolbar.GetItemByName("btnList").SetVisible(false);
                            if (popRead.IsVisible()) {
                                popRead.Hide();
                            }
                            if (popWrite.IsVisible()) {
                                popWrite.Hide();
                            }
                            break;
                        case "receive_check":
                            splContant.GetPaneByName("ToolbarPane").SetSize(70);

                            mnToolbar.GetItemByName("btnAllSelect").SetVisible(true);
                            mnToolbar.GetItemByName("btnChangeSeen").SetVisible(false);
                            mnToolbar.GetItemByName("btnDelete").SetVisible(false);
                            mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(false);
                            mnToolbar.GetItemByName("btnDeleteFull").SetVisible(false);
                            mnToolbar.GetItemByName("btnReply").SetVisible(false);
                            mnToolbar.GetItemByName("btnAllReply").SetVisible(false);
                            mnToolbar.GetItemByName("btnDelivery").SetVisible(false);
                            mnToolbar.GetItemByName("btnMove").SetVisible(false);
                            mnToolbar.GetItemByName("btnOptions").SetVisible(false);
                            mnToolbar.GetItemByName("btnPrint").SetVisible(false);
                            mnToolbar.GetItemByName("btnSend").SetVisible(false);
                            mnToolbar.GetItemByName("btnSaveTemp").SetVisible(false);
                            //mnToolbar.GetItemByName("btnPreview").SetVisible(false);
                            mnToolbar.GetItemByName("btnDeleteCheck").SetEnabled(false);
                            mnToolbar.GetItemByName("btnDeleteCheck").SetVisible(true);
                            mnToolbar.GetItemByName("btnList").SetVisible(false);
                            if (popRead.IsVisible()) {
                                popRead.Hide();
                            }
                            if (popWrite.IsVisible()) {
                                popWrite.Hide();
                            }
                            break;
                        case "read":
                            splContant.GetPaneByName("ToolbarPane").SetSize(70);
                            eni.LocalPage.PageResize();

                            if (popWrite.IsVisible()) {
                                popWrite.Hide();
                            }
                            popRead.Show();
                            mnToolbar.GetItemByName("btnAllSelect").SetVisible(false);
                            mnToolbar.GetItemByName("btnChangeSeen").SetEnabled(true);
                            mnToolbar.GetItemByName("btnChangeSeen").SetVisible(true);
                            mnToolbar.GetItemByName("btnDelete").SetEnabled(true);
                            mnToolbar.GetItemByName("btnDelete").SetVisible(true);
                            if ($imap_folders.GetCurrentFolderName() == "지운 편지함") {
                                mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(false);
                                mnToolbar.GetItemByName("btnDeleteFull").SetVisible(false);
                            } else {
                                mnToolbar.GetItemByName("btnDeleteFull").SetEnabled(true);
                                mnToolbar.GetItemByName("btnDeleteFull").SetVisible(true);
                            }
                            mnToolbar.GetItemByName("btnReply").SetEnabled(true);
                            mnToolbar.GetItemByName("btnReply").SetVisible(true);
                            mnToolbar.GetItemByName("btnAllReply").SetEnabled(true);
                            mnToolbar.GetItemByName("btnAllReply").SetVisible(true);
                            mnToolbar.GetItemByName("btnDelivery").SetEnabled(true);
                            mnToolbar.GetItemByName("btnDelivery").SetVisible(true);
                            mnToolbar.GetItemByName("btnMove").SetEnabled(true);
                            mnToolbar.GetItemByName("btnMove").SetVisible(true);
                            mnToolbar.GetItemByName("btnOptions").SetEnabled(true);
                            mnToolbar.GetItemByName("btnOptions").SetVisible(true);
                            mnToolbar.GetItemByName("btnPrint").SetVisible(true);
                            mnToolbar.GetItemByName("btnSend").SetVisible(false);
                            mnToolbar.GetItemByName("btnSaveTemp").SetVisible(false);
                            //mnToolbar.GetItemByName("btnPreview").SetVisible(false);
                            mnToolbar.GetItemByName("btnDeleteCheck").SetVisible(false);
                            mnToolbar.GetItemByName("btnList").SetVisible(true);
                            break;
                        case "new":
                        case "newme":
                        case "re":
                        case "reall":
                        case "fwd":
                        case "tmp":
                            splContant.GetPaneByName("ToolbarPane").SetSize(70);
                            eni.LocalPage.PageResize();

                            ldpWriteLoader.Show();
                            if (popRead.IsVisible()) {
                                popRead.Hide();
                            }
                            if (!popWrite.Loaded) {
                                popWrite.BeforShow();
                            } else {
                                if (String(strMode).toLocaleLowerCase() == "newme") {
                                    popWrite.Con_To_Addr.hide();
                                    popWrite.Con_Cc_Addr.hide();
                                } else {
                                    popWrite.Con_To_Addr.show();
                                    popWrite.Con_Cc_Addr.show();
                                }
                            }
                            if (!popWrite.IsVisible()) {
                                popWrite.Show();
                                mnToolbar.GetItemByName("btnAllSelect").SetVisible(false);
                                mnToolbar.GetItemByName("btnChangeSeen").SetVisible(false);
                                mnToolbar.GetItemByName("btnDelete").SetVisible(false);
                                mnToolbar.GetItemByName("btnDeleteFull").SetVisible(false);
                                mnToolbar.GetItemByName("btnReply").SetVisible(false);
                                mnToolbar.GetItemByName("btnAllReply").SetVisible(false);
                                mnToolbar.GetItemByName("btnDelivery").SetVisible(false);
                                mnToolbar.GetItemByName("btnMove").SetVisible(false);
                                mnToolbar.GetItemByName("btnOptions").SetVisible(false);
                                mnToolbar.GetItemByName("btnPrint").SetVisible(false);
                                mnToolbar.GetItemByName("btnSend").SetVisible(true);
                                mnToolbar.GetItemByName("btnSaveTemp").SetVisible(true);
                                //mnToolbar.GetItemByName("btnPreview").SetVisible(true);
                                mnToolbar.GetItemByName("btnDeleteCheck").SetVisible(false);
                                mnToolbar.GetItemByName("btnList").SetVisible(true);
                            } else {
                                ldpWriteLoader.Hide();
                            }
                            break;
                    }
                    eni.Loading.DisplayStatusLoading(false);
                };
                this.GetSelectRowData = function () {
                    var selectedRows = gdvList.GetSelectedKeysOnPage();
                    if (String(selectedRows).trim() !== "") {
                        var main_el = jQuery(gdvList.GetMainElement());
                        var select_data = new DataTableClass();
                        select_data.ToArray = function () {
                            for (var i = 0; i < this.Rows.length; i++) {
                                delete this.Rows[i].data;
                                delete this.Rows[i].row;
                            }
                            return this.Rows;
                        };
                        select_data.ToJson = function () {
                            for (var i = 0; i < this.Rows.length; i++) {
                                delete this.Rows[i].data;
                                delete this.Rows[i].row;
                            }
                            if (JSON) {
                                return JSON.stringify(this.Rows);
                            } else {
                                return null;
                            }
                        };
                        select_data.Serialize = function (pBaseObject, pPropertyName) {
                            for (var i = 0; i < this.Rows.length; i++) {
                                delete this.Rows[i].data;
                                delete this.Rows[i].row;
                            }
                            if (pBaseObject !== undefined && pBaseObject && typeof pBaseObject === "object") {
                                pBaseObject[pPropertyName] = this.Rows;
                                if (JSON) {
                                    return JSON.stringify(pBaseObject);
                                } else {
                                    return null;
                                }
                            } else {
                                var serJson = this.Rows;
                                if (JSON) {
                                    return JSON.stringify(serJson);
                                } else {
                                    return null;
                                }
                            }
                        };

                        if (hidFields.Get("mv") == "receive_check") {
                            select_data.AddColumn("mid");
                            select_data.AddColumn("rid");
                            var sRow = new String(selectedRows).split(",");
                            for (var i = 0; i < sRow.length; i++) {
                                sCol = sRow[i].split("|");
                                var row = select_data.NewRow();
                                row.data = selectedRows;
                                row.mid = sCol[0];
                                row.rid = sCol[1];
                                select_data.AddRow(row);
                            }
                        } else {
                            select_data.AddColumn("mfid");
                            select_data.AddColumn("mid");
                            select_data.AddColumn("mf");
                            var sRow = new String(selectedRows).split(",");
                            for (var i = 0; i < sRow.length; i++) {
                                sCol = sRow[i].split("|");
                                var row = select_data.NewRow();
                                row.data = selectedRows;
                                row.mfid = sCol[0];
                                row.mid = sCol[1];
                                row.mf = sCol[2];
                                row.row = main_el.find("tr[mid=" + sCol[1] + "]");
                                row.row.row_no = row.row.attr("row_no");
                                row.row.data = row.row.attr("data");
                                row.row.SetData = function (parent, mfid, mid, mf) {
                                    parent.mfid = mfid;
                                    parent.mid = mid;
                                    parent.mf = mf;
                                    this.data = String(mfid) + "|" + String(mid) + "|" + String(mf);
                                    this.attr("data", this.data);
                                };
                                row.row.flaged = row.row.find("#MESSAGEFLAGEDCLASS span");
                                row.row.flag = row.row.find("#MESSAGEFLAGCLASS span");
                                row.row.attach = row.row.find("#ATTACHFILECOUNT span");
                                row.row.from_addr = row.row.find("#MESSAGEFROMADDRESS a");
                                row.row.to_addr = row.row.find("#MESSAGETOADDRESS a");
                                row.row.subject = row.row.find("#MESSAGESUBJECT a");
                                select_data.AddRow(row);
                            }
                        }
                        return select_data;
                    } else {
                        return null;
                    }
                };
                this.EventBubblingStop = function (event) {
                    event = event.browserEvent || event;
                    if (event.preventDefault) {
                        event.preventDefault();
                    } else {
                        event.returnValue = false;
                    }
                };
            });
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
        }
        // ]]>
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    <%-- 메일 폴더 추가기능 컨텍스트 팝업 컨트롤 --%>
    <dx:ASPxPopupMenu ID="popmMoreMenu" ClientInstanceName="popmMoreMenu" runat="server" 
        ShowPopOutImages="True" 
        AutoPostBack="false" 
        PopupHorizontalAlign="LeftSides" 
        PopupVerticalAlign="Below" 
        CloseAction="OuterMouseClick" 
        PopupVerticalOffset="5"
        GutterWidth="0px">
        <ClientSideEvents ItemClick="eni.LocalPage.popmMoreMenu_ItemClick" />
        <ItemImage Width="0px"></ItemImage>
        <SeparatorPaddings Padding="0px" />
        <ItemStyle BackColor="White">
            <BackgroundImage ImageUrl="none" />
            <HoverStyle BackColor="#DAF2FF" Border-BorderColor="#BFE7FF"></HoverStyle>
        </ItemStyle>
        <SubMenuItemImage Width="0px">
            <SpriteProperties CssClass="Margin0" />
        </SubMenuItemImage>
        <DisabledStyle ForeColor="Silver"></DisabledStyle>
        <Items>
            <dx:MenuItem GroupName="Option1" Name="btnImportant" Text="중요메일" ToolTip="중요메일만 표시합니다." Checked="false" ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option1" Name="btnAttachment" Text="첨부메일" ToolTip="첨부파일이 존재하는 메일만 표시합니다." Checked="false" ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option1" Name="btnToList" Text="받는사람" ToolTip="수신인에 자신이 포함된 메일만 표시합니다." Checked="false" ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option2" Name="btnEmpty" Text="비우기" ToolTip="메일함의 메일을 비웁니다." BeginGroup="True" Checked="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option2" Name="btnFlagedRead" Text="모두 읽음표시" ToolTip="메일함의 읽지않은 메일을 읽음으로 변경합니다." Checked="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option2" Name="btnFlagedReadDelete" Text="읽은 메일 삭제" ToolTip="읽은 메일을 삭제합니다." Checked="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option2" Name="btnFlagedUnReadDelete" Text="읽지 않은 메일 삭제" ToolTip="읽지 않은 메일을 삭제합니다." Checked="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option3" Name="btnMyFolderReName" Text="이름 바꾸기" ToolTip="폴더의 이름을 변경합니다." BeginGroup="True" Checked="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Option3" Name="btnMyFolderDelete" Text="폴더 삭제" ToolTip="폴더의 내용을 모두 비운후 폴더를 삭제 합니다." Checked="false"></dx:MenuItem>
        </Items>
    </dx:ASPxPopupMenu>
    <%-- 메일 리스트 추가기능 컨텍스트 팝업 컨트롤 --%>
    <dx:ASPxPopupMenu ID="popmListMenu" ClientInstanceName="popmListMenu" runat="server" 
        ShowPopOutImages="True"
        AutoPostBack="false" 
        PopupHorizontalAlign="LeftSides" 
        PopupVerticalAlign="Below" 
        CloseAction="MouseOut"
        PopupVerticalOffset="5"
        GutterWidth="0px">
        <ClientSideEvents ItemClick="eni.LocalPage.popmListMenu_ItemClick" />
        <SeparatorPaddings Padding="0px" />
        <ItemStyle BackColor="White">
            <BackgroundImage ImageUrl="none" />
            <HoverStyle BackColor="#DAF2FF" Border-BorderColor="#BFE7FF"></HoverStyle>
        </ItemStyle>
        <SubMenuItemImage Width="0px">
            <SpriteProperties CssClass="Margin0" />
        </SubMenuItemImage>
        <DisabledStyle ForeColor="Silver"></DisabledStyle>
        <Items>
            <dx:MenuItem GroupName="Action" Name="btnNewMail" BeginGroup="True" Checked="false" Text="메일쓰기" ToolTip="해당 주소로 새 메일을 작성합니다."></dx:MenuItem>
            <dx:MenuItem GroupName="Options1" Name="btnCurBoxFromSearch" BeginGroup="True" Checked="false" Text="보낸 사람으로 검색하기" ToolTip="해당 폴더에서 이사람이 보낸메일을 검색합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options1" Name="btnCurBoxToSearch" Checked="false" Text="받는 사람으로 검색하기" ToolTip="해당 폴더에서 이사람이 받는사람으로 지정된 메일을 검색합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options1" Name="btnAllBoxFromSearch" Checked="false" Text="보낸 사람으로 검색하기(전체)" ToolTip="전체 폴더에서 이사람이 보낸메일을 검색합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options1" Name="btnAllBoxToSearch" Checked="false" Text="받는 사람으로 검색하기(전체)" ToolTip="전체 폴더에서 이사람이 받는사람으로 지정된 메일을 검색합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options2" Name="btnReqRespMail" BeginGroup="True" Checked="false" Text="주고받은 메일 표시" ToolTip="이 사람과 주고 받은 메세지를 확인합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options3" Name="btnApplayFlaged" BeginGroup="True" Checked="false" Text="중요 플레그 지정하기" ToolTip="선택된 주소로 들어오는 메일은 중요 플레그를 자동으로 추가합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options3" Name="btnAddContact" Checked="false" Text="주소추가" ToolTip="이 사람을 주소록에 추가합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options4" Name="btnAddBlockList" BeginGroup="True" Checked="false" Text="차단하기" ToolTip="이 사람을 차단합니다." ClientEnabled="false"></dx:MenuItem>
            <dx:MenuItem GroupName="Options4" Name="btnReceiveDelete" Checked="false" Text="받은 메일 모두 삭제" ToolTip="이 사람에게 받은 메일을 모두 삭제합니다." ClientEnabled="false"></dx:MenuItem>
        </Items>
    </dx:ASPxPopupMenu>
    <%-- 메일 읽기 팝업 컨트롤 --%>
    <eni:eniPopupControl ID="popRead" ClientInstanceName="popRead" SkinID="MailRead" runat="server"
        AllowResize="false" CloseAction="CloseButton" PopupAnimationType="Fade" CloseAnimationType="Fade" PopupHorizontalOffset="231" PopupVerticalOffset="71"
        ShowHeader="false" ShowFooter="false" ShowShadow="false" ScrollBars="Auto" Cursor="auto" style="cursor:auto"
        OnWindowCallback="popRead_WindowCallback">
        <ClientSideEvents BeginCallback="eni.LocalPage.popRead_BeginCallback"
                            EndCallback="eni.LocalPage.popRead_EndCallback"/>
        <SettingsLoadingPanel Enabled="false" />
        <Border BorderWidth="0px" />
        <ContentCollection>
            <dx:PopupControlContentControl ID="win_read" runat="server">
                <div id="con_title" class="con_title">
                    <asp:Table runat="server" CssClass="FullScreen">
                        <asp:TableRow Height="27px">
                            <asp:TableCell Width="14px" HorizontalAlign="Left">
                                <eni:eniImage ID="imgFlagged" ClientInstanceName="imgFlagged" runat="server"
                                    Cursor="pointer"
                                    style="padding:0px; margin:0px 5px 0px 0px" 
                                    ClientSideEvents-Click="eni.LocalPage.imgFlagged_Click">
                                </eni:eniImage>
                            </asp:TableCell>
                            <asp:TableCell ID="eniImgImportantArea" runat="server" Width="4px" Visible="false">
                                <asp:Image runat="server" Height="8px" ToolTip='<%# GetResource("CSTRESX00115") %>' CssClass="Icon Importance"
                                    style="padding:0px; margin:3px 2px 0px 4px">
                                </asp:Image>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblSubject" ClientInstanceName="lblSubject" runat="server" 
                                    Text="제목" ToolTip="메일 제목을 확인합니다." Font-Bold="True" Font-Size="13px">
                                </asp:Label>
                            </asp:TableCell>
                            <asp:TableCell Width="200px" CssClass="VerticalAlignR">
                                <asp:Label ID="lblDate" ClientInstanceName="lblDate" runat="server" Text="시간" ToolTip="메일을 받은 시간을 확인합니다."></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="FromAddress" Height="27px">
                            <asp:TableCell ColumnSpan="4">
                                <asp:Table runat="server" CssClass="FullScreen">
                                    <asp:TableRow> 
                                        <asp:TableCell Width="10px" CssClass="VerticalAlignR"> 
                                            <eni:eniImage ID="imgExpand" ClientInstanceName="imgExpand" runat="server"
                                                Cursor="pointer" CssClass="Icon6 Expand" ToolTip='<%# GetResource("CSTRESX00116") %>'
                                                style="padding:0px; margin:0px 3px 0px 2px" 
                                                ClientSideEvents-Click="eni.LocalPage.imgExpand_Click">
                                            </eni:eniImage>
                                        </asp:TableCell>
                                        <asp:TableCell Width="65px" CssClass="VerticalAlignR"> 
                                            <asp:Label ID="lblFromAddrText" ClientInstanceName="lblFromAddrText" runat="server"
                                                CssClass="Font-Bold" Text='<%# GetResource("CSTRESX00117") %>' ToolTip='<%# GetResource("CSTRESX00118") %>'>
                                            </asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <eni:eniLabel ID="lblFromAddr" ClientInstanceName="lblFromAddr" runat="server" Text="보낸사람" CssClass="Padding5LR"></eni:eniLabel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="tbToInfoArea" CssClass="ExpandAdress DisplayNone" runat="server" Height="27px">
                            <asp:TableCell ColumnSpan="4">
                                <asp:Table runat="server" CssClass="FullScreen">
                                    <asp:TableRow>
                                        <asp:TableCell Width="18px" CssClass="VerticalAlignR"></asp:TableCell>
                                        <asp:TableCell Width="65px" CssClass="VerticalAlignR"> 
                                            <eni:eniLabel ID="lblToAddrs" ClientInstanceName="lblToAddrs" runat="server"
                                                CssClass="Font-Bold" Text='<%# GetResource("CSTRESX00119") %>' ToolTip='<%# GetResource("CSTRESX00120") %>'></eni:eniLabel>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <eni:eniLabel ID="lblToAddr" ClientInstanceName="lblToAddr" runat="server" Text="받는사람" CssClass="Padding5LR"></eni:eniLabel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="tbCCInfoArea" CssClass="ExpandAdress DisplayNone" runat="server" Height="27px">
                            <asp:TableCell ColumnSpan="4">
                                <asp:Table runat="server" CssClass="FullScreen">
                                    <asp:TableRow>
                                        <asp:TableCell Width="18px" CssClass="VerticalAlignR"></asp:TableCell>
                                        <asp:TableCell Width="65px" CssClass="VerticalAlignR"> 
                                            <eni:eniLabel ID="lblCcAddrText" ClientInstanceName="lblCcAddrText" runat="server"
                                                CssClass="Font-Bold" Text='<%# GetResource("CSTRESX00121") %>' ToolTip='<%# GetResource("CSTRESX00122") %>'></eni:eniLabel>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <eni:eniLabel ID="lblCcAddr" ClientInstanceName="lblCcAddr" runat="server" Text="참조" CssClass="Padding5LR"></eni:eniLabel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="tbBCCInfoArea" CssClass="ExpandAdress DisplayNone" runat="server" Height="27px">
                            <asp:TableCell ColumnSpan="4">
                                <asp:Table runat="server" CssClass="FullScreen">
                                    <asp:TableRow>
                                        <asp:TableCell Width="18px" CssClass="VerticalAlignR"></asp:TableCell>
                                        <asp:TableCell Width="65px" CssClass="VerticalAlignR"> 
                                            <eni:eniLabel ID="lblBccAddrText" ClientInstanceName="lblBccAddrText" runat="server"
                                                CssClass="Font-Bold" Text='<%# GetResource("CSTRESX00123") %>' ToolTip='<%# GetResource("CSTRESX00124") %>'></eni:eniLabel>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <eni:eniLabel ID="lblBccAddr" ClientInstanceName="lblBccAddr" runat="server" Text="숨은참조" CssClass="Padding5LR"></eni:eniLabel>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <div id="con_body" class="con_body">
                    <asp:PlaceHolder ID="phBody" runat="server"></asp:PlaceHolder>
                    <p class="to_top DisplayNone">
                        <a>맨위로</a>
                    </p>
                    <div class="ref_mails DisplayNone">
                        <div class="ref_box">
                            <span class="title">주고받은메일</span>
                            <strong>2</strong>
                            <div class="ref_list">
                                <ul class="ref_row">
                                    <li class="flaged">a</li>
                                    <li class="attachment">b</li>
                                    <li class="sender">c</li>
                                    <li class="subject">d</li>
                                    <li class="date">e</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </eni:eniPopupControl>

    <%-- 메일 쓰기 팝업 로딩패널 컨트롤 --%>
    <eni:eniLoadingPanel ID="ldpWriteLoader" ClientInstanceName="ldpWriteLoader" runat="server" 
        Modal="True" Text='<%# GetResource("CSTRESX00182") %>' ToolTip='<%# GetResource("CSTRESX00182") %>'>
        <LoadingDivStyle BackColor="Black" Opacity="50" Cursor="wait"></LoadingDivStyle>
    </eni:eniLoadingPanel>

    <%-- 업로드 상태 표시창 컨트롤 --%>
    <eni:UploadStatusBox runat="server" ID="popUploadStatus" ClientInstanceName="popUploadStatus" />
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <div id="wrap_left" class="wrap_left">
        <table class="FullScreen BorderClear Padding0 Margin0" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="height:60px;">
                    <div style="text-align:center">
                        <eni:eniButton ID="btnMailWrite" ClientInstanceName="btnMailWrite" EnableTheming="false" runat="server"
                            Width="80px" Height="35px" AutoPostBack="false" Text='<%# GetResource("CSTRESX00002") %>'
                            CssClass="btnMailWrite CButtonXLWhite Font-Bold"
                            HoverStyle-CssClass="CButtonXLWhiteHover"
                            PressedStyle-CssClass="CButtonXLWhitePress">
                            <ClientSideEvents Click="eni.LocalPage.btnMailWrite_Click" />
                        </eni:eniButton>
                        <eni:eniButton ID="btnMailWriteMe" ClientInstanceName="btnMailWriteMe" EnableTheming="false" runat="server"
                            Width="80px" Height="35px" AutoPostBack="false" Text='<%# GetResource("CSTRESX00008") %>'
                            CssClass="btnMailWriteMe CButtonXLWhite Font-Bold"
                            HoverStyle-CssClass="CButtonXLWhiteHover"
                            PressedStyle-CssClass="CButtonXLWhitePress">
                            <ClientSideEvents Click="eni.LocalPage.btnMailWriteMe_Click" />
                        </eni:eniButton>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="VerticalAlignT">
                    <eni:eniCallbackPanel ID="cbpFolders" ClientInstanceName="cbpFolders" runat="server"
                        Width="100%" Height="100%" EnableCallbackAnimation="false" 
                        OnCallback="cbpFolders_Callback">
                        <ClientSideEvents BeginCallback="eni.LocalPage.cbpFolders_BeginCallback"
                                        EndCallback="eni.LocalPage.cbpFolders_EndCallback" />
                        <SettingsLoadingPanel Enabled="false" />
                        <PanelCollection>
                            <dx:PanelContent>
                                <div id="rt_folder_container" class="VerticalAutoScroll mailbox">
                                    <div id="system_folder" class="menu_group" runat="server">
                                        <asp:Repeater ID="rtSystemIMAPFolders" runat="server">
                                            <HeaderTemplate>
                                                <ul class="list_menu system_folder">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li runat="server" folder-id='<%# Eval("FOLDERID")%>' folder-name='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>' unseen-cnt='<%# Eval("UNSEEN")%>' visible='<%# Eval("FOLDERID").ToString() == "0"%>'>
                                                    <a href="javascript:;" folder-option="all" class="fst link_mail" title='<%# GetResource("CSTRESX00005")%>'><%# GetResource("CSTRESX00005")%></a>
                                                    <span class="bar"></span>
                                                    <a href="javascript:;" folder-option="unseen" class="fst link_mail" style="overflow:initial;" title='<%# GetResource("CSTRESX00006")%>'><%# GetResource("CSTRESX00006")%>
                                                        <span class="mails_unread emph_color txt_count"><%# int.Parse(Eval("UNSEEN").ToString()) > 0 ? Eval("UNSEEN").ToString() : string.Empty%></span>
                                                    </a>
                                                    <a href="javascript:;" class="Icon20 MoreMenu link_more" title='<%# GetResource("CSTRESX00007")%>'></a>
                                                </li>
                                                <li runat="server" folder-id='<%# Eval("FOLDERID")%>' folder-name='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>' unseen-cnt='<%# Eval("UNSEEN")%>' visible='<%# Eval("FOLDERID").ToString() != "0"%>'>
                                                    <a href="javascript:;" class="link_mail" style="padding-left:24px;" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                        <span class='<%# GetIMAPFolderCssClassName(Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' style="width:21px; height: 17px; display:inline-block; position:absolute; margin:4px 0 0 -24px;"></span>
                                                        <%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>
                                                    </a>
                                                    <a href="javascript:;" class="link_receivenum emph_color" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                        <span class="mails_unread txt_receivenum"><%# int.Parse(Eval("UNSEEN").ToString()) > 0 ? Eval("UNSEEN").ToString() : string.Empty%></span>
                                                    </a>
                                                    <a runat="server" visible='<%# !hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.TrashBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' href="javascript:;" class="Icon20 MoreMenu link_more" style='<%# (hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.SentBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString()) ? "display:none; right:73px !important;" : "display:none;") %>' title='<%# GetResource("CSTRESX00007")%>'></a>
                                                    <a runat="server" visible='<%# hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.TrashBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' href="javascript:;" class="Icon20 Empty link_empty" style="display:none;" title='<%# GetResource("CSTRESX00010")%>'></a>
                                                    <a runat="server" href="javascript:;" visible='<%# hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.SentBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' class="Icon20 BgButton link_check"><%# GetResource("CSTRESX00009")%></a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div id="my_folder" class="menu_group" runat="server">
                                        <div class="accordion_group">
                                            <div class="box_menu">
                                                <a class="link_menu on" href="#none">
                                                    <span class="Icon SilverArrowDown ico_arrow"></span> 
                                                    내 메일함
                                                </a>
                                                <a href="javascript:;" class="Icon20 Add link_action" style="display:none;"></a>
                                            </div>
                                            <asp:Repeater ID="rtMyIMAPFolders" runat="server">
                                                <HeaderTemplate>
                                                    <ul class="list_menu my_folder">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <li runat="server" folder-id='<%# Eval("FOLDERID")%>' folder-name='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>' unseen-cnt='<%# Eval("UNSEEN")%>' visible='<%# Eval("FOLDERID").ToString() != "0"%>'>
                                                        <a href="javascript:;" class="link_mail" style="padding-left:24px;" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                            <span class='<%# GetIMAPFolderCssClassName(Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' style="width:21px; height: 17px; display:inline-block; position:absolute; margin:4px 0 0 -24px;"></span>
                                                            <%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>
                                                        </a>
                                                        <a href="javascript:;" class="link_receivenum emph_color" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                            <span class="mails_unread txt_receivenum"><%# int.Parse(Eval("UNSEEN").ToString()) > 0 ? Eval("UNSEEN").ToString() : string.Empty%></span>
                                                        </a>
                                                        <a href="javascript:;" class="Icon20 MoreMenu link_more" style="display:none;" title='<%# GetResource("CSTRESX00007")%>'></a>
                                                    </li>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </ul>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                   
                                    </div>
                                    <div id="tail_folder" class="menu_group" runat="server">
                                        <asp:Repeater ID="rtTailIMAPFolders" runat="server">
                                            <HeaderTemplate>
                                                <ul class="list_menu tail_folder">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li runat="server" folder-id='<%# Eval("FOLDERID")%>' folder-name='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>' unseen-cnt='<%# Eval("UNSEEN")%>' visible='<%# Eval("FOLDERID").ToString() != "0"%>'>
                                                    <a href="javascript:;" class="link_mail" style="padding-left:24px;" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                        <span class='<%# GetIMAPFolderCssClassName(Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' style="width:21px; height: 17px; display:inline-block; position:absolute; margin:4px 0 0 -24px;"></span>
                                                        <%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>
                                                    </a>
                                                    <a href="javascript:;" class="link_receivenum emph_color" title='<%# Eval(string.Format("FOLDERNAME_{0}", lgLang))%>'>
                                                        <span class="mails_unread txt_receivenum"><%# int.Parse(Eval("UNSEEN").ToString()) > 0 ? Eval("UNSEEN").ToString() : string.Empty%></span>
                                                    </a>
                                                    <a runat="server" visible='<%# !hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.SpamBox | IMAPFolders.JunkBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' href="javascript:;" class="Icon20 MoreMenu link_more" style="display:none;" title='<%# GetResource("CSTRESX00007")%>'></a>
                                                    <a runat="server" visible='<%# hMailServerProvider.IsGlobalIMAPFolderName(IMAPFolders.SpamBox | IMAPFolders.JunkBox, Eval(string.Format("FOLDERNAME_{0}", lgLang)).ToString())%>' href="javascript:;" class="Icon20 Empty link_empty" style="display:none;" title='<%# GetResource("CSTRESX00010")%>'></a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    eni.LocalPage.IMAPFolderEventBind();
                                </script>
                                <div class="used_info">
                                    <table class="FullScreen BorderClear Padding0 Margin0 Font-Small" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Font-Align-Left Padding5L Font-Bold">
                                                <%= GetResource("CSTRESX00003") %> <eni:eniLabel ID="lblUseSize" runat="server" CssClass="Font-Small ForeColorBlue"></eni:eniLabel>
                                            </td>
                                            <td></td>
                                            <td class="Font-Align-Right Padding5R">
                                                <eni:eniLabel ID="lblMaxSize" runat="server" CssClass="Font-Small ForeColorBlack Font-Bold"></eni:eniLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="Padding5LR">
                                                <eni:eniProgressBar ID="prbUsedTotalSize" runat="server" 
                                                    Width="100%" Height="21px" ToolTip='<%# GetResource("CSTRESX00004") %>'>
                                                </eni:eniProgressBar>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </dx:PanelContent>
                        </PanelCollection>
                    </eni:eniCallbackPanel>
                </td>
            </tr>
        </table>
    </div>
    <div id="wrap_right" class="wrap_right">
        <div id="area_content" class="area_content">
            <eni:eniSplitter ID="splContant" ClientInstanceName="splContant" CssClass="splContant" runat="server" FullscreenMode="true"
                Width="100%" Height="100%" ClientVisible="false"
                Border-BorderWidth="0px"
                Styles-Separator-Border-BorderWidth="0px"
                Styles-Separator-Paddings-Padding="0px"
                Styles-Pane-Border-BorderWidth="0px"
                Styles-Pane-Paddings-Padding="0px" Orientation="Vertical">
                <Panes>
                    <dx:SplitterPane Name="ToolbarPane" AllowResize="true" Size="70px" PaneStyle-CssClass="area_header">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <div class="search">
                                    <div class="search_option">
                                        <eni:eniButton ID="btnBrowser" ClientInstanceName="btnBrowser" runat="server" SkinID="LightDark" CssClass="VerticalAlignT"
                                            Height="19px" Font-Size="11px" Text="메뉴" Visible="false">
                                            <Paddings PaddingTop="4px" />
                                        </eni:eniButton>
                                        <span style="display:inline-block">
                                            <eni:eniTextBox ID="txtSearchText" ClientInstanceName="txtSearchText" SkinID="LightDark" runat="server"
                                                Width="200px" Height="24px" NullText="검색어를 2글자 이상 입력하세요.">
                                            </eni:eniTextBox>
                                        </span>
                                        <span style="display:inline-block; vertical-align:top;">
                                            <eni:eniButton ID="btnSearch" ClientInstanceName="btnSearch" runat="server" SkinID="LightDark" CssClass="VerticalAlignT"
                                                Height="19px" Font-Size="11px" Text="검색">
                                                <ClientSideEvents Click="function(){ gdvList.Refresh(); }"></ClientSideEvents>
                                                <Paddings PaddingTop="4px" />
                                            </eni:eniButton>
                                        </span>
                                    </div>
                                    <div class="list_head">
                                    </div>
                                </div>
                                <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" SkinID="LightDark" runat="server" AutoPostBack="false" Font-Size="11px">
                                    <ClientSideEvents ItemClick="eni.LocalPage.mnToolbar_Click" />
                                    <SubMenuStyle SeparatorPaddings-PaddingLeft="0px" />
                                    <SubMenuItemStyle Height="22px">
                                        <Paddings PaddingLeft="10px" PaddingTop="4px" PaddingRight="10px" PaddingBottom="0px" />
                                    </SubMenuItemStyle>
                                    <Items>
                                        <dx:MenuItem Name="btnAllSelect" Text="전체선택" ToolTip="페이지 내의 메일을 모두 선택합니다.">
                                            <ItemStyle Font-Bold="true" CssClass="Margin10R" />
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnChangeSeen" Text="읽지않음" ToolTip="선택된 메세지들의 읽음 상태를 변경합니다." ClientEnabled="false"></dx:MenuItem>
                                        <dx:MenuItem Name="btnDelete" Text="삭제" ToolTip="선택된 메세지들을 지운 편지함으로 이동합니다." ClientEnabled="false">
                                            <ItemStyle Font-Bold="true" CssClass="Margin10L"/>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnDeleteFull" Text="완전삭제" ToolTip="선택된 메세지들을 지운편지함으로 이동시키지 않고 삭제합니다." ClientEnabled="false">
                                            <ItemStyle Font-Bold="true" />
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnAddSpam" Text="스팸신고" ToolTip="선택된 메세지들을 모두 스팸으로 등록합니다." ClientEnabled="false" ClientVisible="false" >
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnReply" Text="답장" ToolTip="선택된 메세지에 대한 답장을 작성합니다." ClientEnabled="false">
                                            <ItemStyle CssClass="Margin10L"/>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnAllReply" Text="전체답장" ToolTip="선택된 메세지에 대한 전체답장을 작성합니다." ClientEnabled="false">
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnDelivery" Text="전달" ToolTip="선택된 메세지를 지정된 사람에게 전달합니다." ClientEnabled="false">
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnMove" Text="이동" ToolTip="선택된 메세지들의 폴더 위치를 변경합니다." DropDownMode="true" ClientEnabled="false" >
                                            <ItemStyle CssClass="Margin10L"/>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnOptions" ToolTip="메일함의 추가 기능을 실행 합니다." DropDownMode="true" ClientEnabled="false" PopOutImage-Width="0px">
                                            <ItemStyle CssClass="mnit_options Margin10L" Font-Bold="true" />
                                            <Items>
                                                <dx:MenuItem Name="btnSavePC" Text="PC로 내려받기" ToolTip="선택된 메세지를 로컬 PC로 내려받습니다. 만약 여러개의 파일이면 압축파일로 받습니다.">
                                                    <Image Width="0px"></Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="btnViewOriginal" Text="원문 보기" BeginGroup="true" ToolTip="선택된 메세지의 메타데이터를 확인합니다(인코딩 되어있으면 인코딩된상태로 보여집니다)." ClientEnabled="false">
                                                    <Image Width="0px"></Image>
                                                </dx:MenuItem>
                                            </Items>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnPrint" Text="출력" ToolTip="선택된 메세지를 출력합니다." DropDownMode="true" ClientVisible="false">
                                            <ItemStyle CssClass="Margin10L"/>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnSend" Text="보내기" ToolTip="메일을 보냅니다." ClientVisible="false">
                                            <ItemStyle Cursor="pointer" />
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnPreview" Text="미리보기" ToolTip="메일을 미리 확인합니다." Visible="false">
                                            <ItemStyle Cursor="pointer" />
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnSaveTemp" Text="임시보관" ToolTip="작성된 메일을 임시 저장합니다.(첨부파일은 저장되지 않습니다)" ClientVisible="false">
                                            <ItemStyle Cursor="pointer" />
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnDeleteCheck" Text="삭제" ToolTip="선택된 확인데이터를 삭제 합니다." ClientVisible="false" ClientEnabled="false">
                                            <ItemStyle Font-Bold="true"/>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="btnList" Text="목록" ToolTip="메일 리스트로 되돌아 갑니다." ClientVisible="false" ItemStyle-CssClass="FloatR"></dx:MenuItem>
                                    </Items>
                                </eni:eniMenu>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="Content" Separator-Visible="False">
                        <Panes>
                            <dx:SplitterPane Name="ListPane">
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                        <dx:EntityServerModeDataSource ID="EntityServerModeDataSource" runat="server"
                                            ContextTypeName="eniFramework.WebApp.Modules.Mail.efV_MAIL_MESSAGESEntities"  
                                            TableName="V_MAIL_MESSAGES" DefaultSorting="MESSAGEDATE DESC" 
                                            OnSelecting="EntityServerModeDataSource_Selecting"/>
                                        <eni:eniGridView ID="gdvList" ClientInstanceName="gdvList" SkinID="Advanced-01" runat="server"
                                            DataSourceID="EntityServerModeDataSource"
                                            OnBeforePerformDataSelect="gdvList_BeforePerformDataSelect"
                                            OnHtmlRowPrepared="gdvList_HtmlRowPrepared"
                                            OnHtmlDataCellPrepared="gdvList_HtmlDataCellPrepared"
                                            OnCustomGroupDisplayText="gdvList_CustomGroupDisplayText"
                                            OnSummaryDisplayText="gdvList_SummaryDisplayText"
                                            OnDataBound="gdvList_DataBound"
                                            KeyFieldName="MESSAGEFOLDERID;MESSAGEID;MESSAGEFLAGS">
                                            <ClientSideEvents SelectionChanged="eni.LocalPage.gdvList_SelectionChanged"
                                                BeginCallback="eni.LocalPage.gdvList_BeginCallback"
                                                EndCallback="eni.LocalPage.gdvList_EndCallback" />
                                            <BorderTop BorderWidth="0px" />
                                            <BorderLeft BorderWidth="0px" />
                                            <BorderRight BorderWidth="0px" />
                                            <BorderBottom BorderWidth="0px" />
                                            <Styles>
                                                <AlternatingRow Enabled="False"></AlternatingRow>
                                            </Styles>
                                            <Settings   ShowFilterRow="false"
                                                        ShowFilterRowMenu="true"
                                                        ShowFilterRowMenuLikeItem="True" 
                                                        ShowHeaderFilterButton="True" 
                                                        ShowHeaderFilterBlankItems="true"
                                                        ShowGroupPanel="false" 
                                                        ShowGroupedColumns="True" 
                                                        ShowStatusBar="Hidden"
                                                        HorizontalScrollBarMode="Auto"
                                                        VerticalScrollBarMode="Auto" 
                                                        GridLines="Horizontal" />
                                            <SettingsBehavior AutoExpandAllGroups="true" ColumnResizeMode="NextColumn" AllowFixedGroups="false"/>
                                            <SettingsContextMenu Enabled="true"></SettingsContextMenu>
                                            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsPager Position="Bottom" PageSize="50" CurrentPageNumberFormat="{0}">
                                                <Summary Visible="false"/>
                                                <FirstPageButton Visible="true"></FirstPageButton>
                                                <LastPageButton Visible="true"></LastPageButton>
                                            </SettingsPager>
                                            <SettingsLoadingPanel Mode="Disabled" />
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="MESSAGEDATE" SummaryType="Count" />
                                            </GroupSummary>
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem FieldName="MESSAGEDATE" DisplayFormat="{1}" SummaryType="Count" />
                                                <dx:ASPxSummaryItem FieldName="MESSAGESIZE" DisplayFormat="{1}" SummaryType="Sum" />
                                            </TotalSummary> 
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" Width="25px" MinWidth="25" VisibleIndex="0" ShowInCustomizationForm="False" AllowDragDrop="False"
                                                    Name="ALLSELECT" ToolTip="메일 항목을 전체 선택합니다.">
                                                    <HeaderStyle VerticalAlign="Middle" CssClass="BorderLRClear" Wrap="True" Paddings-PaddingLeft="2px"></HeaderStyle>
                                                    <HeaderCaptionTemplate>
                                                        <dx:ASPxCheckBox ID="chkAllSelectRow" ClientInstanceName="chkAllSelectRow" runat="server" CssClass="Padding0" con="True" Cursor="pointer">
                                                            <ClientSideEvents CheckedChanged="eni.LocalPage.chkAllSelectRow_CheckedChanged" />
                                                        </dx:ASPxCheckBox> 
                                                    </HeaderCaptionTemplate>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="1" Name="MESSAGEFLAGEDCLASS" FieldName="MESSAGEFLAGEDCLASS" 
                                                    ReadOnly="True" Width="17px" MinWidth="17" ToolTip="중요 메일인지를 표시합니다.">
                                                    <Settings AllowGroup="False" ShowInFilterControl="False" ShowFilterRowMenuLikeItem="False" ShowFilterRowMenu="False" 
                                                    AllowHeaderFilter="False" AllowDragDrop="False" AllowAutoFilterTextInputTimer="False" AllowAutoFilter="False" />
                                                    <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding0LR"/>
                                                    <HeaderCaptionTemplate>
                                                        <span id="hdr_flagged" class="Icon Flagged CursorPoint DisplayBlock" title="중요 메일인지를 표시합니다." style="margin-left:1px;"></span>
                                                    </HeaderCaptionTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="2" Name="MESSAGEFLAGCLASS" FieldName="MESSAGEFLAGCLASS" 
                                                    ReadOnly="True" Width="25px" MinWidth="25" ToolTip="읽음/읽지않음을 표시합니다.">
                                                    <Settings AllowGroup="False" ShowInFilterControl="False" ShowFilterRowMenuLikeItem="False" ShowFilterRowMenu="False" 
                                                    AllowHeaderFilter="False" AllowDragDrop="False" AllowAutoFilterTextInputTimer="False" AllowAutoFilter="False" />
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="BorderRightClear Padding0LR"/>
                                                    <HeaderCaptionTemplate>
                                                        <span id="hdr_flag" title="읽음/읽지않음을 표시합니다." style="padding:0 0 0 3px; margin-bottom:1px; cursor:pointer;" class="Icon UnSeen DisplayBlock"></span>
                                                    </HeaderCaptionTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="3" Name="ATTACHFILECOUNT" FieldName="ATTACHFILECOUNT" 
                                                    ReadOnly="True" Width="15px" MinWidth="15" ToolTip="첨부파일이 있는지 여부를 표시합니다.">
                                                    <Settings AllowGroup="False" ShowInFilterControl="False" ShowFilterRowMenuLikeItem="False" ShowFilterRowMenu="False" 
                                                    AllowHeaderFilter="False" AllowDragDrop="False" AllowAutoFilterTextInputTimer="False" AllowAutoFilter="False" />
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="Padding0LR"/>
                                                    <HeaderCaptionTemplate>
                                                        <span id="hdr_attach" class="Icon Attachments CursorPoint DisplayBlock" title="첨부파일" style="margin-left:4px;"></span>
                                                    </HeaderCaptionTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="9" Name="MESSAGEFROMADDRESS" FieldName="MESSAGEFROMADDRESS" Caption="보낸이" 
                                                    ReadOnly="True" Width="130px" HeaderStyle-Font-Bold="true"
                                                    ToolTip="보낸사람이 누구인지를 표시합니다.">
                                                    <CellStyle ForeColor="#333"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="9" Name="MESSAGETOADDRESS" FieldName="MESSAGETOADDRESS" Caption="받는이" 
                                                    ReadOnly="True" Width="130px" HeaderStyle-Font-Bold="true"
                                                    ToolTip="받는사람이 누구인지를 표시합니다." Visible="false">
                                                    <CellStyle ForeColor="#333"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="10" Name="MESSAGESUBJECT" FieldName="MESSAGESUBJECT" Caption="제목" 
                                                    ReadOnly="True" Width="100%" MinWidth="200" HeaderStyle-Font-Bold="true"
                                                    ToolTip="메일의 제목을 표시합니다.">
                                                    <CellStyle ForeColor="#333"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn VisibleIndex="11" Name="MESSAGEDATE" FieldName="MESSAGEDATE" Caption="시간" 
                                                    ReadOnly="True" Width="140px" MinWidth="140" CellStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true"
                                                    ToolTip="메일을 받은시간을 표시합니다." GroupIndex="0" SortOrder="Descending">
                                                    <CellStyle ForeColor="#828282"></CellStyle>
                                                    <Settings GroupInterval="Date" />
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="12" FieldName="MESSAGESIZE" Caption="크기" 
                                                    ReadOnly="True" Width="80px" MinWidth="80" HeaderStyle-Font-Bold="true"
                                                    ToolTip="메일의 크기를 표시합니다.">
                                                    <CellStyle HorizontalAlign="Right" ForeColor="#828282"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn VisibleIndex="13" Name="SENDSTATUSNAME" FieldName="SENDSTATUSNAME" Caption="상태" 
                                                    ToolTip="메일의 상태를 표시합니다." ReadOnly="True" Width="100px" MinWidth="100" Visible="false">
                                                    <HeaderStyle Font-Bold="true" />
                                                    <CellStyle HorizontalAlign="Center"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn VisibleIndex="14" Name="RECIPIENTDATE" FieldName="RECIPIENTDATE" Caption="확인시간" 
                                                    ReadOnly="True" Width="140px" MinWidth="140" ToolTip="받은사람의 확인시간을 표시합니다." Visible="false">
                                                    <HeaderStyle Font-Bold="true" />
                                                    <CellStyle ForeColor="#828282" HorizontalAlign="Center"></CellStyle>
                                                </dx:GridViewDataDateColumn>
                                            </Columns>
                                        </eni:eniGridView>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane Name="ReadPane" Separator-Size="3px"
                                Separator-SeparatorStyle-BackColor="#F6F6F6"
                                Separator-SeparatorStyle-HoverStyle-BackColor="#E7E7E7"
                                Separator-SeparatorStyle-BorderLeft-BorderWidth="1px"
                                Separator-SeparatorStyle-BorderLeft-BorderStyle="Solid"
                                Separator-SeparatorStyle-BorderLeft-BorderColor="#E6E6E6"
                                Separator-SeparatorStyle-BorderRight-BorderWidth="1px"
                                Separator-SeparatorStyle-BorderRight-BorderStyle="Solid"
                                Separator-SeparatorStyle-BorderRight-BorderColor="#C0C0C0"
                                Separator-ButtonStyle-CssClass="Height100f" ShowSeparatorImage="False" Visible="false">
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                        <eni:eniCallbackPanel ID="cbpRedView" ClientInstanceName="cbpRedView" runat="server"
                                            Width="100%" Height="100%" EnableCallbackAnimation="false" 
                                            SettingsLoadingPanel-Enabled="false">
                                            <PanelCollection>
                                                <dx:PanelContent ID="pnReadView">
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </eni:eniCallbackPanel>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                        </Panes>
                    </dx:SplitterPane>
                </Panes>
            </eni:eniSplitter>
        </div>
    </div>

    <%-- 메일 쓰기 팝업 컨트롤 --%>
    <eni:eniPopupControl ID="popWrite" ClientInstanceName="popWrite" SkinID="MailWrite" runat="server"
        AllowResize="false" CloseAction="CloseButton" PopupAnimationType="Fade" CloseAnimationType="Fade" PopupHorizontalOffset="231" PopupVerticalOffset="71"
        ShowHeader="false" ShowFooter="false" ShowShadow="false" ScrollBars="Auto" LoadContentViaCallback="OnPageLoad">
        <ClientSideEvents Init="eni.LocalPage.popWrite_Init"
                            BeginCallback="eni.LocalPage.popWrite_BeginCallback"
                            EndCallback="eni.LocalPage.popWrite_EndCallback"
                            Shown="eni.LocalPage.popWrite_Shown" />
        <SettingsLoadingPanel Enabled="false" />
        <Border BorderWidth="0px" />
        <ContentStyle>
            <Paddings PaddingLeft="10px" PaddingRight="10px" PaddingTop="5px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="win_write" runat="server">
                <ul class="con_header">
                    <li id="con_to_addr" class="con_to_addr item">
                        <label for="to_addr-tokenfield" class="title" title='<%= GetResource("CSTRESX00069")%>'><%= GetResource("CSTRESX00069")%></label>
                        <div class="field" style="padding-right:225px;">
                            <input id="to_addr" type="text" class="tokenfield form-control input-sm" tabindex="-1" style="width:100%" placeholder='<%= GetResource("CSTRESX00070")%>'/>
                            <div class="option" style="width:220px; top:6px;">
                                <eni:eniButton ID="btnContactTo" ClientInstanceName="btnContactTo" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT"
                                    Height="26px" Font-Size="11px" Text='<%# GetResource("CSTRESX00071") %>' ToolTip='<%# GetResource("CSTRESX00072") %>' tabindex="-1">
                                    <ClientSideEvents Click="eni.LocalPage.btnContact_Click" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                                <eni:eniButton ID="btnContactToClear" ClientInstanceName="btnContactToClear" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT" ClientEnabled="false"
                                    Height="26px" Font-Size="11px" Text='<%# GetResource("CSTRESX00073") %>' ToolTip='<# GetResource("CSTRESX00074") %>' tabindex="-1">
                                    <ClientSideEvents Click="function(s, e) { tkbToAddr.ClearTokenCollection(); s.SetEnabled(false); }" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                                <eni:eniCheckBox ID="chkIndividul" ClientInstanceName="chkIndividul" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                                    Text='<%# GetResource("CSTRESX00075") %>' ToolTip='<%# GetResource("CSTRESX00076") %>' style="margin-top:5px;" tabindex="-1">
                                </eni:eniCheckBox>
                            </div>
                        </div>
                    </li>
                    <li id="con_cc_addr" class="con_cc_addr item">
                        <label for="cc_addr-tokenfield" class="title" title='<%= GetResource("CSTRESX00077") %>'><%= GetResource("CSTRESX00077") %></label>
                        <div class="field" style="padding-right:150px;">
                            <span action="addr" class="Icon6 Expand expand_btn" title='<%= GetResource("CSTRESX00078") %>' tabindex="-1"></span>
                            <input id="cc_addr" type="text" class="tokenfield form-control input-sm" placeholder='<%= GetResource("CSTRESX00079") %>' tabindex="-1" style="width:100%"/>
                            <div class="option" style="width:145px; top:6px;">
                                <eni:eniButton ID="btnContactCc" ClientInstanceName="btnContactCc" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT"
                                    Height="26px" Font-Size="11px" Text='<%# GetResource("CSTRESX00071") %>' ToolTip='<%# GetResource("CSTRESX00080") %>' tabindex="-1">
                                    <ClientSideEvents Click="eni.LocalPage.btnContact_Click" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                                <eni:eniButton ID="btnContactCcClear" ClientInstanceName="btnContactCcClear" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT" ClientEnabled="false"
                                    Height="26px" Font-Size="11px" Text='<%# GetResource("CSTRESX00073") %>' ToolTip='<%# GetResource("CSTRESX00081") %>' tabindex="-1">
                                    <ClientSideEvents Click="function(s, e) { tkbCcAddr.ClearTokenCollection(); s.SetEnabled(false); }" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                            </div>
                        </div>
                    </li>
                    <li id="con_bcc_addr" class="con_bcc_addr item">
                        <label for="bcc_addr-tokenfield" class="title" title='<%= GetResource("CSTRESX00082") %>'><%= GetResource("CSTRESX00082") %></label>
                        <div class="field" style="padding-right:150px;">
                            <input id="bcc_addr" type="text" class="tokenfield form-control input-sm" placeholder='<%= GetResource("CSTRESX00083") %>' tabindex="-1" style="width:100%"/>
                            <div class="option" style="width:145px; top:6px;">
                                <eni:eniButton ID="btnContactBcc" ClientInstanceName="btnContactBcc" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT"
                                    Height="19px" Font-Size="11px" Text='<%# GetResource("CSTRESX00071") %>' ToolTip='<%# GetResource("CSTRESX00084") %>' tabindex="-1">
                                    <ClientSideEvents Click="eni.LocalPage.btnContact_Click" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                                <eni:eniButton ID="btnContactBccClear" ClientInstanceName="btnContactBccClear" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT" ClientEnabled="false"
                                    Height="19px" Font-Size="11px" Text='<%# GetResource("CSTRESX00073") %>' ToolTip='<%# GetResource("CSTRESX00085") %>' tabindex="-1">
                                    <ClientSideEvents Click="function(s, e) { tkbBccAddr.ClearTokenCollection(); s.SetEnabled(false); }" />
                                    <Paddings PaddingTop="4px" />
                                </eni:eniButton>
                            </div>
                        </div>
                    </li>
                    <li id="con_subject" class="con_subject item">
                        <label class="title" onclick="txtSubject.Focus()" title='<%= GetResource("CSTRESX00086") %>'><%= GetResource("CSTRESX00086") %></label>
                        <div class="field" style="padding-right:225px;">
                            <%--<ClientSideEvents TextChanged="function(s, e){ if (tmAutoSave.GetEnabled() === false) { tmAutoSave.SetEnabled(true); } lgBlnFlgChgValue = true }" />--%>
                            <eni:eniTextBox ID="txtSubject" ClientInstanceName="txtSubject" SkinID="LightDark" runat="server" CssClass="form-control input-sm"
                                Width="100%" NullText='<%# GetResource("CSTRESX00087") %>'>
                                <FocusedStyle CssClass="focus"></FocusedStyle>
                                <ClientSideEvents ValueChanged="function(s, e){ lgBlnFlgChgValue = true; }" />
                            </eni:eniTextBox>
                            <div class="option" style="width:220px; top:6px;">
                                <eni:eniComboBox ID="cboLang" ClientInstanceName="cboLang" runat="server" Width="75px" SkinID="LightDark" CssClass="DisplayInlineBlock"
                                    NullText='<%# GetGlobalResource("GCTRRESX10088") %>' ToolTip='<%# GetGlobalResource("GCTRRESX10089") %>' IncrementalFilteringMode="None">
                                    <ClientSideEvents ValueChanged="function(s, e){ lgBlnFlgChgValue = true; }" />
                                    <Items>
                                        <dx:ListEditItem Value="KO" Text="한글" />
                                        <dx:ListEditItem Value="EN" Text="영문" />
                                        <dx:ListEditItem Value="CN" Text="중문" />
                                        <dx:ListEditItem Value="JP" Text="일어" />
                                    </Items>
                                </eni:eniComboBox>
                                <eni:eniCheckBox ID="chkNotice" ClientInstanceName="chkNotice" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                                    Text='<%# GetResource("CSTRESX00088") %>' ToolTip='<%# GetResource("CSTRESX00089") %>' CheckState="Unchecked" style="margin-top:5px;" tabindex="-1">
                                    <ClientSideEvents ValueChanged="function(s, e){ lgBlnFlgChgValue = true; }" />
                                </eni:eniCheckBox>
                                <eni:eniCheckBox ID="chkImportant" ClientInstanceName="chkImportant" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                                    Text='<%# GetResource("CSTRESX00090") %>' ToolTip='<%# GetResource("CSTRESX00091") %>' CheckState="Unchecked" style="margin-top:5px;" tabindex="-1">
                                    <ClientSideEvents ValueChanged="function(s, e){ lgBlnFlgChgValue = true; }" />
                                </eni:eniCheckBox>
                            </div>
                        </div>
                    </li>
                    <li id="con_attach" class="con_attach item">
                        <span class="title" title='<%= GetResource("CSTRESX00092") %>'><%= GetResource("CSTRESX00092") %></span>
                        <div class="field" style="padding-right:150px;">
                            <span action="attachment" class="Icon6 Expand expand_btn" title='<%= GetResource("CSTRESX00093") %>'></span>
                            <eni:eniFileUpload ID="upcAttachment" ClientInstanceName="upcAttachment" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                                UploadMode="Standard"
                                OnFileUploadComplete="upcAttachment_FileUploadComplete"
                                AdvancedModeSettings-EnableMultiSelect="true"
                                ValidationSettings-AllowedFileExtensions=".*"
                                ValidationSettings-MaxFileSize="6442450944" AutoStartUpload="True" 
                                Font-Size="11px" BrowseButton-Text="내 PC" style="padding-top:2px;">
                                <ClientSideEvents FileUploadStart="eni.LocalPage.upcAttachment_FileUploadStart"
                                    FileUploadComplete="eni.LocalPage.upcAttachment_FileUploadComplete"
                                    FilesUploadComplete="eni.LocalPage.upcAttachment_FilesUploadComplete"
                                    UploadingProgressChanged="eni.LocalPage.upcAttachment_UploadingProgressChanged" />
                            </eni:eniFileUpload>
                            <eni:eniButton ID="btnAttachFromWebHard" ClientInstanceName="btnAttachFromWebHard" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT"
                                    AutoPostBack="false" Height="22px" Font-Size="11px" style="margin-top:2px;" Visible="false"
                                    Text='<%# GetResource("CSTRESX00099") %>' ToolTip='<%# GetResource("CSTRESX00099") %>'>
                                    <ClientSideEvents Click="eni.LocalPage.btnAttachFromWebHard_Click" />
                                </eni:eniButton>
                            <eni:eniButton ID="btnAttachFileDel" ClientInstanceName="btnAttachFileDel" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock VerticalAlignT"
                                AutoPostBack="false" Height="22px" Font-Size="11px" style="margin-top:2px;"
                                Text='<%# GetResource("CSTRESX00100") %>' ToolTip='<%# GetResource("CSTRESX00101") %>' ClientEnabled="false">
                                <ClientSideEvents Click="eni.LocalPage.btnAttachFileDel_Click" />
                            </eni:eniButton>
                            <div class="option" style="width:145px; top:3px; display:none;">
                                <eni:eniProgressBar ID="prbTotFileSize" ClientInstanceName="prbTotFileSize" runat="server"
                                    Width="100px" Visible="false">
                                </eni:eniProgressBar>
                                <eni:eniLabel runat="server" Text="파일첨부 수량 0/0" ForeColor="Red"></eni:eniLabel>
                            </div>
                        </div>
                    </li>
                    <li id="con_attach_list" class="con_attach_list item" style="display:none">
                        <div class="field">
                            <eni:eniGridView ID="gdvAttachList" ClientInstanceName="gdvAttachList" SkinID="Advanced-01" runat="server"
                                KeyFieldName="temp_file_name" Style="margin-bottom: 5px;"
                                OnHtmlRowPrepared="gdvAttachList_HtmlRowPrepared"
                                OnCustomCallback="gdvAttachList_CustomCallback"
                                SettingsText-EmptyDataRow='<%# GetResource("CSTRESX00102") %>'>
                                <ClientSideEvents BeginCallback="eni.LocalPage.gdvAttachList_BeginCallback"
                                                    EndCallback="eni.LocalPage.gdvAttachList_EndCallback" />
                                <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" />
                                <Styles>
                                    <AlternatingRow Enabled="True"></AlternatingRow>
                                </Styles>
                                <Settings ShowColumnHeaders="false"
                                    ShowFilterRow="false"
                                    ShowFilterRowMenu="false"
                                    ShowFilterRowMenuLikeItem="false"
                                    ShowHeaderFilterButton="false"
                                    ShowHeaderFilterBlankItems="false"
                                    ShowGroupPanel="false"
                                    ShowGroupedColumns="false"
                                    ShowFooter="false"
                                    ShowStatusBar="Hidden"
                                    HorizontalScrollBarMode="Hidden"
                                    VerticalScrollBarMode="Auto"
                                    VerticalScrollableHeight="100"
                                    GridLines="Horizontal" />
                                <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" ColumnResizeMode="Disabled" />
                                <SettingsContextMenu Enabled="false"></SettingsContextMenu>
                                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                                <SettingsSearchPanel Visible="false" />
                                <SettingsLoadingPanel Mode="Disabled" />
                                <SettingsPager Visible="false" Mode="ShowAllRecords" ShowEmptyDataRows="true"></SettingsPager>
                                <Columns>
                                    <dx:GridViewCommandColumn Name="ALLSELECT" Caption="선택" ShowSelectCheckbox="true" Visible="true" VisibleIndex="0" Width="30px">
                                        <HeaderTemplate>
                                            <dx:ASPxCheckBox ID="chkAllSelectFiles" runat="server" CssClass="Padding0" Wrap="True" Cursor="pointer">
                                                <ClientSideEvents CheckedChanged="function(s, e){gdvAttachList.SelectAllRowsOnPage(s.GetChecked());}" />
                                            </dx:ASPxCheckBox>
                                        </HeaderTemplate>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="파일명" ToolTip="업로드된 파일명을 확인합니다." Name="file_name" FieldName="file_name" VisibleIndex="1" ReadOnly="True" Width="100%" MinWidth="200">
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Middle"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="확장자" ToolTip="업로드된 파일 확장자를 확인합니다." Name="file_extantion" FieldName="file_extantion" VisibleIndex="2" ReadOnly="True"
                                        Width="50px" MinWidth="140" CellStyle-HorizontalAlign="Center">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="업로드 타입" ToolTip="업로드된 파일이 일판첨부인지 대용량첨부인지를 확인합니다." Name="upload_type" FieldName="upload_type" VisibleIndex="3" ReadOnly="True"
                                        Width="80px" MinWidth="80" CellStyle-HorizontalAlign="Center">
                                        <DataItemTemplate>
                                            <div class="OverHidden VerticalAlignCM Width100f" title='<%# Eval("upload_type").ToString() == "General" ? GetResource("CSTRESX00113") : GetResource("CSTRESX00114") %>'><%# Eval("upload_type").ToString() == "General" ? GetResource("CSTRESX00113") : GetResource("CSTRESX00114")%></div>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="다운로드 가능기간" ToolTip="대용량 첨부의 경우 다운로드 기간이 설정됩니다." Name="down_period" FieldName="down_period" VisibleIndex="4" ReadOnly="True"
                                        Width="170px" MinWidth="170" CellStyle-HorizontalAlign="Center">
                                        <DataItemTemplate>
                                            <div class="OverHidden VerticalAlignCM Width100f" title='<%# Eval("down_period")%>'><%# Eval("down_period")%></div>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="용량" ToolTip="업로드된 파일의 용량을 확인합니다." Name="custom_file_size" FieldName="custom_file_size" Visible="true" VisibleIndex="5"
                                        Width="90px" MinWidth="90" CellStyle-Paddings-PaddingRight="10px" CellStyle-HorizontalAlign="Right">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </eni:eniGridView>
                        </div>
                    </li>
                </ul>
                <div id="con_content" class="con_content">
                    <div id="con_auto_save_msg" class="con_auto_save_msg">
                        <span id="autoSaveMsg"></span>
                    </div>
                    <!-- SE2 Markup Start -->	
                    <div id="smart_editor2">
	                    <div id="smart_editor2_content"><a href="#se2_iframe" class="blind">글쓰기영역으로 바로가기</a>
		                    <div class="se2_tool" id="se2_tool">
			                    <div class="se2_text_tool husky_seditor_text_tool">
			                        <ul class="se2_font_type">
				                        <li class="husky_seditor_ui_fontName"><button type="button" class="se2_font_family" title="<%= GetGlobalResource("GCTRRESX10000")%>"><span class="husky_se2m_current_fontName"><%= GetGlobalResource("GCTRRESX10000")%></span></button>
					                        <!-- 글꼴 레이어 -->
					                        <div class="se2_layer husky_se_fontName_layer">
						                        <div class="se2_in_layer">
							                        <ul class="se2_l_font_fam">
							                            <li style="display:none"><button type="button"><span>@DisplayName@<span>(</span><em style="font-family:FontFamily;">@SampleText@</em><span>)</span></span></button></li>
							                            <li class="se2_division husky_seditor_font_separator"></li>
							                            <li><button type="button"><span><%= GetGlobalResource("GCTRRESXFONT1")%><span>(</span><em style="font-family:<%= GetGlobalResource("GCTRRESXFONTFM1")%>;"><%= GetGlobalResource("GCTRRESX10001")%></em><span>)</span></span></button></li>
							                            <li><button type="button"><span><%= GetGlobalResource("GCTRRESXFONT2")%><span>(</span><em style="font-family:<%= GetGlobalResource("GCTRRESXFONTFM2")%>;"><%= GetGlobalResource("GCTRRESX10001")%></em><span>)</span></span></button></li>
							                            <li><button type="button"><span><%= GetGlobalResource("GCTRRESXFONT3")%><span>(</span><em style="font-family:<%= GetGlobalResource("GCTRRESXFONTFM3")%>;"><%= GetGlobalResource("GCTRRESX10001")%></em><span>)</span></span></button></li>
							                            <li><button type="button"><span><%= GetGlobalResource("GCTRRESXFONT4")%><span>(</span><em style="font-family:<%= GetGlobalResource("GCTRRESXFONTFM4")%>;"><%= GetGlobalResource("GCTRRESX10001")%></em><span>)</span></span></button></li>
							                            <li><button type="button"><span><%= GetGlobalResource("GCTRRESXFONT5")%><span>(</span><em style="font-family:<%= GetGlobalResource("GCTRRESXFONTFM5")%>;"><%= GetGlobalResource("GCTRRESX10001")%></em><span>)</span></span></button></li>
							                        </ul>
						                        </div>
					                        </div>
					                        <!-- //글꼴 레이어 -->
				                        </li>
				                        <li class="husky_seditor_ui_fontSize"><button type="button" class="se2_font_size" title="<%= GetGlobalResource("GCTRRESX10002")%>"><span class="husky_se2m_current_fontSize">11pt</span></button>
					                        <!-- 폰트 사이즈 레이어 -->
					                        <div class="se2_layer husky_se_fontSize_layer">
						                        <div class="se2_in_layer">
							                        <ul class="se2_l_font_size">
							                            <li><button type="button"><span style="margin-top:4px; margin-bottom:3px; margin-left:5px; font-size:7pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style=" font-size:7pt;">(7pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:2px; font-size:8pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="font-size:8pt;">(8pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:1px; font-size:9pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="font-size:9pt;">(9pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:1px; font-size:10pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="font-size:10pt;">(10pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:2px; font-size:11pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="font-size:11pt;">(11pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:1px; font-size:12pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="font-size:12pt;">(12pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:2px; font-size:14pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="margin-left:6px;font-size:14pt;">(14pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-bottom:1px; font-size:18pt;"><%= GetGlobalResource("GCTRRESX10003")%><span style="margin-left:8px;font-size:18pt;">(18pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-left:3px; font-size:24pt;"><%= GetGlobalResource("GCTRRESX10004")%><span style="margin-left:11px;font-size:24pt;">(24pt)</span></span></button></li>
							                            <li><button type="button"><span style="margin-top:-1px; margin-left:3px; font-size:36pt;"><%= GetGlobalResource("GCTRRESX10005")%><span style="font-size:36pt;">(36pt)</span></span></button></li>
							                        </ul>
						                        </div>
					                        </div>
					                        <!-- //폰트 사이즈 레이어 -->
				                        </li>
                                    </ul>
                                    <ul>
				                        <li class="husky_seditor_ui_bold first_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10006")%>" class="se2_bold"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10006")%></span></button></li>
				                        <li class="husky_seditor_ui_underline"><button type="button" title="<%= GetGlobalResource("GCTRRESX10007")%>" class="se2_underline"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10007")%></span></button></li>
				                        <li class="husky_seditor_ui_italic"><button type="button" title="<%= GetGlobalResource("GCTRRESX10008")%>" class="se2_italic"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10008")%></span></button></li>
				                        <li class="husky_seditor_ui_lineThrough"><button type="button" title="<%= GetGlobalResource("GCTRRESX10009")%>" class="se2_tdel"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10009")%></span></button></li>
				                        <li class="se2_pair husky_seditor_ui_fontColor"><span class="selected_color husky_se2m_fontColor_lastUsed" style="background-color:#4477f9"></span><span class="husky_seditor_ui_fontColorA"><button type="button" title="<%= GetGlobalResource("GCTRRESX10010")%>" class="se2_fcolor"><span><%= GetGlobalResource("GCTRRESX10010")%></span></button></span><span class="husky_seditor_ui_fontColorB"><button type="button" title="<%= GetGlobalResource("GCTRRESX10011")%>" class="se2_fcolor_more"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10011")%></span></button></span>				
					                        <!-- 글자색 -->
					                        <div class="se2_layer husky_se2m_fontcolor_layer" style="display:none">
						                        <div class="se2_in_layer husky_se2m_fontcolor_paletteHolder">
							                        <div class="se2_palette husky_se2m_color_palette">
								                        <ul class="se2_pick_color">
								                            <li><button type="button" title="#ff0000" style="background:#ff0000"><span><span>#ff0000</span></span></button></li>
								                            <li><button type="button" title="#ff6c00" style="background:#ff6c00"><span><span>#ff6c00</span></span></button></li>
								                            <li><button type="button" title="#ffaa00" style="background:#ffaa00"><span><span>#ffaa00</span></span></button></li>
								                            <li><button type="button" title="#ffef00" style="background:#ffef00"><span><span>#ffef00</span></span></button></li>
								                            <li><button type="button" title="#a6cf00" style="background:#a6cf00"><span><span>#a6cf00</span></span></button></li>
								                            <li><button type="button" title="#009e25" style="background:#009e25"><span><span>#009e25</span></span></button></li>
								                            <li><button type="button" title="#00b0a2" style="background:#00b0a2"><span><span>#00b0a2</span></span></button></li>
								                            <li><button type="button" title="#0075c8" style="background:#0075c8"><span><span>#0075c8</span></span></button></li>
								                            <li><button type="button" title="#3a32c3" style="background:#3a32c3"><span><span>#3a32c3</span></span></button></li>
								                            <li><button type="button" title="#7820b9" style="background:#7820b9"><span><span>#7820b9</span></span></button></li>
								                            <li><button type="button" title="#ef007c" style="background:#ef007c"><span><span>#ef007c</span></span></button></li>
								                            <li><button type="button" title="#000000" style="background:#000000"><span><span>#000000</span></span></button></li>
								                            <li><button type="button" title="#252525" style="background:#252525"><span><span>#252525</span></span></button></li>
								                            <li><button type="button" title="#464646" style="background:#464646"><span><span>#464646</span></span></button></li>
								                            <li><button type="button" title="#636363" style="background:#636363"><span><span>#636363</span></span></button></li>
								                            <li><button type="button" title="#7d7d7d" style="background:#7d7d7d"><span><span>#7d7d7d</span></span></button></li>
								                            <li><button type="button" title="#9a9a9a" style="background:#9a9a9a"><span><span>#9a9a9a</span></span></button></li>
								                            <li><button type="button" title="#ffe8e8" style="background:#ffe8e8"><span><span>#9a9a9a</span></span></button></li>
								                            <li><button type="button" title="#f7e2d2" style="background:#f7e2d2"><span><span>#f7e2d2</span></span></button></li>
								                            <li><button type="button" title="#f5eddc" style="background:#f5eddc"><span><span>#f5eddc</span></span></button></li>
								                            <li><button type="button" title="#f5f4e0" style="background:#f5f4e0"><span><span>#f5f4e0</span></span></button></li>
								                            <li><button type="button" title="#edf2c2" style="background:#edf2c2"><span><span>#edf2c2</span></span></button></li>
								                            <li><button type="button" title="#def7e5" style="background:#def7e5"><span><span>#def7e5</span></span></button></li>
								                            <li><button type="button" title="#d9eeec" style="background:#d9eeec"><span><span>#d9eeec</span></span></button></li>
								                            <li><button type="button" title="#c9e0f0" style="background:#c9e0f0"><span><span>#c9e0f0</span></span></button></li>
								                            <li><button type="button" title="#d6d4eb" style="background:#d6d4eb"><span><span>#d6d4eb</span></span></button></li>
								                            <li><button type="button" title="#e7dbed" style="background:#e7dbed"><span><span>#e7dbed</span></span></button></li>
								                            <li><button type="button" title="#f1e2ea" style="background:#f1e2ea"><span><span>#f1e2ea</span></span></button></li>
								                            <li><button type="button" title="#acacac" style="background:#acacac"><span><span>#acacac</span></span></button></li>
								                            <li><button type="button" title="#c2c2c2" style="background:#c2c2c2"><span><span>#c2c2c2</span></span></button></li>
								                            <li><button type="button" title="#cccccc" style="background:#cccccc"><span><span>#cccccc</span></span></button></li>
								                            <li><button type="button" title="#e1e1e1" style="background:#e1e1e1"><span><span>#e1e1e1</span></span></button></li>
								                            <li><button type="button" title="#ebebeb" style="background:#ebebeb"><span><span>#ebebeb</span></span></button></li>
								                            <li><button type="button" title="#ffffff" style="background:#ffffff"><span><span>#ffffff</span></span></button></li>
								                        </ul>
								                        <ul class="se2_pick_color" style="width:156px;">
								                            <li><button type="button" title="#e97d81" style="background:#e97d81"><span><span>#e97d81</span></span></button></li>
								                            <li><button type="button" title="#e19b73" style="background:#e19b73"><span><span>#e19b73</span></span></button></li>
								                            <li><button type="button" title="#d1b274" style="background:#d1b274"><span><span>#d1b274</span></span></button></li>
								                            <li><button type="button" title="#cfcca2" style="background:#cfcca2"><span><span>#cfcca2</span></span></button></li>
								                            <li><button type="button" title="#cfcca2" style="background:#cfcca2"><span><span>#cfcca2</span></span></button></li>
								                            <li><button type="button" title="#61b977" style="background:#61b977"><span><span>#61b977</span></span></button></li>
								                            <li><button type="button" title="#53aea8" style="background:#53aea8"><span><span>#53aea8</span></span></button></li>
								                            <li><button type="button" title="#518fbb" style="background:#518fbb"><span><span>#518fbb</span></span></button></li>
								                            <li><button type="button" title="#6a65bb" style="background:#6a65bb"><span><span>#6a65bb</span></span></button></li>
								                            <li><button type="button" title="#9a54ce" style="background:#9a54ce"><span><span>#9a54ce</span></span></button></li>
								                            <li><button type="button" title="#e573ae" style="background:#e573ae"><span><span>#e573ae</span></span></button></li>
								                            <li><button type="button" title="#5a504b" style="background:#5a504b"><span><span>#5a504b</span></span></button></li>
								                            <li><button type="button" title="#767b86" style="background:#767b86"><span><span>#767b86</span></span></button></li>
								                            <li><button type="button" title="#951015" style="background:#951015"><span><span>#951015</span></span></button></li>
								                            <li><button type="button" title="#6e391a" style="background:#6e391a"><span><span>#6e391a</span></span></button></li>
								                            <li><button type="button" title="#785c25" style="background:#785c25"><span><span>#785c25</span></span></button></li>
								                            <li><button type="button" title="#5f5b25" style="background:#5f5b25"><span><span>#5f5b25</span></span></button></li>
								                            <li><button type="button" title="#4c511f" style="background:#4c511f"><span><span>#4c511f</span></span></button></li>
								                            <li><button type="button" title="#1c4827" style="background:#1c4827"><span><span>#1c4827</span></span></button></li>
								                            <li><button type="button" title="#0d514c" style="background:#0d514c"><span><span>#0d514c</span></span></button></li>
								                            <li><button type="button" title="#1b496a" style="background:#1b496a"><span><span>#1b496a</span></span></button></li>
								                            <li><button type="button" title="#2b285f" style="background:#2b285f"><span><span>#2b285f</span></span></button></li>
								                            <li><button type="button" title="#45245b" style="background:#45245b"><span><span>#45245b</span></span></button></li>
								                            <li><button type="button" title="#721947" style="background:#721947"><span><span>#721947</span></span></button></li>
								                            <li><button type="button" title="#352e2c" style="background:#352e2c"><span><span>#352e2c</span></span></button></li>
								                            <li><button type="button" title="#3c3f45" style="background:#3c3f45"><span><span>#3c3f45</span></span></button></li>
								                        </ul>
								                        <button type="button" title="<%= GetGlobalResource("GCTRRESX10011")%>" class="se2_view_more husky_se2m_color_palette_more_btn"><span><%= GetGlobalResource("GCTRRESX10011")%></span></button>
								                        <div class="husky_se2m_color_palette_recent" style="display:none">
									                        <h4><%= GetGlobalResource("GCTRRESX10012")%></h4>
									                        <ul class="se2_pick_color">
									                        <li></li>
									                        <!-- 최근 사용한 색 템플릿 -->
									                        <!-- <li><button type="button" title="#e97d81" style="background:#e97d81"><span><span>#e97d81</span></span></button></li> -->
									                        <!-- //최근 사용한 색 템플릿 -->
									                        </ul>
								                        </div>								
								                        <div class="se2_palette2 husky_se2m_color_palette_colorpicker">
									                        <!--form action="http://test.emoticon.naver.com/colortable/TextAdd.nhn" method="post"-->
										                        <div class="se2_color_set">
											                        <span class="se2_selected_color"><span class="husky_se2m_cp_preview" style="background:#e97d81"></span></span><input type="text" name="" class="input_ty1 husky_se2m_cp_colorcode" value="#e97d81"><button type="button" class="se2_btn_insert husky_se2m_color_palette_ok_btn" title="<%= GetGlobalResource("GCTRRESX10013")%>"><span><%= GetGlobalResource("GCTRRESX10013")%></span></button></div>
										                        <!--input type="hidden" name="callback" value="http://test.emoticon.naver.com/colortable/result.jsp" />
										                        <input type="hidden" name="callback_func" value="1" />
										                        <input type="hidden" name="text_key" value="" />
										                        <input type="hidden" name="text_data" value="" />
									                        </form-->
									                        <div class="se2_gradation1 husky_se2m_cp_colpanel"></div>
									                        <div class="se2_gradation2 husky_se2m_cp_huepanel"></div>
								                        </div>
							                        </div>
                                                </div>
					                        </div>
                                            <!-- //글자색 -->
				                        </li>
				                        <li class="se2_pair husky_seditor_ui_BGColor"><span class="selected_color husky_se2m_BGColor_lastUsed" style="background-color:#4477f9"></span><span class="husky_seditor_ui_BGColorA"><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>" class="se2_bgcolor"><span><%= GetGlobalResource("GCTRRESX10014")%></span></button></span><span class="husky_seditor_ui_BGColorB"><button type="button" title="<%= GetGlobalResource("GCTRRESX10011")%>" class="se2_bgcolor_more"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10011")%></span></button></span>
					                        <!-- 배경색 -->
					                        <div class="se2_layer se2_layer husky_se2m_BGColor_layer" style="display:none">
						                        <div class="se2_in_layer">
							                        <div class="se2_palette_bgcolor">
								                        <ul class="se2_background husky_se2m_bgcolor_list">
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#ff0000 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#ff0000; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>								
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#6d30cf <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#6d30cf; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#000000 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#000000; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#ff6600 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#ff6600; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#3333cc <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#3333cc; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#333333 <%= GetGlobalResource("GCTRRESX10015")%>#ffff00" style="background:#333333; color:#ffff00"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#ffa700 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#ffa700; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#009999 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#009999; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#8e8e8e <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#8e8e8e; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>								
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#cc9900 <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#cc9900; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#77b02b <%= GetGlobalResource("GCTRRESX10015")%>#ffffff" style="background:#77b02b; color:#ffffff"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                            <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10014")%>#ffffff <%= GetGlobalResource("GCTRRESX10015")%>#000000" style="background:#ffffff; color:#000000"><span><span><%= GetGlobalResource("GCTRRESX10005")%></span></span></button></li>
								                        </ul>
							                        </div>
							                        <div class="husky_se2m_BGColor_paletteHolder"></div>
                                                </div>
					                        </div>
                                            <!-- //배경색 -->
				                        </li>
				                        <li class="husky_seditor_ui_superscript"><button type="button" title="<%= GetGlobalResource("GCTRRESX10016")%>" class="se2_sup"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10016")%></span></button></li>
				                        <li class="husky_seditor_ui_subscript last_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10017")%>" class="se2_sub"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10017")%></span></button></li>
                                    </ul>
                                    <ul>
				                        <li class="husky_seditor_ui_justifyleft first_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10018")%>" class="se2_left"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10018")%></span></button></li>
				                        <li class="husky_seditor_ui_justifycenter"><button type="button" title="<%= GetGlobalResource("GCTRRESX10019")%>" class="se2_center"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10019")%></span></button></li>
				                        <li class="husky_seditor_ui_justifyright"><button type="button" title="<%= GetGlobalResource("GCTRRESX10020")%>" class="se2_right"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10020")%></span></button></li>
				                        <li class="husky_seditor_ui_justifyfull"><button type="button" title="<%= GetGlobalResource("GCTRRESX10021")%>" class="se2_justify"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10021")%></span></button></li>
				                        <li class="husky_seditor_ui_orderedlist"><button type="button" title="<%= GetGlobalResource("GCTRRESX10022")%>" class="se2_ol"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10022")%></span></button></li>
				                        <li class="husky_seditor_ui_unorderedlist"><button type="button" title="<%= GetGlobalResource("GCTRRESX10023")%>" class="se2_ul"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10023")%></span></button></li>
				                        <li class="husky_seditor_ui_outdent"><button type="button" title="<%= GetGlobalResource("GCTRRESX10024")%>" class="se2_outdent"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10024")%></span></button></li>
				                        <li class="husky_seditor_ui_indent"><button type="button" title="<%= GetGlobalResource("GCTRRESX10025")%>" class="se2_indent"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10025")%></span></button></li>			
				                        <li class="husky_seditor_ui_lineHeight last_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10026")%>" class="se2_lineheight" ><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10026")%></span></button>
					                        <!-- 줄간격 레이어 -->
					                        <div class="se2_layer husky_se2m_lineHeight_layer">
						                        <div class="se2_in_layer">
							                        <ul class="se2_l_line_height">
							                            <li><button type="button"><span>50%</span></button></li>
							                            <li><button type="button"><span>80%</span></button></li>
							                            <li><button type="button"><span>100%</span></button></li>
							                            <li><button type="button"><span>120%</span></button></li>
							                            <li><button type="button"><span>150%</span></button></li>
							                            <li><button type="button"><span>180%</span></button></li>
							                            <li><button type="button"><span>200%</span></button></li>
							                        </ul>
							                        <div class="se2_l_line_height_user husky_se2m_lineHeight_direct_input">
								                        <h3><%= GetGlobalResource("GCTRRESX10027")%></h3>
								                        <span class="bx_input">
								                        <input type="text" class="input_ty1" maxlength="3" style="width:75px">
								                        <button type="button" title="1% <%= GetGlobalResource("GCTRRESX10028")%>" class="btn_up"><span>1% <%= GetGlobalResource("GCTRRESX10028")%></span></button>
								                        <button type="button" title="1% <%= GetGlobalResource("GCTRRESX10029")%>" class="btn_down"><span>1% <%= GetGlobalResource("GCTRRESX10029")%></span></button>
								                        </span>		
								                        &nbsp;&nbsp;&nbsp;<div class="btn_area">
									                        <button type="button" class="se2_btn_apply3"><span><%= GetGlobalResource("GCTRRESX10030")%></span></button><button type="button" class="se2_btn_cancel3"><span><%= GetGlobalResource("GCTRRESX10031")%></span></button>
								                        </div>
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //줄간격 레이어 -->
				                        </li>
                                    </ul>
                                    <ul>
				                        <li class="husky_seditor_ui_quote single_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10032")%>" class="se2_blockquote"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10032")%></span></button>
					                        <!-- 인용구 -->
					                        <div class="se2_layer husky_seditor_blockquote_layer" style="margin-left:-407px; display:none;">
						                        <div class="se2_in_layer">
							                        <div class="se2_quote">
								                        <ul>
								                            <li class="q1"><button type="button" class="se2_quote1"><span><span><%= GetGlobalResource("GCTRRESX10033")%>1</span></span></button></li>
								                            <li class="q2"><button type="button" class="se2_quote2"><span><span><%= GetGlobalResource("GCTRRESX10033")%>2</span></span></button></li>
								                            <li class="q3"><button type="button" class="se2_quote3"><span><span><%= GetGlobalResource("GCTRRESX10033")%>3</span></span></button></li>
								                            <li class="q4"><button type="button" class="se2_quote4"><span><span><%= GetGlobalResource("GCTRRESX10033")%>4</span></span></button></li>
								                            <li class="q5"><button type="button" class="se2_quote5"><span><span><%= GetGlobalResource("GCTRRESX10033")%>5</span></span></button></li>
								                            <li class="q6"><button type="button" class="se2_quote6"><span><span><%= GetGlobalResource("GCTRRESX10033")%>6</span></span></button></li>
								                            <li class="q7"><button type="button" class="se2_quote7"><span><span><%= GetGlobalResource("GCTRRESX10033")%>7</span></span></button></li>
								                            <li class="q8"><button type="button" class="se2_quote8"><span><span><%= GetGlobalResource("GCTRRESX10033")%>8</span></span></button></li>
								                            <li class="q9"><button type="button" class="se2_quote9"><span><span><%= GetGlobalResource("GCTRRESX10033")%>9</span></span></button></li>
								                            <li class="q10"><button type="button" class="se2_quote10"><span><span><%= GetGlobalResource("GCTRRESX10033")%>10</span></span></button></li>
								                        </ul>
								                        <button type="button" class="se2_cancel2"><span><%= GetGlobalResource("GCTRRESX10034")%></span></button>
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //인용구 -->
				                        </li>
                                    </ul>
                                    <ul>
				                        <li class="husky_seditor_ui_hyperlink first_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10035")%>" class="se2_url"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10035")%></span></button>
					                        <!-- 링크 -->
					                        <div class="se2_layer" style="margin-left:-285px">
						                        <div class="se2_in_layer">
							                        <div class="se2_url2">
								                        <input type="text" class="input_ty1" value="http://">
								                        <button type="button" class="se2_apply"><span><%= GetGlobalResource("GCTRRESX10036")%></span></button><button type="button" class="se2_cancel"><span><%= GetGlobalResource("GCTRRESX10037")%></span></button>
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //링크 -->
				                        </li>
				                        <li class="husky_seditor_ui_sCharacter"><button type="button" title="<%= GetGlobalResource("GCTRRESX10038")%>" class="se2_character"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10038")%></span></button>
					                        <!-- 특수기호 -->
					                        <div class="se2_layer husky_seditor_sCharacter_layer" style="margin-left:-448px;">
						                        <div class="se2_in_layer">
							                        <div class="se2_bx_character">
								                        <ul class="se2_char_tab">
								                        <li class="active"><button type="button" title="<%= GetGlobalResource("GCTRRESX10039")%>" class="se2_char1"><span><%= GetGlobalResource("GCTRRESX10039")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10040")%>" class="se2_char2"><span><%= GetGlobalResource("GCTRRESX10040")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10041")%>" class="se2_char3"><span><%= GetGlobalResource("GCTRRESX10041")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10042")%>" class="se2_char4"><span><%= GetGlobalResource("GCTRRESX10042")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10043")%>" class="se2_char5"><span><%= GetGlobalResource("GCTRRESX10043")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        <li><button type="button" title="<%= GetGlobalResource("GCTRRESX10044")%>" class="se2_char6"><span><%= GetGlobalResource("GCTRRESX10044")%></span></button>
									                        <div class="se2_s_character">
										                        <ul class="husky_se2m_sCharacter_list">
											                        <li></li>
										                        </ul>
									                        </div>
								                        </li>
								                        </ul>
								                        <p class="se2_apply_character">
									                        <label for="char_preview"><%= GetGlobalResource("GCTRRESX10045")%></label> <input type="text" name="char_preview" id="char_preview" value="®º⊆●○" class="input_ty1"><button type="button" class="se2_confirm"><span><%= GetGlobalResource("GCTRRESX10046")%></span></button><button type="button" class="se2_cancel husky_se2m_sCharacter_close"><span><%= GetGlobalResource("GCTRRESX10047")%></span></button>
								                        </p>
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //특수기호 -->
				                        </li>
				                        <li class="husky_seditor_ui_table"><button type="button" title="<%= GetGlobalResource("GCTRRESX10048")%>" class="se2_table"><span class="_buttonRound"><%= GetGlobalResource("GCTRRESX10048")%></span></button>
					                        <!--@lazyload_html create_table-->
					                        <!-- 표 -->
					                        <div class="se2_layer husky_se2m_table_layer" style="margin-left:-171px">
						                        <div class="se2_in_layer">
							                        <div class="se2_table_set">
								                        <fieldset>
								                        <legend><%= GetGlobalResource("GCTRRESX10049")%></legend>
									                        <dl class="se2_cell_num">
									                        <dt><label for="row"><%= GetGlobalResource("GCTRRESX10050")%></label></dt>
									                        <dd><input id="row" name="" type="text" maxlength="2" value="4" class="input_ty2">
										                        <button type="button" class="se2_add"><span><%= GetGlobalResource("GCTRRESX10051")%></span></button>
										                        <button type="button" class="se2_del"><span><%= GetGlobalResource("GCTRRESX10052")%></span></button>
									                        </dd>
									                        <dt><label for="col"><%= GetGlobalResource("GCTRRESX10053")%></label></dt>
									                        <dd><input id="col" name="" type="text" maxlength="2" value="4" class="input_ty2">
										                        <button type="button" class="se2_add"><span><%= GetGlobalResource("GCTRRESX10054")%></span></button>
										                        <button type="button" class="se2_del"><span><%= GetGlobalResource("GCTRRESX10055")%></span></button>
									                        </dd>
									                        </dl>
									                        <table border="0" cellspacing="1" class="se2_pre_table husky_se2m_table_preview">
									                        <tr>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        </tr>
									                        <tr>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        </tr>
									                        <tr>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        <td>&nbsp;</td>
									                        </tr>
									                        </table>
								                        </fieldset>
								                        <fieldset>
									                        <legend><%= GetGlobalResource("GCTRRESX10056")%></legend>
									                        <dl class="se2_t_proper1">
									                        <dt><input type="radio" id="se2_tbp1" name="se2_tbp" checked><label for="se2_tbp1"><%= GetGlobalResource("GCTRRESX10056")%></label></dt>
									                        <dd>
										                        <dl class="se2_t_proper1_1">
										                        <dt><label><%= GetGlobalResource("GCTRRESX10057")%></label></dt>
										                        <dd><div class="se2_select_ty1"><span class="se2_b_style3 husky_se2m_table_border_style_preview"></span><button type="button" title="<%= GetGlobalResource("GCTRRESX10011")%>" class="se2_view_more"><span><%= GetGlobalResource("GCTRRESX10011")%></span></button></div>
											                        <!-- 레이어 : 테두리스타일 -->
											                        <div class="se2_layer_b_style husky_se2m_table_border_style_layer" style="display:none">
												                        <ul>
												                            <li><button type="button" class="se2_b_style1"><span class="se2m_no_border"><%= GetGlobalResource("GCTRRESX10058")%></span></button></li>
												                            <li><button type="button" class="se2_b_style2"><span><span><%= GetGlobalResource("GCTRRESX10059")%>2</span></span></button></li>
												                            <li><button type="button" class="se2_b_style3"><span><span><%= GetGlobalResource("GCTRRESX10059")%>3</span></span></button></li>
												                            <li><button type="button" class="se2_b_style4"><span><span><%= GetGlobalResource("GCTRRESX10059")%>4</span></span></button></li>
												                            <li><button type="button" class="se2_b_style5"><span><span><%= GetGlobalResource("GCTRRESX10059")%>5</span></span></button></li>
												                            <li><button type="button" class="se2_b_style6"><span><span><%= GetGlobalResource("GCTRRESX10059")%>6</span></span></button></li>
												                            <li><button type="button" class="se2_b_style7"><span><span><%= GetGlobalResource("GCTRRESX10059")%>7</span></span></button></li>
												                        </ul>
											                        </div>
											                        <!-- //레이어 : 테두리스타일 -->
										                        </dd>
										                        </dl>
										                        <dl class="se2_t_proper1_1 se2_t_proper1_2">
										                        <dt><label for="se2_b_width"><%= GetGlobalResource("GCTRRESX10060")%></label></dt>
										                        <dd><input id="se2_b_width" name="" type="text" maxlength="2" value="1" class="input_ty1">
											                        <button type="button" title="<%= GetGlobalResource("GCTRRESX10061")%>" class="se2_add se2m_incBorder"><span><%= GetGlobalResource("GCTRRESX10061")%></span></button>
											                        <button type="button" title="<%= GetGlobalResource("GCTRRESX10062")%>" class="se2_del se2m_decBorder"><span><%= GetGlobalResource("GCTRRESX10062")%></span></button>
										                        </dd>
										                        </dl>
										                        <dl class="se2_t_proper1_1 se2_t_proper1_3">
										                        <dt><label for="se2_b_color"><%= GetGlobalResource("GCTRRESX10063")%></label></dt>
										                        <dd><input id="se2_b_color" name="" type="text" maxlength="7" value="#cccccc" class="input_ty3"><span class="se2_pre_color"><button type="button" style="background:#cccccc;"><span><%= GetGlobalResource("GCTRRESX10064")%></span></button></span>	
										                        <!-- 레이어 : 테두리색 -->
											                        <div class="se2_layer se2_b_t_b1" style="clear:both;display:none;position:absolute;top:20px;left:-147px;">
												                        <div class="se2_in_layer husky_se2m_table_border_color_pallet"></div>
											                        </div>
										                        <!-- //레이어 : 테두리색-->
										                        </dd>
										                        </dl>
										                        <div class="se2_t_dim0"></div><!-- 테두리 없음일때 딤드레이어 -->
										                        <dl class="se2_t_proper1_1 se2_t_proper1_4">
										                        <dt><label for="se2_cellbg"><%= GetGlobalResource("GCTRRESX10065")%></label></dt>
										                        <dd><input id="se2_cellbg" name="" type="text" maxlength="7" value="#ffffff" class="input_ty3"><span class="se2_pre_color"><button type="button" style="background:#ffffff;"><span><%= GetGlobalResource("GCTRRESX10064")%></span></button></span>
										                        <!-- 레이어 : 셀배경색 -->
										                        <div class="se2_layer se2_b_t_b1" style="clear:both;display:none;position:absolute;top:20px;left:-147px;">
											                        <div class="se2_in_layer husky_se2m_table_bgcolor_pallet"></div>
										                        </div>
										                        <!-- //레이어 : 셀배경색-->
										                        </dd>
										                        </dl>
									                        </dd>
									                        </dl>
								                        </fieldset>
								                        <fieldset>
									                        <legend><%= GetGlobalResource("GCTRRESX10066")%></legend>
									                        <dl class="se2_t_proper2">
									                        <dt><input type="radio" id="se2_tbp2" name="se2_tbp"><label for="se2_tbp2"><%= GetGlobalResource("GCTRRESX10067")%></label></dt>
									                        <dd><div class="se2_select_ty2"><span class="se2_t_style1 husky_se2m_table_style_preview"></span><button type="button" title="<%= GetGlobalResource("GCTRRESX10011")%>" class="se2_view_more"><span><%= GetGlobalResource("GCTRRESX10011")%></span></button></div>
										                        <!-- 레이어 : 표템플릿선택 -->
										                        <div class="se2_layer_t_style husky_se2m_table_style_layer" style="display:none">
											                        <ul class="se2_scroll">
											                            <li><button type="button" class="se2_t_style1"><span><%= GetGlobalResource("GCTRRESX10068")%>1</span></button></li>
											                            <li><button type="button" class="se2_t_style2"><span><%= GetGlobalResource("GCTRRESX10068")%>2</span></button></li>
											                            <li><button type="button" class="se2_t_style3"><span><%= GetGlobalResource("GCTRRESX10068")%>3</span></button></li>
											                            <li><button type="button" class="se2_t_style4"><span><%= GetGlobalResource("GCTRRESX10068")%>4</span></button></li>
											                            <li><button type="button" class="se2_t_style5"><span><%= GetGlobalResource("GCTRRESX10068")%>5</span></button></li>
											                            <li><button type="button" class="se2_t_style6"><span><%= GetGlobalResource("GCTRRESX10068")%>6</span></button></li>
											                            <li><button type="button" class="se2_t_style7"><span><%= GetGlobalResource("GCTRRESX10068")%>7</span></button></li>
											                            <li><button type="button" class="se2_t_style8"><span><%= GetGlobalResource("GCTRRESX10068")%>8</span></button></li>
											                            <li><button type="button" class="se2_t_style9"><span><%= GetGlobalResource("GCTRRESX10068")%>9</span></button></li>
											                            <li><button type="button" class="se2_t_style10"><span><%= GetGlobalResource("GCTRRESX10068")%>10</span></button></li>
											                            <li><button type="button" class="se2_t_style11"><span><%= GetGlobalResource("GCTRRESX10068")%>11</span></button></li>
											                            <li><button type="button" class="se2_t_style12"><span><%= GetGlobalResource("GCTRRESX10068")%>12</span></button></li>
											                            <li><button type="button" class="se2_t_style13"><span><%= GetGlobalResource("GCTRRESX10068")%>13</span></button></li>
											                            <li><button type="button" class="se2_t_style14"><span><%= GetGlobalResource("GCTRRESX10068")%>14</span></button></li>
											                            <li><button type="button" class="se2_t_style15"><span><%= GetGlobalResource("GCTRRESX10068")%>15</span></button></li>
											                            <li><button type="button" class="se2_t_style16"><span><%= GetGlobalResource("GCTRRESX10068")%>16</span></button></li>
											                        </ul>
										                        </div>
										                        <!-- //레이어 : 표템플릿선택 -->
									                        </dd>
									                        </dl>
								                        </fieldset>
								                        <p class="se2_btn_area">
									                        <button type="button" class="se2_apply"><span><%= GetGlobalResource("GCTRRESX10069")%></span></button><button type="button" class="se2_cancel"><span><%= GetGlobalResource("GCTRRESX10070")%></span></button>
								                        </p>
								                        <!-- 딤드레이어 -->
								                        <div class="se2_t_dim3"></div>
								                        <!-- //딤드레이어 -->
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //표 -->
					                        <!--//@lazyload_html-->
				                        </li>
				                        <li class="husky_seditor_ui_findAndReplace last_child"><button type="button" title="<%= GetGlobalResource("GCTRRESX10071")%>" class="se2_find"><span class="_buttonRound tool_bg"><%= GetGlobalResource("GCTRRESX10071")%></span></button>
					                        <!--@lazyload_html find_and_replace-->
					                        <!-- 찾기/바꾸기 -->
					                        <div class="se2_layer husky_se2m_findAndReplace_layer" style="margin-left:-238px;">
						                        <div class="se2_in_layer">
							                        <div class="se2_bx_find_revise">
								                        <button type="button" title="<%= GetGlobalResource("GCTRRESX10072")%>" class="se2_close husky_se2m_cancel"><span><%= GetGlobalResource("GCTRRESX10072")%></span></button>
								                        <h3><%= GetGlobalResource("GCTRRESX10071")%></h3>
								                        <ul>
								                            <li class="active"><button type="button" class="se2_tabfind"><span><%= GetGlobalResource("GCTRRESX10073")%></span></button></li>
								                            <li><button type="button" class="se2_tabrevise"><span><%= GetGlobalResource("GCTRRESX10074")%></span></button></li>
								                        </ul>
								                        <div class="se2_in_bx_find husky_se2m_find_ui" style="display:block">
									                        <dl>
									                        <dt><label for="find_word"><%= GetGlobalResource("GCTRRESX10075")%></label></dt><dd><input type="text" id="find_word" value="<%= GetGlobalResource("GCTRRESX10076")%>" class="input_ty1"></dd>
									                        </dl>
									                        <p class="se2_find_btns">
										                        <button type="button" class="se2_find_next husky_se2m_find_next"><span><%= GetGlobalResource("GCTRRESX10077")%></span></button><button type="button" class="se2_cancel husky_se2m_cancel"><span><%= GetGlobalResource("GCTRRESX10080")%></span></button>
									                        </p>
								                        </div>
								                        <div class="se2_in_bx_revise husky_se2m_replace_ui" style="display:none">
									                        <dl>
									                        <dt><label for="find_word2"><%= GetGlobalResource("GCTRRESX10078")%></label></dt><dd><input type="text" id="find_word2" value="<%= GetGlobalResource("GCTRRESX10076")%>" class="input_ty1"></dd>
									                        <dt><label for="revise_word"><%= GetGlobalResource("GCTRRESX10079")%></label></dt><dd><input type="text" id="revise_word" value="<%= GetGlobalResource("GCTRRESX10076")%>" class="input_ty1"></dd>
									                        </dl>
									                        <p class="se2_find_btns">
										                        <button type="button" class="se2_find_next2 husky_se2m_replace_find_next"><span><%= GetGlobalResource("GCTRRESX10077")%></span></button><button type="button" class="se2_revise1 husky_se2m_replace"><span><%= GetGlobalResource("GCTRRESX10081")%></span></button><button type="button" class="se2_revise2 husky_se2m_replace_all"><span><%= GetGlobalResource("GCTRRESX10082")%></span></button><button type="button" class="se2_cancel husky_se2m_cancel"><span><%= GetGlobalResource("GCTRRESX10080")%></span></button>
									                        </p>
								                        </div>
								                        <button type="button" title="<%= GetGlobalResource("GCTRRESX10083")%>" class="se2_close husky_se2m_cancel"><span><%= GetGlobalResource("GCTRRESX10083")%></span></button>
							                        </div>
						                        </div>
					                        </div>
					                        <!-- //찾기/바꾸기 -->
					                        <!--//@lazyload_html-->
				                        </li>
                                    </ul>
			                    </div>
			                    <!-- //704이상 -->
		                    </div>
				            <!-- 접근성 도움말 레이어 -->
		                    <div class="se2_layer se2_accessibility" style="display:none;">
			                    <div class="se2_in_layer">
				                    <button type="button" title="닫기" class="se2_close"><span>닫기</span></button>
				                    <h3><strong>접근성 도움말</strong></h3>
				                    <div class="box_help">
					                    <div>
						                    <strong>툴바</strong>
						                    <p>ALT+F10 을 누르면 툴바로 이동합니다. 다음 버튼은 TAB 으로 이전 버튼은 SHIFT+TAB 으로 이동 가능합니다. ENTER 를 누르면 해당 버튼의 기능이 동작하고 글쓰기 영역으로 포커스가 이동합니다. ESC 를 누르면 아무런 기능을 실행하지 않고 글쓰기 영역으로 포커스가 이동합니다.</p>
						                    <strong>빠져 나가기</strong>
						                    <p>ALT+. 를 누르면 스마트 에디터 다음 요소로 ALT+, 를 누르면 스마트에디터 이전 요소로 빠져나갈 수 있습니다.</p>
						                    <strong>명령어 단축키</strong>
						                    <ul>
						                    <li>CTRL+B <span>굵게</span></li>
						                    <li>SHIFT+TAB <span>내어쓰기</span></li>
						                    <li>CTRL+U <span>밑줄</span></li>
						                    <li>CTRL+F <span>찾기</span></li>
						                    <li>CTRL+I <span>기울임 글꼴</span></li>
						                    <li>CTRL+H <span>바꾸기</span></li>
						                    <li>CTRL+D <span>취소선</span></li>
						                    <li>CTRL+K <span>링크걸기</span></li>
						                    <li>TAB <span>들여쓰기</span></li>
						                    </ul>
					                    </div>
				                    </div>
				                    <div class="se2_btns">
					                    <button type="button" class="se2_close2"><span>닫기</span></button>
				                    </div>
			                    </div>
		                    </div>		
		                    <!-- //접근성 도움말 레이어 -->
		                    <hr>
		                    <!-- 입력 -->
		                    <div class="se2_input_area husky_seditor_editing_area_container">
			                    <iframe src="about:blank" id="se2_iframe" name="se2_iframe" class="se2_input_wysiwyg" width="400" height="300" title="글쓰기 영역 : 도구 모음은 ALT+F10을, 도움말은 ALT+0을 누르세요." frameborder="0" style="display:block;"></iframe>
			                    <textarea name="" rows="10" cols="100" title="HTML 편집 모드" class="se2_input_syntax se2_input_htmlsrc" style="display:none;outline-style:none;resize:none"> </textarea>
			                    <textarea name="" rows="10" cols="100" title="TEXT 편집 모드" class="se2_input_syntax se2_input_text" style="display:none;outline-style:none;resize:none;"> </textarea>
			
			                    <!-- 입력창 조절 안내 레이어 -->
			                    <div class="ly_controller husky_seditor_resize_notice" style="z-index:20;display:none;">
				                    <p>아래 영역을 드래그하여 입력창 크기를 조절할 수 있습니다.</p>
				                    <button type="button" title="닫기" class="bt_clse"><span>닫기</span></button>
				                    <span class="ic_arr"></span>
			                    </div>
			                        <!-- //입력창 조절 안내 레이어 -->
						        <div class="quick_wrap">
				                    <!-- 표/글양식 간단편집기 -->
				                    <!--@lazyload_html qe_table-->
				                    <div class="q_table_wrap" style="z-index: 150;">
				                    <button class="_fold se2_qmax q_open_table_full" style="position:absolute; display:none;top:340px;left:210px;z-index:30;" title="최대화" type="button"><span>퀵에디터최대화</span></button>
				                    <div class="_full se2_qeditor se2_table_set" style="position:absolute;display:none;top:135px;left:661px;z-index:30;">
					                    <div class="se2_qbar q_dragable"><span class="se2_qmini"><button title="최소화" class="q_open_table_fold"><span>퀵에디터최소화</span></button></span></div>
					                    <div class="se2_qbody0">
						                    <div class="se2_qbody">
							                    <dl class="se2_qe1">
							                    <dt>삽입</dt><dd><button class="se2_addrow" title="행삽입" type="button"><span>행삽입</span></button><button class="se2_addcol" title="열삽입" type="button"><span>열삽입</span></button></dd>
							                    <dt>분할</dt><dd><button class="se2_seprow" title="행분할" type="button"><span>행분할</span></button><button class="se2_sepcol" title="열분할" type="button"><span>열분할</span></button></dd>
							                    <dt>삭제</dt><dd><button class="se2_delrow" title="행삭제" type="button"><span>행삭제</span></button><button class="se2_delcol" title="열삭제" type="button"><span>열삭제</span></button></dd>
							                    <dt>병합</dt><dd><button class="se2_merrow" title="행병합" type="button"><span>행병합</span></button></dd>
							                    </dl>
							                    <div class="se2_qe2 se2_qe2_3"> <!-- 테이블 퀵에디터의 경우만,  se2_qe2_3제거 -->
								                    <!-- 샐배경색 -->
								                    <dl class="se2_qe2_1">
								                    <dt><input type="radio" checked="checked" name="se2_tbp3" id="se2_cellbg2" class="husky_se2m_radio_bgc"><label for="se2_cellbg2">셀 배경색</label></dt>
								                    <dd><span class="se2_pre_color"><button style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" type="button" class="husky_se2m_table_qe_bgcolor_btn"><span>색찾기</span></button></span>		
									                    <!-- layer:셀배경색 -->
									                    <div style="display:none;position:absolute;top:20px;left:0px;" class="se2_layer se2_b_t_b1">
										                    <div class="se2_in_layer husky_se2m_tbl_qe_bg_paletteHolder">
										                    </div>
									                    </div>
									                    <!-- //layer:셀배경색-->
								                    </dd>
								                    </dl>
								                    <!-- //샐배경색 -->
								                    <!-- 배경이미지선택 -->
								                    <dl style="display: none;" class="se2_qe2_2 husky_se2m_tbl_qe_review_bg">
								                    <dt><input type="radio" name="se2_tbp3" id="se2_cellbg3" class="husky_se2m_radio_bgimg"><label for="se2_cellbg3">이미지</label></dt>
								                    <dd><span class="se2_pre_bgimg"><button class="husky_se2m_table_qe_bgimage_btn se2_cellimg0" type="button"><span>배경이미지선택</span></button></span>
									                    <!-- layer:배경이미지선택 -->
									                    <div style="display:none;position:absolute;top:20px;left:-155px;" class="se2_layer se2_b_t_b1">
										                    <div class="se2_in_layer husky_se2m_tbl_qe_bg_img_paletteHolder">
											                    <ul class="se2_cellimg_set">
											                        <li><button class="se2_cellimg0" type="button"><span>배경없음</span></button></li>
											                        <li><button class="se2_cellimg1" type="button"><span>배경1</span></button></li>
											                        <li><button class="se2_cellimg2" type="button"><span>배경2</span></button></li>
											                        <li><button class="se2_cellimg3" type="button"><span>배경3</span></button></li>
											                        <li><button class="se2_cellimg4" type="button"><span>배경4</span></button></li>
											                        <li><button class="se2_cellimg5" type="button"><span>배경5</span></button></li>
											                        <li><button class="se2_cellimg6" type="button"><span>배경6</span></button></li>
											                        <li><button class="se2_cellimg7" type="button"><span>배경7</span></button></li>
											                        <li><button class="se2_cellimg8" type="button"><span>배경8</span></button></li>
											                        <li><button class="se2_cellimg9" type="button"><span>배경9</span></button></li>
											                        <li><button class="se2_cellimg10" type="button"><span>배경10</span></button></li>
											                        <li><button class="se2_cellimg11" type="button"><span>배경11</span></button></li>
											                        <li><button class="se2_cellimg12" type="button"><span>배경12</span></button></li>
											                        <li><button class="se2_cellimg13" type="button"><span>배경13</span></button></li>
											                        <li><button class="se2_cellimg14" type="button"><span>배경14</span></button></li>
											                        <li><button class="se2_cellimg15" type="button"><span>배경15</span></button></li>
											                        <li><button class="se2_cellimg16" type="button"><span>배경16</span></button></li>
											                        <li><button class="se2_cellimg17" type="button"><span>배경17</span></button></li>
											                        <li><button class="se2_cellimg18" type="button"><span>배경18</span></button></li>
											                        <li><button class="se2_cellimg19" type="button"><span>배경19</span></button></li>
											                        <li><button class="se2_cellimg20" type="button"><span>배경20</span></button></li>
											                        <li><button class="se2_cellimg21" type="button"><span>배경21</span></button></li>
											                        <li><button class="se2_cellimg22" type="button"><span>배경22</span></button></li>
											                        <li><button class="se2_cellimg23" type="button"><span>배경23</span></button></li>
											                        <li><button class="se2_cellimg24" type="button"><span>배경24</span></button></li>
											                        <li><button class="se2_cellimg25" type="button"><span>배경25</span></button></li>
											                        <li><button class="se2_cellimg26" type="button"><span>배경26</span></button></li>
											                        <li><button class="se2_cellimg27" type="button"><span>배경27</span></button></li>
											                        <li><button class="se2_cellimg28" type="button"><span>배경28</span></button></li>
											                        <li><button class="se2_cellimg29" type="button"><span>배경29</span></button></li>
											                        <li><button class="se2_cellimg30" type="button"><span>배경30</span></button></li>
											                        <li><button class="se2_cellimg31" type="button"><span>배경31</span></button></li>
											                    </ul>
										                    </div>
									                    </div>
									                    <!-- //layer:배경이미지선택-->
								                    </dd>
								                    </dl>
								                    <!-- //배경이미지선택 -->
							                    </div>
							                    <dl style="display: block;" class="se2_qe3 se2_t_proper2">
							                    <dt><input type="radio" name="se2_tbp3" id="se2_tbp4" class="husky_se2m_radio_template"><label for="se2_tbp4">표 스타일</label></dt>
							                    <dd>
								                    <div class="se2_qe3_table">
								                    <div class="se2_select_ty2"><span class="se2_t_style1"></span><button class="se2_view_more husky_se2m_template_more" title="더보기" type="button"><span>더보기</span></button></div>
								                    <!-- layer:표스타일 -->
								                    <div style="display:none;top:33px;left:0;margin:0;" class="se2_layer_t_style">
									                    <ul>
									                        <li><button class="se2_t_style1" type="button"><span>표 스타일1</span></button></li>
									                        <li><button class="se2_t_style2" type="button"><span>표 스타일2</span></button></li>
									                        <li><button class="se2_t_style3" type="button"><span>표 스타일3</span></button></li>
									                        <li><button class="se2_t_style4" type="button"><span>표 스타일4</span></button></li>
									                        <li><button class="se2_t_style5" type="button"><span>표 스타일5</span></button></li>
									                        <li><button class="se2_t_style6" type="button"><span>표 스타일6</span></button></li>
									                        <li><button class="se2_t_style7" type="button"><span>표 스타일7</span></button></li>
									                        <li><button class="se2_t_style8" type="button"><span>표 스타일8</span></button></li>
									                        <li><button class="se2_t_style9" type="button"><span>표 스타일9</span></button></li>
									                        <li><button class="se2_t_style10" type="button"><span>표 스타일10</span></button></li>
									                        <li><button class="se2_t_style11" type="button"><span>표 스타일11</span></button></li>
									                        <li><button class="se2_t_style12" type="button"><span>표 스타일12</span></button></li>
									                        <li><button class="se2_t_style13" type="button"><span>표 스타일13</span></button></li>
									                        <li><button class="se2_t_style14" type="button"><span>표 스타일14</span></button></li>
									                        <li><button class="se2_t_style15" type="button"><span>표 스타일15</span></button></li>
									                        <li><button class="se2_t_style16" type="button"><span>표 스타일16</span></button></li>
									                    </ul>
								                    </div>
								                    <!-- //layer:표스타일 -->
								                    </div>
							                    </dd>
							                    </dl>
							                    <div style="display:none" class="se2_btn_area">
								                    <button class="se2_btn_save" type="button"><span>My 리뷰저장</span></button>
							                    </div>
							                    <div class="se2_qdim0 husky_se2m_tbl_qe_dim1"></div>
							                    <div class="se2_qdim4 husky_se2m_tbl_qe_dim2"></div>
							                    <div class="se2_qdim6c husky_se2m_tbl_qe_dim_del_col"></div>
							                    <div class="se2_qdim6r husky_se2m_tbl_qe_dim_del_row"></div>
						                    </div>
					                    </div>
				                    </div>
				                    </div>
				                    <!--//@lazyload_html-->
				                    <!-- //표/글양식 간단편집기 -->
				                    <!-- 이미지 간단편집기 -->
				                    <!--@lazyload_html qe_image-->
				                    <div class="q_img_wrap">
					                    <button class="_fold se2_qmax q_open_img_full" style="position:absolute;display:none;top:240px;left:210px;z-index:30;" title="최대화" type="button"><span>퀵에디터최대화</span></button>
					                    <div class="_full se2_qeditor se2_table_set" style="position:absolute;display:none;top:140px;left:450px;z-index:30;">
						                    <div class="se2_qbar  q_dragable"><span class="se2_qmini"><button title="최소화" class="q_open_img_fold"><span>퀵에디터최소화</span></button></span></div>
						                    <div class="se2_qbody0">
							                    <div class="se2_qbody">
								                    <div class="se2_qe10">
									                    <label for="se2_swidth">가로</label><input type="text" class="input_ty1 widthimg" name="" id="se2_swidth" value="1024"><label class="se2_sheight" for="se2_sheight">세로</label><input type="text" class="input_ty1 heightimg" name="" id="se2_sheight" value="768"><button class="se2_sreset" type="button"><span>초기화</span></button>
									                    <div class="se2_qe10_1"><input type="checkbox" name="" class="se2_srate" id="se2_srate"><label for="se2_srate">가로 세로 비율 유지</label></div>
								                    </div>
								                    <div class="se2_qe11">
									                    <dl class="se2_qe11_1">
									                    <dt><label for="se2_b_width2">테두리두께</label></dt>
										                    <dd class="se2_numberStepper"><input type="text" class="input_ty1 input bordersize" value="1" maxlength="2" name="" id="se2_b_width2" readonly="readonly">
										                    <button class="se2_add plus" type="button"><span>1px 더하기</span></button>
										                    <button class="se2_del minus" type="button"><span>1px 빼기</span></button>
									                    </dd>
									                    </dl>
									                    <dl class="se2_qe11_2">
									                    <dt>테두리 색</dt>
									                    <dd><span class="se2_pre_color"><button style="background:#000000;" type="button" class="husky_se2m_img_qe_bgcolor_btn"><span>색찾기</span></button></span>
										                    <!-- layer:테두리 색 -->
										                    <div style="display:none;position:absolute;top:20px;left:-209px;" class="se2_layer se2_b_t_b1">
											                    <div class="se2_in_layer husky_se2m_img_qe_bg_paletteHolder">
											                    </div>
										                    </div>
										                    <!-- //layer:테두리 색 -->
									                    </dd>
									                    </dl>
								                    </div>
								                    <dl class="se2_qe12">
								                    <dt>정렬</dt>
								                    <dd><button title="정렬없음" class="se2_align0" type="button"><span>정렬없음</span></button><button title="좌측정렬" class="se2_align1 left" type="button"><span>좌측정렬</span></button><button title="우측정렬" class="se2_align2 right" type="button"><span>우측정렬</span></button>
								                    </dd>
								                    </dl>
								                    <button class="se2_highedit" type="button"><span>고급편집</span></button>
								                    <div class="se2_qdim0"></div>
							                    </div>
						                    </div>
					                    </div>
				                    </div>
				                    <!--//@lazyload_html-->
				                    <!-- 이미지 간단편집기 -->
			                    </div>
		                    </div>
		                    <!-- //입력 -->
		                    <!-- 입력창조절/ 모드전환 -->
		                    <div class="se2_conversion_mode">
			                    <button type="button" class="se2_inputarea_controller husky_seditor_editingArea_verticalResizer" title="입력창 크기 조절"><span>입력창 크기 조절</span></button>
			                    <ul class="se2_converter">
			                        <li class="active"><button type="button" class="se2_to_editor"><span>Editor</span></button></li>
			                        <li><button type="button" class="se2_to_html"><span>HTML</span></button></li>
			                        <li><button type="button" class="se2_to_text"><span>TEXT</span></button></li>
			                    </ul>
		                    </div>
		                    <!-- //입력창조절/ 모드전환 -->
		                    <hr>
		                    <!-- 얼럿 메세지 공통 -->
		                    <div class="se2_alert_wrap" style="display:none">
			                    <div class="se2_alert_content">
				                    <div class="se2_alert_txts"></div>
				                    <p class="se2_alert_btns">
					                    <button type="button" class="se2_confirm"><span>확인</span></button><button type="button" class="se2_cancel"><span>취소</span></button>
				                    </p>
				                    <a href="#" class="btn_close">닫기</a>
			                    </div>
			                    <!-- 레이어 중앙정렬 -->
			                    <span class="va_line"></span>
			                    <div class="ie_cover"></div>
		                    </div>
		                    <!-- //얼럿 메세지 공통 -->
	                    </div>
                    </div>
                    <!-- SE2 Markup End -->
                    <textarea id="ir1" name="ir1" rows="10" cols="100" style="width:100%; height:400px; display:none;"></textarea>
                    <%--<textarea name="ir2" id="ir2" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>--%>
                </div>

                <%-- 콜백데이터 컨트롤 --%>
                <eni:eniCallback ID="cbWriteProcess" ClientInstanceName="cbWriteProcess" CreateMode="DefaultMode" runat="server"
                    OnCallback="cbWriteProcess_Callback">
                    <ClientSideEvents BeginCallback="eni.LocalPage.cbWriteProcess_BeginCallback"
                                        CallbackComplete="eni.LocalPage.cbWriteProcess_CallbackComplete"/>
                </eni:eniCallback>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </eni:eniPopupControl>

    <%-- 콜백데이터 컨트롤 --%>
    <eni:eniCallback ID="cbProcess" ClientInstanceName="cbProcess" CreateMode="DefaultMode" runat="server"
        OnCallback="cbProcess_Callback">
        <ClientSideEvents BeginCallback="eni.LocalPage.cbProcess_BeginCallback"
                            CallbackComplete="eni.LocalPage.cbProcess_CallbackComplete"/>
    </eni:eniCallback>
</asp:Content>