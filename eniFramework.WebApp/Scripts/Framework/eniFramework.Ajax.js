/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    }

    eni.Ajax = new function () {
        this.initAjax = function () {
            //ext
            Ext.Ajax.defaultHeaders = {
                'If-Modified-Since': 'Sat, 1 Jan 2000 00:00:00 GMT',
                IsAjax: true
            };

            var showMask = function () {
                var mask = Ext.getBody().mask('Loading...');
                mask.setStyle('z-index', Ext.WindowMgr.zseed + 1000);
            };

            var hideMask = function () {
                Ext.getBody().unmask();
            };

            Ext.Ajax.on('beforerequest', showMask);
            Ext.Ajax.on('requestcomplete', hideMask);
            Ext.Ajax.on('requestexception', hideMask);
        };
        this.Request = function (pUrl, pData, pType, pCallbackFunc, pErrorCallbackFunc, pOptions) {
            var options = {
                url: pUrl,
                data: (typeof pData === "object" && ((pOptions && pOptions.DataType) || "json") === "json") ? JSON.stringify(pData) : pData,
                type: pType || "post",
                async: (pOptions && pOptions.Async) || true, //false: ajax가 완료된후 다음 명령을 실행한다. true: 실행후 완료 여부 상관없이 다음명령을 실행한다.
                dataType: (pOptions && pOptions.DataType) || "json", //xml.json, script, text, html
                timeout: (pOptions && pOptions.Timeout) || 60000,
                cache: (pOptions && pOptions.Cache) || false,
                contentType: (pOptions && pOptions.ContentType) || "application/" + ((pOptions && pOptions.DataType) || "json") + "; charset=utf-8",
                clearForm: (pOptions && pOptions.ClearForm) || false,
                resetForm: (pOptions && pOptions.ResetForm) || false,
                beforSend: function (a, b, c, d) { },
                success: function (responsData, statusText, xhr) {
                    try {
                        responsData = JSON.parse(responsData);
                        if (!responsData.Code) {
                            if (pCallbackFunc) {
                                pCallbackFunc(responsData, statusText, xhr);
                            }
                        } else {
                            if (pErrorCallbackFunc) {
                                var error = {
                                    Code: responsData.Code || -1,
                                    Message: responsData.Message || statusText
                                }
                                pErrorCallbackFunc(error, xhr, statusText);
                            }
                        }
                    } catch (ex) {
                        var error = {
                            Code: ex.number,
                            Message: ex.message
                        }
                        pErrorCallbackFunc(error, xhr, statusText, ex);
                    }
                },
                error: function (xhr, statusText, ex) {
                    if (pErrorCallbackFunc) {
                        var error = {
                            Code: -1,
                            Message: statusText
                        }
                        pErrorCallbackFunc(error, xhr, statusText, ex);
                    }
                }
            };

            $.ajax(options);
        };
        this.RequestGET = function (pUrl, pData, pCallbackFunc, pErrorCallbackFunc, pOptions) {
            var options = {
                url: pUrl,
                data: pData,
                type: "get",
                async: (pOptions && pOptions.Async) || true, //false: ajax가 완료된후 다음 명령을 실행한다. true: 실행후 완료 여부 상관없이 다음명령을 실행한다.
                dataType: ((pOptions && pOptions.DataType) || "json"), //xml.json, script, text, html
                timeout: (pOptions && pOptions.Timeout) || 30000,
                cache: (pOptions && pOptions.Cache) || false,
                contentType: (pOptions && pOptions.ContentType) || "application/" + ((pOptions && pOptions.DataType) || "json") + "; charset=utf-8",
                beforSend: function (a, b, c, d) { },
                success: function (responsData, statusText, xhr) {
                    if (eni.Log) {
                        eni.Log.WriteLog("eni.Ajax.RequestGETJson : " + statusText);
                    }
                    if (responsData) {
                        if (responsData.IsReqError === false) {
                            if (pCallbackFunc) {
                                pCallbackFunc(responsData.Data, responsData, statusText, xhr);
                            }
                        } else {
                            if (pErrorCallbackFunc) {
                                var error = {
                                    IsReqError: responsData.IsReqError || true,
                                    ErrorCode: responsData.ReqErrorCode || -1,
                                    ErrorMessage: responsData.ReqErrorMessage || statusText
                                }
                                pErrorCallbackFunc(error, xhr, statusText);
                            }
                        }
                    }
                },
                error: function (xhr, statusText, ex) {
                    if (statusText === "error") {
                        //요청 에러
                        if (eni.Log && eni.Message) {
                            eni.Log.WriteLog(eni.Message.StrBundle("MSGBD00114"), LogType.Error, "eniFramework.Ajax");
                        }
                    } else if (statusText === "parsererror") { //요청 dataType 에러
                        //데이터 타입 에러
                        if (eni.Log && eni.Message) {
                            eni.Log.WriteLog(eni.Message.StrBundle("MSGBD00115"), LogType.Error, "eniFramework.Ajax");
                        }
                    } else if (statusText === "timeout") {
                        //요청 시간 에러
                        if (eni.Log && eni.Message) {
                            eni.Log.WriteLog(eni.Message.StrBundle("MSGBD00116"), LogType.Error, "eniFramework.Ajax");
                        }
                    }

                    if (pErrorCallbackFunc) {
                        var error = {
                            IsReqError : true,
                            ErrorCode: -1,
                            ErrorMessage: statusText
                        }
                        pErrorCallbackFunc(error, xhr, statusText, ex);
                    }
                }
            };

            $.ajax(options);
        };

        this.RequestPOST = function (pUrl, pData, pCallbackFunc, pErrorCallbackFunc, pOptions) {
            var options = {
                url: pUrl,
                data: (typeof pData === "object") ? JSON.stringify(pData) : pData,
                type: "post",
                async: (pOptions && pOptions.Async) || true, //false: ajax가 완료된후 다음 명령을 실행한다. true: 실행후 완료 여부 상관없이 다음명령을 실행한다.
                dataType: (pOptions && pOptions.DataType) || "json", //xml.json, script, text, html
                timeout: (pOptions && pOptions.Timeout) || 30000,
                cache: (pOptions && pOptions.Cache) || false,
                contentType: (pOptions && pOptions.ContentType) || "application/json; charset=utf-8",
                clearForm: (pOptions && pOptions.ClearForm) || false,
                resetForm: (pOptions && pOptions.ResetForm) || false,
                beforSend: function (a, b, c, d) { },
                success: function (responsData, statusText, xhr) {
                    if (!responsData.Code) {
                        if (pCallbackFunc) {
                            pCallbackFunc(responsData, statusText, xhr);
                        }
                    } else {
                        if (pErrorCallbackFunc) {
                            var error = {
                                Code: responsData.Code || -1,
                                Message: responsData.Message || statusText
                            }
                            pErrorCallbackFunc(error, xhr, statusText);
                        }
                    }
                },
                error: function (xhr, statusText, ex) {
                    if (pErrorCallbackFunc) {
                        var error = {
                            Code: -1,
                            Message: statusText
                        }
                        pErrorCallbackFunc(error, xhr, statusText, ex);
                    }
                }
            };

            $.ajax(options);
        }

        // Name : eniFramework.AjaxBaseClass.GetJson
        // Type : Method
        // Description : 서버측으로 Ajax를 이용하여 Json타입의 데이터를 요청한다.
        // Arguments
        // url : 서버로 요청할 URL
        // datas : 서버로 전송될 Json 데어터
        // callBackFunc : 요청후 콜백받을 메서드
        // isSync : true 동기, false 비동기
        // errCallBackFunc : 입력된 URL로 요청을 보내었을때 에러가 발생하면 콜백받을 메서드
        // isMsg : 
        this.GetJson = function (url, datas, callBackFunc, isSync, errCallBackFunc, isMsg) {
            //this.loading();

            //if (typeof datas === "object"){
            //    datas = JSON.stringify(datas);
            //}
            //datas = encodeURI(datas);

            $.ajax({
                type: 'GET',
                url: url,
                cache: false,
                data: datas,
                async: (isSync == null ? true : isSync),
                success: function (responsData, statusText, xhr) {
                    if (responsData.IsReqError === false) {
                        callBackFunc(responsData.ReqData);
                        return;
                    }

                    if (responsData.IsReqError && errCallBackFunc) {
                        errCallBackFunc(responsData);
                    }
                },
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function (xhr, statusText, ex) {
                    alert("Ajax 요청을 보내는중 오류가 발생하였습니다.");
                }
            });
        }
        //함수 손봐야함
        // 포스트로 넘기면 스트림으로 날라가기때문에 QueryString에는 아규먼트가 나오지않아 서버측 소스를 개발해야함
        this.PostJson = function (url, datas, callBackFunc, isSync, errCallBackFunc, isMsg) {
            //if (isMsg == undefined)
            //    isMsg = true;
            //this.loading();
            //var toolbarState = viewBase.toolbarState;
            var that = this;
            //if (typeof datas === "object")
            //    datas = JSON.stringify(datas);
            //datas = encodeURI(datas);
            $.ajax({
                type: 'POST',
                url: url,
                data: datas,
                async: (isSync === null || isSync === undefined ? true : isSync),
                success: function (result) {
                    if (result.IsReqError === false) {
                        callBackFunc(result.ReqData);
                    } else if (isMsg && typeof isMsg === "Boolean") {
                        alert(result.ReqMessage);
                    } else {
                        callBackFunc(result.ReqData);
                    }
                },
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                error: function (xhr, statusText, ex) {
                    that.loadingOff();
                    //var m = this.url + ' : ' + msg.statusText;
                    //alert(m);
                }
            });
        }

        /**
            * ajaxRequest 요청메소드
            * 
            * @param {Object} inOptions : input any Options
            * @param {Object} inBeforSend : Request befor call method
            * @param {Object} inSuccess : Request Success call method
            * @param {Object} inComplete : Request Complete call method
            * @param {Object} inError : Request Error call method
            * @param {Object} msgBoxParent : Mootools Message Box Parent Object
            * 
            * type
            * 	[get, post]
            * 
            * async
            *  [true, false]
            * 
            * dataType(유의사항으로 JSON을 지정하면 respons 객체에도 JSON형태의 데이터를 넣어줘야한다)
            * 	[ html, xml, html, script, json]
            * 
            * timeout
            * 	[integer]
            * 
            * cache
            *  [true, false]
            *  
            * contentType
            * 	[application/octet-stream, application/msword, application/zip, application/vnd.ms-excel, application/vnd.ms-PowerPoint, application/rtf,text/html,text/jsp,image/gif,image/jpeg,video/x-ms-asf,video/avi,video/mpeg,audio/wav,audio/mpeg3]
            * 
            */
        function ajaxReq(inOptions, inBeforSend, inSuccess, inError) {
            if (!inOptions.url) {
                info('url이 없습니다.');
                return;
            }

            var options = {
                url: inOptions.url,
                data: inOptions.data,
                type: inOptions.type || 'post',
                async: inOptions.async || true,
                dataType: inOptions.dataType || 'json',
                timeout: inOptions.timeout || 30000,
                cache: inOptions.cache || false,
                contentType: inOptions.contentType || 'application/x-www-form-urlencoded;charset=euc-kr',
                beforSend: function (a, b, c, d) {

                },
                success: function (responsData, statusText, xhr) {
                    info("ajaxReq Success : ", statusText);

                    if (responsData.state) {
                        if (responsData.code) {
                            Alert(responsData.code, inOptions.msgBoxParent || undefined, inSuccess, [responsData.data, xhr, null]);
                        } else {
                            if (inSuccess) inSuccess(responsData.data, xhr);
                        }
                    } else {
                        if (responsData.code) {
                            Error(responsData.code, inOptions.msgBoxParent || undefined);
                        }
                    }
                },
                error: function (xhr, statusText, ex) {
                    info("ajaxReq Error : ", statusText);

                    if (statusText == 'error') {
                        Error("MSGF401", inOptions.msgBoxParent || undefined);
                    } else if (statusText == 'parsererror') { //요청 dataType 에러
                        Error("MSGF402", inOptions.msgBoxParent || undefined);
                    } else if (statusText = 'timeout') {
                        Error("MSGF403", inOptions.msgBoxParent || undefined);
                    }

                    if (inError) {
                        inError(xhr, ex);
                    }
                }
            };

            $.ajax(options);
        }

        /**
            * ajaxRequest By Form 요청메소드
            * 
            * @param {Object} $target : jQeury Form Object
            * @param {Object} inOptions : in Options JSON
            * @param {Object} isVal : Mootools formchecker Object
            * @param {Object} callBack : success Request Method callBack(responseText, xhr, $form)
            * @param {Object} msgBoxParent : Mootools Message Box Parent Object
            * 
            * default : {type:post, dataType:json, contentType:application/x-www-form-urlencoded;charset=euc-kr, timeout:30000, clearForm:false, resetForm:false}
            *
            * type
            * 	[get, post]
            * 
            * dataType(유의사항으로 JSON을 지정하면 respons 객체에도 JSON형태의 데이터를 넣어줘야한다)
            * 	[ html, xml, html, script, json]
            * 
            * contentType
            * 	[application/x-www-form-urlencoded,text/plain,application/octet-stream,application/msword,application/zip,application/vnd.ms-excel,application/vnd.ms-PowerPoint,application/rtf,text/html,text/jsp,image/gif,image/jpeg,video/x-ms-asf,video/avi,video/mpeg,audio/wav,audio/mpeg3]
            * 
            * timeout
            * 	[integer]
            * 
            * clearForm
            * 	[true, false]
            * 
            * resetForm
            * 	[true, false]
            
            */
        function ajaxReqbyForm($target, inOptions, inBeforSend, inSuccess, inError) {
            if (!$target && $target instanceof jQuery && $target != undefined) {
                info('jQuery Form객체가 초기화 되지 않았습니다.');
                return;
            }
            if (!inOptions.url) {
                info('url이 없습니다.');
                return;
            }
            var options = {
                url: inOptions.url,
                type: inOptions.type || 'post',
                async: inOptions.async || false,
                dataType: inOptions.dataType || 'json',
                contentType: inOptions.contentType || 'application/x-www-form-urlencoded;charset=euc-kr',
                timeout: inOptions.timeout || 30000,
                cache: inOptions.cache || false,
                clearForm: inOptions.clearForm || false,
                resetForm: inOptions.resetForm || false,
                beforeSubmit: function (formData, jqForm, options) {
                    if (inBeforSend) {
                        return inBeforSend.validationForm();
                    } else {
                        return true;
                    }
                },
                success: function (responsData, statusText, xhr, $form) {
                    info("ajaxReqbyForm Success : ", statusText);

                    if (responsData.state) {
                        if (responsData.code) {
                            Alert(responsData.code, inOptions.msgBoxParent || undefined, inSuccess, [responsData.data, xhr, $form]);
                        } else {
                            if (inSuccess) inSuccess(responsData.data, xhr, $form);
                        }
                    } else {
                        if (responsData.code) {
                            Error(responsData.code, inOptions.msgBoxParent || undefined);
                        }
                    }
                },
                error: function (xhr, statusText, ex) { //Server측 Error발생시 호출
                    info("ajaxReqbyForm Error : ", statusText);

                    if (statusText == 'error') {
                        Error("MSGF401", inOptions.msgBoxParent || undefined);
                    } else if (statusText == 'parsererror') { //요청 dataType 에러
                        Error("MSGF402", inOptions.msgBoxParent || undefined);
                    } else if (statusText = 'timeout') {
                        Error("MSGF403", inOptions.msgBoxParent || undefined);
                    }

                    if (inError) {
                        inError(xhr, ex);
                    }
                }
            }

            $target.ajaxSubmit(options);
        }
    }
})();
