<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="HomeView_back.aspx.cs" Inherits="eniFramework.WebApp.Views.HomeView_back" Theme="eniThm" %>

<%@ Register Assembly="eniFramework.WebApp.Controls" Namespace="eniFramework.WebApp.Controls" TagPrefix="eni" %>

<%@ Register Src="~/WebContent/Views/ucHomeView/ucStatus.ascx" TagPrefix="eni" TagName="ucStatus" %>              <%-- 개인정보 컨트롤 --%>
<%@ Register Src="~/WebContent/Views/ucHomeView/ucSchedule.ascx" TagPrefix="eni" TagName="ucSchedule" %>
<%@ Register Src="~/WebContent/Views/ucHomeView/ucBoard.ascx" TagPrefix="eni" TagName="ucBoard" %>
<%@ Register Src="~/WebContent/Views/ucHomeView/ucTime.ascx" TagPrefix="eni" TagName="ucTime" %>
<%@ Register Src="~/WebContent/Views/ucHomeView/ucMail.ascx" TagPrefix="eni" TagName="ucMail" %>

<%-- 최근 메일 컨트롤 --%>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : HomeView
    *  2. Function Name        :
    *  3. Program ID           : HomeView.aspx
    *  4. Program Name         : 그룹웨어 홈 페이지
    *  5. Program Desc         : 그룹웨어 홈 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2015-10-16
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
        dmMain = ASPxClientDockManager.Cast();
        dzLeft = ASPxClientDockZone.Cast();
        dzCenter = ASPxClientDockZone.Cast();
        dzRight = ASPxClientDockZone.Cast();

        ucStatus = ASPxClientDockPanel.Cast();
        ucMail = ASPxClientDockPanel.Cast();
        ucBoard = ASPxClientDockPanel.Cast();
        ucTime = ASPxClientDockPanel.Cast();
        ucSchedule = ASPxClientDockPanel.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .eni_Web .HomeView {
            position:absolute;
            top:0px;
            left:0px;
            right:0px;
            bottom:0px;
            border:0px;
            padding:7px 0px 0px 0px;
            margin:0px;
            min-width:1000px;
            background-color:#E9EDF1;
            /*border-right:2px solid #ff0000;
            border-bottom:2px solid #ff0000;*/
        }
        .eni_Web .HomeView .dZone {
            padding:7px 0px 0px 0px;
        }
        .eni_Web .HomeView .dZone.dzContainerLeft {
            position:absolute;
            width:280px;
            margin:0px 0px 0px 7px;
            top:0px;
            bottom:0px;
        }

        .eni_Web .HomeView .dZone.dzContainerCenter {
            position:absolute;
            margin:0px 0px 0px 294px; 
            padding:7px 264px 0px 0px;
            top:0px;
            bottom:0px;
            left:0px;
            right:0px;
        }

        .eni_Web .HomeView .dZone.dzContainerRight {
            position:absolute;
            width:250px;
            top:0px;
            bottom:0px;
            right:7px;
        }

        /* DocPanel Loading Image */
        .eni_Web .HomeView .dxlpLoadingPanel_eniThm,
        .eni_Web .HomeView .dxlpLoadingPanelWithContent_eniThm
        {
	        color: #585e68;
	        background: White none;
	        border: 1px solid #80858d;
        }
        .eni_Web .HomeView .dxlpLoadingPanel_eniThm .dxlp-loadingImage,
        .eni_Web .HomeView .dxlpLoadingPanelWithContent_eniThm .dxlp-loadingImage {
	        background-image: url('/Contents/Images/Loading/Loading_16x16.gif');
	        height: 16px;
	        width: 16px;
        }
        .eni_Web .HomeView .dxlpLoadingPanel_eniThm td.dx,
        .eni_Web .HomeView .dxlpLoadingPanelWithContent_eniThm td.dx {
            padding:15px !important;
        }
        .eni_Web .HomeView .dxlpLoadingPanel_eniThm td.dx .dxlp-loadingImage.dxlp-imgPosLeft,
        .eni_Web .HomeView .dxlpLoadingPanelWithContent_eniThm td.dx .dxlp-loadingImage.dxlp-imgPosLeft {
            margin-right:0px !important;
        }
        .eni_Web .HomeView .dxlpLoadingPanel_eniThm td.dx:last-child,
        .eni_Web .HomeView .dxlpLoadingPanelWithContent_eniThm td.dx:last-child {
            display:none;
        }
        
    </style>

    <script type="text/javascript">
        // <![CDATA[
        var HomeViewView = eni.Initialize(new function () {
            var $dzContainer = null;
            var dzContainerMinWidth = 1000;

            this.Title = eni.GetTitle();
            this.iFrameName = "_blank";
            this.ViewType = ViewType.ModuleView;
            this.Form_Load = function () {
                //eni.Loading.ChangeDefaultMode();
                //eni.RunPageFrame("/BoardView/BBS_ALL?no=140", ViewType.ModuleView)
            };
            this.Form_Load_Complate = function () {
                //eni.Loading.DisplayLoading(false);

                //eni.RunPageTopFrame("/WebContent/Common/SessionTimeOut.aspx", "DefaultFrame");
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
                        eni.Message.DisplayMessageBox(eni.Message.ListTitleBundle("common.error"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };
        });


        // ]]>

       //// <![CDATA[
       //function ShowWidgetPanel(widgetPanelUID) {
       //    var panel = dockManager.GetPanelByUID(widgetPanelUID);
       //    panel.Show();
       //    alert(widgetPanelUID)

       //}
       //function SetWidgetButtonVisible(widgetName, visible) {
       //    var button = ASPxClientControl.GetControlCollection().GetByName('widgetButton_' + widgetName);
       //    button.GetMainElement().className = visible ? '' : 'disabled';
       //}
       //// ]]> 
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- 메인 컨테이너 --%>
    <div class="HomeView VerticalAutoScroll">
        <%-- 독 메니져 --%>
        <eni:eniDockManager ID="dmMain" ClientInstanceName="dmMain" runat="server" SaveStateToCookies="False"></eni:eniDockManager>
        <div class="dZone dzContainerLeft FloatL">
            <eni:eniDockZone ID="dzLeft" ZoneUID="dzLeft" ClientInstanceName="dzLeft" runat="server" 
                Width="100%"
                PanelSpacing="7px" 
                BackColor="#E9EDF1">
            </eni:eniDockZone>
        </div>
        <div class="dZone dzContainerCenter FloatL">
            <eni:eniDockZone ID="dzCenter" ZoneUID="dzCenter" ClientInstanceName="dzCenter" runat="server" 
                Width="100%"
                PanelSpacing="7px" 
                BackColor="#E9EDF1">
            </eni:eniDockZone>
        </div>
        <div class="dZone dzContainerRight FloatL">
            <eni:eniDockZone ID="dzRight" ZoneUID="dzRight" ClientInstanceName="dzRight" runat="server" 
                Width="100%"
                PanelSpacing="7px" 
                BackColor="#E9EDF1">
            </eni:eniDockZone>
        </div>

        <%-- 내 상태 독 패널 --%>
        <eni:ucStatus ID="ucStatus" ClientInstanceName="ucStatus" OwnerZoneUID="dzLeft" ShowHeader="false" VisibleIndex="1" runat="server" />
        
        <%-- 메일 독 패널 --%>
        <eni:eniDockPanel ID="dpMail" PanelUID="ucMail" ClientInstanceName="dpMail" SkinID="HomeDockPanel" runat="server"
            Height="400px" OwnerZoneUID="dzCenter" VisibleIndex="1" ShowHeader="false">
            <Styles>
                <Content CssClass="PositionRelative"></Content>
            </Styles>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <eni:ucMail runat="server" ID="ucMail" />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </eni:eniDockPanel>

        <%-- 게시판 독 패널 --%>
        <eni:eniDockPanel ID="dpBoard" PanelUID="ucBoard" ClientInstanceName="dpBoard" SkinID="HomeDockPanel" runat="server"
            Height="400px" OwnerZoneUID="dzCenter" VisibleIndex="1" ShowHeader="false">
            <Styles>
                <Content CssClass="PositionRelative"></Content>
            </Styles>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <eni:ucBoard runat="server" ID="ucBoard" />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </eni:eniDockPanel>

        <%-- 현재시간 독 패널 --%>
        <eni:ucTime ID="ucTime" ClientInstanceName="ucTime" runat="server" OwnerZoneUID="dzRight" Height="80px" VisibleIndex="1" ShowHeader="false" />

        <%-- 스케줄 독 패널 --%>
        <eni:ucSchedule ID="ucSchedule" ClientInstanceName="ucSchedule" runat="server" OwnerZoneUID="dzRight" VisibleIndex="2" ShowHeader="false" />
        

        <%-- 메모 독 패널 --%>
        <%--<eni:eniDockPanel ID="eniDPMemo" PanelUID="Memo" ClientInstanceName="eniDPMemo" SkinID="HomeDockPanel" runat="server"
            Height="203px" OwnerZoneUID="dzCenter" VisibleIndex="2">
            <HeaderTemplate>
                <table class="Width100f BorderClear Padding0 Margin0" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="WidthAuto">
                            <span class="Font-Large Font-Bold DisplayBlock Padding5L" style="line-height:24px; height:21px;">
                                메모
                            </span>
                        </td>
                        <td class="CursorPoint Font-Align-Center" style="width:60px;">
                            <div id="tagBtnScheduleReload" class="CButtonSWhite" onclick="">
                                <span>새로고침</span>
                            </div>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <eni:ucMemo runat="server" ID="ucMemo" />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </eni:eniDockPanel>--%>

        <%-- 알림 독 패널 --%>
        <%--<eni:eniDockPanel ID="eniDPAlert" PanelUID="Alert" ClientInstanceName="eniDPAlert" SkinID="HomeDockPanel" runat="server"
            Height="343px" OwnerZoneUID="dzRight" VisibleIndex="1">
            <HeaderTemplate>
                <table class="Width100f BorderClear Padding0 Margin0" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="WidthAuto">
                            <span class="Font-Large Font-Bold DisplayBlock Padding5L" style="line-height:24px; height:21px;">
                                알림
                            </span>
                        </td>
                        <td class="CursorPoint Font-Align-Center" style="width:20px; border-left:1px solid #D6D6D6;">a</td>
                        <td class="CursorPoint Font-Align-Center" style="width:20px; border-left:1px solid #D6D6D6;">b</td>
                        <td class="CursorPoint Font-Align-Center" style="width:20px; border-left:1px solid #D6D6D6;">c</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <eni:ucAlert runat="server" ID="ucAlert" />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </eni:eniDockPanel>--%>

        <%-- 생일자 독 패널 --%>
        <%--<eni:eniDockPanel ID="eniDPBirthday" PanelUID="Birthday" ClientInstanceName="eniDPBirthday" SkinID="HomeDockPanel" runat="server"
            Height="343px" OwnerZoneUID="dzRight" VisibleIndex="2">
            <HeaderTemplate>
                <table class="Width100f BorderClear Padding0 Margin0" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="WidthAuto">
                            <span class="Font-Large Font-Bold DisplayBlock Padding5L" style="line-height:24px; height:21px;">
                                이달에 생일자
                            </span>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <eni:ucBirthday runat="server" id="ucBirthday" />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </eni:eniDockPanel>--%>
    </div>
</asp:Content>