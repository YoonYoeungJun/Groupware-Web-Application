<%@ Page Title="" Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="WebHardView.aspx.cs" Inherits="eniFramework.WebApp.Modules.WebHardView" %>

<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%@ Import Namespace="eniFramework" %>
<%@ Import Namespace="eniFramework.WebApp.Common" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : WebHardView.aspx
    *  4. Program Name         : 웹하드
    *  5. Program Desc         : 웹하드
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2015-10-22
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
        fmWebHard = ASPxClientFileManager.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .dxpc-mainDiv.DetailsPopup
        {
            border-width: 4px; 
        }
        .dxpc-mainDiv.DetailsPopup .dxpc-content
        {
            padding: 0;
        }
        .dxpc-mainDiv.DetailsPopup .dxpc-content > div
        {
            margin: auto;
        }
        .dxpc-mainDiv.DetailsPopup .dxflGroupSys
        {
            padding-top: 12px;
            padding-bottom: 12px;
        }
        .dxpc-mainDiv.DetailsPopup .dxflCaptionCellSys label
        {
            color: #929292;
        }
    </style>
    <script type="text/javascript">
        // <![CDATA[
        var board_view = eni.Initialize(new function () {
            this.iFrameName = "_blank";
            this.Title = eni.GetTitle() + " : " + "<%= GetGlobalResource("QuickName") %>";
            this.ViewType = ViewType.ModuleView;
            this.Form_Load = function () {
            };

            this.Form_Load_Complate = function () {
            };

            this.PageResize = function (e) {
                try {
                    switch (eni.UserAgent.Browser.Type) {
                        case "IE":
                            if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                            } else {//IE 10 미만
                            }
                            break;
                        case "OPERA":
                            break;
                        case "FIREFOX":
                            break;
                        case "CHROME":
                            break;
                        case "SAFARI":
                            break;
                        default:
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

        function OnCustomCommand(s, e) {
            switch (e.commandName) {
                case "ChangeView-Thumbnails":
                    fmWebHard.PerformCallback("Thumbnails");
                    break;
                case "ChangeView-Details":
                    fmWebHard.PerformCallback("Details");
                    break;
                case "Properties":
                    PopupControl.PerformCallback(fmWebHard.GetActiveAreaName());
                    break;
            }
        }
        function OnToolbarUpdating(s, e) {
            var enabled = (e.activeAreaName == "Folders" || fmWebHard.GetSelectedItems().length > 0) && e.activeAreaName != "None";
            fmWebHard.GetToolbarItemByCommandName("Properties").SetEnabled(enabled);
            fmWebHard.GetContextMenuItemByCommandName("Properties").SetEnabled(enabled);
        }
        function OnPopupEndCallback(s, e) {
            PopupControl.SetHeaderText(PopupControl.cpHeaderText);
            PopupControl.ShowAtElement(fmWebHard.GetMainElement());
        }
        function OnSelectedFileOpened(s, e) {
            var a = fmWebHard.GetCurrentFolderPath();
            var t = ASPxClientFileManagerFileOpenedEventArgs.prototype;
            
            var url = String(e.file.GetFullName()).replace("\\\\", "/").replace("\\", "/").replace("(주)디아이씨", "webhard");
            //window.open(e.file.GetFullName());
            e.processOnServer = false;
            //eni.RunPageFrame("/uploadfiles/" + url, "_blank");

            //window.open(encodeURI("/uploadfiles/" + url), "_blank", "", "");
            //window.open(encodeURI("/uploadfiles/" + url), "_blank", "aaaaa", "asdf");
            var fileName = String(e.file.name);
            if (fileName.indexOf("pdf") > 0 || fileName.indexOf("jpg") > 0 || fileName.indexOf("jpeg") > 0 || fileName.indexOf("gif") > 0 || fileName.indexOf("png") > 0) {
                window.open(encodeURI("/uploadfiles/" + url), "_blank", "channermode=no;fullscreen:no;toolbar:no;menubar:no;location:no;status:no;width:no;height:no;");
            } else {
                e.file.Download();
            }

            //eni.RunPageFrame("/uploadfiles/" + url);
            //dialogHeight:sHeight - 다이얼로그 창의 높이를 지정

            //dialogLeft:sXPo - 창의 왼쪽에서 부터의 위치

            //dialogTop:sYPos - 창의 상단에서의 위치

            //dialogWidth:sWidth - 다이얼로그 창의 길이를 지정

            //center:{ yes | no | 1 | 0 | on | off } - 위치를 지정하지 않을경우 창의 위치를 중앙에 놓을지 여부

            //help:{ yes | no | 1 | 0 | on | off } - 도움말 보이기/보이지 않기

            //resizable:{ yes | no | 1 | 0 | on | off } - 창크기변형을 할수 있나 없나

            //scroll:{ yes | no | 1 | 0 | on | off } - 스크롤바의 유/무

            //status:{ yes | no | 1 | 0 | on | off } - 상태바를 표시/표시안함

            //window.open(encodeURI("/uploadfiles/" + url), "", "resize:yes; help:no; status:no;");
            //window.showModalDialog(encodeURI("/uploadfiles/" + url), "", "dialogWidth:700px; dialogHeight:700px; scroll:yes; center:yes; help:no; status:no;");
        }

        // ]]>
    </script>
</asp:Content>
<%--ThumbnailFolder="D:\\ShareFTP\\DICUser\\Thumb"--%>
<%--<Settings RootFolder="D:\\ShareFTP\\DICUser" />--%>
<%--<Settings EnableMultiSelect="true" />--%>
<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%--ProviderType="Physical" CustomFileSystemProviderTypeName="eniFramework.WebApp.Groupware.WebContent.Views.Provider"--%>
    <%--CustomFileSystemProviderTypeName="eniFramework.WebApp.Groupware.WebContent.Views.LinqFileSystemProvider"--%>
     <%--<SettingsPermissions>
            <AccessRules>
                <dx:FileManagerFolderAccessRule Path="" Browse="Deny" />
                <dx:FileManagerFolderAccessRule Path="lyscryz" Browse="Allow" EditContents="Allow" />
                <dx:FileManagerFolderAccessRule Path="클라우드" Browse="Allow" EditContents="Allow" Upload="Deny"/>
                <dx:FileManagerFolderAccessRule Path="클라우드\차량사업부 전산실 스캔" Browse="Allow" EditContents="Allow" Upload="Deny"/>
            </AccessRules>
        </SettingsPermissions>--%>
    <eni:eniFileManager ID="fmWebhard" ClientInstanceName="fmWebHard" runat="server" SkinID="Advanced-01"
        Width="100%" Height="100%" 
        OnSelectedFileOpened="fmWebhard_SelectedFileOpened" 
        OnCloudProviderRequest="fmWebhard_CloudProviderRequest" 
        OnCustomCallback="fmWebhard_CustomCallback"
        OnDataBinding="fmWebhard_DataBinding"
        OnItemRenaming="fmWebhard_ItemRenaming"
        OnItemCopying="fmWebhard_ItemCopying"
        OnItemMoving="fmWebhard_ItemMoving"
        OnItemDeleting="fmWebhard_ItemDeleting" 
        ProviderType="Physical" CustomFileSystemProviderTypeName="eniFramework.WebApp.Modules.Provider"
        SettingsFolders-EnableCallBacks="True" SettingsUpload-AutoStartUpload="True">
        <ClientSideEvents CustomCommand="OnCustomCommand" ToolbarUpdating="OnToolbarUpdating" SelectedFileOpened="OnSelectedFileOpened" />
        <Settings EnableMultiSelect="true" />
        <SettingsEditing AllowRename="true" AllowMove="true" AllowCopy="true" AllowDelete="true"  AllowCreate="true" AllowDownload="true"/>
        <SettingsFileList ShowFolders="true" ShowParentFolder="true">
            <DetailsViewSettings AllowColumnResize="true" AllowColumnDragDrop="true" AllowColumnSort="false" ShowHeaderFilterButton="true" />
        </SettingsFileList>
        <SettingsBreadcrumbs Visible="true" ShowParentFolderButton="true" Position="Top" />
        <SettingsFolders EnableCallBacks="true" />
        <StylesDetailsView AlternatingRow-Enabled="True" >
        </StylesDetailsView>
        <SettingsUpload UseAdvancedUploadMode="true" AutoStartUpload="true" >
            <AdvancedModeSettings EnableMultiSelect="true" />
        </SettingsUpload>
        <SettingsToolbar>
            <Items>
                <dx:FileManagerToolbarCustomButton CommandName="Properties">
                    <Image IconID="setup_properties_16x16" />
                </dx:FileManagerToolbarCustomButton>
                <dx:FileManagerToolbarRefreshButton BeginGroup="false" />
                <dx:FileManagerToolbarCustomButton Text="이미지뷰" CommandName="ChangeView-Thumbnails" GroupName="ViewMode">
                    <Image IconID="grid_cards_16x16" />
                </dx:FileManagerToolbarCustomButton>
                <dx:FileManagerToolbarCustomButton Text="상세뷰" CommandName="ChangeView-Details" GroupName="ViewMode">
                    <Image IconID="grid_grid_16x16" />
                </dx:FileManagerToolbarCustomButton> 
                <dx:FileManagerToolbarCopyButton BeginGroup="false"></dx:FileManagerToolbarCopyButton>
                <dx:FileManagerToolbarCreateButton BeginGroup="false"></dx:FileManagerToolbarCreateButton>
                <dx:FileManagerToolbarRenameButton BeginGroup="false"></dx:FileManagerToolbarRenameButton>
                <dx:FileManagerToolbarDeleteButton BeginGroup="false"></dx:FileManagerToolbarDeleteButton>
                <dx:FileManagerToolbarMoveButton BeginGroup="false"></dx:FileManagerToolbarMoveButton>
                <dx:FileManagerToolbarDownloadButton></dx:FileManagerToolbarDownloadButton>
                <dx:FileManagerToolbarUploadButton></dx:FileManagerToolbarUploadButton>
            </Items>
        </SettingsToolbar>
        <SettingsContextMenu Enabled="true">
            <Items>
                <dx:FileManagerToolbarMoveButton />
                <dx:FileManagerToolbarCopyButton />
                <dx:FileManagerToolbarRenameButton BeginGroup="true" />
                <dx:FileManagerToolbarDeleteButton />
                <dx:FileManagerToolbarRefreshButton BeginGroup="false" />
                <dx:FileManagerToolbarCustomButton Text="Properties" CommandName="Properties" BeginGroup="true">
                    <Image IconID="setup_properties_16x16" />
                </dx:FileManagerToolbarCustomButton>
                <dx:FileManagerToolbarDownloadButton></dx:FileManagerToolbarDownloadButton>
                <dx:FileManagerToolbarUploadButton></dx:FileManagerToolbarUploadButton>
            </Items>
        </SettingsContextMenu>
    </eni:eniFileManager>

    <dx:ASPxPopupControl ID="PopupControl" runat="server" ClientInstanceName="PopupControl" OnWindowCallback="PopupControl_WindowCallback" Width="430" 
        ShowHeader="true" ShowFooter="false" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle" AllowDragging="true" DragElement="Header" CssClass="DetailsPopup" CloseOnEscape="true">
        <ClientSideEvents EndCallback="OnPopupEndCallback" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <dx:ASPxFormLayout ID="FormLayout" runat="server" AlignItemCaptionsInAllGroups="True">
                    <Items>
                        <dx:LayoutGroup Caption=" " GroupBoxDecoration="None">
                            <Items>
                                <dx:LayoutItem Caption="파일이름">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Name" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="타입">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Type" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption=" " GroupBoxDecoration="None">
                            <Items>
                                <dx:LayoutItem Caption="Location">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Location" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="저장 경로">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="RelativeLocation" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="크기">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Size" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Contains" Name="Contains">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Contains" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption=" " GroupBoxDecoration="None">
                            <Items>
                                <dx:LayoutItem Caption="생성일자">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Created" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="수정일자" Name="Modified">
                                    <LayoutItemNestedControlCollection >
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Modified" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="접근일자" Name="Accessed">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxLabel ID="Accessed" runat="server" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
