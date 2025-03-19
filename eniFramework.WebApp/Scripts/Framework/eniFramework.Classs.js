/// <reference path="../_references.js" />

//
// 윈도우 싸이즈 클래스
//
var WindowSize = function (pWidth, pHeight) {
	this.Width = pWidth;
	this.Height = pHeight;
};
WindowSize.__class = true;
WindowSize.Cast = function (pObj) {
	return new WindowSize(pObj.Width, pObj.Height);
};

//WebForm Framework Base Class
function PageClass(piFrameName) {
    //초기화되었는지 여부
    this.__preparing = false;
    this.base = null;
    this.window = null;
    this.document = null;
    this.iFrameName = piFrameName;
    this.ViewType = ViewType.None;
    this.ModuleType = ModuleType.None;
    /* [STA] Required Method */

    //폼로드시 호출됩니다.
    this.Form_Load = function () {};
    //폼로드 완료후 호출됩니다.
    this.Form_Load_Complate = function () {};

    /* [END] Required Method */

    /* [STA] Inherit Method */

    this.PageKeyDown = function (e) {};
    this.PageResize = function (e) {};
    this.InitGolbalVariables = function () {};
    this.InitLocalVariables = function () {};
    this.SetGlobalDefaultValue = function () {};
    this.SetLocalDefaultValue = function () {};
    this.InitConditionData = function () {};
    this.InitData = function () {};

    this.ExecuteSubPageCommand = function (pCmd) {};

    /* [END] Inherit Method */
};

//var OnFncDeleteEventArgs = function () {
//    this.Cancel = false;
//};
//var OnFncSaveEventArgs = function () {
//    this.Cancel = false;
//};
//var OnFncRefreshEventArgs = function () {
//    this.Cancel = false;
//};
//var OnFncInsertRowEventArgs = function () {
//    this.Cancel = false;
//};
//var OnFncDeleteRowsEventArgs = function () {
//    this.Cancel = false;
//};
//var OnFncCancelRowEventArgs = function () {
//    this.Source = null;
//    this.Col = -1;
//    this.Row = -1;
//    this.Col2 = -1;
//    this.Row2 = -1;
//    this.SelectedCount = -1;
//    this.Cancel = false;
//};
//var OnFncCopyRowEventArgs = function () {
//    this.Source = null;
//    this.Col = -1;
//    this.Row = -1;
//    this.Cancel = false;
//};

//콜백 데이터 베이스 오브젝트
var BaseCallbackArgsClass = function () {
    this.Cmd = new String();
    this.CmdDetail = new String();
    this.DBAccessMode = DBAccessMode.None;
    this.Data = 0;
    this.Cast = function (pBaseObj) {
        if (pBaseObj !== undefined && pBaseObj) {
            this.Cmd = (pBaseObj.Cmd !== undefined && pBaseObj.Cmd ? pBaseObj.Cmd : new String());
            this.CmdDetail = (pBaseObj.CmdDetail !== undefined && pBaseObj.CmdDetail ? pBaseObj.CmdDetail : new String());
            this.DBAccessMode = (pBaseObj.DBAccessMode !== undefined && pBaseObj.DBAccessMode ? pBaseObj.DBAccessMode : DBAccessMode.None);
            this.Data = (pBaseObj.Data !== undefined && pBaseObj.Data ? pBaseObj.Data : 0);
            return this;
        }
        return null;
    };
    this.Serialize = function () {
        //if ($.isArray(this.Data)) {
        //    if (this.Data.length <= 0){
        //        this.Data = 0;
        //    }
        //}
        return JSON.stringify(this);
    };
};
BaseCallbackArgsClass.Deserialize = function (pStrSerialize) {
    var retBaseCallBackArgs = new BaseCallbackArgsClass();
    return retBaseCallBackArgs.Cast(JSON.parse(pStrSerialize));
};
var BaseCallbackResultArgsClass = function () {
    this.Cmd = new String();
    this.CmdDetail = new String();
    this.DBAccessMode = DBAccessMode.None;
    this.Data = 0;
    this.Code = new String();
    this.Message = new String();
    this.SingelResult = 0;
    this.MultiResult = 0;
    this.Cast = function (pBaseObj) {
        if (pBaseObj !== undefined && pBaseObj) {
            this.Cmd = (pBaseObj.Cmd !== undefined && pBaseObj.Cmd ? pBaseObj.Cmd : null);
            this.CmdDetail = (pBaseObj.CmdDetail !== undefined && pBaseObj.CmdDetail ? pBaseObj.CmdDetail : new String());
            this.DBAccessMode = (pBaseObj.DBAccessMode !== undefined && pBaseObj.DBAccessMode ? pBaseObj.DBAccessMode : DBAccessMode.None);
            this.Data = (pBaseObj.Data !== undefined && pBaseObj.Data ? pBaseObj.Data : 0);
            this.Code = (pBaseObj.Code !== undefined && pBaseObj.Code ? pBaseObj.Code : null);
            this.Message = (pBaseObj.Message !== undefined && pBaseObj.Message ? pBaseObj.Message : null);
            this.SingelResult = (pBaseObj.SingelResult !== undefined && pBaseObj.SingelResult ? pBaseObj.SingelResult : 0);
            this.MultiResult = (pBaseObj.MultiResult !== undefined && pBaseObj.MultiResult ? pBaseObj.MultiResult : 0);

            for (var propertis in pBaseObj) {
                if (!this[propertis]) {
                    this[propertis] = pBaseObj[propertis];
                }
            }
            return this;
        }
        return null;
    };
    this.Serialize = function () {
        return JSON.stringify(this);
    };
};
BaseCallbackResultArgsClass.Deserialize = function (pStrSerialize) {
    var retBaseCallbackResultArgs = new BaseCallbackResultArgsClass();
    return retBaseCallbackResultArgs.Cast(JSON.parse(pStrSerialize));
};

//var BaseCallbackArgsClass = function () {
//    this.Cmd = new String();
//    this.CmdDetail = new String();
//    this.Data = new Array();
//    this.Cast = function (pBaseObj) {
//        if (pBaseObj !== undefined && pBaseObj) {
//            this.Cmd = (pBaseObj.Cmd !== undefined && pBaseObj.Cmd ? pBaseObj.Cmd : new String());
//            this.CmdDetail = (pBaseObj.CmdDetail !== undefined && pBaseObj.CmdDetail ? pBaseObj.CmdDetail : new String());
//            this.Data = (pBaseObj.Data !== undefined && pBaseObj.Data ? pBaseObj.Data : new Object());
//            return this;
//        }
//        return null;
//    };
//    this.Serialize = function () {
//        return JSON.stringify(this);
//    };
//};
//BaseCallbackArgsClass.Deserialize = function (pStrSerialize) {
//    var retBaseCallMultiBackArgs = new BaseCallbackArgsClass();
//    return retBaseCallMultiBackArgs.Cast(JSON.parse(pStrSerialize));
//};

//var BaseCallBackMultiResultArgsClass = function () {
//    this.Cmd = new String();
//    this.CmdDetail = new String();
//    this.Data = new Array();
//    this.Error = false;
//    this.ErrorMessage = new String();
//    this.Cast = function (pBaseObj) {
//        if (pBaseObj !== undefined && pBaseObj) {
//            this.Cmd = (pBaseObj.Cmd !== undefined && pBaseObj.Cmd ? pBaseObj.Cmd : null);
//            this.CmdDetail = (pBaseObj.CmdDetail !== undefined && pBaseObj.CmdDetail ? pBaseObj.CmdDetail : new String());
//            this.Data = (pBaseObj.Data !== undefined && pBaseObj.Data ? pBaseObj.Data : null);
//            this.Error = (pBaseObj.Error !== undefined && pBaseObj.Error ? pBaseObj.Error : false);
//            this.ErrorMessage = (pBaseObj.ErrorMessage !== undefined && pBaseObj.ErrorMessage ? pBaseObj.ErrorMessage : null);
//            return this;
//        }
//        return null;
//    };
//    this.Serialize = function () {
//        return JSON.stringify(this);
//    };
//};
//BaseCallBackMultiResultArgsClass.Deserialize = function (pStrSerialize) {
//    var retBaseCallBackMultiResultArgs = new BaseCallBackMultiResultArgsClass();
//    return retBaseCallBackMultiResultArgs.Cast(JSON.parse(pStrSerialize));
//};

var DbAccessCommandClass = function () {
    this.CommandType = DbAccess.CommandType.Text;
    this.TableName = new String();
    /*  */
    this.Code1 = new String();
    this.Code2 = new String();

    /*  */
    this.Select = new String();
    this.From = new String();
    this.Where = new String();
    this.GroupBy = new String();
    this.OrderBy = new String();

    /*  */
    this.CommandText = new String();
    this.Parameters = new Array();
    this.AddInParameter = function (pParamName, pDbType, val, size) {
        this.Parameters.push({ ParameterName: pParamName, DbType: pDbType, Value: (val || null), Direction: DbAccess.ParameterDirection.Input, Size: (size || 0) });
    };
    this.AddOutParameter = function (pParamName, pDbType, size) {
        this.Parameters.push({ ParameterName: pParamName, DbType: pDbType, Value: null, Direction: DbAccess.ParameterDirection.Output, Size: (size || null) });
    };
};

/* 삭제되어야함 contact 팝업은 컨트롤로 제작되지 않음 */
var ContactListArgsClass = function () {
    this.ToList = new Array(),
    this.CCList = new Array(),
    this.BCCList = new Array()
};
var AjaxArgsClass = function (pCmd, pMode, pData) {
    this.Cmd = pCmd;
    this.Mode = pMode;
    this.Data = pData;
};

var AjaxOptionsClass = function () {
    this.Async = false;
    this.DataType = "json";
    this.Timeout = 30000;
    this.Cache = false;
    this.ContentType = "application/json; charset=utf-8";
};

var AccountClass = function () {
    this.UserId = "";
    this.ErpNo = "";
    this.Domain = "";
    this.Name = "";
    this.EngNm = "";
    this.HanjaNm = "";
    this.UserKindCd = "";
    this.UserTypeCd = "";;
    this.UserGubunCd = "";
    this.BizAreaCd = "";
    this.PlantCd = "";
    this.DeptCd = "";
    this.RolePstnCd = "";
    this.AdminYn = "";
    this.MailAddr = "";
    this.LoginTime = "";
};

var ControlBaseClass = function () {
    this.Name = "";
};

// .Net Customization Javascript DataTable Class
var DataTableClass = function (pTableName) {
    var DataColumn = function (pColumnName) {
        this.ColumnName = new String(pColumnName);
    };
    this.TableName = new String(pTableName ? pTableName : "DataTable");
    this.Columns = new Array();
    this.Rows = new Array();
    this.AddColumn = function (pColumnName) {
        if (pColumnName !== undefined && pColumnName) {
            this.Columns.push(new DataColumn(pColumnName))
        }

        if (this.Rows.length > 0) {
            for (var i = 0; i < this.Rows.length; i++) {
                var row = this.Rows[i];
                row[pColumnName] = "";//new Object();
            }
        }
    };
    //생성된 컬럼만큼 자료를 안넣을수 있기때문에 Object 대신에 공백처리 해야한다.
    //this.NewRow = function () {
    //    var retVal = {};
    //    for (var i = 0; i < this.Columns.length; i++) {
    //        retVal[this.Columns[i].ColumnName] = new Object();
    //    }

    //    return retVal;
    //};
    this.NewRow = function () {
        var retVal = {};
        for (var i = 0; i < this.Columns.length; i++) {
            retVal[this.Columns[i].ColumnName] = "";
        }

        return retVal;
    };
    this.AddRow = function (pRow) {
        if (pRow !== undefined && pRow) {
            this.Rows.push(pRow);
        }
    };
    this.ToArray = function () {
        return this.Rows;
    };
    this.ToJson = function () {
        if (JSON) {
            return JSON.stringify(this.Rows);
        } else {
            return null;
        }
    };
    this.Serialize = function (pBaseObject, pPropertyName) {
        //Table만 Json 형식으로 바꾸면 \ 이 나중에 변환될 JSON형식에서 한개식 더 붙이기때문에 Base 오브젝트를 넣어주면 같이 변환한다.

        if (pBaseObject !== undefined && pBaseObject && typeof pBaseObject === "object") {
            pBaseObject[pPropertyName] = this.Rows;

            if (JSON) {
                return JSON.stringify(pBaseObject);
            } else {
                return null;
            }
        } else {
            var serJson = this.Rows;

            if (JSON) {
                return JSON.stringify(serJson);
            } else {
                return null;
            }
        }
    };
};

// .Net Customization Javascript DataSet Class
var DataSetClass = function () {
    this.Tables = new Array();
    this.CreateDataTable = function (pTableName) {
        if (pTableName !== undefined && pTableName && typeof pTableName === "string") {
            var tb = new DataTableClass(pTableName);
            this.Tables.push(tb);
            return tb;
        } else {
            var tb = new DataTableClass("Table" + String(this.Tables.length + 1));
            this.Tables.push(tb);
            return tb;
        }
    };
    this.Serialize = function (pTableNameOrIndex, pBaseObject, pPropertyName) {
        if (pTableNameOrIndex !== undefined && pTableNameOrIndex && typeof pTableName === "string") {
            for (var i = 0; i < this.Tables.length; i++) {
                if (this.Tables[i].TableName === pTableNameOrIndex) {
                    return this.Tables[i].Serialize(pBaseObject, pPropertyName);
                }
            }
            return null;
        } else if (pTableNameOrIndex !== undefined && pTableNameOrIndex && typeof pTableName === "number") {
            if (this.Tables[pTableNameOrIndex]) {
                return this.Tables[pTableNameOrIndex].Serialize(pBaseObject, pPropertyName);
            } else {
                return null;
            }
        }
        return null;
    };
};

//공통팝업 아큐먼트 클래스
var CommonPopupArgsClass = function () {
    this.Title = new String();
    this.CodeCaption = new String();
    this.NameCaption = new String();
    this.HeaderList = new String();
    this.HeaderWidth = new String();
    this.Select = new String();
    this.From = new String();
    this.Where = new String();
    this.WinSize = new WindowSize();
};

var CommonWinPopupArgsClass = function () {
    var Column = function (pFieldName, pCaption, pWidth, pAlign, pHidden, pCharCase) {
        this.FieldName = pFieldName;
        this.Caption = pCaption;
        this.Width = pWidth;
        this.Align = pAlign;
        this.Hidden = pHidden;
        this.CharCase = pCharCase;
    };
    this.Title = new String();
    this.CodeValue = new String();
    this.NameValue = new String();
    this.Columns = new Array();
    this.From = new String();
    this.Where = new String();
    this.OrderBy = new String();
    this.GroupBy = new String();
    this.WinSize = new WindowSize();
    this.AddColumn = function (pFieldName, pCaption, pWidth, pAlign, pHidden, pCharCase) {
        this.Columns.push(new Column(pFieldName, pCaption, pWidth, pAlign, pHidden, pCharCase));
    };
    this.Cast = function (pBaseObj) {
        if (pBaseObj !== undefined && pBaseObj) {
            this.Title = (pBaseObj.Title !== undefined && pBaseObj.Title ? pBaseObj.Title : new String());
            this.CodeValue = (pBaseObj.CodeValue !== undefined && pBaseObj.CodeValue ? pBaseObj.CodeValue : new String());
            this.NameValue = (pBaseObj.NameValue !== undefined && pBaseObj.NameValue ? pBaseObj.NameValue : new String());
            this.Columns = (pBaseObj.Columns !== undefined && pBaseObj.Columns ? pBaseObj.Columns : new Array());
            this.From = (pBaseObj.From !== undefined && pBaseObj.From ? pBaseObj.From : new String());
            this.Where = (pBaseObj.Where !== undefined && pBaseObj.Where ? pBaseObj.Where : new String());
            this.OrderBy = (pBaseObj.OrderBy !== undefined && pBaseObj.OrderBy ? pBaseObj.OrderBy : new String());
            this.GroupBy = (pBaseObj.GroupBy !== undefined && pBaseObj.GroupBy ? pBaseObj.GroupBy : new String());
            this.WinSize = (pBaseObj.WinSize !== undefined && pBaseObj.WinSize ? pBaseObj.WinSize : new WindowSize(445, 450));
            return this;
        }
        return null;
    };
    this.SerializeJson = function () {
        return JSON.stringify(this);
    };
};

var CommonWinPopupResultArgsClass = function () {
    this.DataSet = new DataSetClass();
};

var ExceptionManager = function (pCode, pMessage) {
    this.code = pCode;
    this.message = pMessage;
};