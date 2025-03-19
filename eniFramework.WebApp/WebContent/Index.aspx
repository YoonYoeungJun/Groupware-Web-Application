<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebContent/Common/CommonPage.Master" CodeBehind="Index.aspx.cs" Inherits="eniFramework.WebApp.Index"  %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/WebContent/Common/Editor/ClearIconBtn.ascx" TagPrefix="eni" TagName="ClearIconBtn" %>


<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Index
    *  2. Function Name        :
    *  3. Program ID           : Index.aspx
    *  4. Program Name         : 메인 페이지
    *  5. Program Desc         : 메인 페이지
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
    </script>
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .area_header {
            position:relative;
            min-width:800px;
            height:45px;
            border:0px;
            overflow:hidden;
            margin:0px;
            padding:0px;
            z-index:30;
        }

        .area_header {
            background:url(<%=lgUrlInfo.VirtualPath%>contents/images/top_back.png) repeat-x;
        }

        .area_header .Logo {
            width: 236px;
            height: 45px;
            background: url(<%=lgUrlInfo.VirtualPath%>contents/images/logo_back.png) repeat left top;
            overflow:hidden;
        }
        .area_header .Logo p {
            vertical-align: top;
            overflow: hidden;
        }
        .area_header .Logo.KO p,
        .area_header .Logo.CN p {
            width: 175px;
            height: 37px;
            margin:2px 0 0 30px;
        }
        .area_header .Logo.EN p,
        .area_header .Logo.JP p {
            width: 155px;
            height: 37px;
            margin:2px 0 0 60px;
        }

        .area_content {
            position:absolute;
            top:45px;
            bottom:25px;
            left:0;
            right:0;
            margin:0;
            padding:0;
            border:0px;
            overflow:hidden;
            min-height:0px;
            z-index:20;
            zoom:1;
        }

        .area_footer {
            position:absolute;
            overflow:hidden;
            bottom:0px;
            width:100%;
            height:24px;
            border-top:1px solid #D6D6D6;
            border-bottom:0px;
            border-left:0px;
            border-right:0px;
        }
        .wrap_footer {
            width:100%;
            height:100%;
            margin:0;
            padding:0;
            overflow:hidden;
            border:0;
        }
        .wrap_footer .con_loading {
            float:left;
            display:inline-block;
            text-align:left;
            vertical-align:middle;
            padding:1px 0 0 5px;
        }
        .wrap_footer .con_loading .loading_ico {
            width:18px;
            height:18px;
        }
        .wrap_footer .loading_status {
            float:left;
            color:#6A6A6A;
            display:inline-block;
            font-size:10px;
            width:270px;
            /*font-weight:bold;*/
            padding:3px 0 0 5px;
            text-align:left;
            line-height:1.5;
            vertical-align:middle;
        }
        .wrap_footer .con_copylight {
            display:inline-block;
        }
        .wrap_footer .con_login_info {
            color:#6A6A6A;
            padding-top:5px;
            display:inline-block;
        }
        .wrap_footer .con_database_info {
            color:#6A6A6A;
            padding-top:5px;
            display:inline-block;
        }
        .wrap_footer .con_lbl_lang {
            color:#6A6A6A;
            padding-top:5px;
            display:inline-block;
        }
        .wrap_footer .con_select_lang {
            color:#6A6A6A;
            float:right;
            padding-right: 5px;
        }
    </style>
    <script type="text/javascript">
        // <![CDATA[
        var histroy = window.History;
        var pageUrl = window.location.href;

        var Idx = eni.Initialize(new function () {
            var $area_content = $();
            var $area_footer_ = $();
            var $frame = $();

            this.Title = eni.GetTitle();
            this.iFrameName = "ifrmMain";
            this.ViewType = ViewType.Top;
            this.Form_Load = function () {
                eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00101"));
                
                cboLangField = new Ext.form.ComboBox({
                    width: 100,
                    editable: false,
                    allowBlank: false,
                    forceSelection: true,
                    disableKeyFilter: true,
                    selectOnFocus: true,
                    triggerAction: "all",
                    //store: [["KO", "한국어"], ["EN", "English"], ["CN", "中國語"], ["JP", "日本語"]],
                    <% if (lgLang.ToLower() == "ko") { %>
                        store: [["KO", "한국어"], ["CN", "중국어"]],
                    <% } else { %>
                        store: [["KO", "韩国语"], ["CN", "中國語"]],
                    <% } %>
                    value: "<%= lgLang %>",
                    listeners: {
                        scope: "",
                        select: function (obj, recode, index) {
                            eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00109"));

                            eni.Cookie.SetCookie("ckLang", recode.json[0]);
                            __doPostBack();
                        }
                    }
                });
                cboLangField.applyToMarkup("cboLang");

                //ajax history 사용
                //if (History.enabled) {
                //    History.pushState({ _index: History.getCurrentIndex(), path: pageUrl }, "타이틀", pageUrl);
                //} else {
                //    return false;
                //}

                //History.Adapter.bind(window, 'statechange', function () {
                //    debugger
                //    var currentIndex = History.getCurrentIndex();
                //    var internal = (History.getState().data._index == (currentIndex - 1));
                //    if (!internal) {
                //        ajaxUrl = History.getState().data.path;
                //        $.ajax({
                //            type: "POST",
                //            url: ajaxUrl,
                //            data: { type: "post" },
                //            success: function (data) {
                //                $('#area_content').html(data);
                //            }
                //        });
                //    }
                //});
            };
            this.Form_Load_Complate = function () {
                eni.Loading.DisplayLoadingAll(false);
            };
            this.PageResize = function (e) {
                try {
                    switch (eni.UserAgent.Browser.Type) {
                        case "IE":
                            if (eni.UserAgent.Browser.Version >= 10) {//IE 10 이상
                                $frame.height(document.documentElement.offsetHeight - 70);
                            } else {//IE 10 미만
                                $frame.height(document.documentElement.offsetHeight - 70);
                            }
                            break;
                        case "OPERA":
                            $frame.height(document.documentElement.offsetHeight - 70);
                            break;
                        case "FIREFOX":
                            $frame.height(document.documentElement.offsetHeight - 70);
                            break;
                        case "CHROME":
                            $frame.height(document.documentElement.offsetHeight - 70);
                            break;
                        case "SAFARI":
                            $frame.height(document.documentElement.offsetHeight - 70);
                            break;
                        default:
                            $frame.height(document.documentElement.offsetHeight - 70);
                            break;
                    }
                } catch (ex) {
                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("common.error"), ex.message);
                }
            };

            this.InitLocalVariables = function () {
                try {
                    Ext.useShims = true;

                    $area_content = $("#area_content");
                    $area_footer_ = $("#area_footer");
                    $frame = $area_content.find("#<%# ifrmMain.ClientID %>");

                    //하단 상태 로딩 박스 초기화
                    lgSLBox = $area_footer_.find("#con_loading");
                    lgSLBox.Icon = lgSLBox.find("#loading_ico");
                    lgSLBox.Text = $area_footer_.find("#loading_status");
                    
                } catch (ex) {
                    if (eni.Message) {
                        eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00003"), ex.message);
                    } else {
                        alert(ex.message);
                    }
                }
            };

            this.mnToolbar_Click = function (s, e) {
                //eni.Loading.DisplayLoadingAll(true, eni.Message.StrBundle("MSGBD00100"));

                switch (e.item.name) {
                    case "btnHome":
                       <%-- $.ajax({
                            type: "POST",
                            url: "<%=lgUrlInfo.VirtualPath%>home",
                            data: { type: "post" },
                            success: function (data) {
                                $("#area_content").html(data);
                            }
                        });
                        if (pageUrl != window.location) {
                            History.pushState({ _index: History.getCurrentIndex(), path: pageUrl, html: $("#area_content").html() }, eni.GetTitle(), pageUrl);
                        }--%>
                       
                        //eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>home");
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>mail?mv=list");
                        break;
                    case "btnMail":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>mail?mv=list");
                        break;
                    case "btnNote":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>note?mv=list");
                        break;
                    case "btnBoard":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>board/bbs_notice");
                        break;
                    case "btnWebHard":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>webhard");
                        break;
                    case "btnContact":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>contact");
                        break;
                    case "btnSettings":
                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>Settings");
                        break;
                    case "btnHelp":
                        break;
                    case "btnAdmin":
                        //debugger
                        //var oifrmMain = $("#Sub_Content_Form_Holder_" + eni.LocalPage.iFrameName);
                        //oifrmMain.contents().find("body").append("<iframe id='hidFrame' name='hidFrame' src='./webcontent/common/blank.html' width='1' height='1' marginwidth='0' marginheight='0' frameborder='0' framespacing='0' scrolling='no' style='border:0px; margin:0px; width:1px; height:1px;'></iframe>");
                        //var strUrl = "./webcontent/common/installactivex.html";
                        //strUrl += "?ReturnUrl=../../admin";
                        //eni.RunPageFrame(strUrl, "hidFrame");

                        eni.RunPageFrame("<%=lgUrlInfo.VirtualPath%>admin");
                        break;
                    case "btnLogout":
                        //eni.RunPageFrame("./redirect");
                        __doPostBack("__Page", "cmd=LogOut");
                        break;
                }
            };
        });
        // ]]>
    </script>
</asp:Content>

<%-- 5.컨텐트 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    
    <div class="area_header">
        <div style="width:100%; display:inline-block;">
            <div class="Logo <%= lgLang %>" style="width:236px; float:left;">
                <p><img src="<%=lgUrlInfo.VirtualPath%>contents/images/logo/<%= (lgLang.ToLower() == "ko" ? "logo.png" : (lgLang.ToLower() == "cn" ? "logo_cn.png" : "logo_en.gif")) %>" class="CursorPoint" title="<%= GetResource("CSTRESX00001") %>" onclick="document.location = document.location;" /></p>
            </div>
            <div style="float:left; position:absolute; left:250px; right:0px;">
                <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" CssClass="mnToolbar Padding10LR" runat="server"
                    Width="100%" Height="41px" SeparatorColor="Transparent" SeparatorWidth="0px" ItemSpacing="0"
                    SpriteImageUrl="~/contents/images/ico-maintoolbar-set.png" 
                    BackColor="Transparent" AllowSelectItem="True">
                    <ClientSideEvents ItemClick="Idx.mnToolbar_Click" />
                    <Border BorderWidth="0px" />
                    <BackgroundImage ImageUrl="none" />
                    <ItemStyle Width="60px" Height="41px" HorizontalAlign="Center" BackColor="Transparent">
                        <Paddings Padding="0px" PaddingTop="5px" />
                        <Border BorderWidth="0px" />
                        <HoverStyle BackgroundImage-ImageUrl="none" BackColor="#0d8ef0"></HoverStyle>
                        <SelectedStyle BackgroundImage-ImageUrl="none" BackColor="#0d8ef0"></SelectedStyle>
                    </ItemStyle>
                    <SeparatorPaddings Padding="0px" />
                    <Items>
                        <dx:MenuItem Text="" ToolTip="알림" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/contents/images/index/alert01.png" 
                                UrlHottracked="~/Contents/Images/Index/Alert02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" ToolTip="친구" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/Contents/Images/Index/Contact01.png" 
                                UrlHottracked="~/Contents/Images/Index/Contact02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" ToolTip="메세지" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/Contents/Images/Index/Message01.png" 
                                UrlHottracked="~/Contents/Images/Index/Message02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" PaddingRight="15px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnHome" Text="" ToolTip="홈" Selected="true">
                            <Image Width="40px" Height="28px">
                                <SpriteProperties Top="2px" Left="0px" HottrackedTop="36px" HottrackedLeft="0px" />
                            </Image>
                            <ItemStyle HorizontalAlign="Center">
                                <HoverStyle BackColor="#0d8ef0"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnMail" Text="" ToolTip="메일">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="57px" HottrackedTop="36px" HottrackedLeft="57px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnNote" Text="" ToolTip="쪽지" ClientVisible="false">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="418px" HottrackedTop="36px" HottrackedLeft="418px"/>
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnBoard" Text="" ToolTip="게시판">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="418px" HottrackedTop="36px" HottrackedLeft="418px"/>
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnWebHard" Text="" ToolTip="웹하드">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="598px" HottrackedTop="36px" HottrackedLeft="598px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnContact" Text="" ToolTip="주소록">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="658px" HottrackedTop="36px" HottrackedLeft="658px"/>
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="185px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="245px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="305px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="365px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="485px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="545px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="605px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="725px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="blank" Text="" Enabled="false">
                            <ItemStyle CssClass="WidthAuto" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSettings" Text="" ToolTip="개인설정">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="785px" HottrackedTop="39px" HottrackedLeft="785px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnHelp" Text="" ToolTip="도움말" Enabled="false"  ClientVisible="false">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="905px" HottrackedTop="39px" HottrackedLeft="905px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnAdmin" Text="" ToolTip="관리자" Visible="false">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="875px" HottrackedTop="39px" HottrackedLeft="875px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnLogout" Text="" ToolTip="로그아웃">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="815px" HottrackedTop="39px" HottrackedLeft="815px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                    </Items>
                </eni:eniMenu>
            </div>
        </div>
        <%--<table class="FullScreen DisplayBlock">
            <tr>
                <td style="width:236px">
                    <div class="Logo <%= lgLang %>">
                        <p><img src="./contents/images/<%= (lgLang.ToLower() == "ko" ? "logo" : "logo_en") %>.gif" class="CursorPoint" title="<%= GetResource("CSTRESX00001") %>" onclick="document.location = document.location;" /></p>
                    </div>
                </td>
                <td style="width:100%;"></td>
                <td style="width:30px; vertical-align:top;">
                    <dx:MenuItem Text="" ToolTip="알림" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/Contents/Images/Index/Alert01.png" 
                                UrlHottracked="~/Contents/Images/Index/Alert02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" ToolTip="친구" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/Contents/Images/Index/Contact01.png" 
                                UrlHottracked="~/Contents/Images/Index/Contact02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" ToolTip="메세지" Enabled="false" ClientVisible="false">
                            <Image Width="21px" Height="18px"
                                Url="~/Contents/Images/Index/Message01.png" 
                                UrlHottracked="~/Contents/Images/Index/Message02.png">
                                <SpriteProperties CssClass="Padding10T" />
                            </Image>
                            <ItemStyle Width="21px" Height="18px">
                                <Paddings Padding="0px" PaddingTop="19px" PaddingRight="15px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnHome" Text="" ToolTip="홈" Selected="true">
                            <Image Width="40px" Height="28px">
                                <SpriteProperties Top="2px" Left="0px" HottrackedTop="36px" HottrackedLeft="0px" />
                            </Image>
                            <ItemStyle HorizontalAlign="Center">
                                <HoverStyle BackColor="#0d8ef0"></HoverStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnMail" Text="" ToolTip="메일">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="57px" HottrackedTop="36px" HottrackedLeft="57px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnBoard" Text="" ToolTip="게시판">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="418px" HottrackedTop="36px" HottrackedLeft="418px"/>
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnWebHard" Text="" ToolTip="웹하드">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="598px" HottrackedTop="36px" HottrackedLeft="598px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnContact" Text="" ToolTip="주소록">
                            <Image Width="45px" Height="28px">
                                <SpriteProperties Top="2px" Left="658px" HottrackedTop="36px" HottrackedLeft="658px"/>
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="185px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="245px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="305px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="365px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="485px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="545px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="605px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Text="" Enabled="false" ClientVisible="false">
                            <Image Width="30px" Height="28px">
                                <SpriteProperties Top="2px" Left="725px" />
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="blank" Text="" Enabled="false">
                            <ItemStyle CssClass="WidthAuto" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSettings" Text="" ToolTip="개인설정">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="785px" HottrackedTop="39px" HottrackedLeft="785px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnHelp" Text="" ToolTip="도움말" Enabled="false"  ClientVisible="false">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="905px" HottrackedTop="39px" HottrackedLeft="905px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                       <dx:MenuItem Name="btnAdmin" Text="" ToolTip="관리자" Visible="false">
                            <Image Width="30px" Height="30px">
                                <SpriteProperties Top="2px" Left="875px" HottrackedTop="39px" HottrackedLeft="875px" />
                            </Image>
                            <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                <Paddings Padding="0px" PaddingTop="8px" />
                                <HoverStyle BackColor="Transparent"></HoverStyle>
                                <SelectedStyle BackColor="Transparent"></SelectedStyle>
                            </ItemStyle>
                        </dx:MenuItem>
                    <eni:eniMenu ID="mnToolbar" ClientInstanceName="mnToolbar" CssClass="mnToolbar Padding10LR" runat="server"
                        Width="100%" Height="41px" SeparatorColor="Transparent" SeparatorWidth="0px" ItemSpacing="0"
                        SpriteImageUrl="~/contents/images/Index/MainToolbar-ICO-SET.png" 
                        BackColor="Transparent" AllowSelectItem="True">
                        <ClientSideEvents ItemClick="Idx.mnToolbar_Click" />
                        <Border BorderWidth="0px" />
                        <BackgroundImage ImageUrl="none" />
                        <ItemStyle Width="60px" Height="41px" HorizontalAlign="Center" BackColor="Transparent">
                            <Paddings Padding="0px" PaddingTop="5px" />
                            <Border BorderWidth="0px" />
                            <HoverStyle BackgroundImage-ImageUrl="none" BackColor="#0d8ef0"></HoverStyle>
                            <SelectedStyle BackgroundImage-ImageUrl="none" BackColor="#0d8ef0"></SelectedStyle>
                        </ItemStyle>
                        <SeparatorPaddings Padding="0px" />
                        <Items>
                            <dx:MenuItem Name="btnLogout" Text="" ToolTip="로그아웃">
                                <Image Width="30px" Height="30px">
                                    <SpriteProperties Top="2px" Left="815px" HottrackedTop="39px" HottrackedLeft="815px" />
                                </Image>
                                <ItemStyle Width="30px" Height="18px" CssClass="FloatR">
                                    <Paddings Padding="0px" PaddingTop="8px" />
                                    <HoverStyle BackColor="Transparent"></HoverStyle>
                                    <SelectedStyle BackColor="Transparent"></SelectedStyle>
                                </ItemStyle>
                            </dx:MenuItem>
                        </Items>
                    </eni:eniMenu>
                </td>
            </tr>
        </table>--%>
    </div>
    <div id="area_content" class="area_content">
        <iframe id="ifrmMain" name="ifrmMain" src='<%#lgUrlInfo.VirtualPath + "mail?mv=list"%>' marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" runat="server"></iframe>
    </div>
    <div id="area_footer" class="area_footer" style="text-align:center;">
        <table class="wrap_footer" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="width:400px;">
                    <span id="con_loading" class="con_loading">
                        <img id="loading_ico" src="<%=lgUrlInfo.VirtualPath%>contents/images/loading/loading_18x18.gif" title="<%= GetGlobalResource("GCSTRESX00100") %>"/>
                    </span>
                    <span id="loading_status" class="loading_status" title="<%= GetGlobalResource("GCSTRESX00100") %>"><%= GetGlobalResource("GCSTRESX00100") %></span>
                </td>
                <td>
                    <span class="con_copylight" style="display:inline-block">Copyright ⓒ <span style="color:#2A2A84;">DAE-IL Corporation</span>. all rights reserved.</span>
                </td>
                <td style="width:450px;">
                    <table style="float:right;" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <span id="con_login_info" class="con_login_info">
                                    <%= string.Format("{0}({1})", lgACT.UserId, lgACT.Name) %>
                                </span>
                            </td>
                            <td style="padding:0 0 0 2px;">
                                <div class="Separator Vertical" style="height:17px; margin:3px 0 0 0;"></div>
                            </td>
                            <td>
                                <span id="con_database_info" class="con_database_info">
                                    <%= string.Format("{0}[{1}]", lgCommons.ServerIP, lgCommons.DbName) %>
                                </span>
                            </td>
                            <td style="padding:0 0 0 2px;">
                                <div class="Separator Vertical" style="height:17px; margin:3px 0 0 0;"></div>
                            </td>
                            <td style="padding:0 2px 0 2px;">
                                <span id="con_lbl_lang" class="con_lbl_lang">
                                    <%= GetGlobalResource("GCSTRESX00009") %>
                                </span>
                            </td>
                            <td>
                                <div class="con_select_lang">
                                    <input type="text" id="cboLang"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>