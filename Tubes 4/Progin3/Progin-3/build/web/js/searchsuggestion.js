
/**
 * Provides search suggestions.
 * @class
 * @scope public
 */
function SearchSuggestions() {
}

/**
 * Request suggestions for the given autosuggest control. 
 * @scope protected
 * @param oAutoSuggestControl The autosuggest control to provide suggestions for.
 */
SearchSuggestions.prototype.requestSuggestions = function(oAutoSuggestControl /*:AutoSuggestControl*/,
        bTypeAhead /*:boolean*/) {
    var aSuggestions = [];
    var sTextboxValue = oAutoSuggestControl.textbox.value;


    var xmlhttp;
   
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            aSuggestions = xmlhttp.responseText.split(";");
            oAutoSuggestControl.autosuggest(aSuggestions, bTypeAhead);
        }
    }
    xmlhttp.open("GET", "getsuggestion.jsp?q=" + sTextboxValue, true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send();
    };
//provide suggestions to the control
//aSuggestions = xmlhttp.responseText.split(";");
//console.log(aSuggestions);


/**
 * Provides nama assignee suggestions.
 * @class
 * @scope public
 */
function AssigneeSuggestions() {
}

/**
 * Request suggestions for the given autosuggest control. 
 * @scope protected
 * @param oAutoSuggestControl The autosuggest control to provide suggestions for.
 */
AssigneeSuggestions.prototype.requestSuggestions = function(oAutoSuggestControl /*:AutoSuggestControl*/,
        bTypeAhead /*:boolean*/) {
    var aSuggestions = [];
    var sTextboxValue = oAutoSuggestControl.textbox.value;


    var xmlhttp;
   
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            aSuggestions = xmlhttp.responseText.split(";");
            oAutoSuggestControl.autosuggest(aSuggestions, bTypeAhead);
        }
    }
    xmlhttp.open("GET", "getAssigneesuggestion.jsp?q=" + sTextboxValue, true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send();
    
//provide suggestions to the control
//aSuggestions = xmlhttp.responseText.split(";");
//console.log(aSuggestions);
};