/// <reference path="../_references.js" />

var lgStrUrl;
var lgStrSql;
var lgSortKey1 = 1;
var lgPageNo = "";
var lgPageRowCount = 100;
var lgProcessServer = false;
var lgSpreadArr = new Array();
var lgActiveSpread = null;
var lgEditorArr = new Array();
var lgButtonArr = new Array();
var lgGridViewArr = new Array();
var lgActiveGridView = null;
var lgBlnFlgChgValue = false;

var lgAccount = new AccountClass();
var lgLang = Lang.Ko;
var lgCookieId = "";

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.CommonVariable = new function () {
        this.DbName = "";
        this.ApplicationName = "";
        this.ApplicationVersion = "";
        this.ApplicationASMVersion = "";
        this.QuickName = "";
        this.IsDebugWrite = false;
        this.IsLogWrite = false;
        
        if (eni.Cookie) {
            lgLang = eni.Cookie.GetCookie("ckLang");
        }
    }
})();
