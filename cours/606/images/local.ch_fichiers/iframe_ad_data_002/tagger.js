
;(function(){

    var urlParam = "url=" + encodeURIComponent(window.location.href);
    var refParam = "ref=" + encodeURIComponent(document.referrer);
    var tzParam = "tz=" + encodeURIComponent(new Date().getTimezoneOffset() / 60);
    var screenParam = "&screen=" + encodeURIComponent(screen.width + "x" + screen.height + "x" + screen.colorDepth);

	var topreferrer;
	try {
		topreferrer = window.top.document.referrer;
	} catch (e) {
		topreferrer = "NA";
	}
	var topRefParam = "tref=" + encodeURIComponent(topreferrer);
	var params = "?" + urlParam + "&" + refParam + "&" + tzParam + "&" + screenParam + "&" + topRefParam;


	(new Image()).src = "https://tr1.admeira.ch/tr1.admeira.ch/v1/image.gif" + params;

	if (typeof opeCustomEvents !== "undefined") {
		for (var i = 0; i < opeCustomEvents.length; i++) {
			var event = opeCustomEvents[i];
			var customParams = "?" + urlParam + "&" + refParam + "&" + topRefParam;
			for (var key in event) {
				if (event.hasOwnProperty(key)) {
					customParams += "&";
					customParams += encodeURIComponent(key);
					customParams += "=";
					customParams += encodeURIComponent(event[key]);
				}
			}
			(new Image()).src = "https://tr1.admeira.ch/tr1.admeira.ch/v1/custom" + customParams;
		}
	}
	
	

	
})();