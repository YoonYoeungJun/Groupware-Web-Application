<%@ Page Title="" Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="eniFramework.WebApp.Modules.Contact.Import" %>

<%@ Import Namespace="eniFramework" %>
<%@ Import Namespace="eniFramework.WebApp" %>
<%@ Import Namespace="eniFramework.WebApp.Common" %>
<%@ Import Namespace="eniFramework.WebApp.Extentions" %>
<%@ Import Namespace="eniFramework.WebApp.Modules.Contact" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Contact
    *  2. Function Name        :
    *  3. Program ID           : import.aspx
    *  4. Program Name         : 주소록 가져오기
    *  5. Program Desc         : 주소록 가져오기 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2015-07-27
    *  8. Modified date(Last)  : 2017-07-04
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
    <script type="text/javascript">
        hidFields = ASPxClientHiddenField.Cast();
        ViewLayout = ASPxClientSplitter.Cast();
        mnToolbar = ASPxClientMenu.Cast();
        gdvContactsList = ASPxClientGridView.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .eni_Web .conContactsImportView {
            height:100%;
        }
        /* 툴바 컨테이너 */
        .eni_Web .conContactsImportView .conMenu {
            position: relative;
            height: 35px;
            background-color:#F6F6F6;
            border-bottom:1px solid #C0C0C0;
        }
        .eni_Web .conContactsImportView .conMenu .mnToolbar .dx.dxm-image-l {
            width:100%;
        }
        .eni_Web .conContactsImportView .conMenu .mnToolbar span.dx-vam {
            line-height:23px;
            height:18px;
            display:block;
        }

        /* 내용부 */
        .eni_Web .conContactsImportView .conContent {
            position: absolute;
            left: 0px; 
            top: 35px; 
            right: 0px; 
            bottom: 0px; 
        }
        /* 텝 */
       

        .eni_Web .conContactsImportView .conContent .tabImportType .dxtc-content {
            position: absolute;
            display: block;
            left: 0px; 
            top: 28px; 
            right: 0px; 
            bottom: 0px;
            padding:0px !important;
            overflow-y:auto;
        }

        .eni_Web .conContactsImportView .conContent .tabcontent_wrap {
            padding:20px 20px 0;
        }

        .eni_Web .conContactsImportView .conContent .tabcontent_wrap .help_list li {
            position:relative;
            width:auto;
            padding-left:10px;
            line-height:20px;
            word-spacing:-1px;
            zoom:1;
        }
        .eni_Web .conContactsImportView .conContent .tabcontent_wrap .help_list li .bul {
            display:inline-block;
            overflow:hidden;
            position:absolute;
            top:7px;
            width:3px;
            height:3px;
            margin-left:-10px;
            background:#aaabab;
            vertical-align:top;
        }

        .eni_Web .conContactsImportView .conContent .uploader_wrap {
            height:100px;
            background-color:#F6F6F6;
            border:1px solid #C0C0C0;
            margin:20px 0 0;
        }
        
    </style>

    <script type="text/javascript">
        // <![CDATA[
        /*==============================================================================
        '  NameSpace    : eniFramework.WebApp.Groupware.WebContent.Views.Modules.Contacts
        '  Class        : ContactsImportView 
        '  Desc         : 열락처 리스트뷰 클래스
        '  FirstCreated : 2015-07-27 
        '  Lastmodified : 2015-07-27
        '  Remarks      : 
        '==============================================================================*/
        try {
            
            var ContactsImportView = eni.Initialize(new function () {
                
                this.Title = "";
                this.iFrameName = "_blank";
                this.ViewType = ViewType.ModuleView;
                this.Form_Load = function () {
                };
                this.Form_Load_Complate = function () {
                    
                };
                this.SetLocalDefaultValue = function () {
                };


                this.PageResize = function (e) {
                    return;
                    try {
                        switch (eni.UserAgent.Browser.Type) {
                            case "IE":
                                if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                                    gdvContactsList.SetHeight($contactslist_wrap.height());
                                } else {//IE 10 미만
                                    gdvContactsList.SetHeight($contactslist_wrap.height());
                                }
                                break;
                            case "OPERA":
                                gdvContactsList.SetHeight($contactslist_wrap.height());
                                break;
                            case "FIREFOX":
                                gdvContactsList.SetHeight($contactslist_wrap.height());
                                break;
                            case "CHROME":
                                gdvContactsList.SetHeight($contactslist_wrap.height());
                                break;
                            case "SAFARI":
                                gdvContactsList.SetHeight($contactslist_wrap.height());
                                break;
                            default:
                                gdvContactsList.SetHeight($contactslist_wrap.height());
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

                this.tabImportType_ActiveTabChanged = function (s, e) {
                    debugger;
                    
                    if (e.tab.clientEnabled) {
                        var callbackArgs = new BaseCallbackArgsClass();
                        callbackArgs.Cmd = "chgidx";
                        callbackArgs.Data = {
                            Index: e.tab.index
                        };
                        
                        gdvContactsList.PerformCallback(callbackArgs.Serialize());
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
    <div class="conContactsImportView">
        <div id="conMenu" class="conMenu">
            <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" CssClass="mnToolbar Padding10LR Padding5T" SkinID="MailToolbar" runat="server">
                <ClientSideEvents ItemClick="ContactsImportView.mnToolbar_Click" />
                <Items>
                    <dx:MenuItem Name="btnAddContact" Text="연락처 추가" ItemStyle-Cursor="pointer" ClientEnabled="false"></dx:MenuItem>
                </Items>
            </eni:eniMenu>
        </div>
        <div id="conContent" class="conContent">
            <eni:eniPageControl ID="tabImportType" ClientInstanceName="tabImportType" CssClass="tabImportType" runat="server"
                Width="100%" TabSpacing="0" ActiveTabIndex="1" EnableHierarchyRecreation="true">
                <ClientSideEvents ActiveTabChanged="ContactsImportView.tabImportType_ActiveTabChanged" />
                <Paddings PaddingTop="5px" />
                <TabStyle>
                    <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                    <BorderLeft BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                    <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="0px" />
                    <Paddings PaddingLeft="5px" PaddingRight="5px" PaddingTop="3px" PaddingBottom="2px" />
                </TabStyle>
                <ActiveTabStyle>
                    <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                    <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="0px" />
                    <BorderBottom BorderWidth="0px" />
                    <BorderLeft BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                </ActiveTabStyle>
                <ContentStyle Border-BorderWidth="0px">
                    <Border BorderWidth="0px"/>
                    <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                </ContentStyle>
                <TabPages>
                    <dx:TabPage Name="tab1" Text="파일에서 불러오기">
                        <TabStyle>
                            <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                        </TabStyle>
                        <ActiveTabStyle>
                            <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                        </ActiveTabStyle>
                        <ContentCollection>
                            <dx:ContentControl>
                                <div class="tabcontent_wrap">
                                    <ul class="help_list">
			                            <li>
                                            <span class="bul">&nbsp;</span>
                                            일반 주소록(csv, xls, txt) 파일을 쉽게 불러올 수 있습니다.
			                            </li>
			                            <li>
                                            <span class="bul">&nbsp;</span>
                                            아웃룩, 익스프레스에서 내보낸 연락처 파일(csv, xls)을 불러올 수 있습니다.
			                            </li>
			                            <li>
                                            <span class="bul">&nbsp;</span>
                                            직접 파일을 작성하실 때에는 샘플 파일에 맞추어 작성해 주시면 더욱 정확하게 주소를 가져올 수 있습니다.
			                            </li>
			                        </ul>
                                    <div class="uploader_wrap">
                                        <eni:eniFileUpload ID="upcImport" ClientInstanceName="upcImport" CssClass="upcImport MarginAuto" runat="server"
                                            Width="400px" UploadMode="Advanced"
                                            OnFileUploadComplete="upcImport_FileUploadComplete"
                                            AdvancedModeSettings-EnableMultiSelect="false"
                                            AdvancedModeSettings-TemporaryFolder="<%# Global.gDirectorys.GetSpecialDirectory(PathKind.System, PathFormatter.FullPhysicalPath, PathType.Temp, lgACT.UserId) %>" 
                                            ShowProgressPanel="True" ShowUploadButton="True" 
                                            ValidationSettings-AllowedFileExtensions=".csv, .xls, .xlsx" 
                                            ValidationSettings-NotAllowedFileExtensionErrorText="업로드 가능한 확장자는 *.csv, *.xls, *.xlsx 만 업로드 가능합니다.">
                                            <Paddings PaddingTop="30px" />
                                            <BrowseButton Text="찾아보기"></BrowseButton>
                                            <UploadButton Text="업로드"></UploadButton>
                                            <BrowseButtonStyle CssClass="CButtonMSilver Font" HoverStyle-CssClass="CButtonMSilverHover" ForeColor="#575757"></BrowseButtonStyle>
                                            <TextBoxStyle>
                                                <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" />
                                                <BorderRight BorderWidth="1px" />
                                            </TextBoxStyle>
                                            <%--<ClientSideEvents FileUploadStart="ContactsImportView.upcImport_FileUploadStart"
                                                FileUploadComplete="ContactsImportView.upcImport_FileUploadComplete"
                                                FilesUploadComplete="ContactsImportView.upcImport_FilesUploadComplete" />--%>
                                        </eni:eniFileUpload>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </eni:eniPageControl>
        </div>
    </div>
</asp:Content>

