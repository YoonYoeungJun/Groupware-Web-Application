<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstallCheckActiveX_Test.aspx.cs" Inherits="eniFramework.WebApp.Test.InstallCheckActiveX_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        function InstallCheckActiveX(sCLSID) {
            var installed;
            try {
                var axObj = new ActiveXObject(sCLSID);

                if (axObj) {
                    installed = true;
                } else {
                    installed = false;
                }
            } catch (e) {
                installed = false;
                alert(e.message)
            }
        }

        if (InstallCheckActiveX("41f841c1-ae16-11d5-8817-0050da6ef5e5")) {
            alert("no")
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
