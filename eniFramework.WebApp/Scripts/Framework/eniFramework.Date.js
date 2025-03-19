/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.Date = new function () {
        this.isValidMonth = function (num) {
            ///<summary>
            ///유효한(존재하는) 월(月)인지 체크 후 유효한 월일시 1월 이면 '01'을 12월 이면 '12'를 반환.
            ///</summary>
            ///<param name = "num" type = "String, Int">
            ///월(月).
            ///</param>
            ///<returns type = "String">
            ///변환된 월(月)
            ///</returns>

            if (num || num === "") return;

            try {
                //object.value = object.value.replace(/./gi,'');
                if (isNaN(num)) {
                    throw Exception;
                }

                var m = parseInt(num, 10);
                if (!(m >= 1 && m <= 12)) {
                    throw Exception;
                }

                if (num.length === 1) {
                    num = "0" + num;
                }

                return num;
            } catch (Exception) {
                window.alert("월 입력 오류입니다.");
            }
        };


        /**
            * @author 윤영준
            * @description 입력된 문자열이 유효한 월(月)인지 체크, 여부리턴.
            */
        this.isValidMonthCheck = function (num) {
            ///<summary>
            ///입력된 문자열이 유효한 월(月)인지 체크, 여부리턴.
            ///</summary>
            ///<param name = "num" type = "String, Int">
            ///월(月).
            ///</param>
            ///<returns type = "Boolean">
            ///유효월인지 여부
            ///</returns>

            if (num === "" || num === null)
                return false;
            if (isNaN(num)) {
                return false;
            }
            var m = parseInt(num, 10);
            if (!(m >= 1 && m <= 12)) {
                return false;
            }
            return true;
        };
        this.GetCurrentDate = function () {
            return new Date();
        };
        this.GetCurrentYYYYMMDD = function () {
            return this.GetDateYYYYMMDD(this.GetCurrentDate());
        };
        this.GetDateYYYYMMDD = function (pDate) {
            ///<summary>
            ///Date 오브젝트를 YYYY-MM-DD 포멧으로 변환한다.
            ///</summary>
            ///<param name = "pDate" type = "Date">
            ///Date 객체입니다.
            ///</param>
            ///<returns type = "String">
            ///YYYY-MM-DD
            ///</returns>

            if (pDate) {
                var year = pDate.getFullYear();
                var month = pDate.getMonth() + 1;
                var day = pDate.getDate();
                if (new String(month).length === 1) {
                    month = "0" + month;
                }

                if (new String(day).length === 1) {
                    day = "0" + day;
                }

                return year + "-" + month + "-" + day;
            } else {
                return "";
            }
        };
        this.GetDateYYYYMM = function (pDate) {
            ///<summary>
            ///Date 오브젝트를 YYYY-MM-DD 포멧으로 변환한다.
            ///</summary>
            ///<param name = "pDate" type = "Date">
            ///Date 객체입니다.
            ///</param>
            ///<returns type = "String">
            ///YYYY-MM
            ///</returns>

            if (pDate) {
                var year = pDate.getFullYear();
                var month = pDate.getMonth() + 1;
                if (new String(month).length === 1) {
                    month = "0" + month;
                }

                return year + "-" + month;
            } else {
                return "";
            }
        };
        this.isValidStrYYYYMMDD = function (pStrDate) {
            if (pStrDate.match(/^[0-9]{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/)) {
                return true;
            } else {
                return false;
            }
        };
        this.GetUTCTimeString = function (pDate) {
            var timeRegExpPattern = /\d{1,2}:\d{1,2}:\d{1,2}/;
            var results = timeRegExpPattern.exec(pDate.toUTCString());
            return results ? results[0] : "00:00:00";
        };
        this.GetTimeString = function (pDate) {
            var timeRegExpPattern = /\d{1,2}:\d{1,2}:\d{1,2}/;
            var results = timeRegExpPattern.exec(pDate.toTimeString());
            return results ? results[0] : "00:00:00";
        };


        this.GetCurrentTimeString = function () {
            var dt = this.GetCurrentDate();
            return this.PrepareTimeValue(dt.getHours()) + ":" +
                    this.PrepareTimeValue(dt.getMinutes()) + ":" +
                    this.PrepareTimeValue(dt.getSeconds());
        };

        this.PrepareTimeValue = function (iTimeValue) {
            if (iTimeValue < 10)
                iTimeValue = "0" + iTimeValue;
            return iTimeValue;
        };
        this.ParseDate = function (strDate) {
            return new Date(strDate);
        };
    };
})();
