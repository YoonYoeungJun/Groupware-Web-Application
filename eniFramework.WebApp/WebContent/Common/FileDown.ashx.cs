using System;
using System.Web;
using System.Text;
using SystemIO = System.IO;
using System.Globalization;

using hMailServerService;
using hMailServerService.SocketLayer;

using eniFramework.SharpZipLib.Zip;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// FileDown의 요약 설명입니다.
    /// </summary>
    public class FileDown : IHttpHandler {
        HttpRequest lgRequest       = null;
        HttpResponse lgResponse     = null;
        HttpServerUtility lgServer  = null;
        DatabaseAccess lgDbAccess   = null;
        CultureInfo lgCulture       = null;

        string lgLang   = "KO";
        string lgCmd    = string.Empty;
        string fileDir  = string.Empty;
        string filePath = string.Empty;
        string fileType = string.Empty;
        string fileName = string.Empty;
        long fileSize   = 0;

        public bool IsReusable {
            get {
                return false;
            }
        }

        public void ProcessRequest(HttpContext context) {
            this.lgRequest      = context.Request;
            this.lgResponse     = context.Response;
            this.lgServer       = context.Server;
            this.lgDbAccess     = (DatabaseAccess)Global.gDbAccess;
            this.lgDbAccess.SetApplicationName("FileDown");

            var cur_cul     = System.Threading.Thread.CurrentThread.CurrentCulture;
            var str_cur_cul = EnumDef.ConvertCultureToLang(cur_cul);
            var str_rq_cul  = Utilities.GetLang(context);

            if (!string.IsNullOrWhiteSpace(str_rq_cul) && str_cur_cul != str_rq_cul) {
                this.lgLang     = str_rq_cul;
                cur_cul         = new CultureInfo(EnumDef.ConvertLangToCulture(str_rq_cul));
                this.lgCulture  = cur_cul;
            } else {
                if (string.IsNullOrWhiteSpace(str_rq_cul)) {
                    this.lgLang     = str_cur_cul;
                    this.lgCulture  = new CultureInfo(EnumDef.ConvertLangToCulture(str_cur_cul));
                } else {
                    this.lgLang     = str_rq_cul;
                    this.lgCulture  = new CultureInfo(EnumDef.ConvertLangToCulture(str_rq_cul));
                }
            }

            try {
                this.lgCmd = this.lgRequest.QueryString["cmd"];
                if (string.IsNullOrWhiteSpace(this.lgCmd)) {
                    //잘못된 요청입니다.
                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                }

                var strSql = default(StringBuilder);

                switch (this.lgCmd.ToLower()) {
                    case "boardfile":
                        var userId  = this.lgRequest.QueryString["userid"];
                        var bbs_no  = this.lgRequest.QueryString["no"];
                        var bbs_fno = this.lgRequest.QueryString["fno"];

                        if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(bbs_no) || string.IsNullOrWhiteSpace(bbs_fno)) {
                            //잘못된 요청입니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                        }

                        strSql = new StringBuilder();
                        strSql.AppendLine(" SELECT TOP 1 A.CATEGORY_CD, B.CATEGORY_GROUP_CD, A.FILE_NAME, A.FILE_SIZE, A.PHY_FILE_NAME, A.CONTENT_TYPE, B.USER_ID ");
                        strSql.AppendLine(" FROM B_BBS_ATTACH (NOLOCK) A ");
                        strSql.AppendLine(" LEFT JOIN B_BBS (NOLOCK) B ON(A.NO = B.NO AND A.CATEGORY_CD = B.CATEGORY_CD)");
                        strSql.AppendLine(string.Format(" WHERE A.NO = {0}", Data.FilterVariable(bbs_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                        strSql.AppendLine(string.Format(" AND A.FILE_NO = {0}", Data.FilterVariable(bbs_fno, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));

                        var dtFileInfo = this.lgDbAccess.ExecuteDataSet(strSql.ToString(), "B_BBS_ATTACH").Tables["B_BBS_ATTACH"];

                        if (dtFileInfo.Rows.Count > 0) {
                            var categoryCd = dtFileInfo.Rows[0]["CATEGORY_CD"].ToString();

                            strSql.Clear();
                            strSql.AppendLine(" SELECT TOP 1 DOWN_USER_ID ");
                            strSql.AppendLine(" FROM B_BBS_ATTACH_DWON_HIST ");
                            strSql.AppendLine(string.Format(" WHERE NO = {0}", Data.FilterVariable(bbs_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                            strSql.AppendLine(string.Format(" AND CATEGORY_CD = {0}", Data.FilterVariable(categoryCd)));
                            strSql.AppendLine(string.Format(" AND FILE_NO = {0}", Data.FilterVariable(bbs_fno, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                            strSql.AppendLine(string.Format(" AND DOWN_USER_ID = {0}", Data.FilterVariable(userId)));

                            var dtUserDownHist = this.lgDbAccess.ExecuteDataSet(strSql.ToString()).Tables[0];

                            if (dtUserDownHist.Rows.Count > 0) {
                                strSql.Clear();
                                strSql.AppendLine(" UPDATE A SET ");
                                strSql.AppendLine(" A.DOWN_CNT = A.DOWN_CNT + 1 ");
                                strSql.AppendLine(" FROM B_BBS_ATTACH_DWON_HIST A ");
                                strSql.AppendLine(string.Format(" WHERE NO = {0}", Data.FilterVariable(bbs_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                                strSql.AppendLine(string.Format(" AND CATEGORY_CD = {0}", Data.FilterVariable(categoryCd)));
                                strSql.AppendLine(string.Format(" AND FILE_NO = {0}", Data.FilterVariable(bbs_fno, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
                                strSql.AppendLine(string.Format(" AND DOWN_USER_ID = {0}", Data.FilterVariable(userId)));
                            } else {
                                strSql.Clear();
                                strSql.AppendLine(" INSERT INTO B_BBS_ATTACH_DWON_HIST (NO, CATEGORY_CD, FILE_NO, DOWN_USER_ID, DOWN_DATE, DOWN_CNT) ");
                                strSql.Append(" VALUES( ");
                                strSql.Append(Data.FilterVariable(bbs_no, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                strSql.Append(Data.FilterVariable(categoryCd, true));
                                strSql.Append(Data.FilterVariable(bbs_fno, FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                strSql.Append(Data.FilterVariable(userId, true));
                                strSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YY_MM_DD_HH_MM_SS), true));
                                strSql.Append(Data.FilterVariable(1, FilterVarType.NoBraceButReplSingleWithDoubleQuotation));
                                strSql.AppendLine(" ) ");
                            }

                            this.lgDbAccess.ExecuteNonQuery(strSql.ToString());

                            this.fileName = dtFileInfo.Rows[0]["FILE_NAME"].ToString();
                            var categoryGroup = dtFileInfo.Rows[0]["CATEGORY_GROUP_CD"].ToString();
                            var phyFileName = dtFileInfo.Rows[0]["PHY_FILE_NAME"].ToString();

                            if (categoryCd == "BBS_DEPT") {
                                if (string.IsNullOrWhiteSpace(categoryGroup)) {
                                    //요청하신 게시물의 실제 첨부 경로를 추출하던중 경로설정에 문제가 발생하였습니다. 관리자에게 문의하세요.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20013"));
                                }
                                this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Board, PathFormatter.FullPhysicalPath, PathType.Attach, categoryGroup);
                            } else {
                                this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Board, PathFormatter.FullPhysicalPath, PathType.Attach, categoryCd);
                            }

                            this.filePath = SystemIO.Path.Combine(this.fileDir, phyFileName);

                            if (SystemIO.File.Exists(filePath) == false) {
                                //요청한 게시물의 첨부파일이 존재하지 않습니다. 관리자에게 문의 하세요.
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20014"));
                            } else {
                                this.fileType = hMailServerProvider.GetFileType(this.fileName);
                                var fileInfo = new SystemIO.FileInfo(this.filePath);
                                this.fileSize = fileInfo.Length;
                            }

                            this.SendFileProcess();
                        } else {
                            //요청한 게시물의 첨부파일이 존재하지 않습니다. 관리자에게 문의 하세요.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20014"));
                        }
                        break;
                    case "messagefile": //2015-10-25 이전까지의 요청 파라미터
                    case "mf":          //2015-10-25 이후의 요청 파라미터
                        if (string.IsNullOrWhiteSpace(lgRequest.QueryString["mid"]) || string.IsNullOrWhiteSpace(lgRequest.QueryString["fno"])) {
                            //잘못된 요청입니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                        }

                        var msg_id = 0L;
                        var file_no = 0;
                        if (long.TryParse(lgRequest.QueryString["mid"], out msg_id) == false) {
                            //요청한 메일 아이디 형식은 지원하지 않습니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20001"));
                        }
                        if (int.TryParse(lgRequest.QueryString["fno"], out file_no) == false) {
                            //요청한 메일의 첨부파일 번호가 잘못되었습니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20002"));
                        }
                        if (!hMailServerProvider.ExistsMessage(this.lgDbAccess, msg_id)) {
                            //요청한 메일을 서버에서 찾을수 없습니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20003"));
                        }
                        var dr_message = hMailServerProvider.GetMessage(this.lgDbAccess, -1, msg_id);
                        var strParseType = dr_message.PARSETYPE;
                        if (string.IsNullOrWhiteSpace(strParseType)) {
                            //요청한 메일의 파서를 찾을수 없습니다. 관리자에게 문의 하세요.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20007"));
                        }

                        var dr_Attachment = hMailServerProvider.GetAttachment(this.lgDbAccess, msg_id, file_no);
                        if (dr_Attachment != null) {
                            this.fileType = dr_Attachment.ATTACHMENT_CONTENT_TYPE;
                        }

                        switch (strParseType.ToLower()) {
                            default:
                            case "local":       //hMailserver 타입 라이브러리로 가능함
                                var local_msg = hMailServerProvider.GetAPIMessageByMessageID(dr_message);
                                if (local_msg == null) {
                                    //요청한 메일을 형식화된 객체로 변환하던중 오류가 발생하였습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20004"));
                                }
                                if (local_msg.Attachments.Count == 0) {
                                    //요청한 메일의 첨부된 파일이 없습니다. 관리자에게 문의 하세요.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20005"));
                                }
                                if (local_msg.Attachments.Count - 1 >= file_no) {
                                    this.fileName = local_msg.Attachments[file_no].Filename;

                                    fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Temp, msg_id.ToString(), true);
                                    this.filePath = SystemIO.Path.Combine(fileDir, fileName);
                                    if (SystemIO.File.Exists(this.filePath)) {
                                        SystemIO.File.Delete(this.filePath);
                                    }
                                    
                                    local_msg.Attachments[file_no].SaveAs(this.filePath);

                                    var fileInfo = new SystemIO.FileInfo(this.filePath);
                                    this.fileSize = fileInfo.Length;
                                } else {
                                    //요청한 첨부파일을 찾을수 없습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20006"));
                                }
                                break;
                            case "cdo":         //CDO 메세지 타입 라이브러리로 가능함
                                var cdo_msg = hMailServerProvider.GetCDOMessageByMessageID(dr_message);
                                var cdo_eaget_msg = hMailServerProvider.GetEAGetMailByMessageID(dr_message);
                                if (cdo_msg == null) {
                                    //요청한 메일을 형식화된 객체로 변환하던중 오류가 발생하였습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20004"));
                                }
                                if (cdo_msg.Attachments.Count == 0 && cdo_eaget_msg.Attachments.Length == 0) {
                                    //요청한 메일의 첨부된 파일이 없습니다. 관리자에게 문의 하세요.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20005"));
                                }
                                
                                if (cdo_msg.Attachments.Count < cdo_eaget_msg.Attachments.Length) {
                                    if (cdo_eaget_msg.Attachments.Length - 1 >= file_no) {
                                        this.fileName = cdo_eaget_msg.Attachments[file_no].Name;

                                        this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Temp, msg_id.ToString(), true);
                                        this.filePath = SystemIO.Path.Combine(this.fileDir, this.fileName);
                                        if (SystemIO.File.Exists(this.filePath)) {
                                            SystemIO.File.Delete(this.filePath);
                                        }

                                        cdo_eaget_msg.Attachments[file_no].SaveAs(this.filePath, true);

                                        var fileInfo = new SystemIO.FileInfo(this.filePath);
                                        this.fileSize = fileInfo.Length;
                                    } else {
                                        //요청한 첨부파일을 찾을수 없습니다.
                                        throw new System.Exception(this.GetGlobalResource("GCSTRESX20006"));
                                    }
                                } else {
                                    if (cdo_msg.Attachments.Count - 1 >= file_no) {
                                        this.fileName = cdo_msg.Attachments[file_no + 1].FileName;

                                        this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Temp, msg_id.ToString(), true);
                                        this.filePath = SystemIO.Path.Combine(this.fileDir, this.fileName);
                                        if (SystemIO.File.Exists(this.filePath)) {
                                            SystemIO.File.Delete(this.filePath);
                                        }

                                        cdo_msg.Attachments[file_no + 1].SaveToFile(this.filePath);

                                        var fileInfo = new SystemIO.FileInfo(this.filePath);
                                        this.fileSize = fileInfo.Length;
                                    } else {
                                        //요청한 첨부파일을 찾을수 없습니다.
                                        throw new System.Exception(this.GetGlobalResource("GCSTRESX20006"));
                                    }
                                }
                                break;
                            case "eaget":       //EAGet 메세지 타입 라이브러리로 가능함
                                var eaget_msg = hMailServerProvider.GetEAGetMailByMessageID(dr_message);
                                if (eaget_msg == null) {
                                    //요청한 메일을 형식화된 객체로 변환하던중 오류가 발생하였습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20004"));
                                }
                                if (eaget_msg.Attachments.Length == 0) {
                                    //요청한 메일의 첨부된 파일이 없습니다. 관리자에게 문의 하세요.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20005"));
                                }
                                if (eaget_msg.Attachments.Length - 1 >= file_no) {
                                    this.fileName = eaget_msg.Attachments[file_no].Name;

                                    this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Temp, msg_id.ToString(), true);
                                    this.filePath = SystemIO.Path.Combine(this.fileDir, this.fileName);
                                    if (SystemIO.File.Exists(this.filePath)) {
                                        SystemIO.File.Delete(this.filePath);
                                    }

                                    eaget_msg.Attachments[file_no].SaveAs(this.filePath, true);

                                    var fileInfo = new SystemIO.FileInfo(this.filePath);
                                    this.fileSize = fileInfo.Length;
                                } else {
                                    //요청한 첨부파일을 찾을수 없습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20006"));
                                }
                                break;
                        }
                        this.SendFileProcess();
                        break;

                    case "mbf":
                    case "messagebigfile": //Message Big File
                        if ((string.IsNullOrWhiteSpace(lgRequest.QueryString["mid"]) && string.IsNullOrWhiteSpace(lgRequest.QueryString["fid"])) ||
                            (string.IsNullOrWhiteSpace(lgRequest.QueryString["messageID"]) && string.IsNullOrWhiteSpace(lgRequest.QueryString["fid"]))) {
                            //잘못된 요청입니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                        }

                        var str_big_msg_id = this.lgRequest.QueryString["mid"];
                        if (string.IsNullOrWhiteSpace(str_big_msg_id)) {
                            str_big_msg_id = this.lgRequest.QueryString["messageID"];
                        }
                        var str_big_file_id = this.lgRequest.QueryString["fid"];

                        this.lgDbAccess.Connect();

                        strSql = new StringBuilder();
                        strSql.AppendLine(" SELECT  TOP(1) MESSAGEID, ");
                        strSql.AppendLine("     PHY_FILE_NAME, ");
                        strSql.AppendLine("     MESSAGEACCOUNTID, ");
                        strSql.AppendLine("     FILE_NAME, ");
                        strSql.AppendLine("     FILE_SIZE, ");
                        strSql.AppendLine("     DOWN_PERIOD_TO, ");
                        strSql.AppendLine("     DOWN_CNT, ");
                        strSql.AppendLine("     DELETED_YN ");
                        strSql.AppendLine(" FROM B_MAIL_BIG_ATTACH (NOLOCK) ");
                        strSql.AppendLine(string.Format(" WHERE MESSAGEID = {0}", Data.FilterVariable(str_big_msg_id)));
                        strSql.AppendLine(string.Format(" AND PHY_FILE_NAME = {0}", Data.FilterVariable(str_big_file_id)));

                        var dt_big_attach_file = this.lgDbAccess.ExecuteDataSet(strSql.ToString(), "B_MAIL_BIG_ATTACH").Tables["B_MAIL_BIG_ATTACH"];
                        if (dt_big_attach_file.Rows.Count == 0) {
                            //요청한 대용량 첨부파일이 존재하지 않습니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20008"));
                        } else {
                            var phy_file_name = dt_big_attach_file.Rows[0]["PHY_FILE_NAME"].ToString();
                            this.fileName = dt_big_attach_file.Rows[0]["FILE_NAME"].ToString();
                            var delete_yn = dt_big_attach_file.Rows[0]["DELETED_YN"].ToString().ToLower();
                            var account_id = -1;
                            var dt_period_to = DateTime.MinValue;
                            var down_count = 0;

                            if (int.TryParse(dt_big_attach_file.Rows[0]["MESSAGEACCOUNTID"].ToString(), out account_id) == false) {
                                //대용량 첨부 자료를 불러오던중 타입 변환 오류가 발생하여 다운로드 할 수 없습니다. 관리자에게 문의 하세요.
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20009"));
                            }
                            if (long.TryParse(dt_big_attach_file.Rows[0]["FILE_SIZE"].ToString(), out this.fileSize) == false) {
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20009"));
                            }
                            if (DateTime.TryParse(dt_big_attach_file.Rows[0]["DOWN_PERIOD_TO"].ToString(), out dt_period_to) == false) {
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20009"));
                            }
                            if (int.TryParse(dt_big_attach_file.Rows[0]["DOWN_CNT"].ToString(), out down_count) == false) {
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20009"));
                            }

                            var sUserId = hMailServerProvider.GetUserIDByAccountID(this.lgDbAccess, account_id);

                            if (string.IsNullOrWhiteSpace(sUserId)) {
                                //대용량 첨부 사용자 계정을 찾을수 없습니다. 퇴사등의 이유로 메일 서버에서 삭제 처리되었을수 있습니다.
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20010"));
                            }

                            this.fileDir = SystemIO.Path.Combine(Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Period, sUserId), str_big_msg_id);
                            this.filePath = SystemIO.Path.Combine(this.fileDir, phy_file_name);

                            if (dt_period_to > DateTime.Now) {
                                if (delete_yn == "n") {
                                    strSql.Clear();
                                    strSql.AppendLine(" UPDATE A SET ");
                                    strSql.AppendLine(" A.DOWN_CNT = A.DOWN_CNT + 1 ");
                                    strSql.AppendLine(" FROM B_MAIL_BIG_ATTACH A ");
                                    strSql.AppendLine(string.Format(" WHERE A.PHY_FILE_NAME = {0}", Data.FilterVariable(str_big_file_id)));
                                    strSql.AppendLine(" AND A.DELETED_YN = 'N' ");

                                    this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                                } else {
                                    //요청한 대용량 첨부파일은 기간이 만료되어 서버에서 삭제되었습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20011"));
                                }
                            } else { //다운로드 기간 지남(파일 삭제 로직)
                                if (SystemIO.File.Exists(this.filePath)) {
                                    SystemIO.File.Delete(this.filePath);
                                }

                                strSql = new StringBuilder();
                                strSql.AppendLine(" SELECT COUNT(*) FROM B_MAIL_BIG_ATTACH ");
                                strSql.AppendLine(string.Format(" WHERE MESSAGEID = {0}", Data.FilterVariable(str_big_msg_id)));
                                strSql.AppendLine(string.Format(" AND PHY_FILE_NAME = {0}", Data.FilterVariable(str_big_file_id)));
                                strSql.AppendLine(" AND DELETED_YN = 'N' ");

                                var ex_row_count = this.lgDbAccess.ExecuteRowCountQuery(strSql.ToString());

                                if (ex_row_count > 0) {
                                    strSql = new StringBuilder();
                                    strSql.AppendLine(" UPDATE A SET ");
                                    strSql.AppendLine(string.Format(" A.DELETED_DATE = {0}, ", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                                    strSql.AppendLine(" A.DELETED_YN = 'Y' ");
                                    strSql.AppendLine(" FROM B_MAIL_BIG_ATTACH A ");
                                    strSql.AppendLine(string.Format(" WHERE MESSAGEID = {0}", Data.FilterVariable(str_big_msg_id)));
                                    strSql.AppendLine(string.Format(" AND PHY_FILE_NAME = {0}", Data.FilterVariable(str_big_file_id)));

                                    this.lgDbAccess.ExecuteNonQuery(strSql.ToString());
                                }

                                //다운로드 기간이 만료되어 다운로드 할수 없습니다.
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20012"));
                            }
                        }

                        this.lgDbAccess.DisConnect();

                        this.SendFileProcess();
                        break;
                    case "eml":
                        if (string.IsNullOrWhiteSpace(lgRequest.QueryString["mids"])) {
                            //잘못된 요청입니다.
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                        }
                        var strMsgIds = context.Server.UrlDecode(lgRequest.QueryString["mids"]);
                        var arrStrMsgIds = strMsgIds.Split('|');

                        if (arrStrMsgIds.Length <= 0) {
                            throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));
                        }

                        this.fileDir = Global.gDirectorys.GetSpecialDirectory(PathKind.Mail, PathFormatter.FullPhysicalPath, PathType.Temp, DateTime.Now.Ticks.ToString(), true);

                        var filesPath = new string[arrStrMsgIds.Length];
                        var filesInfo = new string[arrStrMsgIds.Length];

                        for (int i = 0; i < arrStrMsgIds.Length; i++) {
                            long eml_msg_id = 0;

                            if (long.TryParse(arrStrMsgIds[i], out eml_msg_id)) {
                                this.lgDbAccess.Connect();

                                var oMsg = default(hMailServer.Message);
                                try {
                                    oMsg = hMailServerProvider.GetAPIMessageByMessageID(this.lgDbAccess, eml_msg_id);
                                } catch {
                                    //요청한 메일을 서버에서 찾을수 없습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20003"));
                                }

                                if (SystemIO.File.Exists(oMsg.Filename)) {
                                    var sMsgFileName = SystemIO.Path.GetFileName(oMsg.Filename);
                                    SystemIO.File.Copy(oMsg.Filename, SystemIO.Path.Combine(this.fileDir, sMsgFileName));

                                    filesPath[i] = SystemIO.Path.Combine(this.fileDir, sMsgFileName);

                                    var msg_row = hMailServerProvider.GetMessage(this.lgDbAccess, -1, eml_msg_id);

                                    var fileName = msg_row.MESSAGEFROMADDRESS.Replace('<', '[').Replace('>', ']');
                                    fileName = fileName.Replace('\\', ' ').Replace('\"', ' ');
                                    fileName = fileName.Replace('?', ' ');
                                    fileName += " " + msg_row.MESSAGEDATE.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS_KOR);
                                    filesInfo[i] = fileName;
                                } else {
                                    //요청한 메일을 서버에서 찾을수 없습니다.
                                    throw new System.Exception(this.GetGlobalResource("GCSTRESX20003"));
                                }

                                this.lgDbAccess.DisConnect();
                            } else {
                                //요청한 메일을 형식화된 객체로 변환하던중 오류가 발생하였습니다.
                                throw new System.Exception(this.GetGlobalResource("GCSTRESX20004"));
                            }
                        }

                        if (filesPath.Length != 1) {
                            this.fileType = "application/zip";

                            this.fileName = string.Format(this.GetGlobalResource("GCSTRESX20015"), filesInfo[0], filesInfo.Length - 1);
                            this.filePath = SystemIO.Path.Combine(this.fileDir, this.fileName);

                            //UNICODE 지원되지 않음 2017-07-13
                            //var stream = System.IO.File.Create(this.filePath);
                            //var zipFile = ZipFile.Create(stream);
                            //zipFile.BeginUpdate();
                            //for (int i = 0; i < filesPath.Length; i++) {
                            //    if (SystemIO.File.Exists(filesPath[i])) {
                            //        zipFile.Add(filesPath[i], filesInfo[i] + ".eml");

                            //    }
                            //}
                            //zipFile.CommitUpdate();
                            //zipFile.AbortUpdate();
                            //zipFile.Close();
                            //stream.Close();
                            //stream.Dispose();

                            //UNICODE 지원 코드
                            using (ZipOutputStream zops = new ZipOutputStream(System.IO.File.Create(this.filePath))) {
                                zops.SetLevel(9);
                                byte[] buffer = new byte[4096];
                                for (int i = 0; i < filesPath.Length; i++) {
                                    var entry = new ZipEntry(filesInfo[i] + ".eml") {
                                        DateTime = DateTime.Now,
                                        IsUnicodeText = true
                                    };
                                    zops.PutNextEntry(entry);
                                    using (SystemIO.FileStream fs = SystemIO.File.OpenRead(filesPath[i])) {
                                        int sourceBytes;
                                        do {
                                            sourceBytes = fs.Read(buffer, 0, buffer.Length);

                                            zops.Write(buffer, 0, sourceBytes);

                                        } while (sourceBytes > 0);
                                    }
                                }
                                zops.Finish();
                                zops.Close();
                            }

                            for (int i = 0; i < filesPath.Length; i++) {
                                if (SystemIO.File.Exists(filesPath[i])) {
                                    SystemIO.File.Delete(filesPath[i]);
                                }
                            }
                        } else {
                            this.fileType = "message/rfc822";

                            this.filePath = filesPath[0];
                            this.fileName = string.Format("{0}.eml", filesInfo[0]);
                        }

                        this.fileSize = new SystemIO.FileInfo(this.filePath).Length;
                        this.SendFileProcess();
                        break;
                    default: 
                        //잘못된 요청입니다.
                        throw new System.Exception(this.GetGlobalResource("GCSTRESX20000"));

                }
            } catch (System.Exception ex) {
                var strMessage = ex.Message;
                lgResponse.Write(string.Format(@"<script type='text/javascript'> alert('{0}'); window.close(); </script>", strMessage.Replace(Environment.NewLine, " ")));
                lgResponse.End();
            }
        }

        void SendFileProcess() {
            if (string.IsNullOrWhiteSpace(lgRequest.QueryString["mode"]) == false && this.fileType == "application/pdf") {
                lgResponse.Clear();
                lgResponse.ContentType = this.fileType;
                lgResponse.WriteFile(this.filePath);
                try {
                    lgResponse.End();
                } catch { }
            } else {
                if (!string.IsNullOrWhiteSpace(this.fileType)) {
                    lgResponse.ContentType = this.fileType;
                }
                lgResponse.AppendHeader("Progma", "public");
                lgResponse.AppendHeader("Expires", "0");
                lgResponse.AppendHeader("Content-Encoding", "utf-8");
                lgResponse.AppendHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
                lgResponse.AppendHeader("Cache-Control", "public");
                lgResponse.AppendHeader("Content-Description", this.lgRequest.Url.Host + "Generated Data");
                lgResponse.AppendHeader("Content-Disposition", "attachment; filename=" + this.GetEncodeFileName());
                lgResponse.AppendHeader("Content-Transfer-Encoding", "binary");
                //아래위 길이 때문에 브라우져에서 오류가 나서 무한으로 대기하는 증상이 생긴다.
                lgResponse.AppendHeader("Content-Length", this.fileSize.ToString());
                lgResponse.TransmitFile(this.filePath);
                lgResponse.Flush();
            }

            if (((this.lgCmd.ToLower() == "messagefile" || this.lgCmd.ToLower() == "mf") || 
                this.lgCmd.ToLower() == "eml") &&
                SystemIO.Directory.Exists(this.fileDir)) {
                SystemIO.Directory.Delete(this.fileDir, true);
            }
        }

        string GetEncodeFileName() {
            return HttpUtility.UrlPathEncode(this.fileName).Replace("+", " ");
        }

        string GetGlobalResource(string strKey) {
            return Resources.Global.ResourceManager.GetString(strKey, this.lgCulture);
        }
    }
}