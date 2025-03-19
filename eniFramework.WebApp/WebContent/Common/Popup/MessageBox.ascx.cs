
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

namespace eniFramework.WebApp.Common.Popup {
    /// <summary>
    /// MessageBox
    /// </summary>
    [DebuggerDisplay("PopMsgBox={PopMsgBox}, LblBox={LblBox}, BtnOk={BtnOk}")]
    public partial class MessageBox : BaseUIACTControl {

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

        string _clientInstanceName = "popMessageBox";
        [Bindable(true)]
        [Category("eniFramework")]
        [DefaultValue("")]
        public string ClientInstanceName {
            get {
                return _clientInstanceName;
            }
            set {
                if(string.IsNullOrWhiteSpace(_clientInstanceName) == false) {
                    _clientInstanceName = value;
                }
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public MessageBox() {
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

        #endregion

        #region ■ 5.2 User-defined virtual function group

        #endregion

        #endregion
    }
}
