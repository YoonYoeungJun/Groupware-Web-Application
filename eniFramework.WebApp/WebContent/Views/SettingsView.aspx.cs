
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
using System.Net.Mail;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;

using hMailServer;
using DevExpress.Web;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Date;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.Security;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Variables.Menu;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Common.Annotations;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Controls;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Common.JsonArgs;
//using eniFramework.WebApp.WebContent.DataSetLayout;

namespace eniFramework.WebApp.Modules {
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class SettingsView : BaseUIACTPage {
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

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "settingsview"; } }
        public override bool RegisteredServerControls { get { return true; } }
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

        public SettingsView()
            : base() {
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
            if (!IsCallback && !IsPostBack && lgLang != "KO") {
                muToolbar.Items[0].Text = GetResource("CSTRESX00001");
                muToolbar.Items[0].ToolTip = GetResource("CSTRESX00002");
                muToolbar.Items[1].Text = GetResource("CSTRESX00003");
                muToolbar.Items[1].ToolTip = GetResource("CSTRESX00004");
                muToolbar.Items[2].Text = GetResource("CSTRESX00005");
                muToolbar.Items[2].ToolTip = GetResource("CSTRESX00006");
                muToolbar.Items[3].Text = GetResource("CSTRESX00007");
                muToolbar.Items[3].ToolTip = GetResource("CSTRESX00008");
                muToolbar.Items[4].Text = GetResource("CSTRESX00009");
                muToolbar.Items[4].ToolTip = GetResource("CSTRESX00010");
                muToolbar.Items[5].Text = GetResource("CSTRESX00011");
                muToolbar.Items[5].ToolTip = GetResource("CSTRESX00012");
                muToolbar.Items[6].Text = GetResource("CSTRESX00013");
                muToolbar.Items[6].ToolTip = GetResource("CSTRESX00014");
                muToolbar.Items[7].Text = GetResource("CSTRESX00015");
                muToolbar.Items[7].ToolTip = GetResource("CSTRESX00016");

                muToolbarBottom.Items[0].Text = GetResource("CSTRESX00017");
                muToolbarBottom.Items[0].ToolTip = GetResource("CSTRESX00018");

                flUserSetting.Items[0].Caption = GetResource("CSTRESX00019");
                ((LayoutGroup)flUserSetting.Items[0]).Items[0].Caption = GetResource("CSTRESX00020");
                eniBiEmpPhoto.Caption = GetResource("CSTRESX00021");
                fuUploadPhoto.BrowseButton.Text = GetResource("CSTRESX00022");
                btnDelPhoto.Text = GetResource("CSTRESX00023");
                btnDelPhoto.ToolTip = GetResource("CSTRESX00024");
                ((LayoutGroup)flUserSetting.Items[0]).Items[1].Caption = GetResource("CSTRESX00025");
                ((LayoutGroup)flUserSetting.Items[0]).Items[2].Caption = GetResource("CSTRESX00027");
                txtUserNameEng.NullText = GetResource("CSTRESX00028");
                txtUserNameEng.HelpText = GetResource("CSTRESX00029");
                ((LayoutGroup)flUserSetting.Items[0]).Items[3].Caption = GetResource("CSTRESX00030");
                txtUserNameHanja.NullText = GetResource("CSTRESX00031");
                txtUserNameHanja.HelpText = GetResource("CSTRESX00032");
                ((LayoutGroup)flUserSetting.Items[0]).Items[4].Caption = GetResource("CSTRESX00033");
                txtUserNickName.NullText = GetResource("CSTRESX00034");
                txtUserNickName.HelpText = GetResource("CSTRESX00035");
                ((LayoutGroup)flUserSetting.Items[0]).Items[5].Caption = GetResource("CSTRESX00068");
                txtIntroduce.NullText = GetResource("CSTRESX00036");
                txtIntroduce.HelpText = GetResource("CSTRESX00037");
                ((LayoutGroup)flUserSetting.Items[0]).Items[6].Caption = GetResource("CSTRESX00038");
                ((LayoutGroup)flUserSetting.Items[0]).Items[7].Caption = GetResource("CSTRESX00069");
                ((LayoutGroup)flUserSetting.Items[0]).Items[8].Caption = GetResource("CSTRESX00039");
                txtExtMailAddr.NullText = GetResource("CSTRESX00040");
                txtExtMailAddr.HelpText = GetResource("CSTRESX00041");
                ((LayoutGroup)flUserSetting.Items[0]).Items[9].Caption = GetResource("CSTRESX00042");
                txtPwd.HelpText = GetResource("CSTRESX00043");
                txtPwdConform.HelpText = GetResource("CSTRESX00044");
                ((LayoutGroup)flUserSetting.Items[0]).Items[10].Caption = GetResource("CSTRESX00045");
                ((LayoutGroup)flUserSetting.Items[0]).Items[11].Caption = GetResource("CSTRESX00046");
                ((LayoutGroup)flUserSetting.Items[0]).Items[12].Caption = GetResource("CSTRESX00047");
                txtTelNo.NullText = GetResource("CSTRESX00048");
                txtTelNo.HelpText = GetResource("CSTRESX00049");
                ((LayoutGroup)flUserSetting.Items[0]).Items[13].Caption = GetResource("CSTRESX00070");
                txtHanTelNo.NullText = GetResource("CSTRESX00050");
                txtHanTelNo.HelpText = GetResource("CSTRESX00051");
                ((LayoutGroup)flUserSetting.Items[0]).Items[14].Caption = GetResource("CSTRESX00052");
                txtEmTelNo.NullText = GetResource("CSTRESX00053");
                txtEmTelNo.HelpText = GetResource("CSTRESX00054");
                ((LayoutGroup)flUserSetting.Items[0]).Items[15].Caption = GetResource("CSTRESX00055");
                flUserSetting.Items[1].Caption = GetResource("CSTRESX00056");
                ((LayoutGroup)flUserSetting.Items[1]).Items[0].Caption = GetResource("CSTRESX00057");
                ((LayoutGroup)flUserSetting.Items[1]).Items[1].Caption = GetResource("CSTRESX00058");
                ((LayoutGroup)flUserSetting.Items[1]).Items[2].Caption = GetResource("CSTRESX00059");
                ((LayoutGroup)flUserSetting.Items[1]).Items[3].Caption = GetResource("CSTRESX00060");
                ((LayoutGroup)flUserSetting.Items[1]).Items[4].Caption = GetResource("CSTRESX00061");
                ((LayoutGroup)flUserSetting.Items[1]).Items[5].Caption = GetResource("CSTRESX00062");
                ((LayoutGroup)flUserSetting.Items[1]).Items[6].Caption = GetResource("CSTRESX00063");

                btnUserSettingsSave.Text = GetResource("CSTRESX00064");
                btnUserSettingsSave.ToolTip = GetResource("CSTRESX00065");
                btnUserSettingsCancel.Text = GetResource("CSTRESX00066");
                btnUserSettingsCancel.ToolTip = GetResource("CSTRESX00067");
            }
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            var tdsSettings = DbQuery();

            if (tdsSettings.Rows.Count < 0) return;

            var rowSettingMain = tdsSettings.Rows[0] as tdsSettings.V_USR_MSTRow;

            if (rowSettingMain.IsPHOTONull() == false) eniBiEmpPhoto.Value = eniFramework.WebApp.Common.Utilities.EncodeBinaryImageToByte(rowSettingMain.PHOTO);
            if (rowSettingMain.IsUSER_PHOTONull() == false) eniBiUserPhoto.Value = eniFramework.WebApp.Common.Utilities.EncodeBinaryImageToByte(rowSettingMain.USER_PHOTO);
            if (rowSettingMain.IsNAMENull() == false) lblUserName.Text = rowSettingMain.NAME.Trim();
            if (rowSettingMain.IsENG_NAMENull() == false) txtUserNameEng.Text = rowSettingMain.ENG_NAME.Trim();
            if (rowSettingMain.IsHANJA_NAMENull() == false) txtUserNameHanja.Text = rowSettingMain.HANJA_NAME.Trim();
            if (rowSettingMain.IsNICK_NAMENull() == false) txtUserNickName.Text = rowSettingMain.NICK_NAME.Trim();
            if (rowSettingMain.IsINTRODUCTIONNull() == false) txtIntroduce.Text = rowSettingMain.INTRODUCTION.Trim();
            if (rowSettingMain.IsERP_NONull() == false) {
                lblUserID.Text = string.Format("{0}({1})", rowSettingMain.USR_ID.Trim(), rowSettingMain.ERP_NO.Trim());
            } else {
                lblUserID.Text = rowSettingMain.USR_ID.Trim();
            }
            if (rowSettingMain.IsUSR_VALID_DTNull() == false) lblValidDt.Text = rowSettingMain.USR_VALID_DT.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_KOR);
            if (rowSettingMain.IsMAIL_ADDRNull() == false) lblMailAddr.Text = rowSettingMain.MAIL_ADDR;
            if (rowSettingMain.IsEXT_MAIL_ADDRNull() == false) txtExtMailAddr.Text = rowSettingMain.EXT_MAIL_ADDR;
            if (rowSettingMain.IsPWDNull() == false) txtPwd.Text = rowSettingMain.PWD;
            if (rowSettingMain.IsBIRT_DAYNull() == false) lblUserBirthday.Text = rowSettingMain.BIRT_DAY.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_KOR);
            if (rowSettingMain.IsENTR_DTNull() == false) lblEnterDt.Text = rowSettingMain.ENTR_DT.ToString(CommonVariable.CDT_YYYY_MM_DD_DDD_KOR);
            if (rowSettingMain.IsTEL_NONull() == false) txtTelNo.Text = rowSettingMain.TEL_NO;
            if (rowSettingMain.IsHAND_TEL_NONull() == false) txtHanTelNo.Text = rowSettingMain.HAND_TEL_NO;
            if (rowSettingMain.IsEM_TEL_NONull() == false) txtEmTelNo.Text = rowSettingMain.EM_TEL_NO;
            if (rowSettingMain.IsZIP_CODENull() == false && rowSettingMain.IsADDRNull() == false){
                lblUserAddr.Text = string.Format("({0}) {1}", rowSettingMain.ZIP_CODE, rowSettingMain.ADDR);
            } else if (rowSettingMain.IsZIP_CODENull() && rowSettingMain.IsADDRNull() == false){
                lblUserAddr.Text = rowSettingMain.ADDR;
            }
            if (rowSettingMain.IsBIZ_AREA_NMNull() == false) lblBizAreaNm.Text = rowSettingMain.BIZ_AREA_NM;
            if (rowSettingMain.IsPLANT_NMNull() == false) lblPlantNm.Text = rowSettingMain.PLANT_NM;
            if (rowSettingMain.IsDEPT_NMNull() == false) lblDeptNm.Text = rowSettingMain.DEPT_NM;
            if (rowSettingMain.IsROLE_PSTN_NMNull() == false) lblRolePstnNm.Text = rowSettingMain.ROLE_PSTN_NM;
            if (rowSettingMain.IsUSR_KIND_NMNull() == false) lblUserKindNm.Text = rowSettingMain.USR_KIND_NM;
            if (rowSettingMain.IsUSR_TYPE_NMNull() == false) lblUserTypeNm.Text = rowSettingMain.USR_TYPE_NM;
            if (rowSettingMain.IsUSR_GUBUN_NMNull() == false) lblUserTypeNm.Text = rowSettingMain.USR_GUBUN_NM;

            if (rowSettingMain.IsERP_USER_IDNull() == false) txtErpUserId.Text = rowSettingMain.ERP_USER_ID;
            if (rowSettingMain.IsERP_USER_PWNull() == false && !string.IsNullOrWhiteSpace(rowSettingMain.ERP_USER_PW)) txtErpUserPw.Value = TripleDESDecrypt(rowSettingMain.ERP_USER_PW);
            if (rowSettingMain.IsQMS_USER_IDNull() == false) txtQmsUserId.Text = rowSettingMain.QMS_USER_ID;
            if (rowSettingMain.IsQMS_USER_PWNull() == false && !string.IsNullOrWhiteSpace(rowSettingMain.QMS_USER_PW)) txtQmsUserPw.Text = TripleDESDecrypt(rowSettingMain.QMS_USER_PW);
            if (rowSettingMain.IsFTA_USER_IDNull() == false) txtFtaUserId.Text = rowSettingMain.FTA_USER_ID;
            if (rowSettingMain.IsFTA_USER_PWNull() == false && !string.IsNullOrWhiteSpace(rowSettingMain.FTA_USER_PW)) txtFtaUserPw.Text = TripleDESDecrypt(rowSettingMain.FTA_USER_PW);
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

        protected tdsSettings.V_USR_MSTDataTable DbQuery() {
            lgStrSql = new StringBuilder();
            //UserSetting
            lgStrSql.AppendLine(" SELECT A.PHOTO, ");
            lgStrSql.AppendLine(" 	B.USER_PHOTO, ");
            lgStrSql.AppendLine(" 	A.NAME, ");
            lgStrSql.AppendLine(" 	A.ENG_NAME, ");
            lgStrSql.AppendLine(" 	A.HANJA_NAME, ");
            lgStrSql.AppendLine(" 	B.NICK_NAME, ");
            lgStrSql.AppendLine(" 	B.INTRODUCTION, ");
            lgStrSql.AppendLine(" 	A.USR_ID, ");
            lgStrSql.AppendLine(" 	A.ERP_NO, ");
            lgStrSql.AppendLine(" 	A.USR_VALID_DT, ");
            lgStrSql.AppendLine(" 	A.MAIL_ADDR, ");
            lgStrSql.AppendLine(" 	A.EXT_MAIL_ADDR, ");
            lgStrSql.AppendLine(" 	A.PWD, ");
            lgStrSql.AppendLine(" 	A.PWD_VALID_DT, ");
            lgStrSql.AppendLine(" 	A.BIRT_DAY, ");
            lgStrSql.AppendLine(" 	A.ENTR_DT, ");
            lgStrSql.AppendLine(" 	A.TEL_NO, ");
            lgStrSql.AppendLine(" 	A.HAND_TEL_NO, ");
            lgStrSql.AppendLine(" 	A.EM_TEL_NO, ");
            lgStrSql.AppendLine(" 	A.ZIP_CODE, ");
            lgStrSql.AppendLine(" 	A.ADDR, ");
            lgStrSql.AppendLine(" 	A.BIZ_AREA_CD, ");
            lgStrSql.AppendLine(string.Format(" 	C.BIZ_AREA_NM_{0} BIZ_AREA_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.PLANT_CD, ");
            lgStrSql.AppendLine(string.Format(" 	D.PLANT_NM_{0} PLANT_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.DEPT_CD, ");
            lgStrSql.AppendLine(string.Format(" 	E.DEPT_NM_{0} DEPT_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.ROLE_PSTN, ");
            lgStrSql.AppendLine(string.Format(" 	F.MINOR_NM_{0} ROLE_PSTN_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.USR_KIND, ");
            lgStrSql.AppendLine(string.Format(" 	G.MINOR_NM_{0} USR_KIND_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.USR_TYPE, ");
            lgStrSql.AppendLine(string.Format(" 	H.MINOR_NM_{0} USR_TYPE_NM, ", lgLang));
            lgStrSql.AppendLine(" 	A.USR_GUBUN, ");
            lgStrSql.AppendLine(string.Format(" 	I.MINOR_NM_{0} USR_GUBUN_NM, ", lgLang));
            //FamilySite
            lgStrSql.AppendLine(" 	B.ERP_USER_ID, ");
            lgStrSql.AppendLine(" 	B.ERP_USER_PW, ");
            lgStrSql.AppendLine(" 	B.QMS_USER_ID, ");
            lgStrSql.AppendLine(" 	B.QMS_USER_PW, ");
            lgStrSql.AppendLine(" 	B.FTA_USER_ID, ");
            lgStrSql.AppendLine(" 	B.FTA_USER_PW ");
            lgStrSql.AppendLine(" FROM S_USR_MST (NOLOCK) A ");
            lgStrSql.AppendLine(" LEFT JOIN S_USR_SETTINGS (NOLOCK) B ON(A.USR_ID = B.USR_ID) ");
            lgStrSql.AppendLine(" LEFT JOIN S_BIZ_AREA (NOLOCK) C ON(A.BIZ_AREA_CD = C.BIZ_AREA_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN S_PLANT (NOLOCK) D ON(A.BIZ_AREA_CD = D.BIZ_AREA_CD AND A.PLANT_CD = D.PLANT_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN S_ACCT_DEPT (NOLOCK) E ON(A.PLANT_CD = E.PLANT_CD AND A.DEPT_CD = E.DEPT_CD) ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) F ON(A.ROLE_PSTN = F.MINOR_CD AND F.MAJOR_CD = 'S0006') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) G ON(A.USR_KIND = G.MINOR_CD AND G.MAJOR_CD = 'S0003') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) H ON(A.USR_TYPE = H.MINOR_CD AND H.MAJOR_CD = 'S0004') ");
            lgStrSql.AppendLine(" LEFT JOIN B_MINOR (NOLOCK) I ON(A.USR_GUBUN = I.MINOR_CD AND I.MAJOR_CD = 'S0005') ");
            lgStrSql.AppendLine(string.Format(" WHERE A.USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

            var tdsSettings = new tdsSettings();

            Data.MergeDataSet<tdsSettings.V_USR_MSTDataTable>(tdsSettings, lgDbAccess.ExecuteDataSet(lgStrSql.ToString()), true);

            return tdsSettings.V_USR_MST;
        }

        #endregion

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        

        protected void fuUploadPhoto_FileUploadComplete(object sender, FileUploadCompleteEventArgs e) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" UPDATE S_USR_SETTINGS SET USER_PHOTO = @USER_PHOTO WHERE USR_ID = @USR_ID ");

            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@USER_PHOTO", SqlDbType.Image);
            param[0].Value = e.UploadedFile.FileBytes;
            param[1] = new SqlParameter("@USR_ID", lgACT.UserId);

            try {
                lgDbAccess.ExecuteNonQuery(lgStrSql.ToString(), param);
            } catch (System.Exception ex) {
                e.CallbackData = JsonConvert.SerializeObject(new BaseCallbackResultArgs() { Message = ex.Message, Data = null });
            }
        }

        private class UserSettingCallbackArgs {
            public string UserNickName { get; set; }
            public string Introduce { get; set; }
            public string UserNameEng { get; set; }
            public string UserNameHanja { get; set; }
            public string ExtMailAddr { get; set; }
            public string Pwd { get; set; }
            public string TelNo { get; set; }
            public string HandTelNo { get; set; }
            public string EmTelNo { get; set; }
        }

        private class FamilySiteCallbackArgs {
            public string ErpUserId { get; set; }
            public string ErpUserPw { get; set; }
            public string QmsUserId { get; set; }
            public string QmsUserPw { get; set; }
            public string FtaUserId { get; set; }
            public string FtaUserPw { get; set; }
        }

        protected void cbp_Callback(object sender, CallbackEventArgsBase e) {
            var callbackArgs = JsonConvert.DeserializeObject<BaseCallbackArgs>(e.Parameter);

            switch (callbackArgs.Cmd) {
                case "UserSetting":
                    ProcessingUserSetting(callbackArgs);
                    break;
                case "UserSetting_UserPhoto":
                    switch (callbackArgs.DBAccessMode) {
                        case DBAccessMode.Delete:
                            lgStrSql = new StringBuilder();
                            lgStrSql.AppendLine(string.Format(" UPDATE S_USR_SETTINGS SET USER_PHOTO = NULL WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                            lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());
                            break;
                    }
                    var tdsSettings = DbQuery();

                    if (tdsSettings.Rows.Count < 0) return;

                    var rowSettingMain = tdsSettings.Rows[0] as tdsSettings.V_USR_MSTRow;

                    if (rowSettingMain.IsPHOTONull() == false) eniBiEmpPhoto.Value = eniFramework.WebApp.Common.Utilities.EncodeBinaryImageToByte(rowSettingMain.PHOTO);
                    if (rowSettingMain.IsUSER_PHOTONull() == false) eniBiUserPhoto.Value = eniFramework.WebApp.Common.Utilities.EncodeBinaryImageToByte(rowSettingMain.USER_PHOTO);
                    break;
                case "FamilySite":
                    ProcessingFamilySite(callbackArgs);
                    break;
            }
        }

        #endregion

        #region ■■ 5.2.2 User-defined function group

        private void ProcessingUserSetting(BaseCallbackArgs pBaseCallbackArgs) {
            switch (pBaseCallbackArgs.DBAccessMode) {
                //case DBAccessMode.Query:
                //    DbQuery();

                //    break;
                case DBAccessMode.Update:
                    var userSettingArgs = JsonConvert.DeserializeObject<UserSettingCallbackArgs>(pBaseCallbackArgs.Data.ToString());

                    lgStrSql = new StringBuilder();
                    lgStrSql.AppendLine(" UPDATE A SET ");
                    lgStrSql.AppendLine(string.Format(" 	ENG_NAME = {0}, ", Data.FilterVariable(userSettingArgs.UserNameEng)));
                    lgStrSql.AppendLine(string.Format(" 	HANJA_NAME = {0}, ", Data.FilterVariable(userSettingArgs.UserNameHanja)));
                    lgStrSql.AppendLine(string.Format(" 	EXT_MAIL_ADDR = {0}, ", Data.FilterVariable(userSettingArgs.ExtMailAddr)));
                    if (string.IsNullOrWhiteSpace(userSettingArgs.Pwd) == false) {
                        lgStrSql.AppendLine(string.Format(" 	PWD = {0}, ", Data.FilterVariable(SecurityManager.ConvertToString(MD5.GetHash(Encoding.ASCII.GetBytes(userSettingArgs.Pwd))))));
                    }
                    if (string.IsNullOrWhiteSpace(userSettingArgs.Pwd) == false) {
                        lgStrSql.AppendLine(string.Format(" 	PWD_SCT = {0}, ", Data.FilterVariable(TripleDESEncrypt(userSettingArgs.Pwd))));
                    }
                    lgStrSql.AppendLine(string.Format(" 	TEL_NO = {0}, ", Data.FilterVariable(userSettingArgs.TelNo)));
                    lgStrSql.AppendLine(string.Format(" 	HAND_TEL_NO = {0}, ", Data.FilterVariable(userSettingArgs.HandTelNo)));
                    lgStrSql.AppendLine(string.Format(" 	EM_TEL_NO = {0} ", Data.FilterVariable(userSettingArgs.EmTelNo)));
                    lgStrSql.AppendLine(" FROM S_USR_MST A ");
                    lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                    lgStrSql.AppendLine();
                    lgStrSql.AppendLine(" UPDATE A SET ");
                    lgStrSql.AppendLine(string.Format(" 	NICK_NAME = {0}, ", Data.FilterVariable(userSettingArgs.UserNickName)));
                    lgStrSql.AppendLine(string.Format(" 	INTRODUCTION = {0} ", Data.FilterVariable(userSettingArgs.Introduce)));
                    lgStrSql.AppendLine(" FROM S_USR_SETTINGS A ");
                    lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                    lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());

                    if (string.IsNullOrWhiteSpace(userSettingArgs.Pwd) == false) {
                        var ac = lgACT.MailServerProvider.GetAPIAccount();
                        ac.Password = userSettingArgs.Pwd;
                        ac.Save();
                    }

                    OnReqProcessing();
                    break;
            }
        }

        private void ProcessingFamilySite(BaseCallbackArgs pBaseCallbackArgs) {
            switch (pBaseCallbackArgs.DBAccessMode) {
                case DBAccessMode.Update:
                    var familySiteArgs = JsonConvert.DeserializeObject<FamilySiteCallbackArgs>(pBaseCallbackArgs.Data.ToString());

                    lgStrSql = new StringBuilder();
                    lgStrSql.AppendLine(" UPDATE A SET ");
                    lgStrSql.AppendLine(string.Format(" 	ERP_USER_ID = {0}, ", string.IsNullOrWhiteSpace(familySiteArgs.ErpUserId) == false ? Data.FilterVariable(familySiteArgs.ErpUserId) : "NULL"));
                    lgStrSql.AppendLine(string.Format(" 	ERP_USER_PW = {0}, ", string.IsNullOrWhiteSpace(familySiteArgs.ErpUserId) == false ? Data.FilterVariable(TripleDESEncrypt(familySiteArgs.ErpUserPw)) : "NULL"));
                    lgStrSql.AppendLine(string.Format(" 	QMS_USER_ID = {0}, ", string.IsNullOrWhiteSpace(familySiteArgs.QmsUserId) == false ? Data.FilterVariable(familySiteArgs.QmsUserId) : "NULL"));
                    lgStrSql.AppendLine(string.Format(" 	QMS_USER_PW = {0}, ", string.IsNullOrWhiteSpace(familySiteArgs.QmsUserId) == false ? Data.FilterVariable(TripleDESEncrypt(familySiteArgs.QmsUserPw)) : "NULL"));
                    lgStrSql.AppendLine(string.Format(" 	FTA_USER_ID = {0}, ", string.IsNullOrWhiteSpace(familySiteArgs.FtaUserId) == false ? Data.FilterVariable(familySiteArgs.FtaUserId) : "NULL"));
                    lgStrSql.AppendLine(string.Format(" 	FTA_USER_PW = {0} ", string.IsNullOrWhiteSpace(familySiteArgs.FtaUserId) == false ? Data.FilterVariable(TripleDESEncrypt(familySiteArgs.FtaUserPw)) : "NULL"));
                    lgStrSql.AppendLine(" FROM S_USR_SETTINGS A ");
                    lgStrSql.AppendLine(string.Format(" WHERE USR_ID = {0} ", Data.FilterVariable(lgACT.UserId)));

                    lgDbAccess.ExecuteNonQuery(lgStrSql.ToString());

                    OnReqProcessing();
                    break;
            }
        }

        #endregion


        #endregion

        #endregion

        #endregion
    }
}