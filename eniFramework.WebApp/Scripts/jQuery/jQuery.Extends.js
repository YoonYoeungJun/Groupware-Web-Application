jQuery.fn.center = function () {
    $(this).css("position", "absolute");
    $(this).css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) +
                                                $(window).scrollTop()) + "px");
    $(this).css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
                                                $(window).scrollLeft()) + "px");
    return this;
};

$.fn.extend({
    disableSelection: function () {
        this.each(function () {
            if (typeof this.onselectstart != 'undefined') {
                this.onselectstart = function () { return false; };
            } else if (typeof this.style.MozUserSelect != 'undefined') {
                this.style.MozUserSelect = 'none';
            } else {
                this.onmousedown = function () { return false; };
            }
        });
    }
});



//if (!window.attachEvent) {
//    window.attachEvent = window.addEventListener;
//}

//if (!window.detachEvent) {
//    window.detachEvent = window.removeEventListener;
//}
