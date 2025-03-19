
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Net.Mail;
using System.Collections;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Web.Data;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;

#endregion

namespace eniFramework.WebApp.Popup {
    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    public partial class SCM1004PA3 : BaseUIACTPage {
        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp</NameSpace>
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
        public override string PageID { get { return "registerlangwinpopup"; } }
        public override JScriptExt RegisteredScriptExt { get { return JScriptExt.Ext3; } }
        public override JScriptKind RegisteredScripts { get { return JScriptKind.All; } }
        public override bool RegisteredServerControls { get { return true; } }
        public override bool RegisteredHiddenField { get { return true; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public SCM1004PA3()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageInit & WebUIPageLoad & WebUIPageLoadComplete

        //protected override void OnInitWebUIPage() {
            
        //}
        //protected override void OnWebUIPageLoad() {
            
        //}

        //protected override void OnWebUIPageLoadComplete() {
            

        //}

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        //protected override void OnInitRoutingParams(RouteData pRoute) {
            
        //}

        //protected override void OnInitRequestParams(NameValueCollection pQueryString) {


        //}
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;

            //if ((lgLang == "KO" || lgLang == "EN") && GetCookie("ckUniCode") != "1") {
            //    vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBSPD7;
            //} else {
            //    vspdData.ActiveXVersion = SpreadVersion.vspdDFPOBUCSPD7;
            //}
        }


        #endregion

        #region ■ 2.5 Request Processing

        //protected override void OnReqProcessing() {
            
        //}

        #endregion

        #region ■ 2.6 PostBack Request Processing
        //protected override void OnPostBackOrCallBackReqProcessing() {
            
        //}

        #endregion

        #region ■ 2.7 Initializatize variables

        //protected override void OnInitVariables() {

        //}

        #endregion

        #region ■ 2.8 Set local condition data


        //protected override void OnInitConditionData() {
            
        //}

        #endregion

        #region ■ 2.9 Set local default variables


        //protected override void SetDefulatValues() {

        //}

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery & ControlQuery

        protected void DbQuery(DatabaseAccess pDbAccess, DbQueryCallBackArgs pArgs, BaseCallbackResultArgs oR_Args) {
            var dtLang = new DataTable("Lang");
            dtLang.Columns.Add("Lang");
            dtLang.Columns.Add("ID");
            dtLang.Columns.Add("Kor_Text");
            dtLang.Columns.Add("Text");

            var xDocKorLang = new XmlDocument();
            xDocKorLang.Load(Server.MapPath(@"~/App_GlobalResources/WebContent/Common/Popup/WebContent_Common_Popup_CommonWinPopup.resx"));

            var xDocLang = new XmlDocument();
            xDocLang.Load(Server.MapPath(@"~/App_GlobalResources/WebContent/Common/Popup/WebContent_Common_Popup_CommonWinPopup.zh.resx"));

            var xNodeKorList = xDocKorLang.SelectNodes("root/data");
            var xNodeList = xDocLang.SelectNodes("root/data");

            foreach (XmlNode xKorNode in xNodeKorList) {
                var row = dtLang.NewRow();
                row["Lang"] = "zh";
                row["ID"] = xKorNode.Attributes["name"].Value.ToString();
                row["Kor_Text"] = xKorNode.SelectSingleNode("value").InnerText;

                foreach (XmlNode xNode in xNodeList) {
                    if (row["ID"].ToString() == xNode.Attributes["name"].Value.ToString()) {
                        row["Text"] = xNode.SelectSingleNode("value").InnerText;
                        break;
                    }
                }

                dtLang.Rows.Add(row);
            }


            var strDataTable = new StringBuilder();

            for (int i = 0; i < dtLang.Rows.Count; i++) {
                var row = dtLang.Rows[i];
                strDataTable.Append(string.Format("{0}{1}", row["Lang"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["ID"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["Kor_Text"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", row["Text"], eniSpread.ColSep));
                strDataTable.Append(string.Format("{0}{1}", i, eniSpread.RowSep));
            }

            oR_Args.MultiResult = strDataTable.ToString();
        }


        #endregion

        #region ■ 3.2 DbInsertData Multi

        protected void DbSave(DatabaseBatchAccess pDbBatAccess, DbSaveCallBackArgs pDbSaveArgs, BaseCallbackResultArgs oR_Args) {
            var xDocLang = new XmlDocument();
            xDocLang.Load(Server.MapPath(@"~/App_GlobalResources/WebContent/Common/Popup/WebContent_Popup_CommonWinPopup.zh.resx"));

            var xNodeList = xDocLang.SelectNodes("root/data");

            for (int i = 0; i < pDbSaveArgs.Data.Rows.Count; i++) {
                foreach (XmlNode xNode in xNodeList) {
                    if (pDbSaveArgs.Data.Rows[i]["ID"].ToString().ToLower() == xNode.Attributes["name"].Value.ToString().ToLower()) {
                        xNode.SelectSingleNode("value").InnerText = pDbSaveArgs.Data.Rows[i]["TEXT"].ToString();
                        break;
                    }
                }
            }

            xDocLang.Save(Server.MapPath(@"~/App_GlobalResources/WebContent/Common/Popup/WebContent_Popup_CommonWinPopup.zh.resx"));
        }

        #endregion

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #region ■■ 4.2.1 Single control event implementation group

        #endregion

        #region ■■ 4.2.2 Grid control event implementation group


        protected class vspdDataCallbackArgs {
            public string CUST_CD { get; set; }
            public string DVRY_NO { get; set; }
            public string PageNo { get; set; }
            public string PageRowCount { get; set; }
        }

        protected class DbQueryCallBackArgs : BaseCallbackArgs {
            public new vspdDataCallbackArgs Data { get; set; }
        }

        protected class DbSaveCallBackArgs : BaseCallbackArgs {
            public new DataTable Data { get; set; }
        }


        protected void vspdDataCbProcess_Callback(object source, CallbackEventArgs e) {
            var cb_r_args = GetBaseCallbackResultArgs();

            var cb_args = default(BaseCallbackArgs);

            try {
                cb_args = BaseCallbackArgs.GetDeserialize<BaseCallbackArgs>(e.Parameter);

                if (cb_args == null) {
                    cb_r_args.InnerException = new ExceptionManager(GetGlobalResource("GCSTRESX00101"));
                } else {
                    cb_r_args.Bind(cb_args);
                }
            } catch (SystemException ex) {
                cb_r_args.InnerException = ex;
            }

            if (cb_r_args.Code == "-1") {
                e.Result = cb_r_args.GetSerialize();
                return;
            }

            try {
                switch (cb_args.Cmd) {
                    case "DbQuery":
                        var cb_dq_args = DbQueryCallBackArgs.GetDeserialize<DbQueryCallBackArgs>(e.Parameter);

                        this.DbQuery(lgDbAccess, cb_dq_args, cb_r_args);
                        break;
                    case "DbSave":
                        try {
                            var cb_dbsave_args = DbSaveCallBackArgs.GetDeserialize<DbSaveCallBackArgs>(e.Parameter);

                            lgDbBatAccess.BatchProcessStart("SCM1004MA1");

                            this.DbSave(lgDbBatAccess, cb_dbsave_args, cb_r_args);

                        } catch (ExceptionManager ex) {
                            lgDbBatAccess.BatchProcessRollback();
                            throw ex;
                        } catch (System.Exception ex) {
                            lgDbBatAccess.BatchProcessRollback();
                            throw new ExceptionManager(ex);
                        } finally {
                            lgDbBatAccess.BatchProcessEnd();
                        }
                        break;
                    default:
                        cb_r_args.Code = "-1";
                        cb_r_args.Message = GetGlobalResource("GCSTRESX00102");
                        break;
                }
            } catch (System.Exception ex) {
                cb_r_args.InnerException = ex;
            } finally {
                e.Result = cb_r_args.GetSerialize();
            }
        }

        #endregion

        #region ▶ 5. User-defined function group

        

        #endregion

        #endregion

        #endregion
    }
}