<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eniSpread.ascx.cs" Inherits="eniFramework.WebApp.Common.ActiveX.eniSpread" %>

<%@ Import Namespace="eniFramework" %>
<%@ Import Namespace="eniFramework.WebApp.Variables" %>

<!--
**************************************************************************************************************
*  1. Module Name          : eniSpread 컨트롤
*  2. Function Name        :
*  3. Program ID           : eniSpread.ascx
*  4. Program Name         : OCX 그리드 컨트롤
*  5. Program Desc         : OCX 그리드 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-07-25
*  8. Modified date(Last)  : 2015-09-30
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="eniSpread_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../../Scripts/jQuery/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../../Scripts/Devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        
    </script>
</asp:PlaceHolder>

<%-- eniSpread Control --%>
<div id="<%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>Container" style="width:100%; height:100%; border:1px solid #A5ACB5; vertical-align:top;">
    <div class="DisplayNone" style="display: none;">
        <object classid="CLSID:5220CB21-C88D-11CF-B347-00AA00A28331">
            <param name="LPKPath" value="<%= GetLPK() %>"/>
        </object>
        
        <%--<object classid="CLSID:0F026C11-5A66-4C2B-87B5-88DDEBAE72A1" codebase="/WebContent/Common/Control/ActiveX/vsFlex8L.cab#version=8,0,20141,302" id="vaSpread8"></object>--%>
        <%--<object classid="CLSID:DD55D13D-EBF7-11D0-8810-0000C0E5948C" codebase="/WebContent/Common/Control/ActiveX/Edt32x3030037.cab#version=3,0,0,37" id="fpDoubleSingle"></object>
        <object classid="CLSID:41F841C1-AE16-11D5-8817-0050DA6EF5E5" codebase="/WebContent/Common/Control/ActiveX/Spr32x6060057.cab#version=6,0,0,57" id="vaSpread6"></object>
        <object classid="CLSID:71146838-020D-4D16-80FD-6ACE384B66DF" codebase="/WebContent/Common/Control/ActiveX/FPSpru70037.cab#version=7,0,0,37" id="vaSpread7"></object>
        <object classid="CLSID:3A67E4CC-75E2-41CA-9091-CBE12D1EB90E" codebase="/WebContent/Common/Control/ActiveX/eniVSFlexGrid8.cab#version=1,0,0,0" id="vaSpread8"></object>--%>
        <%--<object classid="CLSID:71146838-020D-4D16-80FD-6ACE384B66DF" codebase="/WebContent/Common/Control/ActiveX/FPSpru70017.cab#version=7,0,0,3" id="vaSpread7"></object>--%>
    </div>
    <object classid="<%= GetControlCLSID() %>" id="<%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>" name="<%=string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>" style="width:100%; height:100%; z-index:1;">
        <param name="MaxCols" value="0"/>
        <param name="MaxRows" value="0"/>
    </object>
</div>

<asp:PlaceHolder ID="eniSpread_After_Event_Holder" runat="server">
    <%-- 컨트롤 초기화 후 스트립트 --%>
    <script type="text/javascript">
        var <%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>;
        
        function <%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>_Init(pSpreadObj){
            pSpreadObj.Version = "<%= GetVersionString() %>";    
            pSpreadObj.EnableSort = <%= EnableSort ? "true" : "false" %>;
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.Advance) == false) { %>
                function pSpreadObj::Advance(pAdvanceNext) {
                    if (<%= ClientSideEvents.Advance %>){
                        <%= ClientSideEvents.Advance %>(pSpreadObj, pAdvanceNext);
                    };
                };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.AfterUserSort) == false) { %>
                function pSpreadObj::AfterUserSort(pCol) {
                    if (<%= ClientSideEvents.AfterUserSort %>){
                        <%= ClientSideEvents.AfterUserSort %>(pSpreadObj, pCol);
                    };
                };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BeforeColMove) == false) { %>
                function pSpreadObj::BeforeColMove(pCol1, pCol2, pColDest, pCancel) {
                    if (<%= ClientSideEvents.BeforeColMove %>){
                        <%= ClientSideEvents.BeforeColMove %>(pSpreadObj, pCol1, pCol2, pColDest, pCancel);
                    };
                };
            <% } %>
            
            <% if (GetVersionString() != "6.0") { %>
                function pSpreadObj::BeforeEditMode(pCol, pRow, pUserAction, pCursorPos, pCancel) {
                    <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BeforeEditMode) == false) { %>
                        if (<%= ClientSideEvents.BeforeEditMode %>){
                            <%= ClientSideEvents.BeforeEditMode %>(pSpreadObj, pCol, pRow, pUserAction, pCursorPos, pCancel);
                        };
                    <% } %>
                    
                    if (pCancel == false) {
                        pSpreadObj.Row = 0;
                        pSpreadObj.Col = pSpreadObj.MaxCols;
                        if (pSpreadObj.Text != pSpreadObj.HiddenRowColName) {
                            return;
                        }
                        
                        pSpreadObj.Col = pCol;
                        pSpreadObj.Row = pRow;
                        
                        if (pSpreadObj.CellType == CellType.Button) {
                            return;
                        }

                        if (pSpreadObj.Text != pSpreadObj.InsertFlag) {
                            var add_list = true;
                            if (pSpreadObj.EditChangeHistory) {
                                pSpreadObj.EditChangeHistory.forEach(function(pCurrentObject, pIndex, pEditChangeHistory){
                                    if (pCurrentObject.Row == pRow && pCurrentObject.Col == pCol){
                                        add_list = false;
                                    }
                                });
                            }

                            if (add_list){
                                pSpreadObj.Col = pSpreadObj.MaxCols;
                                var hid_row = pSpreadObj.Text;

                                pSpreadObj.Col = pCol;
                                var add_object = {Row : pRow, HidRow : hid_row, Col : pCol, Text :pSpreadObj.Text, Value : pSpreadObj.Value };
                                pSpreadObj.EditChangeHistory.push(add_object);
                            }
                        }
                    }
                };
            <% } %>
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BeforeRowMove) == false) { %>
            function pSpreadObj::BeforeRowMove(pRow1, pRow2, pRowDest, pCancel) {
                if (<%= ClientSideEvents.BeforeRowMove %>){
                    <%= ClientSideEvents.BeforeRowMove %>(pSpreadObj, pRow1, pRow2, pRowDest, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BeforeScrollTip) == false) { %>
            function pSpreadObj::BeforeScrollTip(pIsVertical, pIndex, pText, pWidth) {
                if (<%= ClientSideEvents.BeforeScrollTip %>){
                    <%= ClientSideEvents.BeforeScrollTip %>(pSpreadObj, pIsVertical, pIndex, pText, pWidth);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BeforeUserSort) == false) { %>
            function pSpreadObj::BeforeUserSort(pCol, pSate, pDefaultAction) {
                if (<%= ClientSideEvents.BeforeUserSort %>){
                    <%= ClientSideEvents.BeforeUserSort %>(pSpreadObj, pCol, pSate, pDefaultAction);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.BlockSelected) == false) { %>
            function pSpreadObj::BlockSelected(pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2) {
                if (<%= ClientSideEvents.BlockSelected %>){
                    <%= ClientSideEvents.BlockSelected %>(pSpreadObj, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.ButtonClicked) == false) { %>
            function pSpreadObj::ButtonClicked(pCol, pRow, pButtonDown) {
                if (<%= ClientSideEvents.ButtonClicked %>){
                    <%= ClientSideEvents.ButtonClicked %>(pSpreadObj, pCol, pRow, pButtonDown);
                };
            };
            <% } %>
            
            function pSpreadObj::Change(pCol, pRow) {
                pSpreadObj.Col = pCol;
                pSpreadObj.Row = pRow;
                
                if (pSpreadObj.CellType == CellType.Button || pSpreadObj.ColHidden == true) {
                    return;
                }

                pSpreadObj.Col = pCol;
                pSpreadObj.Row = 0;
                if (pSpreadObj.Text == pSpreadObj.HiddenRowColName){
                    return;
                }


                var bUpdateFlg = true;
                
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.Change) == false) { %>
                if (<%= ClientSideEvents.Change %>){
                    var org_data = null;
                    
                    if (pSpreadObj.EditChangeHistory) {
                        pSpreadObj.EditChangeHistory.forEach(function(pCurrentObject, pIndex, pEditChangeHistory){
                            if (pCurrentObject.HidRow == pRow && pCurrentObject.Col == pCol){
                                org_data = pCurrentObject;
                            }
                        });
                    }
                    bUpdateFlg = <%= ClientSideEvents.Change %>(pSpreadObj, pCol, pRow, org_data);
                };
                <% } %>
                if (pSpreadObj.MaxRows > 0 && (bUpdateFlg == undefined || bUpdateFlg)) {
                    //pSpreadObj.Col = pSpreadObj.MaxCols;
                    //pSpreadObj.Row = pRow;
                    
                    //if (pCol === pSpreadObj.MaxCols) {
                    //    pSpreadObj.Col = 0;
                    //    var  org_flg = pSpreadObj.Text;
                    //    pSpreadObj.Col = pCol;
                    //    pSpreadObj.Text = org_flg;
                    //} else {
                    //    if (pSpreadObj.Text !== pSpreadObj.InsertFlag && pSpreadObj.Text !== pSpreadObj.UpdateFlag && pSpreadObj.Text !== pSpreadObj.DeleteFlag){
                    //        pSpreadObj.Text = pSpreadObj.UpdateFlag;

                    //        pSpreadObj.Col = 0;
                    //        pSpreadObj.Text = pSpreadObj.UpdateFlag
                    //    } else {
                    //        var org_flg = pSpreadObj.Text;
                    //        pSpreadObj.Col = 0;
                    //        pSpreadObj.Text = org_flg;
                    //    }
                    //}

                    pSpreadObj.Col = 0;
                    pSpreadObj.Row = pRow;

                    if (pSpreadObj.Text == pSpreadObj.InsertFlag || pSpreadObj.Text == pSpreadObj.DeleteFlag) {
                        return;
                    }

                    pSpreadObj.Text = pSpreadObj.UpdateFlag;
                }
            };
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.CircularFormula) == false) { %>
            function pSpreadObj::CircularFormula(pSheet, pCol, pRow) {
                if (<%= ClientSideEvents.CircularFormula %>){
                    <%= ClientSideEvents.CircularFormula %>(pSpreadObj, pSheet, pCol, pRow);
                };
            };
            <% } %>
            function pSpreadObj::Click(pCol, pRow) {
                //if (pRow === 0) {
                //    pSpreadObj.ReDraw(false);
                //    pSpreadObj.BlockMode = true;
                //    pSpreadObj.Col = pCol;
                //    pSpreadObj.Col2 = pCol;
                //    pSpreadObj.Row = 0;
                //    pSpreadObj.Row2 = pSpreadObj.MaxCols;
                //    pSpreadObj.Action = 2;
                //    pSpreadObj.BlockMode = false;
                //    pSpreadObj.ReDraw(true);
                //}

                //if (pRow === 0 && pSpreadObj.MaxRows > 1) {
                //    //pSpreadObj.ReDraw(false);
                //    if (pSpreadObj.ColUserSortIndicator(pCol) === ColUserSortIndicator.None) {
                //        pSpreadObj.ColUserSortIndicator(pCol) = ColUserSortIndicator.Ascending;
                //    } else if(pSpreadObj.ColUserSortIndicator(pCol) === ColUserSortIndicator.Ascending) {
                //        pSpreadObj.ColUserSortIndicator(pCol) = ColUserSortIndicator.Descending;
                //    } else {
                //        pSpreadObj.ColUserSortIndicator(pCol) = ColUserSortIndicator.Ascending;
                //    }
                //    pSpreadObj.UserColAction  = UserColAction.Sort;
                //    //pSpreadObj.UserColAction = UserColAction.SortNoIndicator;
                //    pSpreadObj.UserColAction = UserColAction.Default;
                //    //pSpreadObj.ReDraw(true);
                //}

                //v1
                //if (pCol > 0 && pRow === 0 && pSpreadObj.MaxRows > 1) {
                //    pSpreadObj.SortKey(1) = 2;
                //    pSpreadObj.SortKeyOrder(1) = 1;
                //    pSpreadObj.Sort(pCol, pCol, -1, -1, 0);
                //}
                
                if (lgActiveSpread !== pSpreadObj){
                    lgActiveSpread = pSpreadObj;
                }

                if (pSpreadObj.MaxRows == 0) {
                    return;
                }
                
                if (!pSpreadObj.EnableSort) {
                    return;
                }
 	
                if (pRow <= 0) {
                    if (lgSortKey1 == 1) {
                        lgSortKey1 = 2;
                    } else {
                        lgSortKey1 = 1;
                    }

                    pSpreadObj.Col = -1;
                    pSpreadObj.Row = -1;
                    pSpreadObj.SortBy = 0; //Row
                    pSpreadObj.SortKey(1) = pCol;
                    pSpreadObj.SortKeyOrder(1) = lgSortKey1;
                    //pSpreadObj.Sort(pCol, pCol, -1, -1, 0); //Sort in Ascending
                    pSpreadObj.Action = 25;
                }
                
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.Click) == false) { %>
                if (<%= ClientSideEvents.Click %>){
                    <%= ClientSideEvents.Click %>(pSpreadObj, pCol, pRow);
                };
                <% } %>
            };
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.ColWidthChange) == false) { %>
            function pSpreadObj::ColWidthChange(pCol1, pCol2) {
                if (<%= ClientSideEvents.ColWidthChange %>){
                    <%= ClientSideEvents.ColWidthChange %>(pSpreadObj, pCol1, pCol2);
                };
            };
            <% } %>
            
            function pSpreadObj::ComboCloseUp(pCol, pRow, pSelChange) {
                pSpreadObj.EditEnterAction = 0;
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.ComboCloseUp) == false) { %>
                if (<%= ClientSideEvents.ComboCloseUp %>){
                    <%= ClientSideEvents.ComboCloseUp %>(pSpreadObj, pCol, pRow, pSelChange);
                };
                <% } %>
            };
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.ComboDropDown) == false) { %>
            function pSpreadObj::ComboDropDown(pCol, pRow) {
                if (<%= ClientSideEvents.ComboDropDown %>){
                    <%= ClientSideEvents.ComboDropDown %>(pSpreadObj, pCol, pRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.ComboSelChange) == false) { %>
            function pSpreadObj::ComboSelChange(pCol, pRow) {
                if (<%= ClientSideEvents.ComboSelChange %>){
                    <%= ClientSideEvents.ComboSelChange %>(pSpreadObj, pCol, pRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DataColConfig) == false) { %>
            function pSpreadObj::DataColConfig(pCol, pDataField, pDataType) {
                if (<%= ClientSideEvents.DataColConfig %>){
                    <%= ClientSideEvents.DataColConfig %>(pSpreadObj, pCol, pDataField, pDataType);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DataFill) == false) { %>
            function pSpreadObj::DataFill(pCol, pRow, pDataType, pfGetdata, pCancel) {
                if (<%= ClientSideEvents.DataFill %>){
                    <%= ClientSideEvents.DataFill %>(pSpreadObj, pCol, pRow, pDataType, pfGetdata, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DataLoaded) == false) { %>
            function pSpreadObj::DataLoaded() {
                if (<%= ClientSideEvents.DataLoaded %>){
                    <%= ClientSideEvents.DataLoaded %>(pSpreadObj);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DblClick) == false) { %>
            function pSpreadObj::DblClick(pCol, pRow) {
                if (<%= ClientSideEvents.DblClick %>){
                    <%= ClientSideEvents.DblClick %>(pSpreadObj, pCol, pRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DragDropBlock) == false) { %>
            function pSpreadObj::DragDropBlock(pCol1, pRow1, pCol2, pRow2, pNewCol1, pNewRow1, pNewCol2, pNewRow2, pOverwrite, pAction, pDataonly, pCancel) {
                if (<%= ClientSideEvents.DragDropBlock %>){
                    <%= ClientSideEvents.DragDropBlock %>(pSpreadObj, pCol1, pRow1, pCol2, pRow2, pNewCol1, pNewRow1, pNewCol2, pNewRow2, pOverwrite, pAction, pDataonly, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.DrawItem) == false) { %>
            function pSpreadObj::DrawItem(pCol, pRow, phDC, pLeft, pTop, pRight, pBottom, pStyle) {
                if (<%= ClientSideEvents.DrawItem %>){
                    <%= ClientSideEvents.DrawItem %>(pSpreadObj, pCol, pRow, phDC, pLeft, pTop, pRight, pBottom, pStyle);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.EditChange) == false) { %>
            function pSpreadObj::EditChange(pCol, pRow) {
                if (<%= ClientSideEvents.EditChange %>){
                    <%= ClientSideEvents.EditChange %>(pSpreadObj, pCol, pRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.EditError) == false) { %>
            function pSpreadObj::EditError(pCol, pRow, pEditError) {
                if (<%= ClientSideEvents.EditError %>){
                    <%= ClientSideEvents.EditError %>(pSpreadObj, pCol, pRow, pEditError);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.EditMode) == false) { %>
            function pSpreadObj::EditMode(pCol, pRow, pMode, pChangeMade) {
                if (<%= ClientSideEvents.EditMode %>){
                    <%= ClientSideEvents.EditMode %>(pSpreadObj, pCol, pRow, pMode, pChangeMade);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.EnterRow) == false) { %>
            function pSpreadObj::EnterRow(pRow, pRowIsLast) {
                if (<%= ClientSideEvents.EnterRow %>){
                    <%= ClientSideEvents.EnterRow %>(pSpreadObj, pRow, pRowIsLast);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.LeaveCell) == false) { %>
            function pSpreadObj::LeaveCell(pCol, pRow, pNewCol, pNewRow, pCancel) {
                if (<%= ClientSideEvents.LeaveCell %>){
                    <%= ClientSideEvents.LeaveCell %>(pSpreadObj, pCol, pRow, pNewCol, pNewRow, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.LeaveRow) == false) { %>
            function pSpreadObj::LeaveRow(pRow, pRowWasLast, pRowChanged, pAllCellIsHaveData, pNewRow, pNewRowIsLast, pCancel) {
                if (<%= ClientSideEvents.LeaveRow %>){
                    <%= ClientSideEvents.LeaveRow %>(pSpreadObj, pRow, pRowWasLast, pRowChanged, pAllCellIsHaveData, pNewRow, pNewRowIsLast, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLECompleteDrag) == false) { %>
            function pSpreadObj::OLECompleteDrag(pEffect) {
                if (<%= ClientSideEvents.OLECompleteDrag %>){
                    <%= ClientSideEvents.OLECompleteDrag %>(pSpreadObj, pEffect);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLEDragDrop) == false) { %>
            function pSpreadObj::OLEDragDrop(pData, pEffect, pButton, pShift, pX, pY) {
                if (<%= ClientSideEvents.OLEDragDrop %>){
                    <%= ClientSideEvents.OLEDragDrop %>(pSpreadObj, pData, pEffect, pButton, pShift, pX, pY);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLEDragOver) == false) { %>
            function pSpreadObj::OLEDragOver(pData, pEffect, pButton, pShift, pX, pY, pState) {
                if (<%= ClientSideEvents.OLEDragOver %>){
                    <%= ClientSideEvents.OLEDragOver %>(pSpreadObj, pData, pEffect, pButton, pShift, pX, pY, pState);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLEGiveFeedback) == false) { %>
            function pSpreadObj::OLEGiveFeedback(pEffect, pDefaultCursors) {
                if (<%= ClientSideEvents.OLEGiveFeedback %>){
                    <%= ClientSideEvents.OLEGiveFeedback %>(pSpreadObj, pEffect, pDefaultCursors);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLESetData) == false) { %>
            function pSpreadObj::OLESetData(pData, pDataFormat) {
                if (<%= ClientSideEvents.OLESetData %>){
                    <%= ClientSideEvents.OLESetData %>(pSpreadObj, pData, pDataFormat);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.OLEStartDrag) == false) { %>
            function pSpreadObj::OLEStartDrag(pData, pAllowedEffects) {
                if (<%= ClientSideEvents.OLEStartDrag %>){
                    <%= ClientSideEvents.OLEStartDrag %>(pSpreadObj, pData, pAllowedEffects);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.PageChange) == false) { %>
            function pSpreadObj::PageChange(pPage) {
                if (<%= ClientSideEvents.PageChange %>){
                    <%= ClientSideEvents.PageChange %>(pSpreadObj, pPage);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.PrintAbort) == false) { %>
            function pSpreadObj::PrintAbort(pAbort) {
                if (<%= ClientSideEvents.PrintAbort %>){
                    <%= ClientSideEvents.PrintAbort %>(pSpreadObj, pAbort);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.PrintMsgBox) == false) { %>
            function pSpreadObj::PrintMsgBox(pText, pPrintID, pOpenMsgBox, pProcessed) {
                if (<%= ClientSideEvents.PrintMsgBox %>){
                    <%= ClientSideEvents.PrintMsgBox %>(pSpreadObj, pText, pPrintID, pOpenMsgBox, pProcessed);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.QueryAdvance) == false) { %>
            function pSpreadObj::QueryAdvance(pAdvanceNext, pCancel) {
                if (<%= ClientSideEvents.QueryAdvance %>){
                    <%= ClientSideEvents.QueryAdvance %>(pSpreadObj, pAdvanceNext, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.QueryData) == false) { %>
            function pSpreadObj::QueryData(pRow, pRowsNeeded, pRowsLoaded, pDirection, pAtTop, pAtBottom) {
                if (<%= ClientSideEvents.QueryData %>){
                    <%= ClientSideEvents.QueryData %>(pSpreadObj, pRow, pRowsNeeded, pRowsLoaded, pDirection, pAtTop, pAtBottom);
                };
            };
            <% } %>
            function pSpreadObj::RightClick(pClickType, pCol, pRow, pMouseX, pMouseY) {
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.RightClick) == false) { %>
                if (<%= ClientSideEvents.RightClick %>){
                    <%= ClientSideEvents.RightClick %>(pSpreadObj, pClickType, pCol, pRow, pMouseX, pMouseY);
                };
                <% } %>
            };
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.RowHeightChange) == false) { %>
            function pSpreadObj::RowHeightChange(pRow1, pRow2) {
                if (<%= ClientSideEvents.RowHeightChange %>){
                    <%= ClientSideEvents.RowHeightChange %>(pSpreadObj, pRow1, pRow2);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.SelChange) == false) { %>
            function pSpreadObj::SelChange(pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2, pCurCol, pCurRow) {
                if (<%= ClientSideEvents.SelChange %>){
                    <%= ClientSideEvents.SelChange %>(pSpreadObj, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2, pCurCol, pCurRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.SheetChanged) == false) { %>
            function pSpreadObj::SheetChanged(pOldSheet, pNewSheet) {
                if (<%= ClientSideEvents.SheetChanged %>){
                    <%= ClientSideEvents.SheetChanged %>(pSpreadObj, pOldSheet, pNewSheet);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.SheetChanging) == false) { %>
            function pSpreadObj::SheetChanging(pOldSheet, pNewSheet, pCancel) {
                if (<%= ClientSideEvents.SheetChanging %>){
                    <%= ClientSideEvents.SheetChanging %>(pSpreadObj, pOldSheet, pNewSheet, pCancel);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.TabScrolled) == false) { %>
            function pSpreadObj::TabScrolled(pOldLeftSheet, pNewLeftSheet) {
                if (<%= ClientSideEvents.TabScrolled %>){
                    <%= ClientSideEvents.TabScrolled %>(pSpreadObj, pOldLeftSheet, pNewLeftSheet);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.TabScrolling) == false) { %>
            function pSpreadObj::TabScrolling(pOldLeftSheet, pNewLeftSheet) {
                if (<%= ClientSideEvents.TabScrolling %>){
                    <%= ClientSideEvents.TabScrolling %>(pSpreadObj, pOldLeftSheet, pNewLeftSheet);
                };
            };
            <% } %>
            
            function pSpreadObj::TextTipFetch(pCol, pRow, pMultiLine, pTipWidth, pTipText, pShowTip) {
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.TextTipFetch) == false) { %>
                if (<%= ClientSideEvents.TextTipFetch %>){
                    <%= ClientSideEvents.TextTipFetch %>(pSpreadObj, pCol, pRow, pMultiLine, pTipWidth, pTipText, pShowTip);
                };
                <% } %>
                pTipText = pSpreadObj.CellTag;
                pShowTip = true;
            };
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.TopLeftChange) == false) { %>
            function pSpreadObj::TopLeftChange(pOldLeft, pOldtop, pNewLeft, pNewtop) {
                if (<%= ClientSideEvents.TopLeftChange %>){
                    <%= ClientSideEvents.TopLeftChange %>(pSpreadObj, pOldLeft, pOldtop, pNewLeft, pNewtop);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.UserFormulaEntered) == false) { %>
            function pSpreadObj::UserFormulaEntered(pCol, pRow) {
                if (<%= ClientSideEvents.UserFormulaEntered %>){
                    <%= ClientSideEvents.UserFormulaEntered %>(pSpreadObj, pCol, pRow);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.VirtualClearData) == false) { %>
            function pSpreadObj::VirtualClearData(pRow, pRowsBeingCleared) {
                if (<%= ClientSideEvents.VirtualClearData %>){
                    <%= ClientSideEvents.VirtualClearData %>(pSpreadObj, pRow, pRowsBeingCleared);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.Zoom) == false) { %>
            function pSpreadObj::Zoom() {
                if (<%= ClientSideEvents.Zoom %>){
                    <%= ClientSideEvents.Zoom %>(pSpreadObj);
                };
            };
            <% } %>
            
            // VB Events
            function pSpreadObj::GotFocus() {
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.GotFocus) == false) { %>
                    if (<%= ClientSideEvents.GotFocus %>){
                        <%= ClientSideEvents.GotFocus %>(pSpreadObj);
                };
                <% } %>
            };
            
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.KeyDown) == false) { %>
            function pSpreadObj::KeyDown(pKeyCode, pShift) {
                if (<%= ClientSideEvents.KeyDown %>){
                    <%= ClientSideEvents.KeyDown %>(pSpreadObj, pKeyCode, pShift);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.KeyPress) == false) { %>
            function pSpreadObj::KeyPress(pKeyAscii) {
                if (<%= ClientSideEvents.KeyPress %>){
                    <%= ClientSideEvents.KeyPress %>(pSpreadObj, pKeyAscii);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.KeyUp) == false) { %>
            function pSpreadObj::KeyUp(pKeyCode, pShift) {
                if (<%= ClientSideEvents.KeyUp %>){
                    <%= ClientSideEvents.KeyUp %>(pSpreadObj, pKeyCode, pShift);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.LostFocus) == false) { %>
            function pSpreadObj::LostFocus() {
                if (<%= ClientSideEvents.LostFocus %>){
                    <%= ClientSideEvents.LostFocus %>(pSpreadObj);
                };
            };
            <% } %>
            function pSpreadObj::MouseDown(pButton, pShift, pX, pY) {
                if (lgActiveSpread !== pSpreadObj){
                    lgActiveSpread = pSpreadObj;
                }
                <% if (string.IsNullOrWhiteSpace(ClientSideEvents.MouseDown) == false) { %>
                if (<%= ClientSideEvents.MouseDown %>){
                    <%= ClientSideEvents.MouseDown %>(pSpreadObj, pButton, pShift, pX, pY);
                };
                <% } %> 
            };
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.MouseMove) == false) { %>
            function pSpreadObj::MouseMove(pButton, pShift, pX, pY) {
                if (<%= ClientSideEvents.MouseMove %>){
                    <%= ClientSideEvents.MouseMove %>(pSpreadObj, pButton, pShift, pX, pY);
                };
            };
            <% } %>
            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.MouseUp) == false) { %>
            function pSpreadObj::MouseUp(pButton, pShift, pX, pY) {
                if (<%= ClientSideEvents.MouseUp %>){
                    <%= ClientSideEvents.MouseUp %>(pSpreadObj, pButton, pShift, pX, pY);
                };
            };
            <% } %>

            ggoSpread.Source = pSpreadObj;
            ggoSpread.Spreadinit();

            <% if (string.IsNullOrWhiteSpace(ClientSideEvents.Init) == false) { %>
            if (<%= ClientSideEvents.Init %>){
                <%= ClientSideEvents.Init %>(pSpreadObj, pSpreadObj);
            };
            <% } %>
        };
        
        for (var i = 0; i < document.all.length; i++) {
            if (String(document.all[i].tagName).toUpperCase() === "OBJECT" && String(document.all[i].classid).toUpperCase() == "<%= GetControlCLSID() %>" &&
                document.all[i].id == "<%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>" && document.all[i].name == "<%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>") {
                <%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %> = document.all[i];
            }
        }

        <%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>_Init(<%= string.IsNullOrWhiteSpace(ClientInstanceName) ? ClientID : ClientInstanceName %>);
    </script>
</asp:PlaceHolder>