/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }
    eni.Utils = new function () {
        this.IsNullOrUndefinedToString = function (strValue) {
            if (strValue === null || strValue === undefined || strValue === 'undefined') {
                return "";
            } else {
                return strValue;
            }
        };
        this.ConvertToJson = function (strJson) {
            return JSON.parse(strJson);
        };
        this.GetFileSizeString = function (pContentLength) {
            var sizeDimensions = ['bytes', 'Kb', 'Mb', 'Gb', 'Tb'];
            var index = 0;
            var length = pContentLength;
            var postfix = sizeDimensions[index];
            while (length > 1024) {
                length = length / 1024;
                postfix = sizeDimensions[++index];
            }
            var numberRegExpPattern = /[-+]?[0-9]*(?:\.|\,)[0-9]{0,2}|[0-9]{0,2}/;
            var results = numberRegExpPattern.exec(length);
            length = results ? results[0] : Math.floor(length);
            return length.toString() + ' ' + postfix;
        };

        this.GetQueryString = function (sName, sUrl) {
            if (!sUrl) {
                sUrl = window.location.href;
            }
            if (sName) {
                sName = sName.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");

                var regexS = "[\\?&]" + sName + "=([^&#]*)";
                var regex = new RegExp(regexS);
                var results = regex.exec(sUrl);

                if (results !== null) {
                    return decodeURIComponent(results[1].replace(/\+/g, " "));
                } else {
                    return "";
                }
            } else {
                return "";
            }
        };

        this.IsNumeric = function(num, opt) {
            num = String(num).replace(/^\s+|\s+$/g, "");
            if (typeof opt == "undefined" || opt == "1") {
                var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
            } else if (opt == "2") {
                var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
            } else if (opt == "3") {
                var regex = /^[0-9]+(\.[0-9]+)?$/g;
            } else {
                var regex = /^[0-9]$/g;
            }
            if (regex.test(num)) {
                num = num.replace(/,/g, "");
                return isNaN(num) ? false : true;
            } else { return false; }
        }

        this.GetNumeric = function(str, opt) {
            if (this.IsNumeric(str, opt)) {
                str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
                return Number(str);
            } else {
                return str;
            }
        }

        this.FormatNumber = function (str, opt) {
            var rstr = "", sign = "";
            if (this.IsNumeric(str, opt)) {
                str = String(this.GetNumeric(str, opt));
                if (str.substr(0, 1) == "-") {
                    sign = "-";
                    str = str.substr(1);
                }
                var arr = str.split(".");
                for (var ii = 0 ; ii < arr[0].length ; ii++) {
                    if (ii % 3 == 0 && ii > 0) {
                        rstr = arr[0].substring(arr[0].length - ii, arr[0].length - ii - 1) + "," + rstr;
                    } else {
                        rstr = arr[0].substring(arr[0].length - ii, arr[0].length - ii - 1) + rstr;
                    }
                }
                rstr = sign + rstr;
                return arr.length > 1 ? rstr + "." + arr[1] : rstr;
            } else {
                return str;
            }
        }
        this.Invoke = function (method) {
            window.setTimeout(method, 0);
        };
		this.EventBubblingStop = function (event) {
			event = event.browserEvent || event;
			if (event.preventDefault) {
				event.preventDefault();
			} else {
				event.returnValue = false;
			}
		};
        this.loadPage = function () {
            //<input type="button" value="open win" onclick="window.open('embed.html','_blank')" />
            var lh = location.href;
            var embed = document.createElement('embed');
            embed.setAttribute('width', '100%');
            embed.setAttribute('height', '100%');
            embed.setAttribute('type', 'application/x-meadco-neptune-ax');
            embed.setAttribute('param-location', lh);
            var tbody = document.getElementsByTagName('body')[0];
            tbody.appendChild(embed);
            try {
                var w = new ActiveXObject('Word.Application');
                var docText;
                var obj;
                if (w != null) {
                    w.Visible = true; //set to false to stop the Word document from opening
                    obj = w.Documents.Open("C:\\A.doc");
                    docText = obj.Content;
                    w.Selection.TypeText("Hello world!");
                    w.Documents.Save();
                }
            }
            catch (e) { }
        };
    }
})();
