/// <reference path="../_references.js" />

(function () {
    if (window.eni) {
        eni.Loading = new function () {
            this.DisplayLoadingAll = function (pIsDisplay, pMsg) {
                if (eni.getParentFramework()) {
                    eni.getParentFramework().Loading.DisplayLoadingAll(pIsDisplay, pMsg);
                } else {

                }
            };
            this.DisplayLoading = function (pIsDisplay, pMsg) {
                if (eni.getParentFramework()) {
                    eni.getParentFramework().Loading.DisplayLoading(pIsDisplay, pMsg);
                } else {

                }
            };
            this.IsDisplayLoading = function () {
                if (eni.getParentFramework()) {
                    return eni.getParentFramework().Loading.IsDisplayLoading();
                } else {

                }
            };
            
		    this.DisplayStatusLoading = function (pIsDisplay, pMsg) {

		        if (eni.getParentFramework()) {
		            eni.getParentFramework().Loading.DisplayStatusLoading(pIsDisplay, pMsg);
		        } else {

		        }
			};
		    this.DisplayTimeLoading = function (pMsg, pTickCount, pCallbackF) {
			    if (eni.getParentFramework()) {
			        eni.getParentFramework().Loading.DisplayTimeLoading(pMsg, pTickCount, pCallbackF);
			    } else {

			    }
			}
		};
	}
})();

