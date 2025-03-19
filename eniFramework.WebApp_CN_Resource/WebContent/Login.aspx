<%@ Page Language="C#" MasterPageFile="~/WebContent/Common/CommonPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eniFramework.WebApp.Login" %>

<%@ Import Namespace="eniFramework.WebApp" %>
<%@ Import Namespace="eniFramework.WebApp.Common" %>

<%-- 1.페이지에서 해당 모듈 설명글을 작성 --%>
<asp:Content ContentPlaceHolderID="Sub_Module_Description" runat="server">
    <%-- 
    **************************************************************************************************************
    *  1. Module Name          : Login
    *  2. Function Name        :
    *  3. Program ID           : Login.aspx
    *  4. Program Name         : 로그인 페이지
    *  5. Program Desc         : 로그인 페이지
    *  6. Comproxy List        :
    *  7. Modified date(First) : 2016-03-10
    *  8. Modified date(Last)  : 2016-03-10
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
</asp:Content>

<%-- 4.해당 페이지의 특정 Script 사용 --%>
<asp:Content ContentPlaceHolderID="Sub_Script_Holder" runat="server">
    <style type="text/css">
        .eni_Body {
            /*position: absolute;*/
            background-image: url(<%=lgUrlInfo.VirtualPath%>contents/images/login_back.jpg);
            /*left: 0;
            top: 0;*/
            /*width: 100%;
            height: 100%;*/
            /*background-repeat: no-repeat;*/
            background-attachment: fixed;
            /*margin:0px;*/
        }

        .area_login_box {
            position: absolute;
            background-image: url(<%=lgUrlInfo.VirtualPath%>contents/images/<%= (lgLang.ToLower() == "ko" ? "login_box_back" : (lgLang.ToLower() == "cn" ? "login_box_back_cn" : "login_box_back_en"))%>.png);
            top: 50%;
            left: 50%;
            width: 800px;
            min-height: 450px;
            margin: -225px 0 0 -400px;
            padding: 0;
            border:0px;
        }
        .area_login_box .wrap_login_field {
            position:absolute;
            left:190px;
            top:282px;
            width:400px;
            height:80px;
            z-index:2;
            border:0px;
        }
        .area_login_box .wrap_login_field .con_select_lang {
            padding:2px 0px;
            display:inline-block;
            width:100%;
        }
        .area_login_box .wrap_login_field .con_login_info {
            padding:2px 0px;
            display:inline-block;
            width:100%;
        }
        .area_login_box .wrap_login_field .con_login_info .x-btn-text {
            font-weight:bold;
        }
        .area_login_box .wrap_login_field .con_login_options {
            display:inline-block;
            width:100%;
        }
        .area_login_box .wrap_login_field .con_login_options .x-form-cb-label {
            top:4px;
            cursor:pointer;
        }
        .area_login_box .wrap_login_field .con_login_options .version {
            float:left;
            line-height:18px;
            padding-top:5px;
        }
    </style>
    <script type="text/javascript">
        
        try {
            var Login = eni.Initialize(new function () {
                var popMaskLoading, cboLangField, txtIdField, txtPwdField, btnLogin, chkSaveId;
                this.EnableControls = function () { },
                this.Title = "<%= GetResource("CSTRESX00000")%>";
                this.iFrameName = "DefaultFrame";
                this.ViewType = ViewType.None;
                this.Form_Load = function () {
                    Ext.QuickTips.init();
                    
                    popMaskLoading = new Ext.LoadMask(Ext.getBody(), { msg: "<%= GetResource("CSTRESX00001")%>" });

                    cboLangField = new Ext.form.ComboBox({
                        width: 100,
                        editable: false,
                        allowBlank: false,
                        forceSelection: true,
                        disableKeyFilter: true,
                        selectOnFocus: true,
                        triggerAction: "all",
                        emptyText: "<%= GetResource("CSTRESX00002")%>",
                        //store: [["KO", "한국어"], ["EN", "English"], ["CN", "中國語"], ["JP", "日本語"]],
                        <% if (lgLang.ToLower() == "ko")
                           { %>
                            store: [["KO", "한국어"], ["CN", "중국어"], ["EN", "영어"], ["JP", "일본어"]],
                        <% }
                           else
                           { %>
                            store: [["KO", "韩国语"], ["CN", "中國語"]],
                        <% } %>
                        value: "<%= lgLang %>",
                        listeners: {
                            scope: "",
                            select: function (obj, recode, index) {
                                eni.Cookie.SetCookie("ckLang", recode.json[0]);
                                txtIdField.emptyText = "";
                                txtIdField.setValue("");
                                txtPwdField.emptyText = "";
                                txtPwdField.setValue("");
                                __doPostBack();
                            }
                        }
                    });
                    cboLangField.applyToMarkup("cboLang");

                    txtIdField = new Ext.form.TextField({
                        width: 100,
                        allowBlank: false,
                        enableKeyEvents: true,
                        blankText: "<%= GetResource("CSTRESX00003")%>",
                        emptyText: "<%= GetResource("CSTRESX00004")%>",
                        listeners: {
                            keydown: function (obj, e) {
                                if (e.getKey() == 13) {
                                    if (!obj.isValid()) {
                                        eni.Message.DisplayMsgBox("", "<%= GetResource("CSTRESX00004")%>");
                                        obj.focus();
                                    } else {
                                        txtPwdField.focus();
                                    }
                                }
                            }
                        }
                    });
                    txtIdField.applyToMarkup('txtUserId');

                    txtPwdField = new Ext.form.TextField({
                        width: 100,
                        allowBlank: false,
                        enableKeyEvents: true,
                        blankText: "<%= GetResource("CSTRESX00005")%>",
                        emptyText: "******",
                        listeners: {
                            keydown: function(obj, e){
                                if (e.getKey() == 13) {
                                    if (!obj.isValid()) {
                                        eni.Message.DisplayMsgBox("", "<%= GetResource("CSTRESX00005")%>");
                                        obj.focus();
                                    } else {
                                        btnLogin.fireEvent("click", btnLogin);
                                    }
                                }
                            }
                        }
                    });
                    txtPwdField.applyToMarkup('txtPassword');

                    btnLogin = new Ext.Button({
                        width: 65,
                        text: "<%= GetResource("CSTRESX00006")%>",
                        listeners:{
                            click: function (obj, e) {
                                //debugger
                                //var a = eni.DbAccess.ExecuteQuery("select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor ", "abc,bbb");
                                //a = eni.DbAccess.ExecuteQuery("SELECT * FROM B_MINOR WHERE MINOR_NM LIKE '%帐号或手机号%' ", "abc,bbb");
                                //a = eni.DbAccess.ExecuteFMGQuery("*", "b_minor", null, "abc,bbb");
                                //a = eni.DbAccess.ExecuteDataSet("select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor union all select * from b_minor ", "abc,bbb");
                                //a = eni.DbAccess.ExecuteFMGDataSet("*", "b_minor", null, "abc,bbb");
                                //a = eni.DbAccess.ExecuteCodeName("b_minor", "A", "S0001", -1);

                                //alert(a);
                                //return;
                                
                                if (!txtIdField.isValid()) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00001"), "<%= GetResource("CSTRESX00003")%>");
                                    return;
                                }

                                if (!txtPwdField.isValid()) {
                                    eni.Message.DisplayMsgBox(eni.Message.StrBundle("MSGBD00001"), "<%= GetResource("CSTRESX00005")%>");
                                    return;
                                }

                                eni.LocalPage.EnableControls(false);

                                var reqData = {
                                    cmd: "Login",
                                    uid: txtIdField.getValue(),
                                    pwd: txtPwdField.getValue(),
                                    ssid: "<%= SessionID%>",
                                    sshn: "<%= SessionHistoryNo%>"
                                };
                                
                                var reqSucsees = function (pResult, responsData, statusText, xhr) {
                                    if (!pResult.Code) {
                                        if (chkSaveId.checked) {
                                            eni.Cookie.SetStorage("UserId", txtIdField.getValue());
                                        } else {
                                            eni.Cookie.SetStorage("UserId", "");
                                        }
                                        //popMaskLoading.msg = "<%= GetResource("CSTRESX00009")%>";
                                        //popMaskLoading.show();

                                        eni.RunPageTopFrame("<%=lgUrlInfo.VirtualPath%>Index<%# string.IsNullOrWhiteSpace(Request.QueryString.ToString()) == false ? "?" + Request.QueryString : string.Empty %>");
                                    } else {
                                        eni.Message.DisplayMsgBox("<%= GetResource("CSTRESX00008")%>" + "(" + pResult.Code + ")", pResult.Message);
                                        eni.LocalPage.EnableControls(true);
                                    }
                                };

                                var reqError = function (pResult, xhr, statusText, ex) {
                                    eni.Message.DisplayMsgBox("<%= GetResource("CSTRESX00008")%>" + "(" + pResult.Code + ")", pResult.Message);
                                    eni.LocalPage.EnableControls(true);
                                }
                                
                                eni.Ajax.Request("<%=lgUrlInfo.VirtualPath%>webcontent/common/commonrequest.ashx", reqData, "post", reqSucsees, reqError, { DataType: "text" });
                            }
                        }
                    });
                    btnLogin.applyToMarkup("btnLogin");

                    chkSaveId = new Ext.form.Checkbox({
                        width: 80,
                        boxLabel: "<%= GetResource("CSTRESX00007")%>"
                    });
                    chkSaveId.applyToMarkup("chkSaveId");
                };
                this.Form_Load_Complate = function () {
                    var ckUserId = eni.Cookie.GetStorage("UserId");
                    if (ckUserId) {
                        txtIdField.setValue(ckUserId);
                        chkSaveId.setValue(true);
                        txtPwdField.focus();
                    } else {
                        txtIdField.focus();
                    }
                };

                this.EnableControls = function (enable) {
                    if (!enable) {
                        cboLangField.setDisabled(true);
                        txtIdField.setDisabled(true);
                        txtPwdField.setDisabled(true);
                        btnLogin.setDisabled(true);
                        chkSaveId.setDisabled(true);
                        popMaskLoading.show();
                    } else {
                        cboLangField.setDisabled(false);
                        txtIdField.setDisabled(false);
                        txtPwdField.setDisabled(false);
                        btnLogin.setDisabled(false);
                        chkSaveId.setDisabled(false);
                        popMaskLoading.hide();
                    }
                };
                this.SetInstallActiveXResult = function (bResult) {
                    if (bResult) {
                        eni.Cookie.SetCookie("ckAcX", "1");
                    } else {
                        eni.LocalPage.EnableControls(true);
                        eni.Message.DisplayMsgBox("Install ActiveX", "<%= GetResource("CSTRESX00010")%>");
                    }
                };
            });
        } catch (ex) {
            alert(ex.message);
        }
    </script>
</asp:Content>

<%-- 5.컨텐트 Body 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Body_Holder" runat="server">
    <iframe id="hidFrame" name="hidFrame" src="<%=lgUrlInfo.VirtualPath%>webcontent/common/blank.html" width="1" height="1" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="no" style="border:0px; margin:0px; width:1px; height:1px;"></iframe>
</asp:Content>

<%-- 6.컨텐트 Form 부분 --%>
<asp:Content ContentPlaceHolderID="Sub_Content_Form_Holder" runat="server">
    <div class="area_login_box">
        <div class="wrap_login_field">
            <div class="con_select_lang">
                <div class="FloatR" style="padding-right:2px;">
                    <input type="text" id="cboLang"/>
                </div>
            </div>
            <div class="con_login_info">
                <div class="FloatR" style="width:280px;">
                    <div class="FloatL Padding5R" style="padding-top:1px">
                        <input type="text" id="txtUserId"/>
			            <input type="password" id="txtPassword" value="" />
                    </div>
                    <div id="btnLogin"></div>
                </div>
            </div>
            <div class="con_login_options">
                <div class="version">
                    ver.<%= Global.gEnvironmonts.ApplicationVersion%>
                </div>
                <div style="width:278px;" class="FloatR">
                    <input type="checkbox" id="chkSaveId"/>
                </div>
				<%--<a href="javascript:confirmPassword()">아이디/비밀번호 변경</a>--%>
			</div>
        </div>
    </div>

    <div style="width:100%;color:white;position:absolute;bottom:5px;text-align:center;font-size:15px;"><strong>版权所有单位:大一汽配(张家港)有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苏ICP备17015011号-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工信部:</strong><a href="http://www.miitbeian.gov.cn" style="color:white">http://www.miitbeian.gov.cn</a></div>
</asp:Content>
