$("body").bind("cut copy paste", function(e) {
    return e.preventDefault(), !1
});
var vendorXhr, parentId = ".showForm ",
    utmSource = "",
    utmTerm = "",
    utmMedium = "",
    utmCampaign = "",
    visitId = "",
    objLocalStorage = "",
    jsonItem = {},
    vendorCache = {},
    isMobile = !1,
    deviceType = "",
    prevpage = "",
    productId = "";

function GA360(e, t, a, r, o) {
    try {
        dataLayer.push({
            event: "leadSubmit",
            leadId: e,
            enquiryId: t,
            customerId: a,
            leadType: "",
            bookingId: r,
            policyType: o,
            productId: productId
        })
    } catch (e) {}
}

function GA360MobileOnly(e) {
    try {
        dataLayer.push({
            event: e
        })
    } catch (e) {}
}

function GA360Page(e, t, a) {
    var r = window.location.href.split("/"),
        o = r[r.length - 2];
    o = o.replace(/-/g, " ");
    var n = $("#gaData").attr("data-utm-medium");
    console.log(r.length), lobSection1 = "Health Insurance", "BU" == $("#gaData").attr("data-display-for") ? lobSection2 = "bu-seo" : "article" == $("#gaData").attr("data-display-for") ? lobSection2 = "article-seo" : "provider" == $("#gaData").attr("data-display-for") ? lobSection2 = "provider-seo" : lobSection2 = "bu-seo", lobSection3 = "";
    try {
        if ("" == a) {
            var i = document.referrer.split("/");
            if (i.length > 4) {
                var c = i[i.length - 2];
                a = (c = c.replace(/-/g, " ")) + "/" + n.toLowerCase()
            } else if ("/health-insurance/" == window.location.pathname) a = "health plan/bu";
            else {
                var s = window.location.pathname.split("/"),
                    l = s[s.length - 2];
                a = (l = l.replace(/-/g, " ")) + "/" + n.toLowerCase()
            }
            dataLayer.push({
                event: e,
                operatorType: "guest",
                pageLanguage: "en",
                pageType: "prequote page",
                pageName: o + " " + t,
                lobSection1: lobSection1,
                lobSection2: lobSection2,
                lobSection3: lobSection3,
                prevPage: a,
                flowName: "seo",
                productId: productId
            })
        } else dataLayer.push({
            event: e,
            operatorType: "guest",
            pageLanguage: "en",
            pageType: "prequote page",
            pageName: o + ("" == t ? "/" + n.toLowerCase() : " " + t),
            lobSection1: lobSection1,
            lobSection2: lobSection2,
            lobSection3: lobSection3,
            prevPage: o + " " + a,
            flowName: "seo",
            productId: productId
        })
    } catch (e) {}
}

function GA360FormSubmitError(e, t, a, r) {
    try {
        dataLayer.push({
            event: "formSubmit",
            operatorType: r,
            errorField: e.replace(/,+$/, ""),
            errorDescription: t.replace(/,+$/, ""),
            errorCounts: a,
            productId: productId
        })
    } catch (e) {}
}

function GA360FormSubmit(e) {
    try {
        var t = $("#gaData").attr("data-utm-medium"),
            a = window.location.pathname.split("/"),
            r = a[a.length - 2];
        r = r.replace(/-/g, " "), ctaName = r + "/" + t.toLowerCase(), dataLayer.push({
            event: e,
            ctaName: ctaName,
            productId: productId
        })
    } catch (e) {}
}

function checkNRICustomer(e) {
    $.ajax({
        url: "https://termcjapi.policybazaar.com/api/v1/maxmind/country",
        dataType: "json",
        success: function(t) {
            var a = t.countryName;
            void 0 !== a && "null" != a && "india" == a.toLowerCase() && (e > 0 ? (disCallScheduleForm(e), /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && ($(".fix_btn_ctc").parent().addClass("callshow"), $(".fix_btn_ctc").show())) : /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && ($(".fix_btn_ctc").parent().addClass("callshow"), $(".fix_btn_ctc").attr("href", "tel:18004197715").show().removeClass("fix_btn_ctc")))
        }
    })
}

function ajaxCall(e, t, a) {
    $.ajax({
        url: e,
        type: "POST",
        cache: !1,
        data: t,
        contentType: "application/json; charset=utf-8",
        success: function(e) {
            $(a).html(e).show()
        }
    })
}

function disCallScheduleForm(e) {
    var t;
    t = $("#gaData").attr("data-splitvar");
    var a = (new Date).getHours();
    if (console.log(a), a >= 21 || a < 9) {
        ajaxCall(cjProcessUrlHealth + "?type=call_schedule&splitvar=" + t + "&lid=" + e, "", ".disCallSchedule");
        try {
            var r = "variantTwo" == t ? 1 : 0;
            dataLayer.push({
                event: "eventTracking",
                eventCategory: "H_BUPage_CallSchedule",
                eventAction: "CallScheduleViewed",
                eventLabel: e,
                leadId: e,
                eventValue: r,
                nonInteraction: !1
            })
        } catch (e) {}
    }
}

function gaDataLayerEventPush(e, t, a) {
    "" == a && (a = $("#gaData").attr("data-display-for")), "Health Insurance Hansel CTC" == e ? dataLayer.push({
        event: "eventTracking",
        eventCategory: e,
        eventAction: a,
        eventLabel: t,
        noninteraction: !0
    }) : dataLayer.push({
        event: "eventTracking",
        eventCategory: e,
        eventAction: a,
        eventLabel: t
    })
}

function healthCTCClick() {
    var e = "PB";
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && (e = "PBMOBILE"), $.ajax({
        url: cjProcessUrlHealth + "?type=health_connect_ctc&leadsource=" + e,
        type: "get",
        cache: !1,
        contentType: "application/json; charset=utf-8",
        success: function(e) {
            1 == (e = JSON.parse(e)).CTCConnectCallResult && $.ajax({
                url: cjProcessUrlHealth + "?type=getpbcid",
                type: "get",
                cache: !1,
                contentType: "application/json; charset=utf-8",
                success: function(e) {
                    "" != e && gaDataLayerEventPush("Health Insurance Hansel CTC", e.split(":")[0], "CTC Triggered")
                }
            })
        }
    })
}

function ChangeBrowserHistoryUrl(e) {}

function getPBCJD() {
    $.ajax({
        url: cjProcessUrlHealth + "?type=getpbcjpreqd",
        type: "GET",
        cache: !1,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(e) {
            "" != e && "health" == e.Data.tabName && (objLocalStorage.step1.keyvalue = jsEncode.encode(e.Data.MobileNo, "123"), objLocalStorage.step2.name = e.Data.Name, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage)), $(parentId + "#txtName").val(e.Data.Name), $(parentId + "#txtName").parents(".input_box").addClass("input_success"))
        },
        error: function(e, t) {}
    })
}
$(document).ready(function() {
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && (isMobile = !0), deviceType = getMobileOperatingSystem();
    var e = {
        apollo: "insurance-companies/apollo-munich-health-insurance/",
        baxa: "insurance-companies/bharti-axa-health-insurance/",
        Bajaj: "insurance-companies/bajaj-allianz-health-insurance/",
        cigna: "insurance-companies/cigna-ttk-health-insurance/",
        "HDFC-ERGO": "insurance-companies/hdfc-ergo-health-insurance/",
        "Max-Bupa": "insurance-companies/max-bupa-health-insurance/",
        religare: "insurance-companies/religare-health-insurance/",
        "star-health": "insurance-companies/star-health-insurance/",
        iffco: "insurance-companies/iffco-tokio-health-insurance/",
        liberty: "insurance-companies/liberty-videocon-health-insurance/",
        royal: "insurance-companies/royal-sundaram-health-insurance/",
        "Future Generali": "insurance-companies/future-generali-health-insurance/",
        oriental: "insurance-companies/oriental-health-insurance/",
        "universal Sompo": "insurance-companies/universal-sompo-health-insurance/",
        national: "insurance-companies/national-health-insurance/",
        relianceGeneral: "insurance-companies/reliance-health-insurance/",
        United: "insurance-companies/united-india-health-insurance/",
        lic: "insurance-companies/lic-life-insurance-jeevan-arogya/",
        sbilife: "insurance-companies/sbi-general-health-insurance/"
    };
    $(document).on("click", ".bannerhealthredirect", function(e) {
        var t = $("img", $(this)).attr("data-title"),
            a = $("#gaData").attr("data-display-for");
        try {
            gaDataLayerEventPush("contextual_banners", t, "health insurance")
        } catch (e) {}
        window.open("https://health.policybazaar.com?iscom=1&pb_source=organic&pb_campaign=contextual_banners&pb_medium=" + a + "&pb_term=" + t, "_blank")
    }), isMobile && setTimeout(function() {
        fncSetFormValue()
    }, 1e3);
    try {
        $(window).scroll(function() {
            if (isMobile) var e = $("#policybazaar").offset().top + 200,
                t = $("#slideshow-inner,.pbTestimonials").offset().top,
                a = 0 == document.body.scrollTop ? $("html, body").scrollTop() : document.body.scrollTop;
            else e = $(".healthCj_form").offset().top, t = $("#common_footer,.pbTestimonials").offset().top, a = $("html,body").scrollTop();
            a > e && a < t ? ($(".stickFooter_info").show(), $(".callbuttonsticky").addClass("slideIn")) : ($(".stickFooter_info").hide(), $(".callbuttonsticky").removeClass("slideIn"))
        })
    } catch (e) {}
    $(document).on("click", "#productPartner a", function() {
        var t = $.trim($(this).text());
        window.location.href = ROOTURL + e[t]
    });
    try {
        $(".language_selector").show(), $(".stepheading").removeClass("headingHide").show()
    } catch (e) {}
    try {
        $("#pageBody").attr("class").replace("_bg", ""), $(".tabs_h4.accordionHeader + div").hide(), $(".tabs_h4.accordionHeader").click(function() {
            $(this).hasClass("active") ? ($(this).next("div").hide(), $(this).removeClass("active")) : ($(this).next("div").show(), $(this).next("div#pbNews").show(), $(this).addClass("active"))
        })
    } catch (e) {}
    var t = $("#gaData");
    utmTerm = t.attr("data-utm-term"), utmSource = t.attr("data-utm-source"), utmMedium = t.attr("data-utm-medium"), utmCampaign = t.attr("data-utm-campaign"), visitId = t.attr("data-visit"), productId = t.attr("data-pid"), $(document).on("click", ".form_pagination ul li.active", fncStep), $(document).on("change", ".add_members", selectMore_member), $(document).on("click", ".check_btn", remove_selectMore_member), $(document).on("click", ".down_count", childCount), $(document).on("click", ".up_count", childCount), isMobile && $(".ac-container").show(), $(document).on("keyup", ".mobNumber", fncCheckMobileMaxlength), $(document).on("blur", ".mobNumber", fncCheckMobileMaxlength), $(document).on("click", "#btnHealthStep1,.btnHealthStep1", fncProcessHealthStep1), $(document).on("click", ".stickFooter_info .healthBtnSubmit", fncProcessHealthSticky), $(document).on("blur", "#txtName", function() {
        var e = $(parentId + "#txtName"),
            t = e.val();
        e.val($.trim(t.replace(/\s+/g, " ")))
    }), $(document).on("keyup", "#txtName", checkName), $(document).on("focus", ".healthCityPincode", fncGetPopularCity), $(document).on("click touchstart", ".closepopularcity", function() {
        $(parentId + ".popularCity").hide(), $(this).hide()
    }), $(document).on("click", ".popularCity li", fncSelectPopularCity), $(document).on("keyup", ".healthCityPincode", fncGetCity), $(document).on("click", "#btnHealthStep2", fncProcessHealthStep2), $("#step_3 .chkMember").keypress(function(e) {
        13 == (e.keyCode ? e.keyCode : e.which) && $("#btnHealthStep3").trigger("click"), e.stopPropagation()
    }), $(document).on("click", "#step_3 .chkMember", function() {
        var e = $.trim($(this).val()),
            t = 0,
            a = 0;
        if ($(this).parents(".form_field").toggleClass("checked"), $("#step_3 .errCheckMember").text(""), $(".counter.childSon").parents(".form_field.child").hasClass("checked") ? t = parseInt($(".counter.childSon").val()) : ($(".counter.childSon").val(1), t = 0), $(".counter.childDaughter").parents(".form_field.child").hasClass("checked") ? a = parseInt($(".counter.childDaughter").val()) : ($(".counter.childDaughter").val(1), a = 0), t + a >= 5) {
            var r = $(parentId + '.chkMember[value="' + e + '"]');
            r.parents(".form_field").removeClass("checked"), r.prop("checked", !1), $("#step_3 .errCheckMember").text("Bạn chỉ có thể mua tối đa cho 4 con")
        }
    }), $(document).on("click", "#btnHealthStep3", fncProcessHealthStep3), $(document).on("click", "#step_4 .check_btn", function() {
        $(this).parents(".form_field").toggleClass("checked")
    }), $(document).on("click", "#btnHealthStep4", fncProcessHealthStep4), $(document).on("click", "#step_4 .chkMemberStep4", function() {
        $(".errMemberAge").text("");
        var e = $.trim($(".info", $(this).parents(".form_field")).text());
        if (1 == $(this).prop("checked"))
            if ($(".chkMemberAge", $(this).parents(".form_field")).prop("disabled", !1), "Son" != e && "Daughter" != e) objLocalStorage.step3.member[e] = 1;
            else {
                var t = parseInt(objLocalStorage.step3.member[e]);
                isNaN(t) ? t = 1 : t += 1, objLocalStorage.step3.member[e] = t
            } else if ($(".chkMemberAge", $(this).parents(".form_field")).attr("disabled", "disabled").val(""), $(".err", $(this).parents(".form_field")).hide(), "Son" == e || "Daughter" == e) {
            t = parseInt(objLocalStorage.step3.member[e]);
            isNaN(t) ? t = 0 : t -= 1, 0 == t ? delete objLocalStorage.step3.member[e] : objLocalStorage.step3.member[e] = t
        } else delete objLocalStorage.step3.member[e];
        localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
    }), $(document).on("change", ".chkMemberAge", function() {
        "" == $(this).val() ? $(this).addClass("change_font_color") : $(this).removeClass("change_font_color")
    }), $(document).on("click", ".btnCheckPremium", function() {
        try {
            gaDataLayerEventPush("Health Insurance", $(this).attr("data-planname"), "Check-Premium")
        } catch (e) {}
        fncCheckPremium()
    }), $(document).on("click", ".btnViewQuotesMobile", function() {
        gaDataLayerEventPush("Health Insurance", "Mobile-View-Instant-Quotes", $("#healthStepCJ").attr("data-item-title")), fncCheckPremium()
    }), $(document).on("click", ".closeHealthFloatingLeadForm", function() {
        $("body").css("overflow", "auto"), $(".floatingLeadFormWrapper").css("visibility", "hidden"), $(parentId + ".closepopularcity").hide(), $(parentId + ".popularCity").hide()
    }), setTimeout(function() {
        try {
            $.ajax({
                url: cjProcessUrlHealth + "?type=health_ctc",
                type: "get",
                cache: !1,
                contentType: "application/json; charset=utf-8",
                success: function(e) {
                    console.log(e), "success" == (e = JSON.parse(e)).msg ? (gaDataLayerEventPush("Health Insurance Hansel CTC", e.cid, "Lead Created"), checkNRICustomer(e.lid)) : (checkNRICustomer(0), gaDataLayerEventPush("Health Insurance Hansel CTC", e.cid, "Lead Not Created"))
                }
            })
        } catch (e) {}
    }, 2e3), $(document).on("click", "#system-message a.close", function() {
        $("#system-message-container").hide()
    }), $(document).on("click", 'input[name="time-slot"]', fncSetCallSchedule), /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && $(document).on("click", ".viewplanbutton", function() {
        dataLayer.push({
            event: "eventTracking",
            eventCategory: "H_SEOBUPage",
            eventAction: "Sticky_ViewPlansClicked",
            eventLabel: "",
            noninteraction: !1
        }), window.location = "https://health.policybazaar.com/?iscome=1&pb_campaign=sticky_form&pb_medium=BU"
    })
}), fncSetCallSchedule = function() {
    var e = "PB";
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && (e = "PBMOBILE");
    var t = $(".date-slot-schedule").attr("lid"),
        a = $(this).val(),
        r = $('input[name="date-slot"]:checked').val(),
        o = JSON.stringify({
            LeadSource: e,
            pickTime: a,
            pickDate: r
        });
    try {
        var n = "variantTwo" == $("#gaData").attr("data-splitvar") ? 1 : 0;
        dataLayer.push({
            event: "eventTracking",
            eventCategory: "H_BUPage_CallSchedule",
            eventAction: "TimeSlotClicked",
            eventLabel: r + " " + a,
            leadId: t,
            eventValue: n,
            nonInteraction: !0
        })
    } catch (e) {}
    ajaxCall(cjProcessUrlHealth + "?type=set_call_schedule", o, ".disCallSchedule")
}, fncCheckNumberOnly = function() {
    var e, t = "";
    t = $(parentId + ".mobNumber"), onlyNumber(e = $.trim(t.val())) ? validmobile(e) && (clearError(t), t.parents(".input_box").addClass("input_success")) : t.val("")
};
var jsEncode = {
    encode: function(e, t) {
        var a = "";
        e.toString();
        for (var r = 0; r < e.length; r++) {
            var o = e.charCodeAt(r) ^ t;
            a += String.fromCharCode(o)
        }
        return a
    }
};
try {
    var slideIndex = 1;

    function plusSlides(e) {
        showSlides(slideIndex += e)
    }

    function showSlides(e) {
        var t, a = document.getElementsByClassName("mySlides");
        for (e > a.length && (slideIndex = 1), e < 1 && (slideIndex = a.length), t = 0; t < a.length; t++) a[t].style.display = "none";
        a[slideIndex - 1].style.display = "block"
    }
    showSlides(slideIndex)
} catch (e) {}

function selectMore_member() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ";
    var e = $("option:selected", $(this)).val();
    if ("#health_provider" == $.trim(parentId)) var t = '<div class="memberChkBoxes form_field checked moreMember"><label class="check_btn info"><input type="checkbox" class="chkMember" value="' + e + '" id="' + e + '" checked /><span>' + e + "</span></label></div>";
    else t = '<div class="form_field clearfix checked moreMember"><label class="info" for="' + e + '">' + e + '</label><div class="check_btn"><input type="checkbox" class="chkMember" value="' + e + '" checked id="' + e + '"><span class="checkmark"></span></div></div>';
    $("option:selected", this).prop("disabled", "disabled"), $(this).prop("selectedIndex", 0), $("option:disabled", this).length > 5 && $(parentId + ".add_members").parent(".add_more").hide();
    var a = $(parentId + "#step_3 .details_field .form_field").length - 1;
    $(parentId + "#step_3 .details_field .form_field:nth-child(" + a + ")").after(t), $("#btnHealthStep3").focus()
}

function remove_selectMore_member() {
    var e = $(this).parent(".moreMember"),
        t = $("input", e).val();
    e.remove(), $(parentId + '.add_members option[value="' + t + '"]').prop("disabled", !1), $(parentId + ".add_members").prop("selectedIndex", 0), $(parentId + ".add_members").parent(".add_more").show()
}

function ageOptionCreate(e, t, a, r, o) {
    for (var n = '<option value="">Ngày</option>', i = 1; i <= 31; i++) n += ("Son" == e || "Daughter" == e) && 0 == i ? o ? "<option value=" + i + " " + (i == r ? "selected" : "") + ">3 Months - 12 Months</option>" : "<option value=" + i + ">3 Months - 12 Months</option>" : "<option value=" + i + " " + (i == r ? "selected" : "") + ">" + i + " </option>";
    return n
}

function bgeOptionCreate(e, t, a, r, o) {
    for (var n = '<option value="">Tháng</option>', i = 1; i <= 12; i++) n += ("Son" == e || "Daughter" == e) && 0 == i ? o ? "<option value=" + i + " " + (i == r ? "selected" : "") + ">3 Months - 12 Months</option>" : "<option value=" + i + ">3 Months - 12 Months</option>" : "<option value=" + i + " " + (i == r ? "selected" : "") + ">" + i + " </option>";
    return n
}

function cgeOptionCreate(e, t, a, r, o) {
    for (var n = '<option value="">Năm</option>', i = 1953; i <= 2020; i++) n += ("Son" == e || "Daughter" == e) && 0 == i ? o ? "<option value=" + i + " " + (i == r ? "selected" : "") + ">3 Months - 12 Months</option>" : "<option value=" + i + ">3 Months - 12 Months</option>" : "<option value=" + i + " " + (i == r ? "selected" : "") + ">" + i + " </option>";
    return n
}

function childCount() {
    var e = 0,
        t = 0,
        a = 0,
        r = 4,
        o = 0;
    if ($(".counter.childSon").parents(".form_field.child").hasClass("checked") && (t = parseInt($(".counter.childSon").val())), $(".counter.childDaughter").parents(".form_field.child").hasClass("checked") && (a = parseInt($(".counter.childDaughter").val())), 0 != t && 0 != a || (r += 1), o = e = t + a, $(this).hasClass("up_count") ? o += 1 : $(this).hasClass("down_count") && (o -= 1), 4 != e && e < r && $(this).hasClass("up_count")) {
        var n = $(".counter", $(this).parents(".form_field.child")),
            i = parseInt(n.val());
        i += 1, e += 1, n.val(i);
        var c = $.trim($(".info", $(this).parents(".form_field.child")).text());
        $.isEmptyObject(objLocalStorage.step3) || (objLocalStorage.step3.member[c] = i, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage)))
    }
    c = $.trim($(".info", $(this).parents(".form_field.child")).text());
    var s = $(".counter.child" + c, $(this).parents(".form_field.child"));
    if ((n = parseInt(s.val())) > 1 && e <= r && $(this).hasClass("down_count")) {
        n -= 1, e -= 1, s.val(n);
        c = $(".info", $(this).parents(".form_field.child")).text();
        $.isEmptyObject(objLocalStorage.step3) || (objLocalStorage.step3.member[c] = n, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage)))
    }
    o > 4 ? $("#step_3 .errCheckMember").text("You can add maximum 4 child") : $("#step_3 .errCheckMember").text("")
}

function onlyNumber(e) {
    return /^[0-9]*$/.test(e)
}

function validmobile(e) {
    return /^[6789]\d{9}$/.test(e)
}

function onlycharacter(e) {
    return /^[a-zA-Z\s]+$/.test(e)
}

function checkOnlyNumber(e) {
    return /^[0-9]*$/.test(e)
}

function addError(e, t) {
    var a = e.parents(".form-field-data");
    return e.addClass("error"), a.addClass("error"), $(".err", a).html(t), !1
}

function clearError(e) {
    var t = e.parents(".form-field-data");
    e.removeClass("error"), t.removeClass("error"), $(".err", t).html("")
}

function getGACId(e) {
    var t = "false";
    try {
        for (var a = ga.getAll(), r = 0; r < a.length; ++r) {
            var o = a[r];
            o.get("trackingId") == e && (t = o.get("clientId"))
        }
    } catch (e) {}
    return t
}

function getBrowser() {
    var e = window.navigator.userAgent,
        t = {
            chrome: /chrome/i,
            safari: /safari/i,
            firefox: /firefox/i,
            ie: /internet explorer/i
        };
    for (var a in t)
        if (t[a].test(e)) return a;
    return "unknown"
}
var Base64 = {
    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
    encode: function(e) {
        var t, a, r, o, n, i, c, s = "",
            l = 0;
        for (e = Base64._utf8_encode(e); l < e.length;) o = (t = e.charCodeAt(l++)) >> 2, n = (3 & t) << 4 | (a = e.charCodeAt(l++)) >> 4, i = (15 & a) << 2 | (r = e.charCodeAt(l++)) >> 6, c = 63 & r, isNaN(a) ? i = c = 64 : isNaN(r) && (c = 64), s = s + this._keyStr.charAt(o) + this._keyStr.charAt(n) + this._keyStr.charAt(i) + this._keyStr.charAt(c);
        return s
    },
    decode: function(e) {
        var t, a, r, o, n, i, c = "",
            s = 0;
        for (e = e.replace(/[^A-Za-z0-9+\/=]/g, ""); s < e.length;) t = this._keyStr.indexOf(e.charAt(s++)) << 2 | (o = this._keyStr.indexOf(e.charAt(s++))) >> 4, a = (15 & o) << 4 | (n = this._keyStr.indexOf(e.charAt(s++))) >> 2, r = (3 & n) << 6 | (i = this._keyStr.indexOf(e.charAt(s++))), c += String.fromCharCode(t), 64 != n && (c += String.fromCharCode(a)), 64 != i && (c += String.fromCharCode(r));
        return c = Base64._utf8_decode(c)
    },
    _utf8_encode: function(e) {
        e = e.replace(/rn/g, "n");
        for (var t = "", a = 0; a < e.length; a++) {
            var r = e.charCodeAt(a);
            r < 128 ? t += String.fromCharCode(r) : r > 127 && r < 2048 ? (t += String.fromCharCode(r >> 6 | 192), t += String.fromCharCode(63 & r | 128)) : (t += String.fromCharCode(r >> 12 | 224), t += String.fromCharCode(r >> 6 & 63 | 128), t += String.fromCharCode(63 & r | 128))
        }
        return t
    },
    _utf8_decode: function(e) {
        for (var t = "", a = 0, r = c1 = c2 = 0; a < e.length;)(r = e.charCodeAt(a)) < 128 ? (t += String.fromCharCode(r), a++) : r > 191 && r < 224 ? (c2 = e.charCodeAt(a + 1), t += String.fromCharCode((31 & r) << 6 | 63 & c2), a += 2) : (c2 = e.charCodeAt(a + 1), c3 = e.charCodeAt(a + 2), t += String.fromCharCode((15 & r) << 12 | (63 & c2) << 6 | 63 & c3), a += 3);
        return t
    }
};

function checkMobileNumber() {
    var e, t = "",
        a = !0,
        r = "",
        o = "",
        n = 0,
        i = $(parentId + ".mobNumber").attr("data-country-std-code");
    t = $(parentId + ".mobNumber");
    var c = $(parentId + ".mobNumber").attr("minlength"),
        s = $(parentId + ".mobNumber").attr("maxlength");
    return 0 === (e = $.trim(t.val())).length ? (addError(t, "Làm ơn nhập số điện thoại"), a = !1, r += "mobile,", o += "Please enter mobile number,", n++) : e.length < c || e.length > s ? (addError(t, "Làm ơn nhập số điện thoại"), a = !1, r += "mobile,", o += "Please enter valid mobile number,", n++) : ("91" != i || validmobile(e)) && onlyNumber(e) ? (clearError(t), t.parents(".input_box").addClass("input_success")) : (addError(t, "Please enter valid mobile number"), a = !1, r += "mobile,", o += "Please enter valid mobile number,", n++), a || (t.parents(".input_box").removeClass("input_success"), userType = $("#gaData").attr("data-user-type"), "keyup" != event.type && GA360FormSubmitError(r, o, n, userType)), a
}

function checkName() {
    var e, t = "",
        a = !0;
    return t = $(parentId + "#txtName"), 0 === (e = $.trim(t.val())).length ? (t.val(""), addError(t, "Làm ơn nhập họ và tên"), a = !1) : onlycharacter(e) ? (clearError(t), t.parents(".input_box").addClass("input_success")) : $(this).parents(".input_box").removeClass("input_success"), a
}

function getMobileOperatingSystem() {
    var e = navigator.userAgent || navigator.vendor || window.opera;
    return /windows phone/i.test(e) ? "Windows Phone" : /android/i.test(e) ? "Android" : /iPad|iPhone|iPod/.test(e) && !window.MSStream ? "iOS" : "unknown"
}

function fncGetFormInPage(e, t, a) {
    var r = $(".showForm"),
        o = window.location.href.indexOf("/hi");
    language = o > -1 ? "hi" : "en";
    var n = window.location.href.split("/"),
        i = n[n.length - 2];
    $.ajax({
        url: cjFormContentUrlHealth + "?type=" + e + "&language=" + language + "&pagename=" + i + "&bimage=" + a,
        type: "GET",
        cache: !0,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(e) {
            $.each(r, function(t, a) {
                var r = "#" + $(this).attr("id") + " ";
                $(r + ".user_details, " + r + ".rightContent").html(e.contentRight)
            }), setTimeout(function() {
                fncSetFormValue()
            }, 1e3)
        }
    })
}

function footerStickyClick(e) {
    try {
        ga("healthTrackerObj.send", "event", "Health Bu Page", "sticky cta", visitId)
    } catch (e) {}
    $("html, body").animate({
        scrollTop: 0
    }, 300)
}

function makeComplete(e) {
    var t;
    for (t = 1; t <= e; t++) $(parentId + ".form_pagination ul li.step_" + t).addClass("complete")
}
fncStep = function() {
    $(parentId + ".form_pagination ul li").removeClass("active").removeClass("complete"), $(parentId + ".form_step").removeClass("form_open");
    var e, t = $(this).text();
    if (objLocalStorage.currStep = parseInt(t), localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage)), GA360Page("virtualPage", 1 == t ? "" : " Step " + t, prevpage), 1 == t) try {
        $(".language_selector").show(), isMobile && $(".ac-container").show(), $(".stepheading").removeClass("headingHide").show()
    } catch (e) {}
    if (3 == t)
        if (localStorage.getItem("getTabHealth")) {
            if (!$.isEmptyObject(objLocalStorage.step3)) {
                $("#step_3 .form_field").removeClass("checked"), $("#step_3 .chkMember").prop("checked", !1), $(".moreMember").remove(), $(parentId + ".add_members option").prop("disabled", !1);
                var a = 0;
                $.each(objLocalStorage.step3.member, function(e, t) {
                    var r = $(parentId + '.chkMember[value="' + e + '"]');
                    if ("Son" != e && "Daughter" != e || isNaN(t) || $(".counter", r.parents(".form_field")).val(t), "Self" != e && "Spouse" != e && "Son" != e && "Daughter" != e) {
                        a += 1;
                        var o = "";
                        o = "#health_provider" == $.trim(parentId) ? '<div class="memberChkBoxes form_field checked moreMember"><label class="check_btn info"><input type="checkbox" class="chkMember" value="' + e + '" id="' + e + '" checked=""><span>' + e + "</span></label></div>" : '<div class="form_field clearfix checked moreMember"><label class="info" for="' + e + '">' + e + '</label><div class="check_btn"><input type="checkbox" class="chkMember" value="' + e + '" id="' + e + '" checked><span class="checkmark"></span></div></div>', $(parentId + '.add_members option[value="' + e + '"]').prop("disabled", "disabled");
                        var n = $("#step_3 .details_field .form_field").length - 1;
                        $("#step_3 .details_field .form_field:nth-child(" + n + ")").after(o)
                    }
                    r.parents(".form_field").addClass("checked"), r.prop("checked", "checked")
                }), 6 == a && $(parentId + ".add_members").parent(".add_more").hide()
            }
        } else;
    for (e = 1; e <= t; e++) $(parentId + ".form_pagination ul li.step_" + e).addClass("active"), e < t && $(parentId + ".form_pagination ul li.step_" + e).addClass("complete");
    $(parentId + "#step_" + t).addClass("form_open"), ChangeBrowserHistoryUrl(t)
}, fncCheckMobileMaxlength = function(e) {
    var t = !0,
        a = e.keyCode ? e.keyCode : e.which;
    return $(this).val().match(/^\d+$/) ? $(".mobNumber").val($(this).val()) : ($(this).val(""), t = !0), !checkMobileNumber() && t && (t = !1), t ? "13" == a && $("#btnHealthStep1").trigger("click") : $(this).parents(".input_box").removeClass("input_success"), t
}, fncProcessHealthSticky = function() {
    try {
        gaDataLayerEventPush("Health Insurance", utmMedium, "Health Sticky")
    } catch (e) {}
}, fncProcessHealthStep1 = function() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ", $(parentId + " .err").html(""), isMobile && $(".ac-container").show();
    var e = window.location.href.indexOf("landingpage/health");
    if (e > -1 && (void 0 !== utmSource && "offlineaffiliate" != $.trim(utmSource.toLowerCase()) || "" == utmTerm || "" == utmMedium || "" == utmCampaign)) alert("UTM Tags are missing");
    else {
        if ("#health_provider " == parentId) var t = $(parentId + ".btnHealthStep1"),
            a = $(parentId + ".loadingDivStep1");
        else t = $(parentId + "#btnHealthStep1"), a = $(parentId + "#loadingDivStep1");
        t.hide(), a.show();
        var r = "",
            o = "";
        if (checkMobileNumber()) {
            GA360Page("virtualPage", " Step 2", prevpage = ""), r = $(parentId + ".mobNumber"), o = $.trim(r.val());
            try {
                localStorage.getItem("getTabHealth") && ($.isEmptyObject(objLocalStorage.step2) || ($(parentId + 'input[name="radio-group-gender"][value="' + objLocalStorage.step2.gender + '"]').attr("checked", "checked"), $(parentId + "#txtName").val(objLocalStorage.step2.name), $(parentId + "#txtName").parents(".input_box").addClass("input_success"), void 0 !== objLocalStorage.step2.city && ($(parentId + ".healthCityPincode").val(objLocalStorage.step2.city), $(parentId + ".healthCityPincode").attr("data-cityid", objLocalStorage.step2.cityid), $(parentId + ".healthCityPincode").attr("data-stateid", objLocalStorage.step2.stateid), $(parentId + ".healthCityPincode").attr("data-pincode", objLocalStorage.step2.pincode), $(parentId + ".healthCityPincode").parents(".input_box").addClass("input_success"))))
            } catch (e) {}
            "#health_provider " == parentId && ($("body").css("overflow", "hidden"), $(parentId + "#popupForm").css("visibility", "visible"), $(parentId + ".mobNumber").val(o)), isMobile && $(".ac-container").hide();
            var n = parseInt(t.attr("data-step"));
            makeComplete(n), (n += 1) < 5 && ($(parentId + ".form_step").removeClass("form_open"), $(parentId + ".form_pagination ul li.step_" + n).addClass("active"), $(parentId + "#step_" + n).addClass("form_open"), $("#step_2 .error").removeClass("error"), ChangeBrowserHistoryUrl(n)), $(".language_selector").hide(), $(".stepheading").addClass("headingHide").hide();
            try {
                objLocalStorage.step1.keyvalue = jsEncode.encode(o, "123"), localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
            } catch (e) {}
            a.hide(), t.show(), -1 == e && fncHealthLeadCreate(), $("nav").removeClass("fixedh")
        } else a.hide(), t.show()
    }
}, fncHealthLeadCreate = function() {
    var e = $.trim($(parentId + ".mobNumber").attr("data-country-std-code")),
        t = $.trim($(parentId + ".mobNumber").val()),
        a = $.trim(utmSource),
        r = $.trim(utmTerm),
        o = $.trim(utmMedium),
        n = $.trim(utmCampaign),
        i = $.trim($(location).attr("href"));
    if (0 !== t.length && 10 === t.length && "91" == e) {
        var c = "PB";
        /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && (c = "PBMOBILE");
        var s = JSON.stringify({
            CountryCode: e,
            MobileNo: t,
            UtmSource: a,
            UtmTerm: r,
            UtmMedium: o,
            UtmCampaign: n,
            Page: i,
            LeadSource: c
        });

    }
}, fncGetPopularCity = function() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ", 0 == $(parentId + ".healthCityPincode").val().length && ($(parentId + ".healthCityPincode").parents(".input_box").removeClass("input_success"), 
        function() {
            e  = [
                {
                   "AliasCity":null,
                   "CityId":551,
                   "CityName":"Delhi(Delhi)",
                   "CityNameOnly":"Delhi",
                   "Pincode":110001,
                   "StateId":35,
                   "StateName":"Delhi",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":207,
                   "CityName":"Bengaluru(Karnataka)",
                   "CityNameOnly":"Bengaluru",
                   "Pincode":560001,
                   "StateId":16,
                   "StateName":"Karnataka",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":302,
                   "CityName":"Mumbai(Maharashtra)",
                   "CityNameOnly":"Mumbai",
                   "Pincode":400001,
                   "StateId":20,
                   "StateName":"Maharashtra",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":309,
                   "CityName":"Pune(Maharashtra)",
                   "CityNameOnly":"Pune",
                   "Pincode":410301,
                   "StateId":20,
                   "StateName":"Maharashtra",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":316,
                   "CityName":"Thane(Maharashtra)",
                   "CityNameOnly":"Thane",
                   "Pincode":400601,
                   "StateId":20,
                   "StateName":"Maharashtra",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":555,
                   "CityName":"Gurgaon(NCR)",
                   "CityNameOnly":"Gurgaon",
                   "Pincode":122001,
                   "StateId":36,
                   "StateName":"NCR",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":837,
                   "CityName":"Hyderabad(Telangana)",
                   "CityNameOnly":"Hyderabad",
                   "Pincode":500003,
                   "StateId":37,
                   "StateName":"Telangana",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":666,
                   "CityName":"Navi Mumbai(Maharashtra)",
                   "CityNameOnly":"Navi Mumbai",
                   "Pincode":400614,
                   "StateId":20,
                   "StateName":"Maharashtra",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":103,
                   "CityName":"Ahmedabad(Gujarat)",
                   "CityNameOnly":"Ahmedabad",
                   "Pincode":380001,
                   "StateId":11,
                   "StateName":"Gujarat",
                   "TrackingId":0
                },
                {
                   "AliasCity":null,
                   "CityId":554,
                   "CityName":"Ghaziabad(NCR)",
                   "CityNameOnly":"Ghaziabad",
                   "Pincode":201001,
                   "StateId":36,
                   "StateName":"NCR",
                   "TrackingId":0
                }
             ];
            var t = '<li disable="disable">Popular City</li>';
            "" != (e = JSON.parse(e)) && $.each(e, function(e, a) {
                t += '<li data-cityid="' + a.CityId + '" data-stateid="' + a.StateId + '" data-pincode="' + a.Pincode + '">' + a.CityName + "</li>"
            }), "" != t && ($(parentId + ".closepopularcity").show(), $(parentId + ".popularCity").html(t).show())
        }
    )
}, fncSelectPopularCity = function() {
    if (parentId = "#" + $(this).parents(".showForm").attr("id") + " ", "Popular City" != $(this).text()) {
        var e = $(parentId + ".healthCityPincode");
        e.attr({
            "data-cityid": $(this).attr("data-cityid"),
            "data-stateid": $(this).attr("data-stateid"),
            "data-pincode": $(this).attr("data-pincode")
        }), $(parentId + ".closepopularcity").hide(), e.val($(this).text()), $(parentId + ".healthCityPincode").parents(".input_box").addClass("input_success"), $(parentId + ".popularCity").hide(), e.parents(".form-field-data").removeClass("error"), $(".err", e.parents(".form-field-data")).html("")
    }
}, fncGetCity = function() {
    var e = parentId = "#" + $(this).parents(".showForm").attr("id") + " ";
    0 == $(e + ".healthCityPincode").val().length ? ($(e + ".healthCityPincode").parents(".input_box").removeClass("input_success"), fncGetPopularCity()) : $(e + ".popularCity").hide(), $(e + ".healthCityPincode").autocomplete({
        source: function(t, a) {
            var r = t.term.replace(/[^\w\s]/gi, ""),
                o = new RegExp("^" + r, "i"),
                n = "";
            if (checkOnlyNumber(t.term) && 6 == $.trim(t.term).length ? n = "p" : !checkOnlyNumber(t.term) && $.trim(t.term).length >= 3 && (n = "c"), "" != n) {
                if ($(parentId + ".popularCity").hide(), t.term in vendorCache) return void a($.map(vendorCache[t.term], function(e) {
                    if ("p" == n) {
                        if (o.test(e.Pincode)) return e
                    } else if (o.test(e.CityName)) return e
                }));
              
                    vendorCache[t.term] = [
   {
      "AliasCity":null,
      "CityId":551,
      "CityName":"Delhi(Delhi)",
      "CityNameOnly":"Delhi",
      "Pincode":110001,
      "StateId":35,
      "StateName":"Delhi",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":207,
      "CityName":"Bengaluru(Karnataka)",
      "CityNameOnly":"Bengaluru",
      "Pincode":560001,
      "StateId":16,
      "StateName":"Karnataka",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":302,
      "CityName":"Mumbai(Maharashtra)",
      "CityNameOnly":"Mumbai",
      "Pincode":400001,
      "StateId":20,
      "StateName":"Maharashtra",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":309,
      "CityName":"Pune(Maharashtra)",
      "CityNameOnly":"Pune",
      "Pincode":410301,
      "StateId":20,
      "StateName":"Maharashtra",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":316,
      "CityName":"Thane(Maharashtra)",
      "CityNameOnly":"Thane",
      "Pincode":400601,
      "StateId":20,
      "StateName":"Maharashtra",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":555,
      "CityName":"Gurgaon(NCR)",
      "CityNameOnly":"Gurgaon",
      "Pincode":122001,
      "StateId":36,
      "StateName":"NCR",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":837,
      "CityName":"Hyderabad(Telangana)",
      "CityNameOnly":"Hyderabad",
      "Pincode":500003,
      "StateId":37,
      "StateName":"Telangana",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":666,
      "CityName":"Navi Mumbai(Maharashtra)",
      "CityNameOnly":"Navi Mumbai",
      "Pincode":400614,
      "StateId":20,
      "StateName":"Maharashtra",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":103,
      "CityName":"Ahmedabad(Gujarat)",
      "CityNameOnly":"Ahmedabad",
      "Pincode":380001,
      "StateId":11,
      "StateName":"Gujarat",
      "TrackingId":0
   },
   {
      "AliasCity":null,
      "CityId":554,
      "CityName":"Ghaziabad(NCR)",
      "CityNameOnly":"Ghaziabad",
      "Pincode":201001,
      "StateId":36,
      "StateName":"NCR",
      "TrackingId":0
   }
]
               
            } else $(e + ".healthCityPincode").val($.trim(t.term)), $(e + ".healthCityPincode").parents(".input_box").removeClass("input_success")
        },
        minLength: 3,
        autoFocus: !0,
        focus: function(t, a) {
            return t.preventDefault(), $(e + ".healthCityPincode").attr("autocomplete", "healthnewcity"), !1
        },
        select: function(t, a) {
            $(e + ".healthCityPincode").val(a.item.CityName), $(e + ".healthCityPincode").attr({
                "data-cityid": a.item.CityId,
                "data-stateid": a.item.StateId,
                "data-pincode": a.item.Pincode
            }), $(e + ".healthCityPincode").parents(".input_box").addClass("input_success"), $(e + ".healthCityPincode").parents(".form-field-data").removeClass("error"), $(".err", $(e + ".healthCityPincode").parents(".form-field-data")).html(""), $(e + ".closepopularcity").hide();
            try {
                ga("pbTrackerObj.send", "event", "city-filled", "healthCityPincode", "", {
                    nonInteraction: 1
                })
            } catch (e) {}
            return !1
        },
        change: function(t, a) {
            a.item || ($(e + ".healthCityPincode").val(""), $(e + ".healthCityPincode").parents(".input_box").removeClass("input_success"))
        }
    }).autocomplete("instance")._renderItem = function(e, t) {
        return $("<li>").append("<a>" + t.CityName + "</a>").appendTo(e)
    }
}, fncProcessHealthStep2 = function() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ";
    var e = !0,
        t = $(parentId + "#btnHealthStep2");
    t.hide();
    var a = "",
        r = "",
        o = 0,
        n = $(parentId + "#loadingDivStep2");
    n.show();
    var i = $(parentId + 'input[name="radio-group-gender"]:checked').val();
    (e = checkName()) || (a += "name,", r += "Làm ơn nhập họ tên,", o++);
    var c = $(parentId + ".healthCityPincode");
        prevpage = " Step 2", gaDataLayerEventPush("Health Insurance", "Health-Pre-Quote-Step-2", ""), GA360Page("virtualPage", " Step 3", prevpage), prevpage = " Step 3";
        try {
            if (localStorage.getItem("getTabHealth")) {
                if (!$.isEmptyObject(objLocalStorage.step3)) {
                    $(".moreMember").remove(), $(".chkMember").parents(".form_field").removeClass("checked"), $(".chkMember").prop("checked", ""), $(parentId + '#step_3 .chkMember[value="Self"]').parents(".form_field").removeClass("checked");
                    var s = 0;
                    if ($.each(objLocalStorage.step3.member, function(e, t) {
                            var a = $(parentId + '.chkMember[value="' + e + '"]');
                            if ("Son" != e && "Daughter" != e || $(".counter", a.parents(".form_field")).val(t), "Self" != e && "Spouse" != e && "Son" != e && "Daughter" != e) {
                                s += 1;
                                var r = "";
                                r = "#health_provider" == $.trim(parentId) ? '<div class="memberChkBoxes form_field checked moreMember"><label class="check_btn info"><input type="checkbox" class="chkMember" value="' + e + '" id="' + e + '" checked=""><span>' + e + "</span></label></div>" : '<div class="form_field clearfix checked moreMember"><label class="info" for="' + e + '">' + e + '</label><div class="check_btn"><input type="checkbox" class="chkMember" value="' + e + '" id="' + e + '" checked><span class="checkmark"></span></div></div>', $(parentId + '.add_members option[value="' + e + '"]').prop("disabled", "disabled");
                                var o = $("#step_3 .details_field .form_field").length - 1;
                                $("#step_3 .details_field .form_field:nth-child(" + o + ")").after(r)
                            }
                            a.parents(".form_field").addClass("checked"), a.prop("checked", "checked")
                        }), !$.isEmptyObject(objLocalStorage.step3) && void 0 !== objLocalStorage.step3.member) {
                        var l = 0,
                            d = 0;
                        if (void 0 !== objLocalStorage.step3.member.Son && (l = parseInt(objLocalStorage.step3.member.Son)), void 0 !== objLocalStorage.step3.member.Daughter && (d = parseInt(objLocalStorage.step3.member.Daughter)), l > 0 && d > 0) {
                            var h = Math.max(l, d);
                            if (4 == h) {
                                var p = "Son";
                                d == h && (p = "Daughter"), objMemberCheckBox = $(parentId + '.chkMember[value="' + p + '"]'), objMemberCheckBox.parents(".form_field").removeClass("checked"), objMemberCheckBox.prop("checked", !1), delete objLocalStorage.step3.member[p]
                            }
                        }
                    }
                    6 == s && $(parentId + ".add_members").parent(".add_more").hide()
                }
            } else;
        } catch (e) {}
        var m = parseInt(t.attr("data-step"));
        makeComplete(m), (m += 1) < 5 && ($(parentId + ".form_step").removeClass("form_open"), $(parentId + ".form_pagination ul li.step_" + m).addClass("active"), $(parentId + "#step_" + m).addClass("form_open"), $(".errCheckMember").text(""), ChangeBrowserHistoryUrl(m));
        try {
            var u = "";
            u = $(parentId + "#txtName"), objLocalStorage.step2.gender = i, objLocalStorage.step2.name = u.val(), objLocalStorage.step2.city = c.val(), objLocalStorage.step2.cityid = c.attr("data-cityid"), objLocalStorage.step2.stateid = c.attr("data-stateid"), objLocalStorage.step2.pincode = c.attr("data-pincode"), localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
        } catch (e) {}
        n.hide(), t.show()
    
}, fncProcessHealthStep3 = function() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ";
    var e = !0,
        t = "",
        a = "",
        r = 0,
        o = $(parentId + "#btnHealthStep3");
    o.hide();
    var n = $(parentId + "#loadingDivStep3");
    if (n.show(), 0 == $(parentId + ".chkMember:checked").length) $(parentId + ".errCheckMember").text("Please select at least one member").show(), e = !1, t += "members,", a += "Please select at least one member,", r++;
    else if (GA360Page("virtualPage", " Step 4", prevpage = " Step 3"), prevpage = " Step 4", !$(parentId + '.chkMember[value="Son"]').prop("checked") && !$(parentId + '.chkMember[value="Daughter"]').prop("checked") || $(parentId + '.chkMember[value="Self"]').prop("checked") || $(parentId + '.chkMember[value="Spouse"]').prop("checked")) {
        if ($(parentId + '.chkMember[value="Son"]').prop("checked") || $(parentId + '.chkMember[value="Daughter"]').prop("checked")) {
            var i = 0,
                c = 0;
            $(".counter.childSon").parents(".form_field.child").hasClass("checked") ? i = parseInt($(".counter.childSon").val()) : $(".counter.childSon").val(1), $(".counter.childDaughter").parents(".form_field.child").hasClass("checked") ? c = parseInt($(".counter.childDaughter").val()) : $(".counter.childDaughter").val(1), i + c > 4 && ($(parentId + ".errCheckMember").text("Child should not be greater than 4").show(), e = !1, t += "members,", a += "Child should not be greater than 4,", r++)
        }
    } else $(parentId + ".errCheckMember").text("Please select Self or Spouse also").show(), e = !1, t += "members,", a += "Please select Self or Spouse also,", r++;
    if (e) {
        gaDataLayerEventPush("Health Insurance", "Health-Pre-Quote-Step-3", ""), ChangeBrowserHistoryUrl(4);
        try {
            var s = {};
            $("#step_3 .form_field").each(function() {
                if ($(this).hasClass("checked")) {
                    var e = $.trim($(".info", $(this)).text());
                    if ("Son" == e || "Daughter" == e) {
                        var t = $(this);
                        "" == $(".counter", t).val() || isNaN($(".counter", t).val()) || (s[e] = parseInt($(".counter", t).val()))
                    } else s[e] = 1
                }
            }), objLocalStorage.step3.member = s, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
        } catch (e) {}
        var l = "";
        try {
            localStorage.getItem("getTabHealth") && ($.isEmptyObject(objLocalStorage.step4) || (l = objLocalStorage.step4.member))
        } catch (e) {}
        var d = "";
        $.each(s, function(e, t) {
            var a = "";
            if ("Son" == e || "Daughter" == e) {
                if (t > 0) {
                    var r = 24;
                    void 0 !== objLocalStorage.planid && $.trim(objLocalStorage.planid) > 0 && (r = 17, void 0 !== objLocalStorage.childmaxage && $.trim(objLocalStorage.childmaxage) > 0 && (r = objLocalStorage.childmaxage));
                    for (var o = 1; o <= t; o++) a = void 0 === l[e] || void 0 === l[e][o - 1] ? "" : l[e][o - 1], chgfontcolor = void 0 === l[e] || void 0 === l[e][o - 1] ? "change_font_color" : "", isSelect = "" != chgfontcolor ? 0 : 1, "#health_provider" == $.trim(parentId) ? d += '\x3c!-- CheckBoxes --\x3e<div class="memberChkBoxes form_field checked"><label class="info"><input type="checkbox" name="member" class="chkMemberStep4" value="' + e + '" id="' + e + '" checked><span>' + e + '</span></label>\x3c!-- Age Selector --\x3e<div class="ageSelect"><select class="dropdown chkMemberAge ' + chgfontcolor + '">' + ageOptionCreate(e, 0, r, a, isSelect) + '</select></div>\x3c!-- Age Selector --\x3e<div class="err"></div></div>\x3c!-- CheckBoxes --\x3e' : d += '<div class="form_field clearfix checked"><label class="info" for="' + e + '">' + e + '</label><div class="dropdown_list"><select class="dropdown chkMemberAge ' + chgfontcolor + '">' + ageOptionCreate(e, 0, r, a, isSelect) + '</select></div><div class="check_btn"><input type="checkbox" checked="checked" class="chkMemberStep4" value="' + e + '" id="' + e + '"><span class="checkmark"></span></div><div class="err"></div></div>'
                }
            } else {
                var n = 1;
                "Self" == e || "Spouse" == e ? n = 18 : "Grand Father" != e && "Grand Mother" != e || (n = 54), a = void 0 === l[e] ? "" : l[e], "#health_provider" == $.trim(parentId) ? d += '\x3c!-- CheckBoxes --\x3e<div class="memberChkBoxes form_field checked"><label class="info"><input type="checkbox" name="member" class="chkMemberStep4" value="' + e + '" id="' + e + '" checked><span>' + e + '</span></label>\x3c!-- Age Selector --\x3e<div class="ageSelect"><select class="dropdown chkMemberAge  ' + ("" == a ? "change_font_color" : "") + '">' + ageOptionCreate(e, n, 100, a, 0) +
                 '</select></div>\x3c!-- Age Selector --\x3e<div class="err"></div></div>\x3c!-- CheckBoxes --\x3e' : d += '<div class="form_field clearfix checked"><label class="info" for="' + e + '">' + e + '</label><div class="dropdown_list"><select onchange="change_age1()" class="dropdown chkMemberAge birthDate1 ' + ("" == a ? "change_font_color" : "") + '">' 
                 + ageOptionCreate(e, n, 100, a, 0) + '</select>'+'<select onchange="change_age1()" class="dropdown chkMemberAge birthMonth1 ' + ("" == a ? "change_font_color" : "") + '">' 
                 + bgeOptionCreate(e, n, 100, a, 0) + '</select>'+'<select onchange="change_age1()" class="dropdown chkMemberAge birthYear1 ' + ("" == a ? "change_font_color" : "") + '">' 
                 + cgeOptionCreate(e, n, 100, a, 0) + '</select>'+'<span style="width: 100%; display: inline-block;color: #333;font-size: 14px;font-weight: 300;margin-top:5px" id="span_name1"></span>'+
                 '</div><div class="check_btn"><input type="checkbox" checked="checked" class="chkMemberStep4" value="' + e + '" id="' + e + '"><span class="checkmark"></span></div><div class="err"></div></div>'
            }
        }), $("#step_4 .details_field").html(d);
        

        var h = parseInt(o.attr("data-step"));
        makeComplete(h), (h += 1) < 5 && ($(parentId + ".form_step").removeClass("form_open"), $(parentId + ".form_pagination ul li.step_" + h).addClass("active"), $(parentId + "#step_" + h).addClass("form_open"), $(".errMemberAge").text(""), $(".errCheckMember").text(""), ChangeBrowserHistoryUrl(h)), n.hide(), o.show()
    } else n.hide(), o.show(), userType = $("#gaData").attr("data-user-type"), GA360FormSubmitError(t, a, r, userType)
}, fncProcessHealthStep4 = function() {
    parentId = "#" + $(this).parents(".showForm").attr("id") + " ";
    var e = !0;
    $("#step_4 .err").text("").hide(), $("#step_4 .form_field").removeClass("details_box");
    var t = "",
        a = "",
        r = 0,
        o = $(parentId + "#btnHealthStep4");
    o.hide();
    var n = $(parentId + "#loadingDivStep4");
    n.show();
    var i = $(parentId + ".errMemberAge");
    i.text("");
    var c = "",
        s = [],
        l = "",
        d = "",
        h = [],
        p = [],
        m = "",
        u = [],
        b = "",
        g = "",
        f = {};
    if ($(parentId + ".chkMemberStep4").each(function() {
            if ($(this).prop("checked")) {
                var o = $.trim($(this).val()),
                    n = $(this).parents(".form_field"),
                    m = parseInt($(".chkMemberAge", n).val());
                if (isNaN(m)) i.text("Please select age").show(), $(".err", n).text("Required").show(), $(n).addClass("details_box"), e = !1, t += "age,", a += "Please select age,", r++;
                else if ($(".err", n).text("").hide(), $(n).removeClass("details_box"), "Self" != o && "Spouse" != o || (s.push(m), l = Math.min.apply(Math, s), l = parseInt(l), d = Math.max.apply(Math, s), d = parseInt(d)), "Son" == o || "Daughter" == o) {
                    (c = l - m) < 0 ? (l > 0 ? i.text("Parent and child age gap should be 18 years or above.").show() : e && (isMobile ? i.text("Please select parent").show() : ($(".err", n).text("Please select parent").show(), i.text("Please select parent").show()), $(n).addClass("details_box")), e = !1, t += "age,", a += "Please select parent,", r++) : c < 18 && l > 0 ? (i.text("Parent and child age gap should be 18 years or above.").show(), e = !1, t += "age,", a += "Parent and child age gap should be 18 years or above,", r++) : ($(".err", n).text("").hide(), $(n).removeClass("details_box")), void 0 === f[o] && (f[o] = []);
                    (new Date).getTime();
                    f[o].push(m)
                } else "Self" != o && "Spouse" != o && (h.push(m), "Father" != o && "Mother" != o || p.push(m), "Grand Father" != o && "Grand Mother" != o || u.push(m)), f[o] = m
            }
            e && void 0 !== o && (g += o + "(" + m + "),")
        }), 0 !== p.length && (m = Math.min.apply(Math, p), (m = parseInt(m)) - d < 18 && e && (i.text("Parent and child age gap should be 18 years or above.").show(), e = !1, t += "age,", a += "Parent and child age gap should be 18 years or above,", r++)), 0 !== u.length && (b = Math.min.apply(Math, u), (b = parseInt(b)) - d < 36 && e && (i.text("Grandparent and Child age gap should be 36 years or above.").show(), e = !1, t += "age,", a += "Grandparent and Child age gap should be 36 years or above,", r++)), 0 !== p.length && 0 !== u.length && (c = b - m) < 18 && e && (i.text("Father/Mother and Parents age gap should be 18 yrs or above").show(), e = !1, t += "age,", a += "Father/Mother and Parents age gap should be 18 yrs or above,", r++), "" == g && e && (i.text("Please select at least one member").show(), e = !1, t += "age,", a += "Please select at least one member,", r++), e) {
        g = g.slice(0, -1);
        var v = "PB";
        window.location.href.indexOf("landingpage/health") > -1 && (v = "ACAFF"), /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && (v = "PBMobile");
        try {
            objLocalStorage.step4.member = f, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
        } catch (e) {}
        try {
            var y = JSON.stringify({
                Data: {
                    tabName: "health",
                    Name: $.trim(objLocalStorage.step2.name),
                    EmailID: "",
                    MobileNo: $.trim(jsEncode.encode(objLocalStorage.step1.keyvalue, "123"))
                }
            });
            $.ajax({
                url: cjProcessUrlHealth + "?type=setpbcjpreqd",
                type: "POST",
                cache: !1,
                data: y,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(e) {}
            })
        } catch (e) {}
        if (void 0 !== objLocalStorage.planid && $.trim(objLocalStorage.planid) > 0) {
            var S = $.trim(objLocalStorage.planid);
            y = JSON.stringify({
                planid: $.trim(objLocalStorage.planid),
                SumInsured: "500000",
                visitid: 0 == visitId ? $("#gaData").attr("data-visit") : visitId,
                utm_term: utmTerm,
                utm_source: utmSource,
                utm_medium: utmMedium,
                utm_campaign: utmCampaign,
                browser: getBrowser(),
                exit_point_url: window.location.href,
                request_url: window.location.href,
                members: $.trim(g),
                city_id: $.trim(objLocalStorage.step2.cityid),
                state_id: $.trim(objLocalStorage.step2.stateid),
                pincode: $.trim(objLocalStorage.step2.pincode),
                annual_income_id: 3,
                gender: $.trim(objLocalStorage.step2.gender),
                name: $.trim(objLocalStorage.step2.name),
                emailid: $.trim(""),
                country_id: 392,
                mobile_number: $.trim(jsEncode.encode(objLocalStorage.step1.keyvalue, "123")),
                leadsource: $.trim(v),
                IsPED: $.trim(0),
                GAClientID: getGACId("UA-4743078-8")
            });
            $.ajax({
                url: cjProcessUrlHealth + "?type=health&planid=" + S,
                type: "POST",
                cache: !1,
                data: y,
                contentType: "application/json; charset=utf-8",
                success: function(e) {
                    if ("error_relationship" == e) $(parentId + " .errMemberAge").text("There is some error in member selection. Please try again."), GA360FormSubmit("formSubmitFailed");
                    else {
                        $(parentId + " .errMemberAge").text(""), e = JSON.parse(e);
                        GA360("", "", "", "", "fresh"), GA360FormSubmit("formSubmitSuccess"), window.location.href = e.RedirectionURL
                    }
                    n.hide(), o.show()
                }
            })
        } else {
            y = JSON.stringify({
                visitid: 0 == visitId ? $("#gaData").attr("data-visit") : visitId,
                utm_term: utmTerm,
                utm_source: utmSource,
                utm_medium: utmMedium,
                utm_campaign: utmCampaign,
                browser: getBrowser(),
                exit_point_url: window.location.href,
                request_url: window.location.href,
                members: $.trim(g),
                city_id: $.trim(objLocalStorage.step2.cityid),
                state_id: $.trim(objLocalStorage.step2.stateid),
                pincode: $.trim(objLocalStorage.step2.pincode),
                annual_income_id: 3,
                gender: $.trim(objLocalStorage.step2.gender),
                name: $.trim(objLocalStorage.step2.name),
                emailid: $.trim(""),
                country_id: 392,
                mobile_number: $.trim(jsEncode.encode(objLocalStorage.step1.keyvalue, "123")),
                leadsource: $.trim(v),
                IsPED: $.trim(0),
                GAClientID: getGACId("UA-4743078-8")
            });
            $.ajax({
                url: cjProcessUrlHealth + "?type=health",
                type: "POST",
                cache: !1,
                data: y,
                contentType: "application/json; charset=utf-8",
                success: function(e) {
                    if ("error_relationship" == e) $(parentId + " .errMemberAge").text("There is some error in member selection. Please try again."), GA360FormSubmit("formSubmitFailed");
                    else {
                        $(parentId + " .errMemberAge").text("");
                        e = JSON.parse(e);
                        var t = $.trim(e.EnquiryID),
                            a = $.trim(e.CustomerID),
                            r = $.trim(e.MatrixLeadID);
                        if ("" != t) {
                            try {
                                var i = "#bottomForm" == $.trim(parentId) ? "Form-2" : "Form-1";
                                ga("healthTrackerObj.send", "event", "PreQuotes-Submit", i, window.location.href), ga("healthTrackerObj.set", "dimension3", t), ga("healthTrackerObj.set", "dimension2", a), ga("healthTrackerObj.set", "dimension1", r), ga("pbTrackerObj.send", "event", "Lead", "Health Insurance", r), ga("healthTrackerObj.send", "event", "Lead", "Health Insurance", r)
                            } catch (e) {}
                            GA360(r, t, a, "", "fresh"), GA360FormSubmit("formSubmitSuccess");
                            var c = "&iscom=1";
                            void 0 !== utmSource && "offlineaffiliate" == $.trim(utmSource.toLowerCase()) && (c = "&RequestedChannel=1&iscom=1"), window.top.location.href = healthUrlQuote + "?enquiryid=" + encodeURIComponent(Base64.encode(t)) + c
                        }
                    }
                    n.hide(), o.show()
                }
            })
        }
    } else n.hide(), o.show(), userType = $("#gaData").attr("data-user-type"), GA360FormSubmitError(t, a, r, userType)
}, fncSetFormValue = function() {
    $(parentId + ".mobNumber").parents(".input_box").removeClass("input_success");
    try {
        if (localStorage.getItem("getTabHealth")) {
            e = localStorage.getItem("getTabHealth");
            void 0 !== (objLocalStorage = $.parseJSON(e)).step1.keyvalue || getPBCJD(), void 0 !== objLocalStorage.planid && (objLocalStorage.planid = 0, objLocalStorage.childmaxage = 0, localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage)))
        } else {
            jsonItem.step1 = {}, jsonItem.step2 = {}, jsonItem.step3 = {}, jsonItem.step4 = {}, jsonItem.currStep = 1, localStorage.setItem("getTabHealth", JSON.stringify(jsonItem));
            var e = localStorage.getItem("getTabHealth");
            objLocalStorage = $.parseJSON(e), getPBCJD()
        }
    } catch (e) {}
}, fncCheckPremium = function() {
    $("body").css("overflow", "hidden"), $("#popupForm").css("visibility", "visible"), objLocalStorage.planid = parseInt($(this).attr("data-planid")), objLocalStorage.childmaxage = parseInt($(this).attr("data-childmaxage")), localStorage.setItem("getTabHealth", JSON.stringify(objLocalStorage))
};

function next_step2() {
    $("#step_2").removeClass("form_open");
    $("#step_3").addClass("form_open");
}
