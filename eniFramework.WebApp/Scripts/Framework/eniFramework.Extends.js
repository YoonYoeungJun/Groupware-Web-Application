/// <reference path="../_references.js" />

// Window Class
window.showModalDialogSupported = true;
if (!window.showModalDialog) {
    window.showModalDialogSupported = false;
    window.otherParameters = new Array();
    window.dialogArguments = null;
    window.callbackMethod = null;
    window.showModalDialog = function (arg1, arg2, arg3, callback) {
        var w;
        var h;
        var resizable = "no";
        var scroll = "no";
        var status = "no";
        
        // get the modal specs
        var mdattrs = arg3.split(";");
        for (i = 0; i < mdattrs.length; i++) {
            var mdattr = null;
            if (mdattrs[i].indexOf(":") > 0) {
                mdattr = mdattrs[i].split(":");
            } else {
                mdattr = mdattrs[i].split("=");
            }
                
            var n = mdattr[0];
            var v = mdattr[1];
            if (n) {
                n = n.trim().toLowerCase();
            }
            if (v) {
                v = v.trim().toLowerCase();
            }
            if (n == "dialogheight") {
                h = v.replace("px", "");
            } else if (n == "dialogwidth") {
                w = v.replace("px", "");
            } else if (n == "resizable") {
                resizable = v;
            } else if (n == "scroll") {
                scroll = v;
            } else if (n == "status") {
                status = v;
            } else {
                // no-op
            }
        }
        
        var left = window.screenX + (window.outerWidth / 2) - (w / 2);
        var top = window.screenY + (window.outerHeight / 2) - (h / 2);
        var targetWin = window.open(arg1, "ShowModalDialog" + arg1, 'toolbar=no, location=no, directories=no, status=' + status + ', menubar=no, scrollbars=' + scroll + ', resizable=' + resizable + ', copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

        window.dialogArguments = arg2;

        if (callback != null) {
            window.callbackMethod = callback;
        } else {
            window.callbackMethod = null;
        }
        targetWin.focus();
    };
    window.getDialogArgumentsInner = function () {
        return window.dialogArguments;
    };
    window.getCallbackMethod = function () {
        return window.callbackMethod;
    }
    window.getCallbackMethodName = function () {
        return "callbackMethod";
    }
}
window.getDialogArguments = function () {
    if (!window.showModalDialogSupported) {
        if (opener != null && !opener.closed) {
            window.dialogArguments = opener.getDialogArgumentsInner();
            return window.dialogArguments;
        } else if (parent.opener != null && !parent.opener.closed) {
            window.dialogArguments = parent.opener.getDialogArgumentsInner();
            parent.window.dialogArguments = window.dialogArguments;
            return window.dialogArguments;
        } else {
            return null;
        }
    } else {
        return window.dialogArguments;
    }
};
window.setReturnValue = function (obj) {
    if (!window.showModalDialogSupported) {
        if (opener != null && !opener.closed) {
            var callbackMethod = opener.getCallbackMethodName();
            try {
                if (callbackMethod != null) {
                    opener[callbackMethod](obj);
                } else {
                    opener.showModalDialogCallback(obj);
                }
            } catch (err) { }
        } else if (parent.opener != null && !parent.opener.closed) {
            var callbackMethod = parent.opener.getCallbackMethodName();
            try {
                if (callbackMethod != null) {
                    parent.opener[callbackMethod](obj);
                } else {
                    parent.opener.showModalDialogCallback(obj);
                }
            } catch (err) { }
        }
    } else {
        if (window.opener) {
            window.returnValue = window.opener.returnValue = self.returnValue = obj;
        } else {
            window.returnValue = self.returnValue = obj;
        }
    }
};

// String Class
String.prototype.trim = function () {
	///<summary>
	///공백 없애기.
	///</summary>
    return this.replace(/(^\s*)|(\s*$)/gi, "");
};
String.trim = String.prototype.trim;

String.prototype.replaceAll = function (str1, str2) {
	///<summary>
	///문자열 바꾸기.
	///</summary>
	///<param name = "str1" type = "String">
	///문자열 대상.
	///</param>
	///<param name = "str2" type = "String, Char">
	///바꿀 문자열 및 문자.
	///</param>
	///<returns type = "String">
	///바뀐 문자열
	///</returns>
    var temp_str = "";
    if (this.trim() !== "" && str1 !== str2) {
    	temp_str = this.trim();
        while (temp_str.indexOf(str1) > -1){
            temp_str = temp_str.replace(str1, str2);
        }
    }
    return temp_str;
};
String.replaceAll = String.prototype.replaceAll;

String.prototype.padLeft = function (l, c) {
    return Array(l - this.length + 1).join(c || " ") + this;
};
String.padLeft = String.prototype.padLeft;

// Array Class
if (!Array.prototype.insert || !Array.insert) {
    Array.prototype.insert = function (index, item) {
        this.splice(index, 0, item);
    };
    Array.insert = Array.prototype.insert;
}
if (!Array.prototype.remove || !Array.remove) {
    Array.prototype.remove = function (idx) {
        return (idx < 0 || idx > this.length) ? this : this.slice(0, idx).concat(this.slice(idx + 1, this.length));
    };
    Array.remove = Array.prototype.remove;
}
if (!Array.prototype.indexOf || !Array.indexOf) {
    Array.prototype.indexOf = function (elt /*, from*/) {
        var len = this.length >>> 0;

        var from = Number(arguments[1]) || 0;
        from = (from < 0)
             ? Math.ceil(from)
             : Math.floor(from);
        if (from < 0)
            from += len;

        for (; from < len; from++) {
            if (from in this &&
                this[from] === elt)
                return from;
        }
        return -1;
    };
    Array.indexOf = Array.prototype.indexOf;
}
//ie8 error
if (!Array.prototype.filter || !Array.filter) {
    Array.prototype.filter = function (fun /*, thisp */) {
        "use strict";

        if (this === void 0 || this === null)
            throw new TypeError();

        var t = Object(this);
        var len = t.length >>> 0;
        if (typeof fun !== "function")
            throw new TypeError();

        var res = [];
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in t) {
                var val = t[i]; // in case fun mutates this
                if (fun.call(thisp, val, i, t))
                    res.push(val);
            }
        }

        return res;
    };
    Array.filter = Array.prototype.filter;
}
if (!Array.prototype.reduce || !Array.reduce) {
    Array.prototype.reduce = function (callback /*, initialValue*/) {
        if (this === null) {
            throw new TypeError('Array.prototype.reduce ' +
              'called on null or undefined');
        }
        if (typeof callback !== 'function') {
            throw new TypeError(callback +
              ' is not a function');
        }

        // 1. Let O be ? ToObject(this value).
        var o = Object(this);

        // 2. Let len be ? ToLength(? Get(O, "length")).
        var len = o.length >>> 0;

        // Steps 3, 4, 5, 6, 7      
        var k = 0;
        var value;

        if (arguments.length >= 2) {
            value = arguments[1];
        } else {
            while (k < len && !(k in o)) {
                k++;
            }

            // 3. If len is 0 and initialValue is not present,
            //    throw a TypeError exception.
            if (k >= len) {
                throw new TypeError('Reduce of empty array ' +
                  'with no initial value');
            }
            value = o[k++];
        }

        // 8. Repeat, while k < len
        while (k < len) {
            // a. Let Pk be ! ToString(k).
            // b. Let kPresent be ? HasProperty(O, Pk).
            // c. If kPresent is true, then
            //    i.  Let kValue be ? Get(O, Pk).
            //    ii. Let accumulator be ? Call(
            //          callbackfn, undefined,
            //          « accumulator, kValue, k, O »).
            if (k in o) {
                value = callback(value, o[k], k, o);
            }

            // d. Increase k by 1.      
            k++;
        }

        // 9. Return accumulator.
        return value;
    }
    Array.reduce = Array.prototype.reduce;
}

if (!Array.prototype.map || !Array.map) {
    Array.prototype.map = function (callback, thisArg) {
        var T, A, k;

        if (this == null) {
            throw new TypeError(" this is null or not defined");
        }

        // 1. Let O be the result of calling ToObject passing the |this| value as the argument.
        var O = Object(this);

        // 2. Let lenValue be the result of calling the Get internal method of O with the argument "length".
        // 3. Let len be ToUint32(lenValue).
        var len = O.length >>> 0;

        // 4. If IsCallable(callback) is false, throw a TypeError exception.
        // See: http://es5.github.com/#x9.11
        if (typeof callback !== "function") {
            throw new TypeError(callback + " is not a function");
        }

        // 5. If thisArg was supplied, let T be thisArg; else let T be undefined.
        if (thisArg) {
            T = thisArg;
        }

        // 6. Let A be a new array created as if by the expression new Array(len) where Array is
        // the standard built-in constructor with that name and len is the value of len.
        A = new Array(len);

        // 7. Let k be 0
        k = 0;

        // 8. Repeat, while k < len
        while (k < len) {

            var kValue, mappedValue;

            // a. Let Pk be ToString(k).
            //   This is implicit for LHS operands of the in operator
            // b. Let kPresent be the result of calling the HasProperty internal method of O with argument Pk.
            //   This step can be combined with c
            // c. If kPresent is true, then
            if (k in O) {

                // i. Let kValue be the result of calling the Get internal method of O with argument Pk.
                kValue = O[k];

                // ii. Let mappedValue be the result of calling the Call internal method of callback
                // with T as the this value and argument list containing kValue, k, and O.
                mappedValue = callback.call(T, kValue, k, O);

                // iii. Call the DefineOwnProperty internal method of A with arguments
                // Pk, Property Descriptor {Value: mappedValue, : true, Enumerable: true, Configurable: true},
                // and false.

                // In browsers that support Object.defineProperty, use the following:
                // Object.defineProperty(A, Pk, { value: mappedValue, writable: true, enumerable: true, configurable: true });

                // For best browser support, use the following:
                A[k] = mappedValue;
            }
            // d. Increase k by 1.
            k++;
        }

        // 9. return A
        return A;
    };

    Array.map = Array.prototype.map;
}

if (!Array.prototype.forEach || Array.forEach) {
    Array.prototype.forEach = function (callback) {
        for (var i = 0; i < this.length; i++) {
            callback.apply(this, [this[i], i, this]);
        }
    };
    Array.forEach = Array.prototype.forEach;
}



//ie8
if (!Function.prototype.slice || Function.slice) {
    Array.prototype.slice = function (begin, end) {
        // IE < 9 gets unhappy with an undefined end argument
        end = (typeof end !== 'undefined') ? end : this.length;

        // For array like object we handle it ourselves.
        var i, cloned = [],
          size, len = this.length;

        // Handle negative value for "begin"
        var start = begin || 0;
        start = (start >= 0) ? start : Math.max(0, len + start);

        // Handle negative value for "end"
        var upTo = (typeof end == 'number') ? Math.min(end, len) : len;
        if (end < 0) {
            upTo = len + end;
        }

        // Actual expected size of the slice
        size = upTo - start;

        if (size > 0) {
            cloned = new Array(size);
            if (this.charAt) {
                for (i = 0; i < size; i++) {
                    cloned[i] = this.charAt(start + i);
                }
            } else {
                for (i = 0; i < size; i++) {
                    cloned[i] = this[start + i];
                }
            }
        }
        return cloned;
    };
    Function.slice = Function.prototype.slice;
}

//ie8
if (!Function.prototype.bind || Function.bind) {
    Function.prototype.bind = function (oThis) {
        if (typeof this !== "function") {
            // closest thing possible to the ECMAScript 5 internal IsCallable function
            throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
        }

        var aArgs = Array.prototype.slice.call(arguments, 1),
          fToBind = this,
          fNOP = function () { },
          fBound = function () {
              return fToBind.apply(this instanceof fNOP && oThis ? this : oThis, aArgs.concat(Array.prototype.slice.call(arguments)));
          };

        fNOP.prototype = this.prototype;
        fBound.prototype = new fNOP();

        return fBound;
    };

    Function.bind = Function.prototype.bind;
}

// Window Document (IE8에서는 우래 함수를 지원안함으로 함수가 없으면 추가해준다)
if (!document.getElementsByClassName) {
    var indexOf = [].indexOf || function (prop) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] === prop) return i;
        }
        return -1;
    };
    getElementsByClassName = function (className, context) {
        var elems = document.querySelectorAll ? context.querySelectorAll("." + className) : (function () {
            var all = context.getElementsByTagName("*"),
                elements = [],
                i = 0;
            for (; i < all.length; i++) {
                if (all[i].className && (" " + all[i].className + " ").indexOf(" " + className + " ") > -1 && indexOf.call(elements, all[i]) === -1) elements.push(all[i]);
            }
            return elements;
        })();
        return elems;
    };
    document.getElementsByClassName = function (className) {
        return getElementsByClassName(className, document);
    };
    if (window.Element) {
        window.Element.prototype.getElementsByClassName = function (className) {
            return getElementsByClassName(className, this);
        };
    }
}

//ExtJS IE9 createContextualFragment 에러 
if ((typeof Range !== "undefined") && !Range.prototype.createContextualFragment) {
    Range.prototype.createContextualFragment = function (html) {
        var frag = document.createDocumentFragment(),
        div = document.createElement("div");
        frag.appendChild(div);
        div.outerHTML = html;
        return frag;
    };
}

//if (!window.attachEvent) {
//    window.attachEvent = window.addEventListener;
//}

//if (!window.detachEvent) {
//    window.detachEvent = window.removeEventListener;
//}