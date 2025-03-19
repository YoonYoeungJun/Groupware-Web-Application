<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonPopup.ascx.cs" Inherits="eniFramework.WebApp.Common.Popup.CommonPopup" %>

<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="eniFramework.WebApp.WebContent.Utils" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 공통 대화상자 컨트롤
*  2. Function Name        :
*  3. Program ID           : ConfirmBox.ascx
*  4. Program Name         : 공통 대화상자 컨트롤
*  5. Program Desc         : 공통 대화상자 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-07-25
*  8. Modified date(Last)  : 2014-07-25
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="lgFrmCommonPopup_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../../../Scripts/devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            ASPxClientFormLayout.Cast = ASPxClientControl.Cast();
            lgFrmCommonPopup = ASPxClientPopupControl.Cast();
            lgFrmCommonPopup.DefaultHeaderText = "입력하여주세요.";
            lgFrmCommonPopup.DefaultConfirmMessage = "아래에 입력하세요.";
            lgFrmCommonPopup.CallBackF = 0;
            lgFrmCommonPopup.ConditionLayout = ASPxClientFormLayout.prototype;
            lgFrmCommonPopup.GridData = ASPxClientGridView.prototype;
            lgFrmCommonPopup.ButtonToolbar = ASPxClientMenu.prototype;
            lgFrmCommonPopup.SetDefault = function () { };
            lgFrmCommonPopup.ShowConfirm = function (pArgs, pCallBackF) { };
            lgFrmCommonPopup.CloseConfirm = function (pRetVal) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
        .lgFrmCommonPopup {

        }
        .lgFrmCommonPopup #lgFrmCommonContainer {
            width:100%;
            height:100%
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonConditionCon {
            width:100%;
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonConditionCon .eniFrmPopupLayout {
            width:100%;
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonConditionCon .eniFrmPopupLayout .dxflGroup_eniThm {
            padding:0px 0px 5px !important;
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonConditionCon .eniFrmPopupLayout .dxflGroupBox_eniThm {
            padding:0px 0px 5px !important;
            margin:0px !important;
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon {
            width:100%;
        }

        /*.lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvHEC {
            width:0px !important;
        }*/

        /* Grid Header CSS */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvHeader_eniThm {
            padding:2px 3px !important;
        }
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvHeader_eniThm table td:first-child {
            padding-top:3px !important;
        }
        /* Grid Forcus & Select CSS */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm td.dxgv,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm td.dxgv,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm td.dxgv,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm td.dxgv,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm td.dxgv {
            padding: 2.5px 0px 1.5px 0px !important;
        }
        /* Grid Edit */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm td.dxic,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm td.dxic {
            padding:0px !important;
        }
        /* Grid Edit CSS */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm td.dxgv.dxgvBatchEditCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm td.dxgv.dxgvBatchEditCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm td.dxgv.dxgvBatchEditCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm td.dxgv.dxgvBatchEditCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm td.dxgv.dxgvBatchEditCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm td.dxgv.dxgvBatchEditModifiedCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm td.dxgv.dxgvBatchEditModifiedCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm td.dxgv.dxgvBatchEditModifiedCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm td.dxgv.dxgvBatchEditModifiedCell_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm td.dxgv.dxgvBatchEditModifiedCell_eniThm {
            padding: 0px !important;
        }
        /* Grid Button */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton {
            padding:0px 2px !important;
        }
        /* Grid Spin Edit Up Button */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton.dxeSpinIncButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton.dxeSpinIncButton_eniThm {
            padding: 1px 3px 1px !important;
        }
        /* Grid Spin Edit Down Button */
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvEditFormDisplayRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvDataRowAlt_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvSelectedRow_eniThm .dxeButton.dxeSpinDecButton_eniThm,
        .lgFrmCommonPopup #lgFrmCommonContainer #lgFrmCommonDataCon .eniGridPopupData .dxgvFocusedRow_eniThm .dxeButton.dxeSpinDecButton_eniThm {
            padding:2px 3px 1px !important;
        }

        .lgFrmCommonPopup .eniCommonToolbar .dx.dxm-image-l {
            width:100%;
        }

        .lgFrmCommonPopup .eniCommonToolbar .CButtonLWhite > div, 
        .lgFrmCommonPopup .eniCommonToolbar .CButtonLWhite > a {
            margin:0 4px 0 0 !important;
        }
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        var jlgFrmCommonContainer = $;
        var jlgFrmCommonConditionCon = $;
        var jlgFrmCommonDataCon = $;
        // 대화상자 초기화
        function lgFrmCommonPopup_Init(s, e) {
            //var lgFrmCommonPopup = ASPxClientPopupControl.Cast(lgFrmCommonPopup);
            //var lgFrmCommonPopupKeyDownEvent = function (keydown) {
            //    if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ENTER")) {
            //        lgFrmCommonPopup_btnOk_Click(lgFrmCommonPopup, null);
            //    } else if (keydown.keyCode == ASPxClientUtils.StringToShortcutCode("ESCAPE")) {
            //        lgFrmCommonPopup_btnCancel_Click(lgFrmCommonPopup, null);
            //    }
            //};
            //ASPxClientUtils.AttachEventToElement(document.getElementById(lgFrmCommonPopup.name + "_PW-1"), "keydown", lgFrmCommonPopupKeyDownEvent);
            //ASPxClientUtils.AttachEventToElement(document.getElementById(lgFrmCommonPopup.name + "_DXPWMB-1"), "keydown", lgFrmCommonPopupKeyDownEvent);

            try {
                jlgFrmCommonContainer = $("#lgFrmCommonContainer");
                jlgFrmCommonConditionCon = $(jlgFrmCommonContainer).find("#lgFrmCommonConditionCon");
                jlgFrmCommonDataCon = $(jlgFrmCommonContainer).find("#lgFrmCommonDataCon");
                eniGridCommonDataAdjustSize();
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }

        };

        // 대화상자 팝업시 이벤트
        function lgFrmCommonPopup_Popup(s, e) {
            eniGridCommonDataAdjustSize();
        };

        function lgFrmCommonPopup_EndCallback(s, e) {
            s.SetWidth(s.MinWidth);
            s.SetHeight(s.MinHeight);
            s.Show();
        };

        function eniCommonToolbar_ItemClick(s, e) {
            switch (e.item.name) {
                case "Query":
                    lgFrmCommonPopup.DbQuery();
                    break;
                case "Ok":
                    lgFrmCommonPopup.ClosePopup(DialogResult.Ok);
                    break;
                case "Cancel":
                    lgFrmCommonPopup.ClosePopup(DialogResult.Cancel);
                    break;
            }
        };

        // 대화상자 취소버튼 클릭시 이벤트
        function lgFrmCommonPopup_Cancel_Click(s, e) {
            lgFrmCommonPopup.ClosePopup(DialogResult.Cancel);
        };


        function eniGridCommonDataAdjustSize() {
            try {
                eniGridCommonData.SetWidth(Math.max(0, lgFrmCommonPopup.GetWidth() - 12));

                var adjBalanceHeight = 0;
                switch (eni.UserAgent.Browser.Type) {
                    case "IE":
                        if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                            adjBalanceHeight = 70;
                        } else {//IE 10 미만
                            adjBalanceHeight = 74;
                        }
                        break;
                    case "OPERA": adjBalanceHeight = 37; break;
                    case "FIREFOX": adjBalanceHeight = 37; break;
                    case "CHROME": adjBalanceHeight = 37; break;
                    case "SAFARI": adjBalanceHeight = 37; break;
                    default: adjBalanceHeight = 37; break;
                }
                eniGridCommonData.SetHeight(Math.max(0, lgFrmCommonPopup.GetHeight() - eniFrmCommonLayout.GetHeight() - adjBalanceHeight));
            } catch (ex) {
                if (eni.Message) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                } else {
                    alert(ex.message);
                }
            }
        };

        function eniGridCommonData_EndCallback(s, e) {
            //eniGridCommonDataAdjustSize();
            eni.Loading.DisplayStatusLoading(false);
        };
    </script>
</asp:PlaceHolder>

<!-- 공통 대화상자 -->
<eni:eniPopupControl ID="lgFrmCommonPopup" ClientInstanceName="lgFrmCommonPopup" CssClass="lgFrmCommonPopup" runat="server"
    CloseAction="CloseButton" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ShowHeader="True" ShowFooter="true" SettingsLoadingPanel-Enabled="true"
    AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" Width="370px"
    OnWindowCallback="lgFrmCommonPopup_WindowCallback" RenderIFrameForPopupElements="True">
    <HeaderStyle Paddings-PaddingTop="5px" Paddings-PaddingRight="0px" Paddings-PaddingBottom="5px" Paddings-PaddingLeft="4px" Font-Bold="true" />
    <HeaderImage Url="../../../../contents/images/ico-popup.gif" Width="14px" Height="16px"></HeaderImage>
    <ContentStyle Paddings-Padding="5px">
    <Paddings Padding="5px"></Paddings>
    </ContentStyle>
    <ClientSideEvents Init="lgFrmCommonPopup_Init" 
        PopUp="lgFrmCommonPopup_Popup" 
        CloseButtonClick="lgFrmCommonPopup_Cancel_Click"
        EndCallback="lgFrmCommonPopup_EndCallback"/>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <eni:eniHiddenField ID="lgFrmCommonPopupState" ClientInstanceName="lgFrmCommonPopupState" runat="server"></eni:eniHiddenField>
            <table id="lgFrmCommonContainer">
                <%-- 컨디션 영역 --%>
                <tr>
                    <td id="lgFrmCommonConditionCon">
                        <eni:eniFormLayout ID="eniFrmCommonLayout" ClientInstanceName="eniFrmCommonLayout" CreateMode="UserControlMode" SkinID="Popup" runat="server">
                            <Items>
                                <dx:LayoutGroup ShowCaption="False" ColCount="2" GroupBoxDecoration="Box">
                                    <ParentContainerStyle>
                                        <Paddings Padding="0px" />
                                    </ParentContainerStyle>
                                    <Items>
                                        <dx:LayoutItem Name="CODE" FieldName="CODE" Caption="코드" CaptionStyle-Font-Bold="true" CaptionSettings-HorizontalAlign="Right" Width="40%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <eni:eniTextBox ID="eniCode" ClientInstanceName="eniCode" runat="server" Width="100%" CreateMode="UserControlMode">
                                                    </eni:eniTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Name="NAME" FieldName="NAME" Caption="코드명" CaptionStyle-Font-Bold="true" CaptionSettings-HorizontalAlign="Right" Width="60%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <eni:eniTextBox ID="eniName" ClientInstanceName="eniName" runat="server" Width="100%" CreateMode="UserControlMode"></eni:eniTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </eni:eniFormLayout>
                    </td>
                </tr>
                <%-- 데이터 영역 --%>
                <tr>
                    <td id="lgFrmCommonDataCon">
                        <eni:eniGridView ID="eniGridCommonData" ClientInstanceName="eniGridCommonData" CreateMode="UserControlMode" SkinID="Popup" runat="server"
                            OnCustomCallback="eniGridCommonData_CustomCallback">
                            <ClientSideEvents EndCallback="eniGridCommonData_EndCallback" />
                        </eni:eniGridView>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <FooterTemplate>
        <eni:eniMenu ID="eniCommonToolbar" ClientInstanceName="eniCommonToolbar" runat="server" CssClass="eniCommonToolbar" SkinID="Popup">
            <ClientSideEvents ItemClick="eniCommonToolbar_ItemClick" />
            <Items>
                <dx:MenuItem Name="Query" ClientEnabled="true">
                    <Image IconID="zoom_zoom_16x16" ToolTip="조회"></Image>
                </dx:MenuItem>
                <%--<dx:MenuItem Name="Settings" ClientEnabled="true" ItemStyle-CssClass="FloatR">
                    <Image IconID="programming_ide_16x16" ToolTip="설정"></Image>
                </dx:MenuItem>
                <dx:MenuItem Name="Help" ClientEnabled="true" ItemStyle-CssClass="FloatR">
                    <Image IconID="support_suggestion_16x16" ToolTip="도움말"></Image>
                </dx:MenuItem>--%>
                <dx:MenuItem Name="Cancel" ClientEnabled="true" ItemStyle-CssClass="FloatR">
                    <Image IconID="actions_close_16x16" ToolTip="취소"></Image>
                </dx:MenuItem>
                <dx:MenuItem Name="Ok" ClientEnabled="true" ItemStyle-CssClass="FloatR">
                    <Image IconID="content_checkbox_16x16" ToolTip="선택"></Image>
                </dx:MenuItem>
            </Items>
        </eni:eniMenu>
    </FooterTemplate>
</eni:eniPopupControl>

<asp:PlaceHolder ID="lgFrmCommonPopup_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        lgFrmCommonPopup.DefaultHeaderText = "입력하여주세요.";
        lgFrmCommonPopup.DefaultConfirmMessage = "아래에 입력하세요.";
        lgFrmCommonPopup.MinWidth = 370
        lgFrmCommonPopup.MinHeight = 400
        lgFrmCommonPopup.CallBackF = 0;
        lgFrmCommonPopup.State = ASPxClientHiddenField.Cast(lgFrmCommonPopupState);
        lgFrmCommonPopup.PopupArgs = new CommonPopupArgsClass();
        lgFrmCommonPopup.ConditionLayout = eniFrmCommonLayout;
        lgFrmCommonPopup.Code = ASPxClientTextBox.Cast(eniCode);
        lgFrmCommonPopup.Name = ASPxClientTextBox.Cast(eniName);
        lgFrmCommonPopup.GridData = ASPxClientGridView.Cast(eniGridCommonData);
        lgFrmCommonPopup.ButtonToolbar = ASPxClientMenu.Cast(eniCommonToolbar);
        lgFrmCommonPopup.SetDefault = function () {
            this.CallBackF = 0;
            this.SetHeaderText(this.DefaultHeaderText);
            
            this.State.Clear();
            this.State.Set("CommonPopupArgs", "");
            this.PerformWindowCallback(null, this.State.Get("CommonPopupArgs"));

            lgDisplayMessageBox = false;
        };
        lgFrmCommonPopup.DbQuery = function () {
            this.GridData.PerformCallback(JSON.stringify({ Code: this.Code.GetText(), Name: this.Name.GetText() }));
        };
        lgFrmCommonPopup.ShowPopup = function (pArgs, pCallBackF) {
            if (pArgs) {
                if (pArgs.Title) {
                    this.SetHeaderText(pArgs.Title);
                } else {
                    this.SetHeaderText(this.DefaultHeaderText);
                }

                if (pArgs.WinSize && typeof pArgs.WinSize === "object") {
                    this.SetWidth(pArgs.WinSize.Width < this.MinWidth ? this.MinWidth : pArgs.WinSize.Width);
                    this.SetHeight(pArgs.WinSize.Height < this.MinHeight ? this.MinHeight : pArgs.WinSize.Height);
                } else {
                    this.SetWidth(this.MinWidth);
                    this.SetHeight(this.MinHeight);
                }
                
                //if (pArgs.Url) {
                //    this.SetContentUrl(pArgs.Url);
                //    this.RefreshContentUrl();
                //}
            } else {
                return;
            }

            if (pCallBackF) {
                this.CallBackF = pCallBackF;
            } else {
                this.pCallBackF = 0;
            }

            this.State.Add("CommonPopupArgs", JSON.stringify(pArgs));
            this.PerformWindowCallback(null, this.State.Get("CommonPopupArgs"));
        };
        lgFrmCommonPopup.ClosePopup = function (pRetVal) {
            var RetVal = {
                DialogResult: pRetVal
            };

            if (pRetVal === DialogResult.Ok) {
                RetVal.Result = this.txtValue.GetText();
            }

            if (this.CallBackF) {
                this.Hide();
                this.CallBackF(RetVal);
            } else {
                this.Hide();
            }
            this.SetDefault();
        };
    </script>
</asp:PlaceHolder>