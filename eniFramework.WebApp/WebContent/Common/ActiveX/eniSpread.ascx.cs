
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

// eniFramework Reperence part
using eniFramework.WebApp;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables;
using eniFramework.Json;
using eniFramework.WebApp.Extentions;
using eniFramework.WebApp.Core;

#endregion

namespace eniFramework.WebApp.Common.ActiveX {
    
    /// <summary>
    /// eniSpread
    /// </summary>
    [ToolboxData("<{0}:eniSpread ID=\"vspdData\" runat=\"server\"></{0}:eniSpread>")]

    [DebuggerDisplay("")]
    public partial class eniSpread : UserControl {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Commons.Controls</NameSpace>
        /// <Module>②Popup</Module>
        /// <Class>③eniSpread</Class>
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

        public const string ColSep = "\t";
        public const string RowSep = "\r\n";
        public const int PageRowCount = 100;

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        #endregion

        #region ■ 1.4 Class Global properties
        [Browsable(true)]
        [Category("eniFramework")]
        [Description("클라이언트 인스턴스 이름입니다.")]
        public string ClientInstanceName { get; set; }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("Farpoint Spread Sheet Version.")]
        [DefaultValue(SpreadVersion.vspdDFPSPD6)]
        public SpreadVersion ActiveXVersion { get; set; }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("디폴드 정렬 사용여부.")]
        [DefaultValue(SpreadVersion.vspdDFPSPD6)]
        public bool EnableSort { get; set; }

        [AutoFormatDisable]
        [Category("eniFramework")]
        [MergableProperty(false)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public SpreadClientSideEvents ClientSideEvents { get; private set; }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public eniSpread() {
            EnableTheming = false;
            EnableViewState = false;
            EnableSort = true;
            ClientSideEvents = new SpreadClientSideEvents();
        }

        #endregion

        #region ■ 2.2 Initializatize SubClass variables

        #endregion

        #region ■ 2.3 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. SubClass Override Method part


        
        //protected override void OnInitSessionObj(System.Web.SessionState.HttpSessionState pSession) {
            
        //}
        //protected override void OnInitRequestParams(System.Collections.Specialized.NameValueCollection pRequestQueryString) {
            
        //}

        //protected override void OnUserControlLoad() {
            
        //}

        //protected override void OnUserControlLoadComplete() {
            
        //}

        //protected override void OnInitVariables() {
            
        //}

        //protected override void SetDefulatValues() {
            
        //}

        //protected override void OnReqProcessing() {
            
        //}

        //protected override void OnPostBackReqProcessing() {
            
        //}

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group
        protected string GetLPK() {
            switch (ActiveXVersion) {
                case SpreadVersion.vspdDFPSPD6:
                case SpreadVersion.vspdDFPOBSPD6:
                case SpreadVersion.vspdDFPPVSPD6:
                case SpreadVersion.vspdDFPPVOBSPD6:
                case SpreadVersion.vspdDFPOBSPD7:
                case SpreadVersion.vspdDFPOBUCSPD7:
                case SpreadVersion.vspdDFPPVOBPSPD7:
                case SpreadVersion.vspdDFPPVOBUCPSPD7:
                default:
                    return ResolveUrl("~/") + "WebContent/Common/ActiveX/FarPoint214111.lpk";
                case SpreadVersion.vspdDFPPSPD8:
                    return ResolveUrl("~/") + "WebContent/Common/ActiveX/FarPoint151004.lpk";
            }
        }
        protected string GetControlCLSID() {
            switch (ActiveXVersion) {
                case SpreadVersion.vspdDFPSPD6:
                    return CommonVariable.VSPD_SPREAD_CLSID6;
                case SpreadVersion.vspdDFPOBSPD6:
                    return CommonVariable.VSPD_SPREAD_OLEDB_CLSID6;
                case SpreadVersion.vspdDFPPVSPD6:
                    return CommonVariable.VSPD_SPREAD_PREVIEW_CLSID6;
                case SpreadVersion.vspdDFPPVOBSPD6:
                    return CommonVariable.VSPD_SPREAD_PREVIEW_OLEDB_CLSID6;
                case SpreadVersion.vspdDFPOBSPD7:
                    return CommonVariable.VSPD_SPREAD_OLEDB_CLSID7;
                case SpreadVersion.vspdDFPOBUCSPD7:
                    return CommonVariable.VSPD_SPREAD_OLEDB_UNICODE_CLSID7;
                case SpreadVersion.vspdDFPPVOBPSPD7:
                    return CommonVariable.VSPD_SPREAD_PREVIEW_OLEDB_CLSID7;
                case SpreadVersion.vspdDFPPVOBUCPSPD7:
                    return CommonVariable.VSPD_SPREAD_PREVIEW_OLEDB_UNICODE_CLSID7;
                case SpreadVersion.vspdDFPPSPD8:
                    return CommonVariable.VSPD_SPREAD_CLSID8;
                default:
                    return CommonVariable.VSPD_SPREAD_CLSID6;
            }
        }

        protected string GetVersionString() {
            switch(ActiveXVersion) {
                case SpreadVersion.vspdDFPSPD6:
                case SpreadVersion.vspdDFPOBSPD6:
                case SpreadVersion.vspdDFPPVSPD6:
                case SpreadVersion.vspdDFPPVOBSPD6:
                    return CommonVariable.VSPD_SPREAD6_VER;
                case SpreadVersion.vspdDFPOBSPD7:
                case SpreadVersion.vspdDFPOBUCSPD7:
                case SpreadVersion.vspdDFPPVOBPSPD7:
                case SpreadVersion.vspdDFPPVOBUCPSPD7:
                    return CommonVariable.VSPD_SPREAD7_VER;
                case SpreadVersion.vspdDFPPSPD8:
                    return CommonVariable.VSPD_SPREAD8_VER;
                default:
                    return CommonVariable.VSPD_SPREAD6_VER;
            }
        }

        #endregion

        #region ■ 5.2 User-defined virtual function group

        #endregion

        #endregion
    }
}
