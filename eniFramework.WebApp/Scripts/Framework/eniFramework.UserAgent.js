/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.UserAgent = new function () {
        this.Browser = {
            Version : $.browser.version,
            Type: null
        };

        if ($ && $.browser) {
            this.Browser = {
                Version: $.browser.version,
                Type: null
            };
        } else {
            var ua = navigator.userAgent, tem, M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
            if (/trident/i.test(M[1])) {
                tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
                return { name: 'IE', version: (tem[1] || '') };
            }
            if (M[1] === 'Chrome') {
                tem = ua.match(/\bOPR\/(\d+)/)
                if (tem != null) { return { name: 'Opera', version: tem[1] }; }
            }
            M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
            if ((tem = ua.match(/version\/(\d+)/i)) != null) { M.splice(1, 1, tem[1]); }
            this.Browser = {
                Type: M[0],
                Version: M[1]
            };
        }

        if (navigator.userAgent.toLowerCase().indexOf("msie") !== -1 || navigator.userAgent.toLowerCase().indexOf("trident") !== -1) {
            this.Browser.Type = "IE";
        } else if (navigator.userAgent.toLowerCase().indexOf("opera") !== -1 || navigator.userAgent.toLowerCase().indexOf("opr") !== -1) {
            this.Browser.Type = "OPERA";
        } else if (navigator.userAgent.toLowerCase().indexOf("firefox") !== -1) {
            this.Browser.Type = "FIREFOX";
        } else if (navigator.userAgent.toLowerCase().indexOf("safari") !== -1) {
            if (navigator.userAgent.toLowerCase().indexOf("chrome") !== -1) {
                this.Browser.Type = "CHROME";
            } else {
                this.Browser.Type = "SAFARI";
            }
        } 

        this.IsMSIE = function(){
            if ($.browser.msie){
                return true;
            } else {
                return false;
            }
        };
    }
})();
