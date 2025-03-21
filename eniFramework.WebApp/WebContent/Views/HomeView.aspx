﻿<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="HomeView.aspx.cs" Inherits="eniFramework.WebApp.Modules.HomeView" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.1.Web, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : HomeView.aspx
    *  4. Program Name         : HomeView 페이지
    *  5. Program Desc         : HomeView 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2016-03-03
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
    <script type="text/javascript">
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .homeview .head_wrap .txtSearchBox .dxic {
            padding-left:10px;
            padding-right:50px;
        }
    </style>
    <script type="text/javascript">
        var HomeView = eni.Initialize(new function () {
            var $HomeView_ = $;

            var disableToolbar = false;
            var toolbarStatus = "";
            var curPgNm = "Home";

            this.Title = eni.GetTitle();
            this.iFrameName = "ModuleView";
            this.ViewType = ViewType.ModuleView;
            this.Form_Load = function () {
                
            };
            this.Form_Load_Complate = function () {

            };
            this.PageResize = function (e) {
                try {
                    switch (eni.UserAgent.Browser.Type) {
                        case "IE":
                            if (eni.UserAgent.Browser.Version < 11) {
                            } else {
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
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                }
            };

            this.InitLocalVariables = function () {
                try {
                    $HomeView_      = $("#body");
                } catch (ex) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                }
            };
        });
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    <style type="text/css">

    </style>
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <div style="top: 0px; width: 100%; bottom: 0px; position: absolute; background-color:#F2F4F7; -ms-overflow-y: auto;">
        <header class="head_wrap" style="position:relative; background-color:white; z-index:100;"> <!-- head_wrap -->
            <span class="Blind">메인 검색부</span>
            <div style="border: 1px solid #ececec"><!-- head_top -->
                <div style="position:relative; z-index:1; width:1080px; height:130px; margin: 0 auto;"><!-- inner_head -->
                    <h1 style="overflow:hidden; float:left; width:180px; height:130px; text-align:center;"> <!-- logo -->
                        <a style="overflow:hidden; display:block; margin:18px auto;">
                            <img width="180" height="110" alt="DIC" src="<%=lgUrlInfo.VirtualPath%>contents/images/logo/main_logo.png" style="display:block; vertical-align:top;"/>
                        </a>
                    </h1>
                    <div style="float:left; position:relative; margin-top:50px;">
                        <eni:eniTextBox ID="txtSearchBox" runat="server" CssClass="txtSearchBox" Width="550px" Height="47px" Font-Size="Large" Font-Bold="true" 
                            style="border-radius:1px; box-shadow:0px 1px 3px 0px rgba(0,0,0,0.05)">
                            <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#0089ff" />
                            <ClientSideEvents GotFocus="function(){ popSearchHelpText.PerformCallback(); }" />
                        </eni:eniTextBox>
                        <eni:eniButton ID="btnSearch" runat="server" CssClass="btnSearch" AutoPostBack="false" EnableTheming="False"
                            Width="56px" Height="45px" style="position:absolute; top:1px; right:1px;" alt="검색">
                            <Border BorderWidth="0px" />
                            <Paddings Padding="0px" />
                        </eni:eniButton>
                    </div>
                    <a style="position:absolute; top:6px; left:45px; padding-right:8px; -ms-behavior: url(#default#homepage);" href="http://cs.daum.net/faq/110/21198.html">그룹웨어를 시작페이지로</a>
                </div>
            </div>
            <div style="border-bottom:1px solid #888; display:none;">
                <div style="position:relative; width:990px; height:45px; margin:0 auto;"><!-- inner service -->
                    메뉴
                </div>
            </div>
        </header>
        <div style="position:relative; width:1024px; margin:15px auto 0;">
            <article style="padding-bottom:40px; display:inline-block; clear:both;">
                <div style="display:inline-block; vertical-align:top; float:left;">
                    <div style="position:relative; margin-bottom:8px; height:200px;">
                        <span class="Blind">접속자 통계, 메일 사용량, 출퇴근</span>
                        <dx:WebChartControl ID="WebChartControl1"  runat="server"></dx:WebChartControl>
                    </div>
                    <div style="position:relative; height:400px;">
                        <eni:eniCallbackPanel ID="cbpLastMail" ClientInstanceName="cbpLastMail" runat="server" Height="400px" RenderMode="Table">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <eni:eniPageControl ID="pcMailList" ClientInstanceName="pcMailList" runat="server"
                                        Width="740px" Height="400px"
                                        TabAlign="Left" ActiveTabIndex="0" EnableTabScrolling="true"
                                        SettingsLoadingPanel-Enabled="False" ScrollButtonStyle-HorizontalAlign="NotSet" 
                                        SpaceAfterTabsTemplateStyle-HorizontalAlign="NotSet" SpaceAfterTabsTemplateStyle-VerticalAlign="NotSet" 
                                        TabStyle-Wrap="Default" TabSpacing="20px" ActiveTabStyle-Width="90px" TabStyle-Width="90px"
                                        BackColor="White">
                                        <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="DarkBlue" />
                                        <TabStyle Paddings-PaddingLeft="5px" Paddings-PaddingRight="5px"/>
                                        <ActiveTabStyle BackColor="White">
                                            <BorderLeft BorderWidth="0px" />
                                            <BorderTop BorderWidth="0px" />
                                            <BorderRight BorderWidth="0px" />
                                        </ActiveTabStyle>
                                        <TabStyle BackColor="White">
                                            <BorderLeft BorderWidth="0px" />
                                            <BorderTop BorderWidth="0px" />
                                            <BorderRight BorderWidth="0px" />
                                            <BorderBottom BorderWidth="0px" />
                                        </TabStyle>
                                        <ContentStyle Border-BorderWidth="0px">
                                            <Paddings PaddingLeft="40px"/>
                                            <BorderTop BorderWidth="1px" BorderStyle="Solid" BorderColor="Blue" />
                                        </ContentStyle>
                                        <TabPages>
                                            <dx:TabPage Text="받은 편지함">
                                                <ActiveTabStyle BorderBottom-BorderWidth="2px" BorderBottom-BorderColor="Yellow">
                                                    <HoverStyle ForeColor="Yellow"></HoverStyle>
                                                </ActiveTabStyle>
                                                <TabStyle>
                                                    <HoverStyle ForeColor="Yellow"></HoverStyle>
                                                </TabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                                        a
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="보낸 편지함">
                                                <ActiveTabStyle BorderBottom-BorderWidth="2px" BorderBottom-BorderColor="Blue">
                                                    <HoverStyle ForeColor="Blue"></HoverStyle>
                                                </ActiveTabStyle>
                                                <TabStyle>
                                                    <HoverStyle ForeColor="Blue"></HoverStyle>
                                                </TabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                                        b
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="지운 편지함">
                                                <ActiveTabStyle BorderBottom-BorderWidth="2px" BorderBottom-BorderColor="Azure">
                                                    <HoverStyle ForeColor="Azure"></HoverStyle>
                                                </ActiveTabStyle>
                                                <TabStyle>
                                                    <HoverStyle ForeColor="Azure"></HoverStyle>
                                                </TabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                                        b
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="임시 보관함">
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl4" runat="server">
                                                        b
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Text="내게쓴편지함">
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl5" runat="server">
                                                        b
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                        </TabPages>
                                    </eni:eniPageControl>
                                </dx:PanelContent>
                            </PanelCollection>
                        </eni:eniCallbackPanel>
                    </div>
                </div>
                <div style="float:right; width: 274px; padding-left:8px;">
                    <div style="position:relative; height:120px; z-index:10;">
                        로그인 계정 정보
                    </div>
                    <div style="height:150px">
                        <eni:eniCalendar ID="cld" runat="server"></eni:eniCalendar>
                    </div>
                </div>
                <div style="float:left; width: 740px; margin-right:35px;">
                    <eni:eniCallbackPanel ID="cbpLastNews" ClientInstanceName="cbpLastNews" runat="server" Height="655px" RenderMode="Table">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <div>adf</div>
                            </dx:PanelContent>
                        </PanelCollection>
                    </eni:eniCallbackPanel>
                </div>
                <div style="float:left; width: 274px;">
                    <eni:eniCallbackPanel ID="cbpLastSearchText" ClientInstanceName="cbpLastSearchText" runat="server" Height="300px" RenderMode="Table">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <div>adf</div>
                            </dx:PanelContent>
                        </PanelCollection>
                    </eni:eniCallbackPanel>
                </div>
            </article>
            <div style="overflow:hidden; position:relative; z-index:0; width:100%; border-top:1px solid #ececec; background-color:#fbfbfc;">
                <eni:eniCallbackPanel ID="cbpLastKMS" ClientInstanceName="cbpLastKMS" runat="server" RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div>adf</div>
                        </dx:PanelContent>
                    </PanelCollection>
                </eni:eniCallbackPanel>
            </div>
        </div>
        <footer style="border-top:1px solid #888; background-color:white;">
            <div style="position:relative; margin:0 auto; padding:5px 0; height:50px; border-bottom:1px solid #ececec;">
                <span class="Blind">시스템 공지사항</span>
            </div>
            <div style="overflow:hidden; position:relative; width:1024px; margin:0 auto; padding:37px 0 78px;">
                <%-- http://www.daum.net/ --%>
                <a class="link_logo #logo" href="">
                    <%-- //t1.daumcdn.net/daumtop_deco/images/top/2017/logo_foot.gif --%>
                    <img width="52" height="22" class="img_thumb" alt="다음" src=""/>
                </a>
            </div>
            <div style="position:relative; margin:0 auto; padding:5px 0; border-bottom:1px solid #ececec;">
                <span class="Blind">협력사 시스템 링크</span>
                <div style="width:1024px; position:relative; margin:0 auto; padding:5px 0; height:50px; border-bottom:1px solid #ececec;">
                    <span>
                        협력사
                    </span>
                </div>
                <div style="width:1024px; position:relative; margin:0 auto; display:table;">
                    <ul style="list-style:none; position:relative; padding:18px 2px 3px 16px;">
                        <li style="position:relative; float:left; margin-right:14px; margin-bottom:19px; width:166px; height:185px; list-style:none;">현대</li>
                        <li style="position:relative; float:left; margin-right:14px; margin-bottom:19px; width:166px; height:185px; list-style:none;">현대1</li>
                        <li style="position:relative; float:left; margin-right:14px; margin-bottom:19px; width:166px; height:185px; list-style:none;">현대2</li>
                        <li style="position:relative; float:left; margin-right:14px; margin-bottom:19px; width:166px; height:185px; list-style:none;">현대3</li>
                        <li style="position:relative; float:left; margin-right:14px; margin-bottom:19px; width:166px; height:185px; list-style:none;">현대4</li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>

    <!-- 컨트롤 -->
    <eni:eniPopupControl ID="popSearchHelpText" ClientInstanceName="popSearchHelpText" runat="server" CloseAction="OuterMouseClick" LoadContentViaCallback="OnFirstShow"
                         PopupElementID="txtSearchBox" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="false"
                         Width="550px" Height="600px" ShowHeader="false" ShowFooter="True">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                <div style="vertical-align:middle">
                    The content of this popup control was updated at<br /> <b> <%= DateTime.Now.ToLongTimeString() %></b>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterTemplate>
            하단
        </FooterTemplate>
    </eni:eniPopupControl>
</asp:Content>
