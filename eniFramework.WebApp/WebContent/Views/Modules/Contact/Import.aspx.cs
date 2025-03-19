
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Reflection;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Web.Routing;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections.Specialized;
using Microsoft.VisualBasic;

using DevExpress.Web;
using DevExpress.Data.Linq;

// eniFramework Reperence part
using eniFramework.CSV;
using eniFramework.Json;
using eniFramework.String;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.Exception;
using eniFramework.Date;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.Annotations;


#endregion

namespace eniFramework.WebApp.Modules.Contact {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("sfid={sfid}, sfnm={sfnm}, SelectFolderKorName={selectFolderKorName}")]
    [AllowAnonymous, ReiterationPage]
    public partial class Import : BaseUIACTPage {
        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Groupware</NameSpace>
        /// <Module>②</Module>
        /// <Class>③</Class>
        /// <Desc>④
        ///   This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        ///   <FirstCreated>
        ///     <history name="creator" Date="created date">Make …</history>
        ///   </FirstCreated>
        ///   <Lastmodified>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///   </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        ///   <remark name="modifier"  Date="modified date">… </remark>
        ///   <remark name="modifier"  Date="modified date">… </remark>
        /// </Remarks>
        #endregion

        #region ▶ 1. Declaration part

        #region ■ 1.1 Global Constants

        #endregion

        #region ■ 1.2 SubClass variables

        
        
        #endregion

        #region ■ 1.3 Class Global variables


        #endregion

        #region ■ 1.4 Class Global properties

        protected override bool UsedSessionDataSet {
            get {
                return true;
            }
        }


        public override string BodyClassName { get { return "eniThm_layout_02"; } }
        public override string PageID { get { return "import_list"; } }
        public override bool RegisteredHiddenField { get { return true; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json |
                        JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_BlockUI | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Extends | JScriptKind.Framework_Resources |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework | JScriptKind.Framework_ControlBase |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Report |
                        JScriptKind.Framework_Message | JScriptKind.Framework_Loading | JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax |
                        JScriptKind.Framework_DbAccess | JScriptKind.Framework_Date | JScriptKind.Framework_Security | JScriptKind.Framework_Utils;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public Import()
            : base() {
        }

        protected override void OnInitWebUIPage() {
            
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
        }

        protected override void OnWebUIPageLoadComplete() {
        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRoutingParams(RouteData pRoute) {
        }

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {
          
        }

        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            DbQuery();

        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
        }

        #endregion

        #region ■ 2.7 Initializatize variables

        protected override void OnInitVariables() {
        }

        #endregion

        #region ■ 2.8 Set local global default variables


        protected override void SetDefulatValues() {
        }

        #endregion

        #region ■ 2.9 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery

        protected void DbQuery() {
            //lgStrSql = new StringBuilder();
            //lgStrSql.AppendLine(" SELECT CON_NM, ");
            //lgStrSql.AppendLine("     CON_GR_NM, ");
            //lgStrSql.AppendLine("     CON_FLAG_YN, ");
            //lgStrSql.AppendLine("     CON_EM, ");
            //lgStrSql.AppendLine("     CON_PN, ");
            //lgStrSql.AppendLine("     CON_ORG_BIZ_NM, ");
            //lgStrSql.AppendLine("     CON_ORG_DEPT_NM, ");
            //lgStrSql.AppendLine("     CON_ORG_PSTN_NM ");
            //lgStrSql.AppendLine(string.Format(" FROM UFN_TB_GET_CONTACTS({0}) ", Data.FilterVariable(lgWebAccount.UserId)));
            //lgStrSql.AppendLine(" ORDER BY CON_NM ASC ");

            //Data.MergeDataSet(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "UFN_TB_GET_CONTACTS"), true);
        }

        #endregion

        class EncodeUtf16ToUtf8 {
            public static string Utf16ToUtf8(string utf16String) {
                string utf8String = string.Empty;

                //UTF-16 바이트를 배열로 얻어온다.
                byte[] utf16Bytes = Encoding.Unicode.GetBytes(utf16String);

                //UTF-16 바이트를 배열을 UTF-8로 변환한다.
                byte[] utf8Bytes = Encoding.Convert(Encoding.Unicode, Encoding.UTF8, utf16Bytes);

                // UTF8 bytes 배열 내부에 UTF8 문자를 추가한다. 
                for (int i = 0; i < utf8Bytes.Length; i++) {
                    // Because char always saves 2 bytes, fill char with 0
                    byte[] utf8Container = new byte[2] { utf8Bytes[i], 0 };
                    utf8String += BitConverter.ToChar(utf8Container, 0);
                }

                // UTF8을 리턴한다.
                return utf8String;
            }

            public static string Utf16ToUtf8Ansi(string utf16String) {
                //UTF-16 바이트를 배열로 얻어온다.
                byte[] utf16Bytes = Encoding.Unicode.GetBytes(utf16String);
                //UTF-16 바이트를 배열을 UTF-8로 변환한다.
                byte[] utf8Bytes = Encoding.Convert(Encoding.Unicode, Encoding.UTF8, utf16Bytes);

                //  UTF8 bytes를 ansi로 변환해서 리턴한다.
                return Encoding.Default.GetString(utf8Bytes);
            }

            //Encoding.GetEncoding("EUC-KR").GetString(Encoding.GetEncoding("ISO-8859-1").GetBytes(text);
        }


        protected void upcImport_FileUploadComplete(object sender, FileUploadCompleteEventArgs e) {
            var file_extension = Path.GetExtension(e.UploadedFile.FileName).Replace(".", "");

            switch (file_extension.ToLower()) {
                case "csv":
                    using (var csvR = new CsvReader(new StreamReader(e.UploadedFile.FileNameInStorage, Encoding.Default), true)) {
                        try {
                            //int fieldCount = csv.FieldCount;
                            
                            lgDbAccess.Connect();

                            //var contactMap = new Dictionary<string, int>();
                            //contactMap.Add("", 0);

                            //string[] headers = csvR.GetFieldHeaders();
                            ////주소록 리스트 맵
                            //for (int i = 0; i < csvR.FieldCount; i++) {

                            //}

                            //for (int i = 0; i < csvR.FieldCount; i++) {

                            //}

                            while (csvR.ReadNextRecord()) {
                                if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("이름")]) == false) {

                                    var con_nm = csvR[csvR.GetFieldIndex("이름")];
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("중간 이름")]) == false) {
                                        con_nm = csvR[csvR.GetFieldIndex("중간 이름")] + con_nm;
                                    }
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("성")]) == false) {
                                        con_nm = csvR[csvR.GetFieldIndex("성")] + con_nm;
                                    }

                                    //B_USR_CONTACT
                                    lgStrSql = new StringBuilder();
                                    lgStrSql.AppendLine(" SELECT 1 FROM B_USR_CONTACT (NOLOCK) ");
                                    lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                    lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));

                                    if (lgDbAccess.ExecuteRowCountQuery(lgStrSql.ToString()) == 0) {
                                        var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) {
                                            Direction = ParameterDirection.Output
                                        };
                                        var aParams = new SqlParameter[] {
                                                new SqlParameter("@TYPE", "CT"), 
                                                new SqlParameter("@TEMP_GL_DATE", DBNull.Value),
                                                new SqlParameter("@USR_ID", lgACT.UserId),
                                                retParam
                                            };

                                        lgDbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                                        //B_USR_CONTACT INSERT
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" INSERT INTO B_USR_CONTACT (USR_ID, CON_NO, CON_NM, CON_GR_NO, CON_PHOTO, CON_FLAG, CON_TITLE, CON_FIRST_NAME, CON_MIDDLE_NAME, CON_LAST_NAME, CON_NICK_NAME, CON_CALL_NAME, CON_FULL_NAME, MEMO, REMARK, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                                        lgStrSql.Append(" VALUES (");
                                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                        lgStrSql.Append(Data.FilterVariable(retParam.Value, true));
                                        lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                        lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                        lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                        lgStrSql.Append(Data.FilterVariable("0", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                        lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("성")], true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("중간 이름")], true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("이름")], true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("호칭(영문)")], true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("호칭(한글)")], true));
                                        lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                        lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("메모")], true));
                                        lgStrSql.Append(Data.FilterVariable("NULL", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                                        lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                        lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                                        lgStrSql.Append(" )");
                                    } else {
                                        //B_USR_CONTACT UPDATE
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" UPDATE A SET ");
                                        lgStrSql.Append(string.Format(" A.CON_NICK_NAME = {0},", Data.FilterVariable(csvR[csvR.GetFieldIndex("호칭(영문)")])));
                                        lgStrSql.Append(string.Format(" A.CON_CALL_NAME = {0},", Data.FilterVariable(csvR[csvR.GetFieldIndex("호칭(한글)")])));
                                        lgStrSql.Append(string.Format(" A.MEMO = {0},", Data.FilterVariable(csvR[csvR.GetFieldIndex("메모")])));
                                        lgStrSql.Append(string.Format(" A.UPDT_USER_ID = {0}, ", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format(" A.UPDT_DT = {0} ", Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS))));
                                        lgStrSql.Append(" FROM B_USR_CONTACT A ");
                                        lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));
                                    }

                                    try {
                                        lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                                    } catch { }
                                    

                                    //B_USR_CONTACT_PHONE_NUMBER
                                    //근무처 전화
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("근무처 전화")]) == false) {
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" SELECT 1 FROM B_USR_CONTACT_PHONE_NUMBER (NOLOCK) ");
                                        lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));
                                        lgStrSql.Append(string.Format("AND CON_PN = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("근무처 전화")])));

                                        if (lgDbAccess.ExecuteRowCountQuery(lgStrSql.ToString()) == 0) {

                                            var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) {
                                                Direction = ParameterDirection.Output
                                            };
                                            var aParams = new SqlParameter[] {
                                                new SqlParameter("@TYPE", "CT"), 
                                                new SqlParameter("@TEMP_GL_DATE", DBNull.Value),
                                                new SqlParameter("@USR_ID", lgACT.UserId),
                                                retParam
                                            };

                                            lgDbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                                            //B_USR_CONTACT_PHONE_NUMBER INSERT
                                            lgStrSql.Clear();
                                            lgStrSql.AppendLine(" INSERT INTO B_USR_CONTACT_PHONE_NUMBER (USR_ID, CON_PN_NO, CON_NM, CON_PN_KIND, CON_PN, CON_PN_DFT, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                                            lgStrSql.Append(" VALUES (");
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(retParam.Value, true));
                                            lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                            lgStrSql.Append(Data.FilterVariable("근무처 전화", true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("근무처 전화")], true));
                                            lgStrSql.Append(Data.FilterVariable("0", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                                            lgStrSql.Append(" )");

                                            try {
                                                lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                                            } catch { }
                                        }
                                    }

                                    //휴대폰 전화
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("휴대폰")]) == false) {
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" SELECT 1 FROM B_USR_CONTACT_PHONE_NUMBER (NOLOCK) ");
                                        lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));
                                        lgStrSql.Append(string.Format("AND CON_PN = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("휴대폰")])));

                                        if (lgDbBatAccess.ExecuteRowCountQuery(lgStrSql.ToString()) == 0) {

                                            var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) { 
                                                    Direction = ParameterDirection.Output
                                                };
                                            var aParams = new SqlParameter[] {
                                                new SqlParameter("@TYPE", "CT"), 
                                                new SqlParameter("@TEMP_GL_DATE", DBNull.Value),
                                                new SqlParameter("@USR_ID", lgACT.UserId),
                                                retParam
                                            };

                                            lgDbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                                            //B_USR_CONTACT_PHONE_NUMBER INSERT
                                            lgStrSql.Clear();
                                            lgStrSql.AppendLine(" INSERT INTO B_USR_CONTACT_PHONE_NUMBER (USR_ID, CON_PN_NO, CON_NM, CON_PN_KIND, CON_PN, CON_PN_DFT, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                                            lgStrSql.Append(" VALUES (");
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(retParam.Value, true));
                                            lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                            lgStrSql.Append(Data.FilterVariable("휴대폰", true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("휴대폰")], true));
                                            lgStrSql.Append(Data.FilterVariable("1", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                                            lgStrSql.Append(" )");

                                            try {
                                                lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                                            } catch { }
                                        }
                                    }

                                    //B_USR_CONTACT_MAILADDR
                                    //메일 주소 1
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("전자 메일 주소")]) == false) {
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" SELECT 1 FROM B_USR_CONTACT_MAILADDR (NOLOCK) ");
                                        lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));
                                        lgStrSql.Append(string.Format("AND CON_EM = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("전자 메일 주소")])));

                                        if (lgDbAccess.ExecuteRowCountQuery(lgStrSql.ToString()) == 0) {

                                            var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) {
                                                Direction = ParameterDirection.Output
                                            };
                                            var aParams = new SqlParameter[] {
                                                new SqlParameter("@TYPE", "CT"), 
                                                new SqlParameter("@TEMP_GL_DATE", DBNull.Value),
                                                new SqlParameter("@USR_ID", lgACT.UserId),
                                                retParam
                                            };

                                            lgDbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                                            //B_USR_CONTACT_PHONE_NUMBER INSERT
                                            lgStrSql.Clear();
                                            lgStrSql.AppendLine(" INSERT INTO B_USR_CONTACT_MAILADDR (USR_ID, CON_EM_NO, CON_NM, CON_EM, CON_EM_DFT, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                                            lgStrSql.Append(" VALUES (");
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(retParam.Value, true));
                                            lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("전자 메일 주소")], true));
                                            lgStrSql.Append(Data.FilterVariable("1", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                                            lgStrSql.Append(" )");

                                            try {
                                                lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                                            } catch { }
                                        }
                                    }

                                    //B_USR_CONTACT_ORGANIZATION
                                    //조직
                                    if (string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("회사")]) == false || string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("부서")]) == false || string.IsNullOrWhiteSpace(csvR[csvR.GetFieldIndex("직함")]) == false) {
                                        lgStrSql.Clear();
                                        lgStrSql.AppendLine(" SELECT 1 FROM B_USR_CONTACT_ORGANIZATION (NOLOCK) ");
                                        lgStrSql.Append(string.Format("WHERE USR_ID = {0}", Data.FilterVariable(lgACT.UserId)));
                                        lgStrSql.Append(string.Format("AND CON_NM = {0}", Data.FilterVariable(con_nm)));
                                        lgStrSql.Append(string.Format("AND CON_ORG_BIZ_NM = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("회사")])));
                                        lgStrSql.Append(string.Format("AND CON_ORG_DEPT_NM = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("부서")])));
                                        lgStrSql.Append(string.Format("AND CON_ORG_PSTN_NM = {0}", Data.FilterVariable(csvR[csvR.GetFieldIndex("직함")])));

                                        if (lgDbAccess.ExecuteRowCountQuery(lgStrSql.ToString()) == 0) {

                                            var retParam = new SqlParameter("@LAST_AUTO_NO", DBNull.Value) {
                                                Direction = ParameterDirection.Output
                                            };
                                            var aParams = new SqlParameter[] {
                                                new SqlParameter("@TYPE", "CT"), 
                                                new SqlParameter("@TEMP_GL_DATE", DBNull.Value),
                                                new SqlParameter("@USR_ID", lgACT.UserId),
                                                retParam
                                            };

                                            lgDbAccess.ExecuteNonQuery(CommandType.StoredProcedure, "USP_AUTO_NUMBERING", aParams);

                                            //B_USR_CONTACT_PHONE_NUMBER INSERT
                                            lgStrSql.Clear();
                                            lgStrSql.AppendLine(" INSERT INTO B_USR_CONTACT_ORGANIZATION (USR_ID, CON_ORG_NO, CON_NM, CON_ORG_BIZ_NM, CON_ORG_DEPT_NM, CON_ORG_PSTN_NM, CON_ORG_DFT, INSRT_USER_ID, INSRT_DT, UPDT_USER_ID, UPDT_DT) ");
                                            lgStrSql.Append(" VALUES (");
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(retParam.Value, true));
                                            lgStrSql.Append(Data.FilterVariable(con_nm, true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("회사")], true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("부서")], true));
                                            lgStrSql.Append(Data.FilterVariable(csvR[csvR.GetFieldIndex("직함")], true));
                                            lgStrSql.Append(Data.FilterVariable("1", FilterVarType.NoBraceButReplSingleWithDoubleQuotation, true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS), true));
                                            lgStrSql.Append(Data.FilterVariable(lgACT.UserId, true));
                                            lgStrSql.Append(Data.FilterVariable(DateTime.Now.ToString(CommonVariable.CDT_YYYY_MM_DD_HH_MM_SS)));
                                            lgStrSql.Append(" )");

                                            try {
                                                lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                                            } catch { }
                                        }
                                    }
                                }
                            }

                        } catch (ExceptionManager ex) {
                            throw ex;
                        } catch (System.Exception ex) {
                            throw new ExceptionManager(ex);
                        } finally {
                            lgDbAccess.DisConnect();
                        }
                    }
                    break;
            }
        }

  

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        #endregion

        #region ■■ 5.2.2 Grid control event implementation group


        #endregion

        #region ■■ 5.2.2 User-defined function group

        #endregion

        #endregion

        #endregion
    }
}