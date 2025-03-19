using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web.UI;
using System.Drawing.Design;
using System.Web.UI.WebControls;

using DevExpress.Utils;
using DevExpress.Utils.Design;
using DevExpress.Web;
using DevExpress.Web.Internal;

using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Common.Grid {
    public partial class eniGridLookup : BaseUIACTControl {
        [AutoFormatDisable]
        [Category("Data")]
        [DefaultValue(true)]
        public bool AutoGenerateColumns { get { return eniGridLookupControl.AutoGenerateColumns; } set { eniGridLookupControl.AutoGenerateColumns = value ; } }
        [AutoFormatDisable]
        [Category("Client-Side")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [MergableProperty(false)]
        [NotifyParentProperty(true)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        [Themeable(false)]
        public GridLookupClientSideEvents ClientSideEvents { get { return eniGridLookupControl.ClientSideEvents; } }
        //
        // 요약:
        //     Gets or sets the editor's client programmatic identifier.
        [AutoFormatDisable]
        [Category("Client-Side")]
        [DefaultValue("")]
        [Localizable(false)]
        public string ClientInstanceName { get { return eniGridLookupControl.ClientInstanceName; } set { eniGridLookupControl.ClientInstanceName = value; } }
        [AutoFormatDisable]
        [Category("Data")]
        [DefaultValue("")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [MergableProperty(false)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        [TypeConverter(typeof(UniversalCollectionTypeConverter))]
        public GridViewColumnCollection Columns { get { return eniGridLookupControl.Columns; } }
        [AutoFormatDisable]
        [EditorBrowsable(EditorBrowsableState.Always)]
        public object DataSource { get { return eniGridLookupControl.DataSource; } set { eniGridLookupControl.DataSource = value ; } }
        [AutoFormatDisable]
        [Browsable(true)]
        [Category("Data")]
        [EditorBrowsable(EditorBrowsableState.Always)]
        [Themeable(false)]
        public string DataSourceID { get { return eniGridLookupControl.DataSourceID; } set { eniGridLookupControl.DataSourceID = value ; } }
        [AutoFormatEnable]
        [Category("Styles")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public DropDownWindowStyle DropDownWindowStyle { get { return eniGridLookupControl.DropDownWindowStyle; } }
        [Browsable(false)]
        public DevExpress.Web.ASPxGridView GridView { get { return eniGridLookupControl.GridView; } }
        [AutoFormatDisable]
        [Category("Client-Side")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
         [MergableProperty(false)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewClientSideEvents GridViewClientSideEvents { get { return eniGridLookupControl.GridViewClientSideEvents; } }
        [AutoFormatEnable]
        [Category("Images")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewImages GridViewImages { get { return eniGridLookupControl.GridViewImages; } }
        [AutoFormatEnable]
        [Category("Images")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
          [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewEditorImages GridViewImagesEditors { get { return eniGridLookupControl.GridViewImagesEditors; } }
        [AutoFormatEnable]
        [Category("Images")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public FilterControlImages GridViewImagesFilterControl { get { return eniGridLookupControl.GridViewImagesFilterControl; } }
        [AutoFormatEnable]
        [Category("Settings")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewProperties GridViewProperties { get { return eniGridLookupControl.GridViewProperties; } }
        [AutoFormatEnable]
        [Category("Styles")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewStyles GridViewStyles { get { return eniGridLookupControl.GridViewStyles; } }
        [AutoFormatEnable]
        [Category("Styles")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public FilterControlStyles GridViewStylesFilterControl { get { return eniGridLookupControl.GridViewStylesFilterControl; } }
        [AutoFormatEnable]
        [Category("Styles")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewPagerStyles GridViewStylesPager { get { return eniGridLookupControl.GridViewStylesPager; } }
        [AutoFormatEnable]
        [Category("Styles")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public GridViewPopupControlStyles GridViewStylesPopup { get { return eniGridLookupControl.GridViewStylesPopup; } }
        [AutoFormatDisable]
        [Category("Behavior")]
        [DefaultValue(500)]
        public int IncrementalFilteringDelay { get { return eniGridLookupControl.IncrementalFilteringDelay; } set { eniGridLookupControl.IncrementalFilteringDelay = value ; } }
        [AutoFormatDisable]
        [Category("Behavior")]
        public IncrementalFilteringMode IncrementalFilteringMode { get { return eniGridLookupControl.IncrementalFilteringMode; } set { eniGridLookupControl.IncrementalFilteringMode = value ; } }
        [AutoFormatDisable]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(false)]
        [TypeConverter("DevExpress.Web.Design.GridViewFieldConverter, DevExpress.Web.v14.1.Design, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a")]
        public string KeyFieldName { get { return eniGridLookupControl.KeyFieldName; } set { eniGridLookupControl.KeyFieldName = value ; } }
        [AutoFormatDisable]
        [Category("Data")]
        [DefaultValue(";")]
        [NotifyParentProperty(true)]
        [Themeable(false)]
        public string MultiTextSeparator { get { return eniGridLookupControl.MultiTextSeparator; } set { eniGridLookupControl.MultiTextSeparator = value ; } }
        [AutoFormatDisable]
        [DefaultValue("")]
        [Localizable(true)]
        public string NullText { get { return eniGridLookupControl.NullText; } set { eniGridLookupControl.NullText = value ; } }

        [AutoFormatDisable]
        [Category("Behavior")]
        [NotifyParentProperty(true)]
        public GridLookupSelectionMode SelectionMode { get { return eniGridLookupControl.SelectionMode; } set { eniGridLookupControl.SelectionMode = value ; } }
        [AutoFormatDisable]
        [Browsable(false)]
        [DefaultValue("")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
        [Localizable(false)]
        [Themeable(false)]
        public string Text { get { return eniGridLookupControl.Text; } set { eniGridLookupControl.Text = value ; } }
        [AutoFormatEnable]
        [Category("Data")]
        [DefaultValue("")]
        [Editor("DevExpress.Web.Design.LookupTextFormatStringUIEditor, DevExpress.Web.v14.1.Design, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a", typeof(UITypeEditor))]
        [Localizable(true)]
        public string TextFormatString { get { return eniGridLookupControl.TextFormatString; } set { eniGridLookupControl.TextFormatString = value ; } }
        public Unit Width { get { return eniGridLookupControl.Width; } set { eniGridLookupControl.Width = value; } }
        public object Value { get { return eniGridLookupControl.Value; } set { eniGridLookupControl.Value = value; } }
        protected void Page_Load(object sender, EventArgs e) {
         
        }
    }
}