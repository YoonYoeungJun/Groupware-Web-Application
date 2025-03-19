<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="eniFramework.WebApp.Modules.AdminView" Theme="eniThm" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : View
    *  2. Function Name        :
    *  3. Program ID           : MainView.aspx
    *  4. Program Name         : MainView 페이지
    *  5. Program Desc         : MainView 페이지
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
        spLayout        = ASPxClientSplitter.Cast();
        tvModuleMenu    = ASPxClientTreeView.Cast();
        mnToolbar       = ASPxClientMenu.Cast();
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
    </style>
    <script type="text/javascript">
        var MainView = eni.Initialize(new function () {
            var $mainView_ = $;
            var $conMenuLogo_ = $;
            var $conMenu_ = $;

            var disableToolbar = false;
            var toolbarStatus = "";
            var curPgNm = "Home";

            this.iFrameName = "ModuleView";
            this.ViewType = ViewType.View;
            this.Form_Load = function () {
                
            };
            this.Form_Load_Complate = function () {

            };

            this.mnToolbar_Click = function (s, e) {
                try {
                    switch (e.item.name) {
                        case "Menu": //메뉴 접기/펼침
                            var pane = spLayout.GetPaneByName("leftMenu");
                            if (pane.IsCollapsed()) {
                                pane.Expand();
                            } else {
                                pane.CollapseBackward();
                            }
                            break;
                        case "Home": //메인 바로가기
                            var runHome = function () {
                                eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00101"));

                                eni.SetToolbar("0000000000000000");

                                eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>dashboard");

                                curPgNm = "Home";
                            };

                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runHome();
                                    }
                                });
                            } else {
                                runHome();
                            }
                            break;
                        case "MenuList": //메뉴 리스트 보이기
                            break;
                        case "Query":
                            var runQuery = function () {
                                if (eni.BaseOnFncQuery) {
                                    eni.BaseOnFncQuery();
                                }
                            };
                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runQuery();
                                    }
                                });
                            } else {
                                runQuery();
                            }
                            break;
                        case "New":
                            var runNew = function () {
                                if (eni.BaseOnFncNew) {
                                    eni.BaseOnFncNew();
                                }
                            };

                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runNew();
                                    }
                                });
                            } else {
                                runNew();
                            }
                            break;
                        case "Delete":
                            var runDelete = function () {
                                if (eni.BaseOnFncDelete) {
                                    eni.BaseOnFncDelete();
                                }
                            };

                            eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00125", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                if (pDialogResult === DialogResult.Yes) {
                                    runDelete();
                                }
                            });
                            break;
                        case "Save":
                            if (!eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00110");
                            } else {
                                if (eni.BaseOnFncSave) {
                                    eni.BaseOnFncSave();
                                }
                            }
                            break;
                        case "Refresh":
                            var runRefresh = function () {
                                if (eni.BaseOnFncRefresh) {
                                    eni.BaseOnFncRefresh();
                                }
                            };

                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runRefresh();
                                    }
                                });
                            } else {
                                runRefresh();
                            }
                            break;
                        case "Cancel":
                            var subWind = eni.getSubPage().window;
                            if (subWind.lgActiveSpread) {
                                ggoSpread.Source = subWind.lgActiveSpread;
                                if (ggoSpread.GetRowCounts() > 0) {
                                    if (eni.BaseOnFncCancel) {
                                        eni.BaseOnFncCancel();
                                    }
                                } else {
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00103");
                                }
                            }
                            break;
                        case "Prev":
                            var runPrev = function () {
                                if (eni.BaseOnFncFrev) {
                                    eni.BaseOnFncFrev();
                                }
                            };
                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runPrev();
                                    }
                                });
                            } else {
                                runPrev();
                            }
                            break;
                        case "Next":
                            var runNext = function () {
                                if (eni.BaseOnFncNext) {
                                    eni.BaseOnFncNext();
                                }
                            };
                            if (eni.LocalPage.getSubPageDataChange()) {
                                eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00102", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                                    if (pDialogResult === DialogResult.Yes) {
                                        runNext();
                                    }
                                });
                            } else {
                                runNext();
                            }
                            break;
                        case "InsertRow":
                            if (eni.BaseOnFncInsertRow) {
                                eni.BaseOnFncInsertRow();
                            }
                            break;
                        case "DeleteRow":
                            var subWind = eni.getSubPage().window;
                            if (subWind.lgActiveSpread) {
                                ggoSpread.Source = subWind.lgActiveSpread;
                                if (ggoSpread.GetRowCounts() > 0) {
                                    if (eni.BaseOnFncDeleteRows) {
                                        eni.BaseOnFncDeleteRows();
                                    }
                                } else {
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00103");
                                }
                            }
                            break;
                        case "CopyRow":
                            var subWind = eni.getSubPage().window;
                            if (subWind.lgActiveSpread) {
                                ggoSpread.Source = subWind.lgActiveSpread;
                                if (ggoSpread.GetRowCounts() > 0) {
                                    if (eni.BaseOnFncCopyRow) {
                                        eni.BaseOnFncCopyRow();
                                    }
                                } else {
                                    eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00103");
                                }
                            }
                            break;
                        case "Export":
                            if (eni.BaseOnFncExport) {
                                eni.BaseOnFncExport();
                            }
                            break;
                        case "Print":
                            if (eni.BaseOnFncPrint) {
                                eni.BaseOnFncPrint();
                            }
                            break;
                        case "Help":
                            if (eni.BaseOnFncHelp) {
                                eni.BaseOnFncHelp();
                            }
                            break;
                        case "Settings":
                            if (eni.BaseOnFncSettings) {
                                eni.BaseOnFncSettings();
                            }
                            break;
                        case "RegisterLang":
                            
                            var args = {
                                WinSize: new WindowSize(780, 400)
                            };
                            eni.Popup.ShowWinModalPopup("<%=lgUrlInfo.VirtualPath%>webContent/popup/registerlangwinpopup.aspx", args);
                            break;
                        default: break;
                    }
                } catch (ex) {
                    if (eni.Message) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };

            this.SetToolbar = function (pToolbalArgs) {
                if (disableToolbar) {
                    return;
                }

                try {
                    //Query
                    if (pToolbalArgs[0] === "1") {
                        mnToolbar.GetItemByName("Query").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Query").SetEnabled(false);
                    }
                    //New
                    if (pToolbalArgs[1] === "1") {
                        mnToolbar.GetItemByName("New").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("New").SetEnabled(false);
                    }
                    //Delete
                    if (pToolbalArgs[2] === "1") {
                        mnToolbar.GetItemByName("Delete").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Delete").SetEnabled(false);
                    }
                    //Save
                    if (pToolbalArgs[3] === "1") {
                        mnToolbar.GetItemByName("Save").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Save").SetEnabled(false);
                    }
                    //Refresh
                    if (pToolbalArgs[4] === "1") {
                        mnToolbar.GetItemByName("Refresh").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Refresh").SetEnabled(false);
                    }
                    //Cancel
                    if (pToolbalArgs[5] === "1") {
                        mnToolbar.GetItemByName("Cancel").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Cancel").SetEnabled(false);
                    }
                    //Prev
                    if (pToolbalArgs[6] === "1") {
                        mnToolbar.GetItemByName("Prev").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Prev").SetEnabled(false);
                    }
                    //Next
                    if (pToolbalArgs[7] === "1") {
                        mnToolbar.GetItemByName("Next").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Next").SetEnabled(false);
                    }
                    //InsertRow
                    if (pToolbalArgs[8] === "1") {
                        mnToolbar.GetItemByName("InsertRow").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("InsertRow").SetEnabled(false);
                    }
                    //DeleteRow
                    if (pToolbalArgs[9] === "1") {
                        mnToolbar.GetItemByName("DeleteRow").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("DeleteRow").SetEnabled(false);
                    }
                    //CopyRow
                    if (pToolbalArgs[10] === "1") {
                        mnToolbar.GetItemByName("CopyRow").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("CopyRow").SetEnabled(false);
                    }
                    //Export
                    if (pToolbalArgs[11] === "1") {
                        mnToolbar.GetItemByName("Export").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Export").SetEnabled(false);
                    }
                    //Print
                    if (pToolbalArgs[12] === "1") {
                        mnToolbar.GetItemByName("Print").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Print").SetEnabled(false);
                    }
                    //Print
                    if (pToolbalArgs[13] === "1") {
                        mnToolbar.GetItemByName("Print").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Print").SetEnabled(false);
                    }
                    //Help
                    if (pToolbalArgs[14] === "1") {
                        mnToolbar.GetItemByName("Help").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Help").SetEnabled(false);
                    }
                    //Settings
                    if (pToolbalArgs[15] === "1") {
                        mnToolbar.GetItemByName("Settings").SetEnabled(true);
                    } else {
                        mnToolbar.GetItemByName("Settings").SetEnabled(false);
                    }
                } catch (ex) {
                    if (eni.Log) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "MainView.SetToolbar");
                    }
                }
            };

            this.DisableToolBar = function () {
                if (disableToolbar) {
                    return;
                }

                var curToolbarStatus = "";

                try {
                    //Query
                    if (mnToolbar.GetItemByName("Query").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //New
                    if (mnToolbar.GetItemByName("New").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Delete
                    if (mnToolbar.GetItemByName("Delete").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Save
                    if (mnToolbar.GetItemByName("Save").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Refresh
                    if (mnToolbar.GetItemByName("Refresh").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Cancel
                    if (mnToolbar.GetItemByName("Cancel").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Prev
                    if (mnToolbar.GetItemByName("Prev").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Next
                    if (mnToolbar.GetItemByName("Next").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //InsertRow
                    if (mnToolbar.GetItemByName("InsertRow").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //DeleteRow
                    if (mnToolbar.GetItemByName("DeleteRow").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //CopyRow
                    if (mnToolbar.GetItemByName("CopyRow").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Export
                    if (mnToolbar.GetItemByName("Export").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Print
                    if (mnToolbar.GetItemByName("Print").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Print
                    if (mnToolbar.GetItemByName("Print").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Help
                    if (mnToolbar.GetItemByName("Help").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    //Settings
                    if (mnToolbar.GetItemByName("Settings").GetEnabled()) {
                        curToolbarStatus += "1";
                    } else {
                        curToolbarStatus += "0";
                    }
                    this.SetToolbar("0000000000000000");
                    toolbarStatus = curToolbarStatus;
                    disableToolbar = true;
                } catch (ex) {
                    if (eni.Log) {
                        eni.Log.WriteLog(ex.message, LogType.Error, "MainView.SetToolbar");
                    }
                }
            };

            this.RestoreToolBar = function () {
                if (!disableToolbar) {
                    return;
                }

                disableToolbar = false;

                this.SetToolbar(toolbarStatus);
            };

            this.PageResize = function (e) {
                try {
                    switch (eni.UserAgent.Browser.Type) {
                        case "IE":
                            if (eni.UserAgent.Browser.Version < 11) {
                                $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                                $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            } else {
                                $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                                $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            }
                            break;
                        case "OPERA":
                            $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                            $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            break;
                        case "FIREFOX":
                            $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                            $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            break;
                        case "CHROME":
                            $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                            $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            break;
                        case "SAFARI":
                            $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                            $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            break;
                        default:
                            $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
                            $conMenu_.css("height", (document.documentElement.offsetHeight - $conMenuLogo_.height() - 11) + "px");
                            break;
                    }
                } catch (ex) {
                    if (eni.Message) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };

            this.InitLocalVariables = function () {
                try {
                    $mainView_      = $("#body");
                    $conMenuLogo_   = $($mainView_).find("#con_menu_logo");
                    $conMenu_       = $($mainView_).find("#con_left_menu");
                } catch (ex) {
                    if (eni.Message) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };

            this.spLayout_PaneResizing = function (s, e) {
                $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
            };

            this.spLayout_PaneResized = function (s, e) {
                $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
            };
            this.spLayout_PaneResizeCompleted = function (s, e) {
                $conMenu_.css("width", spLayout.GetPaneByName("leftMenu").GetSize());
            };

            this.tvModuleMenu_NodeClick = function (s, e) {
                var nodeData = new String(e.node.name).split("|");
                if (curPgNm != nodeData[0] && nodeData[1]) {
                    var run = function () {
                        eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00101"));
                        eni.SetToolbar("0000000000000000");
                        disableToolbar = false;
                        curPgNm = nodeData[1];

                        var reqUrl = nodeData[0];
                        
                        var subPage = eni.getSubPage();
                        if (subPage) {
                            if (subPage.base && subPage.base.GetWindowSize) {
                                var sub_win_size = subPage.base.GetWindowSize();
                                reqUrl += "?w=" + sub_win_size.Width;
                                reqUrl += "&h=" + sub_win_size.Height;
                            } else {
                                var contentLayout = spLayout.GetPaneByName("moduleContent");
                                reqUrl += "?w=" + contentLayout.GetClientWidth();
                                reqUrl += "&h=" + contentLayout.GetClientHeight();
                            }

                            reqUrl += "&strRequestParentMenuID=" + nodeData[2] + "&strRequestMenuID=" + nodeData[1] + "&strRequestMenuName=" + e.node.text
                        } else {
                            reqUrl += "?strRequestParentMenuID=" + nodeData[2] + "&strRequestMenuID=" + nodeData[1] + "&strRequestMenuName=" + e.node.text
                        }
                        
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>" + reqUrl);
                    };

                    if (eni.LocalPage && eni.LocalPage.getSubPageDataChange && eni.LocalPage.getSubPageDataChange()) {
                        eni.Message.DisplayBundleMsgBox("MSGBD00001", "MSGBD00104", MessageBoxButtons.YesNo, null, function (pDialogResult) {
                            if (pDialogResult === DialogResult.Yes) {
                                run();
                            }
                        });
                    } else {
                        run();
                    }
                }
            };
            this.tvModuleMenu_ExpandedChanged = function (s, e) {
                if (e.node.GetExpanded()) {
                    e.node.SetImageUrl("<%=lgUrlInfo.VirtualPath%>contents/images/ico-folder_open.gif");
                } else {
                    e.node.SetImageUrl("<%=lgUrlInfo.VirtualPath%>contents/images/ico-folder.gif");
                }
            };

            this.getSubPageDataChange = function () {
                var subPage = eni.getSubPage();
                var subChang = false;
                if (!subPage) {
                    return subChang;
                }
                var subWind = subPage.window;
                if (!subWind) {
                    return subChang;
                }

                for (var i = 0; i < subWind.lgSpreadArr.length; i++) {
                    ggoSpread.Source = subWind.lgSpreadArr[i];
                    subChang = (subWind.lgBlnFlgChgValue || ggoSpread.CheckChange());
                    if (subChang) {
                        break;
                    }
                }

                return subChang;
            };
        });
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    <iframe id="hidFrame" name="hidFrame" src="<%=lgUrlInfo.VirtualPath%>webcontent/common/installactivex.html" width="1" height="1" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" style="border:0px; margin:0px; width:1px; height:1px; position:absolute;"></iframe>
</asp:Content>

<%-- 6.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <eni:eniSplitter ID="spLayout" ClientInstanceName="spLayout" runat="server" SkinID="ModuleView">
        <ClientSideEvents PaneResizing="MainView.spLayout_PaneResizing" PaneResized="MainView.spLayout_PaneResized" PaneResizeCompleted="MainView.spLayout_PaneResizeCompleted" />
        <Panes>
            <dx:SplitterPane Name="leftMenu" Size="210px" MinSize="110px" MaxSize="400px" ScrollBars="None" Separator-Visible="True">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server" BorderWidth="0">
                        <table class="FullScreen BorderClear Padding5R Margin0" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="font-size:0px; height:50px; border-bottom:1px solid #C2C2C2; background-image: url('<%=lgUrlInfo.VirtualPath%>contents/images/menu_back.gif'); background-repeat: repeat-x; background-color: transparent;">
                                    <div id="con_menu_logo">
                                        <img src="<%=lgUrlInfo.VirtualPath%>contents/images/logo/admin_logo.png" alt="DIC Groupware" style="padding-left:10px;" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="VerticalAlignT">
                                    <div id="con_left_menu" class="VerticalAlignT AutoScroll Padding10T">
                                        <eni:eniTreeView ID="tvModuleMenu" ClientInstanceName="tvModuleMenu" CssClass="tvModuleMenu" SkinID="BSL" runat="server" 
                                            Target="ModuleView" OnExpandedChanged="tvModuleMenu_ExpandedChanged" Width="100%">
                                            <ClientSideEvents NodeClick="MainView.tvModuleMenu_NodeClick" ExpandedChanged="MainView.tvModuleMenu_ExpandedChanged" />
                                            <Styles>
                                                <Node>
                                                    <SelectedStyle BackColor="#C2C2C2">
                                                        <BackgroundImage ImageUrl="none" />
                                                        <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#C2C2C2" />
                                                    </SelectedStyle>
                                                </Node>
                                            </Styles>
                                        </eni:eniTreeView>
                                    </div>
                                </td>
                            </tr>
                        </table> 
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="rightContent" Separators-Visible="False">
                <Panes>
                    <dx:SplitterPane Name="moduleToolbar" ScrollBars="None" Size="37px" MaxSize="37px">
                        <PaneStyle BackColor="Transparent">
                            <BackgroundImage ImageUrl="../../contents/images/toolbar_back_00.gif" Repeat="RepeatX" />
                            <Paddings PaddingLeft="5px" PaddingTop="5px" PaddingBottom="5px" />
                            <BorderBottom BorderWidth="1px" BorderStyle="Solid" BorderColor="#A5ACB5" />
                        </PaneStyle>
                        <ContentCollection>
                            <dx:SplitterContentControl>
                                <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" runat="server" CssClass="mnToolbar" SkinID="BSL" BackColor="Transparent">
                                    <ClientSideEvents ItemClick="MainView.mnToolbar_Click" />
                                    <Items>
                                        <dx:MenuItem Name="Menu">
                                            <Image IconID="programming_operatingsystem_16x16" ToolTip="메뉴"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Home">
                                            <Image IconID="navigation_home_16x16" ToolTip="처음으로"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="MenuList" ClientEnabled="false">
                                            <Image IconID="navigation_navigationbar_16x16" ToolTip="메뉴모음"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Query" ClientEnabled="false">
                                            <Image IconID="zoom_zoom_16x16" ToolTip="조회"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="New" ClientEnabled="false">
                                            <Image IconID="content_textbox_16x16" ToolTip="신규"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Delete" ClientEnabled="false">
                                            <Image IconID="edit_delete_16x16" ToolTip="삭제"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Save" ClientEnabled="false">
                                            <Image IconID="save_save_16x16" ToolTip="저장"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Refresh" ClientEnabled="false">
                                            <Image IconID="actions_refresh2_16x16" ToolTip="새로고침"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Cancel" ClientEnabled="false">
                                            <Image IconID="history_undo_16x16" ToolTip="취소"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Prev" ClientEnabled="false">
                                            <Image IconID="navigation_backward_16x16" ToolTip="이전"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Next" ClientEnabled="false">
                                            <Image IconID="navigation_forward_16x16" ToolTip="이후"></Image>
                                        </dx:MenuItem>
                                            <dx:MenuItem Name="InsertRow" ClientEnabled="false">
                                            <Image IconID="reports_separator_16x16" ToolTip="행추가"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="DeleteRow" ClientEnabled="false">
                                            <Image IconID="reports_none_16x16" ToolTip="행삭제"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="CopyRow" ClientEnabled="false">
                                            <Image IconID="reports_emptytablerowseparator_16x16" ToolTip="행복사"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Export" ClientEnabled="false">
                                            <Image IconID="export_export_16x16" ToolTip="내보내기"></Image>
                                            <Items>
                                                <dx:MenuItem Text="Zoom in">
                                                    <Image IconID="zoom_zoomin_16x16"></Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Text="Zoom out">
                                                    <Image IconID="zoom_zoomout_16x16"></Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Text="100% zoom">
                                                    <Image IconID="zoom_zoom100_16x16"></Image>
                                                </dx:MenuItem>
                                            </Items>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Print" ClientEnabled="false">
                                            <Image IconID="print_print_16x16" ToolTip="프린트"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Help" ClientEnabled="false">
                                            <Image IconID="support_suggestion_16x16" ToolTip="도움말"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="Settings" ClientEnabled="false">
                                            <Image IconID="programming_ide_16x16" ToolTip="설정"></Image>
                                        </dx:MenuItem>
                                        <dx:MenuItem Name="RegisterLang">
                                            <Image IconID="programming_ide_16x16" ToolTip="언어설정"></Image>
                                        </dx:MenuItem>
                                    </Items>
                                </eni:eniMenu>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="moduleContent" ScrollBars="Auto" ContentUrlIFrameName="ModuleView" ContentUrlIFrameTitle="ModuleView" ContentUrl="~/dashboard">
                        <PaneStyle Wrap="true">
                        </PaneStyle>
                        <ContentCollection>
                            <dx:SplitterContentControl>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:SplitterPane>
        </Panes>
    </eni:eniSplitter>
</asp:Content>