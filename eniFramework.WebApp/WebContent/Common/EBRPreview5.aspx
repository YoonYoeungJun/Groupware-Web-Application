<%@ Page Title="Preview" Language="C#" AutoEventWireup="true" CodeBehind="EBRPreview5.aspx.cs" Inherits="eniFramework.WebApp.Common.EBRPreview5" %>

<html>
    <head runat="server">
        <title><%: Title %></title>
        <link type="text/css" rel="stylesheet" href="../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript">

            $(MyBizASP.contentDocument).ready(function () {
                alert();
            });


            //$(document).ready(function () {
            //    //EBAction.id.value = "admin";
            //    //EBAction.pw.value = "admin";
            //    //EBAction.doc.value = "Report/KO/EBR/DIC/a4103oa1_ko376.ebr";
            //    ////EBActionForm.form.value = 
            //    //EBAction.runvar.value = "biz_area|%|fr_dt|2014-10-31|to_dt|2014-10-31|VatType|%|fr_bp|0|to_bp|ZZZZZZZZZZ|AmtDecPoint|0|QtyDecPoint|2|UnitCostDecPoint|2|ExchRateDecPoint|4|AmtRndPolicy|-|QtyRndPolicy|%20|UnitCostRndPolicy|-|ExchRateRndPolicy|-|Num1000|,|DateFormat|yyyy-MM-dd|MonthFormat|yyyy-MM|ArrCur||ArrDecPoint||ArrRndPolicy||ArrDefaultDec|2446|gAlignOpt|1|";
            //    //EBAction.action = "http://173.0.9.3/REQUBE/bin/RQISAPI.dll?view";
            //    //EBAction.submit();
            //    //$("#EBAction").submit();
            //    //http://173.0.9.3/REQUBE/bin/RQISAPI.dll?view?doc=Report/KO/EBR/DIC/a4103oa1_ko376.ebr
            //    //window.showModalDialog("http://173.0.9.3/REQUBE/bin/RQISAPI.dll?View?doc=Report/KO/EBR/DIC/a4103oa1_ko376.ebr&runvar=fr_dt|2014-01-01|to_dt|2014-01-01|fr_bp|1|to_bp|1|biz_area|p10|VatType|a|");
            //    //window.showModalDialog("http://173.0.9.3/REQUBE/bin/RQISAPI.dll?View?doc=" + "Report/KO/EBR/DIC/a4103oa1_ko376.ebr&runvar=" + "biz_area|%|fr_dt|2014-10-31|to_dt|2014-10-31|VatType|%|fr_bp|0|to_bp|ZZZZZZZZZZ|AmtDecPoint|0|QtyDecPoint|2|UnitCostDecPoint|2|ExchRateDecPoint|4|AmtRndPolicy|-|QtyRndPolicy|%20|UnitCostRndPolicy|-|ExchRateRndPolicy|-|Num1000|,|DateFormat|yyyy-MM-dd|MonthFormat|yyyy-MM|ArrCur||ArrDecPoint||ArrRndPolicy||ArrDefaultDec|2446|gAlignOpt|1|");
            //});
        </script>
    </head>
    <body id="EBActionBody" class="EBActionBody FullScreen BorderClear Margin0 Padding0">
        <form id="EBAction" name="EBAction" class="EBAction FullScreen BorderClear Margin0 Padding0" target="MyBizASP" method="post" runat="server">
            <table class="FullScreen BorderClear Margin0 Padding0" cellspacing="0" cellpadding="0" >
 	            <tr class="Height100f">
		            <td><iframe id="MyBizASP" name="MyBizASP" marginwidth="0" marginheight="0" frameborder="0" framespacing="0" scrolling="auto" 
                            class="FullScreen BorderClear Margin0 Padding0" src="http://173.0.9.3/REQUBE/bin/RQISAPI.dll?View?doc=Report/KO/EBR/DIC/a4103oa1_ko376.ebr&runvar=fr_dt|2014-01-01|to_dt|2014-01-01|fr_bp|1|to_bp|1|biz_area|p10|VatType|a|"></iframe></td>
	            </tr>
	            <tr>
		            <td>
			            <input type="hidden" id="id" name="id" runat="server"/> 
			            <input type="hidden" id="pw" name="pw" runat="server"/>
			            <input type="hidden" id="doc" name="doc" runat="server"/> 
			            <input type="hidden" id="form" name="form" value="ACTIVEX" runat="server"/> 
			            <input type="hidden" id="runvar" name="runvar" runat="server"/> 
		            </td>
	            </tr>
            </table>
        </form>
    </body>
</html>
