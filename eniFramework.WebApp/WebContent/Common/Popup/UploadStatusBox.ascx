<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadStatusBox.ascx.cs" Inherits="eniFramework.WebApp.Common.Popup.UploadStatusBox" %>

<!--
**************************************************************************************************************
*  1. Module Name          : 공통 파일 업로드 정보 컨트롤
*  2. Function Name        :
*  3. Program ID           : UploadStatusBox.ascx
*  4. Program Name         : 공통 파일 업로드 정보 컨트롤
*  5. Program Desc         : 공통 파일 업로드 정보 컨트롤
*  6. Comproxy List        :
*  7. Modified date(First) : 2015-10-21
*  8. Modified date(Last)  : 2015-10-29
*  9. Modifier (First)     : Yoon YoungJun
*  9. Modifier (First)     : Yoon YoungJun
* 11. Comment              :
**************************************************************************************************************
-->
<asp:PlaceHolder ID="UploadStatusBox_Before_Event_Holder" runat="server">
    <!-- Only Debug Mode IntelliSense -->
    <% if (DesignMode){ %>    
        <link type="text/css" rel="stylesheet" href="../../../../Contents/eniWeb.css" />
        <script type="text/javascript" src="../../../../Scripts/jQuery/jQuery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/jQuery.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Json/Json2.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.UserAgent.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Resources.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Classs.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Enum.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Extends.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Log.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Variables.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Message.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Loading.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Ajax.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.DbAccess.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Date.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Security.js"></script>
        <script type="text/javascript" src="../../../../Scripts/Framework/eniFramework.Sub.Utils.js"></script>
        <script type="text/javascript" src="../../../../Scripts/devexpress/ASPxScriptIntelliSense.js"></script>
        <!-- 개발모드 IntelliSense -->
        <script type="text/javascript">
            function Cast() {
                Control                          = ASPxClientPopupControl.Cast();
                Control.lblFileName              = ASPxClientLabel.Cast();
                Control.lblCurrentFileLength     = ASPxClientTextBox.Cast();
                Control.prbFilesCnt              = ASPxClientProgressBar.Cast();
                Control.prbFilesLength           = ASPxClientProgressBar.Cast();
                Control.lblUploadedFiles         = ASPxClientTextBox.Cast();
                Control.lblUploadedFileLength    = ASPxClientTextBox.Cast();
                Control.lblProgressTime          = ASPxClientTextBox.Cast();
                Control.lblProgressSpeed         = ASPxClientTextBox.Cast();
                Control.btnCancel                = ASPxClientButton.Cast();
                //Control.DefaultHeaderText = "입력하여주세요.";
                //Control.DefaultConfirmMessage = "아래에 입력하세요.";
                Control.StartDate = new Date();
                Control.CurrentFileIndex = 0;
                Control.CurrentFileName = "";
                //Control.CurrentFileLength = 0;
                //Control.TotalFileCount = 0;
                //Control.TotalContentLength = 0;
                //Control.IsInitStatus = false;
                Control.CallbackCancelF = 0;
                Control.ShowUploadStatus = function (pRetVal) { };
                return Control;
            }
        </script>
    <% } %> 

    <!-- 컨트롤 로컬 디자인 -->
    <style type="text/css">
    </style>

    <!-- 컨트롤 초기화전 스크립트 -->
    <script type="text/javascript">
        //var IsInitStatus, StartDate, TotalFileSize, CurrentFileIndex, CurrentFileName, CurrentFileSize, TotalFileSize

        function popUploadStatusBox_Init(s, e) {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>   
            
            popUSB.SetDefault();
        };
        // 대화상자 취소버튼 클릭시 이벤트
        function popUploadStatusBox_btnUploadCancel_Click(s, e) {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>   

            popUSB.Hide();

            popUSB.SetDefault();

            if (popUSB.CallbackCancelF) {
                popUSB.CallbackCancelF();
            }
        };
        
        <%--function SetChangeUploadingStatus(iTotalUploadCount, iTotalContentLength, sCurrentFilename, iCurrentUploadLength, iCurrentUploadedLength, iUploadedLength, iCurrentProgress, iProgress) {
            <% if (!DesignMode){ %>
            var popUSB = <%# ClientInstanceName %>;
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.IsInitStatus === false) {
                popUSB.StartDate = new Date();
                popUSB.TotalFileCount = iTotalUploadCount;
                popUSB.TotalContentLength = iTotalContentLength;
                popUSB.TotalFileSize = eni.Utils.GetFileSizeString(iTotalContentLength);
                popUSB.IsInitStatus = true;
            }

            if (popUSB.CurrentFileName !== sCurrentFilename) {
                popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
                popUSB.CurrentFileName = sCurrentFilename;
                popUSB.CurrentFileSize = eni.Utils.GetFileSizeString(iCurrentUploadLength);

                lblFileName.SetText("파일 : " + sCurrentFilename);
                lblFileName.GetMainElement().title = sCurrentFilename;
                lblUploadedFiles.SetText("전체 : " + popUSB.CurrentFileIndex + " / " + iTotalUploadCount + " file(s)");
            }

            prbFilesCnt.SetPosition(iCurrentProgress);

            lblCurrentFileLength.SetText(eni.Utils.GetFileSizeString(iCurrentUploadedLength) + " / " + popUSB.CurrentFileSize);

            lblUploadedFileLength.SetText(eni.Utils.GetFileSizeString(iUploadedLength) + " / " + popUSB.TotalFileSize);

            prbFilesLength.SetPosition(iProgress);

            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - popUSB.StartDate;
            var speed = iUploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = eni.Date.GetUTCTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((iTotalContentLength - iUploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = eni.Date.GetUTCTimeString(estimatedDate);

            lblProgressTime.SetText(elapsedTime + ' / ' + estimatedTime);
            lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(speed) + "/s");
        };--%>
    </script>
</asp:PlaceHolder>

<eni:eniPopupControl ID="popUploadStatusBox" ClientInstanceName="popUploadStatusBox" runat="server"  
    Width="460px" HeaderText="파입업로드 상태" ToolTip="파일 업로드 상태를 표시합니다." Modal="True" ShowCloseButton="False" ShowFooter="True" 
    PopupAnimationType="Fade" CloseAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
    AllowDragging="true" ShowPageScrollbarWhenModal="True" ShowSizeGrip="False" CloseAnimationType="None">
    <ClientSideEvents Init="popUploadStatusBox_Init" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <asp:Table runat="server" Width="460px" Height="105px">
                <asp:TableRow Height="21px">
                    <asp:TableCell>
                        <eni:eniLabel ID="lblFileName" ClientInstanceName="lblFileName" SkinID="Advanced-01" runat="server" 
                            Wrap="False"
                            style="overflow:hidden">
                        </eni:eniLabel>
                    </asp:TableCell>
                    <asp:TableCell Width="120px"  HorizontalAlign="Right">
                        <eni:eniLabel ID="lblCurrentFileLength" ClientInstanceName="lblCurrentFileLength" SkinID="Advanced-01" runat="server" 
                            Wrap="False">
                        </eni:eniLabel>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="25px">
                    <asp:TableCell ColumnSpan="2">
                        <eni:eniProgressBar ID="prbFilesCnt" ClientInstanceName="prbFilesCnt" SkinID="Advanced-01" runat="server"
                            Width="100%">
                        </eni:eniProgressBar>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="25px">
                    <asp:TableCell ColumnSpan="2">
                        <eni:eniProgressBar ID="prbFilesLength" ClientInstanceName="prbFilesLength" SkinID="Advanced-01" runat="server" CssClass="BottomMargin" 
                            Width="100%">
                        </eni:eniProgressBar>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="21px">
                    <asp:TableCell>
                        <eni:eniLabel ID="lblUploadedFiles" ClientInstanceName="lblUploadedFiles" SkinID="Advanced-01" runat="server" 
                            Wrap="False"
                            style="overflow:hidden;">
                        </eni:eniLabel>
                    </asp:TableCell>
                    <asp:TableCell Width="120px" HorizontalAlign="Right">
                        <eni:eniLabel ID="lblUploadedFileLength" ClientInstanceName="lblUploadedFileLength" SkinID="Advanced-01" runat="server" 
                            Wrap="False">
                        </eni:eniLabel>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="21px">
                    <asp:TableCell>
                        <eni:eniLabel ID="lblProgressTime" ClientInstanceName="lblProgressTime" SkinID="Advanced-01" runat="server" 
                            Wrap="False" style="overflow:hidden">
                        </eni:eniLabel>
                    </asp:TableCell>
                    <asp:TableCell Width="120px" HorizontalAlign="Right">
                        <eni:eniLabel ID="lblProgressSpeed" ClientInstanceName="lblProgressSpeed" SkinID="Advanced-01" runat="server" 
                            Wrap="False">
                        </eni:eniLabel>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <FooterTemplate>
        <asp:Table runat="server" CssClass="Width100f" Height="30px">
            <asp:TableRow>
                <asp:TableCell runat="server" style="padding-right:10px">
                    <eni:eniButton ID="btnUploadCancel" ClientInstanceName="btnUploadCancel" SkinID="Advanced-M-01" runat="server"
                        Text="취소" ToolTip="아직은 지원하지 않습니다.">
                        <ClientSideEvents Click="popUploadStatusBox_btnUploadCancel_Click" />
                    </eni:eniButton>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </FooterTemplate>
</eni:eniPopupControl>

<asp:PlaceHolder ID="UploadStatusBox_After_Event_Holder" runat="server">
    <!-- 컨트롤 초기화 후 스트립트 -->
    <script type="text/javascript">
        popUploadStatusBox.lblFileName          = ASPxClientLabel.Cast(lblFileName);
        popUploadStatusBox.lblCurrentFileLength = ASPxClientLabel.Cast(lblCurrentFileLength);
        popUploadStatusBox.prbFilesCnt          = ASPxClientProgressBar.Cast(prbFilesCnt);
        popUploadStatusBox.prbFilesLength       = ASPxClientProgressBar.Cast(prbFilesLength);
        popUploadStatusBox.lblUploadedFiles     = ASPxClientLabel.Cast(lblUploadedFiles);
        popUploadStatusBox.lblUploadedFileLength = ASPxClientLabel.Cast(lblUploadedFileLength);
        popUploadStatusBox.lblProgressTime      = ASPxClientLabel.Cast(lblProgressTime);
        popUploadStatusBox.lblProgressSpeed     = ASPxClientLabel.Cast(lblProgressSpeed);
        popUploadStatusBox.btnUploadCancel      = ASPxClientButton.Cast(btnUploadCancel);
        //popUploadStatusBox.DefaultHeaderText = "입력하여주세요.";
        //popUploadStatusBox.DefaultConfirmMessage = "아래에 입력하세요.";
        popUploadStatusBox.StartDate = new Date();
        popUploadStatusBox.CurrentFileIndex = 0;
        popUploadStatusBox.CurrentFileName = "";
        //popUploadStatusBox.CurrentFileLength = 0;
        //popUploadStatusBox.CurrentFileSize = 0;
        //popUploadStatusBox.TotalFileCount = 0;
        //popUploadStatusBox.TotalContentLength = 0;
        //popUploadStatusBox.TotalFileSize = 0;
        //popUploadStatusBox.IsInitStatus = false;
        popUploadStatusBox.CallbackCancelF = 0;
        
        popUploadStatusBox.SetDefault = function () {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            popUSB.lblFileName.SetText("파일 이름 확인 중...");
            popUSB.lblCurrentFileLength.SetValue("파일 용량 확인 중...");
            popUSB.prbFilesCnt.SetPosition(0);
            popUSB.lblUploadedFiles.SetText("파일 갯수 확인 중...");
            popUSB.lblUploadedFileLength.SetValue("파일 총용량 확인 중...");
            popUSB.prbFilesLength.SetPosition(0);
            popUSB.lblProgressTime.SetText("00:00:00 / 00:00:00");
            if (eni.Utils) {
                popUSB.lblProgressSpeed.SetValue(eni.Utils.GetFileSizeString(0) + "/s");
            } else {
                popUSB.lblProgressSpeed.SetValue("0/s");
            }
            
            popUSB.StartDate = new Date();
            popUSB.CurrentFileIndex = 0;
            popUSB.CurrentFileName = "";
            //popUSB.CurrentFileLength = 0;
            //popUSB.CurrentFileSize = 0;
            //popUSB.TotalFileCount = 0;
            //popUSB.TotalContentLength = 0;
            //popUSB.TotalFileSize = 0;
            //popUSB.IsInitStatus = false;
            popUSB.CallbackCancelF = 0;
        };

        popUploadStatusBox.ShowUploadStatus = function (pCallbackCancelF) {
            <% if (!DesignMode){ %>   
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>   
            var popUSB = Cast();
            <% } %>   

            popUSB.Show();

            popUSB.StartDate = new Date();

            if (pCallbackCancelF) {
                popUSB.CallbackCancelF = pCallbackCancelF;
            } else {
                popUSB.CallbackCancelF = 0;
            }
        };

        popUploadStatusBox.CloseUploadStatus = function () {
            <% if (!DesignMode){ %>   
            var popUSB = window['<%# ClientInstanceName %>']
            <% } else { %>   
            var popUSB = Cast();
            <% } %>   

            popUSB.Hide();

            popUSB.SetDefault();
        };

        <%--popUploadStatusBox.InitStatus = function (iTotalUploadCount, iTotalContentLength) {
            <% if (!DesignMode){ %>   
            var popUploadStatusBox = window['<%# ClientInstanceName %>']
            <% } else { %>   
            var popUploadStatusBox = Cast();
            <% } %>   

            if (popUploadStatusBox.IsVisible() === false) {
                return;
            }

            if (popUploadStatusBox.IsInitStatus) {
                return;
            }

            popUploadStatusBox.StartDate = new Date();
            popUploadStatusBox.TotalFileCount = iTotalUploadCount;
            popUploadStatusBox.TotalContentLength = iTotalContentLength;
            popUploadStatusBox.IsInitStatus = true;
        };
        popUploadStatusBox.SetUploadingFile = function (sCurrentFilename, iCurrentUploadLength) {
            <% if (!DesignMode){ %>   
            var popUploadStatusBox = window['<%# ClientInstanceName %>']
            <% } else { %>   
            var popUploadStatusBox = Cast();
            <% } %>   

            if (popUploadStatusBox.IsVisible() === false) {
                return;
            }

            if (popUploadStatusBox.CurrentFileName === sCurrentFilename) {
                return;
            }

            popUploadStatusBox.CurrentFileIndex = popUploadStatusBox.CurrentFileIndex + 1;
            popUploadStatusBox.CurrentFileName = sCurrentFilename;
            popUploadStatusBox.CurrentFileLength = iCurrentUploadLength;

            popUploadStatusBox.lblFileName.SetText("파일 : " + popUploadStatusBox.CurrentFileName);
            popUploadStatusBox.lblFileName.GetMainElement().title = popUploadStatusBox.CurrentFileName;
            popUploadStatusBox.lblUploadedFiles.SetText("전체 : " + popUploadStatusBox.CurrentFileIndex + " / " + popUploadStatusBox.TotalFileCount + " file(s)");
        };--%>
        

        <%--popUploadStatusBox.SetChangeUploadingStatus = function (iTotalUploadCount, iTotalContentLength, sCurrentFilename, iCurrentUploadLength, iCurrentUploadedLength, iUploadedLength, iCurrentProgress, iProgress) {
            <% if (!DesignMode){ %>   
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>   
            var popUSB = Cast();
            <% } %>
            
            if (popUSB.IsVisible() === false) {
                return;
            }
            
            if (popUSB.IsInitStatus === false) {
                popUSB.StartDate = new Date();
                popUSB.TotalFileCount = iTotalUploadCount;
                popUSB.TotalContentLength = iTotalContentLength;
                popUSB.TotalFileSize = eni.Utils.GetFileSizeString(iTotalContentLength);
                popUSB.IsInitStatus = true;
            }

            if (popUSB.CurrentFileName !== sCurrentFilename) {
                popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
                popUSB.CurrentFileName = sCurrentFilename;
                popUSB.CurrentFileSize = eni.Utils.GetFileSizeString(iCurrentUploadLength);

                popUSB.lblFileName.SetText("파일 : " + sCurrentFilename);
                popUSB.lblFileName.GetMainElement().title = sCurrentFilename;
                popUSB.lblUploadedFiles.SetText("전체 : " + popUSB.CurrentFileIndex + " / " + iTotalUploadCount + " file(s)");
            }

            popUSB.prbFilesCnt.SetPosition(iCurrentProgress);

            popUSB.lblCurrentFileLength.SetText(eni.Utils.GetFileSizeString(iCurrentUploadedLength) + " / " + popUSB.CurrentFileSize);

            popUSB.lblUploadedFileLength.SetText(eni.Utils.GetFileSizeString(iUploadedLength) + " / " + popUSB.TotalFileSize);

            popUSB.prbFilesLength.SetPosition(iProgress); 

            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - popUSB.StartDate;
            var speed = iUploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = eni.Date.GetUTCTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((iTotalContentLength - iUploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = eni.Date.GetUTCTimeString(estimatedDate);

            popUSB.lblProgressTime.SetText(elapsedTime + ' / ' + estimatedTime);
            popUSB.lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(speed) + "/s");
        };--%>

        <%--popUploadStatusBox.SetChangeUploadingStatus = function (iTotalUploadCount, iTotalContentLength, sCurrentFilename, iCurrentUploadLength, iCurrentUploadedLength, iUploadedLength, iCurrentProgress, iProgress) {
            <% if (!DesignMode){ %>
            var popUSB = <%# ClientInstanceName %>;
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.IsInitStatus === false) {
                popUSB.StartDate = new Date();
                popUSB.TotalFileCount = iTotalUploadCount;
                popUSB.TotalContentLength = iTotalContentLength;
                popUSB.TotalFileSize = eni.Utils.GetFileSizeString(iTotalContentLength);
                popUSB.IsInitStatus = true;
            }

            //if (popUSB.CurrentFileName !== sCurrentFilename) {
            //    popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
            //    popUSB.CurrentFileName = sCurrentFilename;
            //    popUSB.CurrentFileSize = eni.Utils.GetFileSizeString(iCurrentUploadLength);

            //    lblFileName.SetText("파일 : " + sCurrentFilename);
            //    lblFileName.GetMainElement().title = sCurrentFilename;
            //    lblUploadedFiles.SetText("전체 : " + popUSB.CurrentFileIndex + " / " + iTotalUploadCount + " file(s)");
            //}

            popUSB.SetCurrentFileUploadingProgress(sCurrentFilename, iCurrentUploadLength, iTotalUploadCount);

            prbFilesCnt.SetPosition(iCurrentProgress);

            lblCurrentFileLength.SetText(eni.Utils.GetFileSizeString(iCurrentUploadedLength) + " / " + popUSB.CurrentFileSize);

            lblUploadedFileLength.SetText(eni.Utils.GetFileSizeString(iUploadedLength) + " / " + popUSB.TotalFileSize);

            prbFilesLength.SetPosition(iProgress);

            popUSB.UpdateProgressStatus(iUploadedLength, iTotalContentLength)
        };

        popUploadStatusBox.SetCurrentFileUploadingProgress = function(sCurrentFilename, iCurrentUploadLength, iTotalUploadCount){
            <% if (!DesignMode){ %>
            var popUSB = <%# ClientInstanceName %>;
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.CurrentFileName !== sCurrentFilename) {
                popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
                popUSB.CurrentFileName = sCurrentFilename;
                popUSB.CurrentFileSize = eni.Utils.GetFileSizeString(iCurrentUploadLength);

                lblFileName.SetText("파일 : " + sCurrentFilename);
                lblFileName.GetMainElement().title = sCurrentFilename;
                lblUploadedFiles.SetText("전체 : " + popUSB.CurrentFileIndex + " / " + iTotalUploadCount + " file(s)");
            }
        };

        popUploadStatusBox.UpdateProgressStatus = function(iUploadedLength, iTotalContentLength){
            <% if (!DesignMode){ %>
            var popUSB = <%# ClientInstanceName %>;
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - popUSB.StartDate;
            var speed = iUploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = eni.Date.GetUTCTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((iTotalContentLength - iUploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = eni.Date.GetUTCTimeString(estimatedDate);

            lblProgressTime.SetText(elapsedTime + ' / ' + estimatedTime);
            lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(speed) + "/s");
        };--%>
        popUploadStatusBox.SetChangeUploadingStatus = function(e){
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.IsVisible() === false) {
                return;
            }

            //if (popUSB.CurrentFileName !== e.currentFileName) {
            //    popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
            //    popUSB.CurrentFileName = e.currentFileName;
            //}

            //함수를 합쳐보니 익스/크롬 버그때문에 뻗어버린다. 아래와 같이 순서로 해야한다
            popUSB.SetCurrentFileUploadingProgress(e.currentFileName, e.currentFileUploadedContentLength, e.currentFileContentLength);

            popUSB.prbFilesCnt.SetPosition(e.currentFileProgress);

            popUSB.SetTotalUploadingProgress(e.fileCount, e.uploadedContentLength, e.totalContentLength);

            popUSB.prbFilesLength.SetPosition(e.progress);

            popUSB.UpdateProgressStatus(e.uploadedContentLength, e.totalContentLength);
        };

        popUploadStatusBox.SetCurrentFileUploadingProgress = function(fileName, uploadedLength, fileLength) {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.CurrentFileName !== fileName) {
                popUSB.IsChangeIndex = true;
                popUSB.CurrentFileIndex = popUSB.CurrentFileIndex + 1;
                popUSB.CurrentFileName = fileName;

                popUSB.lblFileName.SetText("파일 : " + fileName);
                popUSB.lblFileName.GetMainElement().title = fileName;
            }
            popUSB.lblCurrentFileLength.SetText(eni.Utils.GetFileSizeString(uploadedLength) + " / " + eni.Utils.GetFileSizeString(fileLength));
        };
        popUploadStatusBox.SetTotalUploadingProgress = function(count, uploadedLength, totalLength) {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            if (popUSB.IsChangeIndex) {
                popUSB.IsChangeIndex = false;
                popUSB.lblUploadedFiles.SetText("전체 : " + popUSB.CurrentFileIndex + ' / ' + count + " file(s)");
            }
            popUSB.lblUploadedFileLength.SetText(eni.Utils.GetFileSizeString(uploadedLength) + " / " + eni.Utils.GetFileSizeString(totalLength));
        };
        popUploadStatusBox.UpdateProgressStatus = function(uploadedLength, totalLength) {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            var currentDate = new Date();
            var elapsedDateMilliseconds = currentDate - popUSB.StartDate;
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
            var elapsedDate = new Date(elapsedDateMilliseconds);
            var elapsedTime = eni.Date.GetUTCTimeString(elapsedDate);
            var estimatedMilliseconds = Math.floor((totalLength - uploadedLength) / speed) * 1000;
            var estimatedDate = new Date(estimatedMilliseconds);
            var estimatedTime = eni.Date.GetUTCTimeString(estimatedDate);
            var speed = uploadedLength / (elapsedDateMilliseconds / 1000);

            popUSB.lblProgressTime.SetText(elapsedTime + ' / ' + estimatedTime);
            popUSB.lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(speed) + "/s");
        };
        <%--popUploadStatusBox.ClearProgressInfo = function() {
            <% if (!DesignMode){ %>
            var popUSB = window['<%# ClientInstanceName %>'];
            <% } else { %>
            var popUSB = Cast();
            <% } %>

            popUSB.SetCurrentFileUploadingProgress("", 0, 0);
            popUSB.prbFilesCnt.SetPosition(0);
            popUSB.SetTotalUploadingProgress(0, 0, 0, 0);
            popUSB.prbFilesLength.SetPosition(0);
            popUSB.lblProgressTime.SetText("00:00:00 / 00:00:00");
            popUSB.lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(0) + "/s");
            mail_write.fileName = new String();
            mail_write.fileNumber = 0;
        };--%>

        //function SetCurrentFileUploadingProgress(fileName, uploadedLength, fileLength) {
        //    lblFileName.SetText("파일 : " + fileName);
        //    lblFileName.GetMainElement().title = fileName;
        //    lblCurrentFileLength.SetText(eni.Utils.GetFileSizeString(uploadedLength) + " / " + eni.Utils.GetFileSizeString(fileLength));
        //};
        //function SetTotalUploadingProgress(number, count, uploadedLength, totalLength) {
        //    lblUploadedFiles.SetText("전체 : " + number + ' / ' + count + " file(s)");
        //    lblUploadedFileLength.SetText(eni.Utils.GetFileSizeString(uploadedLength) + " / " + eni.Utils.GetFileSizeString(totalLength));
        //};
        //function UpdateProgressStatus(uploadedLength, totalLength) {
        //    var currentDate = new Date();
        //    var elapsedDateMilliseconds = currentDate - mail_write.startDate;
        //    var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
        //    var elapsedDate = new Date(elapsedDateMilliseconds);
        //    var elapsedTime = eni.Date.GetUTCTimeString(elapsedDate);
        //    var estimatedMilliseconds = Math.floor((totalLength - uploadedLength) / speed) * 1000;
        //    var estimatedDate = new Date(estimatedMilliseconds);
        //    var estimatedTime = eni.Date.GetUTCTimeString(estimatedDate);
        //    var speed = uploadedLength / (elapsedDateMilliseconds / 1000);
        //    lblProgressTime.SetText(elapsedTime + ' / ' + estimatedTime);
        //    lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(speed) + "/s");
        //};
        //function ClearProgressInfo() {
        //    SetCurrentFileUploadingProgress("", 0, 0);
        //    prbFilesCnt.SetPosition(0);
        //    SetTotalUploadingProgress(0, 0, 0, 0);
        //    prbFilesLength.SetPosition(0);
        //    lblProgressTime.SetText("00:00:00 / 00:00:00");
        //    lblProgressSpeed.SetText(eni.Utils.GetFileSizeString(0) + "/s");
        //    mail_write.fileName = new String();
        //    mail_write.fileNumber = 0;
        //};

        //기존 스크립트 삭제 및 초기화
        window['<%# ClientInstanceName %>'] = popUploadStatusBox;
        //var <%# ClientInstanceName %> = popUploadStatusBox;
        popUploadStatusBox = undefined;
        //delete window['lblFileName'];
        //delete window['lblCurrentFileLength'];
        //delete window['prbFilesCnt'];
        //delete window['prbFilesLength'];
        //delete window['lblUploadedFiles'];
        //delete window['lblUploadedFileLength'];
        //delete window['lblProgressTime'];
        //delete window['lblProgressSpeed'];
        //delete window['btnUploadCancel'];
        lblFileName = undefined;
        lblCurrentFileLength = undefined;
        prbFilesCnt = undefined;
        prbFilesLength = undefined;
        lblUploadedFiles = undefined;
        lblUploadedFileLength = undefined;
        lblProgressTime = undefined;
        lblProgressSpeed = undefined;
        btnUploadCancel = undefined;
    </script>
</asp:PlaceHolder>