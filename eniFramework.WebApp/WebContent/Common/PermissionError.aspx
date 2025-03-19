<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PermissionError.aspx.cs" Inherits="eniFramework.WebApp.Common.PermissionError" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="ErrorHeader" runat="server">
        <title><%: Title %></title>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
        <meta name="CODE_LANGUAGE" content="C#"/>
        <meta name="vs_defaultClientScript" content="JavaScript"/>
        <meta name="application-name" content="DIC Groupware" />
        <meta name="author" content="(주)디아이씨" />
        <meta name="keywords" content="(주)디아이씨" />
        <meta name="description" content="(주)디아이씨 포털 그룹웨어 입니다." />
        <meta name="robots" content="noindex,nofollow" />
        <meta name="viewport" content="width=device-width" />
        <meta http-equiv="imagetoolbar" content="no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)"/>
        <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)"/>
        <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery.Cookie.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Log.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript">
            try {
                var Error = eni.Initialize(new function () {
                    this.iFrameName = "_blank";
                    this.ViewType = ViewType.ModuleView;
                    this.Form_Load = function () {
                        
                    };
                    this.Form_Load_Complate = function () {
                        //txtID.focus();
                    };

                    this.btnHome_OnClick = function (e) {
                        eni.RunPageTopFrame("/");
                    }
                });
            } catch (ex) {
                alert(ex.message);
            }
        </script>
    </head>
    <body id="ErrorBody" class="ErrorBody" scroll="no">
        <form id="ErrorForm" name="ErrorForm" class="ErrorForm" runat="server" style="vertical-align:middle;">
            <div style="position:absolute; width:800px; height:200px; top:50%; left:50%; margin: -100px 0 0 -400px;">
                <table class="FullScreen BorderClear Padding0" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:30px;">
                        <td style="text-align:center; font-size:50px; color:darkblue; font-weight:bold;">
                            Groupware DIC
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size:15px; color:#4C46CC;">
                            <asp:PlaceHolder ID="ErrorReport" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr style="height:30px; text-align:center;">
                        <td>
                            <div class="CButtonLWhite CButtonLWhiteHover" onclick="Error.btnHome_OnClick(event)">
                                <div>
                                    <span>홈으로</span>
                                </div>
                            </div>
                            <div class="CButtonLWhite CButtonLWhiteHover">
                                <div>
                                    <span>이전페이지</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>