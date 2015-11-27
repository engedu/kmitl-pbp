function getCursorPos(textElement) {
    var str_oldText = textElement.value;
    var objRange = document.selection.createRange();
    var str_oldRange = objRange.text;
    var oldMaxLength = textElement.maxLength;
    textElement.maxLength = textElement.maxLength + 3;
    var sWeirdString = '#%~';
    objRange.text = str_oldRange + sWeirdString;
    objRange.moveStart('character', (0 - str_oldRange.length - sWeirdString.length));
    var sNewText = textElement.value;
    objRange.text = str_oldRange;
    for (i = 0; i <= sNewText.length; i++) {
        var sTemp = sNewText.substring(i, i + sWeirdString.length);
        if (sTemp == sWeirdString) {
            var cursorPos = (i - str_oldRange.length);
            textElement.maxLength = oldMaxLength;
            return cursorPos;
        }
    }
    textElement.maxLength = oldMaxLength;
}

function isAcceptedNumericFormat(strNum, decimal_len, fraction_len, enableNegative) {

    var currency_Pattern1 = "";
    //var decimal_len_group = Math.round(decimal_len / 3);
    var decimal_len_group = Math.floor(decimal_len / 3);
    //alert(decimal_len_group);
    if(decimal_len_group > 0) pun = "{0," + eval(decimal_len_group - 1) + "}";
    var strNumber = "([1-9][0-9]{0,2})((([,][0-9]{0,3}){0," + eval(decimal_len_group - 1) + "})?)";
    if(decimal_len_group == 0) strNumber = "([1-9][0-9]{0," + eval(decimal_len - 1) + "})?";
    var strNumberNoComma = "([1-9][0-9]{0," + eval(decimal_len - 1) + "})?";
    var strDecimal = "(([.][0-9]{0," + eval(fraction_len) + "})?)";
    var strSign = "";
    if (enableNegative == true) {
        strSign = "([-]{0,1})";
    }

    if (fraction_len > 0) {
        currency_Pattern1 = "^((" + strSign + ")((" + strNumber + ")|(" + strNumberNoComma + "))|([0]))((" + strDecimal + "))$";
    } else {
        currency_Pattern1 = "^((" + strSign + ")((" + strNumber + ")|(" + strNumberNoComma + "))|([0]))$";
    }
	
    var currency_Pattern = new RegExp(currency_Pattern1);
    return currency_Pattern.test(strNum);
	
}

// ---------------------------------------------
// must define maxlength in input tag
// ---------------------------------------------
function numeric_onkeypress(decimal_len, fraction_len, enableNegative) {
    var isEnableNegative = false;
    if (arguments.length >= 3) {
        isEnableNegative = enableNegative;
    }
    var allow_key_Pattern;
    if (isEnableNegative) {
        allow_key_Pattern = /[-0-9\.\,]/i;
    } else {
        allow_key_Pattern = /[0-9\.\,]/i;
    }
    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);
    var src = window.document.getElementById(e.srcElement.name);
    var str = new String(src.value);
	
    if (!(allow_key_Pattern.test(character))) {
    	event.returnValue = false;		// Modify by Amp
        return false;
    }

    var r = src.createTextRange();
    src.focus();
    var curPost = getCursorPos(src);
    if (curPost == 0 && r.text == '') {
        src.text = '';
        return true;
    }

    if (curPost < str.length - 1 && !(curPost == str.length && character == '0')) {
        str = str.substring(0, getCursorPos(src)) + character + str.substring(getCursorPos(src));
    } else {
        str = str + character;
    }
	
    if (allow_key_Pattern.test(character)) {
        if (str == '' || isAcceptedNumericFormat(str, decimal_len, fraction_len, isEnableNegative)) {
            if (character == ',') {
                if (
                        ( str.substring(0, str.length - 1).indexOf(",", 0) > 0 && str.charAt(str.length - 2) == ',')
                                ||
                        ( str.substring(0, str.length - 1).indexOf(",", 0) > 0 && (str.lastIndexOf(",", str.length - 1) - str.lastIndexOf(",", str.length - 2)) != 4 )
                        ) {
                    return false;
                } else {
                    return true;
                }
            } else if (character == '.') {
                if (
                        (str.substring(0, str.length - 1).indexOf(",", 0) > 0 && (str.lastIndexOf(".", str.length - 1) - str.lastIndexOf(",", str.length - 2)) != 4 )
                        ) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return true;
            }
        } else {
        	event.returnValue = false;		// Modify by Amp
            return false;
        }
    } else {
        return false;
    }
}

function numeric_onfocus(str){
	if(trim(str.value) != ''){
		str.value = getUnFormatNumberBy3(str.value);
	}
}


function numeric_onblur(decimal_len, fraction_len, enableNegative, fillFraction, zeroAllow) {
    var isEnableNegative = false;

    if (arguments.length > 2) {
        isEnableNegative = enableNegative;
    }
    var isFillFraction = false;
    if (arguments.length > 3) {
        isFillFraction = fillFraction;
    }
    if (arguments.length < 5) {
        zeroAllow = false;
    }

    var currency_Pattern1 = "";
    try {
        if (!e) var e = window.event;
        var src = window.document.getElementById(e.srcElement.name);
        var str = new String(src.value);
        if (str != "")
        {
            if (isAcceptedNumericFormat(str, decimal_len, fraction_len, isEnableNegative)) {
                src.value = getFormatNumberBy3(str, ".", ",", isFillFraction, fraction_len, zeroAllow);
                window.status = "";
                return true;
            } else {
                if (src.value != "") {
                    window.status = "Wrong Format";
                }
                src.value = "";
                return false;
            }
        }
    } catch(e) {
        return false;
    }
}


function numberOnly_onkeyup(item) {
    return true;
}

function moneyAmt_onkeypress() {
    var allow_key_Pattern = /[0-9\.\,]/i;

    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);

    if (allow_key_Pattern.test(character)) {
        return true;
    } else {
        return false;
    }
}

function numberOnly_onkeypress() {
    var allow_key_Pattern = /[0-9]/i;

    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);

    if (allow_key_Pattern.test(character)) {
        return true;
    } else {
        return false;
    }
}
 
function isNumberKey(evt)
{
	
   var charCode = (evt.which) ? evt.which : event.keyCode;
   
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}

function getUnFormatNumberBy3(num) {
    var z = num.replace(/(\,)/g, "");
    return z;
}
function getFormatNumberBy3(num, decpoint, sep, isFillFraction, fraction_len, zeroAllow) {
    // check for missing parameters and use defaults if so
    if (arguments.length < 2) {
        sep = ",";
        decpoint = ".";
    }
    if (arguments.length < 3) {
        sep = ",";
    }
    if (arguments.length < 4) {
        isFillFraction = false;
    }
    if (arguments.length < 5) {
        fraction_len = 0;
    }
    if (arguments.length < 6) {
        zeroAllow = false;
    }


    // need a string for operations
    num = num.toString();
    if (num.indexOf(".") < 0) {
        num = num + decpoint;
    }

    // separate the whole number and the fraction if possible
    var a = num.split(decpoint);
    // decimal
    var x = a[0];
    // fraction
    var y = a[1];
    if (isFillFraction) {
        var padLen = 0;
        if (y != null) {
            padLen = fraction_len - y.length;
        }
        for (var j = 0; j < padLen; j++) {
            y = y + '0';
        }
    }


    var rexNumeric = /[0-9]/i;
    var strSign = "";
    if (x.length > 0) {
        strSign = x.substring(0, 1);
        if (!rexNumeric.test(strSign)) {
            x = x.substring(1, x.length);
        } else {
            strSign = "";
        }
    }

    var z = "";
    var result = "";

    if (typeof(x) != "undefined") {
        for (i = x.length - 1; i >= 0; i--)
            z += x.charAt(i) != sep?x.charAt(i):'';

        z = z.replace(/(\d{3})/g, "$1" + sep);
        if (z.slice(-sep.length) == sep)
            z = z.slice(0, -sep.length);
        result = "";
        for (i = z.length - 1; i >= 0; i--)
            result += z.charAt(i);
        if (typeof(y) != "undefined" && y.length > 0) {
            result = result + decpoint + y;
        }
    }
    if (result.charAt(0) == '.') {
        result = '0' + result;
    }
    if (eval(getUnFormatNumberBy3(result) * 1) == 0) {
        if (!zeroAllow) {
            result = '';
        }
    }
    result = strSign + result;
    return result;
}
function getValueOfFormatNumberBy3(num) {
    var result = "";
    if (typeof(num) != 'undefined' && num.length > 0) {
        num = num.toString();
        result = num.replace(/(\,)/g, "");
    }
    return result;
}

function transactionNo_onkeypress() {
    var transactionNo_Pattern = /[0-9]/i;
    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var src = e.srcElement;
    src.onblur = transactionNo_onblur;
    var character = String.fromCharCode(code);
    if (transactionNo_Pattern.test(character)) {
        return true;
    } else {
        return false;
    }
}

function transactionNo_onblur() {
    var transactionNo_Pattern = /^([0-9]*)$/i;
    if (!e) var e = window.event;
    var src = e.srcElement;
    var str = src.value;
    if (str == '')return true;
    if (transactionNo_Pattern.test(str)) {
        window.status = "";
        return true;
    } else {
        if (src.value != "") {
            window.status = "Wrong Format";
        }
        src.value = "";
        return false;
    }
}


function checkIdentification(id) {
    var regExpObj = /^\d{1}\-\d{1,4}\-\d{1,5}\-\d{1,2}\-\d{1}$/;
    if (regExpObj.test(id) == false) return false;


    id = id.replace(/-/g,"");

    if (id.length!=13) return false;

    if( id.charAt(0) < 1 || id.charAt(0) > 8 ) return false;
   

    for(i=0,sum=0;i<12;i++)
        sum += parseInt(id.charAt(i))*(13-i);
    sum = sum%11;
    if(sum <= 1)
        sum = 1-sum;
    else
        sum = 11-sum;
    return (sum == parseInt(id.charAt(12)));
}


function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
