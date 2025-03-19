/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.Cookie = new function () {
        this.SetCookie = function (key, value, options) {
            if ($ && $.cookie) {
                $.cookie(key, escape(value), options);
            }
        };
        this.GetCookie = function (key) {
            if ($ && $.cookie) {
                return unescape($.cookie(key));
            } else {
                return "";
            }
        };
        this.GetStorage = function (strKey) {
            return localStorage.getItem(strKey);
        };
        this.SetStorage = function (strKey, strValue) {
            localStorage.setItem(strKey, strValue);
        };
        this.ClearStorage = function () {
            localStorage.clear();
        };
    }
})();

