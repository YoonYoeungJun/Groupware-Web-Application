
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Drawing;
using System.Drawing.Imaging;

using DevExpress.Web;

// eniFramework Reperence part


using eniFramework.WebApp.Controls;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.Json;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Core;

#endregion

namespace eniFramework.WebApp.Common.Popup {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    public partial class CommonPopup : BaseUIACTControl {

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

        public override bool lgUseSessionDataSet {
            get {
                return true;
            }
        }


        string _strCommonArgs = string.Empty;
        lgFrmCommonPopupArgs _CommonArgs = null;

        #endregion

        #region ■ 1.4 Class Global properties
       

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        protected class lgFrmCommonPopupArgs {
            public string HeaderList { get; set; }
            public string HeaderWidth { get; set; }
            public string CodeCaption { get; set; }
            public string NameCaption { get; set; }
            public string Select { get; set; }
            public string From { get; set; }
            public string Where { get; set; }
            public string GroupBy { get; set; }
            public string OrderBy { get; set; }
        }

        public CommonPopup() {
        }

        #endregion

        #region ■ 2.2 Initializatize SubClass variables

        #endregion

        #region ■ 2.3 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. SubClass Override Method part
        protected override void OnInit() {
            if (lgFrmCommonPopupState.Contains("CommonPopupArgs")) {
                _strCommonArgs = lgFrmCommonPopupState["CommonPopupArgs"] as string;
            }

            if (string.IsNullOrWhiteSpace(_strCommonArgs)) return;

            _CommonArgs = JsonConvert.DeserializeObject<lgFrmCommonPopupArgs>(_strCommonArgs);
        }

        protected override void OnInitDynamicControls() {
            if (_CommonArgs == null) return;

            var strHeaderList = _CommonArgs.HeaderList.Split(',');
            var strHeaderWidthList = _CommonArgs.HeaderWidth.Split(',');
            var strSelect = _CommonArgs.Select.Split(',');

            if (strHeaderList.Length == strHeaderWidthList.Length && strHeaderList.Length == strSelect.Length) {
                eniGridCommonData.ClearColumns();
                for (int i = 0; i < strSelect.Length; i++) {
                    eniGridCommonData.SSSetDataText(strSelect[i].Trim(), strHeaderList[i].Trim(), Unit.Pixel(int.Parse(strHeaderWidthList[i])), int.Parse(strHeaderWidthList[i].Trim()), i, true, null, strHeaderList[i]);
                }
                eniGridCommonData.SSSetBlank();

                eniGridCommonData.KeyFieldName = string.Format("{0};{1};", eniGridCommonData.RowNumFieldName, strSelect[0]);

                var codeItem = eniFrmCommonLayout.FindItemByFieldName("CODE");
                var nameItem = eniFrmCommonLayout.FindItemByFieldName("NAME");

                if (codeItem != null) {
                    if (string.IsNullOrWhiteSpace(_CommonArgs.CodeCaption) == false) {
                        codeItem.Caption = _CommonArgs.CodeCaption;
                    } else {
                        codeItem.Caption = strHeaderList[0];
                    }

                }
                if (nameItem != null) {
                    if (string.IsNullOrWhiteSpace(_CommonArgs.CodeCaption) == false) {
                        nameItem.Caption = _CommonArgs.NameCaption;
                    } else {
                        nameItem.Caption = strHeaderList[1];
                    }
                }
            }
        }
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
            if (eniGridCommonData.IsCallback) {
                eniGridCommonData.DataSource = lgControlWorkDataSet.Tables["lgFrmCommonPopup"];
                eniGridCommonData.DataBind();
            }
        }

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        
        protected void lgFrmCommonPopup_WindowCallback(object source, PopupWindowCallbackArgs e) {
            try {
                _CommonArgs = JsonConvert.DeserializeObject<lgFrmCommonPopupArgs>(e.Parameter);

                if (_CommonArgs == null) return;

                var strHeaderList = _CommonArgs.HeaderList.Split(',');
                var strHeaderWidthList = _CommonArgs.HeaderWidth.Split(',');
                var strSelect = _CommonArgs.Select.Split(',');

                if (strHeaderList.Length == strHeaderWidthList.Length && strHeaderList.Length == strSelect.Length) {
                    eniGridCommonData.ClearColumns();
                    for(int i = 0; i < strSelect.Length; i++){
                        eniGridCommonData.SSSetDataText(strSelect[i].Trim(), strHeaderList[i].Trim(), Unit.Pixel(int.Parse(strHeaderWidthList[i])), int.Parse(strHeaderWidthList[i].Trim()), i, true, null, strHeaderList[i]);
                    }
                    eniGridCommonData.SSSetBlank();

                    eniGridCommonData.KeyFieldName = string.Format("{0};{1};", eniGridCommonData.RowNumFieldName, strSelect[0]);

                    var codeItem = eniFrmCommonLayout.FindItemByFieldName("CODE");
                    var nameItem = eniFrmCommonLayout.FindItemByFieldName("NAME");

                    if (codeItem != null) {
                        if (string.IsNullOrWhiteSpace(_CommonArgs.CodeCaption) == false) {
                            codeItem.Caption = _CommonArgs.CodeCaption;
                        } else {
                            codeItem.Caption = strHeaderList[0];
                        }

                    }
                    if (nameItem != null) {
                        if (string.IsNullOrWhiteSpace(_CommonArgs.CodeCaption) == false) {
                            nameItem.Caption = _CommonArgs.NameCaption;
                        } else {
                            nameItem.Caption = strHeaderList[1];
                        }
                    }
                }
            } catch(System.Exception) { }
        }

        protected class lgFrmCommonPopupCallbackArgs {
            public string Code { get; set; }
            public string Name { get; set; }
        }

        protected void eniGridCommonData_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            try {
                var callbackArgs = JsonConvert.DeserializeObject<lgFrmCommonPopupCallbackArgs>(e.Parameters);
                
                if (_CommonArgs == null) return;

                var strHeaderList = _CommonArgs.HeaderList.Split(',');
                var strHeaderWidthList = _CommonArgs.HeaderWidth.Split(',');
                var strSelect = _CommonArgs.Select.Split(',');

                if (strHeaderList.Length == strHeaderWidthList.Length && strHeaderList.Length == strSelect.Length) {
                    lgStrSql.AppendLine(string.Format("SELECT {0}", _CommonArgs.Select));
                    lgStrSql.AppendLine(string.Format("FROM {0}", _CommonArgs.From));
                    if (string.IsNullOrWhiteSpace(_CommonArgs.Where) == false) {
                        lgStrSql.AppendLine(string.Format("WHERE {0}", _CommonArgs.Where));
                        if (string.IsNullOrWhiteSpace(callbackArgs.Code) == false) {
                            lgStrSql.AppendLine(string.Format("AND {0} LIKE {1}", strSelect[0], Data.FilterVariable(callbackArgs.Code, FilterVarCondition.AllLikeCondition)));
                        }

                        if (string.IsNullOrWhiteSpace(callbackArgs.Name) == false) {
                            lgStrSql.AppendLine(string.Format("AND {0} LIKE {1}", strSelect[1], Data.FilterVariable(callbackArgs.Name, FilterVarCondition.AllLikeCondition)));
                        }
                    } else {
                        if (string.IsNullOrWhiteSpace(callbackArgs.Code) == false) {
                            lgStrSql.AppendLine(string.Format("WHERE {0} LIKE {1}", strSelect[0], Data.FilterVariable(callbackArgs.Code, FilterVarCondition.AllLikeCondition)));
                            if (string.IsNullOrWhiteSpace(callbackArgs.Name) == false) {
                                lgStrSql.AppendLine(string.Format("AND {0} LIKE {1}", strSelect[1], Data.FilterVariable(callbackArgs.Name, FilterVarCondition.AllLikeCondition)));
                            }
                        } else {
                            if (string.IsNullOrWhiteSpace(callbackArgs.Name) == false) {
                                lgStrSql.AppendLine(string.Format("WHERE {0} LIKE {1}", strSelect[1], Data.FilterVariable(callbackArgs.Name, FilterVarCondition.AllLikeCondition)));
                            }
                        }
                    }
                    
                    if (string.IsNullOrWhiteSpace(_CommonArgs.GroupBy) == false) {
                        lgStrSql.AppendLine(string.Format("GROUP BY {0}", _CommonArgs.GroupBy));
                    }
                    if (string.IsNullOrWhiteSpace(_CommonArgs.OrderBy) == false) {
                        lgStrSql.AppendLine(string.Format("ORDER BY {0}", _CommonArgs.OrderBy));
                    }

                    Data.MergeDataSet(lgControlWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "lgFrmCommonPopup"), true);

                    eniGridCommonData.DataSource = lgControlWorkDataSet.Tables["lgFrmCommonPopup"];
                    eniGridCommonData.DataBind();
                }
            } catch (System.Exception) { }
        }

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group


        #endregion

        #region ■ 5.2 User-defined virtual function group
        #endregion

        #endregion
    }
}
