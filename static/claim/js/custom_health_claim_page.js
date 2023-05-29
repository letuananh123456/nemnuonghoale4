fncValidateForm = function() {
    var leadsource = 'PB';
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        var leadsource = 'PBMobile';
    }
    var parentId = '';
    var flagSubmit = true;
    var objStringVal = '';
    errorFields = '';
    errorDescriptions = '';
    errorCounts = 0;
    $(parentId + '#ClaimSource').val(leadsource);
    //Name
    objString = $(parentId + '#name');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length <= 2) {
        addError(objString, '');
        flagSubmit = false;
        errorFields += 'name,';
        errorDescriptions += 'Please enter name,';
        errorCounts++;
    } else if (!onlycharacter(objStringVal)) {
        addError(objString, '');
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
        addError(objString, '');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter mobile,';
        errorCounts++;
    } else if (!validmobile(objStringVal)) {
        addError(objString, '');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter valid mobile,';
        errorCounts++;
    } else if (!onlyNumber(objStringVal)) {
        addError(objString, '');
        flagSubmit = false;
    } else {
        clearError(objString);
    }

    //Email Id
    objString = $(parentId + '#email');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, '');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter valid email,';
        errorCounts++;
    } else if (!validemail(objStringVal)) {
        addError(objString, '');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter valid email,';
        errorCounts++;
    } else {
        clearError(objString);
    }


    //Alternate No.
    var objString = $(parentId + '#alternateNo');
    objStringVal = $.trim(objString.val());
    if (objStringVal != '') {
        if (objStringVal.length === 0) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'alternate no,';
        errorDescriptions += 'Please enter alternate no,';
        errorCounts++;
        } else if (!validmobile(objStringVal)) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'alternate no,';
        errorDescriptions += 'Please enter alternate no,';
        errorCounts++;
        } else if (!onlyNumber(objStringVal)) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'alternate no,';
        errorDescriptions += 'Please enter alternate no,';
        errorCounts++;
        } else {
            clearError(objString);
        }
    }
    //Policy No.
    var objString = $(parentId + '#policyNo');
    objStringVal = $.trim(objString.val());
    if (objStringVal != '') {
        if (objStringVal.length === 0) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'policyNo,';
        errorDescriptions += 'Please enter policyNo,';
        errorCounts++;
        } else if (!alphanumeric(objStringVal)) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'policyNo,';
        errorDescriptions += 'Please enter policyNo,';
        errorCounts++;
        } else {
            clearError(objString);
        }
    }

    //Claim Id
    var objString = $(parentId + '#claimId');
    objStringVal = $.trim(objString.val());
    if (objStringVal != '') {
        if (objStringVal.length === 0) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'claimid,';
        errorDescriptions += 'Please enter claimid,';
        errorCounts++;
        } else if (!alphanumeric(objStringVal)) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'claimid,';
        errorDescriptions += 'Please enter claimid,';
        errorCounts++;
        } else {
            clearError(objString);
        }
    }

//Remarks
    var objString = $(parentId + '#remarks');
    objStringVal = $.trim(objString.val());
    if (objStringVal != '') {
        if (objStringVal.length === 0) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'remarks,';
        errorDescriptions += 'Please enter remarks,';
        errorCounts++;
        } else if (!alphanumeric(objStringVal)) {
            addError(objString, '');
            flagSubmit = false;
            errorFields += 'remarks,';
        errorDescriptions += 'Please enter remarks,';
        errorCounts++;
        } else {
            clearError(objString);
        }
    }
    
    if (flagSubmit) {
        var url = $(location).attr('href'),
    parts = url.split("/"),
    last_part = parts[parts.length-2];
        ga('pbTrackerObj.send', 'event', 'Claim', 'Health-Lead', last_part,{'nonInteraction': 1});
        setTimeout(function () {
            document.frmHealthClaim.submit();
        },100);
    }else{
        userType = $('#gaData').attr('data-user-type');
        GA360FormSubmitError(errorFields,errorDescriptions,errorCounts,userType);
    }
};
$(document).ready(function() {
    $(document).on('click', '#btnCallToAction', fncValidateForm);
	$('.health_claim_faq .accordion .dt').click(function () {
        $(this).toggleClass('active');
        $(this).next('.dd').slideToggle();
        $(this).parent().siblings().find('.dd').slideUp();
        $(this).parent().siblings().find('.dt').removeClass('active');
    })
    $('table').wrap('<div style="overflow:auto"></div>')
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