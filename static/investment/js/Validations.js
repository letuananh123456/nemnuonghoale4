$(document).ready(function () {
    $('.panValidate').keypress(function (e) {
        var keycode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (keycode == 35 || keycode == 36 || keycode == 37 || keycode == 9 || keycode == 8) {
            return true;
        }
        else {
            var ctrl = $(this)[0];
            if ((keycode > 64 && keycode < 91) || (keycode > 95 && keycode < 123) || (keycode >= 48 && keycode <= 57)) {
                var startPos = ctrl.selectionStart;
                var endPos = ctrl.selectionEnd;
                startPos = endPos;
                var proceed = false;
                var charCode = (e.charCode) ? e.charCode : e.keyCode;
                var keyCall = keycode;
                switch (startPos) {
                    case 0:
                    case 1:
                    case 2:
                    case 4:
                    case 9:
                        if (keycode >= 96 && keycode <= 122) {
                            //proceed = false; // 
                            keycode = keycode - 32;
                        }
                        if (keycode > 64 && keycode < 91) {
                            keyCall = keycode;
                            proceed = true;
                        }
                        break;
                    case 3:
                        if (keycode == 112 || keycode == 80)
                            proceed = true;
                        break;
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                        //                        if (keycode >= 96 && keycode <= 105) {
                        //                            keycode = keycode - 48;
                        //                        }
                        if (keycode >= 48 && keycode <= 57) {
                            keyCall = keycode;
                            proceed = true;
                        }
                        break;
                }
                if (proceed) {
                    var value = '';
                    var txtvalue = ctrl.value.trim();
                    if (txtvalue.length <= ctrl.maxLength) {
                        if (startPos == txtvalue.length) {
                            if (startPos == ctrl.maxLength) {
                                for (var i = 0; i < txtvalue.length - 1; i++) {
                                    value = value + txtvalue[i];
                                }
                                value = value + String.fromCharCode(keyCall);;
                            }
                            else
                                value = txtvalue + String.fromCharCode(keyCall);
                        }
                        else {
                            txtvalue = txtvalue.split('');
                            if (txtvalue.length < ctrl.maxLength) {
                                for (var i = 0; i < txtvalue.length; i++) {
                                    if (startPos == endPos && i == startPos) {
                                        value = value + String.fromCharCode(keyCall);
                                    }
                                    value = value + txtvalue[i];
                                }
                            }
                            else {
                                for (var i = 0; i < txtvalue.length; i++) {
                                    if (startPos == endPos && i == startPos) {
                                        value = value + String.fromCharCode(keyCall);
                                    }
                                    else {
                                        if (i >= startPos && i <= endPos) {
                                            if (i == startPos)
                                                value = value + String.fromCharCode(keyCall);
                                        }
                                        else {
                                            value = value + txtvalue[i];
                                        }
                                    }
                                }
                            }
                        }
                        if (value != ' ') {
                            ctrl.value = value.trim().toUpperCase();
                        }
                    }
                    return false;
                }
                else {
                    return false;
                }
            }
            else
                return false;
        }
    });

    $('.panValidate').keyup(function () {
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            var keycode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
            if (keycode == 35 || keycode == 36 || keycode == 37 || keycode == 9 || keycode == 8) {
                return true;
            }
            else {
                var ctrl = $(this)[0];
                if ((keycode > 64 && keycode < 91) || (keycode > 95 && keycode < 123) || (keycode >= 48 && keycode <= 57)) {
                    var startPos = ctrl.selectionStart;
                    var endPos = ctrl.selectionEnd;
                    startPos = endPos;
                    var proceed = false;
                    var charCode = (e.charCode) ? e.charCode : e.keyCode;
                    var keyCall = keycode;
                    switch (startPos) {
                        case 0:
                        case 1:
                        case 2:
                        case 4:
                        case 9:
                            if (keycode >= 96 && keycode <= 122) {
                                //proceed = false; // 
                                keycode = keycode - 32;
                            }
                            if (keycode > 64 && keycode < 91) {
                                keyCall = keycode;
                                proceed = true;
                            }
                            break;
                        case 3:
                            if (keycode == 112 || keycode == 80)
                                proceed = true;
                            break;
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                            //                        if (keycode >= 96 && keycode <= 105) {
                            //                            keycode = keycode - 48;
                            //                        }
                            if (keycode >= 48 && keycode <= 57) {
                                keyCall = keycode;
                                proceed = true;
                            }
                            break;
                    }
                    if (proceed) {
                        var value = '';
                        var txtvalue = ctrl.value.trim();
                        if (txtvalue.length <= ctrl.maxLength) {
                            if (startPos == txtvalue.length) {
                                if (startPos == ctrl.maxLength) {
                                    for (var i = 0; i < txtvalue.length - 1; i++) {
                                        value = value + txtvalue[i];
                                    }
                                    value = value + String.fromCharCode(keyCall);;
                                }
                                else
                                    value = txtvalue + String.fromCharCode(keyCall);
                            }
                            else {
                                txtvalue = txtvalue.split('');
                                if (txtvalue.length < ctrl.maxLength) {
                                    for (var i = 0; i < txtvalue.length; i++) {
                                        if (startPos == endPos && i == startPos) {
                                            value = value + String.fromCharCode(keyCall);
                                        }
                                        value = value + txtvalue[i];
                                    }
                                }
                                else {
                                    for (var i = 0; i < txtvalue.length; i++) {
                                        if (startPos == endPos && i == startPos) {
                                            value = value + String.fromCharCode(keyCall);
                                        }
                                        else {
                                            if (i >= startPos && i <= endPos) {
                                                if (i == startPos)
                                                    value = value + String.fromCharCode(keyCall);
                                            }
                                            else {
                                                value = value + txtvalue[i];
                                            }
                                        }
                                    }
                                }
                            }
                            if (value != ' ') {
                                ctrl.value = value.trim().toUpperCase();
                            }
                        }
                        return false;
                    }
                    else {
                        return false;
                    }
                }
                else
                    return false;
            }
            this.value = this.value.toUpperCase();
        }
    });

    $("input[type=text]").bind("cut copy paste drag drop", function (e) {
        e.preventDefault();
        return false;
    });

    $("input[type=text]").attr("autocomplete", "off");

    $('.required').blur(function () {
        if (this.value !== "") {
            $(this).removeClass("errorMsg");
            $(this).next().css('display', 'none');
        }
        else {
            $(this).addClass("errorMsg");
            $(this).next().css('display', 'block');
        }
    });

    $('.requiredWithValidValue').keydown(function () {
        $(this).addClass("valueInvalid");
        // $(this).next().css('display', 'block');
    });

    $('.requiredWithValidValue').blur(function () {
        if (this.value == "") {
            $(this).addClass("errorMsg");
            $(this).next().css('display', 'block');
        }
    });

    $(".numeric").blur(function () {
        if (this.value !== null && this.value !== "") {
            if (this.value.charAt(0) === 0) {
                $(this).addClass("errorMsg");
                $(this).next().css('display', 'block');
            }
            else {
                $(this).removeClass("errorMsg");
                $(this).next().css('display', 'none');
            }
        }
    });

    $('.numeric').keypress(function (e) {
        var keycode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((keycode == 8 || keycode == 9) || (keycode >= 48 && keycode <= 57));
    });

    $('.numeric').keyup(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (k == 229 || k == 0) {
            var ke = this.value.slice(-1);
            var k = ke.charCodeAt(0);
            if ((k == 8 || k == 9) || (k >= 48 && k <= 57)) {
                return true;
            }
            else {
                e.preventDefault();
                var Fieldvalue = this.value;
                this.value = Fieldvalue.substr(0, Fieldvalue.indexOf(this.value.slice(-1)));
                return false;
            }
        }

    });

    $('.numeric').keydown(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (k == 229 || k == 0) {
            var ke = this.value.slice(-1);
            var k = ke.charCodeAt(0);
            if ((k == 8 || k == 9) || (k >= 48 && k <= 57)) {
                return true;
            }
            else {
                e.preventDefault();
                var Fieldvalue = this.value;
                this.value = Fieldvalue.substr(0, Fieldvalue.indexOf(this.value.slice(-1)));
                return false;
            }
        }

    });

    $('.numericLifeStyle').keypress(function (e) {
        var keycode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((keycode == 8 || keycode == 9) || (keycode >= 48 && keycode <= 57));
    });

    $(".onlyalphabets").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8);
    });

    $(".alphanumeric").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || (k >= 48 && k <= 57));
    });

    $(".alphanumericwithspace").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || (k >= 48 && k <= 57) || k == 32 || k == 44 || k == 46);
    });

    $(".onlyalphabetswithspace").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 32);
    });

    $(".onlyalphabetswithcomma").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 44 || k == 32);
    });

    $(".onlyalphabetswithspacedot").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 32 || k == 46);
    });

    $(".onlyalphabetswithspacedot").keyup(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (k == 229 || k == 0) {
            var ke = this.value.slice(-1);
            var k = ke.charCodeAt(0);
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 32 || k == 46) {
                return true;
            }
            else {
                e.preventDefault();
                var Fieldvalue = this.value;
                this.value = Fieldvalue.substr(0, Fieldvalue.indexOf(this.value.slice(-1)));
                return false;
            }
        }
    });

    $(".onlyalphabetswithspacedot").keydown(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (k == 229 || k == 0) {
            var ke = this.value.slice(-1);
            var k = ke.charCodeAt(0);
            if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 32 || k == 46) {
                return true;
            }
            else {
                e.preventDefault();
                var Fieldvalue = this.value;
                this.value = Fieldvalue.substr(0, Fieldvalue.indexOf(this.value.slice(-1)));
                return false;
            }
        }
    });

    $(".onlyalphabetswithspaceAndWithSpecialCharacters").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 32 || k == 64 || k == 35 || k == 36 || k == 38 || k == 42 || k == 40 || k == 41 || k == 45 || k == 95 || k == 39 || k == 34 || k == 46 || k == 44 || k == 63 || (k >= 48 && k <= 57));
    });

    $(".RemoveContinueMultipleSpaces").keyup(function () {
        while (this.value.indexOf("  ") != -1) {
            this.value = this.value.replace("  ", " ");
        }
        if (this.value.charAt(0) == " ") {
            this.value = this.value.trim();
        }
    });

    $(".AddSpaceAfterCommaAndDot").keyup(function (e) {
        if (this.value.charAt(0) == "." || this.value.charAt(0) == ",") {
            this.value = this.value.substring(1, this.value.length);
        }
        var count = 0;
        while (this.value.length >= count) {
            if (this.value.charAt(count) == "." && this.value.charAt(count + 1) != " " && this.value.charAt(count + 1) != "" && this.value.charAt(count + 1) != undefined) {

                this.value = this.value.substring(0, count) + ". " + this.value.substring(count + 1, this.value.length);
            }
            count++;
        }
        count = 0;
        while (this.value.length >= count) {
            if (this.value.charAt(count) == "," && this.value.charAt(count + 1) != " " && this.value.charAt(count + 1) != "" && this.value.charAt(count + 1) != undefined) {

                this.value = this.value.substring(0, count) + ", " + this.value.substring(count + 1, this.value.length);
            }
            count++;
        }

        if (this.value.length > 30) {
            this.value = this.value.substring(0, 30);
        }

    });

    $(".nametype").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 190 || k == 110);
    });

    $(".namewithspace").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 9 || k == 8 || k == 190 || k == 110 || k == 32);
    });

    $(".address").keypress(function (e) {
        var k = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (e.shiftKey) {
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || k == 45 || k == 46 || k == 47 || (k >= 48 && k <= 57));
        }
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || k == 35 || k == 37 || k == 38 || k == 41 || k == 45 || k == 46 || k == 47 || (k >= 48 && k <= 57));
    });

    $(".pincode").blur(function () {
        if (this.value != "" && !isValidPinCode(this.value)) {
            $(this).addClass("validationError");
        }
        else {
            $(this).removeClass("validationError");
        }
    });

    $(".emailType").keydown(function () {
        this.value = this.value.replace(/[^A-z0-9_\-\.\@]+$/, '');
    });

    $(".emailType").keyup(function () {
        this.value = this.value.replace(/[^A-z0-9_\-\.\@]+$/, '');
    });

    $(".emailaddress").blur(function () {
        if (this.value != "" && !isValueMasked(this.value) && !validateEmail(this.value)) {
            $(this).addClass("errorMsg");
            $(this).next().css('display', 'block');
        }
        else {
            $(this).removeClass("errorMsg");
            $(this).next().css('display', 'none');
        }
    });

    $(".mobileNumber").blur(function () {
        if (this.value != "" && !isValueMasked(this.value) && !isValidMobileNumber(this.value)) {
            $(this).addClass("error");
            // userAssist.Info("Invalid Mobile Phone Number input. Please fill in your correct Mobile Phone Number.");
        }
        else {
            $(this).removeClass("error");
        }
    });

    $(".internationalmobileNumber").blur(function () {
        if (this.value != "" && !isValueMasked(this.value) && !isValidInternationalMobileNumber(this.value)) {
            $(this).addClass("error");
        }
        else {
            $(this).removeClass("error");
        }
    });

    $(".applicationNumber").blur(function () {
        if (this.value != "" && !isValidQuoteNumber(this.value)) {
            $(this).addClass("error");
            // userAssist.Info("Invalid Mobile Phone Number input. Please fill in your correct Mobile Phone Number.");
        }
        else {
            $(this).removeClass("error");
        }
    });

    $(document).keydown(function (e) {
        var element = e.target.nodeName.toLowerCase();
        if ((element != 'input' && element != 'textarea') || $(e.target).attr("readonly") || (e.target.getAttribute("type") === "checkbox")) {
            if (e.keyCode === 8) {
                return false;
            }
        }
    });
});

function setFirstCharToUC(ctrl) {
    if (!ctrl.focus()) {
        var value = ' ';
        var txtvalue = ctrl.value.trim();
        txtvalue = txtvalue.split(' ');
        for (var i = 0; i < txtvalue.length; i++) {
            if (txtvalue[i] != '' && txtvalue.length > 0) {
                var firstchar = txtvalue[i].charAt(0).toUpperCase();
                if (txtvalue[i].charAt(0) != firstchar) {
                    value = value + ' ' + firstchar + txtvalue[i].substring(1).toLowerCase();
                }
                else {
                    value = value + ' ' + firstchar + txtvalue[i].substring(1).toLowerCase();
                }
            }
        }
        if (value != ' ') {
            ctrl.value = value.trim();
        }
    }
}

function validateAlphaNumeric(txt) {
    var rege = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    return (rege.test(txt));
}

function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }
    else {
        return false;
    }
}

function isValueMasked(value) {
    if (value.indexOf('*') >= 0) {
        return true;
    }
    return false;
}

function isValidMobileNumber(mobNo) {
    var filter = /^[6789]\d{9}$/;
    if (filter.test(mobNo)) {
        return true;
    }
    else {
        return false;
    }
}

function isValidInternationalMobileNumber(mobNo) {
    return true;
    //var filter = /^[123456789]\d{7}$/;
    //if (filter.test(mobNo)) {
    //    return true;
    //}
    //else {
    //    return false;
    //}
}

function isValidQuoteNumber(quoteNo) {
    var filter = /^[5][1][123]\d{9}$/;
    if (filter.test(quoteNo)) {
        return true;
    }
    else {
        return false;
    }
}

function isValidDMSCode(dmsCode) {
    var filter = /^[0-9]\d{7}$/;
    if (filter.test(dmsCode)) {
        return true;
    }
    else {
        return false;
    }
}

function isValidPinCode(pinCode) {
    var filter = /^[1-9]\d{5}$/;
    if (filter.test(pinCode)) {
        return true;
    }
    else {
        return false;
    }
}

function IsOnlyNumeric(strString) {
    var strValidChars = "0123456789";
    var strChar;
    var blnResult = true;
    for (i = 0; i < strString.length && blnResult == true; i++) {
        strChar = strString.charAt(i);
        if (strValidChars.indexOf(strChar) == -1) {
            blnResult = false;
        }
    }
    return blnResult;
}

function ChangeToUpper() {
    key = window.event.which || window.event.keyCode;

    if ((key > 0x60) && (key < 0x7B))
        window.event.keyCode = key - 0x20;
}

function CheckPAN(obj, evt, lblname) {

    var lbl = lblname;
    var ctrlname = obj;
    var ucctrlname = ctrlname;
    var strInitial = ucctrlname;

    var code = (evt.which) ? evt.which : evt.keyCode ? evt.keyCode : evt.charCode;
    //For IE7 browser
    if (typeof String.prototype.trim !== 'function') {
        String.prototype.trim = function () {
            return this.replace(/^\s+|\s+$/g, '');
        }
    }
    if (navigator.userAgent.search("Firefox") != -1) {
        if (code == 32 || code == 190) {
            var pancard = document.getElementById(obj).value;
            document.getElementById(obj).value = pancard.substring(0, pancard.length - 1);
        }
    }
    if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122) || (code >= 48 && code <= 57) || (code == 13 || code == 8 || code == 9)) {
        var pancard = document.getElementById(obj).value;
        document.getElementById(obj).style.border = "1px solid #b7b7b7";
        //document.getElementById(obj).style.color = "#000000";
        if ((pancard.trim().length > 0 && IsOnlyNumeric(pancard.charAt(0).toString()) == true) || (pancard.trim().length > 1 && IsOnlyNumeric(pancard.charAt(1).toString()) == true) || (pancard.trim().length > 2 && IsOnlyNumeric(pancard.charAt(2).toString()) == true) || (pancard.trim().length > 3 && IsOnlyNumeric(pancard.charAt(3).toString()) == true) || (pancard.trim().length > 4 && IsOnlyNumeric(pancard.charAt(4).toString()) == true)) {
            document.getElementById(obj).value = pancard.substring(0, pancard.length - 1);
            document.getElementById(lbl).innerHTML = ""; //"Starting five digits should be Alphabets";
            if (pancard.trim().length == 1) {
                document.getElementById(obj).value = "";
            }
            return false;
        }
        if ((pancard.trim().length > 5 && IsOnlyNumeric(pancard.charAt(5).toString()) == false) || (pancard.trim().length > 6 && IsOnlyNumeric(pancard.charAt(6).toString()) == false) || (pancard.trim().length > 7 && IsOnlyNumeric(pancard.charAt(7).toString()) == false) || (pancard.trim().length > 8 && IsOnlyNumeric(pancard.charAt(8).toString()) == false)) {
            document.getElementById(obj).value = pancard.substring(0, pancard.length - 1);
            document.getElementById(lbl).innerHTML = ""; //"6,7,8 & 9th digits should be numeric";
            return false;

        }
        if (pancard.trim().length > 9 && IsOnlyNumeric(pancard.charAt(9).toString()) == true) {
            document.getElementById(obj).value = pancard.substring(0, pancard.length - 1);
            document.getElementById(lbl).innerHTML = ""; // "Last digit should be Alphabet";
            return false;
        }
    }
    else {
        return false;
    }
    return true;
}

function GetIndianCurrencyFormattedAmountPayment(value, maxlenght) {
    value = value.toString();
    var number = ""; var formattedValue = '';
    if (value != '' && value != '0') {
        var temp = value.split(',');
        for (var i = 0; i < temp.length; i++) {
            number = number + "" + temp[i];
        }
        if (number != "") {
            if (number.charAt(0) == "0" && number > 0) {
                number = number.replace(/^0+/, '');
            }
            number = Math.round(number);
            var tmpstr = fntemp(parseInt(number));

            formattedValue = fntemp(parseInt(number));
            if (formattedValue != undefined) {
                value = formattedValue;
            }
            if (tmpstr.length > maxlenght) {
                tmpstr = tmpstr.substring(0, tmpstr.length - 1);
                formattedValue = tmpstr;
                if (formattedValue != undefined) {
                    value = formattedValue;
                }
                GetIndianCurrencyFormattedAmountPayment(value, maxlenght)
            }
        }
    }
    return value;
}

function fnFormatCurrencyIndianStyle(objTextBox, maxlenght) {
    var inputNumber = parseInt(objTextBox.value, 0);
    if (inputNumber >= 0) {
        indianFormatCurrencyStyle(objTextBox, maxlenght);
    }
}

function indianFormatCurrencyStyle(objTextBox, maxlenght) {
    var number = "";
    if (objTextBox.value != '' && objTextBox.value != '0') {
        var temp = objTextBox.value.split(',');
        //alert(temp.length);
        for (var i = 0; i < temp.length; i++) {
            number = number + "" + temp[i];
            //alert(number);
        }
        if (number != "") {
            // alert(parseInt(number));
            if (number.charAt(0) == "0" && number > 0) {
                //                 alert("hi");
                //number = RemoveZeroAtFirst(number);
                number = number.replace(/^0+/, '');
            }
            number = Math.round(number);
            var tmpstr = fntemp(parseInt(number));

            objTextBox.value = fntemp(parseInt(number));
            if (objTextBox.innerHTML != undefined) {
                objTextBox.innerHTML = objTextBox.value;
            }
            if (tmpstr.length > maxlenght) {
                tmpstr = tmpstr.substring(0, tmpstr.length - 1);
                objTextBox.value = tmpstr;
                if (objTextBox.innerHTML != undefined) {
                    objTextBox.innerHTML = objTextBox.value;
                }
                fnFormatCurrencyIndianStyle(objTextBox, maxlenght)
            }
        }
    }
}

function fntemp(number) {
    var formattedNumber = "";
    if (number > 999) {
        var no = parseInt(number / 1000);
        formattedNumber = (number - no * 1000)
        if (formattedNumber == 0) {
            formattedNumber = "000";
        }
        else if (formattedNumber < 10) {
            formattedNumber = "00" + formattedNumber;
        }
        else if (formattedNumber < 100) {
            formattedNumber = "0" + formattedNumber;
        }
        number = no;
        while (no > 99) {
            //alert(no)
            no = parseInt(no / 100);
            var temp = (number - no * 100);
            if (temp == 0) {
                formattedNumber = "00" + "," + formattedNumber;
            }
            else if (temp < 10) {
                formattedNumber = "0" + (number - no * 100) + "," + formattedNumber;
            }
            else {
                formattedNumber = (number - no * 100) + "," + formattedNumber;
            }
            number = no;
        }
        formattedNumber = no + "," + formattedNumber;
        //alert(formattedNumber);
    }
    else {
        formattedNumber = number;
    }
    return formattedNumber;
}

function SortArrayByKey(array, key) {
    return array.sort(function (a, b) {
        var x = a[key]; var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}