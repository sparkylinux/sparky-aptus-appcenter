// Created by Piotr "MoroS" Mrożek 2018
// last update Dec 17, 2018 by pavroo
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
// main menu
document.write('<script src="./lang/main/' + language + '.js" type="text/javascript"></script>');
// graphics category
document.write('<script src="./lang/graphics/' + language + '.js" type="text/javascript"></script>');
// desktop category
document.write('<script src="./lang/desktop/' + language + '.js" type="text/javascript"></script>');
// multimedia category
document.write('<script src="./lang/media/' + language + '.js" type="text/javascript"></script>');
// web category
document.write('<script src="./lang/web/' + language + '.js" type="text/javascript"></script>');
