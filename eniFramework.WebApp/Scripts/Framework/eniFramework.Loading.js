/// <reference path="../_references.js" />

var lgSLBox = $();     /* 하한 상태 로딩 jQuery */
lgSLBox.Icon = $();
lgSLBox.Text = $();

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    //http://www.miraeweb.com/wp-content/uploads/2015/04/08.EMRO_SenchaCon_Korea.pdf
	eni.Loading = new function () {
	    var str_default_loading = eni.Message.StrBundle("MSGBD00105");
	    var loading_ico_path = "/contents/images/loading/loading_18x18.gif";
	    var status_ico_path = "/contents/images/status_ok.png";
	    var s_loadMask = null;     /* Ext 팝업 로딩 박스 */
	    var s_loadMaskFrame = null;

	    var getLoadMask = function (strMsg) {
	        if (!s_loadMaskFrame) {
	            s_loadMaskFrame = {
	                con: new function () {
	                    var d_div = document.createElement("div");
	                    d_div.id = "sblank_con";
	                    d_div.style.visibility = "hidden";
	                    //IE9 알파속성 안됨
	                    //d_div.setAttribute("style", "position:absolute !important;top:0;left:0;z-index:21;filter:alpha(opacity=0)");
	                    d_div.setAttribute("style", "position:absolute !important;top:0;left:0;z-index:21;");
	                    document.body.appendChild(d_div);
	                    return d_div;
	                },
	                frame: new function () {
	                    var d_frame = document.createElement("iframe");
	                    d_frame.id = "sblank";
	                    d_frame.src = "about:blank";
	                    d_frame.style.visibility = "hidden";
                        //IE9 알파속성 안됨
	                    //d_frame.setAttribute("style", "position:absolute;top:0;left:0;z-index:20;filter:alpha(opacity=0)");
	                    d_frame.setAttribute("style", "position:absolute;top:0;left:0;z-index:20;");
	                    document.body.appendChild(d_frame);
	                    return d_frame;
	                },
	                el_con: new Ext.Element("sblank_con"),
	                el_frame: new Ext.Element("sblank"),
	                width: 0,
	                height: 0,
	                update: function (strUpdateMsg) {
	                    var d_div = document.createElement("div");
	                    var dd_div = document.createElement("div");
	                    dd_div.innerText = strUpdateMsg;

	                    d_div.appendChild(dd_div);
	                    d_div.className = "ext-el-mask-msg x-mask-loading";

	                    document.body.appendChild(d_div);

	                    this.width = d_div.offsetWidth;
	                    this.height = d_div.offsetHeight;

	                    document.body.removeChild(d_div);

	                    var left = (document.body.offsetWidth - this.width) / 2;
	                    var top = (document.body.offsetHeight - this.height) / 2;

	                    this.el_con.setTop(top);
	                    this.el_con.setLeft(left);
	                    this.el_con.setWidth(this.width + 2);
	                    this.el_con.setHeight(this.height);

	                    this.el_frame.setTop(top);
	                    this.el_frame.setLeft(left);
	                    this.el_frame.setWidth(this.width + 2);
	                    this.el_frame.setHeight(this.height);
                        
	                    if (!s_loadMask) {
	                        s_loadMask = new Ext.LoadMask(this.el_con, { msg: strUpdateMsg });
	                        $(window).resize(function () {
	                            if (s_loadMaskFrame) {
	                                var upleft = (document.body.offsetWidth - s_loadMaskFrame.width) / 2;
	                                var uptop = (document.body.offsetHeight - s_loadMaskFrame.height) / 2;

	                                s_loadMaskFrame.el_con.setTop(uptop);
	                                s_loadMaskFrame.el_con.setLeft(upleft);

	                                s_loadMaskFrame.el_frame.setTop(uptop);
	                                s_loadMaskFrame.el_frame.setLeft(upleft);
	                            }
	                        });
	                    } else {
	                        s_loadMask.msg = strUpdateMsg;
	                    }
	                },
	                show: function () {
	                    this.el_con.show();
	                    this.el_frame.show();
	                    s_loadMask.show();
	                },
	                hide: function () {
	                    this.el_con.hide();
	                    this.el_frame.hide();
	                    s_loadMask.hide();
	                },
	                isVisible: function () {
	                    return this.el_frame.isVisible();
	                }
	            }
	        }

	        s_loadMaskFrame.update(strMsg);
	        
	        return s_loadMaskFrame;
	    };

	    this.DisplayLoadingAll = function (bIsDisplay, strMsg) {
	        this.DisplayLoading(bIsDisplay, strMsg);
	        this.DisplayStatusLoading(bIsDisplay, strMsg);
	    };

	    this.DisplayLoading = function (bIsDisplay, strMsg) {
	        if (window.Ext && Ext.LoadMask) {
	            var showMsg = (strMsg || str_default_loading);
	            var loadMaskControl = getLoadMask(showMsg);

	            if (bIsDisplay) {
	                loadMaskControl.show();
	            } else {
	                loadMaskControl.hide();
	            }
	        }
	    };
	    this.IsDisplayLoading = function () {
	        if (s_loadMaskFrame) {
	            return s_loadMaskFrame.isVisible();
	        } else {
	            return false;
	        }
	    };

	    this.DisplayStatusLoading = function (pIsDisplay, strStatus) {
	        if (pIsDisplay !== undefined && pIsDisplay !== null && typeof pIsDisplay === 'boolean') {
	            if (pIsDisplay === true) {
	                if (lgSLBox.Icon) {
	                    //lgSLBox.Icon.attr("src", loading_ico_path);
	                    lgSLBox.Icon.attr("style", "");
	                    lgSLBox.Icon.attr("title", str_default_loading);
	                }
	                if (lgSLBox.Text) {
	                    if (strStatus && strStatus !== "") {
	                        lgSLBox.Text.text(strStatus);
	                        lgSLBox.Text.attr("title", strStatus);
	                    } else {
	                        lgSLBox.Text.text(str_default_loading);
	                        lgSLBox.Text.attr("title", str_default_loading);
	                    }
	                }
	            } else {
	                if (lgSLBox.Icon) {
	                    //lgSLBox.Icon.attr("src", status_ico_path);
	                    lgSLBox.Icon.attr("style", "display:none;");
	                    lgSLBox.Icon.attr("title", "");
	                }
	                if (lgSLBox.Text) {
	                    lgSLBox.Text.text("");
	                    lgSLBox.Text.attr("title", "");
	                }
	            }
	        } else if (typeof pIsDisplay === "string") {
	            if (lgSLBox.Icon) {
	                ;
	                //if (lgSLBox.Icon.attr("src") !== loading_ico_path) {
	                //    lgSLBox.Icon.attr("src", loading_ico_path);
	                //    lgSLBox.Icon.attr("title", str_default_loading);
	                //}
	                if (lgSLBox.Icon.attr("style") !== "") {
	                    lgSLBox.Icon.attr("style", "");
	                    lgSLBox.Icon.attr("title", str_default_loading);
	                }
	            }
	            if (lgSLBox.Text) {
	                if (pIsDisplay !== "") {
	                    lgSLBox.Icon.attr("title", pIsDisplay);
	                    lgSLBox.Text.text(pIsDisplay);
	                    lgSLBox.Text.attr("title", pIsDisplay);
	                } else {
	                    lgSLBox.Text.text(str_default_loading);
	                    lgSLBox.Text.attr("title", str_default_loading);
	                }
	            }
	        } else {
	            if (lgSLBox.Icon) {
	                //if (lgSLBox.Icon.attr("src") !== loading_ico_path) {
	                //    lgSLBox.Icon.attr("src", loading_ico_path);
	                //    lgSLBox.Icon.attr("title", str_default_loading);
	                //}
	                if (lgSLBox.Icon.attr("style") !== "") {
	                    lgSLBox.Icon.attr("style", "");
	                    lgSLBox.Icon.attr("title", str_default_loading);
	                }
	            }
	            if (lgSLBox.Text) {
	                lgSLBox.Text.text(str_default_loading);
	                lgSLBox.Text.attr("title", str_default_loading);
	            }
	        }

	        return;

            //Popup용
		    if (window.gLoadingBox) {
		        //pIsDisplay가 undefined이면 true로 간주.
		        var frmViewLoadingBox = ASPxClientPopupControl.Cast(gLoadingBox);
		        var isVisible = frmViewLoadingBox.GetVisible();
				if (pIsDisplay !== undefined && pIsDisplay !== null && typeof pIsDisplay === 'boolean') {
					if (pIsDisplay === true) {
						frmViewLoadingBox.ShowLoading();
					} else {
					        
						frmViewLoadingBox.CloseLoading();
					}
				} else if (typeof pIsDisplay === "string") {
					if (isVisible === false) {
						frmViewLoadingBox.ShowLoading();
					}
				} else {
					if (isVisible === false) {
						frmViewLoadingBox.ShowLoading();
					}
		        }
		    }
		};

		this.DisplayTimeLoading = function (pTickCount, pCallbackF) {
		    if (window.LoadingBox) {
		        var frmViewLoadingBox = ASPxClientPopupControl.Cast(gLoadingBox);
		            
		        var isVisible = frmViewLoadingBox.GetVisible();
		        if (isVisible !== true) {
		            frmViewLoadingBox.ShowTimeLoading(pTickCount, pCallbackF);
		        }
		    }
		}
	};
})();
