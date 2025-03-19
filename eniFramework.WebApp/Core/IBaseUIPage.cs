using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using eniFramework.WebApp;

namespace eniFramework.WebApp.Core {
    public interface IBaseUIPage {
        JScriptExt RegisteredScriptExt { get; }
        JScriptKind RegisteredScripts { get; }
        bool RegisteredHiddenField { get; }
        bool RegisteredServerControls { get; }
        string BodyClassName { get; }
        string PageID { get; }
        string lgLang { get; }
        string MetaAppName { get; }
        string MetaAuthor { get; }
        //string MetaKeywords { get; }
        //string MetaDescription { get; }

        bool EnableDragable { get; }
        bool EnableSelectable { get; }
        bool EnableContextMenu { get; }
        bool EnableAutoBind { get; }
    }
}