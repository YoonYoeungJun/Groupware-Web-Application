<%@ LANGUAGE="VBSCRIPT" %>

<html>
<head>
    <title></title>
    <script Language="vbscript">


        Sub vspdData_Change(Col , Row)

            msgbox 1
        End Sub
    </script>
</head>
<body>
    <div style="display: none;">
        <object classid="CLSID:5220cb21-c88d-11cf-b347-00aa00a28331">
            <param name="LPKPath" value="/WebContent/Common/Control/ActiveX/farpoint214111.lpk">
        </object>
    </div>
    <form id="form1">
        <div style="width:100%; height:700px;">
            <OBJECT CLASSID="CLSID:71146838-020D-4D16-80FD-6ACE384B66DF" NAME="vspdData" ID="vaSpread" WIDTH="100%" HEIGHT="100%" TAG="2XXXXX" TITLE="SPREAD">
                <PARAM NAME="MaxCols" VALUE="0">
                <PARAM NAME="MaxRows" VALUE="0">
            </OBJECT>
        </div>
    </form>
</body>
</html>
