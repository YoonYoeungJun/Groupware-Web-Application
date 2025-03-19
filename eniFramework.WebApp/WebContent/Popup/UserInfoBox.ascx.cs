
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.ComponentModel;

using DevExpress.Web;

// eniFramework Reperence part

using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.Json;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Core;

#endregion

namespace eniFramework.WebApp.WebContent.Popup {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("PopMsgBox={PopMsgBox}, LblBox={LblBox}, BtnOk={BtnOk}")]
    public partial class UserInfoBox : BaseUIACTControl {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Commons.Controls</NameSpace>
        /// <Module>②Popup</Module>
        /// <Class>③MessageBox</Class>
        /// <Desc>④
        /// This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        /// <FirstCreated>
        /// <history name="creator"Date="created date">Make …</history>
        /// </FirstCreated>
        /// <Lastmodified>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        /// <remark name="modifier"Date="modified date">… </remark>
        /// <remark name="modifier"Date="modified date">… </remark>
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
       

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public UserInfoBox() {
        }

        #endregion

        #region ■ 2.2 Initializatize SubClass variables

        #endregion

        #region ■ 2.3 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. SubClass Override Method part



        protected override void OnInitSessionObj(System.Web.SessionState.HttpSessionState pSession) {

        }
        protected override void OnInitRequestParams(System.Collections.Specialized.NameValueCollection pRequestQueryString) {

        }

        protected override void OnUserControlLoad() {

        }

        protected override void OnUserControlLoadComplete() {

        }

        protected override void OnInitVariables() {

        }

        protected override void SetDefulatValues() {

        }

        protected override void OnReqProcessing() {

        }

        protected override void OnPostBackReqProcessing() {
            //eniRtUserInfoContainer.DataSource
        }

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group

        //protected void DbQuery() {
        //    lgStrSql = new StringBuilder();
        //    lgStrSql.AppendLine(" SELECT A.NO, ");
        //    lgStrSql.AppendLine("       A.CATEGORY_CD, ");
        //    lgStrSql.AppendLine("       B.CATEGORY_NM, ");
        //    lgStrSql.AppendLine("       A.PARENT_NO, ");
        //    lgStrSql.AppendLine("       A.PREFACE_CD, ");
        //    lgStrSql.AppendLine("       C.PREFACE_NM, ");
        //    lgStrSql.AppendLine("       A.NOTICE_YN, ");
        //    lgStrSql.AppendLine("       A.SUBJECT, ");
        //    lgStrSql.AppendLine("       A.SUBJECT_COLOR, ");
        //    lgStrSql.AppendLine("       A.SUBJECT_BOLD_YN, ");
        //    lgStrSql.AppendLine("       ISNULL(E.FILE_CNT, 0) FILE_CNT, ");
        //    lgStrSql.AppendLine("       ISNULL(F.CMT_CNT, 0) CMT_CNT, ");
        //    lgStrSql.AppendLine("       A.CONTENT, ");
        //    lgStrSql.AppendLine("       A.CONTENT_PLAIN, ");
        //    lgStrSql.AppendLine("       A.USER_ID, ");
        //    lgStrSql.AppendLine("       D.NAME, ");
        //    lgStrSql.AppendLine("       A.USER_IP, ");
        //    lgStrSql.AppendLine("       A.USER_AGENT, ");
        //    lgStrSql.AppendLine("       A.DATE, ");
        //    lgStrSql.AppendLine("       A.EDIT, ");
        //    lgStrSql.AppendLine("       ISNULL(G.VISIT, 0) VISIT, ");
        //    lgStrSql.AppendLine("       ISNULL(H.RECOMMEND, 0) RECOMMEND, ");
        //    lgStrSql.AppendLine("       A.TAG, ");
        //    lgStrSql.AppendLine("       A.DELETED_YN ");
        //    lgStrSql.AppendLine("   FROM B_BBS A (NOLOCK) ");
        //    lgStrSql.AppendLine("   LEFT JOIN S_BBS_MST B (NOLOCK) ON(A.CATEGORY_CD = B.CATEGORY_CD) ");
        //    lgStrSql.AppendLine("   LEFT JOIN S_BBS_PR_MST C (NOLOCK) ON(A.PREFACE_CD = C.PREFACE_CD) ");
        //    lgStrSql.AppendLine("   LEFT JOIN S_USR_MST D (NOLOCK) ON(A.USER_ID = D.USR_ID) ");
        //    lgStrSql.AppendLine("   LEFT JOIN (SELECT NO, COUNT(*) FILE_CNT  ");
        //    lgStrSql.AppendLine(" 			   FROM B_BBS_ATTACH (NOLOCK)  ");
        //    if (CategoryCd != "BBS_ALL") {
        //        lgStrSql.AppendLine(string.Format(" 			  WHERE CATEGORY_CD = {0} ", Data.FilterVariable(CategoryCd)));
        //    }
        //    lgStrSql.AppendLine();
        //    lgStrSql.AppendLine(" 			  GROUP BY NO) E ON(A.NO = E.NO) ");
        //    lgStrSql.AppendLine("   LEFT JOIN (SELECT NO, COUNT(*) CMT_CNT  ");
        //    lgStrSql.AppendLine(" 			   FROM B_BBS_COMMENT (NOLOCK)  ");
        //    if (CategoryCd != "BBS_ALL") {
        //        lgStrSql.AppendLine(string.Format(" 			  WHERE CATEGORY_CD = {0} ", Data.FilterVariable(CategoryCd)));
        //    }
        //    lgStrSql.AppendLine();
        //    lgStrSql.AppendLine(" 			  GROUP BY NO) F ON(A.NO = F.NO) ");
        //    lgStrSql.AppendLine("   LEFT JOIN (SELECT NO, COUNT(*) VISIT  ");
        //    lgStrSql.AppendLine(" 			   FROM B_BBS_VISIT_HIST (NOLOCK)  ");
        //    if (CategoryCd != "BBS_ALL") {
        //        lgStrSql.AppendLine(string.Format(" 			  WHERE CATEGORY_CD = {0} ", Data.FilterVariable(CategoryCd)));
        //    }
        //    lgStrSql.AppendLine(" 			  GROUP BY NO) G ON(A.NO = G.NO) ");
        //    lgStrSql.AppendLine("   LEFT JOIN (SELECT NO, COUNT(*) RECOMMEND  ");
        //    lgStrSql.AppendLine(" 			   FROM B_BBS_RECMT_HIST (NOLOCK)  ");
        //    if (CategoryCd != "BBS_ALL") {
        //        lgStrSql.AppendLine(string.Format(" 			  WHERE CATEGORY_CD = {0} ", Data.FilterVariable(CategoryCd)));
        //    }
        //    lgStrSql.AppendLine(" 			  GROUP BY NO) H ON(A.NO = H.NO) ");
        //    if (CategoryCd != "BBS_ALL") {
        //        lgStrSql.AppendLine(string.Format("    WHERE A.CATEGORY_CD = {0}", Data.FilterVariable(CategoryCd)));
        //    }
        //    lgStrSql.AppendLine(" ORDER BY NO DESC ");

        //    Data.MergeDataSet<tdsBoard.B_BBSDataTable>(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString()), true);
        //}

        #endregion

        #region ■ 5.2 User-defined virtual function group

        #endregion

        #endregion
    }
}
