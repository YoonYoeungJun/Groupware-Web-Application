<%@ Page Title="" Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="eniFramework.WebApp.Modules.Contact.List" %>

<%@ Import Namespace="eniFramework.WebApp.Common" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Contact
    *  2. Function Name        :
    *  3. Program ID           : List.aspx
    *  4. Program Name         : 주소록 확인
    *  5. Program Desc         : 주소록 확인
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
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
        ViewLayout = ASPxClientSplitter.Cast();
        tabContactsIndex = ASPxClientPageControl.Cast();
        mnToolbar = ASPxClientMenu.Cast();
        gdvContactsList = ASPxClientGridView.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .eni_Web .conContactsListView {
            height:100%;
        }
        /* 툴바 컨테이너 */
        .eni_Web .conContactsListView .conMenu {
            position: relative;
            height: 35px;
            background-color:#F6F6F6;
            border-bottom:1px solid #C0C0C0;
        }
        .eni_Web .conContactsListView .conMenu .mnToolbar .dx.dxm-image-l {
            width:100%;
        }
        .eni_Web .conContactsListView .conMenu .mnToolbar span.dx-vam {
            line-height:23px;
            height:18px;
            display:block;
        }

        

        /* 내용부 */
        .eni_Web .conContactsListView .conContent {
            position: absolute;
            left: 0px; 
            top: 35px; 
            right: 0px; 
            bottom: 0px; 
        }
        /* 인덱스 텝 */
        .eni_Web .conContactsListView .conContent .indexlist_wrap {
            height:27px;
        }
        .eni_Web .conContactsListView .conContent .indexlist_wrap .tabContactsIndex .tabItemGroup {
            border-top-left-radius:5px;
        }
        .eni_Web .conContactsListView .conContent .indexlist_wrap .tabContactsIndex .tabItemETC {
            border-top-right-radius:5px;
        }
        /* 연락처 리스트 */
        .eni_Web .conContactsListView .conContent .contactslist_wrap {
            position: absolute;
            left: 0px; 
            top: 27px; 
            right: 0px; 
            bottom: 0px; 
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList {
            background-color:white;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .hrow {
            height: 22px;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .hrow.dxgvHeader_eniThm {
            padding: 0px 0px 0px 8px;
            border:1px solid #C0C0C0;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .hrow.dxgvHeader_eniThm td {
            vertical-align:bottom !important;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .grow {
            height: 22px;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .grow td.dxgv {
            padding: 3px 0px 1px 8px;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .drow {
            height: 22px;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .drow:hover {
            background-color:#C8D7FF;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .drow td.dxgv {
            padding: 3px 0px 1px 0px;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .dxgvFSDC {
            border-top:1px solid #C0C0C0;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .dxpLite_eniThm {
            margin-left: auto;
            margin-right: auto;
            float:none;
            width:10% !important;
            height:33px;
            overflow:hidden;
            padding:4px 2px 0px;
            display:block !important;
        }
        .eni_Web .conContactsListView .conContent .contactslist_wrap .gdvContactsList .dxpLite_eniThm .dxp-pageSizeItem.dxp-right {
            position:absolute;
            right:0px;
        }

        /* GridView 로딩 패널 디자인 */
        /*.CInnerLoadingPanel {
            background: #494949 none;
            filter:Alpha(Opacity=80);
            opacity:0.8;
        }*/
        .CInnerLoadingDiv {
            background: #E9E9E9 none;
            filter:Alpha(Opacity=30);
            opacity:0.3;
        }
        .eni_Web .conContactsListView .conContent .dxgvLoadingPanel_eniThm {
	        background: #FFFFFF none;
            border-collapse: separate;
	        border: 1px solid #80858d;
            border-radius: 7px;
            -ms-border-radius: 7px;
            -moz-border-radius: 7px;
            -o-border-radius: 7px;
	        -webkit-border-radius: 7px;
        }
        .eni_Web .conContactsListView .conContent .dxgvLoadingPanel_eniThm .dxlp-loadingImage {
	        background-image: url('<%=lgUrlInfo.VirtualPath%>Contents/Images/Loading/Loading_16x16.gif');
	        height: 16px;
	        width: 16px;
        }
        .eni_Web .conContactsListView .conContent .dxlpLoadingPanel_eniThm td.dx {
            padding:15px !important;
        }
        .eni_Web .conContactsListView .conContent .dxgvLoadingPanel_eniThm td.dx .dxlp-loadingImage.dxlp-imgPosLeft {
            margin-right:14px !important;
        }
        .eni_Web .conContactsListView .conContent .dxgvLoadingPanel_eniThm td.dx:last-child {
            display:none;
        }
    </style>

    <script type="text/javascript">
        // <![CDATA[
        /*==============================================================================
        '  NameSpace    : eniFramework.WebApp.Groupware.WebContent.Views.Modules.Contacts
        '  Class        : ContactsListView 
        '  Desc         : 열락처 리스트뷰 클래스
        '  FirstCreated : 2015-07-27 
        '  Lastmodified : 2015-07-27
        '  Remarks      : 
        '==============================================================================*/
        try {
            // DataType : Object
            // Desc : Callback 오브젝트
            var MailListCallBackArgs = function () {
                this.Command = CommandType.None;
                this.DataList = new Array();
            };
            // DataType : Object
            // Desc : MailListCallBackArgs의 오브젝트의 DataList 속성 명시적 
            var DataRow = function () {
                this.mfid = null;
                this.MessageID = null;
                this.MessageFlags = null;
            };
            // DataType : Enum
            // Desc : 비하인드 코드에 콜백 요청을 보낼때 명시적인 값을 사용하여 요청을 보낸다.
            var CommandType = {
                None: -1, MessageReadState: 1, MessageDelete: 2, MessageAddSpam: 3, MessasgeReply: 4, MessageDelivery: 5, MessageMove: 6,
                Fagged: 10
            };

            var DbQueryCallBackArgsClass = function () {
                this.Index = -1;
            };
            
            var ContactsListView = eni.Initialize(new function () {
                var $contactslist_wrap = $();
                this.Title = "";
                this.iFrameName = "_blank";
                this.ViewType = ViewType.ModuleView;
                this.Form_Load = function () {
                    $contactslist_wrap = $("#contactslist_wrap");
                };
                this.Form_Load_Complate = function () {
                    
                };
                this.SetLocalDefaultValue = function () {
                };


                this.PageResize = function (e) {
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

                this.ExecuteSubPageCommand = function (sCmd, oArgs, fCallback) {
                    switch (sCmd) {
                        case "MyContacts":
                        case "PublicContacts":
                            hidFields.Set("Contacts", sCmd);
                            hidFields.Set("ContactsGroup", oArgs.ContactGroup);

                            var callbackArgs = new BaseCallbackArgsClass();
                            callbackArgs.Cmd = sCmd;
                            callbackArgs.CmdDetail = oArgs.ContactGroup;

                            gdvContactsList.PerformCallback(callbackArgs.Serialize());
                            tabContactsIndex.SetActiveTabIndex(1);
                            break;
                    }
                };

                this.tabContactsIndex_ActiveTabChanged = function (s, e) {
                    if (e.tab.clientEnabled && gdvContactsList.InCallback() === false) {
                        var callbackArgs = new BaseCallbackArgsClass();
                        callbackArgs.Cmd = "IndexChange";
                        
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
    <div class="conContactsListView">
        <div id="conMenu" class="conMenu">
            <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" CssClass="mnToolbar Padding10LR Padding5T" SkinID="MailToolbar" runat="server">
                <ClientSideEvents ItemClick="ContactsListView.mnToolbar_Click" />
                <Items>
                    <dx:MenuItem Name="btnAddContact" Text="연락처 추가" ItemStyle-Cursor="pointer" ClientEnabled="false"></dx:MenuItem>
                </Items>
            </eni:eniMenu>
        </div>
        <div id="conContent" class="conContent">
            <div id="indexlist_wrap" class="indexlist_wrap">
                <dx:ASPxTabControl ID="tabContactsIndex" ClientInstanceName="tabContactsIndex" CssClass="tabContactsIndex" runat="server"
                    Width="100%" TabSpacing="0" ActiveTabIndex="1" EnableHierarchyRecreation="true" Font-Size="11px">
                    <ClientSideEvents ActiveTabChanged="ContactsListView.tabContactsIndex_ActiveTabChanged" />
                    <Paddings PaddingTop="5px" />
                    <TabStyle BackColor="White" ForeColor="#BCBCBC">
                        <HoverStyle BackColor="#F6F6F6" ForeColor="#595959"></HoverStyle>
                        <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                        <BorderLeft BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                        <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="0px" />
                        <Paddings PaddingLeft="5px" PaddingRight="5px" PaddingTop="3px" PaddingBottom="2px" />
                    </TabStyle>
                    <ActiveTabStyle BackColor="#F6F6F6" ForeColor="#595959">
                        <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                        <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="0px" />
                        <BorderBottom BorderWidth="0px" />
                        <BorderLeft BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                    </ActiveTabStyle>
                    <ContentStyle Border-BorderWidth="0px">
                        <Border BorderWidth="0px"/>
                        <BorderTop BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <Tabs>
                        <dx:Tab Name="Group" Text="그룹" ClientEnabled="false">
                            <TabStyle CssClass="tabItemGroup"></TabStyle>
                        </dx:Tab>
                        <dx:Tab Name="All" Text="전체"></dx:Tab>
                        <dx:Tab Name="ㄱ" Text="ㄱ" />
                        <dx:Tab Text="ㄴ" />
                        <dx:Tab Text="ㄷ" />
                        <dx:Tab Text="ㄹ" />
                        <dx:Tab Text="ㅁ" />
                        <dx:Tab Text="ㅂ" />
                        <dx:Tab Text="ㅅ" />
                        <dx:Tab Text="ㅇ" />
                        <dx:Tab Text="ㅈ" />
                        <dx:Tab Text="ㅊ" />
                        <dx:Tab Text="ㅋ" />
                        <dx:Tab Text="ㅌ" />
                        <dx:Tab Text="ㅍ" />
                        <dx:Tab Text="ㅎ" />
                        <dx:Tab Text="A-Z" />
                        <dx:Tab Text="0-9" />
                        <dx:Tab Text="etc">
                            <TabStyle CssClass="tabItemETC">
                                <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                            </TabStyle>
                            <ActiveTabStyle>
                                <BorderRight BorderColor="#C0C0C0" BorderStyle="Solid" BorderWidth="1px" />
                            </ActiveTabStyle>
                        </dx:Tab>
                    </Tabs>
                </dx:ASPxTabControl>
            </div>
            <div id="contactslist_wrap" class="contactslist_wrap">
                <%--  OnHtmlDataCellPrepared="gdvMailList_HtmlDataCellPrepared"
                OnCustomCallback="gdvMailList_CustomCallback"
                OnCustomDataCallback="gdvMailList_CustomDataCallback"
                OnCustomGroupDisplayText="gdvMailList_CustomGroupDisplayText"
                OnSummaryDisplayText="gdvMailList_SummaryDisplayText"--%>
                <eni:eniGridView ID="gdvContactsList" ClientInstanceName="gdvContactsList" CssClass="gdvContactsList" runat="server" SkinID="ContactsList"
                    KeyFieldName="CON_NO"
                    OnCustomCallback="gdvContactsList_CustomCallback">
                    <Styles>
                        <SearchPanel BackColor="#F6F6F6"></SearchPanel>
                        <Header CssClass="hrow"></Header>
                        <GroupRow CssClass="grow"></GroupRow>
                        <Row CssClass="drow"></Row>
                        <LoadingDiv CssClass="CInnerLoadingDiv"></LoadingDiv>
                        <LoadingPanel CssClass="CInnerLoadingPanel"></LoadingPanel>
                    </Styles>
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" Width="25px" MinWidth="25" VisibleIndex="0" ShowInCustomizationForm="False" AllowDragDrop="False">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderLRClear Padding5L" Wrap="True"/>
                            <HeaderCaptionTemplate>
                                <dx:ASPxCheckBox ID="chkAllSelectRow" runat="server" CssClass="Padding0" Wrap="True" Cursor="pointer">
                                    <ClientSideEvents CheckedChanged="function(s, e){ gdvMailList.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </dx:ASPxCheckBox> 
                            </HeaderCaptionTemplate>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Name="CON_NO" FieldName="CON_NO" Caption="번호"
                            ReadOnly="True" Width="130px" MinWidth="80" Visible="false">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="2" Name="CON_NM" FieldName="CON_NM" Caption="이름"
                            ReadOnly="True" Width="130px" MinWidth="80">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="3" Name="CON_PN" FieldName="CON_PN" Caption="전화번호"
                            ReadOnly="True" Width="130px" MinWidth="80">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="4" Name="CON_EM" FieldName="CON_EM" Caption="이메일"
                            ReadOnly="True" Width="100%">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="5" Name="CON_ORG_BIZ_NM" FieldName="CON_ORG_BIZ_NM" Caption="소속"
                            ReadOnly="True" Width="130px" MinWidth="80">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="6" Name="CON_ORG_DEPT_NM" FieldName="CON_ORG_DEPT_NM" Caption="부서"
                            ReadOnly="True" Width="130px" MinWidth="80">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="7" Name="CON_ORG_PSTN_NM" FieldName="CON_ORG_PSTN_NM" Caption="직급"
                            ReadOnly="True" Width="130px" MinWidth="80">
                            <HeaderStyle VerticalAlign="Middle" CssClass="BorderRightClear Padding5LR"/>
                            <CellStyle Wrap="False" CssClass="Padding5LR"></CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </eni:eniGridView>
            </div>
        </div>
    </div>
</asp:Content>
