// Pages deleted from this site that Google still has indexed.
// 301 to a new home where one exists; 410 Gone tells Google to drop the URL fast.
//
// Most redirects come from collapsing duplicate person profiles that
// previously existed under multiple investigation plugins (UAPs / Energy /
// Physics). The primary now lives at /uaps/Details/{Name}/, so we redirect
// the secondary URLs in /energy/Details/ and /physics/Details/ to the UAPs
// canonical via name lookup against compact Set objects.

var ENERGY_TO_UAPS = {
    'Aaron_Salter_Jr': 1,
    'Adam_Rasheed': 1,
    'Al_Wordsworth': 1,
    'Alistair_Beckham': 1,
    'Amy_Eskridge': 1,
    'Andrew_Hall': 1,
    'Andrew_Kazolnikov': 1,
    'Andrija_Puharich': 1,
    'Anthony_Godley': 1,
    'Arie_DeGeus': 1,
    'Bill_Williams': 1,
    'Bill_Yelon': 1,
    'Boyd_Bushman': 1,
    'Bruce_DePalma': 1,
    'Carl_Grillmair': 1,
    'Charles_Nelson_Pogue': 1,
    'Chris_Tinsley': 1,
    'Dallis_Hardwick': 1,
    'David_Greenhalgh': 1,
    'David_Sands': 1,
    'David_Skeels': 1,
    'Dean_Warwick': 1,
    'Dimitri_Petronov': 1,
    'Eric_Wang': 1,
    'Eugene_Mallove': 1,
    'Floyd_Sweet': 1,
    'Frank_Edwards': 1,
    'Frank_Jennings': 1,
    'Frank_Richardson': 1,
    'Frank_Roberts': 1,
    'Fred_Bell': 1,
    'Frederick_Hochstetter': 1,
    'Gary_McKinnon': 1,
    'George_Kountis': 1,
    'Gerald_Schaflander': 1,
    'Gianni_A_Dotto': 1,
    'Jacob_Prichard': 1,
    'Jaime_Gustitus': 1,
    'Jaymee_Prichard': 1,
    'John_Andrews': 1,
    'John_Bedini': 1,
    'John_Brittan': 1,
    'John_Christie': 1,
    'John_Kanzius': 1,
    'John_Rossi': 1,
    'John_Searl': 1,
    'Jonathan_Walsh': 1,
    'Joseph_Westley_Newman': 1,
    'Keith_Bowden': 1,
    'Ken_Rasmussen': 1,
    'Lester_Hendershot': 1,
    'Lou_Britz': 1,
    'Mark_McCandlish': 1,
    'Mark_Tomion': 1,
    'Mark_Wisner': 1,
    'Melissa_Casias': 1,
    'Michael_Baker': 1,
    'Monica_Jacinto_Reza': 1,
    'Morris_Jessup': 1,
    'Nikola_Tesla': 1,
    'Ning_Li': 1,
    'Nuno_Loureiro': 1,
    'Paul_Bennewitz': 1,
    'Paul_Brown': 1,
    'Paul_Pantone': 1,
    'Paul_Vigay': 1,
    'Paulo_Correa': 1,
    'Peter_Ferry': 1,
    'Peter_Peapell': 1,
    'Phil_Schneider': 1,
    'Philo_Farnsworth': 1,
    'Richard_Pugh': 1,
    'Robert_Bass': 1,
    'Roger_Hill': 1,
    'Rory_Johnson': 1,
    'Rudolf_Diesel': 1,
    'Russell_Smith': 1,
    'Shani_Warren': 1,
    'Stan_Gleeson': 1,
    'Stanley_Meyer': 1,
    'Stefan_Marinov': 1,
    'Stuart_Gooding': 1,
    'Thomas_Bearden': 1,
    'Thomas_Henry_Moray': 1,
    'Thomas_Townsend_Brown': 1,
    'Tom_Ogle': 1,
    'Trevor_Constable': 1,
    'Trevor_Knight': 1,
    'Troy_Reed': 1,
    'Victor_Moore': 1,
    'Viktor_Schauberger': 1,
    'Vimal_Dajibhai': 1,
    'Wilbert_Smith': 1,
    'Wilhelm_Reich': 1
};
var PHYSICS_TO_UAPS = {
    'Amy_Eskridge': 1,
    'Anthony_Chavez': 1,
    'Arie_DeGeus': 1,
    'Bob_Lazar': 1,
    'Boyd_Bushman': 1,
    'Bruce_DePalma': 1,
    'Carl_Grillmair': 1,
    'Danny_Casolaro': 1,
    'David_Grusch': 1,
    'Dean_Warwick': 1,
    'Don_Elkins': 1,
    'Dorothy_Kilgallen': 1,
    'Edward_Ruppelt': 1,
    'Eugene_Mallove': 1,
    'Floyd_Sweet': 1,
    'Frank_Edwards': 1,
    'Frank_Maiwald': 1,
    'Fred_Bell': 1,
    'Gary_McKinnon': 1,
    'Harald_Malmgren': 1,
    'J_Allen_Hynek': 1,
    'James_Forrestal': 1,
    'James_McDonald': 1,
    'Jason_Thomas': 1,
    'Jim_Keith': 1,
    'John_Bedini': 1,
    'John_Mack': 1,
    'John_Murphy': 1,
    'Karl_Wolfe': 1,
    'Karla_Turner': 1,
    'Mark_McCandlish': 1,
    'Max_Spiers': 1,
    'Melissa_Casias': 1,
    'Michael_David_Hicks': 1,
    'Monica_Jacinto_Reza': 1,
    'Morris_Jessup': 1,
    'Nikola_Tesla': 1,
    'Ning_Li': 1,
    'Nuno_Loureiro': 1,
    'Paul_Bennewitz': 1,
    'Paul_Brown': 1,
    'Phil_Schneider': 1,
    'Philip_Corso': 1,
    'Ron_Johnson': 1,
    'Ron_Rummel': 1,
    'Rory_Johnson': 1,
    'Ryan_Graves': 1,
    'Stanley_Meyer': 1,
    'Stanton_Friedman': 1,
    'Stefan_Marinov': 1,
    'Thomas_Mantell': 1,
    'Thomas_Townsend_Brown': 1,
    'Todd_Sees': 1,
    'Viktor_Schauberger': 1,
    'Wilbert_Smith': 1,
    'William_McCasland': 1
};

// One-off redirects that don't fit the pattern above.
var REDIRECTS_301 = {
    '/uaps/Details/Frank_Olson/': 'https://intelligencemurders.com/intelligence-service-murders/Details/Frank_Olson/'
};

// Permanently-removed pages: 410 Gone tells Google to drop them fast.
var GONE_410 = {
    '/uaps/Details/William_Cooper/': true,
    '/physics/Details/William_Cooper/': true
};

function handler(event) {
    var request = event.request;
    var host = request.headers.host && request.headers.host.value;
    var uri = request.uri;

    var qs = '';
    if (request.querystring) {
        var parts = [];
        for (var key in request.querystring) {
            var v = request.querystring[key];
            if (v.value !== undefined) {
                parts.push(key + '=' + v.value);
            } else {
                parts.push(key);
            }
        }
        if (parts.length > 0) qs = '?' + parts.join('&');
    }

    var lastSeg = uri.substring(uri.lastIndexOf('/') + 1);
    var needsTrailingSlash = uri !== '/' && uri.charAt(uri.length - 1) !== '/' && lastSeg.indexOf('.') === -1;
    var canonicalUri = needsTrailingSlash ? uri + '/' : uri;

    if (host === 'www.uapmurders.com') {
        return {
            statusCode: 301,
            statusDescription: 'Moved Permanently',
            headers: {
                'location': { value: 'https://uapmurders.com' + canonicalUri + qs },
                'cache-control': { value: 'max-age=3600' }
            }
        };
    }

    // Pattern-based dedupe redirects.
    var energyMatch = canonicalUri.match(/^\/energy\/Details\/([^\/]+)\/$/);
    if (energyMatch && ENERGY_TO_UAPS[energyMatch[1]]) {
        return {
            statusCode: 301,
            statusDescription: 'Moved Permanently',
            headers: {
                'location': { value: 'https://uapmurders.com/uaps/Details/' + energyMatch[1] + '/' },
                'cache-control': { value: 'max-age=86400' }
            }
        };
    }
    var physicsMatch = canonicalUri.match(/^\/physics\/Details\/([^\/]+)\/$/);
    if (physicsMatch && PHYSICS_TO_UAPS[physicsMatch[1]]) {
        return {
            statusCode: 301,
            statusDescription: 'Moved Permanently',
            headers: {
                'location': { value: 'https://uapmurders.com/uaps/Details/' + physicsMatch[1] + '/' },
                'cache-control': { value: 'max-age=86400' }
            }
        };
    }

    if (REDIRECTS_301[canonicalUri]) {
        return {
            statusCode: 301,
            statusDescription: 'Moved Permanently',
            headers: {
                'location': { value: REDIRECTS_301[canonicalUri] },
                'cache-control': { value: 'max-age=86400' }
            }
        };
    }

    if (GONE_410[canonicalUri]) {
        return {
            statusCode: 410,
            statusDescription: 'Gone',
            headers: {
                'content-type': { value: 'text/html; charset=utf-8' },
                'cache-control': { value: 'max-age=86400' }
            },
            body: '<!doctype html><title>410 Gone</title><h1>Gone</h1><p>This page has been permanently removed.</p>'
        };
    }

    if (needsTrailingSlash) {
        return {
            statusCode: 301,
            statusDescription: 'Moved Permanently',
            headers: {
                'location': { value: uri + '/' + qs },
                'cache-control': { value: 'max-age=3600' }
            }
        };
    }

    return request;
}
