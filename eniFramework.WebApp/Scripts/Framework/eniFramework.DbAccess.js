/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.Data = new function () {
        this.FilterVariable = function (pVal, pFilterType, pCharSet, pIsTrim) {
            if (pVal === null || pVal === '')
                return "''";
            pIsTrim = pIsTrim || true;

            if (typeof pVal !== 'string')
                pVal = pVal.toString();
            if (pIsTrim)
                pVal = $.trim(pVal);
            if (pVal.length === 0) {
                if (pFilterType === FilterVarType.BraceWithSingleQuotation)
                    return "''";
                else if (pFilterType === FilterVarType.BraceWithDoubleSingleQuotation)
                    return  "''''";
                else
                    return "''";
            } else {
                pVal = pVal.replace(/\'/g, "''");
                if (pFilterType === undefined || pFilterType === null || pFilterType === FilterVarType.BraceWithSingleQuotation) {
                    if (pCharSet === CharSet.Unicode)
                        return " N'" + pVal + "'";
                    else
                        return " '" + pVal + "'";
                } else if (pFilterType === FilterVarType.BraceWithDoubleSingleQuotation) {
                    if (pCharSet === CharSet.Unicode)
                        return " N''" + pVal + "''";
                    else
                        return " '" + pVal + "'";
                } else if (pFilterType === FilterVarType.NoBraceButReplSingleWithDoubleQuotation) {
                    return pVal;
                }
                else {
                    return pVal;
                }
            }
        };

    };
    eni.DbAccess = new function () {
        this.ExecuteCodeName = function (strTableName, strCode1, strCode2, iTimeOut, strLang) {
            var strQueryString = "cmd=DbAccess&mode=ExecuteCodeName&";
            strQueryString = strQueryString + "tablename=" + strTableName + "&";
            if (strCode1) {
                strQueryString = strQueryString + "code1=" + strCode1 + "&";
            }
            if (strCode2) {
                strQueryString = strQueryString + "code2=" + strCode2 + "&";
            }
            strQueryString = strQueryString + "lang=" + (strLang || (window.lgLang || "KO"));

            var strJson = this.__XmlHTTPRequestQueryString(strQueryString, iTimeOut);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteCodeNameAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteCodeName", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops, iTimeOut);
        };
        this.ExecuteNonQuery = function (strSql, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest1("ExecuteNonQuery", strSql, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteQuery = function (strSql, strTableNames, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest2("ExecuteQuery", strSql, strTableNames, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteFMGQuery = function (strSelect, strFrom, strWhere, strTableNames, iTimeOut, strLang) {
            var strSql = " SELECT " + strSelect;
            strSql = strSql + " FROM " + strFrom;
            if (strWhere) {
                strSql = strSql + " WHERE " + strWhere;
            }

            var strJson = this.__XmlHTTPRequest2("ExecuteQuery", strSql, strTableNames, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteQueryAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteQuery", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };
        this.ExecuteDataSet = function (strSql, strTableNames, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest2("ExecuteDataSet", strSql, strTableNames, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteFMGDataSet = function (strSelect, strFrom, strWhere, strTableNames, iTimeOut, strLang) {
            var strSql = " SELECT " + strSelect;
            strSql = strSql + " FROM " + strFrom;
            if (strWhere) {
                strSql = strSql + " WHERE " + strWhere;
            }

            var strJson = this.__XmlHTTPRequest2("ExecuteDataSet", strSql, strTableNames, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };

        this.ExecuteDataSetAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteDataSet", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };

        this.ExecuteScalar = function (strSql, strTableNames, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest1("ExecuteScalar", strSql, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteScalarAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteScalar", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };
        this.ExecuteRowCountQuery = function (strSql, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest2("ExecuteRowCountQuery", strSql, null, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteFMGRowCountQuery = function (strSelect, strFrom, strWhere, iTimeOut, strLang) {
            var strSql = " SELECT " + strSelect;
            strSql = strSql + " FROM " + strFrom;
            if (strWhere) {
                strSql = strSql + " WHERE " + strWhere;
            }

            var strJson = this.__XmlHTTPRequest2("ExecuteRowCountQuery", strSql, null, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteRowCountQueryAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteRowCountQuery", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };
        this.ExecuteNonQuery = function (strSql, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest2("ExecuteNonQuery", strSql, null, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteNonQueryAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExecuteNonQuery", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };
        this.ExecuteComboDataQuery = function (strSql, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest2("ExecuteComboDataQuery", strSql, null, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };
        this.ExecuteComboDataQueryAjax = function (pCmd, pCallbackFunc, pErrorCallbackFunc, iTimeOut) {
            var cmd = new AjaxArgsClass("DbAccess", "ExcuteComboDataQuery", pCmd);
            var ops = new AjaxOptionsClass();
            ops.Timeout = (iTimeOut || -1);

            this.__AjaxRequest(cmd, pCallbackFunc, pErrorCallbackFunc, ops);
        };
        this.DbMessage = function (strCode, iTimeOut, strLang) {
            var strJson = this.__XmlHTTPRequest3(strCode, iTimeOut, strLang);
            if (strJson) {
                return JSON.parse(strJson);
            } else {
                return null;
            }
        };

        this.__AjaxRequest = function (pCmd, pCallbackFunc, pErrorCallbackFunc, pOps) {
            eni.Ajax.Request("./webcontent/common/commonrequest.ashx", pCmd, "post", pCallbackFunc, pErrorCallbackFunc, pOps);
        };
        this.__GetXmlHTTPRequest = function (iTimeOut) {
            var xmlHttp = null;
            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            } else {
                try{
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch(ex) {
                    xmlHttp = new ActiveXObject("MSXML2.XMLHTTP.3.0");
                }
            }
            
            var strLocation = (document.location.origin ? document.location.origin : String(document.location.href).replace(document.location.pathname, ""));

            xmlHttp.open("post", "./webcontent/common/commonrequest.ashx", false);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.timeout = (iTimeOut ? (iTimeOut < 0 ? 0 : iTimeOut) : 60000);
            return xmlHttp;
        };
        this.__XmlHTTPRequest1 = function (strMode, strSql, iTimeOut, strLang) {
            var strQueryString = "";

            strSql = escape(strSql);
            strSql = strSql.replace("+", "%2B");
            strSql = strSql.replace("/", "%2F");

            strQueryString = "cmd=DbAccess&";
            strQueryString = strQueryString + "mode=" + strMode + "&";
            strQueryString = strQueryString + "data=" + strSql + "&";
            strQueryString = strQueryString + "lang=" + (strLang || (window.lgLang || "KO"));

            return this.__XmlHTTPRequestQueryString(strQueryString, iTimeOut);
        };
        this.__XmlHTTPRequest2 = function (strMode, strSql, strTableNames, iTimeOut, strLang) {
            var strQueryString = "";

            strSql = escape(strSql);
            strSql = strSql.replace("+", "%2B");
            strSql = strSql.replace("/", "%2F");

            strQueryString = "cmd=DbAccess&";
            strQueryString = strQueryString + "mode=" + strMode + "&";
            strQueryString = strQueryString + "data=" + strSql + "&";
            if (strTableNames) {
                strQueryString = strQueryString + "tables=" + strTableNames + "&";
            }
            strQueryString = strQueryString + "lang=" + (strLang || (window.lgLang || "KO"));

            return this.__XmlHTTPRequestQueryString(strQueryString, iTimeOut);
        };

        this.__XmlHTTPRequest3 = function (strCode, iTimeOut, strLang) {
            var strQueryString = "";

            strQueryString = "cmd=DbMessage&";
            strQueryString = strQueryString + "data=" + strCode + "&";
            strQueryString = strQueryString + "lang=" + (strLang || (window.lgLang || "KO"));

            return this.__XmlHTTPRequestQueryString(strQueryString, iTimeOut);
        };

        this.__XmlHTTPRequestQueryString = function (strQueryString, iTimeOut) {
            var xmlHttp = this.__GetXmlHTTPRequest(iTimeOut);

            xmlHttp.send(strQueryString);

            return xmlHttp.responseText;

            //var parser = new DOMParser();

            //var doc = parser.parseFromString(xhr.responseText, 'text/xml');
        };
    };
})();
