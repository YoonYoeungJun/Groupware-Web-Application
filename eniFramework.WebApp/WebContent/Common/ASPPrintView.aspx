﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="ASPPrintView.aspx.cs" Inherits="eniFramework.WebApp.Common.ASPPrintView" Theme="eniThm" %>

<%@ Register Assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 시스템설정
    *  2. Function Name        :
    *  3. Program ID           : CommonWinPopup.aspx
    *  4. Program Name         : 자동채번등록
    *  5. Program Desc         : 자동채번등록
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2015-02-17
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
        tabLayout = ASPxClientSplitter.Cast();
        txtCode = ASPxClientTextBox.Cast();
        txtName = ASPxClientTextBox.Cast();
        vspdDataCbProcess = ASPxClientCallback.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <link type="text/css" rel="stylesheet" href="/Scripts/ExtJS/ExtJS-3.3.0/resources/css/ext-all.css" />
    <link type="text/css" rel="stylesheet" href="/Scripts/ExtJS/ExtJS-3.3.0/resources/css/xtheme-gray.css" />
    <script type="text/javascript" src="/Scripts/ExtJS/ExtJS-3.3.0/adapter/ext/ext-base-debug.js"></script>
    <script type="text/javascript" src="/Scripts/ExtJS/ExtJS-3.3.0/ext-all-debug-w-comments.js"></script>
    <script type="text/javascript" src="/Scripts/ExtJS/ExtJS-3.3.0/ext-ux-all.js"></script>
    <script type="text/javascript">
        try {
            /*************************************************************************************************
             * [STA] *****************************************************************************************
             * Name : Page Variables Parts
             * Remark : 페이지 전역변수 선언부 입니다.
             *************************************************************************************************/
            
            var popupArgs = new CommonWinPopupArgsClass().Cast(new Object(window.dialogArguments));

            //콜백 아규먼트 클래스
            var DbQueryCallBackArgsClass = function () {
                this.Code = new String();
                this.Name = new String();
                this.Columns = new Array();
                this.From = new String();
                this.Where = new String();
            };

            /*************************************************************************************************
             * [END] Page Variables Parts
             *************************************************************************************************/

            var CommonWinPopup = eni.Initialize(new function () {
                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Class Variables Parts
                 * Remark : 클래스 지역변수 선언부 입니다.
                 *********************************************************************************************/
                this.Title = popupArgs.Title !== undefined && String(popupArgs.Title).trim() !== "" ? popupArgs.Title + " " + "<%= GetResource("CSTRESX00000") %>" : "<%= GetResource("CSTRESX00000") %>";
                // 뷰 타입
                this.ViewType = ViewType.View;
                // 모듈 타입
                this.ModuleType = ModuleType.Multi;

                var $area_commonpop = null;
                var $wrap_top = null;
                var $wrap_condition = null;
                var $wrap_data = null;
                var $wrap_bottom = null;

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
                    try {
                        Ext.useShims = true;
                        eni.Loading.DisplayLoading(true);

                        this.InitSpreadSheet();
                    } catch (ex) {
                    }
                };

                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {

                    try {
                        txtCode.Focus();
                        this.DbQuery();
                    } catch (ex) {
                    }
                };

                //폼 언 로드 되기전 발생합니다.
                this.Before_Form_UnLoad = function () {

                    try {

                        return true;
                    } catch (ex) {
                        return false;
                    }
                };

                //키 다운시 발생합니다.
                this.PageKeyDown = function (e) {

                    try {

                    } catch (ex) {
                    }
                };

                //페이지 크기가 변경되면 발생합니다.
                this.PageResize = function (e) {
                    try {
                       
                    } catch (ex) {
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

                    try {
                        lgStrSql = new String();
                    } catch (ex) {
                    }
                };

                this.InitLocalVariables = function () {
                    try {
                        $area_commonpop = $(".commonwinpopup");
                    } catch (ex) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        } else {
                            alert(ex.message);
                        }
                    }
                };

                this.SetGlobalDefaultValue = function () {

                    try {

                    } catch (ex) {
                    }
                };

                this.SetLocalDefaultValue = function () {

                    try {
                        if (popupArgs && popupArgs.Columns[0] && popupArgs.Columns[0].Caption) {
                            var codeItem = $area_commonpop.find("#code");
                            codeItem.text(popupArgs.Columns[0].Caption);
                        }
                        if (popupArgs && popupArgs.Columns[0] && popupArgs.Columns[1].Caption) {
                            var nameItem = $area_commonpop.find("#name");
                            nameItem.text(popupArgs.Columns[1].Caption)
                        }
                    } catch (ex) {
                    }
                };

                this.InitConditionData = function () {

                    try {

                    } catch (ex) {
                    }
                };

                this.InitData = function () {

                    try {

                    } catch (ex) {
                    }
                };

                this.InitSpreadSheet = function () {
                    ggoSpread.Source = vspdData;
                    ggoSpread.ReDraw(false);
                    ggoSpread.MakeColumns(popupArgs.Columns.length);
                    ggoSpread.SetOperationMode(OperationMode.SingleSelect);

                    for (var i = 0; i < popupArgs.Columns.length; i++) {
                        ggoSpread.SSSetEdit(i + 1, popupArgs.Columns[i].Caption, popupArgs.Columns[i].Width, popupArgs.Columns[i].Align, 100, CellKind.Default, popupArgs.Columns[i].Hidden, EditCharCase.NoCase);
                    }

                    ggoSpread.SpreadLockWithOddEvenRow();
                    ggoSpread.ReDraw(true);
                };

                /*********************************************************************************************
                 * [END] Framework Init Method Part
                 *********************************************************************************************/


                /*********************************************************************************************
                 * [STA] *************************************************************************************
                 * Name : Event Method Part
                 * Remark : 페이지 이벤트 및 함수를 작성합니다.
                 *********************************************************************************************/

                this.txtCode_KeyDown = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            CommonWinPopup.DbQuery();
                            break;
                    }
                };
                this.txtName_KeyDown = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            CommonWinPopup.DbQuery();
                            break;
                    }
                };

                this.vspdData_DbClick = function (pSender, pCol, pRow) {
                    if (pRow === 0) return;

                    var dsReturnValues = new DataSetClass();
                    dsReturnValues.CreateDataTable("Result");

                    for (var i = 0; i < popupArgs.Columns.length; i++) {
                        dsReturnValues.Tables[0].AddColumn(popupArgs.Columns[i].FieldName);
                    }

                    if (vspdData.MaxRows > 0) {
                        var row = dsReturnValues.Tables[0].NewRow();
                        vspdData.Row = pRow;
                        for (var i = 0; i < popupArgs.Columns.length; i++) {
                            vspdData.Col = i + 1;
                            row[popupArgs.Columns[i].FieldName] = vspdData.Text;
                        }
                        dsReturnValues.Tables[0].AddRow(row);
                    }
                    
                    if (window.opener) {
                        window.returnValue = window.opener.returnValue = self.returnValue = dsReturnValues;
                    } else {
                        window.returnValue = self.returnValue = dsReturnValues;
                    }
                    self.close();
                };
                this.vspdData_KeyDown = function (pSpreadObj, pKeyCode, pShift) {
                    if (vspdData.ActiveRow === 0 || pKeyCode !== KeyCode.Enter) return;

                    var dsReturnValues = new DataSetClass();
                    dsReturnValues.CreateDataTable("Result");

                    for (var i = 0; i < popupArgs.Columns.length; i++) {
                        dsReturnValues.Tables[0].AddColumn(popupArgs.Columns[i].FieldName);
                    }

                    if (vspdData.MaxRows > 0) {
                        var row = dsReturnValues.Tables[0].NewRow();
                        vspdData.Row = vspdData.ActiveRow;
                        for (var i = 0; i < popupArgs.Columns.length; i++) {
                            vspdData.Col = i + 1;
                            row[popupArgs.Columns[i].FieldName] = vspdData.Text;
                        }
                        dsReturnValues.Tables[0].AddRow(row);
                    }

                    if (window.opener) {
                        window.returnValue = window.opener.returnValue = self.returnValue = dsReturnValues;
                    } else {
                        window.returnValue = self.returnValue = dsReturnValues;
                    }
                    self.close();
                };
                this.vspdDataCbProcess_CallbackComplete = function (s, e) {
                    try {
                        var callbackResult = BaseCallbackResultArgsClass.Deserialize(e.result);
                        switch (callbackResult.Cmd) {
                            case "DbQuery":
                                if (callbackResult.Code) {
                                    eni.Message.DisplayMsgBox("오류", callbackResult.Message);
                                } else {
                                    if (callbackResult.Data !== null) {
                                        ggoSpread.Source = vspdData;
                                        ggoSpread.ClearSpreadData();
                                        ggoSpread.ShowDataFromStr(callbackResult.Data);
                                        ggoSpread.Focus();
                                    } else {
                                        eni.Message.DisplayMsgBox("오류", "검색된 데이터가 없습니다.");
                                    }
                                }
                                break;
                        }

                        eni.Loading.DisplayLoading(false);
                    } catch (ex) {

                    } 
                };

                this.vspdDataCbProcess_CallbackError = function (s, e) {

                };

                this.DbQuery = function () {
                    var CommocbArgs = new BaseCallbackArgsClass();
                    CommocbArgs.Cmd = "DbQuery";
                    CommocbArgs.Data = new DbQueryCallBackArgsClass();
                    CommocbArgs.Data.Code = txtCode.GetText();
                    CommocbArgs.Data.Name = txtName.GetText();
                    CommocbArgs.Data.Columns = popupArgs.Columns;
                    CommocbArgs.Data.From = popupArgs.From;
                    CommocbArgs.Data.Where = popupArgs.Where;

                    eni.Loading.DisplayLoading(true);

                    vspdDataCbProcess.PerformCallback(CommocbArgs.Serialize());
                };
            });
        } catch (ex) {
            if (eni.Message) {
                eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
            } else {
                alert(ex.message);
            }
        };
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server"></asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <%-- 레이아웃 --%>
    <dx:ASPxDocumentViewer runat="server" ID="documentViewer" Width="100%" Height="100%">
        <SettingsSplitter SidePaneVisible="False" />
        <ToolbarItems>
                <dx:ReportToolbarButton ItemKind="Search" />
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarButton ItemKind="PrintReport" />
                <dx:ReportToolbarButton ItemKind="PrintPage" />
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                <dx:ReportToolbarLabel ItemKind="PageLabel" />
                <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                </dx:ReportToolbarComboBox>
                <dx:ReportToolbarLabel ItemKind="OfLabel" />
                <dx:ReportToolbarTextBox ItemKind="PageCount" />
                <dx:ReportToolbarButton ItemKind="NextPage" />
                <dx:ReportToolbarButton ItemKind="LastPage" />
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                    <Elements>
                        <dx:ListElement Value="pdf" />
                        <dx:ListElement Value="xls" />
                        <dx:ListElement Value="xlsx" />
                        <dx:ListElement Value="rtf" />
                        <dx:ListElement Value="mht" />
                        <dx:ListElement Value="html" />
                        <dx:ListElement Value="txt" />
                        <dx:ListElement Value="csv" />
                        <dx:ListElement Value="png" />
                    </Elements>
                </dx:ReportToolbarComboBox>
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarLabel Text="Zoom Factor" />
                <dx:ReportToolbarComboBox Name="ScaleFactor" Width="60px">
                    <Elements>
                        <dx:ListElement Text="50%" Value="50" />
                        <dx:ListElement Text="75%" Value="75" />
                        <dx:ListElement Text="100%" Value="100" />
                        <dx:ListElement Text="200%" Value="200" />
                        <dx:ListElement Text="250%" Value="250" />
                    </Elements>
                </dx:ReportToolbarComboBox>
            </ToolbarItems>

    </dx:ASPxDocumentViewer>

    <eni:eniCallback ID="vspdDataCbProcess" ClientInstanceName="vspdDataCbProcess" runat="server" CreateMode="StandardMode"
        OnCallback="vspdDataCbProcess_Callback">
        <ClientSideEvents  BeginCallback="CommonWinPopup.vspdDataCbProcess_BeginCallback" 
            CallbackComplete="CommonWinPopup.vspdDataCbProcess_CallbackComplete" 
            CallbackError="CommonWinPopup.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>
