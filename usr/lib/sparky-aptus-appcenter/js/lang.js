// Created by Piotr "MoroS" Mrożek 2018
// last update Dec 6, 2018 by pavroo
// get the language (transfered from Yad command-line user-agent parameter)
var language = window.navigator.userAgent;
// create the dictionary object
var dict = {};
dict.entries = {};
dict.print = function(dictName, entryName) {
    // get the specified dictionary entry or fall back to an "unknown" string: "(???)" when not found
    var entry = typeof(dict.entries[dictName]) !== 'undefined' && typeof(dict.entries[dictName][entryName]) !== 'undefined' ? dict.entries[dictName][entryName] : '(???)';
    document.write(entry);
};

// load dictionaries
// example
//document.write('<script src="./lang/apps/' + language + '.js" type="text/javascript"></script>');
// menu
document.write('<script src="./lang/menu/' + language + '.js" type="text/javascript"></script>');
// main pages
document.write('<script src="./lang/categories/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/info/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/internet/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/multimedia/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/office/' + language + '.js" type="text/javascript"></script>');
// network sub-categories
document.write('<script src="./lang/netemail/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/netothers/' + language + '.js" type="text/javascript"></script>');
document.write('<script src="./lang/netwebbrowsers/' + language + '.js" type="text/javascript"></script>');
