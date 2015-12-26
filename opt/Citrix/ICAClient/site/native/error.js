function extend( objects ) {
    var extended = {};
    var merge = function (obj) {
        for (var prop in obj) {
            if (Object.prototype.hasOwnProperty.call(obj, prop)) {
                if ( Object.prototype.toString.call(obj[prop]) === '[object Object]' ) {
                    extended[prop] = extend(extended[prop], obj[prop]);
                }
                else {
                    extended[prop] = obj[prop];
                }
            }
        }
    };
    merge(arguments[0]);
    for (var i = 1; i < arguments.length; i++) {
        var obj = arguments[i];
        merge(obj);
    }
    return extended;
}

function getHashParam(param) {
    var text = window.location.hash;

    var i = text.indexOf(param);
    if (i == -1) {
        return "";
    } else {
        i += param.length;
        var j = text.indexOf('&', i);
        if (j == -1) {
            return text.substring(i);
        } else {
            return text.substring(i, j);
        }
    }
}
window.onload = function() {
    var tryagain = document.getElementById("tryagain");
    var menubtn = document.getElementById("userMenuBtn");

    tryagain.onclick = function (event) {
        if (event) {
            event.preventDefault();
        }
        do_tryagain();
    };

    menubtn.onclick = function (event) {
        if (event) {
            event.preventDefault();
        }
        do_menu();
    };

    var currentLocale;

    var locales = getHashParam("locale=").split(',');
    if ((navigator) && (navigator.language)) {
        locales.push(navigator.language);
    }
    locales.push('en');

    // Adding the new standard for simplified chinese [zh-Hans = zh-CN] and traditional chinese[zh-Hant = zh-TW]
    localizationStrings['zh-Hans'] = localizationStrings['zh-CN'];
    localizationStrings['zh-Hant'] = localizationStrings['zh-TW'];

    for (var l = 0, currentLocale = null; currentLocale == null; l++) {
        currentLocale = localizationStrings[locales[l]];
    }

    for (var item in currentLocale) {
        var el = document.getElementById(item);
        if (el) {
            var text = currentLocale[item];
            el.innerHTML = text;
        }
    }
}