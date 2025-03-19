<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopContact.ascx.cs" Inherits="eniFramework.WebApp.Popup.PopContact" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 주소록 팝업
*  2. Function Name        :
*  3. Program ID           : ContactBox.ascx
*  4. Program Name         : 주소록 팝업 컨트롤
*  5. Program Desc         : 주소록 팝업 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2014-09-25
*  8. Modified date(Last)  : 2014-09-25
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="lgContactBox_Before_Event_Holder">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery.Cookie.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../Scripts/Devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            PopContact = ASPxClientPopupControl.Cast();
            PopContact.CallbackF        = function (pArgs) { };

            PopContact.cbpContactGroup  = ASPxClientCallbackPanel.Cast();
            PopContact.tvContactGroup   = ASPxClientTreeView.Cast();

            PopContact.chkAllSelected   = ASPxClientCheckBox.Cast();
            PopContact.txtSearchText    = ASPxClientTextBox.Cast();
            PopContact.lbContactList    = ASPxClientListBox.Cast();

            PopContact.btnToAdd         = ASPxClientButton.Cast();
            PopContact.btnToDel         = ASPxClientButton.Cast();
            PopContact.btnCcAdd         = ASPxClientButton.Cast();
            PopContact.btnCcDel         = ASPxClientButton.Cast();
            PopContact.btnBccAdd        = ASPxClientButton.Cast();
            PopContact.btnBccDel        = ASPxClientButton.Cast();

            PopContact.lblToListCnt     = ASPxClientLabel.Cast();
            PopContact.lbToList         = ASPxClientListBox.Cast();
            PopContact.lblCcListCnt     = ASPxClientLabel.Cast();
            PopContact.lbCcList         = ASPxClientListBox.Cast();
            PopContact.lblBccListCnt    = ASPxClientLabel.Cast();
            PopContact.lbBccList        = ASPxClientListBox.Cast();

            PopContact.btnOk            = ASPxClientButton.Cast(btnOk);
            PopContact.btnCancel        = ASPxClientButton.Cast(btnCancel);

            PopContact.SetDefault = function () { };
            PopContact.ShowPopup = function (pJsonContactData, pCallBackF) { };
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
        .eni_Web .eniPopup-Advanced-01 .popContact_Group_Wrap {
            position:absolute;
            display:inline-block;
            width:235px; 
            min-width:235px; 
            max-width:235px; 
            top:0;
            bottom:31px;
            overflow:hidden;
            border-right:1px solid #C0C0C0;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_Group_Wrap .popContact_Group_Top_Wrap {
            height:60px;
            border-bottom:1px solid #C0C0C0;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_Group_Wrap .popContact_Group_Text {
            line-height:17px;
            height:14px;
            display:inline-block;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_List_Wrap {
            position:absolute;
            display:inline-block;
            width: 268px;
            min-width:268px; 
            max-width:268px;
            top:0;
            left:236px;
            bottom:30px;
            overflow:hidden;
            border-right:1px solid #C0C0C0;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_Button_Wrap {
            position:absolute;
            display:inline-block;
            width: 40px;
            min-width:40px; 
            max-width:40px;
            top:0;
            left:505px;
            bottom:30px;
            overflow:hidden;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_Address_Wrap {
            position:absolute;
            display:inline-block;
            width: 228px;
            min-width:228px; 
            max-width:228px;
            top:0;
            left:545px;
            bottom:30px;
            overflow:hidden;
        }
        .eni_Web .eniPopup-Advanced-01 .popContact_Action_Button_Wrap {
            position:absolute;
            display:inline-block;
            padding:4px 5px 1px 0;
            height:30px;
            left:0px;
            right:0px;
            bottom:0px;
            text-align:right;
            border-top:1px solid #C0C0C0;
        }

    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        var ContactListCallBackArgsClass = function () {
            this.Lvl = new String();
            this.ContactGroupCd = new String();
            this.ContactType = new String();
        };

        var ContactListSearchCallBackArgsClass = function () {
            this.SearchText = new String();
        };

        function <%# ClientInstanceName %>_cbpContactGroup_BeginCallback(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                popContact_.lbContactList.ClearItems();
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_cbpContactGroup_EndCallback(s, e) {
            try {
                

                var popContact_ = <%# ClientInstanceName %>;

                var cocbArgs = new BaseCallbackArgsClass();
                cocbArgs.Cmd = "GROUP";

                cocbArgs.Data = new ContactListCallBackArgsClass();
                cocbArgs.Data.Lvl = "0";
                cocbArgs.Data.ContactGroupCd = "ALL";
                cocbArgs.Data.ContactType = "";

                popContact_.lbContactList.PerformCallback(JSON.stringify(cocbArgs));
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_cbpContactGroup_NodeClick(s, e) {
            var popContact_ = <%# ClientInstanceName %>;

            var cocbArgs = new BaseCallbackArgsClass();
            cocbArgs.Cmd = "GROUP";

            cocbArgs.Data = new ContactListCallBackArgsClass();
            cocbArgs.Data.Lvl = new String(e.node.name).split("|")[0];
            cocbArgs.Data.ContactGroupCd = new String(e.node.name).split("|")[1];
            cocbArgs.Data.ContactType = new String(e.node.name).split("|")[2];;

            popContact_.lbContactList.PerformCallback(JSON.stringify(cocbArgs));
        };

        function <%# ClientInstanceName %>_chkAllSelected_CheckedChanged(s, e) {
            var popContact_ = <%# ClientInstanceName %>;

            if (popContact_.chkAllSelected.GetChecked()) {
                popContact_.lbContactList.SelectAll();
            } else {
                popContact_.lbContactList.UnselectAll();
            }
        };

        function <%# ClientInstanceName %>_txtSearchText_KeyDown(s, e) {
            var popContact_ = <%# ClientInstanceName %>;

            switch(e.htmlEvent.keyCode){
                case 13:
                    var cocbArgs = new BaseCallbackArgsClass();
                    cocbArgs.Cmd = "CONTACT_SEARCH";
                    cocbArgs.Data = new ContactListSearchCallBackArgsClass();
                    cocbArgs.Data.SearchText = popContact_.txtSearchText.GetValue();

                    popContact_.lbContactList.PerformCallback(JSON.stringify(cocbArgs));
                    break;
            }

            popContact_.chkAllSelected.SetChecked(false);
        };

        function <%# ClientInstanceName %>_btnSearch_Click(s, e) {
            var popContact_ = <%# ClientInstanceName %>;

            var cocbArgs = new BaseCallbackArgsClass();
            cocbArgs.Cmd = "CONTACT_SEARCH";
            cocbArgs.Data = new ContactListSearchCallBackArgsClass();
            cocbArgs.Data.SearchText = popContact_.txtSearchText.GetValue();

            popContact_.lbContactList.PerformCallback(JSON.stringify(cocbArgs));

            popContact_.chkAllSelected.SetChecked(false);
        };

        function <%# ClientInstanceName %>_btnToAdd_Click(s, e) {
            try{
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbContactList.GetSelectedItems();
                
                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbToList.BeginUpdate();
                popContact_.lbCcList.BeginUpdate();
                popContact_.lbBccList.BeginUpdate();
                for (var i = 0; i < selectItems.length; i++) {
                    var fItem = popContact_.lbToList.FindItemByValue(selectItems[i].value);
                    if (!fItem) {
                        var fCCItem = popContact_.lbCcList.FindItemByValue(selectItems[i].value);
                        var fBCCItem = popContact_.lbBccList.FindItemByValue(selectItems[i].value);
                        if (fCCItem) {
                            popContact_.lbCcList.RemoveItem(fCCItem.index);
                        }
                        if (fBCCItem) {
                            popContact_.lbBccList.RemoveItem(fBCCItem.index);
                        }
                        popContact_.lbToList.AddItem(selectItems[i].text, selectItems[i].value);
                    }
                }
                popContact_.lblToListCnt.SetText(popContact_.lbToList.GetItemCount());
                popContact_.lblCcListCnt.SetText(popContact_.lbCcList.GetItemCount());
                popContact_.lblBccListCnt.SetText(popContact_.lbBccList.GetItemCount());
                popContact_.lbToList.EndUpdate();
                popContact_.lbCcList.EndUpdate();
                popContact_.lbBccList.EndUpdate();

                popContact_.lbContactList.UnselectItems();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_btnToDel_Click(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbToList.GetSelectedItems();

                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbToList.BeginUpdate();
                for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                    popContact_.lbToList.RemoveItem(selectItems[i].index);
                }
                popContact_.lblToListCnt.SetText(popContact_.lbToList.GetItemCount());
                popContact_.lbToList.EndUpdate();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_btnCcAdd_Click(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbContactList.GetSelectedItems();

                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbCcList.BeginUpdate();
                popContact_.lbToList.BeginUpdate();
                popContact_.lbBccList.BeginUpdate();
                for (var i = 0; i < selectItems.length; i++) {
                    var fItem = popContact_.lbCcList.FindItemByValue(selectItems[i].value);
                    if (!fItem) {
                        var fToItem = popContact_.lbToList.FindItemByValue(selectItems[i].value);
                        var fBCCItem = popContact_.lbBccList.FindItemByValue(selectItems[i].value);
                        if (fToItem) {
                            popContact_.lbToList.RemoveItem(fToItem.index);
                        }
                        if (fBCCItem) {
                            popContact_.lbBccList.RemoveItem(fBCCItem.index);
                        }
                        popContact_.lbCcList.AddItem(selectItems[i].text, selectItems[i].value);
                    }
                }
                popContact_.lblCcListCnt.SetText(popContact_.lbCcList.GetItemCount());
                popContact_.lblToListCnt.SetText(popContact_.lbToList.GetItemCount());
                popContact_.lblBccListCnt.SetText(popContact_.lbBccList.GetItemCount());
                popContact_.lbCcList.EndUpdate();
                popContact_.lbToList.EndUpdate();
                popContact_.lbBccList.EndUpdate();

                popContact_.lbContactList.UnselectItems();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_btnCcDel_Click(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbCcList.GetSelectedItems();

                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbCcList.BeginUpdate();
                for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                    popContact_.lbCcList.RemoveItem(selectItems[i].index);
                }
                popContact_.lblCcListCnt.SetText(popContact_.lbCcList.GetItemCount());
                popContact_.lbCcList.EndUpdate();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_btnBccAdd_Click(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbContactList.GetSelectedItems();

                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbBccList.BeginUpdate();
                popContact_.lbToList.BeginUpdate();
                popContact_.lbCcList.BeginUpdate();
                for (var i = 0; i < selectItems.length; i++) {
                    var fItem = popContact_.lbBccList.FindItemByValue(selectItems[i].value);
                    if (!fItem) {
                        var fToItem = popContact_.lbToList.FindItemByValue(selectItems[i].value);
                        var fCCItem = popContact_.lbCcList.FindItemByValue(selectItems[i].value);
                        if (fToItem) {
                            popContact_.lbToList.RemoveItem(fToItem.index);
                        }
                        if (fCCItem) {
                            popContact_.lbCcList.RemoveItem(fCCItem.index);
                        }
                        popContact_.lbBccList.AddItem(selectItems[i].text, selectItems[i].value);
                    }
                }
                popContact_.lblBccListCnt.SetText(popContact_.lbBccList.GetItemCount());
                popContact_.lblToListCnt.SetText(popContact_.lbToList.GetItemCount());
                popContact_.lblCcListCnt.SetText(popContact_.lbCcList.GetItemCount());
                popContact_.lbBccList.EndUpdate();
                popContact_.lbToList.EndUpdate();
                popContact_.lbCcList.EndUpdate();

                popContact_.lbContactList.UnselectItems();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_btnBccDel_Click(s, e) {
            try {
                var popContact_ = <%# ClientInstanceName %>;

                var selectItems = popContact_.lbBccList.GetSelectedItems();

                if (selectItems.length === 0) {
                    if (eni && eni.Message) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                        return;
                    } else {
                        return;
                    }
                }

                popContact_.lbBccList.BeginUpdate();
                for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                    popContact_.lbBccList.RemoveItem(selectItems[i].index);
                }
                popContact_.lblBccListCnt.SetText(popContact_.lbBccList.GetItemCount());
                popContact_.lbBccList.EndUpdate();

                popContact_.chkAllSelected.SetChecked(false);
            } catch (ex) {
                alert(ex.message);
            }
        };

        function <%# ClientInstanceName %>_Btn_Click(s, e) {
            var popContact_ = <%# ClientInstanceName %>;

            popContact_.Hide();

            var popContact_Btn = ASPxClientButton.Cast(s);

            var retData = { DialogResult : null, Data : null };
            var JsonContactData = {
                ToList: new Array(),
                CCList: new Array(),
                BCCList: new Array()
            };

            if (popContact_.CallbackF) {
                if (popContact_Btn.name) {
                    switch (popContact_Btn.name) {
                        case popContact_.btnOk.name:
                            var toCnt = popContact_.lbToList.GetItemCount();
                            for (var i = 0; i < toCnt; i++) {
                                JsonContactData.ToList[i] = popContact_.lbToList.GetItem(i).value;
                            }
                            var ccCnt = popContact_.lbCcList.GetItemCount();
                            for (var i = 0; i < ccCnt; i++) {
                                JsonContactData.CCList[i] = popContact_.lbCcList.GetItem(i).value;
                            }
                            var bccCnt = popContact_.lbBccList.GetItemCount();
                            for (var i = 0; i < bccCnt; i++) {
                                JsonContactData.BCCList[i] = popContact_.lbBccList.GetItem(i).value;
                            }

                            retData.DialogResult = DialogResult.Ok;
                            retData.Data = JsonContactData;
                            popContact_.CallbackF(retData);
                            break;
                        case popContact_.btnCancel.name:
                            retData.DialogResult = DialogResult.Cancel;
                            popContact_.CallbackF(retData);
                            break;
                        default:
                            retData.DialogResult = DialogResult.Cancel;
                            popContact_.CallbackF(retData);
                            break;
                    }
                } else {
                    retData.DialogResult = DialogResult.Cancel;
                    popContact_.CallbackF(retData);
                }
            }

            popContact_.SetDefault();
        };
    </script>
</asp:PlaceHolder>

<!-- 공통 주소록 박스 -->
<eni:eniPopupControl ID="popContact" ClientInstanceName='<%# ClientInstanceName %>' SkinID="Advanced-01" runat="server"
    Width="775px" Height="500px"
    AllowDragging="True" DragElement="Header" AllowResize="false" Modal="True" CloseAction="CloseButton" 
    HeaderText="주소록" ShowHeader="true" ShowFooter="false"
    PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ClientSideEvents-CloseButtonClick='<%# ClientInstanceName + "_Btn_Click" %>'>
    <ModalBackgroundStyle BackColor="Black" Opacity="30"></ModalBackgroundStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <eni:eniHiddenField ID="hidMCFields" ClientInstanceName="hidMCFields" runat="server"></eni:eniHiddenField>
            <div class="popContact_Group_Wrap">
                <div class="popContact_Group_Top_Wrap">
                    <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td colspan="2" class="Padding5L">
                                <a>메일 주소록</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:40px" class="Padding5L">
                                <a class="DisplayNone">중요</a>
                            </td>
                            <td class="Padding5L">
                                <a class="DisplayNone">새로고침</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <eni:eniCallbackPanel ID="cbpContactGroup" ClientInstanceName="cbpContactGroup" SkinID="Advanced-01" runat="server"
                    Width="100%" Height="382px" ScrollBars="Auto"
                    OnCallback="cbpContactGroup_Callback"
                    ClientSideEvents-BeginCallback='<%# ClientInstanceName + "_cbpContactGroup_BeginCallback" %>'
                    ClientSideEvents-EndCallback='<%# ClientInstanceName + "_cbpContactGroup_EndCallback" %>' EnableClientSideAPI="True">
                    <PanelCollection>
                        <dx:PanelContent>
                            <eni:eniTreeView ID="tvContactGroup" ClientInstanceName="tvContactGroup" SkinID="Advanced-01" runat="server" 
                                AllowSelectNode="true"
                                ClientSideEvents-NodeClick='<%# ClientInstanceName + "_cbpContactGroup_NodeClick" %>'>
                                <NodeTextTemplate>
                                    <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="height:14px; width:12px;" class="Padding5R">
                                                <div class='<%# Eval("Text").ToString().Split('|')[0] == "그룹웨어 주소록" ? "Icon1 ContactRoot" : "Icon1 ContactFolder" %>' style="width:18px; height:14px;"></div>
                                            </td>
                                            <td class="Padding5R popContact_Group_Text">
                                                <%# Eval("Text").ToString().Split('|')[0] %>
                                            </td>
                                            <td class="Font-Bold popContact_Group_Text">
                                                <%# Eval("Text").ToString().Split('|')[1] == "0" ? string.Empty : Eval("Text").ToString().Split('|')[1] %>
                                            </td>
                                        </tr>
                                    </table>
                                </NodeTextTemplate>
                            </eni:eniTreeView>
                        </dx:PanelContent>
                    </PanelCollection>
                </eni:eniCallbackPanel>
            </div>
            <div class="popContact_List_Wrap">
                <table class="Height100f NoScroll BorderClear Margin0 Padding0" style="width:268px;" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:40px;">
                        <td style="width:73px; padding:0 0 0 3px;">
                            <eni:eniCheckBox ID="chkAllSelected" ClientInstanceName="chkAllSelected" SkinID="Advanced-01" runat="server"
                                Text="전체선택" ToolTip="검색된 주소를 전부 선택 / 해지 합니다." Wrap="False"
                                ClientSideEvents-CheckedChanged='<%# ClientInstanceName + "_chkAllSelected_CheckedChanged" %>'>
                            </eni:eniCheckBox>
                        </td>
                        <td class="Padding5L" style="width:140px;">
                            <eni:eniTextBox ID="txtSearchText" ClientInstanceName="txtSearchText" SkinID="Advanced-01" runat="server"
                                Width="140px" ToolTip="이름 또는 주소를 입력하세요." AutoPostBack="false"
                                ClientSideEvents-KeyDown='<%# ClientInstanceName + "_txtSearchText_KeyDown" %>'>
                            </eni:eniTextBox>
                        </td>
                        <td class="Padding5L">
                            <eni:eniButton ID="btnSearch" ClientInstanceName="btnSearch" SkinID="Advanced-M-01" runat="server"
                                Text="검색" ToolTip="결과내에서 입력한 이름 또는 주소를 검색합니다."
                                ClientSideEvents-Click='<%# ClientInstanceName + "_btnSearch_Click" %>'>
                            </eni:eniButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="vertical-align:top;">
                            <eni:eniCallbackPanel ID="cbpContactList" ClientInstanceName="cbpContactList" SkinID="Advanced-01" runat="server"
                                Width="100%" Height="403px" ScrollBars="Auto"
                                OnCallback="cbpContactList_Callback">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <eni:eniListBox ID="lbContactList" ClientInstanceName="lbContactList" SkinID="Advanced-01" runat="server" 
                                            Width="268px" Height="403px" SelectionMode="CheckColumn" 
                                            ValueField="MAIL_DISPLAY_ADDR" TextField="MAIL_DISPLAY_ADDR" EnableCallbackMode="true"
                                            OnCallback="lbContactList_Callback">
                                            <BorderTop BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" />
                                            <BorderLeft BorderWidth="0px" />
                                            <BorderRight BorderWidth="0px" />
                                            <BorderBottom BorderWidth="0px" />
                                        </eni:eniListBox>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </eni:eniCallbackPanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popContact_Button_Wrap">
                <table class="Height100f NoScroll BorderClear MarginAuto Padding0" style="width:27px;" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:50%;">
                        <td class="VerticalAlignM">
                            <table class="NoScroll BorderClear MarginAuto Padding0" style="width:27px;" cellpadding="0" cellspacing="0" border="0">
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnToAdd" ClientInstanceName="btnToAdd" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                                            ToolTip="선택된 받는사람을 리스트에 추가합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnToAdd_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnToDel" ClientInstanceName="btnToDel" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                                            ToolTip="선택된 받는사람을 리스트에서 제거합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnToDel_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:25%;">
                        <td class="VerticalAlignM">
                            <table class="NoScroll BorderClear MarginAuto Padding0" style="width:27px;" cellpadding="0" cellspacing="0" border="0">
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnCcAdd" ClientInstanceName="btnCcAdd" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                                            ToolTip="선택된 참조자를 리스트에 추가합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnCcAdd_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnCcDel" ClientInstanceName="btnCcDel" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                                            ToolTip="선택된 참조자를 리스트에서 제거합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnCcDel_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:25%;">
                        <td class="VerticalAlignM">
                            <table class="NoScroll BorderClear MarginAuto Padding0" style="width:27px;" cellpadding="0" cellspacing="0" border="0">
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnBccAdd" ClientInstanceName="btnBccAdd" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                                            ToolTip="선택된 숨은 참조자를 리스트에 추가합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnBccAdd_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                                <tr style="height:26px;">
                                    <td>
                                        <eni:eniButton ID="btnBccDel" ClientInstanceName="btnBccDel" EnableTheming="false" runat="server"
                                            AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                                            ToolTip="선택된 숨은 참조자를 리스트에서 제거합니다."
                                            ClientSideEvents-Click='<%# ClientInstanceName + "_btnBccDel_Click" %>'>
                                            <Border BorderWidth="0px" />
                                        </eni:eniButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popContact_Address_Wrap">
                <table class="Height100f NoScroll BorderClear MarginAuto Padding0" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:210px;">
                        <td>
                            <div style="height:22px; padding:6px 0 3px;">
                                <span class="Font Font-Bold" style="font-size:11px;">받는사람</span>&nbsp;<eni:eniLabel runat="server" ClientInstanceName="lblToListCnt" Text="0" ForeColor="Silver"></eni:eniLabel>
                            </div>
                            <div style="height:183px;">
                                <eni:eniListBox ID="lbToList" ClientInstanceName="lbToList" SkinID="Advanced-01" runat="server" 
                                    Width="222px" Height="183px" SelectionMode="CheckColumn">
                                </eni:eniListBox>
                            </div>
                        </td>
                    </tr>
                    <tr style="height:111px;">
                        <td>
                            <div style="height:22px; padding:6px 0 3px;">
                                <span class="Font Font-Bold" style="font-size:11px;">참조</span>&nbsp;<eni:eniLabel runat="server" ClientInstanceName="lblCcListCnt" Text="0" ForeColor="Silver"></eni:eniLabel>
                            </div>
                            <div style="height:90px;">
                                <eni:eniListBox ID="lbCcList" ClientInstanceName="lbCcList" SkinID="Advanced-01" runat="server" 
                                    Width="222px" Height="89px" SelectionMode="CheckColumn">
                                </eni:eniListBox>
                            </div>
                        </td>
                    </tr>
                    <tr style="height:111px;" class="Padding5B">
                        <td>
                            <div style="height:22px; padding:6px 0 3px;">
                                <span class="Font Font-Bold" style="font-size:11px;">숨은참조</span>&nbsp;<eni:eniLabel runat="server" ClientInstanceName="lblBccListCnt" Text="0" ForeColor="Silver"></eni:eniLabel>
                            </div>
                            <div style="height:90px;">
                                <eni:eniListBox ID="lbBccList" ClientInstanceName="lbBccList" SkinID="Advanced-01" runat="server" 
                                    Width="222px" Height="89px" SelectionMode="CheckColumn">
                                </eni:eniListBox>
                            </div>
                        </td>
                    </tr>
                    <tr style="height:5px;"></tr>
                </table>
            </div>
            <div class="popContact_Action_Button_Wrap">
                <eni:eniButton ClientInstanceName="btnOk" SkinID="Advanced-M-01" runat="server"
                    Text="확인" ToolTip="선택된 주소를 저장합니다."
                    ClientSideEvents-Click='<%# ClientInstanceName + "_Btn_Click" %>'>
                </eni:eniButton>
                <eni:eniButton ClientInstanceName="btnCancel" SkinID="Advanced-M-01" runat="server" 
                    Text="취소" ToolTip="선택된 주소를 저장하지 않고 주소록 팝업을 닫습니다."
                    ClientSideEvents-Click='<%# ClientInstanceName + "_Btn_Click" %>'>
                </eni:eniButton>
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</eni:eniPopupControl>


<asp:PlaceHolder ID="lgContactBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        <%# ClientInstanceName %>.CallbackF = function (pArgs) { };
        <%# ClientInstanceName %>.cbpContactGroup     = ASPxClientCallbackPanel.Cast(cbpContactGroup);
        <%# ClientInstanceName %>.tvContactGroup      = ASPxClientTreeView.Cast(tvContactGroup);

        <%# ClientInstanceName %>.chkAllSelected      = ASPxClientCheckBox.Cast(chkAllSelected);
        <%# ClientInstanceName %>.txtSearchText       = ASPxClientTextBox.Cast(txtSearchText);
        <%# ClientInstanceName %>.lbContactList       = ASPxClientListBox.Cast(lbContactList);

        <%# ClientInstanceName %>.btnToAdd            = ASPxClientButton.Cast(btnToAdd);
        <%# ClientInstanceName %>.btnToDel            = ASPxClientButton.Cast(btnToDel);
        <%# ClientInstanceName %>.btnCcAdd            = ASPxClientButton.Cast(btnCcAdd);
        <%# ClientInstanceName %>.btnCcDel            = ASPxClientButton.Cast(btnCcDel);
        <%# ClientInstanceName %>.btnBccAdd           = ASPxClientButton.Cast(btnBccAdd);
        <%# ClientInstanceName %>.btnBccDel           = ASPxClientButton.Cast(btnBccDel);

        <%# ClientInstanceName %>.lblToListCnt        = ASPxClientLabel.Cast(lblToListCnt);
        <%# ClientInstanceName %>.lbToList            = ASPxClientListBox.Cast(lbToList);
        <%# ClientInstanceName %>.lblCcListCnt        = ASPxClientLabel.Cast(lblCcListCnt);
        <%# ClientInstanceName %>.lbCcList            = ASPxClientListBox.Cast(lbCcList);
        <%# ClientInstanceName %>.lblBccListCnt       = ASPxClientLabel.Cast(lblBccListCnt);
        <%# ClientInstanceName %>.lbBccList           = ASPxClientListBox.Cast(lbBccList);

        <%# ClientInstanceName %>.btnOk               = ASPxClientButton.Cast(btnOk);
        <%# ClientInstanceName %>.btnCancel           = ASPxClientButton.Cast(btnCancel);
        // 메세지 박스 디폴드 설정
        <%# ClientInstanceName %>.SetDefault = function () {
            var popContact = <%# ClientInstanceName %>;

            popContact.chkAllSelected.SetChecked(false);
            popContact.txtSearchText.SetValue("");
            popContact.lblToListCnt.SetText("0");
            popContact.lbToList.ClearItems();
            popContact.lblCcListCnt.SetText("0");
            popContact.lbCcList.ClearItems();
            popContact.lblBccListCnt.SetText("0");
            popContact.lbBccList.ClearItems();

            popContact.tvContactGroup.ExpandAll();
            popContact.tvContactGroup.SetSelectedNode(popContact.tvContactGroup.GetRootNode().GetNode(0));
            
            popContact.lbContactList.ClearItems();
        };

        <%# ClientInstanceName %>.ShowPopup = function (pJsonContactData, pCallbackF) {
            if (pJsonContactData) {
                if (pJsonContactData.ToList && pJsonContactData.ToList.length > 0) {
                    this.lbToList.BeginUpdate();
                    for (var i = 0; i < pJsonContactData.ToList.length; i++) {
                        var fToItem = this.lbToList.FindItemByValue(pJsonContactData.ToList[i]);
                        if (!fToItem && pJsonContactData.ToList[i] !== "") {
                            this.lbToList.AddItem(pJsonContactData.ToList[i], pJsonContactData.ToList[i]);
                        }
                    }
                    this.lblToListCnt.SetText(this.lbToList.GetItemCount());
                    this.lbToList.EndUpdate();
                }

                if (pJsonContactData.CCList && pJsonContactData.CCList.length > 0) {
                    this.lbCcList.BeginUpdate();
                    for (var i = 0; i < pJsonContactData.CCList.length; i++) {
                        var fToItem = this.lbToList.FindItemByValue(pJsonContactData.CCList[i]);
                        var fCCItem = this.lbCcList.FindItemByValue(pJsonContactData.CCList[i]);
                        if (!fToItem && !fCCItem && pJsonContactData.CCList[i] !== "") {
                            this.lbCcList.AddItem(pJsonContactData.CCList[i], pJsonContactData.CCList[i]);
                        }
                    }
                    this.lblCcListCnt.SetText(this.lbCcList.GetItemCount());
                    this.lbCcList.EndUpdate();
                }

                if (pJsonContactData.BCCList && pJsonContactData.BCCList.length > 0) {
                    this.lbBccList.BeginUpdate();
                    for (var i = 0; i < pJsonContactData.BCCList.length; i++) {
                        var fToItem = this.lbToList.FindItemByValue(pJsonContactData.BCCList[i]);
                        var fCCItem = this.lbCcList.FindItemByValue(pJsonContactData.BCCList[i]);
                        var fBCCItem = this.lbBccList.FindItemByValue(pJsonContactData.BCCList[i]);
                        if (!fToItem && !fCCItem && !fBCCItem && pJsonContactData.BCCList[i] !== "") {
                            this.lbBccList.AddItem(pJsonContactData.BCCList[i], pJsonContactData.BCCList[i]);
                        }
                    }
                    this.lblBccListCnt.SetText(this.lbBccList.GetItemCount());
                    this.lbBccList.EndUpdate();
                }
            }

            if (pCallbackF) {
                this.CallbackF = pCallbackF;
            }

            this.Show();

            var cocbArgs = new BaseCallbackArgsClass();
            cocbArgs.Cmd = "GROUP";

            cocbArgs.Data = new ContactListCallBackArgsClass();
            cocbArgs.Data.Lvl = "0";
            cocbArgs.Data.ContactGroupCd = "ALL";

            this.lbContactList.PerformCallback(JSON.stringify(cocbArgs));
        };
    </script>
</asp:PlaceHolder>