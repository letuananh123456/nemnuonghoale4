/*
 * 
 * @params element object
 * @retun boolean
 */
function addError(obj, msg) {
    //var parentDiv = obj.parents('.input_field');
    obj.addClass('error');
    //parentDiv.addClass('error');
    //jQuery('.err', parentDiv).html(msg);
    return false;
}

/*
 * 
 * @params element object
 */
function clearError(obj) {
    //var parentDiv = obj.parents('.input_field');
    obj.removeClass('error');
    //parentDiv.removeClass('error');
    //jQuery('.err', parentDiv).html('');
}

function onlyNumber(value) {
    return /^[0-9]*$/.test(value);
}
function onlycharacter(value) {
    return /^[a-zA-Z\s]+$/.test(value);
}

function validmobile(value) {
    return /^[6789]\d{9}$/.test(value);
}

function validemail(value) {
	return /^(?=[^@]{2,}@)([\w\.-]*[a-zA-Z0-9_]@(?=.{2,}\.[^.]*$)[\w\.-]*[a-zA-Z0-9]{2,4}\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z])$/.test(value);
}


chkRegNumKeyUp = function() {
    chkRegNum($(this));
};

/*
 * Check car registration number format
 * @param string
 * @returns boolean
 */
function checkRegistrationNumber(value) {
    return /^[A-Z]{2}[0-9]{1,2}[A-Z]{1,3}[0-9]{4}$/.test(value);
}

chkRegNum = function(objRegNum) {
    //var objRegNum = $('#carRegistrationNumber');
    //var parentDiv = objRegNum.parents('.input_field');
    var valRegNum = $.trim(objRegNum.val());
    valRegNum = valRegNum.toUpperCase();
    var flag = true;
    if (!checkRegistrationNumber(valRegNum)) {
        addError(objRegNum, 'Please enter valid registration number');
        flag = false;
    } else {
        clearError(objRegNum);
        objRegNum.val(valRegNum);
    }
    return flag;
};

fncValidateForm = function() {
    var parentId = '';
    var flagSubmit = true;
    var objStringVal = '';
    errorFields = '';
    errorDescriptions = '';
    errorCounts = 0;
    //Name
    objString = $(parentId + '#name');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter contact person name');
        flagSubmit = false;
        errorFields += 'name,';
        errorDescriptions += 'Please enter name,';
        errorCounts++;
    } else if (!onlycharacter(objStringVal)) {
        addError(objString, 'Please enter character only');
        flagSubmit = false;
        errorFields += 'name,';
        errorDescriptions += 'Please enter name,';
        errorCounts++;
    } else {
        clearError(objString);
    }

    //Mobile
    var objString = $(parentId + '#mobile');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter mobile number');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter mobile,';
        errorCounts++;
    } else if (!validmobile(objStringVal)) {
        addError(objString, 'Please enter valid mobile number');
        flagSubmit = false;
    } else if (!onlyNumber(objStringVal)) {
        addError(objString, 'Please enter valid mobile number');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter valid mobile,';
        errorCounts++;
    } else {
        clearError(objString);
    }

    //Email Id
    objString = $(parentId + '#email');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter email id');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter email,';
        errorCounts++;
    } else if (!validemail(objStringVal)) {
        addError(objString, 'Please enter valid email id');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter valid email,';
        errorCounts++;
    } else {
        clearError(objString);
    }

    //RegNo
    /*var objRegNum = $(parentId+'#registrationNo');
     var valRegNum = $.trim(objRegNum.val());
     if (valRegNum.length == 0) {
     addError(objRegNum, 'Please enter valid registration number');
     flagSubmit = false;
     } else if(!chkRegNum(objRegNum)) {
     addError(objRegNum, 'Please enter valid registration number');
     flagSubmit = false;
     } else {
     clearError(objRegNum);
     }*/

    if (flagSubmit) {
        var url = $(location).attr('href'),
        parts = url.split("/"),
        last_part = parts[parts.length-2];
        ga('pbTrackerObj.send', 'event', 'Claim', 'Car-Lead',last_part, {'nonInteraction': 1});
        setTimeout(function () {
        document.frmCarClaim.submit();
        },1);
    }else{
        userType = $('#gaData').attr('data-user-type');
        GA360FormSubmitError(errorFields,errorDescriptions,errorCounts,userType);
    }
};

$(document).ready(function() {
    $(document).on('click', '#btnCallToAction', fncValidateForm);
});
function GA360FormSubmitError(errorFields,errorDescriptions,errorCounts,userType){
    try{        
        dataLayer.push({
            'event': 'formSubmit', 
            'operatorType':userType,
            'errorField':errorFields.replace(/,+$/,''),
            'errorDescription':errorDescriptions.replace(/,+$/,''),
            'errorCounts':errorCounts
        })
    }catch(e){}
}

function GA360FormSubmit(eventType){
    try{        
        var path = window.location.pathname.split("/");
        var pathLastName = path[path.length-2];                        
        pathLastName = pathLastName.replace(/-/g, ' ');
        ctaName = pathLastName +'/bu';
        dataLayer.push({
            'event': eventType, 
            'ctaName':ctaName
        })
    }catch(e){}
}