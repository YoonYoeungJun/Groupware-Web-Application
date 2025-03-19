using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

using DevExpress.Web;


using eniFramework.WebApp.Core;

namespace eniFramework.WebApp.Common.Editor {
    [DefaultEvent("Click")]
    //[DefaultProperty("Text")]
    [ToolboxData(@"<{0}:ClearIconBtn runat=""server"" Text=""ClearIconBtn""></{0}:ClearIconBtn>")]
    public partial class ClearIconBtn : BaseUIACTControl {
        //[ReadOnly(true)]
        public override bool lgUseSessionDataSet {
            get {
                return false;
            }
        }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("클라이언트 인스턴스 이름을 가져오거나 설정합니다.")]
        public string ClientInstanceName {
            get {
                return this.ClearIconButton.ClientInstanceName;
            }
            set {
                ClearIconButton.ClientInstanceName = value;
            }
        }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 가로 길이를 설정하거나 가져옵니다.")]
        public Unit Width {
            get {
                return this.ClearIconButton.Width;
            }
            set {
                this.ClearIconButton.Width = value;
            }
        }
        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 세로 길이를 설정하거나 가져옵니다.")]
        public Unit Height {
            get {
                return this.ClearIconButton.Height;
            }
            set {
                this.ClearIconButton.Height = value;
            }
        }
        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 Css Class 이름을 설정하거나 가져옵니다.")]
        public string CssClass {
            get {
                return this.ClearIconButton.CssClass;
            }
            set {
                this.ClearIconButton.CssClass = value;
            }
        }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 이미지 Url을 설정하거나 가져옵니다.")]
        public string ImageUrl {
            get {
                return this.ClearIconButton.Image.Url;
            }
            set {
                this.ClearIconButton.Image.Url = value;
            }
        }
        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 마우스 호버 이미지 Url을 설정하거나 가져옵니다.")]
        public string ImageUrlHottracked {
            get {
                return this.ClearIconButton.Image.UrlHottracked;
            }
            set {
                this.ClearIconButton.Image.UrlHottracked = value;
            }
        }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 툴팁을 설정합니다.")]
        public string Tooltip {
            get {
                return this.ClearIconButton.ToolTip;
            }
            set {
                this.ClearIconButton.ToolTip = value;
            }
        }

        [Browsable(true)]
        [Category("eniFramework")]
        [Description("컨트롤의 글자를 설정합니다.")]
        public string Text {
            get {
                return this.ClearIconButton.Text;
            }
            set {
                this.ClearIconButton.Text = value;
            }
        }

        //[AutoFormatDisable]
        [Browsable(true)]
        [Category("eniFramework-Client-Side")]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        //[MergableProperty(false)]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ButtonClientSideEvents ClientSideEvents {
            get {
                return this.ClearIconButton.ClientSideEvents;
            }
        }
        
        /// <summary>
        /// 컨트롤의 내장 버튼 컨트롤을 가져옵니다.
        /// </summary>
        //[DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
        public ASPxButton InnerClearIconButton {
            get {
                return this.ClearIconButton;
            }
        }

        public ClearIconBtn() {
            
        }

        protected void Page_Load(object sender, EventArgs e) {
            this.ClearIconButton.Paddings.Padding = 0;
        }
    }
}