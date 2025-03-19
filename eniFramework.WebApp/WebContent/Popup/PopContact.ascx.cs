
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
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

namespace eniFramework.WebApp.Popup {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("PopMsgBox={PopMsgBox}, LblBox={LblBox}, BtnOk={BtnOk}")]
    public partial class PopContact : BaseUIACTControl {

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

        const string clientInstanceName = "PopContact";

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        public override bool lgUseSessionDataSet {
            get {
                return true;
            }
        }

        #endregion

        #region ■ 1.4 Class Global properties

        /// <summary>
        /// PopContact 컨트롤의 Client 객체 이름을 설정하거나 가져옵니다.
        /// </summary>
        [Bindable(true)]
        [Category("eniFramework")]
        public string ClientInstanceName { 
            get {
                if (string.IsNullOrWhiteSpace(popContact.ClientInstanceName)) {
                    return clientInstanceName;
                } else {
                    return popContact.ClientInstanceName;
                }
            }
            set{
                popContact.ClientInstanceName = value;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public PopContact() {
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
            var dt_contact_group =  cbpContactGroup_DbQuery();

            var contactCntRows = dt_contact_group.Select("LVL = 1 AND CNT > 0");
            var totalCnt = 0;

            foreach (DataRow contactCntRow in contactCntRows) {
                totalCnt += int.Parse(contactCntRow["CNT"].ToString());
            }

            var rootNode = new TreeViewNode(string.Format("{0}|{1}", "그룹웨어 주소록", totalCnt.ToString()), "0|ALL", string.Empty) {
                ToolTip = "그룹웨어 주소록"
            };

            rootNode.Nodes.AddRange(MakeContactGroup(dt_contact_group, dt_contact_group.Select("LVL = 1")));
            tvContactGroup.Nodes.Add(rootNode);
            tvContactGroup.ExpandAll();
            tvContactGroup.SelectedNode = rootNode;
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

        private DataTable cbpContactGroup_DbQuery() {
            var dt_contact_group = GetViewStateTable<DataTable>("DT_CONTACT_GROUP");

            if (dt_contact_group == null) {
                lgStrSql = new StringBuilder();
                lgStrSql.AppendLine(" SELECT A.CON_GR_NO, A.PAR_CON_GR_NO, A.CON_GR_NM, A.SEQ, A.LVL, A.CNT, A.CONTACT_TYPE ");
                lgStrSql.AppendLine(string.Format(" FROM UFN_TB_CONTACT_GROUP({0}) A ", Data.FilterVariable(lgAccount.UserId)));

                dt_contact_group = lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "CONTACT_GROUP").Tables["CONTACT_GROUP"];

                SetViewState("DT_CONTACT_GROUP", dt_contact_group);
            }

            return dt_contact_group;
        }

        private class ContactListCallBackArgs {
            public string Lvl { get; set; }
            public string ContactGroupCd { get; set; }
            public string ContactType { get; set; }
        }

        private class ContactListSearchCallBackArgs {
            public string SearchText { get; set; }
        }

        private DataTable lbContactList_DbQuery(ContactListCallBackArgs pArgs) {
            lgStrSql = new StringBuilder();
            lgStrSql.AppendLine(" SELECT CON_NM + ' <' + CON_EM + '>' MAIL_DISPLAY_ADDR, CON_NM, CON_GR_NO, CON_EM, CON_ORG_DEPT_NM, CON_ORG_PSTN_NM ");
            lgStrSql.AppendLine(string.Format(" FROM UFN_TB_CONTACT({0}) A ", Data.FilterVariable(lgAccount.UserId)));
            lgStrSql.AppendLine(" WHERE 1 = 1 ");
            switch (pArgs.ContactType) {
                case "A":
                    lgStrSql.AppendLine(string.Format(" AND A.CONTACT_TYPE = {0}", Data.FilterVariable(pArgs.ContactType)));
                    switch (pArgs.Lvl) {
                        case "1":
                            lgStrSql.AppendLine(string.Format(" AND A.CON_ORG_BIZ_NO = {0}", Data.FilterVariable(pArgs.ContactGroupCd)));
                            break;
                        case "2":
                            lgStrSql.AppendLine(string.Format(" AND A.CON_ORG_PLANT_NO = {0}", Data.FilterVariable(pArgs.ContactGroupCd)));
                            break;
                        case "3":
                            lgStrSql.AppendLine(string.Format(" AND A.CON_ORG_DEPT_NO = {0}", Data.FilterVariable(pArgs.ContactGroupCd)));
                            break;
                        default: break;
                    }
                    break;
                case "B":
                case "C":
                    lgStrSql.AppendLine(string.Format(" AND A.CONTACT_TYPE = {0}", Data.FilterVariable(pArgs.ContactType)));
                    if (string.IsNullOrWhiteSpace(pArgs.ContactGroupCd) == false) {
                        lgStrSql.AppendLine(string.Format(" AND A.CON_GR_NO = {0}", Data.FilterVariable(pArgs.ContactGroupCd)));
                    }
                    break;
                default: break;
            }

            lgStrSql.AppendLine(" ORDER BY CONTACT_TYPE, CON_ORG_BIZ_NO, CON_ORG_PLANT_NO, CON_ORG_DEPT_NO, CON_ORG_PSTN_NO, CON_NM ");

            return lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "CONTACT_LIST").Tables["CONTACT_LIST"];
        }

        protected void cbpContactGroup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            //cbpContactGroup_DbQuery();

            //var contactCntRows = lgControlWorkDataSet.Tables["CONTACT_GROUP_LIST"].Select("LVL = 1 AND CNT > 0");
            //var totalCnt = 0;
            //foreach (DataRow contactCntRow in contactCntRows) {
            //    totalCnt += int.Parse(contactCntRow["CNT"].ToString());
            //}
            //var rootNode = new TreeViewNode(string.Format("{0}|{1}", "그룹웨어 주소록", totalCnt.ToString()), "0|ALL|", string.Empty) {
            //    ToolTip = "그룹웨어 주소록"
            //};
            //rootNode.Nodes.AddRange(MakeContactGroup(lgControlWorkDataSet.Tables["CONTACT_GROUP_LIST"].Select("LVL = 1")));
            //tvContactGroup.Nodes.Add(rootNode);
            //tvContactGroup.ExpandAll();
            //tvContactGroup.SelectedNode = rootNode;
        }

        protected TreeViewNode[] MakeContactGroup(DataTable pContactGroup, DataRow[] pRootContacts) {
            var nodes = new List<TreeViewNode>();

            foreach (DataRow contact in pRootContacts) {
                var trViewNode = new TreeViewNode(string.Format("{0}|{1}", contact["CON_GR_NM"], contact["CNT"]), string.Format("{0}|{1}|{2}", contact["LVL"], contact["CON_GR_NO"], contact["CONTACT_TYPE"]), string.Empty) {
                    ToolTip = contact["CON_GR_NM"].ToString()
                    //DataItem = menu.ReqRtUrl
                };

                var subContacts = pContactGroup.Select(string.Format("PAR_CON_GR_NO = {0} AND LVL = {1}", Data.FilterVariable(contact["CON_GR_NO"]), Data.FilterVariable(int.Parse(contact["LVL"].ToString()) + 1, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));

                if (subContacts.Length > 0) {
                    var rangeSubMenus = MakeContactGroup(pContactGroup, subContacts);

                    trViewNode.Nodes.AddRange(rangeSubMenus);
                }

                nodes.Add(trViewNode);
            }

            return nodes.ToArray();
        }

        protected void cbpContactList_Callback(object sender, CallbackEventArgsBase e) {
            var callbackArgs = JsonConvert.DeserializeObject<BaseCallBackArgs>(e.Parameter);
            switch (callbackArgs.Cmd) {
                case "GROUP":
                    var groupArgs = JsonConvert.DeserializeObject<ContactListCallBackArgs>(callbackArgs.Data.ToString());

                    var dt_contact_group_list = lbContactList_DbQuery(groupArgs);
                    lbContactList.DataSource = dt_contact_group_list;
                    lbContactList.DataBind();
                    break;
                case "CONTACT_SEARCH":
                    var contactSearchArgs = JsonConvert.DeserializeObject<ContactListSearchCallBackArgs>(callbackArgs.Data.ToString());

                    var dt_contact_list = lbContactList_DbQuery(new ContactListCallBackArgs() { Lvl = "0", ContactGroupCd = "ALL" });

                    if (string.IsNullOrWhiteSpace(contactSearchArgs.SearchText) == false) {
                        //if (lgControlWorkDataSet.Tables.Contains("CONTACT_LIST") == false) {
                        //    lbContactList_DbQuery(new ContactListCallBackArgs() { Lvl = "0", ContactGroupCd = "ALL" });
                        //    lbContactList.DataSource = lgControlWorkDataSet.Tables["CONTACT_LIST"];
                        //}

                        var contactList = from contactListRow in dt_contact_list.AsEnumerable()
                                          where contactListRow["CON_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_ORG_PSTN_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_ORG_DEPT_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_EM"].ToString().Contains(contactSearchArgs.SearchText)
                                          select contactListRow;
                        if (contactList.Count() > 0) {
                            lbContactList.DataSource = contactList.CopyToDataTable();
                        }
                    } else {
                        lbContactList.DataSource = dt_contact_list;
                    }
                    lbContactList.DataBind();
                    break;
            }
        }

        protected void lbContactList_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            //Session
            var callbackArgs = JsonConvert.DeserializeObject<BaseCallBackArgs>(e.Parameter);
            switch(callbackArgs.Cmd) {
                case "GROUP":
                    var groupArgs = JsonConvert.DeserializeObject<ContactListCallBackArgs>(callbackArgs.Data.ToString());

                    var dt_contact_group_list = lbContactList_DbQuery(groupArgs);
                    lbContactList.DataSource = dt_contact_group_list;
                    lbContactList.DataBind();
                    break;
                case "CONTACT_SEARCH":
                    var contactSearchArgs = JsonConvert.DeserializeObject<ContactListSearchCallBackArgs>(callbackArgs.Data.ToString());

                    var dt_contact_list = lbContactList_DbQuery(new ContactListCallBackArgs() { Lvl = "0", ContactGroupCd = "ALL" });
                    
                    if(string.IsNullOrWhiteSpace(contactSearchArgs.SearchText) == false) {
                        //if (lgControlWorkDataSet.Tables.Contains("CONTACT_LIST") == false) {
                        //    lbContactList_DbQuery(new ContactListCallBackArgs() { Lvl = "0", ContactGroupCd = "ALL" });
                        //    lbContactList.DataSource = lgControlWorkDataSet.Tables["CONTACT_LIST"];
                        //}

                        var contactList = from contactListRow in dt_contact_list.AsEnumerable()
                                          where contactListRow["CON_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_ORG_PSTN_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_ORG_DEPT_NM"].ToString().Contains(contactSearchArgs.SearchText) ||
                                            contactListRow["CON_EM"].ToString().Contains(contactSearchArgs.SearchText)
                                select contactListRow;
                        if(contactList.Count() > 0) {
                            lbContactList.DataSource = contactList.CopyToDataTable();
                        }
                    } else {
                        lbContactList.DataSource = dt_contact_list;
                    }
                    lbContactList.DataBind();
                    break;
            }
        }

        #endregion

        protected void cbProcess_Callback(object source, CallbackEventArgs e) {

        }



        

        #region ■ 5.2 User-defined virtual function group

        #endregion

        #endregion
    }
}
