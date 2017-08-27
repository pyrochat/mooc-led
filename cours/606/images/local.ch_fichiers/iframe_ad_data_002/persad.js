/*
	PersAd and Pipe (AdTech)
	Contact: Mike.Scheurer@swisscom.com, Aibek.Sarimbekov@swisscom.com
 */
(function ($) {
	'use strict';

	window.callPersAd = function (callback) {

		window.ad = '';
		var persadWrite = false,
			persadProfile = '&',
			persadType = 'lan',
			persadQuality,
			profileExists = 0,
			optOut = false,
			// constants
			PERSAD_EXPDAYS = location.hostname.match('swisscom.ch') ? 5 : 30,
			PERSAD_EXPEMPTY = location.hostname.match('swisscom.ch') ? 5/24/60 : 3, // 5min for Swisscom
			STORED_LAN = 'scadvadkey_lan',
			STORED_CELL = 'scadvadkey_cell',
			OPTOUT_DB = '&p11=y',
			OPTOUT_COOKIE = 'persad_optOut',
			EXIT_TIME = 2000,
			SWISSCOM_OR_BLUEWIN = (location.hostname.match('swisscom.ch|bluewin.ch') || ['bluewin.ch']).join(),
			COOKIE_DOMAIN = (location.hostname.match('swisscom.ch|bluewin.ch|search.ch|local.ch|staticlocal.ch') || ['bluewin.ch']).join(),
			IS_PROD = location.hostname.search(/(www[.](bluewin|swisscom))|(search|local|staticlocal)[.]ch/) >= 0,
			PERSAD_URL = 'https://www.' + (IS_PROD ? '' : 'staging.') + SWISSCOM_OR_BLUEWIN + '/persadpub/getprofile',
			PIPE_URL = 'https://pipe.swisscom.com:8443/getToken';

		function debug(message) {
			if (window.console && window.console.log && location.search.indexOf('devconsole') > 0) {
				window.console.log('callPersAd > ' + message);
			}
		}

		// cookie Functions *******************************************************

		// check if user accept cookies

		function allowCookies() {
			return navigator.cookieEnabled === true;
		}

		// check if cookie exists & lifetime

		function existsCookie(keyname) {
			if (document.cookie) {
				var tC = document.cookie.split('; ');
				for (var i = tC.length - 1; i >= 0; i -= 1) {
					var x = tC[i].split('=');
					// if cookie exists and also the searched one, function exits with true
					if (keyname === x[0]) {
						return true;
					}
				}
				// if site has a cookie but not the searched one, return false
				return false;
			}
			return false;
		}

		// get cookie-data

		function readCookie(keyname) {
			var tC = document.cookie.split('; ');
			for (var i = tC.length - 1; i >= 0; i -= 1) {
				var x = tC[i].split('=');
				if (keyname === x[0]) {
					return window.unescape(x[1]);
				}
			}
			return null;
		}

		// write cookie-data

		function writeCookie(keyname, keyvalue, lifetime) {
			keyvalue = window.escape(keyvalue);
			var todayDate = new Date();
			var expireDate = new Date();
			var nextExpDate = todayDate.getTime() + lifetime;
			expireDate.setTime(nextExpDate);
			var newCookie = keyname + '=' + keyvalue;
			if (lifetime > 0) {
				newCookie += '; expires=' + expireDate.toGMTString();
			}
			newCookie += '; path=/';
			newCookie += '; domain=' + COOKIE_DOMAIN;
			document.cookie = newCookie;
		}

		// localStorage Functions **************************************************

		// check if localstorage is allowed

		function allowLocalStorage() {
			try {
				if (window.localStorage) {
					return true;
				}
			} catch (e) {
				return false;
			}
		}

		// set item

		function writeLocalStorage(keyname, keyvalue) {
			localStorage.setItem(keyname, keyvalue);
		}

		// get item

		function readLocalStorage(keyname) {
			return localStorage.getItem(keyname);
		}

		// remove item

		function removeLocalStorageItem(keyname) {
			localStorage.removeItem(keyname);
		}

		function writeLocalStorageExpDate(keyname, lifetime) {
			var currentDate = new Date();
			currentDate.setDate(currentDate.getDate() + lifetime);
			writeLocalStorage(keyname, Date.parse(currentDate));
		}

		function isLocalStorageExpired(keyname) {
			var today = new Date(),
				expireDate = readLocalStorage(keyname);
			return today >= expireDate;
		}

		//#########################################################################

		function cookieHandling() {
			if (!allowCookies()) {
				return;
			}
			// cookies are allowed
			if (!existsCookie(STORED_CELL)) {
				persadWrite = true;
				if (existsCookie(STORED_LAN)) {
					profileExists = 1;
				}
			}
			debug('cookieHandling > persadWrite=' + persadWrite + ', profileExists=' + profileExists);
		}

		function localStorageHandling() {
			if (!allowLocalStorage()) {
				return;
			}
			// localstorage is allowed
			if (readLocalStorage(STORED_CELL + '.key') !== null) {
				if (isLocalStorageExpired(STORED_CELL + '.lifetime')) {
					//remove the stored date from key & lifetime
					removeLocalStorageItem(STORED_CELL + '.key');
					removeLocalStorageItem(STORED_CELL + '.lifetime');
					persadWrite = true;
				} else {
					persadWrite = false;
				}
			} else {
				persadWrite = true;
				if (readLocalStorage(STORED_LAN + '.key') !== null) {
					debug('localStorageHandling > ' + STORED_LAN + '.key = ' + readLocalStorage(STORED_LAN + '.key'));
					if (!isLocalStorageExpired(STORED_LAN + '.lifetime')) {
						profileExists = 1;
					} else {
						//remove the stored date from key & lifetime
						removeLocalStorageItem(STORED_LAN + '.key');
						removeLocalStorageItem(STORED_LAN + '.lifetime');
					}
				}
			}
			debug('localStorageHandling > persadWrite=' + persadWrite + ', profileExists=' + profileExists);
		}

		function returnAdvarsCookie(scadvadkey) {
			if (allowCookies()) {
				if (existsCookie(OPTOUT_COOKIE)) {
					optOut = true;
				}
				if (persadWrite) {
					if (!existsCookie(scadvadkey)) {
						var clifetime = ((persadProfile === '&') ? PERSAD_EXPEMPTY : PERSAD_EXPDAYS) * 24 * 60 * 60 * 1000;
						writeCookie(scadvadkey, persadProfile, clifetime);
					}
					var crm = readCookie(scadvadkey);
					if (crm === '&' && persadType !== 'lan' && existsCookie(STORED_LAN) && readCookie(STORED_LAN) !== '&') {
						persadQuality = 'lan';
						return readCookie(STORED_LAN);
					}
					persadQuality = scadvadkey === STORED_LAN ? 'lan' : 'cell';
					return crm;
				} else {
					if (existsCookie(STORED_CELL) && readCookie(STORED_CELL) !== '&') {
						persadQuality = 'cell';
						return readCookie(STORED_CELL);
					} else if (existsCookie(STORED_LAN) && readCookie(STORED_LAN) !== '&') {
						persadQuality = 'lan';
						return readCookie(STORED_LAN);
					}
				}
			}
		}

		function returnAdvarsLocalStorage(scadvadkey, crm) {
			if (allowLocalStorage()) {
				if (persadWrite) {
					var lslifetime = (persadProfile === '&') ? PERSAD_EXPEMPTY : PERSAD_EXPDAYS;
					if (readLocalStorage(scadvadkey + '.key') === null) {
						// set new value from persad
						writeLocalStorage(scadvadkey + '.key', persadProfile);
						writeLocalStorageExpDate(scadvadkey + '.lifetime', lslifetime);
					}
					if (crm === '' || crm === '&') {
						persadQuality = scadvadkey === STORED_LAN ? 'lan' : 'cell';
						return readLocalStorage(scadvadkey + '.key');
					}
				} else if (crm === '' || crm === '&') {
					if (readLocalStorage(STORED_CELL + '.key') !== null && !isLocalStorageExpired(STORED_CELL + '.lifetime')) {
						persadQuality = 'cell';
						return readLocalStorage(STORED_CELL + '.key');
					} else if (readLocalStorage(STORED_LAN + '.key') !== null && !isLocalStorageExpired(STORED_LAN + '.lifetime')) {
						persadQuality = 'lan';
						return readLocalStorage(STORED_LAN + '.key');
					}
				}
			}
		}

		// main function
		function returnAdvars() {
			var scadvadkey;
			if (persadType === 'lan') {
				scadvadkey = STORED_LAN;
			} else if (persadType === 'cell') {
				scadvadkey = STORED_CELL;
			}

			var crm = persadProfile,
				advarsCookie = returnAdvarsCookie(scadvadkey);

			if (advarsCookie) {
				crm = advarsCookie;
				var advarsLocalStorage = returnAdvarsLocalStorage(scadvadkey, crm);
				if (advarsLocalStorage) {
					crm = advarsLocalStorage;
				}
			}

			if (optOut && crm !== '' && crm !== '&') {
				if (crm.indexOf(OPTOUT_DB) < 0) {
					crm += OPTOUT_DB;
				}
			}
			window.ad = crm;

			if (typeof callback === 'function') {
				callback(window.ad, persadQuality);
			}
		}

		function checkResponse(json) {
			if (json && json.code) {
				var status = json.code;
				switch (status) {
					case 'ipReq':
						persadType = 'cell';
						getJsonData(PIPE_URL);
						break;
					case 'success':
						if (json.profile) {
							persadProfile = json.profile;
						}
						returnAdvars();
						break;
				}
			} else if (json && json.ipToken) {
				debug('json.ipToken = ' + json.ipToken);
				getJsonData(PERSAD_URL, {
					'quality': 'weak',
					'profileExists': profileExists,
					'ipToken': json.ipToken
				});
			} else {
				returnAdvars();
			}
		}

		function getJsonData(url, vars) {
			var timer;

			$.ajax({
				type: 'POST',
				url: url,
				async: true, // do not block other scripts
				data: vars,
				success: function (json) {
					clearTimeout(timer);
					checkResponse(json);
				},
				error: function (jqXHR, textStatus, errorThrown) {
					debug('Persad (' + url + ') is unreachable: ' + errorThrown);
					clearTimeout(timer);
					returnAdvars();
				},
				timeout: EXIT_TIME
			});

			timer = setTimeout(function () {
				debug('Timeout while waiting for ' + url);
				returnAdvars();
			}, EXIT_TIME);
		}

		cookieHandling();
		localStorageHandling();
		if (persadWrite) {
			getJsonData(PERSAD_URL, {
				'quality': 'weak',
				'profileExists': profileExists
			});
		} else {
			returnAdvars();
		}
	};
}(window.$));

/*
	PersAd and NuggAd (AdTech)
		Bluewin specific part

	Contact: Mike.Scheurer@swisscom.com, Aibek.Sarimbekov@swisscom.com
 */
(function ($) {
	'use strict';

	var persadQuality;

	function debug(message) {
		if (window.console && window.console.log && location.search.indexOf('devconsole') > 0) {
			window.console.log('Bluewin PersAd > ' + message);
		}
	}

	function initAd(adId) {
		function showAd(params) {
			window.ADTECH.config.placements[adId] = { sizeid: '', params: params };
			window.ADTECH.enqueueAd(adId);
			window.ADTECH.executeQueue();
			debug('showAd > adId=' + adId + ', params=' + window.JSON.stringify(params));
		}
		if (window.bwAdVars) {
			showAd(window.bwAdVars);
		} else {
			// wait for results from nuggAd()
			$(document).on('bwAdVars-ready', function (e, bwAdVars) {
				showAd(bwAdVars);
			});
			debug('initAd waiting for results > adId=' + adId);
		}
	}

	function transformAd(ad) {
		if (ad && ad !== '&') {
			return ',' + ad
				.replace(/prf\[/g, 'kv')
				.replace(/\]=/g, ':\'')
				.replace(/&/g, '\',')
				.toLowerCase() +
				'\'';
		}
		return '';
	}

	function transformAdVars(advars) {
		var bwAdVars = {},
			jsonString;

		if (advars && advars !== '&') {
			if (advars.substring(0, 1) !== ',') {
				advars = ',' + advars;
			}
			advars = advars.split(',kv').join(',"kv').split(':\'').join('":"').split('\'').join('"');
			try {
				jsonString = '{ "alias": "", "target": "_blank"' + advars + '}';
				bwAdVars = window.JSON.parse(jsonString);
			} catch (e) {
				debug(e + ': ' + jsonString);
			}
		}
		return bwAdVars;
	}

	// set window.opeCustomEvents which is used by tagger.js
	function setOpeCustomEvents(bwAdVars) {
		var opeCustomEvents = {};
		for (var kv in bwAdVars) {
			if (kv.search('kv') === 0) {
				opeCustomEvents[kv.substr(2)] = bwAdVars[kv];
			}
		}
		if (!$.isEmptyObject(opeCustomEvents)) {
			opeCustomEvents.type = 'p-values';
			opeCustomEvents.quality = persadQuality;
			window.opeCustomEvents = [opeCustomEvents];
		}
	}

	function transformNuggprof(nuggprof) {
		var m = '';
		if (!nuggprof) {
			return m;
		}
		for (var e = 0, l = nuggprof.length; e < l; e += 1) {
			if (nuggprof[e][1] !== '') {
				m += nuggprof[e][1];
				if (e < l - 1) {
					m += ':';
				}
			}
		}
		return m;
	}

	function setBwAdVars(ad) {
		window.advars = ad + ',kvbt:\'' + transformNuggprof(window.nuggprof) + '\'';
		debug('window.advars = ' + window.advars);

		window.bwAdVars = transformAdVars(window.advars);
		setOpeCustomEvents(window.bwAdVars);
		$(document).trigger('bwAdVars-ready', [window.bwAdVars]);
		debug('window.bwAdVars = ' + window.JSON.stringify(window.bwAdVars));
	}

	function nuggAd(ad) {
		window.NUGGAD = window.NUGGAD || {};
		window.NUGGAD.config = window.NUGGAD.config || {};
		var EXIT_TIME = 2000,
			timer,
			lang = $('html').attr('lang') || 'de',
			device = $('body').is('.mobile, .selector-mobile') ? 'mobile' : 'desktop',
			pageUrl = (window === top ? location.href : document.referrer) || '',
			nuggrid = window.NUGGAD.config.nuggrid || encodeURIComponent(pageUrl),

			// extract URL path without page-name, beginning at the language eg. '/de/.../.../'
			nuggtgRegex = new RegExp('\/' + lang + '\/.*'),
			nuggtgMatch = pageUrl.match(nuggtgRegex) || [''],
			nuggtgParts = nuggtgMatch[0].split('/'), // get URL substring beginning at the language (eg. '/de/...')
			nuggtgPath = nuggtgParts.slice(0, nuggtgParts.length - 1).join('/'), // get URL substring beginning at the language and ending at the last slash (eg. '/de/.../.../')
			nuggtg = window.NUGGAD.config.nuggtg || encodeURIComponent(nuggtgPath),

			// mandatory nugg.ad parameters
			nuggn = window.NUGGAD.config.nuggn || { 'desktop': '805450299', 'mobile': '1568092684'}[device],
			nuggsids = {
				'desktop': { 'de': '620175317', 'fr': '1572816525', 'it': '788681179'},
				'mobile': { 'de': '1884410766', 'fr': '1516825104', 'it': '1634580235'}
			},
			nuggsid = window.NUGGAD.config.nuggsid || nuggsids[device][lang] || '620175317',

			scriptUrls = {
				'desktop': '/rc?nuggn=' + nuggn + '&nuggsid=' + nuggsid + '&nuggrid=' + nuggrid + '&nuggtg=' + nuggtg,
				'mobile': '/javascripts/nuggad-ls.js'
			},
			nugghost = 'https://swisscom-s.nuggad.net',
			scriptUrl = nugghost + scriptUrls[device];

		ad = ad || '';
		debug('ad = ' + ad);
		$.getScript(scriptUrl, function () {
			clearTimeout(timer);
			/* jshint camelcase: false */
			if (window.ad_wid === undefined) {
				window.ad_wid = Math.round(Math.random() * 2000000000);
				window.ad_count = 0;
			}

			if (device === 'mobile' && window.nuggad && window.nuggad.init) {
				window.nuggad.init({'rptn-url': nugghost}, function (api) {
					api.rc({'nuggn': nuggn, 'nuggsid': nuggsid, 'nuggtg': nuggtg});
					debug('nuggad.init, nuggprof=' + window.nuggprof);
				});
			}

			if (!window.bwAdVars) {
				setBwAdVars(ad);
			}
		});

		timer = setTimeout(function () {
			debug('Timeout while waiting for ' + scriptUrl);
			setBwAdVars(ad);
		}, EXIT_TIME);
	}

	window.callPersAd(function (ad, quality) {
		persadQuality = quality;
		window.ad = transformAd(ad);
		nuggAd(window.ad);
	});

	window.persAdTransformAd = transformAd; // only for QUnit
	window.persAdTransformAdVars = transformAdVars; // only for QUnit
	window.persAdTransformNuggprof = transformNuggprof; // only for QUnit
	window.persAdNuggAd = nuggAd; // only for QUnit
	window.persAdInitAd = initAd; // used by modAd

}(window.$));

