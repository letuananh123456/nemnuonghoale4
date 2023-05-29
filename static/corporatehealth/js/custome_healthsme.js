$('body').bind('cut copy paste', function (e) {
    e.preventDefault();
    return false;
});

var language = 'en';
var objLanguage = JSON.stringify({
    "en":{
        "City":"City",
        "Country":"Country"
    },
    "hi":{
        "City":"शहर",
        "Country":"देश",
    }
});
objLanguage = JSON.parse(objLanguage);

//GA 360
function GA360(leadId,enquiryId,customerId,bookingId,policyType){
    try{
        /*dataLayer.push({
            'event': 'leadSubmit', 
            'leadId':'<pass the lead ID wherever applicable >',
            'enquiryId':'<pass the enquiry ID wherever applicable>',
            'customerId':'<pass the customer ID wherever applicable>',
            'leadType':'<parent lead or child lead>',
            'bookingId':'<pass the booking ID wherever applicable>',  
            'policyType': '<pass Fresh / renewal or rollover>'
        })*/
        dataLayer.push({
            'event': 'leadSubmit', 
            'leadId':leadId,
            'enquiryId':enquiryId,
            'customerId':customerId,
            'leadType':'',
            'bookingId':bookingId,  
            'policyType': policyType,
            'productId':productId
        })
    }catch(e){}
}
function GA360FormSubmitError(errorFields,errorDescriptions,errorCounts,userType){
    try{        
        dataLayer.push({
            'event': 'formSubmit', 
            'operatorType':userType,
            'errorField':errorFields.replace(/,+$/,''),
            'errorDescription':errorDescriptions.replace(/,+$/,''),
            'errorCounts':errorCounts,
            'productId':productId
        })
    }catch(e){}
}

function GA360FormSubmit(eventType){
    try{        
        var gaDataUtmMedium = $('#gaData').attr('data-utm-medium');
        var path = window.location.pathname.split("/");
        var pathLastName = path[path.length-2];                        
        pathLastName = pathLastName.replace(/-/g, ' ');
        ctaName = pathLastName +'/'+gaDataUtmMedium.toLowerCase();
        dataLayer.push({
            'event': eventType, 
            'ctaName':ctaName,
            'productId':productId
        })
    }catch(e){}
}
function getGACId(strTrackingId) {
    var GACID = 'false';
    try {
      var trackers = ga.getAll();
      for (var i = 0; i < trackers.length; ++i)
      {
        var tracker = trackers[i];
        if (tracker.get('trackingId') == strTrackingId)
        {
          GACID = tracker.get('clientId');
        }
      }
    } catch (e) {
    }
    return GACID;
} 

function getGCLId() {
    try {
    var nameEQ = "_gcl_aw" + "=";
    var gclid="";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) 
        {
            var cookieValue=c.substring(nameEQ.length, c.length);
            var startIndex=cookieValue.lastIndexOf(".");
            gclid=cookieValue.substring(startIndex+1);
        }
    }
    } catch (e) {
    }
    return gclid;
} 
      
$(function () {
    $('.step2Form a').click(function(){     
        $('.step2Form').removeClass('active_sec').animate({"left":"100%"});
        $('.step1Form').addClass('active_sec').animate({"left":"-0%"});
        $('.topWrapcontainer').css('height',$('.step1Form').height()+12);                
    });
    $('.select_feild').click(function () {
        if (!$('input', $(this)).is(':checked')) {
            $('input', $(this)).prop("checked", false);
            $(this).parent().removeClass('active');
        } else {
            $('input', $(this)).prop("checked", true);
            $(this).parent().addClass('active');
        }
    });
 if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
      
    $('#tab_3').hide();
    $('.article_item').hide();
  }
    /*for mobile header*/
    
    $("#navsidebaricon,#navsidebaricon2,#navsidebar").click(function () {
        if ($(this).hasClass("active")) {
            $("#navsidebar").animate({"left": -270});
            $("body").animate({"left": 0});
            $("body").removeClass("openMenu");
            $(this).removeClass("active");
            $(".overLay").fadeOut();
        } else {
            $("#navsidebar").animate({"left": 0});
            $("body").addClass("openMenu");
            $("body").animate({"left": 0});
            $(this).addClass("active");
            $(".overLay").fadeIn();
        }
    });
    
    $(".overLay").click(function () {
        $("#navsidebar").animate({"left": -270});
        $("body").animate({"left": 0});
        $("body").removeClass("openMenu");
        $("#navsidebaricon").removeClass("active");
        $(".overLay").fadeOut();
    });

    $(".sidenav li span").click(function () {
        if ($(this).parent().hasClass("active")) {
            $(".sidenav li ul").slideUp();
            $(".sidenav li").removeClass("active")
        } else {
            $(".sidenav li ul").slideUp();
            $(this).next("ul").slideDown();
            $(".sidenav li").removeClass("active")
            $(this).parent().addClass("active")
        }
    });

    $(".sidenav li li span").css("pointer-events", "none");
    /*end mobile header*/
    
    $('.knowMore,.know_more').click(function () {
        var tops = ($(window).height() > 700) ? -650 : -400;
        $('.overlay_area').css({'height': $(window).height(), 'top': $(window).height()})
        $('.overlay_area').show().animate({opacity: '0.8'}, 300);
        $('.seo_content_box').show().animate({top: tops + 'px'}, 500);
    });

    $('.close_pop').click(function () {
        $('.seo_content_box').fadeOut('slow');
        $('.overlay_area').animate({opacity: '0'}, 500);
        $('.seo_content_box,.overlay_area').hide('slow')
    })
    /*Dropdown*/

    $('.dropdown').hover(
        function () {
            //$(this).addClass('open');
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
        },
        function () {
            //$(this).removeClass('open');
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
        }
    );
});

fncSetFormValue = function () {
    //Get pbcjpreqd
        $.ajax({
        url: cjProcessUrl + '?type=getpbcjpreqd',
        type: "GET",
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {
            obj = data.Data;
            if(obj !=''){
            
            switch (obj.tabName) {             
                case 'healthsme':
                setTimeout(function () {
                    $('.healthsme-bg .proceedGray').parent('.input_field.pro').hide();
                    if(obj.company_name !='' && obj.Name !='')
                    $('.healthsme-bg .step2HealthDetails').show();
                    var objCityPin = $('.healthsme-bg #healthsmeCityPincode');
                    objCityPin.val(obj.City);
                    objCityPin.attr('data-cityid', obj.CityID);
                    objCityPin.attr('data-stateid', obj.state_id);
                    objCityPin.attr('data-pincode', obj.pincode);
                    $('.healthsme-bg #healthsmeGender').val(obj.gender);                    
                }, 1000);
                break;
        }
        $('.healthsme-bg #healthsmeContactPerson').val(obj.Name);
        $('.healthsme-bg #healthsmeMobile').val(obj.MobileNo);
        $('.healthsme-bg #healthsmeEmail').val(obj.EmailID);
                }
}});
}

function InsertTracking(VisitId, ipaddress, sessionID, utmsource, utmterm, utmmedium, utmcampaign, leadsource, url, CustID) {
    var strBrowser = detectBrowser();
    Data = '{"VisitId":"' + VisitId + '","url":"' + url + '","sessionID":"' + sessionID + '","utmsource":"' + utmsource + '","utmterm":"' + utmterm + '","ipaddress":"' + ipaddress + '","browser":"' + strBrowser + '","leadsource":"' + leadsource + '","utmmedium":"' + utmmedium + '","utmcampaign":"' + utmcampaign + '","CustID":"' + CustID + '"}';
    TrackUrl = document.location.protocol+'//' + document.location.host + '/' + '/services/tracking.php';
    $.ajax({beforeSend: function (xhrObj) {
            xhrObj.setRequestHeader("Content-Type", "application/json");
            xhrObj.setRequestHeader("Accept", "application/json")
        }, url: TrackUrl, type: "POST", data: Data, dataType: "json", success: function (msg) {
            if (msg != '')
                $('#gaData').attr('data-visit', msg.visitId)
        }})
}
function detectBrowser() {
    var N = navigator.appName;
    var UA = navigator.userAgent;
    //var temp;
    var browserVersion = UA.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
    browserVersion = browserVersion ? [browserVersion[1]] : N;
    return browserVersion;
}
$(window).load(function () {
    
    $('.policy_wrapper').css('visibility', 'visible');
    $('.formarea').addClass('fadeInUp');
    var x = 0;
    $('.category li').children('a').addClass('animated fadeInUp block');
    
});

var utmTerm = $('#gaData').attr('data-utm-term');
var utmSource = $('#gaData').attr('data-utm-source');
var utmMedium = $('#gaData').attr('data-utm-medium');
var utmCampaign = $('#gaData').attr('data-utm-campaign');
var utmContent = $('#gaData').attr('data-display-for');
var visitId = $('#gaData').attr('data-visit');
var productId = $('#gaData').attr('data-pid');


$(document).ready(function () {    
    utmTerm = $('#gaData').attr('data-utm-term');
    utmSource = $('#gaData').attr('data-utm-source');
    utmMedium = $('#gaData').attr('data-utm-medium');
    utmCampaign = $('#gaData').attr('data-utm-campaign');
    utmContent = $('#gaData').attr('data-display-for');
    visitId = $('#gaData').attr('data-visit');
    productId = $('#gaData').attr('data-pid');

    //Health SME Start
    $(document).on('change', '.healthsme-bg #healthsmeOption,.healthsme-bg #healthsmeIdemnity', fncDisplayHealthSmeDetals);
    $(document).on('blur', '.healthsme-bg #healthsmeCompanyname', fncDisplayHealthSmeDetals);
    $(document).on('focus', '.healthsme-bg #healthsmeContactPerson', fncDisplayHealthSmeDetals);
    $(document).on('click', '.healthsme-bg #btnSubmitHealthsme', fncProcessHealthSme);
    //$('.healthsme-bg .marker').hide();
    //Health SME End
    
    //City ga event on focus
    $(document).on('focus', '#healthsmeCityPincode', fncCityFocus);
    
    $(document).on('click','.healthsme-thankyou .close', function(){
       $('.sme_popup').hide(); 
    });
        
});
fncCityFocus = function(){
    try{
        ga('pbTrackerObj.send', 'event', 'city-focus' , $(this).attr('id'), '',{'nonInteraction': 1});
    } catch(e){}
};
/*
 * Convert a string to base64 encode
 * @param string
 * @returns string
 */
var Base64 = {_keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) {
        var t = "";
        var n, r, i, s, o, u, a;
        var f = 0;
        e = Base64._utf8_encode(e);
        while (f < e.length) {
            n = e.charCodeAt(f++);
            r = e.charCodeAt(f++);
            i = e.charCodeAt(f++);
            s = n >> 2;
            o = (n & 3) << 4 | r >> 4;
            u = (r & 15) << 2 | i >> 6;
            a = i & 63;
            if (isNaN(r)) {
                u = a = 64
            } else if (isNaN(i)) {
                a = 64
            }
            t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a)
        }
        return t
    }, decode: function (e) {
        var t = "";
        var n, r, i;
        var s, o, u, a;
        var f = 0;
        e = e.replace(/[^A-Za-z0-9+/=]/g, "");
        while (f < e.length) {
            s = this._keyStr.indexOf(e.charAt(f++));
            o = this._keyStr.indexOf(e.charAt(f++));
            u = this._keyStr.indexOf(e.charAt(f++));
            a = this._keyStr.indexOf(e.charAt(f++));
            n = s << 2 | o >> 4;
            r = (o & 15) << 4 | u >> 2;
            i = (u & 3) << 6 | a;
            t = t + String.fromCharCode(n);
            if (u != 64) {
                t = t + String.fromCharCode(r)
            }
            if (a != 64) {
                t = t + String.fromCharCode(i)
            }
        }
        t = Base64._utf8_decode(t);
        return t
    }, _utf8_encode: function (e) {
        e = e.replace(/rn/g, "n");
        var t = "";
        for (var n = 0; n < e.length; n++) {
            var r = e.charCodeAt(n);
            if (r < 128) {
                t += String.fromCharCode(r)
            } else if (r > 127 && r < 2048) {
                t += String.fromCharCode(r >> 6 | 192);
                t += String.fromCharCode(r & 63 | 128)
            } else {
                t += String.fromCharCode(r >> 12 | 224);
                t += String.fromCharCode(r >> 6 & 63 | 128);
                t += String.fromCharCode(r & 63 | 128)
            }
        }
        return t
    }, _utf8_decode: function (e) {
        var t = "";
        var n = 0;
        var r = c1 = c2 = 0;
        while (n < e.length) {
            r = e.charCodeAt(n);
            if (r < 128) {
                t += String.fromCharCode(r);
                n++
            } else if (r > 191 && r < 224) {
                c2 = e.charCodeAt(n + 1);
                t += String.fromCharCode((r & 31) << 6 | c2 & 63);
                n += 2
            } else {
                c2 = e.charCodeAt(n + 1);
                c3 = e.charCodeAt(n + 2);
                t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63);
                n += 3
            }
        }
        return t
    }};

/*
 * Check only number
 * @param string
 * @returns boolean
 */
function checkOnlyNumber(value) {
    return /^[0-9]*$/.test(value);
}

function onlyNumber(value) {
    return /^[0-9]*$/.test(value);
}

fncOnlyNumber = function () {
    if (!(/^[0-9]*$/.test($(this).val()))) {
        $(this).val('');
    }
};
/*
 * Check only character
 * @param string
 * @returns boolean
 */
function onlycharacter(value) {
    return /^[a-zA-Z\s]+$/.test(value);
}

function onlycharacterwithspace(value) {
    return /^[a-zA-Z]+\s[a-zA-Z\s]+$/.test(value);
}

/*
 * Get current browser name and return
 * @returns String
 */
function getBrowser() {
    var userAgent = window.navigator.userAgent;
    var browsers = {chrome: /chrome/i, safari: /safari/i, firefox: /firefox/i, ie: /internet explorer/i};
    for (var key in browsers) {
        if (browsers[key].test(userAgent)) {
            return key;
        }
    }
    ;
    return 'unknown';
}

/*
 * 
 * @params element object
 * @retun boolean
 */
function addError(obj, msg) {
    var parentDiv = obj.parents('.input_field');
    obj.addClass('error');
    parentDiv.addClass('error');
    $('.err', parentDiv).html(msg);
    return false;
}

/*
 * 
 * @params element object
 */
function clearError(obj) {
    var parentDiv = obj.parents('.input_field');
    obj.removeClass('error');
    parentDiv.removeClass('error');
    $('.err', parentDiv).html('');
}

/*
 * Load health mobile country list
 * @returns html string
 */
function fncGetMobileCountry(elementId) {
    var listCountry = '<option value="" data-country-code-id="">Country</option>';
    $.ajax({
        url: cjProcessUrl + '?type=get-mobile-country',
        type: "POST",
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $.each(data, function (key, value) {
                listCountry += '<option value="' + value.CountryCode + '" ' + ((value.CountryCode == 91) ? 'selected' : '') + '  data-country-code-id="' + value.CountryCodeId + '">' + value.CountryName + '</option>';
            });
            $(elementId).html(listCountry);
        }
    });
}
function ucwords (str) {
    return (str + '').replace(/^([a-z])|\s+([a-z])/g, function ($1) {
        return $1.toUpperCase();
    });
}

function fncGetFormInPage(elemClass, invTabShow, showLeft, tab_id) {
    
    var parentIds = $('.showForm');
    var isHindi = window.location.href.indexOf("/hi");
    var url = window.location.pathname;
    var tab = url.split("/");
    var len = tab.length - 1;    
    /*data-id and title mapping from url of each tab*/
    var tab_ids =  '{"group-health-insurance":"1,Group Health Insurance","group-personal-accident-insurance":"2,Group Personal Accident","group-life-insurance":"3,Group Term Life","workmen-compensation":"19,Workmen Compensation","marine":"13,Marine","transit":"13,Marine","professional-indemnity":"14,Professional Indemnity","erection-risk":"17,Erection All Risk","fire-insurance":"5,Fire & Burglary","burglary-insurance":"5,Fire & Burglary","contractor-all-risk-policy":"16,Construction All Risk","office-package-policy":"7,Office Package","business-shop-insurance":"8,Shop Owner","plant-machinery":"18,Contractors Plant & Machinery","liability-insurance":"15,Directors & Officers Liability","director-and-officers-liability-insurance":"15,Directors & Officers Liability","general-liability-insurance":"12,General Liability"}';
    var result = $.parseJSON(tab_ids);
    /*Tab name from url*/
    var tbid = tab[len-1]; 
    var articleMatched = 0;
    $.each(result, function(i, v) {
    if (tbid.indexOf(i)>-1 || tbid.indexOf(v.toLowerCase)>-1) {
        articleMatched = i;
    }
});
    /*Map Tab name from mappin of data-id and tittle*/
    if(articleMatched)
        var tab_values =  result[articleMatched];
    else    
        var tab_values =  result[tbid];
    OwltabIndex = Object.keys(result).indexOf(tbid);
    
    if(OwltabIndex <= -1)
        OwltabIndex = 0;
    if(isHindi > -1)
        language='hi';
    else
        language='en'; 
    var filename = window.location.href.split("/");
    var lastName = filename[filename.length-2];
    $.ajax({
        url: cjFormContentUrl + '?type=' + elemClass+'&invtabshow='+invTabShow+'&language='+language+'&pagename='+lastName,
        type: "GET",
        cache: true,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            
            $.each(parentIds, function (index, value2) {
                var value = '#'+$(this).attr('id')+' ';
                $(value + '.disForm .rightContent').html(data.contentRight).fadeIn("slow");
                if(elemClass == 'smecj'){
                    $(value + "#healthsmeCityPincode").autocomplete({                        
                        source: function(request, response) {
                            var reqTerm = request.term.replace(/[^\w\s]/gi, '');
                            var regex = new RegExp('^' + reqTerm, 'i');
                            $.ajax({
                                url: ROOTURL + 'policybazzar-home/callservice.php?task=healthsmecity',
                                dataType: "json",
                                cache: true,
                                success: function (data) {
                                    response($.map(data, function (item) {
                                        if (regex.test(item.CityName)) {
                                            return item;
                                        }
                                    }));
                                }
                            });
                        },
                        minLength: 3,
                        autoFocus: true,
                        focus: function(event, ui){
                            event.preventDefault();
                            return false;
                        },
                        select: function (event, ui) {
                            $(value + "#healthsmeCityPincode").val(ui.item.CityName);
                            $(value + "#healthsmeCityPincode").attr({"data-cityid": ui.item.CityId, "data-stateid": ui.item.StateId, "data-pincode": ui.item.Pincode});
                            return false;
                        },
                        change: function (event, ui) {
                            if (!ui.item) {
                                $(value + "#healthsmeCityPincode").val("");
                            }
                        }
                    })
                    .autocomplete("instance")._renderItem = function (ul, item) {
                        return $("<li>")
                                .append("<a>" + item.CityName + "</a>")
                                .appendTo(ul);
                    };
                    
                    $('.tab-list.owl-carousel').owlCarousel({
                        loop:false,
                        //navRewind: false,
                        startPosition:OwltabIndex,
						 touchDrag  : true,
     					mouseDrag  : false,
                            margin:0,
                            nav:true,
                            responsive:{
                                0:{
                                    items:2
                                },
                                         480:{
                                    items:3
                                },
                                600:{
                                    items:4
                                },
                                          840:{
                                    items:5
                                },
                                1000:{
                                    items:8
                                }
                            }
                        })
               }
                if(elemClass == 'smecj' && tab_values != 'undefined'){  //If elemcalss is 'smecj' and home is default home page                  
                   try{
                    var tbd = tab_values.split(",");
                    var tab_id = tbd[0]; //data-tab id
                    var tab_title = tbd[1]; //Tab tittle from and id and tittle mapping      
                                                     
                    $('.tab-list li').removeClass('tab-active');                    
                    $('.tab-list li').each(function() {                       
                    var id = $(this).children('.slide_tabs').attr("data-id");
                    if(id ==  tab_id){
                    $(this).addClass('tab-active');
                    return;                
                   }      
                   
                    });                  
                    $('.sme_tab_head').text(tab_title);
                    $('#healthsmeOption option[data-id="'+tab_id+'"]').attr("selected","selected");
                    fncDisplayHide(tab_id);
                    }catch(e){}
                }
                fncSetFormValue();//Set default value

                //End multiple form
            });
        }
    });
}
function validemail(value) {
    return /^(?=[^@]{3,}@)([\w\.-]*[a-zA-Z0-9_]@(?=.{2,}\.[^.]*$)[\w\.-]*[a-zA-Z0-9]{2,4}\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z])$/.test(value);
}

function validmobile(value) {
    return /^[6789]\d{9}$/.test(value);
}
//Common function end

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

//Health SME CJ Start
fncDisplayHide = function(optionID){
    $('.healthsme-bg .groupPolicyType').hide();
    $('.healthsme-bg #smeidemnity').addClass('hide');
    $('.healthsme-bg #smecompany').show();
    if(optionID == 1 || optionID == 2 || optionID == 3){        
        $('.healthsme-bg .groupPolicyType').show();
    }
    if(optionID == 14){        
        $('.healthsme-bg #healthsmeCityPincode').attr('placeholder','Enter your Location');
        $('.healthsme-bg #smecompany').hide();
        $('.healthsme-bg #smeidemnity').removeClass('hide');
        $('.healthsme-bg #smeidemnity').show();
    } else {
        $('.healthsme-bg #healthsmeCityPincode').attr('placeholder','Enter Location of the Company');
        $('.healthsme-bg #smecompany').show();
        $('.healthsme-bg #smeidemnity').addClass('dis_none');
        $('.healthsme-bg #smeidemnity').hide();
    }    
}

fncDisplayHealthSmeDetals = function(){
    //$(parentId+' #disDisclaimer').hide();
    var parentId = '#' + $(this).parents('.disForm').parent().attr('id') + ' ';//anuj
    $('.healthsme-bg .marker').hide();
    $('.healthsme-bg .groupPolicyType').hide();
    $('.healthsme-bg #smeidemnity').addClass('dis_none');
    $('.healthsme-bg #smecompany').show();
    var optionID = $('.healthsme-bg #healthsmeOption option:selected').attr('data-id');
    if(optionID == 1 || optionID == 2 || optionID == 3){
        if(optionID == 1)
        $('.healthsme-bg .marker').show();
    
        $('.healthsme-bg .groupPolicyType').show();
    }
    if(optionID == 14){        
        $('.healthsme-bg #healthsmeCityPincode').attr('placeholder','Enter your Location');
        $('.healthsme-bg #smecompany').hide();
        $('#healthsmeCompanyname').val('');
        $('.healthsme-bg #smeidemnity').removeClass('dis_none');
    } else {
        $('.healthsme-bg #healthsmeCityPincode').attr('placeholder','Enter Location of the Company');
    }
    if (optionID == '' && $('.healthsme-bg #healthsmeContactPerson').val() == '') {
        $(parentId+'.proceedGray').parent('.input_field.pro').show();
        $(parentId+'.step2HealthDetails').slideUp('slow');
    } else {
        if((optionID != 14 && ($('.healthsme-bg #healthsmeCompanyname').val() == '') && $('.healthsme-bg #healthsmeContactPerson').val() == '') || (optionID == 14 && ($('.healthsme-bg #healthsmeIdemnity option:selected').val() == '' && $('.healthsme-bg #healthsmeContactPerson').val() == '')))
        {
            $(parentId+'.proceedGray').parent('.input_field.pro').show();
            $(parentId+'.step2HealthDetails').slideUp('slow');
        }
        else{
            $(parentId+'.proceedGray').parent('.input_field.pro').hide();
            $(parentId+'.step2HealthDetails').slideDown('slow');
        }
                if($('.healthsme-bg #healthsmeCompanyname').val() != ''){
         $(parentId+'.leftContent').removeClass('small');
         $(parentId+'.leftContent').addClass('big');
             }
    }
    
};

fncProcessHealthSme = function(){
    var parentId = '#' + $(this).parents('.disForm').parent().attr('id') + ' ';//anuj
    var objBtnSubmit = $(this);
    //objBtnSubmit.hide();
    var objString = '';
    var objStringVal = '';
    var flagSubmit = true;
    var errorFields = '';
    var errorDescriptions = '';
    var errorCounts = 0;
    //Options
    objString = $(parentId+'#healthsmeOption');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please select insurance policy option');
        flagSubmit = false;
        errorFields += 'insurance policy option,';
        errorDescriptions += 'Please select insurance policy option,';
        errorCounts++;
    } else {
        clearError(objString);
    }
    
    var optionID = $('.healthsme-bg #healthsmeOption option:selected').attr('data-id');
    if(optionID != '' && optionID != 14){
        //Company name
        objString = $(parentId+'#healthsmeCompanyname');
        objStringVal = $.trim(objString.val());
        objString.val(objStringVal);
        if (objStringVal.length === 0) {
            addError(objString, 'Please enter company name');
            flagSubmit = false;
            errorFields += 'company name,';
            errorDescriptions += 'Please enter company name,';
            errorCounts++;
        } else if (!onlycharacter(objStringVal)) {
            addError(objString, 'Please enter character only');
            flagSubmit = false;
            errorFields += 'company name,';
            errorDescriptions += 'Please enter character only,';
            errorCounts++;
        } else {
            clearError(objString);
        }
    }
    if(optionID != '' && optionID == 14){
        //Risk Category
        objString = $(parentId+'#healthsmeIdemnity');
        objStringVal = $.trim(objString.val());
        if (objStringVal.length === 0) {
            addError(objString, 'Please select risk category');
            flagSubmit = false;
            errorFields += 'idemnity,';
            errorDescriptions += 'Please select risk category,';
            errorCounts++;
        } else {
            clearError(objString);
        }
    }
    
    //Salutation
    objString = $(parentId+'#healthsmeGender');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError($(parentId+'#healthsmeContactPerson'), 'Please select');
        flagSubmit = false;
        errorFields += 'gender,';
        errorDescriptions += 'Please select,';
        errorCounts++;
    } else {
        clearError($(parentId+'#healthsmeContactPerson'));
    }
    //Name
    objString = $(parentId+'#healthsmeContactPerson');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter contact person name');
        flagSubmit = false;
        errorFields += 'person name,';
        errorDescriptions += 'Please enter contact person name,';
        errorCounts++;
    } else if (!onlycharacter(objStringVal)) {
        addError(objString, 'Please enter character only');
        flagSubmit = false;
        errorFields += 'person name,';
        errorDescriptions += 'Please enter character only,';
        errorCounts++;
    } else {
        if(flagSubmit)
        clearError(objString);
    }
    
    //Mobile
    var objString = $(parentId+'#healthsmeMobile');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter mobile number');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter mobile number,';
        errorCounts++;
    } else if (!validmobile(objStringVal)) {
        addError(objString, 'Please enter valid mobile number');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter valid mobile number,';
        errorCounts++;
    } else if (!onlyNumber(objStringVal)) {
        addError(objString, 'Please enter valid mobile number');
        flagSubmit = false;
        errorFields += 'mobile,';
        errorDescriptions += 'Please enter valid mobile number,';
        errorCounts++;
    } else {
        clearError(objString);
    }
    
    //Email Id
    objString = $(parentId+'#healthsmeEmail');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please enter email id');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter email id,';
        errorCounts++;
    } else if (!validemail(objStringVal)) {
        addError(objString, 'Please enter valid email id');
        flagSubmit = false;
        errorFields += 'email,';
        errorDescriptions += 'Please enter valid email id,';
        errorCounts++;
    } else {
        clearError(objString);
    }

    //City / Pincode
    objString = $(parentId+'#healthsmeCityPincode');
    objStringVal = $.trim(objString.val());
    if (objStringVal.length === 0) {
        addError(objString, 'Please select city');
        flagSubmit = false;
        errorFields += 'city,';
        errorDescriptions += 'Please select city,';
        errorCounts++;
    } else {
        clearError(objString);
    }
    
    //Type of Policy
    var groupPolicyType = '';
    if(optionID == 1 || optionID == 2 || optionID == 3){
        objString = $(parentId+'[name=policyType]');//alert($(parentId+'[name=policyType]').is(':checked'))
        if ($(parentId+'[name=policyType]').is(':checked')===true){
            clearError(objString);
            groupPolicyType = $(parentId+'[name=policyType]:checked').val();
        }else {
            addError(objString, 'Please select type of policy');
            flagSubmit = false;
            errorFields += 'city,';
            errorDescriptions += 'Please select type of policy,';
            errorCounts++;
        }
    }
    
    if (flagSubmit) {

        $('.process').show();      
        var gaClientId = getGACId('UA-4743078-19');//Live:'UA-4743078-15' //QA: 'UA-4743078-19'
        var GCLID = getGCLId('UA-4743078-19');
        var objCityPin = $(parentId+'#healthsmeCityPincode');
        var investmentTypeId = $.trim($(parentId+'#healthsmeOption option:selected').attr('data-id'));
        //Set local storage value for form
        var postdata = JSON.stringify({Data:{
            tabName: 'healthsme',
            company_name: $.trim($(parentId+'#healthsmeCompanyname').val()),
            insurance_policy_option: $.trim($(parentId+'#healthsmeOption').val()),
            investmentTypeId: $.trim($(parentId+'#healthsmeOption option:selected').attr('data-id')),
            riskCategory: $.trim($(parentId+'#healthsmeIdemnity option:selected').text()),
            riskCategoryId: $.trim($(parentId+'#healthsmeIdemnity option:selected').val()),
            gender:$.trim($(parentId+'#healthsmeGender').val()),
            Name: $.trim($(parentId+'#healthsmeContactPerson').val()),
            MobileNo: $.trim($(parentId+'#healthsmeMobile').val()),
            EmailID: $.trim($(parentId+'#healthsmeEmail').val()),
            City: $.trim(objCityPin.val()),
            CityID: $.trim(objCityPin.attr('data-cityid')),
            state_id: $.trim(objCityPin.attr('data-stateid')),
            pincode: $.trim(objCityPin.attr('data-pincode')),
            gaClientId: gaClientId,
            gCLId:GCLID,
            groupPolicyType: groupPolicyType,
            country: 392,
            countryCode:91
        }});
        //Set pbcjpreqd
        $.ajax({
        url: cjProcessUrl + '?type=setpbcjpreqd',
        type: "POST",
        cache: false,
        data: postdata,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {}});                    
        //Set pbcjpreqd  
        //End
        var leadsource = 'PB';
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            leadsource = 'PBMobile';
        }
        var postdata = JSON.stringify({
            leadSource:leadsource,
            visitLogId: (visitId == 0 ? $('#gaData').attr('data-visit') : visitId),
            utm_term: utmTerm,
            utm_source: utmSource,
            utm_medium: utmMedium,
            utm_campaign: utmCampaign,
            browser: getBrowser(),
            companyName: $.trim($(parentId+'#healthsmeCompanyname').val()),
            insurance_policy_option: $.trim($(parentId+'#healthsmeOption option:selected').text()),
            investmentTypeId: $.trim($(parentId+'#healthsmeOption option:selected').attr('data-id')),
            riskCategory: $.trim($(parentId+'#healthsmeIdemnity option:selected').text()),
            riskCategoryId: $.trim($(parentId+'#healthsmeIdemnity option:selected').val()),
            contactPerson: $.trim($(parentId+'#healthsmeGender').val())+' '+$.trim($(parentId+'#healthsmeContactPerson').val()),
            mobileNo: $.trim($(parentId+'#healthsmeMobile').val()),
            city_id: $.trim(objCityPin.attr('data-cityid')),
            state_id: $.trim(objCityPin.attr('data-stateid')),
            pincode: $.trim(objCityPin.attr('data-pincode')),
            cityName: $.trim(objCityPin.val()),
            emailid: $.trim($(parentId+'#healthsmeEmail').val()),
            request_url: window.location.href,
            gaClientId: gaClientId,
            gCLId:GCLID,
            groupPolicyType: groupPolicyType
        });
        
        
        //console.log(postdata);
        $.ajax({
            url: cjProcessUrl + '?type=healthsme',
            type: "POST",
            cache: false,
            data: postdata,
            contentType: "application/json; charset=utf-8",
            //dataType: "json",
            success: function (data)
            {   data = JSON.parse(data);
                if (data.EnquiryId != '') {
                    
                    //Set PBCID
                    $.ajax({
                    url: cjProcessUrl + '?type=setpbcid',
                    type: "POST",
                    cache: false,
                    data: JSON.stringify({CustId:data.CustomerId,Mob:$.trim($(parentId+'#healthsmeMobile').val())}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function ()
                    {}});                    
                    //Set PBCID  
                    $(parentId+'.process').hide();
                    try{dataLayer.push({'event':'smeLead'})}catch(e){}
                    
                    var optProduct = $.trim($(parentId+'#healthsmeOption').val());
                    optProduct = optProduct.replace(/\s/g,"-");
                    var policyType = (groupPolicyType==1)?'Fresh':'Renewal';
                    
                    var strPath = window.location.pathname;
                    var arrPath =strPath.split('/');                    
                    var pageName = arrPath[arrPath.length-2];

                    if(optionID == 12 || optionID == 15 || optionID == 16 ||  optionID == 17){
                        try{
                            ga('giTrackerObj.set', 'dimension1', data.matrixLeadId);
                            ga('giTrackerObj.send', 'event', 'Lead', optProduct, data.matrixLeadId);
                            ga('pbTrackerObj.set', 'dimension1', data.matrixLeadId);
                            ga('pbTrackerObj.send', 'event', 'Lead', optProduct, data.matrixLeadId);

                            ga('giTrackerObj.send','pageview', '/'+optProduct+'/thankyou');
                            ga('giTrackerObj.send', 'event', 'Thank-You', optProduct, data.matrixLeadId);
                            executed: dataLayer.push({'LeadID': data.matrixLeadId});
                            executed: dataLayer.push({'event':'SME-LEAD-CAPTURED'});
                        }catch(e){}
                        $(parentId+'.sme_popup').show().html('<div class="sme_inner"><div class="healthsme-thankyou"><div class="close"></div><div class="heading"><i class="fa fa-check" aria-hidden="true"></i> Thank You!</div><div class="box"><p>Thank you for sharing your details with us.</p><p>Our relationship manager will call you to discuss the details and  guide you along.</p><p>In case you have any query or comments, please contact us at</p><span class="mail"><i class="fa fa-envelope" aria-hidden="true"></i> Contact Us : <a href="mailto:corporateinsurance@policybazaar.com">corporateinsurance@policybazaar.com</a></span></div></div></div>');
                        
                        //$(parentId+'.healthsme-bg.active ').hide();
                    
                    //}else if($.trim($(parentId+'#healthsmeOption').val()) =='Group Health Insurance' && groupPolicyType==2){
                    }  else {
                        try{
                            ga('giTrackerObj.set', 'dimension1', data.matrixLeadId);
                            ga('giTrackerObj.send', 'event', 'Lead', optProduct, data.matrixLeadId);
                            ga('pbTrackerObj.set', 'dimension1', data.matrixLeadId);
                            ga('pbTrackerObj.send', 'event', 'Lead', optProduct, data.matrixLeadId);                        
                            ga('giTrackerObj.send', 'event', 'PreQ1','Group-Health-Insurance', policyType,{'nonInteraction': true});
                            executed: dataLayer.push({'LeadID': data.matrixLeadId});
                            executed: dataLayer.push({'event':'SME-LEAD-CAPTURED'});
                        }catch(e){}
                        
                       
                        GA360(data.matrixLeadId,data.EnquiryId,data.CustomerId,'','fresh');//leadId,enquiryId,customerId,bookingId,policyType
                        GA360FormSubmit('formSubmitSuccess');
                        if (ValidURL(data.returnurl)) {
                        if(optionID == 5 || optionID == 7 || optionID == 8){
                            var cntUrl = data.returnurl;                                                        
                            window.top.location.href = cntUrl.replace('#/?','/firenburglaryinsurance?')+'&iscom=1';
                        }
                        else{
                            window.top.location.href = data.returnurl+'&iscom=1';    
                        }
                    }
                    }
                }else{
                    GA360FormSubmit('formSubmitFailed');
                    $(parentId+'.process').hide();
                }
                //objBtnSubmit.show();
                //data: return data from server
            }
        });
    } else {
        //objBtnSubmit.show();
        userType = $('#gaData').attr('data-user-type');
        GA360FormSubmitError(errorFields,errorDescriptions,errorCounts,userType);
        $(parentId+'.process').hide();
    }
};
//Health SME CJ End

fncSetCountryCode = function () {
    $('.countryCode').text('+' + $(this).val());
    $('.health-bg .mobNumber').val('');
    if ($(this).val() == 91) {
        $('.health-bg .mobNumber').attr({"minlength": "10", "maxlength": "10"});
    } else {
        $('.health-bg .mobNumber').attr({"minlength": "8", "maxlength": "15"});
    }
};
function ValidURL(str) {
    var regex = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
    if (!regex.test(str)) {
        //alert("Please enter valid URL.");
        return false;
    } else {
        return true;
    }
}
function RemoveZeroAtFirst(number)
{
    if (number.charAt(0) == "0") {
        number = number.substring(1);
        RemoveZeroAtFirst(number);
    }
    return number;
}


function ValidURL(str) {
    var regex = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
    if (!regex.test(str)) {
        //alert("Please enter valid URL.");
        return false;
    } else {
        return true;
    }
}
function getSMEFormDataUsingLeadId(strLeadId){
    if (strLeadId){ 
        $.ajax({
            url: cjProcessUrl + '?type=sme-lead-id&leadId='+strLeadId,
            type: "GET",
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.IsSuccess == true) {
                    $('.proceedGray').parent('.input_field.pro').hide();
                    $('.step2HealthDetails').show();
                    var postdata = JSON.stringify({
                        tabName: 'healthsme',
                        company_name: data.CompanyName,
                        insurance_policy_option: '',
                        investmentTypeId: data.InvestmentTypeId,
                        riskCategory: '',
                        riskCategoryId: '',
                        gender:'',
                        contact_person: data.ContactPerson,
                        mobile: data.MobileNo,
                        emailid: data.Email,
                        /*city_name: data.City.CityName,
                        city_id: data.City.CityId,
                        state_id: data.City.StateID,
                        pincode: data.City.PinCode,*/
                        gaClientId: '',
                        gCLId:'',
                        groupPolicyType: '',
                        country: 392,
                        countryCode:91
                    });
                    localStorage.setItem("getLastTab", postdata);
                    fncSetFormValue();//Set default value
                }
            }
        });
    }
}

