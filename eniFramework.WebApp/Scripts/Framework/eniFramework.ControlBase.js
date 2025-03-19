/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.ControlBase = new function () {
        this.Initialize = function (eniControl) {
            var overMethod = eniControl.SetEnabled;

            eniControl.SetEnabled = function (enabled) {
                this.OverSetEnabled(enabled);
                if (this.CustomEnabled == true && !enabled) {
                    this.CustomEnabled = false;
                }
            };

            eniControl.OverSetEnabled = overMethod;

            return eniControl;
        };
        this.InitEditor = function (oEditor, pOrgEvent) {
            if (window.lgEditorArr) {
                lgEditorArr.push(oEditor);
            }

            if (oEditor.UpperCase) {
                var style = oEditor.GetInputElement().getAttribute("style");
                oEditor.GetInputElement().setAttribute("style", (style || "") + "text-transform:uppercase;");
            }
            if (!oEditor.SetToolTip) {
                oEditor.SetToolTip = function (strText) {
                    var editEl = oEditor.GetMainElement();
                    editEl.title = (strText || oEditor.GetText());
                };
            }
            if (!oEditor.GetToolTip) {
                oEditor.GetToolTip = function (strText) {
                    var editEl = oEditor.GetMainElement();
                    return editEl.title;
                };
            }

            oEditor.SetText = function (value) {
                if (this.maskInfo != null) {
                    this.maskInfo.SetText(value);
                    this.ApplyMaskInfo(false);
                    this.SavePrevMaskValue();
                } else {
                    this.SetValue(value);
                }
                this.SetToolTip();
            };
            

            if (oEditor.KeyPress) {
                //Edit컨트롤 공통 키다운 이벤트 바인딩
                var newKeyPressEvent = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
                            break;
                    }

                    if (s.orgKeyPressEvent) {
                        try {
                            s.orgKeyPressEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (oEditor.KeyPress.handlerInfoList && oEditor.KeyPress.handlerInfoList.length > 0) {
                    oEditor.orgKeyPressEvent = oEditor.KeyPress.handlerInfoList[0].handler;
                    oEditor.KeyPress.RemoveHandler(oEditor.orgKeyPressEvent);
                }

                oEditor.KeyPress.AddHandler(newKeyPressEvent);
            }

            if (oEditor.KeyUp) {
                //Edit컨트롤 공통 키다운 이벤트 바인딩
                var orgKeyUpEvent = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
                            break;
                    }

                    if (s.orgKeyUpEvent) {
                        try {
                            s.orgKeyUpEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (oEditor.KeyUp.handlerInfoList && oEditor.KeyUp.handlerInfoList.length > 0) {
                    oEditor.orgKeyUpEvent = oEditor.KeyUp.handlerInfoList[0].handler;
                    oEditor.KeyUp.RemoveHandler(oEditor.orgKeyUpEvent);
                }

                oEditor.KeyUp.AddHandler(orgKeyUpEvent);
            }

            if (oEditor.KeyDown) {
                //Edit컨트롤 공통 키다운 이벤트 바인딩
                var newKeyDownEvent = function (s, e) {
                    switch (e.htmlEvent.keyCode) {
                        case KeyCode.Enter:
                            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);

                            //StrandardMode만 페이지 내의 공통 함수 페이지 쿼리를 호출한다.
                            if (oEditor.CreateMode == CreateMode.BSLMode && oEditor.EnterActionQuery) {
                                if (eni.LocalPage.ViewType != ViewType.PopupView) {
                                    var parent_fw = eni.getParentFramework();
                                    if (!parent_fw) {
                                        return;
                                    }

                                    var runQuery = function () {
                                        if (parent_fw.BaseOnFncQuery) {
                                            parent_fw.BaseOnFncQuery();
                                        }
                                    };

                                    if (parent_fw.LocalPage.getSubPageDataChange()) {
                                        parent_fw.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                            if (pDialogResult == DialogResult.Yes) {
                                                runQuery();
                                            }
                                        });
                                    } else {
                                        runQuery();
                                    }

                                    //if (eni.getLocalPage().OnFncQuery) {
                                    //    if (eni.IsDirty()) {
                                    //        eni.Message.DisplayBundleMsgBox("MSGBD00102", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    //            if (pDialogResult == DialogResult.Yes) {
                                    //                window.setTimeout(function () { eni.getLocalPage().OnFncQuery(); }.aspxBind(this), 0);
                                    //            }
                                    //        });
                                    //    } else {
                                    //        //바로 호출을 하니 eni.getLocalPage().OnFncQuery 안의 메시지 박스가 뜨지않는다.
                                    //        //eni.Message.DisplayBundleMsgBox("", "");
                                    //        window.setTimeout(function () { eni.getLocalPage().OnFncQuery(); }.aspxBind(this), 0);
                                    //    }
                                    //}
                                } else {
                                    if (eni.BaseOnFncQuery) {
                                        eni.BaseOnFncQuery();
                                    }
                                }
                            }
                            break;
                    }

                    if (s.orgKeyDownEvent) {
                        try {
                            s.orgKeyDownEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (oEditor.KeyDown.handlerInfoList && oEditor.KeyDown.handlerInfoList.length > 0) {
                    oEditor.orgKeyDownEvent = oEditor.KeyDown.handlerInfoList[0].handler;
                    oEditor.KeyDown.RemoveHandler(oEditor.orgKeyDownEvent);
                }

                oEditor.KeyDown.AddHandler(newKeyDownEvent);
            }


            if (oEditor.GotFocus) {
                //Edit 컨트롤의 공통 포커스 이벤트 바인딩
                var newGotFocusEvent = function (s, e) {
                    if (s.SetCaretPosition) {
                        if (s.SelectAll) {
                            s.SelectAll();
                        }
                    }

                    if (s.orgGotFocusEvent) {
                        try {
                            s.orgGotFocusEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (oEditor.GotFocus.handlerInfoList && oEditor.GotFocus.handlerInfoList.length > 0) {
                    if (oEditor.GotFocus.handlerInfoList[0].handler == newGotFocusEvent) {
                        oEditor.GotFocus.RemoveHandler(oEditor.GotFocus.handlerInfoList[0].handler);
                    } else {
                        oEditor.orgGotFocusEvent = oEditor.GotFocus.handlerInfoList[0].handler;
                        oEditor.GotFocus.RemoveHandler(oEditor.orgGotFocusEvent);
                    }
                }

                oEditor.GotFocus.AddHandler(newGotFocusEvent);
            }

            if (pOrgEvent) {
                pOrgEvent();
            }
        };

        this.InitButton = function (oButton, pOrgEvent) {
            if (window.lgButtonArr) {
                lgButtonArr.push(oButton);
            }

            if (!oButton.SetToolTip) {
                oButton.SetToolTip = function (strText) {
                    var editEl = oButton.GetMainElement();
                    editEl.title = (strText || oButton.GetText());
                };
            }
            if (!oButton.GetToolTip) {
                oButton.GetToolTip = function (strText) {
                    var editEl = oButton.GetMainElement();
                    return editEl.title;
                };
            }

            oButton.SetText = function (value) {
                if (this.maskInfo != null) {
                    this.maskInfo.SetText(value);
                    this.ApplyMaskInfo(false);
                    this.SavePrevMaskValue();
                } else {
                    this.SetValue(value);
                }
                this.SetToolTip();
            };
        };

        //eniCallbackPanel 컨트롤 초기화
        this.InitCallback = function (pCallback, pOrgEvent) {
            //StrandardMode만 페이지 내의 공통 함수 페이지 쿼리를 호출한다.
            if (pCallback.CreateMode == CreateMode.DefaultMode || pCallback.CreateMode == CreateMode.StandardMode) {
                pCallback.OnCallbackError = function (errorMessage, data) {
                    //표준 에러 메시지는 막는다.
                    //if (errorMessage)
                    //    alert(errorMessage);
                };

                pCallback.PerformCallback = function (parameter) {
                    lgProcessServer = true;
                    if (!ASPx.IsExists(parameter)) parameter = "";
                    this.CreateCallback(parameter);
                }

                //커스텀 비긴 콜백 이벤트 등록
                var newBeginCallbackEvent = function (s, e) {
                    if (s.orgBeginCallbackEvent) {
                        try {
                            s.orgBeginCallbackEvent(s, e);
                        } catch (ex) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        }
                    }

                    // Loading을 공통으로 처리했지만 관리자 페이지의 멀티 그리드의 조회시간때문에 로딩화면은 각 페이지에서 처리
                    //if (eni.Loading && eni.Message) {
                    //    if (eni.Loading.IsDisplayLoading() == false) {
                    //        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00108"));
                    //    }
                    //}
                };

                if (pCallback.BeginCallback.handlerInfoList && pCallback.BeginCallback.handlerInfoList.length > 0) {
                    if (pCallback.BeginCallback.handlerInfoList[0].handler == newBeginCallbackEvent) {
                        pCallback.BeginCallback.RemoveHandler(pCallback.BeginCallback.handlerInfoList[0].handler);
                    } else {
                        pCallback.orgBeginCallbackEvent = pCallback.BeginCallback.handlerInfoList[0].handler;
                        pCallback.BeginCallback.RemoveHandler(pCallback.orgBeginCallbackEvent);
                    }
                }

                pCallback.BeginCallback.AddHandler(newBeginCallbackEvent);

                // 커스텀 엔드 콜백 이벤트 등록
                var newEndCallbackEvent = function (s, e) {
                    if (s.orgEndCallbackEvent) {
                        try {
                            s.orgEndCallbackEvent(s, e);
                        } catch (ex) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        }
                    }

                    lgProcessServer = false;
                };

                if (pCallback.EndCallback.handlerInfoList && pCallback.EndCallback.handlerInfoList.length > 0) {
                    if (pCallback.EndCallback.handlerInfoList[0].handler == newEndCallbackEvent) {
                        pCallback.EndCallback.RemoveHandler(pCallback.EndCallback.handlerInfoList[0].handler);
                    } else {
                        pCallback.orgEndCallbackEvent = pCallback.EndCallback.handlerInfoList[0].handler;
                        pCallback.EndCallback.RemoveHandler(pCallback.orgEndCallbackEvent);
                    }
                }

                pCallback.EndCallback.AddHandler(newEndCallbackEvent);

                // 커스텀 콜백 에러 이벤트 등록
                var newCallbackErrorEvent = function (s, e) {
                    if (e.handled == false) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), e.message);
                        }

                        if (s.orgCallbackErrorEvent) {
                            try {
                                s.orgCallbackErrorEvent(s, e);
                            } catch (ex) { }
                        }
                    }
                }

                if (pCallback.CallbackError.handlerInfoList && pCallback.CallbackError.handlerInfoList.length > 0) {

                    if (pCallback.CallbackError.handlerInfoList[0].handler == newCallbackErrorEvent) {
                        pCallback.CallbackError.RemoveHandler(pCallback.CallbackError.handlerInfoList[0].handler);
                    } else {
                        pCallback.orgCallbackErrorEvent = pCallback.CallbackError.handlerInfoList[0].handler;
                        pCallback.CallbackError.RemoveHandler(pCallback.orgEndCallbackEvent);
                    }
                }

                pCallback.CallbackError.AddHandler(newCallbackErrorEvent);
            }

            if (pOrgEvent) {
                pOrgEvent();
            }
        };

        //eniCallbackPanel 컨트롤 초기화
        this.InitCallbackPanel = function (pCallbackPanel, pOrgEvent) {
            //StrandardMode만 페이지 내의 공통 함수 페이지 쿼리를 호출한다.
            if (pCallbackPanel.CreateMode == CreateMode.DefaultMode || pCallbackPanel.CreateMode == CreateMode.StandardMode) {
                pCallbackPanel.OnCallbackError = function (errorMessage, data) {
                    //표준 에러 메시지는 막는다.
                    //if (errorMessage)
                    //    alert(errorMessage);
                };

                //커스텀 비긴 콜백 이벤트 등록
                var newBeginCallbackEvent = function (s, e) {
                    if (s.orgBeginCallbackEvent) {
                        try {
                            s.orgBeginCallbackEvent(s, e);
                        } catch (ex) { }
                    }

                    //if (eni.Loading && eni.Message) {
                    //    if (eni.Loading.IsDisplayLoading() == false) {
                    //        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00108"));
                    //    }
                    //}
                };

                if (pCallbackPanel.BeginCallback.handlerInfoList && pCallbackPanel.BeginCallback.handlerInfoList.length > 0) {
                    if (pCallbackPanel.BeginCallback.handlerInfoList[0].handler == newBeginCallbackEvent) {
                        pCallbackPanel.BeginCallback.RemoveHandler(pCallbackPanel.BeginCallback.handlerInfoList[0].handler);
                    } else {
                        pCallbackPanel.orgBeginCallbackEvent = pCallbackPanel.BeginCallback.handlerInfoList[0].handler;
                        pCallbackPanel.BeginCallback.RemoveHandler(pCallbackPanel.orgBeginCallbackEvent);
                    }
                }

                pCallbackPanel.BeginCallback.AddHandler(newBeginCallbackEvent);

                // 커스텀 엔드 콜백 이벤트 등록
                var newEndCallbackEvent = function (s, e) {
                    if (s.orgEndCallbackEvent) {
                        try {
                            s.orgEndCallbackEvent(s, e);
                        } catch (ex) { }
                    }

                    //if (eni.Loading) {
                    //    if (eni.Loading.IsDisplayLoading()) {
                    //        eni.Loading.DisplayStatusLoading(false);
                    //    }
                    //}
                }

                if (pCallbackPanel.EndCallback.handlerInfoList && pCallbackPanel.EndCallback.handlerInfoList.length > 0) {
                    if (pCallbackPanel.EndCallback.handlerInfoList[0].handler == newEndCallbackEvent) {
                        pCallbackPanel.EndCallback.RemoveHandler(pCallbackPanel.EndCallback.handlerInfoList[0].handler);
                    } else {
                        pCallbackPanel.orgEndCallbackEvent = pCallbackPanel.EndCallback.handlerInfoList[0].handler;
                        pCallbackPanel.EndCallback.RemoveHandler(pCallbackPanel.orgEndCallbackEvent);
                    }
                }

                pCallbackPanel.EndCallback.AddHandler(newEndCallbackEvent);

                // 커스텀 콜백 에러 이벤트 등록
                var newCallbackErrorEvent = function (s, e) {
                    if (e.handled == false) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), e.message);
                        }

                        if (s.orgCallbackErrorEvent) {
                            try {
                                s.orgCallbackErrorEvent(s, e);
                            } catch (ex) { }
                        }
                    }
                }

                if (pCallbackPanel.CallbackError.handlerInfoList && pCallbackPanel.CallbackError.handlerInfoList.length > 0) {

                    if (pCallbackPanel.CallbackError.handlerInfoList[0].handler == newCallbackErrorEvent) {
                        pCallbackPanel.CallbackError.RemoveHandler(pCallbackPanel.CallbackError.handlerInfoList[0].handler);
                    } else {
                        pCallbackPanel.orgCallbackErrorEvent = pCallbackPanel.CallbackError.handlerInfoList[0].handler;
                        pCallbackPanel.CallbackError.RemoveHandler(pCallbackPanel.orgEndCallbackEvent);
                    }
                }

                pCallbackPanel.CallbackError.AddHandler(newCallbackErrorEvent);
            }

            if (pOrgEvent) {
                pOrgEvent();
            }
        };

        this.InitGridView = function (pGrdiView, pOrgEvent) {
            return;
            if (lgGridViewArr && (pGrdiView.CreateMode == CreateMode.DefaultMode || pGrdiView.CreateMode == CreateMode.StandardMode)) {
                //그리드뷰 포커스때 전역 그리드 변경
                $(pGrdiView.GetMainElement()).click(pGrdiView, function (srcTarget) {
                    if (lgActiveGridView == srcTarget.data) {
                        return;
                    }
                    lgActiveGridView = srcTarget.data;
                });

                pGrdiView.CurrentFocuseRowIndex = -1;
                pGrdiView.CurrentFocusColumnName = new String();
                if (pGrdiView.cpRowColumnType) {
                    pGrdiView.RowColumnType = JSON.parse(pGrdiView.cpRowColumnType);
                }


                pGrdiView.IsScriptEdit = false;
                pGrdiView.AllowRowCellEdit = function (pRowIndex, pFieldName) {
                    //해당 행의 컬럼을 수정가능한지 검사한다.
                    if (this.RowColumnType) {
                        for (var i = 0; i < this.RowColumnType.length; i++) {
                            if (this.RowColumnType[i][this.RowNumFieldName] == 'undefined') continue;

                            //전체 적용용 행이 있으면 먼저 확인한다.
                            if (this.RowColumnType[i][this.RowNumFieldName] == -1) {
                                if (this.RowColumnType[i][pFieldName] != 'undefined') {
                                    if (this.RowColumnType[i][pFieldName] == CellType.Protected) {
                                        return false;
                                    }
                                }
                            }

                            //지정행의 확인한다.
                            if (this.RowColumnType[i][this.RowNumFieldName] == pRowIndex) {
                                if (this.RowColumnType[i][pFieldName] != 'undefined') {
                                    if (this.RowColumnType[i][pFieldName] == CellType.Protected) {
                                        return false;
                                    }
                                }
                            }
                        }
                    }
                    return true;
                };
                pGrdiView.IsRowProtected = function (pRowIndex) {
                    if (this.RowColumnType) {
                        var colName;
                        for (var i = 0; i < this.RowColumnType.length; i++) {
                            //전체 적용 행이 있으면
                            if (this.RowColumnType[i][this.RowNumFieldName] == -1) {
                                for (var j = 0; j < this.columns.length; j++) {
                                    colName = this.columns[j].name;
                                    if (this.RowColumnType[i][colName] != 'undefined') {
                                        if (this.RowColumnType[i][colName] != CellType.Protected) {
                                            return true;
                                        }
                                    }
                                }
                            } else { //전체 적용 행이 없으면
                                if (this.RowColumnType[i][this.RowNumFieldName] == pRowIndex) {
                                    for (var j = 0; j < this.columns.length; j++) {
                                        colName = this.columns[j].name;
                                        if (this.RowColumnType[i][colName] != 'undefined') {
                                            if (this.RowColumnType[i][colName] != CellType.Protected) {
                                                return true;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                };
                pGrdiView.PerformCallback = function (args) {
                    //그리드 콜백전 그리드 RowcolumType 정보를 같이 담아 보낸다.
                    //if (!_aspxIsExists(args)) {
                    //    args = { RowColumnType: JSON.stringify(this.RowColumnType) };
                    //} else {
                    //    args = JSON.parse(args);
                    //    args.RowColumnType = this.RowColumnType;
                    //    args = JSON.stringify(args);
                    //}

                    //v15.1
                    if (!ASPx.IsExists(args)) {
                        args = { RowColumnType: JSON.stringify(this.RowColumnType) };
                    } else {
                        args = JSON.parse(args);
                        args.RowColumnType = this.RowColumnType;
                        args = JSON.stringify(args);
                    }

                    this.gridCallBack([ASPxClientGridViewCallbackCommand.CustomCallback, args]);
                };
                pGrdiView.ShowError = function (errorText, errorData) {
                    var batchEditHelper = this.GetBatchEditHelper();
                    if (batchEditHelper && batchEditHelper.ShowError(errorText, errorData))
                        return;
                    var displayIn = this;
                    var popupForm = this.GetPopupEditForm();
                    if (popupForm) {
                        displayIn = popupForm;
                        if (!popupForm.IsVisible()) {
                            popupForm.Show();
                        }
                    }
                    var errorRow = this.GetEditingErrorRow(displayIn);
                    if (!errorRow) {
                        var editRow = this.GetEditingRow(displayIn);
                        if (editRow) {
                            errorRow = this.CreateEditingErrorRow();
                            errorRow.id = editRow.id.replace("DXEditingRow", "DXEditingErrorRow");
                            _aspxInsertElementAfter(errorRow, editRow);
                        }
                    }
                    if (errorRow)
                        errorRow.cells[errorRow.cells.length - 1].innerHTML = errorText;
                    // eniGridview Custom Script
                    //else
                    //    alert(errorText);
                };

                pGrdiView.batchEditApi.SetCellValue = function (visibleIndex, column, value, displayText) {
                    var helper = this.GetHelper();
                    var columnIndex = this.GetColumnIndex(column);
                    if (!helper || columnIndex == null)
                        return;
                    if (!helper.IsValidVisibleIndex(visibleIndex))
                        return;
                    if (!_aspxIsExists(displayText))
                        displayText = helper.GetColumnDisplayTextByEditor(value, columnIndex);
                    if (helper.IsCheckColumn(columnIndex))
                        displayText = helper.GetCheckColumnDisplayText(value, columnIndex);
                    if (helper.IsColorEditColumn(columnIndex))
                        displayText = helper.GetColorEditColumnDisplayText(value, columnIndex);
                    helper.SetCellValue(visibleIndex, columnIndex, value, displayText);
                    helper.UpdateSyncInput();
                    helper.UpdateRow(visibleIndex, [columnIndex], helper.IsEditingCell(visibleIndex, columnIndex), false, true);
                };

                var batchHelper = pGrdiView.GetBatchEditHelper();
                if (batchHelper != 'undefined' && batchHelper != null && batchHelper) {
                    batchHelper.AddNewRow = function (pInsertRowCallback) {
                        var visibleIndex = this.CalcNewRowVisibleIndex();
                        var row = this.AddNewRowCore(visibleIndex);

                        //cellIndex

                        //eniGridData.CurrentFocuseRowIndex = -2147483647; if (eni.getLocalPage().eniGridData_ButtonClick) eni.getLocalPage().eniGridData_ButtonClick(eniGridData, { visibleIndex: -2147483647, focusedColumn: eniGridData.GetColumn('BTN_MMM'), rowValues: eniGridData.GetBatchEditHelper().GetRowValues(-2147483647) });

                        this.insertedRowIndices.push(visibleIndex);
                        var columnIndex = this.GetFirstVisibleColumnIndex(this.GetEditColumnIndices());
                        this.IsAddNewRow = true;
                        this.grid.OnInsertRow = pInsertRowCallback;
                        this.StartEdit(visibleIndex, columnIndex);
                        this.CheckEmptyDataRowVisibility();
                    };
                    batchHelper.AddNewRowCore = function (visibleIndex) {
                        if (this.GetDataRow(visibleIndex))
                            return;
                        var etalonRow = this.GetEtalonNewRow();
                        var newRow = etalonRow.cloneNode(true);
                        newRow.id = this.GetDataRowID(visibleIndex);
                        var btnCell = newRow.getElementsByClassName("eniButton");
                        for (var i = 0; i < btnCell.length; i++) {
                            btnCell[i].attributes["visibleIndex"].nodeValue = visibleIndex;
                        }
                        _aspxSetInnerHtml(newRow, newRow.innerHTML.replace(/\<%DXRowIndex%>/g, visibleIndex));
                        var scripts = newRow.getElementsByTagName("SCRIPT");
                        var buttonScript = "";
                        var scriptCount = scripts.length;
                        for (var i = 0; i < scriptCount; i++) {
                            var scriptBlock = scripts[0];
                            buttonScript += _aspxGetScriptCode(scriptBlock);
                            _aspxRemoveElement(scriptBlock);
                        }
                        _aspxSetElementDisplay(newRow, true);
                        var refRow;
                        for (var i = this.insertedRowIndices.length - 1; i >= 0; i--) {
                            refRow = this.GetDataRow(this.insertedRowIndices[i]);
                            if (refRow) break;
                        }
                        if (!refRow)
                            refRow = etalonRow;
                        if (this.IsNewRowOnTop())
                            //ie8에서 InsertBefore로 추가를 하면 테그순서가 이상해진다 
                            refRow.parentNode.insertBefore(newRow, refRow);
                        else
                            _aspxInsertElementAfter(newRow, refRow);

                        this.PrepareCommandButtons(buttonScript, visibleIndex);
                        this.LoadDataRowActiveElements(visibleIndex);
                        this.UpdateLastVisibleDataRow();
                        return newRow;
                    };
                    batchHelper.StartEdit = function (visibleIndex, columnIndex) {
                        if (this.lockEdit) return;
                        if (this.IsSingleEditMode() && this.IsEditingCell(visibleIndex, columnIndex))
                            return;
                        if (!this.IsSingleEditMode() && this.IsEditingRow(visibleIndex) && this.CanEditColumn(columnIndex)) {
                            this.FocusColumnEditor(columnIndex);
                            return;
                        }
                        if (this.IsEditing() && !this.EndEdit())
                            return;
                        //var indices = this.IsSingleEditMode() ? [columnIndex] : this.GetEditColumnIndices();


                        //RowNum은 에디터 안되게
                        var rowNumColIdx = this.grid.GetColumnByField(this.grid.RowNumFieldName).index;
                        if (columnIndex == rowNumColIdx) {
                            columnIndex += 1;
                        }
                        var indices = this.IsSingleEditMode() ? [columnIndex] : this.GetEditColumnIndices();
                        this.StartEditCore(visibleIndex, indices, columnIndex);

                        //if (pInsertRowCallback != 'undefined' && pInsertRowCallback) {
                        //    this.StartEditCore(visibleIndex, this.GetEditColumnIndices(), columnIndex, pInsertRowCallback);
                        //} else {
                        //    var indices = this.IsSingleEditMode() ? [columnIndex] : this.GetEditColumnIndices();
                        //    this.StartEditCore(visibleIndex, indices, columnIndex, pInsertRowCallback);
                        //}
                    };
                    batchHelper.StartEditCore = function (visibleIndex, columnIndices, focusedColumnIndex) {
                        var row = this.GetDataRow(visibleIndex);
                        if (!row || !columnIndices || columnIndices.length == 0)
                            return;
                        columnIndices = this.IntersectColumnIndices(this.GetEditColumnIndices(), columnIndices);
                        if (columnIndices.length == 0)
                            return;

                        if (!_aspxIsExists(focusedColumnIndex) || !this.CanEditColumn(focusedColumnIndex))
                            focusedColumnIndex = this.GetFirstVisibleColumnIndex(columnIndices);

                        //toolbar를 이용할시 행추가할때 시작 이벤트를 발생시키지 않는다.
                        //var startEditArgs = this.grid.RaiseBatchEditStartEditing(visibleIndex, this.GetColumn(focusedColumnIndex+1), this.GetRowValues(visibleIndex));
                        var startEditArgs = new ASPxClientGridViewBatchEditStartEditingEventArgs(visibleIndex, this.GetColumn(focusedColumnIndex), this.GetRowValues(visibleIndex));
                        this.grid.CurrentFocusColumnName = this.grid.GetColumnByField(this.grid.RowNumFieldName).name;

                        //신규행 ROW_NUM 값넣기
                        if (batchHelper.IsNewRow(visibleIndex) &&
                            (startEditArgs.rowValues[this.grid.GetColumnByField(this.grid.RowNumFieldName).index].text == "&nbsp;" &&
                            startEditArgs.rowValues[this.grid.GetColumnByField(this.grid.RowNumFieldName).index].value == null)) {

                            //startEditArgs.rowValues[this.grid.GetColumnByField(this.grid.RowNumFieldName).index].text = "신규"
                            //startEditArgs.rowValues[this.grid.GetColumnByField(this.grid.RowNumFieldName).index].value = visibleIndex;
                            startEditArgs.isRowDelete = false;
                            //this.grid.IsScriptEdit = true
                        }

                        //pInsertRowCallback 존재시 호출
                        if (this.IsAddNewRow && this.grid.OnInsertRow != 'undefined' && this.grid.OnInsertRow) {
                            this.grid.OnInsertRow(this.grid, startEditArgs);
                        }

                        //isRowDelete에 따른 로우 삽입 취소
                        if (startEditArgs.isRowDelete) {
                            this.DeleteRow(visibleIndex);
                            return;
                        }

                        //Standard 모드에서는 AddNewRow 사용시 StartEditing 이벤트를 사용하지 않는다.
                        //2015-03-20 주석처리 했더니 Start이벤트가 아예동작을 하지 않는다.
                        if (!this.grid.BatchEditStartEditing.IsEmpty()) {
                            this.grid.BatchEditStartEditing.FireEvent(this.grid, startEditArgs);
                        }

                        //isRowDelete에 따른 로우 삽입 취소
                        if (startEditArgs.isRowDelete) {
                            this.DeleteRow(visibleIndex);
                            return;
                        }

                        if (!startEditArgs || startEditArgs.cancel || this.GetObjectSize(startEditArgs.rowValues) == 0) {
                            return;
                        }
                        var rowValues = startEditArgs.rowValues;
                        columnIndices = this.IntersectColumnIndices(_aspxGetObjectKeys(rowValues), columnIndices);
                        if (columnIndices.length == 0)
                            return;
                        _aspxClearSelection();
                        //AddNewRow함수를 이용하여 추가했을때
                        if (this.IsAddNewRow) {
                            var colIndices = this.GetEditColumnIndices();
                            for (var colindice in colIndices) {
                                this.MoveEditors(visibleIndex, colindice);
                                this.SetEditorValues(rowValues, colindice);
                                this.UpdateRow(visibleIndex, colindice, true);
                                this.ApplyChanges(visibleIndex, rowValues);
                                this.UpdateRow(visibleIndex, colindice);
                                this.UpdateSyncInput();
                            }
                        }
                        this.MoveEditors(visibleIndex, columnIndices);
                        this.SetEditorValues(rowValues, columnIndices);
                        this.UpdateRow(visibleIndex, columnIndices, true);
                        if (startEditArgs.focusedColumn)
                            this.FocusColumnEditor(startEditArgs.focusedColumn.index);
                        this.editRowVisibleIndex = visibleIndex;
                        this.editedColumnIndices = columnIndices;
                        this.lockEndEditOnLostFocus = true;
                        this.IsAddNewRow = false;
                        window.setTimeout(function () { this.lockEndEditOnLostFocus = false; }.aspxBind(this), 0);
                    };
                    batchHelper.MoveEditors = function (visibleIndex, columnIndices) {
                        var row = this.GetDataRow(visibleIndex);
                        for (var i = 0; i < columnIndices.length; i++) {
                            var columnIndex = columnIndices[i];
                            var editorContainer = this.GetEditorContainer(columnIndex);
                            var textContainer = this.GetCellTextContainer(row, columnIndex);
                            if (!editorContainer || !textContainer)
                                continue;
                            _aspxSetElementDisplay(editorContainer, false);
                            _aspxSetElementDisplay(textContainer, true);
                            var dataCell = textContainer.parentNode;
                            if (editorContainer.parentNode != dataCell)
                                dataCell.appendChild(editorContainer);
                        }
                    };
                    batchHelper.EndEdit = function (skipValidation) {
                        var row = this.GetDataRow(this.editRowVisibleIndex);
                        if (!this.IsEditing() || !row)
                            return true;
                        var rowValues = this.GetRowValues(this.editRowVisibleIndex);
                        this.LoadEditorValues(rowValues, this.editRowVisibleIndex, this.editedColumnIndices);
                        var endEditArgs = this.grid.RaiseBatchEditEndEditing(this.editRowVisibleIndex, rowValues);
                        if (!endEditArgs || endEditArgs.cancel)
                            return false;
                        var validationInfo = null;
                        if (!skipValidation && this.RequireValidateOnEndEdit()) {
                            validationInfo = this.ValidateRow(this.editRowVisibleIndex, endEditArgs.rowValues);
                            if (!validationInfo.isValid && !this.AllowEndEditOnError())
                                return false;
                        }
                        rowValues = this.FilterRowValues(endEditArgs.rowValues, this.editedColumnIndices);
                        this.ApplyChanges(this.editRowVisibleIndex, rowValues);
                        this.UpdateRow(this.editRowVisibleIndex, this.editedColumnIndices);
                        this.ApplyValidationInfo(this.editRowVisibleIndex, validationInfo);
                        this.UpdateSyncInput();
                        this.editRowVisibleIndex = this.InvalidRowVisibleIndex;
                        this.editedColumnIndices = [];
                        this.BlurDefaultEditor(this.focusedEditorColumnIndex);
                        return true;
                    };
                    batchHelper.UpdateRow = function (visibleIndex, columnIndices, showEditors, reset, fromAPI) {
                        var row = this.GetDataRow(visibleIndex);
                        if (!row) return;
                        var cellSizes = showEditors ? this.GetCellSizes(row, columnIndices) : null;
                        for (var i = 0; i < columnIndices.length; i++) {
                            var columnIndex = columnIndices[i];
                            var cellSize = cellSizes ? { width: cellSizes.widths[columnIndex], height: cellSizes.height } : null;
                            this.UpdateCell(visibleIndex, columnIndex, showEditors, reset, cellSize, fromAPI);
                        }
                    };
                    batchHelper.UpdateCell = function (visibleIndex, columnIndex, showEditor, reset, cellSize, fromAPI) {
                        if (reset) showEditor = false;
                        var row = this.GetDataRow(visibleIndex);
                        var dataCell = this.GetDataCell(row, columnIndex);
                        var editorContainer = this.GetEditorContainer(columnIndex);
                        var textContainer = this.GetCellTextContainer(row, columnIndex);
                        if (!dataCell || !editorContainer || !textContainer)
                            return;
                        _aspxSetElementDisplay(textContainer, !showEditor);
                        if (!showEditor)
                            _aspxSetInnerHtml(textContainer, this.GetCellText(visibleIndex, columnIndex));
                        var styleKey = this.GetStyleKey(visibleIndex, columnIndex, showEditor, reset);

                        var isRowNumField = false
                        if (this.grid.RowNumFieldName) {
                            var col = this.grid.GetColumnByField(this.grid.RowNumFieldName);
                            if (col) {
                                isRowNumField = (col.index == columnIndex);
                            }
                        }

                        if (!isRowNumField) this.ChangeCellStyle(visibleIndex, columnIndex, styleKey);

                        if (showEditor && cellSize) {
                            var width = showEditor ? cellSize.width - _aspxGetLeftRightBordersAndPaddingsSummaryValue(dataCell) : "";
                            var height = showEditor ? cellSize.height - _aspxGetTopBottomBordersAndPaddingsSummaryValue(dataCell) : "";
                            _aspxSetStyles(dataCell, { width: width, height: height });
                        }
                        var display = showEditor ? "" : "none";
                        if (showEditor && this.IsCheckColumn(columnIndex))
                            display = "inline-block";
                        if (!fromAPI)
                            _aspxSetStyles(editorContainer, { display: display });
                        if (__aspxFirefox) {
                            var editor = this.GetEditor(columnIndex);
                            var input = editor && editor.GetInputElement();
                            try {
                                if (input)
                                    input.setSelectionRange(0, 0, "backward");
                            } catch (e) { }
                        }
                        if (this.IsHiddenColumn(columnIndex))
                            _aspxSetElementDisplay(dataCell, false);
                        textContainer.dxgvHasError = false;
                    };
                    batchHelper.MoveFocusNext = function () {
                        if (!this.IsEditing()) return this.MoveFocusCore(this.grid.CurrentFocuseRowIndex, this.grid.CurrentFocusColumnIndex);
                        return this.MoveFocusCore(this.editRowVisibleIndex, this.GetFocusedColumnIndex());
                    };
                }

                //커스텀 클릭이벤트 등록
                var newRowClickEvent = function (s, e) {
                    s.CurrentFocuseRowIndex = e.visibleIndex;
                    if (s.orgRowClickEvent) {
                        try {
                            s.orgRowClickEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (pGrdiView.RowClick.handlerInfoList && pGrdiView.RowClick.handlerInfoList.length > 0) {
                    if (pGrdiView.RowClick.handlerInfoList[0].handler == newRowClickEvent) {
                        pGrdiView.RowClick.RemoveHandler(pGrdiView.RowClick.handlerInfoList[0].handler);
                    } else {
                        pGrdiView.orgRowClickEvent = pGrdiView.RowClick.handlerInfoList[0].handler;
                        pGrdiView.RowClick.RemoveHandler(pGrdiView.orgRowClickEvent);
                    }
                }

                pGrdiView.RowClick.AddHandler(newRowClickEvent);

                //커스텀 배치 에디트이벤트 등록
                var newBatchEditStartEditingEvent = function (s, e) {
                    //eni.Log.WriteLog("start");
                    s.CurrentFocuseRowIndex = e.visibleIndex;
                    s.CurrentFocusColumnIndex = e.focusedColumn.index;
                    s.CurrentFocusColumnName = e.focusedColumn.name == "" ? e.focusedColumn.fieldName : e.focusedColumn.name;

                    //RowNum 필드 쓰기 금지
                    if (s.CurrentFocusColumnName == s.RowNumFieldName) {
                        if (s.batchEditHelper.IsNewRow(e.visibleIndex)) {
                            s.batchEditApi.MoveFocusForward();
                            //s.IsScriptEdit = false;
                            return;
                        } else {
                            if (e.rowValues[e.focusedColumn.index].value != "수정" && s.IsScriptEdit == true) {
                                s.IsScriptEdit = false;
                                return;
                            } else {
                                s.batchEditApi.MoveFocusForward();
                                e.cancel = true;
                                return;
                            }
                        }
                    }

                    //Key 필드 쓰기 금지
                    var fields = new String(s.KeyFieldName).split(";");
                    for (var i = 0; i < fields.length; i++) {
                        if (e.focusedColumn.name == fields[i]) {
                            if (e.visibleIndex >= 0) {
                                s.batchEditApi.MoveFocusForward();
                                e.cancel = true;
                                return;
                            }
                        }
                    }

                    if (s.AllowRowCellEdit(s.CurrentFocuseRowIndex, s.CurrentFocusColumnName) == false) {
                        if (s.IsRowProtected(s.CurrentFocuseRowIndex) == false) {
                            s.batchEditApi.MoveFocusForward();
                        }
                        e.cancel = true;
                        return;
                    }

                    if (s.orgBatchEditStartEditingEvent) {
                        try {
                            s.orgBatchEditStartEditingEvent(s, e);
                        } catch (ex) { }
                    }
                };

                if (pGrdiView.BatchEditStartEditing.handlerInfoList && pGrdiView.BatchEditStartEditing.handlerInfoList.length > 0) {
                    if (pGrdiView.BatchEditStartEditing.handlerInfoList[0].handler == newBatchEditStartEditingEvent) {
                        pGrdiView.BatchEditStartEditing.RemoveHandler(pGrdiView.BatchEditStartEditing.handlerInfoList[0].handler);
                    } else {
                        pGrdiView.orgBatchEditStartEditingEvent = pGrdiView.BatchEditStartEditing.handlerInfoList[0].handler;
                        pGrdiView.BatchEditStartEditing.RemoveHandler(pGrdiView.orgBatchEditStartEditingEvent);
                    }
                }

                pGrdiView.BatchEditStartEditing.AddHandler(newBatchEditStartEditingEvent);

                //커스텀 배치 에디트 엔드 이벤트 등록
                var newBatchEditEndEditingEvent = function (s, e) {
                    if (s.CurrentFocusColumnName == s.RowNumFieldName) return;

                    if (s.orgBatchEditEndEditingEvent) {
                        try {
                            s.orgBatchEditEndEditingEvent(s, e);
                            if (e.cancel) return;
                        } catch (ex) { }
                    }

                    var col = s.GetColumnByField(s.CurrentFocusColumnName);
                    var oldValue = new String(s.batchEditApi.GetCellValue(s.CurrentFocuseRowIndex, col.name));
                    var curValue = new String(e.rowValues[col.index].value);
                    //eni.Log.WriteLog("old:" + oldValue)
                    //eni.Log.WriteLog("old type:" + typeof (oldValue))
                    //eni.Log.WriteLog("old parse type:" + typeof (parseInt(oldValue)))
                    //eni.Log.WriteLog("new:" + curValue)
                    //eni.Log.WriteLog("new type:" + typeof (curValue))
                    //eni.Log.WriteLog("new type:" + s.IsScriptEdit)
                    if (String(oldValue) != String(curValue) && !s.batchEditHelper.IsNewRow(s.CurrentFocuseRowIndex)) {
                        if (e.rowValues[s.GetColumnByField(s.RowNumFieldName).index].value != "수정") {
                            s.batchEditApi.SetCellValue(s.CurrentFocuseRowIndex, s.RowNumFieldName, "수정", "수정");
                            s.IsScriptEdit = true;
                        }
                    }
                    //if (s.IsScriptEdit == false) {

                    //    //var bbb = s.batchEditApi.HasChanges(s.CurrentFocuseRowIndex, s.CurrentFocusColumnName)
                    //    if (String(oldValue) != String(curValue)) {
                    //        s.batchEditApi.SetCellValue(s.CurrentFocuseRowIndex, s.RowNumFieldName, s.CurrentFocuseRowIndex, "수정");
                    //    }

                    //} else {
                    //    s.IsScriptEdit = false;
                    //    eni.Log.WriteLog("none")
                    //    return;
                    //}

                    s.CurrentFocusColumnName = new String();
                };

                if (pGrdiView.BatchEditEndEditing.handlerInfoList && pGrdiView.BatchEditEndEditing.handlerInfoList.length > 0) {
                    if (pGrdiView.BatchEditEndEditing.handlerInfoList[0].handler == newBatchEditEndEditingEvent) {
                        pGrdiView.BatchEditEndEditing.RemoveHandler(newBatchEditEndEditingEvent);
                    } else {
                        pGrdiView.orgBatchEditEndEditingEvent = pGrdiView.BatchEditEndEditing.handlerInfoList[0].handler;
                        pGrdiView.BatchEditEndEditing.RemoveHandler(pGrdiView.orgBatchEditEndEditingEvent);
                    }
                }

                pGrdiView.BatchEditEndEditing.AddHandler(newBatchEditEndEditingEvent);

            }
            if (lgGridViewArr && (pGrdiView.CreateMode == CreateMode.StandardMode || pGrdiView.CreateMode == CreateMode.DefaultMode)) {
                //커스텀 비긴 콜백 이벤트 등록
                var newBeginCallbackEvent = function (s, e) {
                    if (s.orgBeginCallbackEvent) {
                        try {
                            s.orgBeginCallbackEvent(s, e);
                        } catch (ex) { }
                    }

                    //if (eni.Loading && eni.Message) {
                    //    if (eni.Loading.IsDisplayLoading() == false) {
                    //        eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("MSGBD00108"));
                    //    } else {
                    //        switch (e.command) {
                    //            case "SORT": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.sort")); break;
                    //            case "APPLYCOLUMNFILTER": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.applycolumnfilter")); break;
                    //            case "APPLYHEADERCOLUMNFILTER": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.applyheadercolumnfilter")); break;
                    //            case "COLLAPSEALL": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.collapseall")); break;
                    //            case "COLUMNMOVE": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.columnmove")); break;
                    //            case "EXPANDALL": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.expandall")); break;
                    //            case "CONTEXTMENU": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.contextmenu")); break;
                    //            case "CUSTOMCALLBACK": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.customcallback")); break;
                    //            case "FUNCTION": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.function")); break;
                    //            case "GROUP": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.group")); break;
                    //            case "PAGERONCLICK": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.pageronclick")); break;
                    //            case "UPDATEEDIT": eni.Loading.DisplayStatusLoading(true, eni.Message.StrBundle("common.gridview.callback.updateedit")); break;
                    //            default: eni.Loading.DisplayStatusLoading(true, "'" + e.command + "'Callback Command가 등록되어있지 않습니다."); break;
                    //        }
                    //    }
                    //}
                };

                if (pGrdiView.BeginCallback.handlerInfoList && pGrdiView.BeginCallback.handlerInfoList.length > 0) {
                    if (pGrdiView.BeginCallback.handlerInfoList[0].handler == newBeginCallbackEvent) {
                        pGrdiView.BeginCallback.RemoveHandler(pGrdiView.BeginCallback.handlerInfoList[0].handler);
                    } else {
                        pGrdiView.orgBeginCallbackEvent = pGrdiView.BeginCallback.handlerInfoList[0].handler;
                        pGrdiView.BeginCallback.RemoveHandler(pGrdiView.orgBeginCallbackEvent);
                    }
                }

                pGrdiView.BeginCallback.AddHandler(newBeginCallbackEvent);

                // 커스텀 엔드 콜백 이벤트 등록
                var newEndCallbackEvent = function (s, e) {
                    if (s.cpRowColumnType) {
                        s.RowColumnType = JSON.parse(s.cpRowColumnType);
                    }

                    if (s.orgEndCallbackEvent) {
                        try {
                            s.orgEndCallbackEvent(s, e);
                        } catch (ex) { }
                    }

                    if (eni.Loading) {
                        if (eni.Loading.IsDisplayLoading()) {
                            eni.Loading.DisplayStatusLoading(false);
                        }
                    }
                }

                if (pGrdiView.EndCallback.handlerInfoList && pGrdiView.EndCallback.handlerInfoList.length > 0) {
                    if (pGrdiView.EndCallback.handlerInfoList[0].handler == newEndCallbackEvent) {
                        pGrdiView.EndCallback.RemoveHandler(pGrdiView.EndCallback.handlerInfoList[0].handler);
                    } else {
                        pGrdiView.orgEndCallbackEvent = pGrdiView.EndCallback.handlerInfoList[0].handler;
                        pGrdiView.EndCallback.RemoveHandler(pGrdiView.orgEndCallbackEvent);
                    }
                }

                pGrdiView.EndCallback.AddHandler(newEndCallbackEvent);

                // 커스텀 콜백 에러 이벤트 등록
                var newCallbackErrorEvent = function (s, e) {
                    if (e.handled == false) {
                        if (eni.Message) {
                            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), e.message);
                        }

                        if (s.orgCallbackErrorEvent) {
                            try {
                                s.orgCallbackErrorEvent(s, e);
                            } catch (ex) { }
                        }
                    }
                }

                if (pGrdiView.CallbackError.handlerInfoList && pGrdiView.CallbackError.handlerInfoList.length > 0) {

                    if (pGrdiView.CallbackError.handlerInfoList[0].handler == newCallbackErrorEvent) {
                        pGrdiView.CallbackError.RemoveHandler(pGrdiView.CallbackError.handlerInfoList[0].handler);
                    } else {
                        pGrdiView.orgCallbackErrorEvent = pGrdiView.CallbackError.handlerInfoList[0].handler;
                        pGrdiView.CallbackError.RemoveHandler(pGrdiView.orgCallbackErrorEvent);
                    }
                }

                pGrdiView.CallbackError.AddHandler(newCallbackErrorEvent);

                lgGridViewArr[lgGridViewArr.length] = pGrdiView;
                if (!lgActiveGridView) {
                    lgActiveGridView = lgGridViewArr[0];
                }
            }

            if (pOrgEvent) {
                pOrgEvent();
            }
        };
    };

    eni.Control = new function () {
        this.GridView = {
            txtRowNum: "ROW_NUM",
            txtUpdateRowNumText: "수정",
            InsertRow: function (pInsertRowCallBack) {
                if (lgActiveGridView) {
                    lgActiveGridView.GetBatchEditHelper().AddNewRow(pInsertRowCallBack);
                }
            },
            SetIndicateText: function (strText) {
                if (lgActiveGridView) {
                    lgActiveGridView.batchEditApi.SetCellValue(lgActiveGridView.CurrentFocuseRowIndex, this.txtRowNum, strText, strText, false);
                }
            },
            SetCellValue: function (pColumnName, pValue, pDisplayText) {
                if (lgActiveGridView) {
                    lgActiveGridView.batchEditApi.SetCellValue(lgActiveGridView.CurrentFocuseRowIndex, pColumnName, pValue, pDisplayText, true);
                }
            }
        };
    };
})();


//ActiveX Spread Sheet Object Class
var ggoSpread = new function () {
    var OLE_GRID_COLOR = 0x00E0E0E0;
    //var OLE_GRID_GRAYAREA_BACKCOLOR = 0x00FFFFFF; //흰색
    var OLE_GRID_GRAYAREA_BACKCOLOR = 0x00F5F5F5; //화이트 스모트
    var OLE_UNLOCK_BACKCOLOR = 0x00FFFFFF;
    var OLE_PROTECTED_BACKCOLOR = 0x00DDDDDD;
    var OLE_REQUIRED_BACKCOLOR = 0x00B4FFFF;
    var OLE_DATACELL_BACKCOLOR = 0x00FFFFFF;
    var OLE_DATACELL_ODDBACKCOLOR = 0x00DFDFDF;
    var OLE_DATACELL_ODDEVENTBACKCOLOR = 0x00F1F1F1;
    var OLE_DATACELL_ODDFORECOLOR = 0x00000000;
    var OLE_DATACELL_ODDEVENTFORECOLOR = 0x00000000;
    var OLE_SHADOW_BACKCOLOR = 0x00E0E0E0;
    var OLE_SHADOW_FORCOLOR = 0x00404040;
    var OLE_HEADER_BORDERCOLOR = 0x00B2B2B2;
    var OLE_DATACELL_BORDERCOLOR = 0x00B2B2B2;
    //var OLE_DATACELL_SHADOW_BORDERCOLOR = 0x00808080;

    var hidRowColName = "hidRow";
    var startDataRow = 0;
    var IsOddMode = false;

    //Spread object
    this.Source = null;
    this._getSource = function () {
        if (this.Source == undefined || typeof this.Source != "object" || !this.Source) {
            if (lgActiveSpread == undefined || typeof lgActiveSpread != "object" || !lgActiveSpread) {
                if (lgSpreadArr.length != 0 && typeof lgSpreadArr[0] != "object") {
                    return lgSpreadArr;
                } else {
                    return null;
                }
            } else {
                return lgActiveSpread;
            }
        } else {
            return this.Source;
        }
    }
    //모든 행을 지웁니다.
    this._clearSource = function () {
        this.Source = null;
    };
    this.Spreadinit = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.BorderStyle = BoarderStyle.None;
            _vspdData.NoBorder = true;
            _vspdData.GridColor = -1;
            _vspdData.GrayAreaBackColor = OLE_GRID_GRAYAREA_BACKCOLOR;
            _vspdData.LockBackColor = -1;

            _vspdData.EditChangeHistory = new Array();

            if (window.eni && window.eni.Message) {
                _vspdData.InsertFlag = eni.Message.StrBundle("MSGBD00006");
                _vspdData.UpdateFlag = eni.Message.StrBundle("MSGBD00007");
                _vspdData.DeleteFlag = eni.Message.StrBundle("MSGBD00008");
            } else {
                _vspdData.InsertFlag = "신규";
                _vspdData.UpdateFlag = "수정";
                _vspdData.DeleteFlag = "삭제";
            }

            _vspdData.ColSep = "\t";
            _vspdData.RowSep = "\r\n";
            _vspdData.OverClip = "";
            //_vspdData.ComboSep = String.fromCharCode(9);

            if (_vspdData.Version == "6.0") {
                _vspdData.ColWidth(0) = 7;
                _vspdData.RowHeight(0) = 13;
            } else if (_vspdData.Version == "7.0") {
                _vspdData.ColWidth(0) = 7;
                _vspdData.RowHeight(0) = 13;
            } else if (_vspdData.Version == "8.0") {
                _vspdData.ColWidth(0) = 700;
                _vspdData.RowHeight(0) = 250;
            }

            if (lgSpreadArr != undefined && lgSpreadArr) {
                lgSpreadArr.push(_vspdData);
            }

            _vspdData.OperationMode = OperationMode.Nomal;
            _vspdData.ClipboardOptions = ClipboardOptions.NoHeaders;
            _vspdData.EditEnterAction = EditEnterAction.None;
            _vspdData.UserResizeCol = UserResizeCol.Default;
            _vspdData.UserResizeRow = UserResizeRow.Default;
            _vspdData.UserResize = UserResize.None;
            _vspdData.UserColAction = UserColAction.Default;
            _vspdData.AllowRowMove = false;
            _vspdData.AllowColMove = false;
            _vspdData.ProcessTab = true;
            _vspdData.MoveActiveOnFocus = true;

            var ckUniCode = "0";
            if (eni && eni.Cookie) {
                if (eni.Cookie.GetCookie("ckUniCode") == "1") {
                    ckUniCode = "1";
                }
            }

            _vspdData.EditModePermanent = false; //true 포커스시 에디터 모드 집입

            if (window.lgLang && lgLang == "KO" && ckUniCode != "1") {
                _vspdData.FontName = "새굴림";//"새굴림", "Segoe UI";
                _vspdData.FontSize = 9;

                _vspdData.EditModeReplace = true; //입력된 데이터 자동 지우기
            } else { //if (window.lgLang && (lgLang == "EN" || lgLang == "CN" || lgLang == "JP")) {
                _vspdData.FontName = "Dotum";
                _vspdData.FontSize = 9;
                //MS 기본 폰트 ms-song, ms-hei, simsun, simhei

                _vspdData.EditModeReplace = false; //입력된 데이터 자동 지우기
            }

            _vspdData.TypeTextShadow = true;
            _vspdData.TypeTextShadowIn = false;

            _vspdData.ShadowColor = OLE_SHADOW_BACKCOLOR;
            _vspdData.ShadowText = OLE_SHADOW_FORCOLOR;

            this.SpreadHeaderBorderColor();
            this.SpreadDataCellBorderColor();

            lgActiveSpread = _vspdData;
            //_vspdData.ColUserSortIndicator(1) = 0
        }
    };
    this.MakeSheet = function (iSheetCount) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.SheetCount = 3;
            _vspdData.Sheet = 1;
        }
    };
    this.ActiveSheet = function (iIndex) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.Sheet = iIndex;
        }
    };
    this.SetSheet = function (iIndex, strSheetName) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.Sheet = iIndex;
            _vspdData.SheetName = strSheetName;
            this.Spreadinit();
        }
    };

    this.SetHiddenRowColName = function (strColName) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.Col = _vspdData.MaxCols;
            _vspdData.Row = 0;
            if (_vspdData.Text == _vspdData.HiddenRowColName) {
                _vspdData.Text = strColName;
                _vspdData.HiddenRowColName = strColName
            }
        }
    };

    this.GetHiddenRowColPos = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            for (var i = 1; i <= _vspdData.MaxCols; i++) {
                _vspdData.Row = 0;
                _vspdData.Col = i;

                if (_vspdData.Text == _vspdData.HiddenRowColName) {
                    return i;
                }
            }
        }

        return -1;
    };
    this.IsHiddenRowCol = function (iCol) {
        var _vspdData = this._getSource();

        if (_vspdData && iCol) {
            var org_col = _vspdData.Col;
            var org_row = _vspdData.Row;

            _vspdData.Row = 0;
            _vspdData.Col = iCol;

            if (_vspdData.Text == _vspdData.HiddenRowColName) {
                _vspdData.Col = org_col;
                _vspdData.Row = org_row;
                return true;
            }

            _vspdData.Col = org_col;
            _vspdData.Row = org_row;
        }

        return false;
    };
    this.SetHeaderRow = function (iRows) {
        var _vspdData = this._getSource();

        if (_vspdData && iRows) {
            startDataRow = iRows - 1;
            _vspdData.ColHeaderRows = iRows;
            this.AddCellSpan(0, 0, 1, iRows);
        }
    };
    this.SetHeaderHigth = function (iHeight) {
        var _vspdData = this._getSource();

        if (_vspdData && typeof iHeight == "number") {
            _vspdData.RowHeight(0) = iHeight;
        }

    };
    
    this.SetOperationMode = function (pOperationMode) {
        var _vspdData = this._getSource();

        if (_vspdData && typeof pOperationMode == "number") {
            _vspdData.OperationMode = pOperationMode;
        }
    };
    this.GetOperationMode = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.OperationMode;
        }
    };
    this.AddCellSpan = function (iCol, iRow, iColSpan, iRowSpan) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.AddCellSpan(iCol, iRow, iColSpan, iRowSpan);
        }
    };
    //그리드의 모든 행을 초기화 합니다.
    this.ClearSpreadData = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows > 0) {
                _vspdData.MaxRows = 0;
                _vspdData.object.ClearRange(-1, -1, 0, 0, true);
                _vspdData.ChangeMade = false;
                _vspdData.OverClip = "";
            }
        }
    };

    //변경된 내용이 있는지 검사합니다.
    this.CheckChange = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            //if (_vspdData.ChangeMade) {
            //    return _vspdData.ChangeMade;
            //} else {
            //    _vspdData.Col = 0;
            //    for (var i = 1; i <= _vspdData.MaxRows; i++) {
            //        _vspdData.Row = i;
            //        if (_vspdData.Text == _vspdData.InsertFlag || _vspdData.Text == _vspdData.DeleteFlag || _vspdData.Text == _vspdData.UpdateFlag) {
            //            return true;
            //        }
            //    }
            //}

            _vspdData.Col = 0;
            for (var i = 1; i <= _vspdData.MaxRows; i++) {
                _vspdData.Row = i;
                if (_vspdData.Text == _vspdData.InsertFlag || _vspdData.Text == _vspdData.DeleteFlag || _vspdData.Text == _vspdData.UpdateFlag) {
                    return true;
                }
            }
        }

        return false;
    };
    this.VisibleRowCount = function (pStartRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (pStartRow < 0) {
                return;
            }

            if (pStartRow == 0) {
                return 50;
            }

            var j = 0;
            var retVar = 0;
            startCol = 1;

            //for(var i = 1; i <= _vspdData.MaxCols; i++){
            //    _vspdData.Col = i;
            //    _vspdData.Row = pStartRow;
            //    if (_vspdData.ColHidden != true){
            //        startCol = i;
            //        break;
            //    }
            //}

            //Left to Right
            for (var i = startCol; i <= _vspdData.MaxCols; i++) {
                _vspdData.Col = i;
                _vspdData.Row = pStartRow;
                if (_vspdData.ColHidden != true && _vspdData.IsVisible(i, pStartRow, true) == true) {
                    startCol = i;
                    break;
                }
            }

            //Top to Bottom
            if (_vspdData.IsVisible(startCol, pStartRow, true) == false) {
                for (var i = pStartRow; i <= _vspdData.MaxRows; i++) {
                    if (_vspdData.IsVisible(startCol, i, true) == true) {
                        pStartRow = i;
                        break;
                    }
                }
            }

            for (var i = pStartRow; i <= _vspdData.MaxRows; i++) {
                if (_vspdData.IsVisible(startCol, i, true) == false) {
                    j = i;
                    break;
                }
                j = i;
            }

            //Count visible row
            return j - pStartRow + 1;
        }
    };

    this.CheckValidation = function () {

    };
    this.IsLock = function (iCol1, iRow1) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (iCol1) {
                _vspdData.Col = iCol1;
            }

            if (iRow1) {
                _vspdData.Row = iRow1;
            }

            return _vspdData.Lock;
        } else {
            return false;
        }
    }
    this.IsRequired = function (iCol1, iRow1) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (iCol1) {
                _vspdData.Col = iCol1;
            }
            if (iRow1) {
                _vspdData.Row = iRow1;
            }
            if (_vspdData.BackColor == OLE_REQUIRED_BACKCOLOR) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    };

    this.IsNewRow = function (iRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.Col = 0;
            if (iRow) {
                _vspdData.Row = iRow;
            }
            if (_vspdData.Text == _vspdData.InsertFlag) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    };
    this.ClearDataChangeFlag = function (pRow1, pRow2) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows <= 0) return;

            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            if (pRow1 || pRow2) {
                if (pRow1 && pRow2) {
                    _vspdData.BlockMode = true;
                    _vspdData.Col = 0;
                    _vspdData.Row = pRow1;
                    _vspdData.Col2 = 0;
                    _vspdData.Row2 = pRow2;
                    _vspdData.Text = "";
                    _vspdData.BlockMode = false;
                } else {
                    _vspdData.Col = 0;
                    _vspdData.Row = pRow1;
                    _vspdData.Text = "";
                }
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };
    /*
        변경내용을 취소 합니다.
        변경내용을 취소하는부분은 일딴 클립보드데이터로 데이터를 넣을때 문자열을 모두 변수에 저장하여 넣어두고
        취소함수를 호출할대 HID ROW 행의 원본 로우를 찾아 복구한다.
        이전 복구 로직은 삭제를 해야할것이다.
        삭제함으로인해서 EditChangeHistory 다른 함수에서 쓰이는 곳을 찾아 삭제해야주어야한다.
    */
    this.EditUndo = function (pRow1, pRow2) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows <= 0) return;

            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            var hid_col_pos = this.GetHiddenRowColPos();

            var undoRow = function (pRow) {
                var arrIndexList = new Array();
                var hid_row_text = -1;

                _vspdData.Row = 0;
                _vspdData.Col = _vspdData.MaxCols;
                if (_vspdData.Text != _vspdData.HiddenRowColName) {
                    _vspdData.Col = hid_col_pos;
                }

                _vspdData.Row = pRow;
                hid_row_text = _vspdData.Text;

                //아래는 클립보드 데이터를 이용한 롤백
                var strData = String(_vspdData.OverClip);
                var arrRowData = strData.split(_vspdData.RowSep);
                for (var i = 0; i < arrRowData.length; i++) {
                    var arrColData = arrRowData[i].split(_vspdData.ColSep);
                    if (arrColData[hid_col_pos - 1] == hid_row_text) {
                        for (var j = 1; j < _vspdData.MaxCols; j++) {
                            _vspdData.Row = pRow;
                            _vspdData.Col = j;
                            _vspdData.Text = arrColData[j - 1];
                        }
                        break;
                    }
                }

                //아래는 이전버전 롤백
                var arrFilterList = _vspdData.EditChangeHistory.filter(function (object, index, array) {
                    var isFilter = (object.HidRow == hid_row_text);
                    if (isFilter) {
                        arrIndexList.push(index);

                        _vspdData.Col = object.Col;
                        _vspdData.Text = object.Text;
                        _vspdData.Value = object.Value;

                        _vspdData.Col = 0;
                        _vspdData.Text = "";
                        _vspdData.Value = "";
                    }
                    return isFilter;
                });

                arrIndexList.reverse();
                arrIndexList.forEach(function (object, index, array) {
                    _vspdData.EditChangeHistory = _vspdData.EditChangeHistory.remove(object);
                });
            };

            var undoOperation = function (pOperationRow) {
                _vspdData.Row = 0;
                _vspdData.Col = _vspdData.MaxCols;
                if (_vspdData.Text != _vspdData.HiddenRowColName) {
                    return;
                }

                var header_row_text = null;
                _vspdData.Col = 0;
                _vspdData.Row = pOperationRow;
                header_row_text = _vspdData.Text;
                _vspdData.Col = _vspdData.MaxCols;
                var hidRow = _vspdData.Text;

                if (header_row_text == _vspdData.UpdateFlag || header_row_text == _vspdData.DeleteFlag) {
                    undoRow(pOperationRow);

                    _vspdData.Col = 0;
                    if (header_row_text == _vspdData.UpdateFlag || header_row_text == _vspdData.DeleteFlag) {
                        _vspdData.Row = pOperationRow;
                        _vspdData.Text = "";
                        _vspdData.Value = "";
                    }
                } else if (header_row_text == _vspdData.InsertFlag) {
                    if (hidRow == "") {
                        _vspdData.DeleteRows(pOperationRow, 1);
                        _vspdData.MaxRows = _vspdData.MaxRows - 1;
                    } else {
                        _vspdData.Col = 0;
                        _vspdData.Row = pOperationRow;
                        _vspdData.Text = "";
                        _vspdData.Value = "";
                    }
                }

                _vspdData.ChangeMade = true;
            };

            if (pRow1 != undefined && pRow2 != undefined) {
                if (pRow1 != 0 && pRow2 != 0 && pRow1 < pRow2) {
                    for (var i = pRow2; i >= pRow1; i--) {
                        undoOperation(i);
                    }
                } else {
                    undoOperation(pRow1);
                }
            } else if (pRow1 != undefined) {
                if (pRow1 != 0) {
                    undoOperation(pRow1);
                }
            } else {
                if (_vspdData.IsBlockSelected) {
                    for (var i = _vspdData.SelBlockRow2; i >= _vspdData.SelBlockRow; i--) {
                        undoOperation(i);
                    }
                } else {
                    if (_vspdData.ActiveRow > 0) {
                        undoOperation(_vspdData.ActiveRow);
                    }
                }
            }

            if (_vspdData.EditChangeHistory == undefined || _vspdData.EditChangeHistory.length == 0) {
                _vspdData.ChangeMade = false;
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };
    this.GetActiveCol = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.ActiveCol;
        }
    };
    this.GetActiveRow = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.ActiveRow;
        }
    };
    this.SetActiveRow = function (pActiveRowIndex) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.ActiveRow = pActiveRowIndex;
        }
    };

    this.ActiveFirstFocus = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            this.Focus();
            _vspdData.object.SetActiveCell(1, 1);
        }

    };
    this.Focus = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.focus();
        }
    };

    this.GetSelectedRowsCount = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.IsBlockSelected) {
                return _vspdData.SelBlockRow2 - _vspdData.SelBlockRow + 1;
            } else {
                return 1;
            }
        }
    };
    this.GetSelectedColsCount = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.IsBlockSelected) {
                return _vspdData.SelBlockCol2 - _vspdData.SelBlockCol + 1;
            } else {
                return 1;
            }
        }
    };

    this.GetSelectedFirstRow = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.SelBlockRow;
        }
    };
    this.GetSelectedFirstCol = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.SelBlockCol;
        }
    };

    this.GetSelectedLastRow = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.IsBlockSelected) {
                return _vspdData.SelBlockRow2;
            } else {
                return _vspdData.SelBlockRow;
            }
        }
    };
    this.GetSelectedLastCol = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.IsBlockSelected) {
                return _vspdData.SelBlockCol2;
            } else {
                return _vspdData.SelBlockCol;
            }
        }
    };
    this.GetRowCounts = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.MaxRows;
        } else {
            return 0;
        }
    };
    this.GetColCounts = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.MaxCols;
        } else {
            return 0;
        }
    };

    //특정 행,열의 문자를 가져옵니다.
    this.GetText = function (pCol, pRow, pIsValiDation) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows > 0) {
                _vspdData.Col = pCol;
                _vspdData.Row = pRow;
                if (_vspdData.CellType != CellType.Currency) {
                    if (pIsValiDation && String(_vspdData.Text).trim() == "" && String(_vspdData.Value).trim() == "" && _vspdData.BackColor == OLE_REQUIRED_BACKCOLOR) {
                        _vspdData.Row = 0;
                        if (String(_vspdData.Text).trim() == "") {
                            throw new ExceptionManager(-1, eni.Message.StrBundle("MSGBD00118"));
                        } else {
                            throw new ExceptionManager(-1, _vspdData.Text + eni.Message.StrBundle("MSGBD00120"));
                        }
                    } else {
                        return _vspdData.Text;
                    }
                } else {
                    if (pIsValiDation && Number(_vspdData.Text) == 0 && Number(_vspdData.Value) == 0 && _vspdData.BackColor == OLE_REQUIRED_BACKCOLOR) {
                        _vspdData.Row = 0;
                        if (String(_vspdData.Text).trim() == "") {
                            throw new ExceptionManager(-1, eni.Message.StrBundle("MSGBD00118"));
                        } else {
                            throw new ExceptionManager(-1, _vspdData.Text + eni.Message.StrBundle("MSGBD00120"));
                        }
                    } else {
                        return _vspdData.Text;
                    }
                }
            } else {
                return "";
            }
        } else {
            return null;
        }
    };
    this.SetText = function (pCol, pRow, pText) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows > 0) {
                _vspdData.Col = 0;
                _vspdData.Row = pRow;
                if (_vspdData.Text != _vspdData.InsertFlag) {
                    var add_list = true;
                    if (_vspdData.EditChangeHistory) {
                        _vspdData.EditChangeHistory.forEach(function (pCurrentObject, pIndex, pEditChangeHistory) {
                            if (pCurrentObject.Row == pRow && pCurrentObject.Col == pCol) {
                                add_list = false;
                            }
                        });
                    }

                    if (add_list) {
                        _vspdData.Col = _vspdData.MaxCols;
                        var hid_row = _vspdData.Text;

                        _vspdData.Col = pCol;
                        var add_object = { Row: pRow, HidRow: hid_row, Col: pCol, Text: _vspdData.Text, Value: _vspdData.Value };
                        _vspdData.EditChangeHistory.push(add_object);
                    }
                }
                _vspdData.Col = pCol;
                _vspdData.Row = pRow;
                _vspdData.Text = (pText == null || pText == undefined ? "" : pText);
            }
        }
    };
    //특정 행,열의 값을 가져옵니다.
    this.GetValue = function (pCol, pRow, pIsValiDation) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows > 0) {
                _vspdData.Col = pCol;
                _vspdData.Row = pRow;

                if (_vspdData.CellType != CellType.Currency) {
                    if (pIsValiDation && String(_vspdData.Text).trim() == "" && String(_vspdData.Value).trim() == "" && _vspdData.BackColor == OLE_REQUIRED_BACKCOLOR) {
                        _vspdData.Row = 0;
                        if (String(_vspdData.Text).trim() == "") {
                            throw new ExceptionManager(-1, eni.Message.StrBundle("MSGBD00118"));
                        } else {
                            throw new ExceptionManager(-1, _vspdData.Text + eni.Message.StrBundle("MSGBD00120"));
                        }
                    } else {
                        return _vspdData.Value;
                    }
                } else {
                    if (pIsValiDation && Number(_vspdData.Text) == 0 && Number(_vspdData.Value) == 0 && _vspdData.BackColor == OLE_REQUIRED_BACKCOLOR) {
                        _vspdData.Row = 0;
                        if (String(_vspdData.Text).trim() == "") {
                            throw new ExceptionManager(-1, eni.Message.StrBundle("MSGBD00118"));
                        } else {
                            throw new ExceptionManager(-1, _vspdData.Text + eni.Message.StrBundle("MSGBD00120"));
                        }
                    } else {
                        return _vspdData.Value;
                    }
                }
            } else {
                return "";
            }
        } else {
            return null;
        }
    };

    this.SetValue = function (pCol, pRow, pValue) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows > 0) {
                _vspdData.Col = pCol;
                _vspdData.Row = pRow;
                _vspdData.Value = pValue;
            }
        }
    };

    //행을 추가합니다.
    this.InsertRows = function (pIRows, pNumRow, pIsNewRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.focus();

            var activeRow = 0;
            var _numRow = ((pNumRow != undefined) ? pNumRow : _vspdData.ActiveRow) + 1;
            var _inertRows = (pIRows != undefined) ? pIRows : 1;
            _vspdData.MaxRows = _vspdData.MaxRows + _inertRows;
            _vspdData.object.InsertRows(_numRow, _inertRows);
            if (pIsNewRow == undefined || pIsNewRow == true) {
                var _rowIdx = _numRow + _inertRows;
                for (var i = _numRow; i < _rowIdx; i++) {
                    this.SetRowHeaderText(i, _vspdData.InsertFlag);
                    _vspdData.object.SetSelection(_vspdData.ActiveCol, i, _vspdData.ActiveCol, i);
                    _vspdData.object.SetActiveCell(_vspdData.ActiveCol, i);
                }
                activeRow = _vspdData.ActiveRow;
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }

            if (_vspdData.ChangeMade == false) {
                _vspdData.ChangeMade = true;
            }

            return activeRow;
        }
    };

    this.DeleteRows = function (pDRows, pNumRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.focus();

            if (_vspdData.IsBlockSelected) {
                var start_row = _vspdData.SelBlockRow2;
                var end_row = _vspdData.SelBlockRow;
                for (var i = start_row; i >= end_row; i--) {
                    _vspdData.Col = 0;
                    _vspdData.Row = i;
                    if (_vspdData.Text == _vspdData.InsertFlag) {
                        _vspdData.DeleteRows(i, 1);
                        _vspdData.MaxRows = _vspdData.MaxRows - 1;
                    } else {
                        this.SetRowHeaderText(i, _vspdData.DeleteFlag);
                    }
                }
            } else {
                var _numRow = (pNumRow != undefined) ? pNumRow : _vspdData.ActiveRow;
                var _deleteRows = (pDRows != undefined) ? pDRows : 1;
                var _rowIdx = _numRow + _deleteRows;
                for (var i = _numRow; i < _rowIdx; i++) {
                    _vspdData.Col = 0;
                    _vspdData.Row = i;
                    if (_vspdData.Text == _vspdData.InsertFlag) {
                        _vspdData.DeleteRows(i, 1);
                        _vspdData.MaxRows = _vspdData.MaxRows - 1;
                    } else {
                        this.SetRowHeaderText(i, _vspdData.DeleteFlag);
                    }
                }
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }

            if (_vspdData.ChangeMade == false) {
                _vspdData.ChangeMade = true;
            }
        }
    };

    //컬럼 명으로 컬럼 인덱스를 찾습니다.
    this.GetColHeaderIndexByText = function (pStrText) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxCols > 0) {
                _vspdData.Row = 0;
                for (var i = 1; i <= _vspdData.MaxCols + 1; i++) {
                    _vspdData.Col = i;
                    if (String(_vspdData.Text).toUpperCase() == String(pStrText).toUpperCase()) {
                        return i;
                    }
                }
                return -1;
            }
        }
    };

    //컬럼 인덱스로 컬럼 명을 찾습니다.
    this.GetColHeaderTextByIndex = function (pCol) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxCols > 0 && pCol > 0) {
                _vspdData.Row = 0;
                _vspdData.Col = pCol;
                return _vspdData.Text;
            }
        }
    };

    this.SetColsFrozen = function (pColIdx) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxCols > 0 && pColIdx > 0) {
                vspdData.ColsFrozen = pColIdx;
            }
        }
    };

    this.SetColVisible = function (iCol1, pIsHidden, pCellKind) {
        var _vspdData = this._getSource();

        if (_vspdData && typeof iCol1 == "number") {
            _vspdData.Col = iCol1;
            _vspdData.ColHidden = pIsHidden;
            if (pIsHidden) {
                this.SpreadLock(iCol1);
            } else {
                switch (pCellKind) {
                    case CellKind.Required: this.SpreadRequired(iCol1); break;
                    case CellKind.Protected: this.SpreadLock(iCol1); break;
                    case CellKind.Default: default: this.SpreadUnLock(iCol1); break;
                }
            }
        }
    };
    //Column 해더를 지정합니다.
    this.SetColHeaderText = function (pCol, pRow, pStrText) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (pCol != undefined && _vspdData.MaxCols > 0) {
                if (pRow != null && pRow != undefined && typeof pRow == "number") {
                    _vspdData.Row = pRow;
                } else {
                    _vspdData.Row = 0;
                }
                _vspdData.Col = pCol;
                if (_vspdData.Text == pStrText) {
                    return;
                }

                var _chgReDraw = false;
                if (_vspdData.ReDraw) {
                    this.ReDraw(false);
                    _chgReDraw = true;
                }

                if (pRow != null && pRow != undefined && typeof pRow == "number") {
                    _vspdData.Row = pRow;
                } else {
                    _vspdData.Row = 0;
                }
                _vspdData.Col = pCol;
                _vspdData.Text = pStrText;

                if (_chgReDraw) {
                    this.ReDraw(true);
                }
            }
        }
    };
    this.GetColHeaderText = function (pCol, pRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (pCol != undefined && _vspdData.MaxCols > 0) {
                if (pRow != null && pRow != undefined && typeof pRow == "number") {
                    _vspdData.Row = pRow;
                } else {
                    _vspdData.Row = 0;
                }
                _vspdData.Col = pCol;
                if (pRow != null && pRow != undefined && typeof pRow == "number") {
                    _vspdData.Row = pRow;
                } else {
                    _vspdData.Row = 0;
                }
                return _vspdData.Text;
            }
        }
    };

    //Row 해더를 지정합니다.
    this.SetRowHeaderText = function (pRow, pStrText) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (pRow != undefined && _vspdData.MaxRows > 0) {
                _vspdData.Row = pRow;
                _vspdData.Col = 0;
                if (_vspdData.Text == pStrText) {
                    return;
                }

                var _chgReDraw = false;
                if (_vspdData.ReDraw) {
                    this.ReDraw(false);
                    _chgReDraw = true;
                }

                _vspdData.Row = pRow;
                _vspdData.Col = 0;
                _vspdData.Text = pStrText;

                //_vspdData.Col = _vspdData.MaxCols;
                //_vspdData.Text = pStrText;

                if (_chgReDraw) {
                    this.ReDraw(true);
                }
            }
        }
    };

    //전체 행에 RowSep, ColSep 구분자로 구분된 문자열을 그리드에 바인딩 시킵니다.
    this.ShowDataFromStr = function (pDataStr) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (pDataStr) {
                var _lastIdx = String(pDataStr).lastIndexOf(_vspdData.RowSep);
                var _strLen = String(pDataStr).length;
                if (_lastIdx == (_strLen - String(_vspdData.RowSep).length)) {
                    pDataStr = String(pDataStr).substring(0, _lastIdx);
                }

                var _rowCnt = String(pDataStr).split(_vspdData.RowSep).length;
                if (_rowCnt > 0) {
                    var _chgReDraw = false;
                    if (_vspdData.ReDraw) {
                        this.ReDraw(false);
                        _chgReDraw = true;
                    }

                    _vspdData.focus();

                    var beforInsertRowIndex = _vspdData.MaxRows;
                    this.InsertRows(_rowCnt, _vspdData.MaxRows, false);

                    _vspdData.Col = 1;
                    _vspdData.Col2 = _vspdData.MaxCols;
                    _vspdData.Row = beforInsertRowIndex + 1;
                    _vspdData.Row2 = _vspdData.MaxRows;
                    _vspdData.OverClip += pDataStr;
                    _vspdData.Clip = pDataStr;
                    //_vspdData.ClipValue = pDataStr;

                    //if (_vspdData.MaxCols > 0  && _vspdData.MaxRows > 0) {
                    //    _vspdData.object.SetActiveCell(1, 1);
                    //}

                    //_vspdData.object.SetCellBorder(1, 1, _vspdData.MaxCols, _vspdData.MaxRows, CellBorderPosition.CellOutLine, OLE_GRID_COLOR, CellBorderStyle.CellSolid);

                    if (_chgReDraw) {
                        this.ReDraw(true);
                    }

                    if (_vspdData.ChangeMade == true) {
                        _vspdData.ChangeMade = false;
                    }
                }
            }
        }
    };

    this.UpdateRow = function (pRow1, pRow2) {
        var _vspdData = this._getSource();

        if (_vspdData && pRow1) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            if (pRow2) {
                //블럭모드로 설정
                //_vspdData.BlockMode = true;
                //_vspdData.Col = 0;
                //_vspdData.Col2 = 0;
                //_vspdData.Row = pRow1;
                //_vspdData.Row2 = pRow2;
                //_vspdData.Text = _vspdData.UpdateFlag;
                //_vspdData.BlockMode = false;

                //인서트 및 델리트는 제외해야하기때문에
                _vspdData.Col = 0;
                for (var i = pRow1; i <= pRow2; i++) {
                    _vspdData.Row = i;
                    if (_vspdData.Text != _vspdData.InsertFlag && _vspdData.Text != _vspdData.DeleteFlag) {
                        _vspdData.Text = _vspdData.UpdateFlag;
                    }
                }
            } else {
                _vspdData.Col = 0;
                _vspdData.Row = pRow1;
                if (_vspdData.Text != _vspdData.InsertFlag && _vspdData.Text != _vspdData.DeleteFlag) {
                    _vspdData.BlockMode = false;
                    _vspdData.Text = _vspdData.UpdateFlag;
                }
            }

            _vspdData.ChangeMade = true;

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.MakeColumns = function (pColSize) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }
            _vspdData.Col = 0;
            _vspdData.Row = -1;
            _vspdData.Lock = true;
            _vspdData.HiddenRowColName = hidRowColName;

            _vspdData.MaxCols = pColSize + 1;

            for (var i = 0; i <= pColSize; i++) {
                _vspdData.Row = 0;
                _vspdData.Col = i;
                _vspdData.Text = " ";
            }
            this.SpreadUnLock(-1, -1);

            this.SSSetEdit(pColSize + 1, hidRowColName, 10, HAlign.Center, 10, CellKind.Protected, true);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };
    this.GetMaxCols = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.MaxCols;
        }
    };
    this.SetMaxCols = function (iMaxCols) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.MaxCols = iMaxCols;
        }
    };
    this.GetMaxRows = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            return _vspdData.MaxRows;
        }
    };
    this.SetMaxRows = function (iMaxRows) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.MaxRows = iMaxRows;
        }
    };
    this.SetUserColAction = function (pColAction) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.UserColAction = pColAction;
        }
    };

    this.GetChangeData = function (iCol, iRow) {
        var org_data = null;
        if (pSpreadObj.EditChangeHistory) {
            pSpreadObj.EditChangeHistory.forEach(function (pCurrentObject, pIndex, pEditChangeHistory) {
                if (pCurrentObject.HidRow == pRow && pCurrentObject.Col == pCol) {
                    org_data = pCurrentObject;
                }
            });
        }

        return org_data;
    };
    this.RemoveChangeDataObj = function (oRemoveDataObj) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.EditChangeHistory = _vspdData.EditChangeHistory.remove(oRemoveDataObj);
        }
    };

    this.RemoveChangeData = function (iCol, iHidRow) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var arrFilterList = _vspdData.EditChangeHistory.filter(function (object, index, array) {
                var isFilter = (object.HidRow == iHidRow);
                if (isFilter) {
                    arrIndexList.push(index);
                }
                return isFilter;
            });

            arrIndexList.reverse();
            arrIndexList.forEach(function (object, index, array) {
                _vspdData.EditChangeHistory = _vspdData.EditChangeHistory.remove(object);
            });
        }
    };

    this.ReDraw = function (pIsReDraw) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.ReDraw = pIsReDraw;
        }
    };

    this.SpreadLockWithOddEvenRow = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            IsOddMode = true;

            this.SpreadLock(-1, -1);
            this.SpreadCellBackColor(-1, -1, 0, 0, -1, BackColorStyle.OverGrid);
            _vspdData.object.SetOddEvenRowColor(OLE_DATACELL_ODDBACKCOLOR, OLE_DATACELL_ODDFORECOLOR, OLE_DATACELL_ODDEVENTBACKCOLOR, OLE_DATACELL_ODDEVENTFORECOLOR);
            //_vspdData.object.SetCellBorder(-1, -1, 0, 0, CellBorderPosition.CellAll, OLE_DATACELL_BORDERCOLOR, CellBorderStyle.CellSolid);
            this.SpreadCellBorderColor(-1, -1, 0, 0, OLE_DATACELL_BORDERCOLOR, CellBorderPosition.CellAll, CellBorderStyle.CellSolid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadLock = function (pCol1, pRow1, pCol2, pRow2) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.BlockMode = true;
            _vspdData.Col = (pCol1 ? pCol1 : -1);
            if (pCol2 && pCol2 > 0 && pCol2 > pCol1) {
                _vspdData.Col2 = pCol2;
            } else {
                _vspdData.Col2 = _vspdData.Col;
            }
            _vspdData.Row = (pRow1 ? pRow1 : -1);
            if (pRow2 && pRow2 > 0 && pRow2 > pCol1) {
                _vspdData.Row2 = pRow2;
            } else {
                _vspdData.Row2 = _vspdData.Row;
            }
            _vspdData.Lock = true;
            _vspdData.BlockMode = false;

            this.SpreadLockColor(pCol1, pRow1, pCol2, pRow2);

            //if ((pCol1 != pCol2 || pRow1 != pRow2) && (pCol2 && pRow2)) {
            //    for (var i = 0; i <= _vspdData.MaxRows + 1; i++) {
            //        for (var j = 0; j <= _vspdData.MaxCols + 1; j++) {
            //            if (i >= pRow1 && i <= pRow2 && j >= pCol1 && j <= pCol2) {
            //                _vspdData.Row = i;
            //                _vspdData.Col = j;

            //                _vspdData.Lock = true;

            //                if (_vspdData.CellType == CellType.Button) {
            //                    _vspdData.TypeButtonColor = OLE_SHADOW_BACKCOLOR;
            //                    //_vspdData.TypeButtonBorderColor = OLE_HEADER_BORDERCOLOR;
            //                    //_vspdData.TypeButtonLightColor = OLE_HEADER_BORDERCOLOR;
            //                    _vspdData.TypeButtonDarkColor = OLE_SHADOW_BACKCOLOR;
            //                    //_vspdData.TypeButtonShadowSize = 0;
            //                }
            //            }
            //        }
            //    }

            //    this.SpreadLockColor(pCol1, pRow1, pCol2, pRow2);
            //} else {
            //    _vspdData.Lock = true;

            //    if (_vspdData.CellType == CellType.Button) {
            //        _vspdData.TypeButtonColor = OLE_SHADOW_BACKCOLOR;
            //        //_vspdData.TypeButtonBorderColor = OLE_HEADER_BORDERCOLOR;
            //        //_vspdData.TypeButtonLightColor = OLE_HEADER_BORDERCOLOR;
            //        _vspdData.TypeButtonDarkColor = OLE_SHADOW_BACKCOLOR;
            //        //_vspdData.TypeButtonShadowSize = 0;
            //    } else {
            //        //if (IsOddMode == false) 
            //        this.SpreadLockColor(pCol1, pRow1, pCol1, pRow1);
            //    }
            //}

            //_vspdData.Col = orgCol1;
            //_vspdData.Col2 = orgCol2;
            //_vspdData.Row = orgRow1;
            //_vspdData.Row2 = orgRow2;





            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadUnLock = function (pCol1, pRow1, pCol2, pRow2) {
        //if (IsOddMode) return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            var orgCol1 = 0, orgCol2 = 0, orgRow1 = 0, orgRow2 = 0;
            orgCol1 = _vspdData.Col;
            orgCol2 = _vspdData.Col2;
            orgRow1 = _vspdData.Row;
            orgRow2 = _vspdData.Row2;

            _vspdData.BlockMode = true;
            _vspdData.Col = (pCol1 ? pCol1 : -1);
            if (pCol2 && pCol2 > 0 && pCol2 > pCol1) {
                _vspdData.Col2 = pCol2;
            } else {
                _vspdData.Col2 = _vspdData.Col;
            }
            _vspdData.Row = (pRow1 ? pRow1 : -1);
            if (pRow2 && pRow2 > 0 && pRow2 > pCol1) {
                _vspdData.Row2 = pRow2;
            } else {
                _vspdData.Row2 = _vspdData.Row;
            }
            _vspdData.Lock = false;
            _vspdData.BlockMode = false;

            this.SpreadUnLockColor(pCol1, pRow1, pCol2, pRow2);

            //if (!_vspdData.ColHidden) {
            //    if (pRow1) {
            //        for (var i = pRow1; i <= (pRow2 | pRow1) ; i++) {
            //            _vspdData.Row = i;
            //            for (var j = pCol1; j <= (pCol2 | pCol1) ; j++) {
            //                _vspdData.Col = j;
            //                _vspdData.Lock = false;

            //                if (_vspdData.CellType == CellType.Button) {
            //                    _vspdData.TypeButtonColor = OLE_SHADOW_BACKCOLOR;
            //                    //_vspdData.TypeButtonBorderColor = OLE_HEADER_BORDERCOLOR;
            //                    //_vspdData.TypeButtonLightColor = OLE_HEADER_BORDERCOLOR;
            //                    _vspdData.TypeButtonDarkColor = 0x00808080;
            //                    //_vspdData.TypeButtonShadowSize = 0;
            //                }
            //            }
            //        }
            //    } else {
            //        _vspdData.Row = -1;
            //        for (var j = pCol1; j <= (pCol2 | pCol1) ; j++) {
            //            _vspdData.Col = j;
            //            _vspdData.Lock = false;

            //            if (_vspdData.CellType == CellType.Button) {
            //                _vspdData.TypeButtonColor = OLE_SHADOW_BACKCOLOR;
            //                //_vspdData.TypeButtonBorderColor = OLE_HEADER_BORDERCOLOR;
            //                //_vspdData.TypeButtonLightColor = OLE_HEADER_BORDERCOLOR;
            //                _vspdData.TypeButtonDarkColor = 0x00808080;
            //                //_vspdData.TypeButtonShadowSize = 0;
            //            }
            //        }
            //    }


            //    this.SpreadUnLockColor(pCol1, pRow1, pCol2, pRow2);
            //}

            //_vspdData.Col = orgCol1;
            //_vspdData.Col2 = orgCol2;
            //_vspdData.Row = orgRow1;
            //_vspdData.Row2 = orgRow2;



            if (_chgReDraw) {
                this.ReDraw(true);
            }


        }
    };

    this.SpreadRequired = function (pCol1, pRow1, pCol2, pRow2) {
        //if (IsOddMode) return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            //var orgCol1 = 0, orgRow1 = 0, orgCol2 = 0, orgRow2 = 0;
            //orgCol1 = _vspdData.Col;
            //orgCol2 = _vspdData.Col2;
            //orgRow1 = _vspdData.Row;
            //orgRow2 = _vspdData.Row2;

            //if (pCol1 == undefined) pCol1 = -1;
            //if (pCol2 == undefined) pCol2 = pCol1;
            //if (pRow1 == undefined) pRow1 = -1;
            //if (pRow2 == undefined) pRow2 = pRow1;

            //if (pCol1 < pCol2 && pCol1 == -1) pCol1 = pCol2;
            //if (pCol1 > pCol2) pCol1 = pCol2;
            //if (pRow1 < pRow2 && pRow2 == -1) pRow1 = pRow2;
            //if (pRow1 > pRow2) pRow1 = pRow2;

            //_vspdData.BlockMode = true;
            //_vspdData.Lock = false;
            //_vspdData.Col = pCol1;
            //_vspdData.Col2 = pCol2;
            //_vspdData.Row = pRow1;
            //_vspdData.Row2 = pRow2;
            //_vspdData.BlockMode = false;

            var orgCol1 = 0, orgCol2 = 0, orgRow1 = 0, orgRow2 = 0;
            orgCol1 = _vspdData.Col;
            orgCol2 = _vspdData.Col2;
            orgRow1 = _vspdData.Row;
            orgRow2 = _vspdData.Row2;

            _vspdData.BlockMode = true;
            _vspdData.Col = (pCol1 ? pCol1 : -1);
            if (pCol2 && pCol2 > 0 && pCol2 > pCol1) {
                _vspdData.Col2 = pCol2;
            } else {
                _vspdData.Col2 = _vspdData.Col;
            }
            _vspdData.Row = (pRow1 ? pRow1 : -1);
            if (pRow2 && pRow2 > 0 && pRow2 > pCol1) {
                _vspdData.Row2 = pRow2;
            } else {
                _vspdData.Row2 = _vspdData.Row;
            }
            _vspdData.Lock = false;
            _vspdData.BlockMode = false;

            this.SpreadRequiredColor(pCol1, pRow1, pCol2, pRow2);

            //if (pCol1 != pCol2 || pRow1 != pRow2) {
            //    for (var i = 0; i <= _vspdData.MaxRows + 1; i++) {
            //        for (var j = 0; j <= _vspdData.MaxCols + 1; j++) {
            //            if (i >= pRow1 && i <= pRow2 && j >= pCol1 && j <= pCol2) {
            //                _vspdData.Row = i;
            //                _vspdData.Col = j;

            //                if (!_vspdData.ColHidden) {
            //                    if (_vspdData.Lock) {
            //                        _vspdData.Lock = false;
            //                    }

            //                    if (_vspdData.CellType != CellType.Button) {
            //                        this.SpreadRequiredColor(j, i);
            //                    }
            //                }
            //            }
            //        }
            //    }
            //} else {
            //    _vspdData.Row = pRow1;
            //    _vspdData.Col = pCol1;

            //    if (!_vspdData.ColHidden) {
            //        if (_vspdData.Lock) {
            //            _vspdData.Lock = false;
            //        }

            //        if (_vspdData.CellType != CellType.Button) {
            //            this.SpreadRequiredColor(pCol1, pRow1, pCol2, pRow2);
            //        }
            //    }
            //}

            //_vspdData.Col = orgCol1;
            //_vspdData.Col2 = orgCol2;
            //_vspdData.Row = orgRow1;
            //_vspdData.Row2 = orgRow2;





            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadLockColor = function (pCol1, pRow1, pCol2, pRow2) {

        if (pCol1 == undefined && pRow1 == undefined && pCol2 == undefined && pRow2 == undefined) return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBackColor(pCol1, pRow1, pCol2, pRow2, OLE_PROTECTED_BACKCOLOR, BackColorStyle.UnderGrid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadUnLockColor = function (pCol1, pRow1, pCol2, pRow2) {

        if (pCol1 == undefined && pRow1 == undefined && pCol2 == undefined && pRow2 == undefined) return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBackColor(pCol1, pRow1, pCol2, pRow2, OLE_UNLOCK_BACKCOLOR, BackColorStyle.UnderGrid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadRequiredColor = function (pCol1, pRow1, pCol2, pRow2) {

        if (pCol1 == undefined && pRow1 == undefined && pCol2 == undefined && pRow2 == undefined) return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBackColor(pCol1, pRow1, pCol2, pRow2, OLE_REQUIRED_BACKCOLOR, BackColorStyle.UnderGrid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };
    this.SpreadHeaderBackColor = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBackColor(-1, 0, -1, 0, OLE_SHADOW_BACKCOLOR, BackColorStyle.UnderGrid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadDataCellBackColor = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBackColor(-1, -1, 0, 0, OLE_DATACELL_BACKCOLOR, BackColorStyle.UnderGrid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadCellBackColor = function (pCol1, pRow1, pCol2, pRow2, pColor, pBackColorStyle) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.BlockMode = true;
            _vspdData.Col = (pCol1 ? pCol1 : -1);
            if (pCol2 && pCol2 > 0 && pCol2 > pCol1) {
                _vspdData.Col2 = pCol2;
            } else {
                _vspdData.Col2 = _vspdData.Col;
            }
            _vspdData.Row = (pRow1 ? pRow1 : -1);
            if (pRow2 && pRow2 > 0 && pRow2 > pCol1) {
                _vspdData.Row2 = pRow2;
            } else {
                _vspdData.Row2 = _vspdData.Row;
            }
            _vspdData.BackColor = pColor;
            if (pBackColorStyle) {
                _vspdData.BackColorStyle = pBackColorStyle;
            }
            _vspdData.BlockMode = false;

            //var orgCol1 = 0, orgRow1 = 0, orgCol2 = 0, orgRow2 = 0;
            //orgCol1 = _vspdData.Col;
            //orgCol2 = _vspdData.Col2;
            //orgRow1 = _vspdData.Row;
            //orgRow2 = _vspdData.Row2;

            //if (pCol1 == undefined) pCol1 = -1;
            //if (pCol2 == undefined) pCol2 = pCol1;
            //if (pRow1 == undefined) pRow1 = -1;
            //if (pRow2 == undefined) pRow2 = pRow1;

            //if (pCol1 < pCol2 && pCol1 == -1) pCol1 = pCol2;
            //if (pCol1 > pCol2) pCol1 = pCol2;
            //if (pRow1 < pRow2 && pRow2 == -1) pRow1 = pRow2;
            //if (pRow1 > pRow2) pRow1 = pRow2;

            //if (pCol1 != pCol2 || pRow1 != pRow2) {
            //    for (var i = 0; i <= _vspdData.MaxRows + 1; i++) {
            //        for (var j = 0; j <= _vspdData.MaxCols + 1; j++) {
            //            if (i >= pRow1 && i <= pRow2 && j >= pCol1 && j <= pCol2) {
            //                _vspdData.Row = i;
            //                _vspdData.Col = j;

            //                if (_vspdData.CellType != CellType.Button) {
            //                    _vspdData.BackColor = pColor;
            //                    _vspdData.BackColorStyle = pBackColorStyle;
            //                }
            //            }
            //        }
            //    }

            //} else {
            //    _vspdData.Col = pCol1;
            //    _vspdData.Col2 = pCol2;
            //    _vspdData.Row = pRow1;
            //    _vspdData.Row2 = pRow2;
            //    _vspdData.BackColor = pColor;
            //    _vspdData.BackColorStyle = pBackColorStyle;
            //}

            //_vspdData.Col = orgCol1;
            //_vspdData.Col2 = orgCol2;
            //_vspdData.Row = orgRow1;
            //_vspdData.Row2 = orgRow2;

            //_vspdData.BlockMode = true;
            //_vspdData.Col = pCol1;
            //_vspdData.Col2 = pCol2;
            //_vspdData.Row = pRow1;
            //_vspdData.Row2 = pRow2;
            //_vspdData.BackColor = pColor;
            //_vspdData.BackColorStyle = pBackColorStyle;
            //_vspdData.BlockMode = false;

            //행이 -1 이였어도 해더의 색은 바뀌지 않음
            //if (pRow1 == -1) {
            //    this.SpreadHeaderBackColor();
            //}

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadHeaderBorderColor = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBorderColor(-1, 0, -1, 0, OLE_HEADER_BORDERCOLOR, CellBorderPosition.CellAll, CellBorderStyle.CellSolid);
            this.SpreadCellBorderColor(0, -1, 0, -1, OLE_HEADER_BORDERCOLOR, CellBorderPosition.CellAll, CellBorderStyle.CellSolid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadDataCellBorderColor = function () {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            this.SpreadCellBorderColor(-1, -1, 0, 0, OLE_DATACELL_BORDERCOLOR, CellBorderPosition.CellAll, CellBorderStyle.CellSolid);

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadCellBorderColor = function (pCol1, pRow1, pCol2, pRow2, pColor, pBorderPosition, pBorderStyle) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            if (pCol1 == undefined) pCol1 = -1;
            if (pCol2 == undefined) pCol2 = pCol1;
            if (pRow1 == undefined) pRow1 = -1;
            if (pRow2 == undefined) pRow2 = pRow1;

            if (_vspdData.Version == "6.0") {
                _vspdData.SetCellBorder(pCol1, pRow1, pCol2, pRow2, pBorderPosition, pColor, pBorderStyle);
            } else if (_vspdData.Version == "7.0") {
                _vspdData.object.SetCellBorder(pCol1, pRow1, pCol2, pRow2, pBorderPosition, pColor, pBorderStyle);
            } else if (_vspdData.Version == "8.0") {
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SpreadColWidth = function (pCol, pWidth) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxCols >= pCol) {
                var _chgReDraw = false;
                if (_vspdData.ReDraw) {
                    this.ReDraw(false);
                    _chgReDraw = true;
                }

                _vspdData.ColWidth(pCol) = pWidth;

                if (_chgReDraw) {
                    this.ReDraw(true);
                }
            }
        }
    };

    this.SpreadRowHeight = function (pRow, pHeight) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            if (_vspdData.MaxRows >= pRow) {
                var _chgReDraw = false;
                if (_vspdData.ReDraw) {
                    this.ReDraw(false);
                    _chgReDraw = true;
                }

                _vspdData.RowHeight(pRow) = pHeight;

                if (_chgReDraw) {
                    this.ReDraw(true);
                }
            }
        }
    };

    //this.addMethod = function(object, name, fn){
    //    var old = object[ name ];
    //    object[ name ] = function(){
    //        if ( fn.length == arguments.length )
    //            return fn.apply( this, arguments );
    //        else if ( typeof old == 'function' )
    //            return old.apply( this, arguments );
    //    };
    //};
    //this.Test = function(){
    //    //test1
    //    addMethod(this, "Add", function(){
    //    });
    //    //test2
    //    addMethod(this, "Add", function(a){
    //    });
    //    //test3
    //    addMethod(this, "Add", function(a, b){
    //    });
    //};

    // 지정한 컬럼 위치 컬럼을 숨김니다.
    this.SSSetColHidden = function (pStartCol, pEndCol, pIsHidden) {
        if (typeof pStartCol != "number" || typeof pEndCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            for (var i = pStartCol; i <= pEndCol; i++) {
                // 컬럼 해더 설정
                _vspdData.Col = i;
                _vspdData.Row = 0;

                _vspdData.ColHidden = pIsHidden;
                this.SpreadLock(i);
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };
    this.SSSetEdit = function (pCol, pColHeaderText, pWidth, pAlign, pLength, pCellKind, pIsHidden, pCharCase, pCharSet, pIsPassword, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            // 컬럼 해더 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;

            _vspdData.ColWidth(pCol) = pWidth;
            _vspdData.UserResizeCol = UserResizeCol.On;
            _vspdData.TypeHAlign = HAlign.Center;
            if (pColHeaderText != undefined && typeof pColHeaderText == "string") {
                _vspdData.Text = (pColHeaderText == "" ? _vspdData.RowSep : pColHeaderText);
            } else {
                _vspdData.Text = _vspdData.RowSep;
            }

            // 컬럼 에디터 설정
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.Edit;

            if (pAlign != undefined && typeof pAlign == "number") {
                _vspdData.TypeHAlign = pAlign;
            }
            if (pLength != undefined && typeof pLength == "number") {
                _vspdData.TypeMaxEditLen = pLength;
            }
            if (pCharCase != undefined && typeof pCharCase == "number") {
                _vspdData.TypeEditCharCase = pCharCase;
            } else {
                _vspdData.TypeEditCharCase = EditCharCase.NoCase;
            }
            if (pCharSet != undefined && typeof pCharSet == "number") {
                _vspdData.TypeEditCharSet = pCharSet;
            }
            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                } else {
                    switch (pCellKind) {
                        case CellKind.Required: this.SpreadRequired(pCol); break;
                        case CellKind.Protected: this.SpreadLock(pCol); break;
                        case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                    }
                }
            } else {
                switch (pCellKind) {
                    case CellKind.Required: this.SpreadRequired(pCol); break;
                    case CellKind.Protected: this.SpreadLock(pCol); break;
                    case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                }
            }

            _vspdData.TypeEditMultiLine = false;
            if (pIsPassword) {
                _vspdData.TypeEditPassword = pIsPassword;
            } else {
                _vspdData.TypeEditPassword = false;
            }

            _vspdData.TypeEllipses = true; // 셀 가로길이를 넘었을때 "..."으로 표시
            _vspdData.AllowEditOverFlow = false; // 셀의 Edit모드로 진입했을때 다른셀의 영역까지 보여진다.
            _vspdData.AllowCellOverflow = false; // 셀상의 디스플레이되는 항목을 설정(true : 글자수가 셀가로길이보다 작을때 다른셀의 영역으로 올라간다)

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    // 지정한 컬럼 위치에 실수형 에디터 컨트롤 컬럼을 생성합니다.
    this.SSSetFloat = function (pCol, pColHeaderText, pWidth, pAlign, pCellKind, pIsHidden, pComIntPart, pComNumPart, pComNumDecPoint, pCurrencySymbol, pCurrencyLeadingZero, pMinValue, pMaxValue, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            // 컬럼 해더 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;

            _vspdData.ColWidth(pCol) = pWidth;
            _vspdData.UserResizeCol = UserResizeCol.On;
            _vspdData.TypeHAlign = HAlign.Center;
            if (pColHeaderText != undefined && typeof pColHeaderText == "string") {
                _vspdData.Text = (pColHeaderText == "" ? _vspdData.RowSep : pColHeaderText);
            } else {
                _vspdData.Text = _vspdData.RowSep;
            }

            // 컬럼 에디터 설정
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.Currency;
            _vspdData.TypeSpin = true;
            _vspdData.TypeSpinWrap = true;
            _vspdData.TypeTextWordWrap = true;

            if (pAlign != undefined && typeof pAlign == "number") {
                _vspdData.TypeHAlign = pAlign;
            } else {
                _vspdData.TypeHAlign = HAlign.Right;
            }
            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                } else {
                    switch (pCellKind) {
                        case CellKind.Required: this.SpreadRequired(pCol); break;
                        case CellKind.Protected: this.SpreadLock(pCol); break;
                        case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                    }
                }
            } else {
                switch (pCellKind) {
                    case CellKind.Required: this.SpreadRequired(pCol); break;
                    case CellKind.Protected: this.SpreadLock(pCol); break;
                    case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                }
            }
            if (pCurrencySymbol != undefined && typeof pCurrencySymbol == "string") {
                _vspdData.TypeCurrencySymbol = pCurrencySymbol;
                _vspdData.TypeCurrencyShowSymbol = true;
            } else {
                _vspdData.TypeCurrencySymbol = "";
                _vspdData.TypeCurrencyShowSymbol = false;
            }
            if (pComIntPart != undefined && typeof pComIntPart == "string") {
                _vspdData.TypeCurrencySeparator = pComIntPart;
                _vspdData.TypeCurrencyShowSep = true;
            } else {
                _vspdData.TypeCurrencySeparator = ",";
                _vspdData.TypeCurrencyShowSep = true;
            }
            if (pComNumPart != undefined && typeof pComNumPart == "string") {
                _vspdData.TypeCurrencyDecimal = pComNumPart;
            } else {
                _vspdData.TypeCurrencyDecimal = "."; //소수점 구분자
            }
            if (pComNumDecPoint != undefined && typeof pComNumDecPoint == "number") {
                _vspdData.TypeCurrencyDecPlaces = pComNumDecPoint; //소수정 표시길이
            } else {
                _vspdData.TypeCurrencyDecPlaces = 2; //소수정 표시길이
            }


            if (pMinValue != undefined && typeof pMinValue == "number") {
                _vspdData.TypeCurrencyMin = pMinValue;
                if (pMinValue < 0) {
                    _vspdData.TypeCurrencyNegStyle = CurrencyNegStyle.CurrencyNegStyle6; // 표시방법
                    //_vspdData.TypeNegRed = true;
                }
            } else {
                _vspdData.TypeCurrencyMin = 0;
            }
            if (pMaxValue != undefined && typeof pMaxValue == "number") {
                _vspdData.TypeCurrencyMax = pMaxValue;
            } else {
                _vspdData.TypeCurrencyMax = 10000000000;
            }
            if (pCurrencyLeadingZero != undefined && typeof pCurrencyLeadingZero == "number") {
                _vspdData.TypeCurrencyLeadingZero = pCurrencyLeadingZero;
            } else {
                _vspdData.TypeCurrencyLeadingZero = CurrencyLeadingZero.LeadingZeroYes;
            }


            _vspdData.TypeCurrencyPosStyle = CurrencyPosStyle.CurrencyPosStyle3; //표시방법


            _vspdData.AllowEditOverFlow = false; // 셀의 Edit모드로 진입했을때 다른셀의 영역까지 보여진다.
            _vspdData.AllowCellOverflow = false; // 셀상의 디스플레이되는 항목을 설정(true : 글자수가 셀가로길이보다 작을때 다른셀의 영역으로 올라간다)

            //시트 합계및 계산 예제
            //_vspdData.Col =ㄴ 2
            //_vspdData.Row = 8
            //_vspdData.Formula = "B7 - B6"
            //_vspdData.Col = 2
            //_vspdData.Row = 6
            //_vspdData.Formula = "sum(B1:B5)"

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    // 지정한 컬럼 위치에 콤보 에디터 컨트롤 컬럼을 생성합니다.
    this.SSSetCombo = function (pCol, pColHeaderText, pWidth, pAlign, pCellKind, pIsHidden, pArrayAndStrComboData, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            // 컬럼 해더 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;

            _vspdData.ColWidth(pCol) = pWidth;
            _vspdData.UserResizeCol = UserResizeCol.On;
            _vspdData.TypeHAlign = HAlign.Center;
            if (pColHeaderText != undefined && typeof pColHeaderText == "string") {
                _vspdData.Text = (pColHeaderText == "" ? _vspdData.RowSep : pColHeaderText);
            } else {
                _vspdData.Text = _vspdData.RowSep;
            }

            // 컬럼 에디터 설정
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.ComboBox;

            if (pAlign != undefined && typeof pAlign == "number") {
                _vspdData.TypeHAlign = pAlign
            }
            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                } else {
                    switch (pCellKind) {
                        case CellKind.Required: this.SpreadRequired(pCol); break;
                        case CellKind.Protected: this.SpreadLock(pCol); break;
                        case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                    }
                }
            } else {
                switch (pCellKind) {
                    case CellKind.Required: this.SpreadRequired(pCol); break;
                    case CellKind.Protected: this.SpreadLock(pCol); break;
                    case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                }
            }
            if (pArrayAndStrComboData != undefined && typeof pArrayAndStrComboData == "string") {
                _vspdData.TypeComboBoxList = pArrayAndStrComboData;
            } else if (pArrayAndStrComboData != undefined && Object.prototype.toString.call(pArrayAndStrComboData) == "[object Array]") {
                var maxCnt = _vspdData.TypeComboBoxCount;
                _vspdData.TypeComboBoxIndex = maxCnt;

                pArrayAndStrComboData = pArrayAndStrComboData.reverse();
                for (var i = 0; i < pArrayAndStrComboData.length; i++) {
                    _vspdData.TypeComboBoxString = pArrayAndStrComboData[i];
                }
            }
            if (_vspdData.TypeComboBoxCount > 20) {
                _vspdData.TypeComboBoxMaxDrop = 20;
            }

            _vspdData.TypeComboBoxWidth = 0;
            _vspdData.TypeComboBoxAutoSearch = 0;
            _vspdData.TypeComboBoxEditable = false;
            _vspdData.AllowEditOverFlow = false; // 셀의 Edit모드로 진입했을때 다른셀의 영역까지 보여진다.
            _vspdData.AllowCellOverflow = false; // 셀상의 디스플레이되는 항목을 설정(true : 글자수가 셀가로길이보다 작을때 다른셀의 영역으로 올라간다)

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SSSetColMerge = function (iCol, eMergeOptions) {
        var _vspdData = this._getSource();

        if (_vspdData) {
            _vspdData.Col = iCol;
            _vspdData.ColMerge = eMergeOptions;
        }
    };

    this.SSetComboData = function (pCol, pData, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.Col = pCol;
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.TypeComboBoxList = pData;

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    this.SSetComboText = function (pCol, pText, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            _vspdData.Col = pCol;
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            var maxCnt = _vspdData.TypeComboBoxCount;
            _vspdData.TypeComboBoxIndex = maxCnt;
            _vspdData.TypeComboBoxString = pText;

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    // 지정한 컬럼 위치에 체크 에디터 컨트롤 컬럼을 생성합니다.
    this.SSSetCheck = function (pCol, pColHeaderText, pWidth, pIsProtected, pIsHidden, pCheckTitle, pCheckTitleAlign, pCheckType, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            // 컬럼 해더 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;

            if (pWidth != undefined && typeof pWidth == "number") {
                _vspdData.ColWidth(pCol) = pWidth;
            } else {
                _vspdData.ColWidth(pCol) = 5;
            }
            _vspdData.UserResizeCol = UserResizeCol.Off;
            _vspdData.TypeHAlign = HAlign.Center;
            if (pColHeaderText != undefined && typeof pColHeaderText == "string") {
                _vspdData.Text = (pColHeaderText == "" ? _vspdData.RowSep : pColHeaderText);
            } else {
                _vspdData.Text = _vspdData.RowSep;
            }

            // 컬럼 에디터 설정
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.CheckBox;
            _vspdData.TypeHAlign = HAlign.Center;

            this.SpreadUnLock(pCol);

            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                } else {
                    if (pIsProtected) {
                        _vspdData.TypeCheckType = CheckType.TreeState;
                        _vspdData.Text = 2;
                        _vspdData.Value = 2;
                        this.SpreadLock(pCol);
                    }
                }
            } else {
                if (pIsProtected) {
                    _vspdData.TypeCheckType = CheckType.TreeState;
                    _vspdData.Text = 2;
                    _vspdData.Value = 2;
                    this.SpreadLock(pCol);
                }
            }

            if (pCheckTitle != undefined && typeof pCheckTitle == "string") {
                _vspdData.TypeCheckText = pCheckTitle;
            }
            if (pCheckTitleAlign != undefined && typeof pCheckTitleAlign == "number") {
                _vspdData.TypeCheckTextAlign = pCheckTitleAlign;
            }
            if (pCheckType != undefined && typeof pCheckType == "number") {
                _vspdData.TypeCheckType = pCheckType;
            } else {
                _vspdData.TypeCheckType = CheckType.TwoState;
            }

            _vspdData.TypeCheckCenter = true;
            _vspdData.AllowEditOverFlow = false; // 셀의 Edit모드로 진입했을때 다른셀의 영역까지 보여진다.
            _vspdData.AllowCellOverflow = false; // 셀상의 디스플레이되는 항목을 설정(true : 글자수가 셀가로길이보다 작을때 다른셀의 영역으로 올라간다)

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    // 지정한 컬럼 위치에 텍스트 에디터 컨트롤 컬럼을 생성합니다.
    this.SSSetDate = function (pCol, pColHeaderText, pWidth, pAlign, pCellKind, pIsHidden, pDateFormat, pIsCentury, pMinDate, pMaxDate, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            // 컬럼 해더 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;

            _vspdData.ColWidth(pCol) = pWidth;
            _vspdData.UserResizeCol = UserResizeCol.On;
            _vspdData.TypeHAlign = HAlign.Center;
            if (pColHeaderText != undefined && typeof pColHeaderText == "string") {
                _vspdData.Text = (pColHeaderText == "" ? _vspdData.RowSep : pColHeaderText);
            } else {
                _vspdData.Text = _vspdData.RowSep;
            }

            // 컬럼 에디터 설정
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.Date;
            _vspdData.TypeSpin = true;
            _vspdData.TypeSpinWrap = true;
            _vspdData.TypeTextWordWrap = true;
            if (pAlign != undefined && typeof pAlign == "number") {
                _vspdData.TypeHAlign = pAlign
            }
            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                } else {
                    switch (pCellKind) {
                        case CellKind.Required: this.SpreadRequired(pCol); break;
                        case CellKind.Protected: this.SpreadLock(pCol); break;
                        case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                    }
                }
            } else {
                switch (pCellKind) {
                    case CellKind.Required: this.SpreadRequired(pCol); break;
                    case CellKind.Protected: this.SpreadLock(pCol); break;
                    case CellKind.Default: default: this.SpreadUnLock(pCol); break;
                }
            }
            if (pIsCentury != undefined && typeof pIsCentury == "boolean") {
                _vspdData.TypeDateCentury = pIsCentury;
            }
            if (pDateFormat != undefined && typeof pDateFormat == "number") {
                _vspdData.TypeDateFormat = pDateFormat;
            }

            if (pMinDate) {
                _vspdData.TypeDateMin = pMinDate;
            } else {
                _vspdData.TypeDateMin = "01011000";
            }

            if (pMaxDate) {
                _vspdData.TypeDateMax = pMaxDate;
            } else {
                _vspdData.TypeDateMax = "01013000";
            }

            _vspdData.TypeDateSeparator = String("-").charCodeAt();
            _vspdData.AllowEditOverFlow = false; // 셀의 Edit모드로 진입했을때 다른셀의 영역까지 보여진다.
            _vspdData.AllowCellOverflow = false; // 셀상의 디스플레이되는 항목을 설정(true : 글자수가 셀가로길이보다 작을때 다른셀의 영역으로 올라간다)

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    // 지정한 컬럼 위치에 버튼 컨트롤 컬럼을 생성합니다.
    this.SSSetButton = function (pCol, pIsLock, pIsHidden, pRow) {
        if (typeof pCol != "number") return;

        var _vspdData = this._getSource();

        if (_vspdData) {
            var _chgReDraw = false;
            if (_vspdData.ReDraw) {
                this.ReDraw(false);
                _chgReDraw = true;
            }

            //전체 Row 반영부터 한다.
            _vspdData.Col = pCol;
            _vspdData.Row = (pRow == undefined || typeof pRow != "number" ? -1 : pRow);
            _vspdData.CellType = CellType.Button;

            _vspdData.TypeButtonColor = OLE_SHADOW_BACKCOLOR;
            //_vspdData.TypeButtonBorderColor = OLE_HEADER_BORDERCOLOR;
            //_vspdData.TypeButtonLightColor = OLE_HEADER_BORDERCOLOR;
            //_vspdData.TypeButtonDarkColor = OLE_HEADER_BORDERCOLOR;
            //_vspdData.TypeButtonShadowSize = 0;
            _vspdData.TypeButtonText = "...";
            _vspdData.TypeButtonType = ButtonType.Normal;
            _vspdData.TypeButtonAlign = ButtonAlign.ButtonAlignBottom;

            this.SpreadDataCellBorderColor(pCol, -1, pCol, -1, OLE_DATACELL_BORDERCOLOR, CellBorderPosition.CellAll, CellBorderStyle.CellSolid);

            //전체 반영후 해더 컬러 설정
            _vspdData.Col = pCol;
            _vspdData.Row = 0;
            _vspdData.ColWidth(pCol) = 2;
            _vspdData.UserResizeCol = UserResizeCol.Off;
            _vspdData.TypeHAlign = HAlign.Center;
            _vspdData.Text = "\n\r";

            _vspdData.TypeTextShadow = true;
            _vspdData.BackColor = OLE_SHADOW_BACKCOLOR;
            _vspdData.BackColorStyle = BackColorStyle.OverGrid;
            _vspdData.ForeColor = OLE_SHADOW_BACKCOLOR;
            //_vspdData.object.SetCellBorder(pCol, 0, pCol, 0, CellBorderPosition.CellAll, OLE_HEADER_BORDERCOLOR, CellBorderStyle.CellSolid);
            //_vspdData.object.SetCellBorder(pCol, 0, pCol, 0, CellBorderPosition.CellTop, 0x00FFFFFF, CellBorderStyle.CellSolid);
            //_vspdData.object.SetCellBorder(pCol, 0, pCol, 0, CellBorderPosition.CellLeft, OLE_SHADOW_BACKCOLOR, CellBorderStyle.CellSolid);

            if (pIsLock != undefined && typeof pIsLock == "boolean" && (pIsLock /*|| IsOddMode*/)) {
                this.SpreadLock(pCol);
                //_vspdData.Lock = true;
            } else {
                this.SpreadUnLock(pCol);
                //_vspdData.Lock = false;
            }

            if (pIsHidden != undefined && typeof pIsHidden == "boolean") {
                _vspdData.ColHidden = pIsHidden;
                if (pIsHidden) {
                    this.SpreadLock(pCol);
                    //_vspdData.Lock = true;
                }
            }

            if (_chgReDraw) {
                this.ReDraw(true);
            }
        }
    };

    //this.VisibleRowCnt = function(pStartRow){
    //var i,j, pStartCol

    //var retValue = 0

    //if (pStartRow < 0) {
    //    return;
    //}

    //if (pStarRow == 0){
    //    pStartRow = 1
    //    return 50;
    //}

    //pStartCol = 1;

    //For i = 1 To  pDoc.MaxCols
    //pDoc.Col = i
    //pDoc.Row = pStartRow
    //If pDoc.ColHidden <> True Then
    //pStartCol = i
    //Exit For
    //End If
    //Next    

    //For i = pStartCol To  pDoc.MaxCols                                    ' Left to Right
    //If pDoc.IsVisible(i, pStartRow, True) = True Then
    //pStartCol = i
    //Exit For
    //End If
    //Next    

    //If pDoc.IsVisible(pStartCol, pStartRow, True) = False Then           ' Top to Bottom
    //For i = pStartRow To pDoc.MaxRows
    //If pDoc.IsVisible(pStartCol, i, True) = True Then
    //pStartRow = i
    //Exit For
    //End If
    //Next
    //End If

    //For i = pStartRow To pDoc.MaxRows                                  ' Count visible row
    //If pDoc.IsVisible(pStartCol, i, True) = False Then
    //Exit For
    //End If
    //j = i
    //Next

    //VisibleRowCnt = j - pStartRow + 1

    //End Function
};
