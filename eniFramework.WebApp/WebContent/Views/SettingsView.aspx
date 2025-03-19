<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="SettingsView.aspx.cs" Inherits="eniFramework.WebApp.Modules.SettingsView" %>

<%@ Register Assembly="eniFramework" Namespace="eniFramework" TagPrefix="eni" %>
<%@ Register Assembly="eniFramework.WebApp.Common" Namespace="eniFramework.WebApp.Common" TagPrefix="eni" %>
<%@ Import Namespace="hMailServerService.SocketLayer" %>


<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : SettingsView.aspx
    *  4. Program Name         : 개인 설정 페이지
    *  5. Program Desc         : 개인 설정 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2015-04-03
    *  8. Modified date(Last)  : 2017-07-05
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
        MainLayout = ASPxClientSplitter.Cast();
        muToolbar = ASPxClientMenu.Cast();
        muToolbarBottom = ASPxClientMenu.Cast();
        tbSettingPage = ASPxClientPageControl.Cast();

        //UserSetting
        cbpUserSetting = ASPxClientCallbackPanel.Cast();
        flUserSetting = ASPxClientFormLayout.prototype;
        eniBiUserPhoto = ASPxClientBinaryImage.Cast();
        txtUserNickName = ASPxClientTextBox.Cast();
        txtIntroduce = ASPxClientTextBox.Cast();
        txtUserNameEng = ASPxClientTextBox.Cast();
        txtUserNameHanja = ASPxClientTextBox.Cast();
        txtExtMailAddr = ASPxClientTextBox.Cast();
        txtPwd = ASPxClientTextBox.Cast();
        txtTelNo = ASPxClientTextBox.Cast();
        txtHanTelNo = ASPxClientTextBox.Cast();
        txtEmTelNo = ASPxClientTextBox.Cast();
        btnUserSettingsSave = ASPxClientButton.Cast();
        btnUserSettingsCancel = ASPxClientButton.Cast();

        //FamilySite
        cbpFamilySite = ASPxClientCallbackPanel.Cast();
        flFamilySite = ASPxClientFormLayout.prototype;
        txtErpUserId = ASPxClientTextBox.Cast();
        txtErpUserPw = ASPxClientTextBox.Cast();
        txtQmsUserId = ASPxClientTextBox.Cast();
        txtQmsUserPw = ASPxClientTextBox.Cast();
        txtFtaUserId = ASPxClientTextBox.Cast();
        txtFtaUserPw = ASPxClientTextBox.Cast();
        btnFamilySiteSave = ASPxClientButton.Cast();
        btnFamilySiteCancel = ASPxClientButton.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .MainBody .MainForm .MainLayout {
        }
        .MainBody .MainForm .MainLayout .tbSettingPage {

        }
        .MainBody .MainForm .MainLayout .tbSettingPage .GroupBox {
            padding:0px 0px 20px 0px !important;
            margin-bottom:0px !important;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .Group {
            margin-top:-16px !important;
        }
        /* 첨부파일 텍스트 박스 숨김 */
        /*.MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .dxucTextBox,
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .dxucTextBox input,
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .dxucTextBox a,
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .dxucTextBox a img {
            background-color: white;
	        border: 0px;
	        padding: 0px;
            margin: 0px;
            width: 10px !important;
        }*/
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .FileUploadControlTextBox {
            background-color: white;
	        border: 0px;
	        padding: 0px;
            margin: 0px;
            width: 0px !important;
            height: 0px;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .FileUploadControlTextBox .dxucEditArea_eniThm {
            width:0px;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .FileUploadControlTextBox .dxucTextBox_eniThm {
            width:0px;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .FileUploadControlTextBox .dxWeb_ucClearButton_eniThm {
            width:0px;
        }
        /* 첨부파일 버튼 스타일 */
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .CButtonMSilver.dxucBrowseButtonPressed_eniThm {
            color:#575757;
            border:0px;
            background-position-y: -68px !important;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .CButtonMSilver.dxbf > a {
            border:0px !important;
        }
        .MainBody .MainForm .MainLayout .tbSettingPage .fuUploadPhoto .CButtonMSilver.dxucBrowseButtonPressed_eniThm > a {
            color:#575757;
            border:0px;
            background-position-y: -68px !important;
        }
    </style>
    <script type="text/javascript">
        var fileName = new String();
        var fileNumber = 0;
        var startDate = new Date();

        var UserSettingCallbackArgs = function () {
            this.UserNameEng = new String();
            this.UserNameHanja = new String();
            this.UserNickName = new String();
            this.Introduce = new String();
            this.ExtMailAddr = new String();
            this.Pwd = new String();
            this.TelNo = new String();
            this.HandTelNo = new String();
            this.EmTelNo = new String();
        };

        var FamilySiteCallbackArgs = function () {
            this.ErpUserId = new String();
            this.ErpUserPw = new String();
            this.QmsUserId = new String();
            this.QmsUserPw = new String();
            this.FtaUserId = new String();
            this.FtaUserPw = new String();
        };

        var SettingMain = eni.Initialize(new function () {
            this.Title = eni.GetTitle() + " - " + "[<%= lgPageInfo.RequestParentMenuID %>]" + "[<%= lgPageInfo.RequestMenuID %>]" + " : " + "<%= GetGlobalResource("QuickName") %>";
            this.iFrameName = "_blank";
            this.ViewType = ViewType.ModuleView;
            this.Form_Load = function () {
                
            };
            this.Form_Load_Complate = function () {

            };

            this.muToolbar_Click = function (s, e) {
                try {
                    if (s.name === "Sub_Content_Holder_MainLayout_muToolbar") {
                        tbSettingPage.SetActiveTab(tbSettingPage.GetTabByName(e.item.name));
                        muToolbarBottom.SetSelectedItem(null);
                    } else {
                        tbSettingPage.SetActiveTab(tbSettingPage.GetTabByName(e.item.name));
                        muToolbar.SetSelectedItem(null);
                    }
                } catch (ex) {
                }
            };

            this.cbp_Init = function (s, e) {
                var mainContentPan = MainLayout.GetPaneByName("MainContent");
                mainContentPan.SetScrollTop(0);
            }

            this.fuUploadPhoto_FilesUploadComplete = function (s, e) {
                eni.Loading.DisplayLoading(false);
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "UserSetting_UserPhoto";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Query;

                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };

            this.fuUploadPhoto_TextChanged = function (s, e) {
                //파일을 선택하면 즉시 서버로 업로드 한다.
                eni.Loading.DisplayLoading(true, "사진을 업로드 중입니다.");
                fuUploadPhoto.Upload();
            };

            this.btnDelPhoto_Click = function (s, e) {
                eni.Loading.DisplayLoading(true, "저장된 사진을 삭제합니다.");
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "UserSetting_UserPhoto";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Delete;

                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };

            this.btnUserSettingsSave_Click = function (s, e) {
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "UserSetting";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Update;
                SettingMainBaseObj.Data = new UserSettingCallbackArgs();
                SettingMainBaseObj.Data.UserNickName = txtUserNickName.GetText();
                SettingMainBaseObj.Data.Introduce = txtIntroduce.GetText();
                SettingMainBaseObj.Data.UserNameEng = txtUserNameEng.GetText();
                SettingMainBaseObj.Data.UserNameHanja = txtUserNameHanja.GetText();
                SettingMainBaseObj.Data.ExtMailAddr = txtExtMailAddr.GetText();
                SettingMainBaseObj.Data.Pwd = txtPwd.GetText();
                SettingMainBaseObj.Data.TelNo = txtTelNo.GetText();
                SettingMainBaseObj.Data.HandTelNo = txtHanTelNo.GetText();
                SettingMainBaseObj.Data.EmTelNo = txtEmTelNo.GetText();

                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };
            this.btnUserSettingsCancel_Click = function (s, e) {
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "UserSetting";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Query;

                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };

            this.btnFamilySiteSave_Click = function (s, e) {
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "FamilySite";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Update;
                SettingMainBaseObj.Data = new FamilySiteCallbackArgs();
                SettingMainBaseObj.Data.ErpUserId = txtErpUserId.GetText();
                SettingMainBaseObj.Data.ErpUserPw = txtErpUserPw.GetText();
                SettingMainBaseObj.Data.QmsUserId = txtQmsUserId.GetText();
                SettingMainBaseObj.Data.QmsUserPw = txtQmsUserPw.GetText();
                SettingMainBaseObj.Data.FtaUserId = txtFtaUserId.GetText();
                SettingMainBaseObj.Data.FtaUserPw = txtFtaUserPw.GetText();

                alert(txtErpUserPw.GetValue())
                return;
                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };

            this.btnFamilySiteCancel_Click = function (s, e) {
                var SettingMainBaseObj = new BaseCallbackArgsClass();
                SettingMainBaseObj.Cmd = "FamilySite";
                SettingMainBaseObj.DBAccessMode = DBAccessMode.Query;

                cbpUserSetting.PerformCallback(JSON.stringify(SettingMainBaseObj));
            };
        });
    </script>
</asp:Content>
<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <eni:eniSplitter ID="MainLayout" ClientInstanceName="MainLayout" CssClass="MainLayout" runat="server" SkinID="Default"
        Orientation="Vertical" SeparatorVisible="False">
        <Panes>
            <dx:SplitterPane Name="MainMenu" ContentUrlIFrameTitle="MainMenu" 
                Size="80px" MinSize="80px" MaxSize="80px" 
                ScrollBars="None" AllowResize="False" AutoWidth="false" AutoHeight="false">
                <PaneStyle CssClass="MainMenuArea" Paddings-Padding="10px" BorderBottom-BorderWidth="1px"></PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server" BorderWidth="0">
                        <%-- 사용자 설정 메뉴 --%>
                        <eni:eniMenu ID="muToolbar" ClientInstanceName="muToolbar" CssClass="muToolbar" runat="server"
                            AllowSelectItem="true"
                            SeparatorHeight="0"
                            BackgroundImage-ImageUrl="none" 
                            BackColor="Transparent"
                            ItemLinkMode="ContentBounds">
                            <Border BorderWidth="0" />
                            <Paddings PaddingTop="7px" />
                            <ItemStyle Cursor="pointer" ForeColor="#333333">
                                <HoverStyle Font-Underline="true" BackColor="Transparent" BackgroundImage-ImageUrl="none">
                                    <Border BorderWidth="0px" />
                                </HoverStyle>
                                <SelectedStyle Font-Bold="true" ForeColor="#41B406" BackColor="Transparent" BackgroundImage-ImageUrl="none">
                                    <Border BorderWidth="0px" />
                                </SelectedStyle>
                            </ItemStyle>
                            <ClientSideEvents ItemClick="SettingMain.muToolbar_Click" />
                            <Items>
                                <dx:MenuItem Name="UserSettings" Text="개인정보" ToolTip="개인 신상 정보를 관리합니다." Selected="true"></dx:MenuItem>
                                <dx:MenuItem Name="GroupwareSettings" Text="그룹웨어 설정" ToolTip="그룹웨어 기준정보를 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="MailBox" Text="메일함 관리" ToolTip="메일함을 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="Board" Text="게시판 설정" ToolTip="게시판 설정을 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="SignAndReply" Text="서명/답장 설정" ToolTip="서명 및 답장 설정을 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="Spam" Text="스팸 설정" ToolTip="스팸 메일에 관련된 설정을 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="Receive" Text="수신 차단/해제" ToolTip="수신 차단을 관리합니다."></dx:MenuItem>
                                <dx:MenuItem Name="ExternalMail" Text="외부 메일 가져오기" ToolTip="외부 메일 가져오기를 관리합니다."></dx:MenuItem>
                            </Items>
                        </eni:eniMenu>
                        <eni:eniMenu ID="muToolbarBottom" ClientInstanceName="muToolbarBottom" CssClass="muToolbarBottom" runat="server"
                            AllowSelectItem="true"
                            SeparatorHeight="0"
                            BackgroundImage-ImageUrl="none" 
                            BackColor="Transparent"
                            ItemLinkMode="ContentBounds">
                            <Border BorderWidth="0" />
                            <Paddings PaddingTop="2px" />
                            <ItemStyle Cursor="pointer" ForeColor="#333333">
                                <HoverStyle Font-Underline="true" BackColor="Transparent" BackgroundImage-ImageUrl="none">
                                    <Border BorderWidth="0px" />
                                </HoverStyle>
                                <SelectedStyle Font-Bold="true" ForeColor="#41B406" BackColor="Transparent" BackgroundImage-ImageUrl="none">
                                    <Border BorderWidth="0px" />
                                </SelectedStyle>
                            </ItemStyle>
                            <ClientSideEvents ItemClick="SettingMain.muToolbar_Click" />
                            <Items>
                                <dx:MenuItem Name="FamilySite" Text="패밀리 싸이트" ToolTip="패밀리 싸이트에 관한 설정을 관리합니다."></dx:MenuItem>
                            </Items>
                        </eni:eniMenu>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="MainContent" ContentUrlIFrameTitle="MainContent"
                ScrollBars="Auto" Separator-Visible="False">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <eni:eniPageControl ID="tbSettingPage" ClientInstanceName="tbSettingPage" CssClass="tbSettingPage" runat="server" ShowTabs="false"
                            Width="100%" Border-BorderWidth="0" ContentStyle-Border-BorderWidth="0px">
                            <TabPages>
                                <%-- 개인 정보 설정 --%>
                                <dx:TabPage Name="UserSettings">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            <eni:eniCallbackPanel ID="cbpUserSetting" ClientInstanceName="cbpUserSetting" runat="server" CreateMode="StandardMode"
                                                OnCallback="cbp_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <eni:eniFormLayout ID="flUserSetting" ClientInstanceName="flUserSetting" runat="server"
                                                            Width="100%" ShowItemCaptionColon="False">
                                                            <ClientSideEvents Init="SettingMain.cbp_Init" />
                                                            <Paddings PaddingTop="15px" />
                                                            <Styles>
                                                                <LayoutGroup CssClass="Group Padding0">
                                                                    <Cell>
                                                                        <Paddings Padding="0px" />
                                                                    </Cell>
                                                                </LayoutGroup>
                                                                <LayoutGroupBox CssClass="GroupBox">
                                                                    <Caption CssClass="Font-Medium" Font-Bold="true"></Caption>
                                                                    <BorderTop BorderWidth="2px" BorderStyle="Solid" BorderColor="#A5ACB5" />
                                                                </LayoutGroupBox>
                                                                <LayoutItem>
                                                                    <Caption CssClass=""></Caption>
                                                                    <Paddings Padding="0px" />
                                                                    <Caption BackColor="#F9F9F9" Font-Bold="true"></Caption>
                                                                    <CaptionCell BackColor="#F9F9F9" CssClass="Width200px Padding10L Padding10TB">
                                                                        <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                    </CaptionCell>
                                                                    <NestedControlCell CssClass="Padding10L Padding10TB">
                                                                        <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                    </NestedControlCell>
                                                                </LayoutItem>
                                                            </Styles>
                                                            <Items>
                                                                <dx:LayoutGroup Caption="내 정보" GroupBoxDecoration="HeadingLine">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="사진" Height="100px">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                                                                                        <tr>
                                                                                            <td rowspan="2" width="70px">
                                                                                                <eni:eniBinaryImage ID="eniBiEmpPhoto" Caption="사원증 사진" runat="server"
                                                                                                    Width="110px" Height="140px">
                                                                                                    <CaptionSettings Position="Bottom" ShowColon="false" />
                                                                                                    <CaptionStyle CssClass="Font-Small" ForeColor="#969CA5"></CaptionStyle>
                                                                                                    <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                                                    <EmptyImage Url="../../contents/images/ico-photo.gif"></EmptyImage>
                                                                                                </eni:eniBinaryImage>
                                                                                            </td>
                                                                                            <td colspan="2" width="110px" height="130px" class="Padding10L">
                                                                                                <eni:eniBinaryImage ID="eniBiUserPhoto" runat="server"
                                                                                                    Width="110px" Height="140px">
                                                                                                    <RootStyle>
                                                                                                        <Paddings PaddingLeft="10px" />
                                                                                                    </RootStyle>
                                                                                                    <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                                                    <EmptyImage Url="../../contents/images/ico-photo.gif"></EmptyImage>
                                                                                                </eni:eniBinaryImage>
                                                                                            </td>
                                                                                            <td width="auto"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="70px" class="Padding10L">
                                                                                                <eni:eniFileUpload ID="fuUploadPhoto" ClientInstanceName="fuUploadPhoto" CssClass="fuUploadPhoto" runat="server"
                                                                                                    UploadMode="Advanced"
                                                                                                    OnFileUploadComplete="fuUploadPhoto_FileUploadComplete"
                                                                                                    AdvancedModeSettings-TemporaryFolder="<%# lgACT.GetWebHardACTDirectory(PathType.Temp, PathFormatter.FullPhysicalPath) %>" AdvancedModeSettings-EnableFileList="False">
                                                                                                    <AdvancedModeSettings EnableMultiSelect="false"></AdvancedModeSettings>
                                                                                                    <ValidationSettings AllowedFileExtensions=".jpg, .jpeg, .gif, .png"></ValidationSettings>
                                                                                                    <BrowseButton Text="사진 올리기"></BrowseButton>
                                                                                                    <TextBoxStyle CssClass="FileUploadControlTextBox" />
                                                                                                    <BrowseButtonStyle CssClass="CButtonMSilver Font" HoverStyle-CssClass="CButtonMSilverHover" ForeColor="#575757"></BrowseButtonStyle>
                                                                                                    <ClientSideEvents FilesUploadComplete="SettingMain.fuUploadPhoto_FilesUploadComplete"
                                                                                                        TextChanged="SettingMain.fuUploadPhoto_TextChanged" />
                                                                                                </eni:eniFileUpload>
                                                                                            </td>
                                                                                            <td width="30px">
                                                                                                <eni:eniButton ID="btnDelPhoto" ClientInstanceName="btnDelPhoto" EnableTheming="false" runat="server" 
                                                                                                    AutoPostBack="false"
                                                                                                    Text="삭제" ToolTip="사진을 삭제합니다."
                                                                                                    CssClass="CButtonMSilver Font" 
                                                                                                    HoverStyle-CssClass="CButtonMSilverHover" 
                                                                                                    PressedStyle-CssClass="CButtonMSilverPress">
                                                                                                    <ClientSideEvents Click="SettingMain.btnDelPhoto_Click" />
                                                                                                </eni:eniButton>
                                                                                            </td>
                                                                                            <td width="auto"></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="이름(한글)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserName" runat="server">
                                                                                    </eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="이름(영문)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtUserNameEng" ClientInstanceName="txtUserNameEng" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="영문 이름이 지정되어있지 않습니다. 영문이름을 지정하세요."
                                                                                        HelpText="*협력업체의 경우 지정되어있지 않을수도 있습니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="이름(한자/중국어)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtUserNameHanja" ClientInstanceName="txtUserNameHanja" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="한자 이름이 지정되어있지 않습니다. 한자 이름을 지정하세요."
                                                                                        HelpText="*협력업체의 경우 지정되어있지 않을수도 있습니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="이름(닉네임)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtUserNickName" ClientInstanceName="txtUserNickName" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="닉네임이 설정되어있지 않습니다. 닉네임을 설정하세요."
                                                                                        HelpText="*닉네임 미설정시 다른 그룹웨어 사용자에게는 이름이 표시됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="한줄 소개">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtIntroduce" ClientInstanceName="txtIntroduce" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="한 줄 소개를 입력하세요."
                                                                                        HelpText="*한 줄 소개로 개성있는 나를 표현해 보세요.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="아이디(식별번호) - 유효일">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserID" runat="server"></eni:eniLabel>&nbsp;-&nbsp;<eni:eniLabel ID="lblValidDt" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="계정 메일 주소">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblMailAddr" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="외부 인증 메일 주소">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtExtMailAddr" ClientInstanceName="txtExtMailAddr" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="외부 인증메일이 설정되어있지 않습니다. 외부 인증메일을 설정하세요."
                                                                                        HelpText="*외부 인증메일이란 비밀번호 분실시 설정된 메일주로소 임시 비밀번호가 발송됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="비밀번호 - 유효일">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtPwd" ClientInstanceName="txtPwd" runat="server" CssClass="BorderClear FloatL" 
                                                                                        Width="150px" Password="true"
                                                                                        HelpText="*영문 소/대 특수문자 조합니다.">
                                                                                    </eni:eniTextBox>
                                                                                    <eni:eniTextBox ID="txtPwdConform" ClientInstanceName="txtPwdConform" runat="server" CssClass="BorderClear" 
                                                                                        Width="150px" Password="true" ClientVisible="false"
                                                                                        HelpText="*비밀번호를 다시 확인합니다.">
                                                                                    </eni:eniTextBox>&nbsp;&nbsp;<eni:eniLabel ID="lblPwdValidDt" Text="2999-12-31" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="생일">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserBirthday" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="입사일">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblEnterDt" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="사내 내선 번호">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtTelNo" ClientInstanceName="txtTelNo" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="사내 내선 번호가 설정되어있지 않습니다. 내선번호를 지정하세요."
                                                                                        HelpText="*사내 내선번호만 입력하시면 됩니다. 예를들어 0585 이면 585만 입력하시면 전체 전화번호가 설정됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="휴대폰 번호">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtHanTelNo" ClientInstanceName="txtHanTelNo" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="휴대폰 번호가 지정되어있지 않습니다. 휴대폰 번호를 지정하세요."
                                                                                        HelpText="*휴대폰 번호가 변경되었으면 변경된 번호로 업데이트 하세요. 단 ERP 사용자 정보에는 자동으로 변경되지는 않습니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="긴급연락망">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtEmTelNo" ClientInstanceName="txtEmTelNo" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="긴급연락망을 지정하여부세요."
                                                                                        HelpText="*긴급연락망은 정말 급한 업무적인 일로 연락이 가능한 번호여야 합니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="주소">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserAddr" Text="(626-856)경남 양산시 상북면 소토리 908, 대우마리나APT 103동 411호" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                                <dx:LayoutGroup Caption="조직 / 속성" GroupBoxDecoration="HeadingLine">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="소속 사업장">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblBizAreaNm" Text="차량사업부" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="소속 공장">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblPlantNm" Text="두동공장" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="소속 부서">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblDeptNm" Text="전산실" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="직급">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblRolePstnNm" Text="직급" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="계정 종류">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserKindNm" Text="종류" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="계정 타입">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserTypeNm" Text="타입" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="계정 구분">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniLabel ID="lblUserGubunNm" Text="구분" runat="server"></eni:eniLabel>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                            </Items>
                                                        </eni:eniFormLayout>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </eni:eniCallbackPanel>
                                            <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td width="auto"></td>
                                                    <td width="50px">
                                                        <eni:eniButton ID="btnUserSettingsSave" ClientInstanceName="btnUserSettingsSave" runat="server" 
                                                            EnableTheming="false" Text="변경사항 저장" ToolTip="변경된 모든내용을 저장합니다." AutoPostBack="false" 
                                                            CssClass="CButtonLWhite Font" 
                                                            HoverStyle-CssClass="CButtonLWhiteHover">
                                                            <ClientSideEvents Click="SettingMain.btnUserSettingsSave_Click" />
                                                        </eni:eniButton>
                                                    </td>
                                                    <td width="30px" class="Padding5L">
                                                        <eni:eniButton ID="btnUserSettingsCancel" ClientInstanceName="btnUserSettingsCancel" runat="server" 
                                                            EnableTheming="false" Text="취소" ToolTip="변경사항을 취소합니다." AutoPostBack="false" 
                                                            CssClass="CButtonLWhite Font" 
                                                            HoverStyle-CssClass="CButtonLWhiteHover">
                                                            <ClientSideEvents Click="SettingMain.btnUserSettingsCancel_Click" />
                                                        </eni:eniButton>
                                                    </td>
                                                    <td width="auto"></td>
                                                </tr>
                                            </table>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 그룹웨어 설정 --%>
                                <dx:TabPage Name="GroupwareSettings">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 메일 설정 --%>
                                <dx:TabPage Name="MailBox">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 게시판 설정 --%>
                                <dx:TabPage Name="Board">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 서명 & 답장 설정 --%>
                                <dx:TabPage Name="SignAndReply">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 스팸 설정 --%>
                                <dx:TabPage Name="Spam">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 수신 설정 --%>
                                <dx:TabPage Name="Receive">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 외부계정 설정 --%>
                                <dx:TabPage Name="ExternalMail">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            아직 지원하지 않습니다.
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <%-- 패밀리 싸이트 설정 --%>
                                <dx:TabPage Name="FamilySite">
                                    <ContentCollection>
                                        <dx:ContentControl BorderWidth="0">
                                            <eni:eniCallbackPanel ID="cbpFamilySite" ClientInstanceName="cbpFamilySite" runat="server" CreateMode="StandardMode"
                                                OnCallback="cbp_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <eni:eniFormLayout ID="flFamilySite" ClientInstanceName="flFamilySite" runat="server"
                                                            Width="100%" ShowItemCaptionColon="False">
                                                            <ClientSideEvents Init="SettingMain.cbp_Init" />
                                                            <Paddings PaddingTop="15px" />
                                                            <Styles>
                                                                <LayoutGroup CssClass="Group Padding0">
                                                                    <Cell>
                                                                        <Paddings Padding="0px" />
                                                                    </Cell>
                                                                </LayoutGroup>
                                                                <LayoutGroupBox CssClass="GroupBox">
                                                                    <Caption CssClass="Font-Medium" Font-Bold="true"></Caption>
                                                                    <BorderTop BorderWidth="2px" BorderStyle="Solid" BorderColor="#A5ACB5" />
                                                                </LayoutGroupBox>
                                                                <LayoutItem>
                                                                    <Caption CssClass=""></Caption>
                                                                    <Paddings Padding="0px" />
                                                                    <Caption BackColor="#F9F9F9" Font-Bold="true"></Caption>
                                                                    <CaptionCell BackColor="#F9F9F9" CssClass="Width200px Padding10L Padding10TB">
                                                                        <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                    </CaptionCell>
                                                                    <NestedControlCell CssClass="Padding10L Padding10TB">
                                                                        <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E9E9E9" />
                                                                    </NestedControlCell>
                                                                </LayoutItem>
                                                            </Styles>
                                                            <Items>
                                                                <dx:LayoutGroup Caption="ERP 사용자 정보" GroupBoxDecoration="HeadingLine">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="아이디(대/소 문자 구분 없음)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtErpUserId" ClientInstanceName="txtErpUserId" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="ERP 사용자 아이디를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 VAN 아이디를 입력하시면 됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="비밀번호(대/소 문자 구분)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtErpUserPw" ClientInstanceName="txtErpUserPw" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" Password="true"
                                                                                        NullText="ERP 사용자 비밀번호를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 VAN 비밀번호를 입력하시면 됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                                <dx:LayoutGroup Caption="QMS 사용자 정보" GroupBoxDecoration="HeadingLine">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="아이디(대/소 문자 구분 없음)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtQmsUserId" ClientInstanceName="txtQmsUserId" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="QMS 사용자 아이디를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 QMS 아이디를 입력하시면 됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="비밀번호(대/소 문자 구분)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtQmsUserPw" ClientInstanceName="txtQmsUserPw" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" Password="true"
                                                                                        NullText="QMS 사용자 비밀번호를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 QMS 비밀번호를 입력하시면 됩니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                                <dx:LayoutGroup Caption="FTA 사용자 정보" GroupBoxDecoration="HeadingLine">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="아이디(대/소 문자 구분 없음)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtFtaUserId" ClientInstanceName="txtFtaUserId" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" 
                                                                                        NullText="FTA 사용자 아이디를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 사용할수 없습니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                        <dx:LayoutItem Caption="비밀번호(대/소 문자 구분)">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <eni:eniTextBox ID="txtFtaUserPw" ClientInstanceName="txtFtaUserPw" runat="server" CssClass="BorderClear" 
                                                                                        Width="100%" Password="true"
                                                                                        NullText="FTA 사용자 비밀번호를 입력하세요."
                                                                                        HelpText="*협력업체의 경우 사용할수 없습니다.">
                                                                                    </eni:eniTextBox>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                            </Items>
                                                        </eni:eniFormLayout>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </eni:eniCallbackPanel>
                                            <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td width="auto"></td>
                                                    <td width="50px">
                                                        <eni:eniButton ID="btnFamilySiteSave" ClientInstanceName="btnFamilySiteSave" runat="server" 
                                                            EnableTheming="false" Text="변경사항 저장" AutoPostBack="false" 
                                                            CssClass="CButtonLWhite Font" 
                                                            HoverStyle-CssClass="CButtonLWhiteHover">
                                                            <ClientSideEvents Click="SettingMain.btnFamilySiteSave_Click" />
                                                        </eni:eniButton>
                                                    </td>
                                                    <td width="30px" class="Padding5L">
                                                        <eni:eniButton ID="btnFamilySiteCancel" ClientInstanceName="btnFamilySiteCancel" runat="server" 
                                                            EnableTheming="false" Text="취소" AutoPostBack="false" 
                                                            CssClass="CButtonLWhite Font" 
                                                            HoverStyle-CssClass="CButtonLWhiteHover">
                                                            <ClientSideEvents Click="SettingMain.btnFamilySiteCancel_Click" />
                                                        </eni:eniButton>
                                                    </td>
                                                    <td width="auto"></td>
                                                </tr>
                                            </table>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </eni:eniPageControl>
                       <%-- <div style="width:100%">
                            <p>&nbsp;</p>
                            <table style="border:1px solid #E7DEDE; background-color:#FBFBFB; width:90%; height:153px; margin:0 auto;" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="width:153px; font-size:1px;" rowspan="8">
                                        <img alt="(주)디아이씨" title=":::: (주)디아이씨 ::::" src="http://group.dicorp.co.kr/Contents/Images/Common/Signature/DIC_LOGO_Tail.png" style="border:0px;" />
                                    </td>
                                    <td style="height:15px; padding:5px 0 0 10px; font-size:17px; vertical-align:middle;" colspan="2">
                                        <strong title=":::: (주)디아이씨 ::::"><span>(주)디아이씨</span>&nbsp;&nbsp;&nbsp;<span>DAE-IL Corporation.</span></strong>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td style="width:310px; text-align:right; padding:0 10px 0 0;">
                                        <strong><span style="font-size:12px; color:#228B22;">To be the best&nbsp;<span style="font-style:italic; font-weight:bold; font-size:13px;">Powertrain</span>&nbsp;maker in the world.</span></strong>
                                    </td>
                                </tr>
                                <tr style="height:7px;"></tr>
                                <tr>
                                    <td style="width:140px; height:11px; padding:0 0 0 10px; font-size:20px; font-weight:bold; vertical-align:bottom;">
                                        <strong title="(주)디아이씨의 윤영준 입니다.">윤영준</strong>
                                    </td>
                                    <td style="width:200px; height:11px; font-size:13px; vertical-align:bottom;">
                                        <span title="저는 '전산실'에 근무중입니다.">사원 / 전산실</span>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td style="height:10px; padding:0 10px 0 0; font-size:11px; text-align:right; vertical-align:bottom;">
                                        <span title="저의 직통번호는 '052-255-0583' 입니다. 전화 많이 주세요 ^^">Tel : 052-255-0583</span>&nbsp;&nbsp;&nbsp;<span title="저의 핸드폰 번호는 '010-8537-5678' 입니다. 전화 많이 주세요 ^^">Mobile : 010-8537-5678</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:140px; height:8px; padding:0 0 0 10px; font-size:11px; vertical-align:top;">
                                        <span title="(주)디아이씨의 윤영준 입니다.">Yoon YoeungJun</span>
                                    </td>
                                    <td style="width:200px; height:8px; font-size:11px; vertical-align:top;">
                                        <span title="저는 '전산실'에 근무중입니다.">Planning / Coordination</span>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td style="height:10px; padding:0 10px 0 0; font-size:11px; text-align:right; vertical-align:top;">
                                        <span title="저의 E-Mail 주소는 'lyscryz@dicorp.co.kr' 입니다. 메일 만히 주세요 ^^">E-Mail&nbsp;:&nbsp;<a href="mailto:lyscryz@dicorp.co.kr" target="_blank">lyscryz@dicorp.co.kr</a></span>
                                    </td>
                                </tr>
                                <tr style="height:7px;"></tr>
                                <tr>
                                    <td style="height:11px; padding:0 0 0 10px; font-size:11px;" colspan="2">
                                        <strong>좋은 하루 되세요 ^^</strong>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td>

                                    </td>
                                </tr>
                                <tr style="color:#7E7A7A;">
                                    <td style="height:10px; padding:0 0 0 10px; font-size:11px; vertical-align:bottom;" colspan="2">
                                        <span title="저희 회사 오시는 주소는 '울산광역시 울주군 두동면 봉계농공길 8' 입니다.">울산광역시 울주군 두동면 봉계농공길 8</span>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td style="height:10px; padding:0 10px 0 0; font-size:11px; text-align:right; vertical-align:bottom;">
                                        <span title="대표 번호는 '052-255-0500' 부터 '052-255-0505'까지 있습니다.">Tel : 052-255-0500&nbsp;~&nbsp;5</span>
                                    </td>
                                </tr>
                                <tr style="color:#7E7A7A;">
                                    <td style="height:10px; padding:0 0 0 10px; font-size:11px; vertical-align:top;" colspan="2">
                                        <span title="저희 회사 오시는 주소는 '680, Bonggea-ri, Dudong-Myeon, Ulju-gun, Ulsan, Korea' 입니다.">680, Bonggea-ri, Dudong-Myeon, Ulju-gun, Ulsan, Korea</span>
                                    </td>
                                    <td style="width:auto;"></td>
                                    <td style="height:10px; padding:0 10px 0 0; font-size:11px; text-align:right; vertical-align:top;">
                                        <span title="대표 E-Mail 입니다.">E-Mail&nbsp;:&nbsp;<a href="mailto:dic@dicorp.co.kr" target="_blank">dic@dicorp.co.kr</a></span>
                                    </td>
                                </tr>
                            </table>
                            <p>&nbsp;</p>
                        </div>--%>

                        <%--<div>
                            <p>
                                <span lang="EN-US" style='color: black; font-family: "Times New Roman","serif";'>&nbsp;</span>
                            </p>
                            <table class="MsoNormalTable" style="border: 1pt solid rgb(219, 219, 219); border-image: none;" border="1" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr style="height: 7.5pt;">
                                        <td width="125" style="border-width: medium medium 1pt; border-style: none none solid; border-color: currentColor currentColor rgb(219, 219, 219); padding: 0cm; border-image: none; width: 93.75pt; height: 7.5pt;" rowspan="8">
                                            <p class="MsoNormal" style="line-height: 7.5pt;">
                                                <span lang="EN-US" style="font-size: 1pt;">
                                                    <img id="_x0000_i1027" alt="" src="http://www.hyundai-autoever.com/Images/Common/Signature/hae_general_logo.gif" border="0">
                                                </span>
                                                <span lang="EN-US"></span>
                                            </p>
                                        </td>
                                        <td width="14" style="border-width: medium medium 1pt; border-style: none none solid; border-color: currentColor currentColor rgb(219, 219, 219); padding: 0cm; border-image: none; width: 10.5pt; height: 7.5pt;" rowspan="8">
                                            <p class="MsoNormal" style="line-height: 7.5pt;">
                                                <span lang="EN-US" style="font-size: 1pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <span lang="EN-US"></span>
                                            </p>
                                        </td>
                                        <td style="padding: 0cm; border: currentColor; border-image: none; height: 7.5pt;" colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0cm; border: currentColor; border-image: none;">
                                            <p class="MsoNormal" style="line-height: 12pt;">
                                                <strong>김진수</strong>
                                                <span lang="EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    <span style="color: rgb(102, 102, 102); font-size: 8.5pt;">책임컨설턴트
                                                        <span lang="EN-US"> / </span>제조기술팀
                                                    </span>
                                                <span lang="EN-US"></span>
                                            </p>
                                        </td>
                                        <td style="padding: 0cm 11.25pt 0cm 0cm; border: currentColor; border-image: none;">
                                            <p align="right" class="MsoNormal" style="text-align: right;">
                                                <span lang="EN-US">
                                                    <img width="199" height="12" id="_x0000_i1028" alt="" src="http://www.hyundai-autoever.com/Images/Common/Signature/hae_general_txt.gif" border="0">

                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" style="padding: 0cm 11.25pt 0cm 0cm; border: currentColor; border-image: none;" colspan="2">
                                            <p class="MsoNormal" style="line-height: 12pt;"><span lang="EN-US" style="color: rgb(51, 51, 51); font-size: 8.5pt;">Kim JinSu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sr. Manager / Manufacturing Service Team</span><span lang="EN-US"></span></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 6pt;">
                                        <td style="padding: 0cm; border: currentColor; border-image: none; height: 6pt;" colspan="2">
                                            <p class="MsoNormal" style="mso-line-height-alt: 6.0pt;"><span lang="EN-US">&nbsp;</span></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" style="padding: 0cm 11.25pt 0cm 0cm; border: currentColor; border-image: none;" colspan="2">
                                            <p class="MsoNormal" style="line-height: 12pt;"><strong><span style="color: rgb(102, 102, 102); font-size: 9pt;">현대오토에버㈜ <span lang="EN-US">HYUNDAI AUTOEVER Corp.</span></span></strong><span lang="EN-US"></span></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 1.5pt;">
                                        <td style="padding: 0cm; border: currentColor; border-image: none; height: 1.5pt;" colspan="2">
                                            <p class="MsoNormal" style="mso-line-height-alt: 1.5pt;"><span lang="EN-US">&nbsp;</span></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" style="padding: 0cm 11.25pt 0cm 0cm; border: currentColor; border-image: none;" colspan="2">
                                            <p class="MsoNormal"><span lang="EN-US" style="color: rgb(153, 153, 153); font-size: 8.5pt;">135-847 </span><span style="color: rgb(153, 153, 153); font-size: 8.5pt;">서울특별시 강남구 영동대로<span lang="EN-US"> 417 </span>오토웨이타워<span lang="EN-US">&nbsp;&nbsp;&nbsp;Tel : 02-6296-6153&nbsp;&nbsp;&nbsp;Mobile : 010-3804-3309
                                                <br>
                                                417, Yeongdong-daero, Gangnam-gu, Seoul, 135-847, Korea&nbsp;&nbsp;&nbsp;e-mail : <a href="mailto:kjs@hyundai-autoever.com" target="_blank">kjs@hyundai-autoever.com</a> </span></span><span lang="EN-US"></span></p>
                                        </td>
                                    </tr>
                                    <tr style="height: 5.25pt;">
                                        <td style="padding: 0cm; border: currentColor; border-image: none; height: 5.25pt;" colspan="2"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <p class="MsoNormal"><span lang="EN-US" style="color: black;">&nbsp;</span></p>
                        </div>--%>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </eni:eniSplitter>
</asp:Content>
