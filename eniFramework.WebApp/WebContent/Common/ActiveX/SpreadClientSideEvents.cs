///// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.ComponentModel;

namespace eniFramework.WebApp.Common.ActiveX {
    public class SpreadClientSideEvents {
        public SpreadClientSideEvents() {
        }

        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("클아이언트 스크립트 초기화 이벤트 입니다.")]
        public string Init { get; set; }
        
        /// <summary>
        /// Advance(pSender, pAdvanceNext)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("Advance(pSender, pAdvanceNext)")]
        public string Advance {get;set;}
        /// <summary>
        /// AfterUserSort(pSender, pCol)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("AfterUserSort(pSender, pCol)")]
        public string AfterUserSort{get;set;}
        /// <summary>
        /// BeforeColMove(pSender, pCol1, pCol2, pColDest, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BeforeColMove(pSender, pCol1, pCol2, pColDest, pCancel)")]
        public string BeforeColMove{get;set;}
        /// <summary>
        /// BeforeEditMode(pSender, pCol, pRow, pUserAction, pCursorPos, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BeforeEditMode(pSender, pCol, pRow, pUserAction, pCursorPos, pCancel)")]
        public string BeforeEditMode{get;set;}
        /// <summary>
        /// BeforeRowMove(pSender, pRow1, pRow2, pRowDest, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BeforeRowMove(pSender, pRow1, pRow2, pRowDest, pCancel)")]
        public string BeforeRowMove{get;set;}
        /// <summary>
        /// BeforeScrollTip(pSender, pIsVertical, pIndex, pText, pWidth)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BeforeScrollTip(pSender, pIsVertical, pIndex, pText, pWidth)")]
        public string BeforeScrollTip{get;set;}
        /// <summary>
        /// BeforeUserSort(pSender, pCol, pSate, pDefaultAction)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BeforeUserSort(pSender, pCol, pSate, pDefaultAction)")]
        public string BeforeUserSort{get;set;}
        /// <summary>
        /// BlockSelected(pSender, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("BlockSelected(pSender, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2)")]
        public string BlockSelected{get;set;}
        /// <summary>
        /// ButtonClicked(pSender, pCol, pRow, pButtonDown)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("ButtonClicked(pSender, pCol, pRow, pButtonDown)")]
        public string ButtonClicked{get;set;}
        /// <summary>
        /// Change(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("Change(pSender, pCol, pRow)")]
        public string Change{get;set;}
        /// <summary>
        /// CircularFormula(pSender, pSheet, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("CircularFormula(pSender, pSheet, pCol, pRow)")]
        public string CircularFormula{get;set;}
        /// <summary>
        /// Click(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("Click(pSender, pCol, pRow)")]
        public string Click { get; set; }
        /// <summary>
        /// ColWidthChange(pSender, pCol1, pCol2)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("ColWidthChange(pSender, pCol1, pCol2)")]
        public string ColWidthChange{get;set;}
        /// <summary>
        /// ComboCloseUp(pSender, pCol, pRow, pSelChange)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("ComboCloseUp(pSender, pCol, pRow, pSelChange)")]
        public string ComboCloseUp{get;set;}
        /// <summary>
        /// ComboDropDown(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("ComboDropDown(pSender, pCol, pRow)")]
        public string ComboDropDown{get;set;}
        /// <summary>
        /// ComboSelChange(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("ComboSelChange(pSender, pCol, pRow)")]
        public string ComboSelChange{get;set;}
        /// <summary>
        /// DataColConfig(pSender, pCol, pDataField, pDataType)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DataColConfig(pSender, pCol, pDataField, pDataType)")]
        public string DataColConfig{get;set;}
        /// <summary>
        /// DataFill(pSender, pCol, pRow, pDataType, pfGetdata, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DataFill(pSender, pCol, pRow, pDataType, pfGetdata, pCancel)")]
        public string DataFill{get;set;}
        /// <summary>
        /// DataLoaded()
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DataLoaded()")]
        public string DataLoaded{get;set;}
        /// <summary>
        /// DblClick(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DblClick(pSender, pCol, pRow)")]
        public string DblClick{get;set;}
        /// <summary>
        /// DragDropBlock(pSender, pCol1, pRow1, pCol2, pRow2, pNewCol1, pNewRow1, pNewCol2, pNewRow2, pOverwrite, pAction, pDataonly, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DragDropBlock(pSender, pCol1, pRow1, pCol2, pRow2, pNewCol1, pNewRow1, pNewCol2, pNewRow2, pOverwrite, pAction, pDataonly, pCancel)")]
        public string DragDropBlock{get;set;}
        /// <summary>
        /// DrawItem(pSender, pCol, pRow, phDC, pLeft, pTop, pRight, pBottom, pStyle)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("DrawItem(pSender, pCol, pRow, phDC, pLeft, pTop, pRight, pBottom, pStyle)")]
        public string DrawItem{get;set;}
        /// <summary>
        /// EditChange(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("EditChange(pSender, pCol, pRow)")]
        public string EditChange{get;set;}
        /// <summary>
        /// EditError(pSender, pCol, pRow, pEditError)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("EditError(pSender, pCol, pRow, pEditError)")]
        public string EditError{get;set;}
        /// <summary>
        /// EditMode(pSender, pCol, pRow, pMode, pChangeMade)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("EditMode(pSender, pCol, pRow, pMode, pChangeMade)")]
        public string EditMode{get;set;}
        /// <summary>
        /// EnterRow(pSender, pRow, pRowIsLast)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("EnterRow(pSender, pRow, pRowIsLast)")]
        public string EnterRow{get;set;}
        /// <summary>
        /// LeaveCell(pSender, pCol, pRow, pNewCol, pNewRow, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("LeaveCell(pSender, pCol, pRow, pNewCol, pNewRow, pCancel)")]
        public string LeaveCell{get;set;}
        /// <summary>
        /// LeaveRow(pSender, pRow, pRowWasLast, pRowChanged, pAllCellIsHaveData, pNewRow, pNewRowIsLast, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("LeaveRow(pSender, pRow, pRowWasLast, pRowChanged, pAllCellIsHaveData, pNewRow, pNewRowIsLast, pCancel)")]
        public string LeaveRow{get;set;}
        /// <summary>
        /// OLECompleteDrag(pSender, pEffect)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLECompleteDrag(pSender, pEffect)")]
        public string OLECompleteDrag{get;set;}
        /// <summary>
        /// OLEDragDrop(pSender, pData, pEffect, pButton, pShift, pX, pY)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLEDragDrop(pSender, pData, pEffect, pButton, pShift, pX, pY)")]
        public string OLEDragDrop{get;set;}
        /// <summary>
        /// OLEDragOver(pSender, pData, pEffect, pButton, pShift, pX, pY, pState)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLEDragOver(pSender, pData, pEffect, pButton, pShift, pX, pY, pState)")]
        public string OLEDragOver{get;set;}
        /// <summary>
        /// OLEGiveFeedback(pSender, pEffect, pDefaultCursors)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLEGiveFeedback(pSender, pEffect, pDefaultCursors)")]
        public string OLEGiveFeedback{get;set;}
        /// <summary>
        /// OLESetData(pSender, pData, pDataFormat)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLESetData(pSender, pData, pDataFormat)")]
        public string OLESetData{get;set;}
        /// <summary>
        /// OLEStartDrag(pSender, pData, pAllowedEffects)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("OLEStartDrag(pSender, pData, pAllowedEffects)")]
        public string OLEStartDrag{get;set;}
        /// <summary>
        /// PageChange(pSender, pPage)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("PageChange(pSender, pPage)")]
        public string PageChange{get;set;}
        /// <summary>
        /// PrintAbort(pSender, pAbort)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("PrintAbort(pSender, pAbort)")]
        public string PrintAbort{get;set;}
        /// <summary>
        /// PrintMsgBox(pSender, pText, pPrintID, pOpenMsgBox, pProcessed)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("PrintMsgBox(pSender, pText, pPrintID, pOpenMsgBox, pProcessed)")]
        public string PrintMsgBox{get;set;}
        /// <summary>
        /// QueryAdvance(pSender, pAdvanceNext, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("")]
        public string QueryAdvance{get;set;}
        /// <summary>
        /// QueryData(pSender, pRow, pRowsNeeded, pRowsLoaded, pDirection, pAtTop, pAtBottom)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("QueryData(pSender, pRow, pRowsNeeded, pRowsLoaded, pDirection, pAtTop, pAtBottom)")]
        public string QueryData{get;set;}
        /// <summary>
        /// RightClick(pSender, pClickType, pCol, pRow, pMouseX, pMouseY)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("RightClick(pSender, pClickType, pCol, pRow, pMouseX, pMouseY)")]
        public string RightClick{get;set;}
        /// <summary>
        /// RowHeightChange(pSender, pRow1, pRow2)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("RowHeightChange(pSender, pRow1, pRow2)")]
        public string RowHeightChange{get;set;}
        /// <summary>
        /// SelChange(pSender, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2, pCurCol, pCurRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("SelChange(pSender, pBlockCol1, pBlockRow1, pBlockCol2, pBlockRow2, pCurCol, pCurRow)")]
        public string SelChange{get;set;}
        /// <summary>
        /// SheetChanged(pSender, pOldSheet, pNewSheet)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("SheetChanged(pSender, pOldSheet, pNewSheet)")]
        public string SheetChanged{get;set;}
        /// <summary>
        /// SheetChanging(pSender, pOldSheet, pNewSheet, pCancel)
        /// </summary>
        [DefaultValue("")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("SheetChanging(pSender, pOldSheet, pNewSheet, pCancel)")]
        public string SheetChanging{get;set;}
        /// <summary>
        /// TabScrolled(pSender, pOldLeftSheet, pNewLeftSheet)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("TabScrolled(pSender, pOldLeftSheet, pNewLeftSheet)")]
        public string TabScrolled{get;set;}
        /// <summary>
        /// TabScrolling(pSender, pOldLeftSheet, pNewLeftSheet)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("TabScrolling(pSender, pOldLeftSheet, pNewLeftSheet)")]
        public string TabScrolling{get;set;}
        /// <summary>
        /// TextTipFetch(pSender, pRow, pMultiLine, pTipWidth, pTipText, pShowTip)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("TextTipFetch(pSender, pRow, pMultiLine, pTipWidth, pTipText, pShowTip)")]
        public string TextTipFetch{get;set;}
        /// <summary>
        /// TopLeftChange(pSender, pOldLeft, pOldtop, pNewLeft, pNewtop)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("TopLeftChange(pSender, pOldLeft, pOldtop, pNewLeft, pNewtop)")]
        public string TopLeftChange{get;set;}
        /// <summary>
        /// UserFormulaEntered(pSender, pCol, pRow)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("UserFormulaEntered(pSender, pCol, pRow)")]
        public string UserFormulaEntered{get;set;}
        /// <summary>
        /// VirtualClearData(pSender, pRow, pRowsBeingCleared)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("VirtualClearData(pSender, pRow, pRowsBeingCleared)")]
        public string VirtualClearData{get;set;}
        /// <summary>
        /// Zoom()
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("Zoom()")]
        public string Zoom{get;set;}
        
        // VB Events
        /// <summary>
        /// GotFocus()
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("GotFocus()")]
        public string GotFocus{get;set;}
        /// <summary>
        /// KeyDown(pSender, pKeyCode, pShift)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("KeyDown(pSender, pKeyCode, pShift)")]
        public string KeyDown{get;set;}
        /// <summary>
        /// KeyPress(pSender, pKeyAscii)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("")]
        public string KeyPress{get;set;}
        /// <summary>
        /// KeyUp(pSender, pKeyCode, pShift)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("KeyUp(pSender, pKeyCode, pShift)")]
        public string KeyUp{get;set;}
        /// <summary>
        /// LostFocus()
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("LostFocus()")]
        public string LostFocus{get;set;}
        /// <summary>
        /// MouseDown(pSender, pButton, pShift, pX, pY)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("MouseDown(pSender, pButton, pShift, pX, pY)")]
        public string MouseDown{get;set;}
        /// <summary>
        /// MouseMove(pSender, pButton, pShift, pX, pY)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("MouseMove(pSender, pButton, pShift, pX, pY)")]
        public string MouseMove{get;set;}
        /// <summary>
        /// MouseUp(pSender, pButton, pShift, pX, pY)
        /// </summary>
        [DefaultValue("")]
        [Category("eniFramework")]
        [Localizable(false)]
        [NotifyParentProperty(true)]
        [Description("MouseUp(pSender, pButton, pShift, pX, pY)")]
        public string MouseUp{get;set;}
        
    }
}