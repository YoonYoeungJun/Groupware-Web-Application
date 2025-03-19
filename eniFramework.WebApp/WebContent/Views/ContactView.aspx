<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="ContactView.aspx.cs" Inherits="eniFramework.WebApp.Modules.ContactView" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : Contact.aspx
    *  4. Program Name         : 연락처
    *  5. Program Desc         : 연락처
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2015-07-27
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
        .eni_Web .conContacts .tvContactList span {
            line-height:13px;
            height:10px;
            display:block;
        }
        .eni_Web .conContacts .tvContactList .dxtv-btn {
            margin-top:1px !important;
        }
        .eni_Web .conContacts .btnAddContact > div {
            line-height:29px;
            line-height:35px \0/IE8+9;
            width:150px;
        }
        .eni_Web .conContacts .conContacts .itemSelected {
            background-color:black;
        }
    </style>
    <script type="text/javascript">
        // <![CDATA[
        var $conContacts = $;
        var Contacts = eni.Initialize(new function () {
            this.iFrameName = "ModuleView";
            this.ViewType = ViewType.View;
            this.Form_Load = function () {
                $conContacts = $(".conContacts");
                //eni.Loading.ChangeDefaultMode();

            };
            this.Form_Load_Complate = function () {
            };

            this.PageResize = function (e) {
                try {
                    switch (eni.UserAgent.Browser.Type) {
                        case "IE":
                            if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                                $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112);
                            } else {//IE 10 미만
                                $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112);
                            }
                            break;
                        case "OPERA": $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112); break;
                        case "FIREFOX": $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112); break;
                        case "CHROME": $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112); break;
                        case "SAFARI": $conContacts.find("#conContactList").height(document.documentElement.offsetHeight - 112); break;
                        default: $Contacts.find("#conContactList").height(document.documentElement.offsetHeight - 112); break;
                    }
                } catch (ex) {
                    if (eni.Message) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };

            this.nbContactList_ItemClick = function (s, e) {
                switch (e.item.group.name) {
                    case "MyContacts":
                    case "PublicContacts":
                        eni.ExecuteSubPageCommand(e.item.group.name, { ContactGroup: e.item.name });
                        break;
                    case "InOutContacts":
                        if (e.item.name == "Import") {
                            eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>contact/import");
                        } else if (e.item.name == "Export") {
                            eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>contact/import");
                        }
                        break;
                }
            };
        });
        // ]]>
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- [STA]뷰 레이아웃 --%>
    <eni:eniSplitter ID="spLayout" ClientInstanceName="spLayout" CssClass="conContacts splLayout" CreateMode="StandardMode" SkinID="Standard" runat="server" >
        <Panes>
            <dx:SplitterPane Size="210" MinSize="210" MaxSize="210" ScrollBars="None" ShowCollapseBackwardButton="True"
                PaneStyle-BackColor="#F6F6F6">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <%--OnCallback="eniCbPanNavBoardMenu_Callback"
                            ClientSideEvents-BeginCallback="Contacts.eniCbPanNavBoardMenu_BeginCallback"
                            ClientSideEvents-EndCallback="Contacts.eniCbPanNavBoardMenu_EndCallback"
                            ShowLoadingPanel="False"--%>
                        <eni:eniCallbackPanel ID="eniCbPanNavBoardMenu" ClientInstanceName="eniCbPanNavBoardMenu" runat="server"
                            EnableCallbackAnimation="false" >
                            <PanelCollection>
                                <dx:PanelContent>
                                    <%--<eni:eniHiddenField ID="BoardMenuHidFields" ClientInstanceName="BoardMenuHidFields" runat="server"></eni:eniHiddenField>--%>
                                    <table class="FullScreen BorderClear Padding0 Margin0" cellpadding="0" cellspacing="0" border="0">
                                        <tr class="VerticalAlignCM" style="height:50px; border-bottom:1px solid #E6E6E6">
                                            <td class="Font-Large Font-Bold Font-Align-Left Padding15L" style="color:black;">
                                                연락처
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height:60px; border-bottom:1px solid #E6E6E6">
                                                <div style="text-align:center">
                                                    <eni:eniButton ID="btnAddContact" ClientInstanceName="btnAddContact" EnableTheming="false" runat="server"
                                                        Width="150px" Height="35px" AutoPostBack="false" 
                                                        Text="연락처추가" ToolTip="연락처추가" Enabled="false"
                                                        CssClass="btnAddContact CButtonXLWhite Font-Bold"
                                                        HoverStyle-CssClass="CButtonXLWhiteHover"
                                                        PressedStyle-CssClass="CButtonXLWhitePress">
                                                        <ClientSideEvents Click="Contacts.btnAddContact_Click" />
                                                    </eni:eniButton>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="VerticalAlignT">
                                                <div id="conContactList" class="VerticalAutoScroll">
                                                    <%--<eni:eniTreeView ID="tvContactList" ClientInstanceName="tvContactList" CssClass="tvContactList Padding10T" runat="server"
                                                        OnPreRender="tvContactList_PreRender" EncodeHtml="false">
                                                        <ClientSideEvents NodeClick="Contacts.tvContactList_Click" />
                                                    </eni:eniTreeView>--%>
                                                    <dx:ASPxNavBar ID="nbContactList" ClientInstanceName="nbContactList" CssClass="nbContactList" runat="server"
                                                        Width="100%" AllowSelectItem="true" EnableAnimation="True" EnableCallbackAnimation="True" EnableCallBacks="True"
                                                        ExpandButtonPosition="Right" EncodeHtml="false"
                                                        BackColor="#F6F6F6"
                                                        Border-BorderWidth="0px"
                                                        GroupContentStyle-Border-BorderWidth="0px" 
                                                        SpriteImageUrl="~/Contents/Images/ICO-SET12.png">
                                                        <ClientSideEvents ItemClick="Contacts.nbContactList_ItemClick" />
                                                        <GroupHeaderStyle BackColor="Transparent">
                                                            <BackgroundImage ImageUrl="none" />
                                                            <Border BorderWidth="0px" />
                                                        </GroupHeaderStyle>
                                                        <ItemStyle Height="22px" Cursor="pointer" Wrap="Default">
                                                            <BackgroundImage ImageUrl="none" />
                                                            <Border BorderWidth="1px" />
                                                            <HoverStyle BackColor="#29A1ED" ForeColor="White">
                                                                <Border BorderWidth="0px" />
                                                                <BorderTop BorderWidth="1px" BorderStyle="Solid"  BorderColor="#2275A9" />
                                                                <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#004672" />
                                                            </HoverStyle>
                                                            <SelectedStyle BackColor="#2484C0" ForeColor="White">
                                                                <Border BorderWidth="0px" />
                                                                <BorderTop BorderWidth="1px" BorderStyle="Solid"  BorderColor="#2275A9" />
                                                                <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#004672" />
                                                            </SelectedStyle>
                                                            <Paddings PaddingLeft="30px" PaddingTop="3px" PaddingBottom="3px"/>
                                                        </ItemStyle>
                                                        <Groups>
                                                            <dx:NavBarGroup Name="MyContacts" Text="개인 주소록">
                                                                <HeaderStyle BackColor="Transparent" Font-Bold="true" Font-Size="14px">
                                                                    <BackgroundImage ImageUrl="none" />
                                                                    <BorderTop BorderWidth="1px" BorderStyle="Solid" BorderColor="White" />
                                                                    <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E6E6E6" />
                                                                </HeaderStyle>
                                                                <HeaderImage Width="20px" Height="20px">
                                                                    <SpriteProperties Top="100px" Left="52px" />
                                                                </HeaderImage>
                                                                <CollapseImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="201px" Left="102px" />
                                                                </CollapseImage>
                                                                <ExpandImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="151px" Left="102px" />
                                                                </ExpandImage>
                                                                <Items>
                                                                    <dx:NavBarItem Name="AllContacts" Text="전체 주소록">
                                                                        <Image Width="16px" Height="16px">
                                                                            <SpriteProperties Top="52px" Left="102px" SelectedTop="52px" SelectedLeft="102px" SelectedCssClass="itemSelected"  />
                                                                        </Image>
                                                                    </dx:NavBarItem>
                                                                    <dx:NavBarItem Name="GroupwareContacts" Text="사내 주소록">
                                                                        <Image Width="16px" Height="16px">
                                                                            <SpriteProperties Top="52px" Left="102px" SelectedTop="52px" SelectedLeft="102px" SelectedCssClass="itemSelected"  />
                                                                        </Image>
                                                                    </dx:NavBarItem>
                                                                    <dx:NavBarItem Name="MyContactsGroup" Text="연락처 그룹">
                                                                        <Image Width="16px" Height="16px">
                                                                            <SpriteProperties Top="52px" Left="102px" SelectedTop="52px" SelectedLeft="102px" SelectedCssClass="itemSelected"  />
                                                                        </Image>
                                                                    </dx:NavBarItem>
                                                                </Items>
                                                            </dx:NavBarGroup>
                                                            <dx:NavBarGroup Name="PublicContacts" Text="공용 주소록">
                                                                <HeaderStyle BackColor="Transparent" Font-Bold="true" Font-Size="14px">
                                                                    <BackgroundImage ImageUrl="none" />
                                                                    <BorderTop BorderWidth="1px" BorderStyle="Solid" BorderColor="White" />
                                                                    <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E6E6E6" />
                                                                </HeaderStyle>
                                                                <HeaderImage Width="20px" Height="20px">
                                                                    <SpriteProperties Top="0px" Left="52px" />
                                                                </HeaderImage>
                                                                <CollapseImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="201px" Left="102px" />
                                                                </CollapseImage>
                                                                <ExpandImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="151px" Left="102px" />
                                                                </ExpandImage>
                                                            </dx:NavBarGroup>
                                                            <dx:NavBarGroup Name="InOutContacts" Text="가져오기 / 내보내기">
                                                                <HeaderStyle BackColor="Transparent" Font-Bold="true" Font-Size="14px">
                                                                    <BackgroundImage ImageUrl="none" />
                                                                    <BorderTop BorderWidth="1px" BorderStyle="Solid" BorderColor="White" />
                                                                    <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#E6E6E6" />
                                                                </HeaderStyle>
                                                                <HeaderImage Width="20px" Height="20px">
                                                                    <SpriteProperties Top="300px" Left="52px" />
                                                                </HeaderImage>
                                                                <CollapseImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="201px" Left="102px" />
                                                                </CollapseImage>
                                                                <ExpandImage Width="16px" Height="16px">
                                                                    <SpriteProperties Top="151px" Left="102px" />
                                                                </ExpandImage>
                                                                <Items>
                                                                    <dx:NavBarItem Name="Import" Text="가져오기" ToolTip="가져오기">
                                                                        <Image Width="16px" Height="16px">
                                                                            <SpriteProperties Top="351px" Left="202px" SelectedTop="351px" SelectedLeft="202px" SelectedCssClass="itemSelected" />
                                                                        </Image>
                                                                    </dx:NavBarItem>
                                                                    <dx:NavBarItem Name="Export" Text="내보내기" ToolTip="개발중..." ClientEnabled="false">
                                                                        <Image Width="16px" Height="16px">
                                                                            <SpriteProperties Top="302px" Left="202px" SelectedTop="302px" SelectedLeft="202px" SelectedCssClass="itemSelected"  />
                                                                        </Image>
                                                                    </dx:NavBarItem>
                                                                </Items>
                                                            </dx:NavBarGroup>
                                                        </Groups>
                                                    </dx:ASPxNavBar>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </eni:eniCallbackPanel>

                        <!-- [END]뷰 메뉴 레이아웃 -->
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="ModuleView" ContentUrlIFrameTitle="ModuleView" ContentUrlIFrameName="ModuleView" ScrollBars="Auto" ContentUrl="~/Contact/List"
                AllowResize="False"
                PaneStyle-BackColor="#F6F6F6"
                Separator-SeparatorStyle-BackColor="#F6F6F6"
                Separator-SeparatorStyle-HoverStyle-BackColor="#E7E7E7"
                Separator-SeparatorStyle-BorderLeft-BorderWidth="1px"
                Separator-SeparatorStyle-BorderLeft-BorderStyle="Solid"
                Separator-SeparatorStyle-BorderLeft-BorderColor="#E6E6E6"
                Separator-SeparatorStyle-BorderRight-BorderWidth="1px"
                Separator-SeparatorStyle-BorderRight-BorderStyle="Solid"
                Separator-SeparatorStyle-BorderRight-BorderColor="#C0C0C0"
                Separator-ButtonStyle-CssClass="Height100f">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </eni:eniSplitter>
</asp:Content>
