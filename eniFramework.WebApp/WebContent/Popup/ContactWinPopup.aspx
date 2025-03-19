<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="ContactWinPopup.aspx.cs" Inherits="eniFramework.WebApp.Popup.ContactWinPopup" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : 주소록 팝업
    *  2. Function Name        :
    *  3. Program ID           : ConteactWinPopup.aspx
    *  4. Program Name         : 주소록 팝업
    *  5. Program Desc         : 주소록 팝업
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2014-07-25
    *  8. Modified date(Last)  : 2017-09-26
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
        tvContactGroup = ASPxClientTreeView.Cast();
        lbContactList = ASPxClientListBox.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .cnt {
            font-family:Tahoma;
            font-size:11px;
            font-weight:700;
            color:blue;
        }
        .contactwinpopup .con_header,
        .contactwinpopup .con_content,
        .contactwinpopup .con_footer {
            min-width:700px;
        }
        .contactwinpopup .con_header {
            border-bottom:1px solid #e9eaec;
            background-color: #fff;
            height:42px;
            overflow:hidden;
            z-index:30;
        }
        .contactwinpopup .con_header h1 {
            font-size:14px;
            padding:14px 0 0 18px;
            display:block;
            font-weight:bold;
        }
        .contactwinpopup .con_content::after {
            display:block;
            clear:both;
            height:0px;
            content:"";
            visibility:hidden;
        }
        .contactwinpopup .con_content {
            padding:0px;
            bottom:50px;
            z-index:20;
            min-height:370px;
            max-width:1024px;
            position:absolute;
            top:43px;
            left:0px;
            right:0px;
            overflow:auto;
            _height:390px;
            _overflow:hidden;
            _position:static;
            overflow:hidden;
        }
        .contactwinpopup .con_footer {
            z-index:10;
            text-align:right;
            position:absolute;
            bottom:0px;
            left:0px;
            right:0px;
            min-height:50px;
            max-width:1024px;
            background:#fff;
            _position:relative;
            _top:0;
            _clear:both;
        }
        .contactwinpopup .con_content .con_group,
        .contactwinpopup .con_content .con_list,
        .contactwinpopup .con_content .con_to_list_control,
        .contactwinpopup .con_content .con_to_list {
            position:absolute;
            bottom:0px;
            _float:left;
            _height:100%;
            _position:relative;
            _top:0px;
            _left:0px;
            _bottom:0px;
            _right:0px;
        }
        .contactwinpopup .con_content .con_group {
            left:0px;
            top:0px;
            right:73.2%;
            padding-right:13px;
            _width:201px;
            
        }
        .contactwinpopup .con_content .con_group .recent {
            position:absolute;
            top:0px;
            padding-left:10px;
        }
        .contactwinpopup .con_content .con_group .recent .recent_list {
            margin-bottom:10px;
            padding-top:15px;
            vertical-align:top;
        }
        .contactwinpopup .con_content .con_group .recent .sent_list {
            
        }
        .contactwinpopup .con_content .con_group .groups {
            position:absolute;
            top:67px;
            width:100%;
            bottom:0px;
            border-top: 1px solid #e9eaec;
            overflow:auto;
        }
        .contactwinpopup .con_content .con_list {
            left:26.8%;
            top:0px;
            right:27.8%;
            padding-right:13px;
            border:1px solid #e9eaec;
            border-top:0px;
            z-index:30;
            bottom:0px;
            _width:260px;
        }
        .contactwinpopup .con_content .con_list .search_bar {
            padding:6px 2px;
            zoom:1;
            height:23px;
            width:100%;
        }
        .contactwinpopup .con_content .con_list .addr_list {
            border-top: 1px solid #e9eaec;
            position:absolute;
            top:34px;
            bottom:0px;
            left:0px;
            right:0px;
            overflow:hidden;
            _height:286px;
        }
        .contactwinpopup .con_content .con_to_list_control {
            width:auto;
            height:100%;
            left:72.2%;
            right:22.8%;
            bottom:0px;
            border-bottom: 1px solid #e9eaec;
            _width:260px;
        }
        .contactwinpopup .con_content .con_to_list {
            width:auto;
            height:100%;
            left:77.2%;
            right:0.5%;
            bottom:0px;
            border-bottom: 1px solid #e9eaec;
            _width:260px;
        }
        .contactwinpopup .con_content .con_to_list .field_to,
        .contactwinpopup .con_content .con_to_list .field_cc,
        .contactwinpopup .con_content .con_to_list .field_bcc {
            position:absolute;
            padding-top:5px;
            left:0px;
            right:0px;
            top:0px;
            bottom:50%;
            _width:202px;
        }
        .contactwinpopup .con_content .con_to_list h3 {
            padding-top:0px;
            font-size:12px;
        }
        .contactwinpopup .con_content .con_to_list .field_to .list_container {
            position:absolute;
            top:22px;
            left:0px;
            right:0px;
            bottom:0px;
            _height:175px;
        }
        .contactwinpopup .con_content .con_to_list .field_cc {
            top:50%;
            bottom:25%;
        }
        .contactwinpopup .con_content .con_to_list .field_cc .list_container {
            position:absolute;
            top:22px;
            left:0px;
            right:0px;
            bottom:0px;
            _height:175px;
        }
        .contactwinpopup .con_content .con_to_list .field_bcc {
            top:75%;
            bottom:5px;
        }
        .contactwinpopup .con_content .con_to_list .field_bcc .list_container {
            position:absolute;
            top:22px;
            left:0px;
            right:0px;
            bottom:0px;
            _height:175px;
        }
        .contactwinpopup .con_footer p {
            font-size:11px;
            color:#999;
            margin:4px 0 4px 8px;
            padding-left:5px;
            text-align:left;
            line-height:14px;
        }
    </style>
    <script type="text/javascript">
        try {
            var ConteactWinPopup = eni.Initialize(new function () {
                var $to_cnt = $();
                var $cc_cnt = $();
                var $bcc_cnt = $();
                this.Title = eni.GetTitle() + "<%= GetResource("CSTRESX00000") + " - " + GetGlobalResource("QuickName") %>";
                this.ViewType = ViewType.PopupView;

                //폼 로드시 발생합니다.
                this.Form_Load = function () {
                    try {
                        $to_cnt = $("#field_to .cnt");
                        $cc_cnt = $("#field_cc .cnt");
                        $bcc_cnt = $("#field_bcc .cnt");
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 로드 완료후 발생합니다.
                this.Form_Load_Complate = function () {
                    try {
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };

                //폼 언 로드 되기전 발생합니다.
                this.Before_Form_UnLoad = function () {
                    try {

                        return true;
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                        return false;
                    }
                };
                this.SetLocalDefaultValue = function () {
                    args = window.getDialogArguments();

                    try {
                        if (args) {
                            if (args.ToList && args.ToList.length > 0) {
                                for (var i = 0; i < args.ToList.length ; i++) {
                                    lbToList.AddItem(args.ToList[i]);
                                }
                                //args.ToList.each(function (i, item) {
                                //    lbToList.AddItem(item);
                                //});
                                $to_cnt.text(lbToList.GetItemCount());
                            }
                            if (args.CcList && args.CcList.length > 0) {
                                for (var i = 0; i < args.CcList.length ; i++) {
                                    lbCcList.AddItem(args.CcList[i]);
                                }
                                //args.CCList.each(function (i, item) {
                                //    lbCcList.AddItem(item);
                                //});
                                $cc_cnt.text(lbCcList.GetItemCount());
                            }
                            if (args.BccList) {
                                for (var i = 0; i < args.BccList.length ; i++) {
                                    lbBccList.AddItem(args.BccList[i]);
                                }
                                //args.BCCList.each(function (i, item) {
                                //    lbBccList.AddItem(item);
                                //});
                                $bcc_cnt.text(lbBccList.GetItemCount());
                            }
                        }
                    } catch (ex) {
                        //eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.hyRecentWeek_Click = function (s, e) {
                    var cb_args = new BaseCallbackArgsClass();
                    cb_args.Cmd = "recent_week";
                    lbContactList.PerformCallback(cb_args.Serialize());
                };
                this.hySentHist_Click = function (s, e) {
                    var cb_args = new BaseCallbackArgsClass();
                    cb_args.Cmd = "recent_hist";
                    lbContactList.PerformCallback(cb_args.Serialize());
                };
                this.tvContactGroup_NodeClick = function (s, e) {
                    var cb_args = new BaseCallbackArgsClass();
                    var arr = e.node.name.split("|");
                    cb_args.Cmd = "group";
                    cb_args.lvl = arr[0];
                    cb_args.group_cd = arr[1];
                    cb_args.type = arr[2];;
                    lbContactList.PerformCallback(cb_args.Serialize());
                };
                this.cbpContactGroup_BeginCallback = function (s, e) {
                    try {
                        lbContactList.ClearItems();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.cbpContactGroup_EndCallback = function (s, e) {
                    try {
                        var cb_args = new BaseCallbackArgsClass();
                        cb_args.Cmd = "group";
                        cb_args.Data.Lvl = "0";
                        cb_args.group_cd = "all";
                        cb_args.type = "";
                        lbContactList.PerformCallback(cb_args.Serialize());
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
                this.chkAllSelected_CheckedChanged = function (s, e) {
                    if (chkAllSelected.GetChecked()) {
                        lbContactList.SelectAll();
                    } else {
                        lbContactList.UnselectAll();
                    }
                };
                this.txtSearchText_KeyDown = function (s, e) {
                    switch(e.htmlEvent.keyCode){
                        case 13:
                            var cb_args = new BaseCallbackArgsClass();
                            cb_args.Cmd = "search";
                            cb_args.Data = txtSearchText.GetValue();
                            lbContactList.PerformCallback(cb_args.Serialize());
                            break;
                    }
                    chkAllSelected.SetChecked(false);
                };
                this.btnSearch_Click = function (s, e) {
                    var cb_args = new BaseCallbackArgsClass();
                    cb_args.Cmd = "search";
                    cb_args.Data = txtSearchText.GetValue();
                    lbContactList.PerformCallback(cb_args.Serialize());
                    chkAllSelected.SetChecked(false);
                };
                this.btnToAdd_Click = function (s, e) {
                    try{
                        var selectItems = lbContactList.GetSelectedItems();
                
                        if (selectItems.length === 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbToList.BeginUpdate();
                        lbCcList.BeginUpdate();
                        lbBccList.BeginUpdate();
                        for (var i = 0; i < selectItems.length; i++) {
                            var fItem = lbToList.FindItemByValue(selectItems[i].value);
                            if (!fItem) {
                                var fCCItem = lbCcList.FindItemByValue(selectItems[i].value);
                                var fBCCItem = lbBccList.FindItemByValue(selectItems[i].value);
                                if (fCCItem) {
                                    lbCcList.RemoveItem(fCCItem.index);
                                }
                                if (fBCCItem) {
                                    lbBccList.RemoveItem(fBCCItem.index);
                                }
                                lbToList.AddItem(selectItems[i].text, selectItems[i].value);
                            }
                        }
                        $to_cnt.text(lbToList.GetItemCount());
                        $cc_cnt.text(lbCcList.GetItemCount());
                        $bcc_cnt.text(lbBccList.GetItemCount());
                        lbToList.EndUpdate();
                        lbCcList.EndUpdate();
                        lbBccList.EndUpdate();

                        lbContactList.UnselectItems();

                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };
                this.btnToDel_Click = function (s, e) {
                    try {
                        var selectItems = lbToList.GetSelectedItems();

                        if (selectItems.length == 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbToList.BeginUpdate();
                        for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                            lbToList.RemoveItem(selectItems[i].index);
                        }
                        $to_cnt.text(lbToList.GetItemCount());
                        lbToList.EndUpdate();

                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };
                this.btnCcAdd_Click = function (s, e) {
                    try {
                        var selectItems = lbContactList.GetSelectedItems();

                        if (selectItems.length === 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbCcList.BeginUpdate();
                        lbToList.BeginUpdate();
                        lbBccList.BeginUpdate();
                        for (var i = 0; i < selectItems.length; i++) {
                            var fItem = lbCcList.FindItemByValue(selectItems[i].value);
                            if (!fItem) {
                                var fToItem = lbToList.FindItemByValue(selectItems[i].value);
                                var fBCCItem = lbBccList.FindItemByValue(selectItems[i].value);
                                if (fToItem) {
                                    lbToList.RemoveItem(fToItem.index);
                                }
                                if (fBCCItem) {
                                    lbBccList.RemoveItem(fBCCItem.index);
                                }
                                lbCcList.AddItem(selectItems[i].text, selectItems[i].value);
                            }
                        }
                        $to_cnt.text(lbToList.GetItemCount());
                        $cc_cnt.text(lbCcList.GetItemCount());
                        $bcc_cnt.text(lbBccList.GetItemCount());
                        lbCcList.EndUpdate();
                        lbToList.EndUpdate();
                        lbBccList.EndUpdate();

                        lbContactList.UnselectItems();

                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };

                this.btnCcDel_Click = function (s, e) {
                    try {
                        var selectItems = lbCcList.GetSelectedItems();

                        if (selectItems.length === 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbCcList.BeginUpdate();
                        for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                            lbCcList.RemoveItem(selectItems[i].index);
                        }
                        $cc_cnt.text(lbCcList.GetItemCount());
                        lbCcList.EndUpdate();

                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };
                this.btnBccAdd_Click = function (s, e) {
                    try {
                        var selectItems = lbContactList.GetSelectedItems();

                        if (selectItems.length === 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbBccList.BeginUpdate();
                        lbToList.BeginUpdate();
                        lbCcList.BeginUpdate();
                        for (var i = 0; i < selectItems.length; i++) {
                            var fItem = lbBccList.FindItemByValue(selectItems[i].value);
                            if (!fItem) {
                                var fToItem = lbToList.FindItemByValue(selectItems[i].value);
                                var fCCItem = lbCcList.FindItemByValue(selectItems[i].value);
                                if (fToItem) {
                                    lbToList.RemoveItem(fToItem.index);
                                }
                                if (fCCItem) {
                                    lbCcList.RemoveItem(fCCItem.index);
                                }
                                lbBccList.AddItem(selectItems[i].text, selectItems[i].value);
                            }
                        }
                        $to_cnt.text(lbToList.GetItemCount());
                        $cc_cnt.text(lbCcList.GetItemCount());
                        $bcc_cnt.text(lbBccList.GetItemCount());
                        lbBccList.EndUpdate();
                        lbToList.EndUpdate();
                        lbCcList.EndUpdate();
                        lbContactList.UnselectItems();
                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };

                this.btnBccDel_Click = function (s, e) {
                    try {
                        var selectItems = lbBccList.GetSelectedItems();

                        if (selectItems.length === 0) {
                            if (eni && eni.Message) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "common.popup.noselectitem");
                                return;
                            } else {
                                return;
                            }
                        }

                        lbBccList.BeginUpdate();
                        for (var i = selectItems.length - 1; i >= 0; i = i - 1) {
                            lbBccList.RemoveItem(selectItems[i].index);
                        }
                        $bcc_cnt.text(lbBccList.GetItemCount());
                        lbBccList.EndUpdate();

                        chkAllSelected.SetChecked(false);
                    } catch (ex) {
                        alert(ex.message);
                    }
                };
                this.btnOk_Click = function (s, e) {
                    var retData = {
                        DialogResult: DialogResult.Ok,
                    };
                    if (lbToList.GetItemCount() > 0) {
                        retData.ToList = [];
                        for (var i = 0; i < lbToList.GetItemCount() ; i++) {
                            retData.ToList[i] = lbToList.GetItem(i).value;
                        }
                    }
                    if (lbCcList.GetItemCount() > 0) {
                        retData.CcList = [];
                        for (var i = 0; i < lbCcList.GetItemCount() ; i++) {
                            retData.CcList[i] = lbCcList.GetItem(i).value;
                        }
                    }
                    if (lbBccList.GetItemCount() > 0) {
                        retData.BccList = [];
                        for (var i = 0; i < lbBccList.GetItemCount() ; i++) {
                            retData.BccList[i] = lbBccList.GetItem(i).value;
                        }
                    }
                    eni.LocalPage.Return(retData);
                };
                this.btnClose_Click = function (s, e) {
                    eni.LocalPage.Return({ DialogResult: DialogResult.Cancel });
                };
                this.Return = function (retData) {
                    try {
                        window.setReturnValue(retData);
                        self.close();
                    } catch (ex) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    }
                };
            });
        } catch (ex) {
            eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
        };
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <div id="con_header" class="con_header">
        <h1>
            <span><%=GetResource("CSTRESX00001") %></span>
        </h1>
    </div>
    <div id="con_content" class="con_content">
        <div id="con_group" class="con_group">
            <ul class="recent">
                <li class="recent_list">
                    <eni:eniHyperLink ID="hyRecentWeek" ClientInstanceName="hyRecentWeek" SkinID="Advanced-01" runat="server"
                        Font-Size="11px" Text="최근 사용한 주소" ToolTip="" Font-Bold="true">
                        <ClientSideEvents Click="eni.LocalPage.hyRecentWeek_Click" />
                    </eni:eniHyperLink>
                </li>
                <li class="sent_list">
                    <eni:eniHyperLink ID="hySentHist" ClientInstanceName="hySentHist" SkinID="Advanced-01" runat="server"
                        Font-Size="11px" Text="자주 사용하는 주소" ToolTip="" Font-Bold="true">
                        <ClientSideEvents Click="eni.LocalPage.hySentHist_Click" />
                    </eni:eniHyperLink>
                </li>
            </ul>
            <div class="groups">
                <eni:eniCallbackPanel ID="cbpContactGroup" ClientInstanceName="cbpContactGroup" SkinID="Advanced-01" runat="server"
                    Width="100%" Height="100%" OnCallback="cbpContactGroup_Callback">
                    <ClientSideEvents BeginCallback="eni.LocalPage.cbpContactGroup_BeginCallback"
                                            EndCallback="eni.LocalPage.cbpContactGroup_EndCallback" />
                    <Paddings PaddingTop="5px" />
                    <PanelCollection>
                        <dx:PanelContent>
                            <eni:eniTreeView ID="tvContactGroup" ClientInstanceName="tvContactGroup" SkinID="Advanced-01" runat="server" 
                                AllowSelectNode="true">
                                <ClientSideEvents NodeClick="eni.LocalPage.tvContactGroup_NodeClick" />
                                <NodeTextTemplate>
                                    <table class="FullScreen NoScroll BorderClear Margin0 Padding0" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="height:14px; width:12px;" class="Padding5R">
                                                <div class='<%# Eval("Text").ToString().Substring(0, Eval("Text").ToString().LastIndexOf("|")) == GetResource("CSTRESX00004") ? "Icon1 ContactRoot" : "Icon1 ContactFolder" %>' style="width:18px; height:14px;"></div>
                                            </td>
                                            <td class="Padding5R popContact_Group_Text">
                                                <%# Eval("Text").ToString().Substring(0, Eval("Text").ToString().LastIndexOf("|")) %>
                                            </td>
                                            <td class="Font-Bold popContact_Group_Text">
                                                <%# Eval("Text").ToString().Substring(Eval("Text").ToString().LastIndexOf("|") + 1, Eval("Text").ToString().Length - (Eval("Text").ToString().LastIndexOf("|") + 1)) == "0" ? string.Empty : Eval("Text").ToString().Substring(Eval("Text").ToString().LastIndexOf("|") + 1, Eval("Text").ToString().Length - (Eval("Text").ToString().LastIndexOf("|") + 1)) %>
                                            </td>
                                        </tr>
                                    </table>
                                </NodeTextTemplate>
                            </eni:eniTreeView>
                        </dx:PanelContent>
                    </PanelCollection>
                </eni:eniCallbackPanel>
            </div>
        </div>
        <div id="con_list" class="con_list">
            <div class="search_bar">
                <eni:eniCheckBox ID="chkAllSelected" ClientInstanceName="chkAllSelected" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                    Text="전체선택" ToolTip="검색된 주소를 전부 선택 / 해지 합니다." Wrap="False" style="padding-top:3px;">
                    <ClientSideEvents CheckedChanged="eni.LocalPage.chkAllSelected_CheckedChanged" />
                </eni:eniCheckBox>
                <div style="position:absolute; left:82px; right:72px; width:auto; display:inline-block;">
                    <eni:eniTextBox ID="txtSearchText" ClientInstanceName="txtSearchText" runat="server" SkinID="LightDark"
                        Width="100%" ToolTip="이름 또는 주소를 입력하세요." AutoPostBack="false" >
                        <ClientSideEvents KeyDown="eni.LocalPage.txtSearchText_KeyDown" />
                    </eni:eniTextBox>
                </div>
                <eni:eniButton ID="btnSearch" ClientInstanceName="btnSearch" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
                    Height="22px" Text="검색" ToolTip="결과내에서 입력한 이름 또는 주소를 검색합니다." VerticalAlign="top" style="float:right">
                    <ClientSideEvents Click="eni.LocalPage.btnSearch_Click" />
                </eni:eniButton>
            </div>
            <div class="addr_list">
                <eni:eniListBox ID="lbContactList" ClientInstanceName="lbContactList" SkinID="Advanced-01" runat="server" 
                    Width="100%" Height="100%" SelectionMode="CheckColumn"
                    ValueField="MAIL_DISPLAY_ADDR" TextField="MAIL_DISPLAY_ADDR" EnableCallbackMode="true"
                    OnCallback="lbContactList_Callback"
                    OnItemRowPrepared="lbContactList_ItemRowPrepared">
                    <BorderTop BorderWidth="0px"/>
                    <BorderLeft BorderWidth="0px" />
                    <BorderRight BorderWidth="0px" />
                    <BorderBottom BorderWidth="0px" />
                </eni:eniListBox>
            </div>
        </div>
        <div id="con_to_list_control" class="con_to_list_control">
            <eni:eniButton ID="btnToAdd" ClientInstanceName="btnToAdd" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                ToolTip="선택된 받는사람을 리스트에 추가합니다." style="position:absolute; top:24%; left:22%; margin-top:-12px;">
                <ClientSideEvents Click="eni.LocalPage.btnToAdd_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
            <eni:eniButton ID="btnToDel" ClientInstanceName="btnToDel" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                ToolTip="선택된 받는사람을 리스트에서 제거합니다." style="position:absolute; top:24%; left:22%; margin-top:12px;">
                <ClientSideEvents Click="eni.LocalPage.btnToDel_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
            <eni:eniButton ID="btnCcAdd" ClientInstanceName="btnCcAdd" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                ToolTip="선택된 참조자를 리스트에 추가합니다." style="position:absolute; top:62%; left:22%; margin-top:-12px;">
                <ClientSideEvents Click="eni.LocalPage.btnCcAdd_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
            <eni:eniButton ID="btnCcDel" ClientInstanceName="btnCcDel" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                ToolTip="선택된 참조자를 리스트에서 제거합니다." style="position:absolute; top:62%; left:22%; margin-top:12px;">
                <ClientSideEvents Click="eni.LocalPage.btnCcDel_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
            <eni:eniButton ID="btnBccAdd" ClientInstanceName="btnBccAdd" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowRight" Width="26px" Height="21px"
                ToolTip="선택된 숨은 참조자를 리스트에 추가합니다." style="position:absolute; top:87%; left:22%; margin-top:-12px;">
                <ClientSideEvents Click="eni.LocalPage.btnBccAdd_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
            <eni:eniButton ID="btnBccDel" ClientInstanceName="btnBccDel" EnableTheming="false" runat="server"
                AutoPostBack="false" UseSubmitBehavior="false" CssClass="Icon1 ArrowLeft" Width="26px" Height="21px"
                ToolTip="선택된 숨은 참조자를 리스트에서 제거합니다." style="position:absolute; top:87%; left:22%; margin-top:12px;">
                <ClientSideEvents Click="eni.LocalPage.btnBccDel_Click" />
                <Border BorderWidth="0px" />
            </eni:eniButton>
        </div>
        <div id="con_to_list" class="con_to_list">
            <div id="field_to" class="field_to">
                <h3><%= GetResource("CSTRESX00007") %> <em class="cnt">0</em></h3>
                <div class="list_container">
                    <eni:eniListBox ID="lbToList" ClientInstanceName="lbToList" SkinID="Advanced-01" runat="server" 
                        Width="100%" Height="100%" SelectionMode="CheckColumn" RootStyle-Wrap="True">
                        <Border BorderColor="#e9eaec" BorderWidth="1px" BorderStyle="Solid" />
                    </eni:eniListBox>
                </div>
            </div>
            <div id="field_cc" class="field_cc">
                <h3><%= GetResource("CSTRESX00008") %> <em class="cnt">0</em></h3>
                <div class="list_container">
                    <eni:eniListBox ID="lbCcList" ClientInstanceName="lbCcList" SkinID="Advanced-01" runat="server" 
                        Width="100%" Height="100%" SelectionMode="CheckColumn" RootStyle-Wrap="True">
                        <Border BorderColor="#e9eaec" BorderWidth="1px" BorderStyle="Solid" />
                    </eni:eniListBox>
                </div>
            </div>
            <div id="field_bcc" class="field_bcc">
                <h3><%= GetResource("CSTRESX00009") %> <em class="cnt">0</em></h3>
                <div class="list_container">
                    <eni:eniListBox ID="lbBccList" ClientInstanceName="lbBccList" SkinID="Advanced-01" runat="server" 
                        Width="100%" Height="100%" SelectionMode="CheckColumn" RootStyle-Wrap="True">
                        <Border BorderColor="#e9eaec" BorderWidth="1px" BorderStyle="Solid" />
                    </eni:eniListBox>
                </div>
            </div>
        </div>
    </div>
    <div id="con_footer" class="con_footer">
        <p><%= GetResource("CSTRESX00010") %> </p>
        <eni:eniButton ID="btnOk" ClientInstanceName="btnOk" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
            Height="22px" Font-Size="11px" Font-Bold="true" style="padding-top:4px;"
            Text="확인" ToolTip="선택된 주소를 저장합니다.">
            <ClientSideEvents Click="eni.LocalPage.btnOk_Click" />
        </eni:eniButton>
        <eni:eniButton ID="btnCancel" ClientInstanceName="btnCancel" runat="server" SkinID="LightDark" CssClass="DisplayInlineBlock"
            Height="22px" Font-Size="11px" style="padding-top:4px; margin-right:5px;"
            Text="취소" ToolTip="선택된 주소를 저장하지 않고 주소록 팝업을 닫습니다.">
            <ClientSideEvents Click="eni.LocalPage.btnClose_Click" />
        </eni:eniButton>
    </div>

    <eni:eniCallback ID="vspdDataCbProcess" ClientInstanceName="vspdDataCbProcess" runat="server" CreateMode="StandardMode">
        <ClientSideEvents  BeginCallback="eni.LocalPage.vspdDataCbProcess_BeginCallback" 
            CallbackComplete="eni.LocalPage.vspdDataCbProcess_CallbackComplete" 
            CallbackError="eni.LocalPage.vspdDataCbProcess_CallbackError" />
    </eni:eniCallback>
</asp:Content>
