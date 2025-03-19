using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eniFramework.WebApp.Common {
    public partial class EBRPreview5 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            Response.Expires = -1;
            id.Value = "admin";
            pw.Value = "admin";
            doc.Value = "Report/KO/EBR/DIC/a4103oa1_ko376.ebr";
            form.Value = "PRESENTER";
            runvar.Value = "biz_area|%|fr_dt|2014-10-31|to_dt|2014-10-31|VatType|%|fr_bp|0|to_bp|ZZZZZZZZZZ|AmtDecPoint|0|QtyDecPoint|2|UnitCostDecPoint|2|ExchRateDecPoint|4|AmtRndPolicy|-|QtyRndPolicy|%20|UnitCostRndPolicy|-|ExchRateRndPolicy|-|Num1000|,|DateFormat|yyyy-MM-dd|MonthFormat|yyyy-MM|ArrCur||ArrDecPoint||ArrRndPolicy||ArrDefaultDec|2446|gAlignOpt|1|";
            EBAction.Action = "http://173.0.9.3/REQUBE/bin/RQISAPI.dll?View?doc=Report/KO/EBR/DIC/a4103oa1_ko376.ebr&runvar=fr_dt|2014-01-01|to_dt|2014-01-01|fr_bp|1|to_bp|1|biz_area|p10|VatType|a|";
        }
    }
}