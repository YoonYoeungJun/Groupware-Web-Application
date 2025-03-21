﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/BaseUIMaster/OSModuleViewMaster.Master" CodeBehind="P0000QA1.aspx.cs" Inherits="eniFramework.WebApp.WebContent.Views.Modules.P0.P0000QA1" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 어드민
    *  2. Function Name        :
    *  3. Program ID           : P0000MA1.aspx
    *  4. Program Name         : 메일 서버 상태
    *  5. Program Desc         : 메일 서버 상태
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2014-07-25
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
        eniTapLayout = ASPxClientTabControl.Cast();
        eniFrmLayout = ASPxClientFormLayout.Cast();
        eniLookupMinor = ASPxClientGridLookup.Cast();
        eniGridData = ASPxClientGridView.Cast();
        colMAJOR_CD = ASPxClientComboBox.Cast();
        colE_MAJOR_CD = ASPxClientGridLookup.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <script type="text/javascript">
        try {
            /*************************************************************************************************
             * [STA] *****************************************************************************************
             * Name : Page Variables Parts
             * Remark : 페이지 전역변수 선언부 입니다.
             *************************************************************************************************/

            /*************************************************************************************************
             * [END] Page Variables Parts
             *************************************************************************************************/

            var P0000MA1 = eni.Initialize(new function () {
                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/

                // 뷰 타입
                this.ViewType = ViewType.ModuleView;
                // 모듈 타입
                this.ModuleType = ModuleType.Multi;

                var jContainer = null;
                var jTopButtonCon = null;
                var jConditionCon = null;
                var jDataCon = null;
                var jFooterButtonCon = null;

                /*********************************************************************************************
                 * [END] Class Variables Parts
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Form Event Part
                 * Remark : 폼 기본 이벤트 입니다.
                 *********************************************************************************************/

                //폼 로드시 발생합니다.
                this.Form_Load = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "Form_Load");

                    try {
                        eni.SetToolbar("1000000000000001");

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "Form_Load");
                    }
                };



                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "Form_Load_Complate");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "Form_Load_Complate");
                    }
                };

                //폼 언 로드 되기전 발생합니다.
                this.Before_Form_UnLoad = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "Before_Form_UnLoad");

                    try {

                        return true;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "Before_Form_UnLoad");
                        return false;
                    }
                };
                //키 다운시 발생합니다.
                this.PageKeyDown = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "PageKeyDown");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "PageKeyDown");
                    }
                };
                //페이지 크기가 변경되면 발생합니다.
                this.PageResize = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "PageResize");

                    try {
                        P0000MA1.eniGridDataAdjustSize();
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "PageResize");
                    }
                };

                /*********************************************************************************************
                 * [END] Form Event Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Framework Init Method Part
                 * Remark : 초기화 메소드 입니다.
                 *********************************************************************************************/

                this.InitGolbalVariables = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "InitGolbalVariables");

                    try {
                        lgStrSql = new String();
                        lgBlnFlgChgValue = false;
                        lgActiveGridView = eniGridData;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "InitGolbalVariables");
                    }
                };

                this.InitLocalVariables = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "InitLocalVariables");

                    try {
                        jContainer = $("#BSLContainer");
                        jTopButtonCon = $(jContainer).find("#BSLTopButtonCon");
                        jConditionCon = $(jContainer).find("#BSLConditionCon");
                        jDataCon = $(jContainer).find("#BSLDataCon");
                        jFooterButtonCon = $(jContainer).find("#BSLFooterButtonCon");
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.SetGlobalDefaultValue = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "SetGlobalDefaultValue");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "SetGlobalDefaultValue");
                    }
                };

                this.SetLocalDefaultValue = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "SetLocalDefaultValue");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "SetLocalDefaultValue");
                    }
                };

                this.InitConditionData = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "InitConditionData");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "InitConditionData");
                    }
                };

                this.InitData = function () {
                    eni.Log.WriteLog("Call", LogType.Info);

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "InitData");
                    }
                };

                /*********************************************************************************************
                 * [END] Framework Init Method Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Toolbar Method Part
                 * Remark : 상위 프레임에서 호출하주는 툴바 메소드를 작성합니다.
                 *********************************************************************************************/

                //조회 버튼 클릭시 발생합니다.
                this.OnFncQuery = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncQuery");

                    try {
                        eniGridData.PerformCallback();
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncQuery");
                    }
                };
                //신규 버튼 클릭시 발생합니다.
                this.OnFncNew = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncNew");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncNew");
                    }
                };
                //삭제 버튼 클릭시 발생합니다.
                this.OnFncDelete = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncDelete");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncDelete");
                        e.Cancel = true;
                    }
                };
                //저장 버튼 클릭시 발생합니다.
                this.OnFncSave = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncSave");

                    try {
                        eniGridData.UpdateEdit();
                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncSave");
                        e.Cancel = true;
                    }
                };
                //새로고침 버튼 클릭시 발생합니다.
                this.OnFncRefresh = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncRefresh");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncRefresh");
                        e.Cancel = true;
                    }
                };
                //취소버튼을 클릭시 발생합니다.
                this.OnFncCancel = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncCancel");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncCancel");
                    }
                };
                //이전 데이터를 클릭시 발생합니다.
                this.OnFncPrev = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncPrev");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncPrev");
                    }
                };
                //다음 데이터를 클릭시 발생합니다.
                this.OnFncNext = function () {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncNext");

                    try {

                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncNext");
                    }
                };
                //행추가 버틍클릭시 발생합니다.
                this.OnFncInsertRow = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncInsertRow");

                    try {

                        eniGridData.AddNewRow();
                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncInsertRow");
                        e.Cancel = true;
                    }
                };
                //행삭제 버튼클릭시 발생합니다.
                this.OnFncDeleteRows = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncDeleteRows");

                    try {
                        var selectRows = eniGridData.GetSelectedKeysOnPage();
                        if (selectRows.length > 0) {
                            for (var i = 0; i < selectRows.length; i++) {
                                eniGridData.DeleteRowByKey(selectRows[i]);
                            }
                        } else {
                            var a = eniGridData.GetFocusedRowIndex();
                            eniGridData.DeleteRowByKey(eniGridData.GetFocusedRowIndex());
                        }
                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncDeleteRows");
                        e.Cancel = true;
                    }
                };
                ////행취소 버튼클릭시 발생합니다.
                //this.OnFncCencelRow = function (e) {
                //    eni.Log.WriteLog("Call", LogType.Info, "OnFncCencelRow");

                //    try {
                //        eniGridData.CancelEdit();
                //        e.Cancel = false;
                //    } catch (ex) {
                //        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncCencelRow");
                //        e.Cancel = true;
                //    }
                //};
                //행복사 버튼클릭시 발생합니다.
                this.OnFncCopyRow = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncCopyRow");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncCopyRow");
                        e.Cancel = true;
                    }
                };
                this.OnFncExport = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncExport");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncExport");
                        e.Cancel = true;
                    }
                };
                this.OnFncPrint = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncPrint");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncPrint");
                        e.Cancel = true;
                    }
                };
                this.OnFncHelp = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncHelp");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncHelp");
                        e.Cancel = true;
                    }
                };
                this.OnFncSettings = function (e) {
                    eni.Log.WriteLog("Call", LogType.Info, "OnFncSettings");

                    try {

                        e.Cancel = false;
                    } catch (ex) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "OnFncSettings");
                        e.Cancel = true;
                    }
                };

                /*********************************************************************************************
                 * [END] Toolbar Method Part
                 *********************************************************************************************/

                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Grid Method Part
                 * Remark : 싱글 그리드 이벤트 및 함수를 작성합니다.
                 *********************************************************************************************/

                //폼 리사이즈 발생시 폼의 크기와 컨디션 크기를 고려하여 그리드 크기 조절을 합니다.
                this.eniGridDataAdjustSize = function () {
                    try {
                        eniGridData.SetWidth(Math.max(0, document.documentElement.clientWidth - 31));

                        var adjHeight = 0;
                        if (eni.UserAgent.Browser.Version >= 10) {
                            //IE 10 이상
                            adjHeight = Math.max(0, document.documentElement.clientHeight
                                                    - eniFrmLayout.GetHeight()
                                                    - jTopButtonCon[0].offsetHeight
                                                    - jFooterButtonCon[0].offsetHeight
                                                    - 58);
                        } else {
                            //IE 10 미만
                            adjHeight = Math.max(0, document.documentElement.clientHeight
                                                    - eniFrmLayout.GetHeight()
                                                    - jTopButtonCon[0].offsetHeight
                                                    - jFooterButtonCon[0].offsetHeight
                                                    - 95);
                        }
                        eniGridData.SetHeight(adjHeight);
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                //그리드 초기화 작업을 수행합니다.
                this.eniGridData_Init = function (s, e) {
                    try {
                        P0000MA1.PageResize(parent.MainRightContent);
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                /*********************************************************************************************
                 * [END] Grid Method Part
                 *********************************************************************************************/
            });
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        }
    </script>
</asp:Content>

<%-- 5.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- 탭 레이아웃 --%>
    <dx:ASPxPageControl ID="eniTapLayout" ClientInstanceName="eniTapLayout" CssClass="eniTapLayout" runat="server" 
        Width="100%" Height="100%" 
        EnableHierarchyRecreation="true"
        ActiveTabStyle-Font-Bold="true">
        <TabPages>
            <dx:TabPage Text="서버상태">
                <ContentCollection>
                    <dx:ContentControl>
                        <%-- 컨테이너 --%>
                        <table id="BSLContainer">
                            <%-- 상단 버튼 영역 --%>
                            <tr>
                                <td id="BSLTopButtonCon"></td>
                            </tr>
                            <%-- 컨디션 영역 --%>
                            <tr>
                                <td id="BSLConditionCon">
                                    <dx:ASPxFormLayout ID="eniFrmLayout" ClientInstanceName="eniFrmLayout" CssClass="eniFrmLayout" runat="server" 
                                        Width="100%" LeftAndRightCaptionsWidth="100" Font-Bold="False"
                                        SettingsItemCaptions-HorizontalAlign="Right" Paddings-Padding="0px" >
                                        <Items>
                                            <dx:LayoutGroup ShowCaption="False" ColCount="2" GroupBoxDecoration="Box" ParentContainerStyle-Paddings-Padding="0">
                                                <Items>
                                                    <dx:LayoutItem Caption="메일서버 상태" CaptionSettings-HorizontalAlign="Right" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <dx:ASPxLabel ID="eniLbl_MailSerVerStatus" runat="server">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxButton ID="eniBtn_MailServerControl" runat="server">
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                </td>
                            </tr>
                            <%-- 데이터 영역 --%>
                            <tr>
                                <td id="BSLDataCon">
                                    <eni:eniGridView ID="eniGridData" ClientInstanceName="eniGridData" CssClass="eniGridData" runat="server" 
                                        KeyFieldName="MSG_CD"
                                        OnCustomCallback="eniGridData_CustomCallback"
                                        OnInitNewRow="eniGridData_InitNewRow"
                                        OnCellEditorInitialize="eniGridData_CellEditorInitialize"
                                        OnBatchUpdate="eniGridData_BatchUpdate"
                                        OnCustomErrorText="eniGridData_CustomErrorText">
                                        <ClientSideEvents Init="P0000MA1.eniGridData_Init"/>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Name="MSG_CD" Caption="메세지 코드" FieldName="MSG_CD" Width="90px" VisibleIndex="1" ToolTip="메세지 코드 입니다.">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesTextEdit NullDisplayText="MSG_CD" MaxLength="10">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                        <RequiredField IsRequired="true" ErrorText="메세지 코드는 필수 입력 사항 입니다." />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Name="MSG_TYPE" Caption="사용유무" FieldName="MSG_TYPE" Width="100px" VisibleIndex="2" ToolTip="메세지 타입 입니다.">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="MSG_TYPE">
                                                    <Items>
                                                        <dx:ListEditItem Text="사용" Value="Y" Selected="true"/>
                                                        <dx:ListEditItem Text="미사용" Value="N" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Name="SERVERITY" Caption="SERVERITY" FieldName="SERVERITY" Width="100px" VisibleIndex="3" ToolTip="SERVERITY">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="SERVERITY">
                                                    <Items>
                                                        <dx:ListEditItem Text="사용" Value="Y" Selected="true"/>
                                                        <dx:ListEditItem Text="미사용" Value="N" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Name="MSG_TEXT" Caption="메세지" FieldName="MSG_TEXT" Width="700px" VisibleIndex="4" ToolTip="메세지 입니다.">
                                                <Settings AllowHeaderFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <%--<dx:GridViewDataComboBoxColumn Name="MAJOR_CD" Caption="MAJOR 코드" FieldName="MAJOR_CD" Width="150px" VisibleIndex="1" ToolTip="MAJOR CODE 입니다">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="MAJOR_CD" ValueField="MAJOR_CD" ValueType="System.String" TextField="MAJOR_NM" TextFormatString="[{0}]{1}"
                                                    DropDownStyle="DropDownList" DropDownRows="20" IncrementalFilteringMode="Contains">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <DropDownButton ToolTip="MAJOR 코드 조회"></DropDownButton>
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                        <RequiredField IsRequired="true" ErrorText="MAJOR 코드는 필수 입력 사항 입니다." />
                                                    </ValidationSettings>
                                                    <Columns>
                                                        <dx:ListBoxColumn Caption="MAJOR 코드" Name="MAJOR_CD" FieldName="MAJOR_CD" Width="80px" ToolTip="MAJOR 코드 입니다." />
                                                        <dx:ListBoxColumn Caption="MAJOR 코드명" Name="MAJOR_NM" FieldName="MAJOR_NM" Width="100px" ToolTip="MAJOR 코드명 입니다." />
                                                        <dx:ListBoxColumn Caption="MINOR 코드 길이" Name="MINOR_LEN" FieldName="MINOR_LEN" Width="100px" ToolTip="MINOR 코드 길이입니다." />
                                                    </Columns>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>--%>
                                        </Columns>
                                    </eni:eniGridView>
                                </td>
                            </tr>
                            <%-- 하단 버튼 영역 --%>
                            <tr>
                                <td id="BSLFooterButtonCon"></td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>

    <%--<dx:ASPxPageControl ID="eniTapLayout" ClientInstanceName="eniTapLayout" CssClass="eniTapLayout" runat="server" 
        Width="100%" Height="100%" EnableHierarchyRecreation="true">
        <ActiveTabStyle Font-Bold="true"></ActiveTabStyle>
        <ContentStyle CssClass="eniTapLayout_Content">
        </ContentStyle>
        <Paddings PaddingTop="15px" />
        <TabPages>
            <dx:TabPage Text="서버상태">
                <ContentCollection>
                    <dx:ContentControl Width="100%" Height="100%">
                        <table id="eniPageContent" class="FullScreen">
                            <tr>
                                <td>
                                    <dx:ASPxFormLayout ID="eniFrmLayout" ClientInstanceName="eniFrmLayout" CssClass="eniFrmLayout" runat="server" 
                                        Width="100%" LeftAndRightCaptionsWidth="100" Font-Bold="False">
                                        <SettingsItemCaptions HorizontalAlign="Right" />
                                        <Items>
                                            <dx:LayoutGroup ShowCaption="False" ColCount="2" GroupBoxDecoration="Box">
                                                <Items>
                                                    <dx:LayoutItem Caption="메일서버 상태" CaptionSettings-HorizontalAlign="Right" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <dx:ASPxLabel ID="eniLbl_MailSerVerStatus" runat="server">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td>
                                                                            <dx:ASPxButton ID="eniBtn_MailServerControl" runat="server">
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:ASPxFormLayout>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <eni:eniGridView ID="eniGridData" ClientInstanceName="eniGridData" CssClass="eniGridData" runat="server" 
                                        KeyFieldName="MSG_CD"
                                        OnCustomCallback="eniGridData_CustomCallback"
                                        OnInitNewRow="eniGridData_InitNewRow"
                                        OnCellEditorInitialize="eniGridData_CellEditorInitialize"
                                        OnBatchUpdate="eniGridData_BatchUpdate"
                                        OnCustomErrorText="eniGridData_CustomErrorText">
                                        <SettingsCookies CookiesID="eniGridData_P0000MA1" Enabled="true"/>
                                        <ClientSideEvents Init="P0000MA1.eniGridData_Init"/>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Name="MSG_CD" Caption="메세지 코드" FieldName="MSG_CD" Width="90px" VisibleIndex="1" ToolTip="메세지 코드 입니다.">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesTextEdit NullDisplayText="MSG_CD" MaxLength="10">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                        <RequiredField IsRequired="true" ErrorText="메세지 코드는 필수 입력 사항 입니다." />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Name="MSG_TYPE" Caption="사용유무" FieldName="MSG_TYPE" Width="100px" VisibleIndex="2" ToolTip="메세지 타입 입니다.">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="MSG_TYPE">
                                                    <Items>
                                                        <dx:ListEditItem Text="사용" Value="Y" Selected="true"/>
                                                        <dx:ListEditItem Text="미사용" Value="N" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Name="SERVERITY" Caption="SERVERITY" FieldName="SERVERITY" Width="100px" VisibleIndex="3" ToolTip="SERVERITY">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="SERVERITY">
                                                    <Items>
                                                        <dx:ListEditItem Text="사용" Value="Y" Selected="true"/>
                                                        <dx:ListEditItem Text="미사용" Value="N" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Name="MSG_TEXT" Caption="메세지" FieldName="MSG_TEXT" Width="700px" VisibleIndex="4" ToolTip="메세지 입니다.">
                                                <Settings AllowHeaderFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Name="MAJOR_CD" Caption="MAJOR 코드" FieldName="MAJOR_CD" Width="150px" VisibleIndex="1" ToolTip="MAJOR CODE 입니다">
                                                <Settings HeaderFilterMode="CheckedList" />
                                                <PropertiesComboBox NullDisplayText="MAJOR_CD" ValueField="MAJOR_CD" ValueType="System.String" TextField="MAJOR_NM" TextFormatString="[{0}]{1}"
                                                    DropDownStyle="DropDownList" DropDownRows="20" IncrementalFilteringMode="Contains">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <DropDownButton ToolTip="MAJOR 코드 조회"></DropDownButton>
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                        <RequiredField IsRequired="true" ErrorText="MAJOR 코드는 필수 입력 사항 입니다." />
                                                    </ValidationSettings>
                                                    <Columns>
                                                        <dx:ListBoxColumn Caption="MAJOR 코드" Name="MAJOR_CD" FieldName="MAJOR_CD" Width="80px" ToolTip="MAJOR 코드 입니다." />
                                                        <dx:ListBoxColumn Caption="MAJOR 코드명" Name="MAJOR_NM" FieldName="MAJOR_NM" Width="100px" ToolTip="MAJOR 코드명 입니다." />
                                                        <dx:ListBoxColumn Caption="MINOR 코드 길이" Name="MINOR_LEN" FieldName="MINOR_LEN" Width="100px" ToolTip="MINOR 코드 길이입니다." />
                                                    </Columns>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                    </eni:eniGridView>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>--%>
</asp:Content>