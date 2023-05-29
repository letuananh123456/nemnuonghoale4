
//For Left side Nav smoothly scrolling animation 
$(document).ready(function () {
    $('.fixedNav a[href^="#"]').click(function () {
        var target = $(this.hash);
        if (target.length == 0) target = $('a[name="' + this.hash.substr(1) + '"]');
        if (target.length == 0) target = $('html');
        $('html, body').animate({ scrollTop: target.offset().top - 120 }, 600);
        return false;
    });

    $(".tollFreeNoBox").hide();

    $(".tollFreeNo").mouseover(function () {
        $(".tollFreeNoBox").slideDown('slow');
    });

    $(".phoneNwhatsapp").mouseleave(function () {
        $(".tollFreeNoBox").slideUp('slow');
    });
});

//For Left side Nav Active Class 
$(document).ready(function () {
    $('.details').click(function () {
        $('.details').addClass("active");
        $('.benefits').removeClass("active");
        $('.features').removeClass("active");
        $('.eligibility').removeClass("active");

    });
    $('.benefits').click(function () {
        $('.details').removeClass("active");
        $('.benefits').addClass("active");
        $('.features').removeClass("active");
        $('.eligibility').removeClass("active");

    });
    $('.features').click(function () {
        $('.details').removeClass("active");
        $('.benefits').removeClass("active");
        $('.features').addClass("active");
        $('.eligibility').removeClass("active");

    });
    $('.eligibility').click(function () {
        $('.details').removeClass("active");
        $('.benefits').removeClass("active");
        $('.features').removeClass("active");
        $('.eligibility').addClass("active");

    });
});

//For Left side Nav smoothly scrolling animation
var scrollHandler = function () {
    var details = $('#details').offset();
    var benefit = $('#benefits').offset();
    var features = $('#features').offset();
    var eligibility = $('#eligibility').offset();
    var screenPosition = $(document).scrollTop();
    if (screenPosition >= details.top - 120) {
        $('.fixedNav ul li a').removeClass('active');
        $('.details').addClass('active');
    }
    if (screenPosition >= benefit.top - 120) {
        $('.fixedNav ul li a').removeClass('active');
        $('.benefits').addClass('active');
    }

    if (screenPosition >= features.top - 120) {
        $('.fixedNav ul li a').removeClass('active');
        $('.features').addClass('active');
    }

    if (screenPosition >= eligibility.top - 120) {
        $('.fixedNav ul li a').removeClass('active');
        $('.eligibility').addClass('active');
    }
}
$(document).ready(function () {
    var details = $('#details').offset();
    var benefit = $('#benefits').offset();
    var features = $('#features').offset();
    var eligibility = $('#eligibility').offset();
    $(window).scroll(scrollHandler);
    $('.fixedNav a[href^="#"]').click(function (e) {
        e.preventDefault();
        $(window).off("scroll", scrollHandler);
        var target = this.hash;
        var menu = target;
        $target = $(target);
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top - 120
        }, 1000, 'swing', function () {
            //window.location.hash = target;
            $(window).scroll(scrollHandler);
        });
        return false;
    });
    $('.details').click(function (e) {
        $('.details').addClass("active");
        $('.benefits').removeClass("active");
        $('.features').removeClass("active");
        $('.eligibility').removeClass("active");
    });
    $('.benefits').click(function () {
        $('.details').removeClass("active");
        $('.benefits').addClass("active");
        $('.features').removeClass("active");
        $('.eligibility').removeClass("active");

    });
    $('.features').click(function () {
        $('.details').removeClass("active");
        $('.benefits').removeClass("active");
        $('.features').addClass("active");
        $('.eligibility').removeClass("active");

    });
    $('.eligibility').click(function () {
        $('.details').removeClass("active");
        $('.benefits').removeClass("active");
        $('.features').removeClass("active");
        $('.eligibility').addClass("active");
    });
    //select options
    $('select').each(function () {
        if ($(this).val() != undefined && $(this).val() != '-1' && $(this).val() != '0' && $(this).val() != 'selected') {
            this.setAttribute("style", "color:#737373;");
        }
        else {
            this.setAttribute("style", "color:#bbb;");
        }
    });
    $('select').change(function () {
        if ($(this).val() != undefined && $(this).val() != '-1' && $(this).val() != '0' && $(this).val() != 'selected') {
            this.setAttribute("style", "color:#737373;");
        }
        else {
            this.setAttribute("style", "color:#bbb;");
        }
    });
});
$(document).ready(function () {
    $("button").click(function () {
        var pageURL = $(location).attr("href");
        alert(pageURL);
    });

    $(".ValueNotMoreThanAge").blur(function () {
        if (this.value != "Smoking Since" && this.value != "") {
            var age = $('#hdnAge').val();
            if (parseInt(this.value) > parseInt(age)) {
                $(this).addClass("error");
                // userAssist.Info("Value can not be greater than the Life Assured's age.");
            }
            else {
                $(this).removeClass("error");
            }
        }
        else {
            $(this).removeClass("error");
        }
    });
});


var userAssist =
{
    Info: function (msg) {
        $('.lblUserAssist').html(msg);
        $('.lblUserAssist').removeClass("userAssistError");
        $('.lblUserAssist').addClass("userAssistInfo");
    },

    Error: function (msg) {
        $('.lblUserAssist').html(msg);
        $('.lblUserAssist').removeClass("userAssistInfo");
        $('.lblUserAssist').addClass("userAssistError");
    },

    Clear: function () {
        $('.lblUserAssist').html('');
    }
};
$(document).ready(function () {
    //read more 
    $('.readMoreClick').click(function () {
        $('.readMoreBox').slideToggle("600");
    });

    $('.fa-times-circle').click(function () {
        $('.readMoreBox').slideToggle("explode");
    });

    //   Comment due to process button not enabled in case of all fields are filled as requied. (on page edirting mode)
    //    HightLightProceedButton(); //for desktop only
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        //if required for mobile - add here
        $('.fixedNav').scrollToFixed({ marginTop: 0 });

        //Show breakup
        $(".showBtn").click(function () {
            $(".planSummary .mobileDiv").show("slow");
            $(".box.planSummary").css({ bottom: "0" })
        });
        //hide breakup
        $(".hideBtn").click(function () {
            $(".planSummary .mobileDiv").hide("slow");
        });
        // HightLightProceedButton();
        //For Mobile - additional info 

        // below one line commented by sharad gupta due to life info div insert before in cace of mobile.
        //  $('#divAdditionalInfo').insertBefore('#divInvestmentInfo');

        ShowHide.ManageAdditionalDetails(true);



    } else {
        $('.fixedNav').scrollToFixed({ marginTop: 46 });
        $('.productHead').scrollToFixed();
        $('.productPageRight').scrollToFixed({ marginTop: 10 });
        $('#divTotalPremium').removeClass('btnHightLight'); // remove btnHightLight class
    }
    HightLightProceedButton(); //for desktop only
});

var currentDate = '26-12-2019';
function CalculateAge() {
    var ryear = 0;
    var rmonth = 0;
    var rday = 0;
    var age = 0;
    var day = $('#ddlDay').val();
    var month = $('#ddlMonth').val();
    var year = $('#ddlYear').val();
    var dob = day + "-" + month + "-" + year;
    var splitedDOB = dob.split('-');
    var iDay = parseInt(splitedDOB[0], 10);
    var iMonth = parseInt(splitedDOB[1], 10);
    var iYear = parseInt(splitedDOB[2], 10);

    if (iDay > 0 && iMonth > 0 && iYear > 0) {
        var mydateArr = currentDate.split("-");
        var myDayStr = mydateArr[0];
        var myMonthStr = mydateArr[1];
        var myYearStr = mydateArr[2];
        var iCYear = myYearStr;
        var iCMonth = myMonthStr;
        var iCDay = myDayStr;
        ryear = (iCYear - iYear);
        rmonth = (iCMonth - iMonth);
        rday = (iCDay - iDay);
        var iTempMonth = 0;
        var iTempAge = 0;
        if (rmonth < 0) {
            iTempAge = ryear - 1;
        } else if (rmonth > 0) {
            iTempAge = ryear;
        } else if (rmonth == 0)
            if (rday < 0) {
                iTempAge = ryear - 1;
            } else if (rday > 0) {
                iTempAge = ryear;
            } else if (rday == 0) {
                iTempAge = ryear;
            }
        age = iTempAge;
    }
    return age;
}

function Leapyear() {
    var day = document.getElementById("MainContent_UCLeadDetails1_ddlDay");
    var month = document.getElementById("MainContent_UCLeadDetails1_ddlMonth");
    var year = document.getElementById("MainContent_UCLeadDetails1_ddlYear");

    if (day == null || month == null || year == null) {
        return;
    }
    if (($("#MainContent_UCLeadDetails1_ddlMonth").val() == 'selected') || ($("#MainContent_UCLeadDetails1_ddlYear").val() == 'selected')) {
        return;
    }
    var selectedDay = day.options[day.selectedIndex].value;

    var Calmonth = month.options[month.selectedIndex].value;
    var Calyear = year.options[year.selectedIndex].value;
    if (Calyear % 4 == 0 && (Calyear % 100 != 0 || Calyear % 400 == 0)) {
        if (Calmonth == 2) {

            day.options.length = 0;
            var opt = document.createElement("option");
            opt.text = "DD";
            opt.value = 0;
            day.options.add(opt);

            for (cnt = 1; cnt <= 29; cnt++) {
                opt = document.createElement("option");
                opt.text = cnt;
                opt.value = cnt;
                day.options.add(opt);

            }
        }
        else

            if (Calmonth == 1 || Calmonth == 3 || Calmonth == 5 || Calmonth == 7 || Calmonth == 8 || Calmonth == 10 || Calmonth == 12) {

                day.options.length = 0;
                var opt = document.createElement("option");
                opt.text = "DD";
                opt.value = 0;
                day.options.add(opt);

                for (cnt = 1; cnt <= 31; cnt++) {
                    opt = document.createElement("option");
                    opt.text = cnt;
                    opt.value = cnt;
                    day.options.add(opt);
                }
            }

            else if (Calmonth == 4 || Calmonth == 6 || Calmonth == 9 || Calmonth == 11) {

                day.options.length = 0;
                var opt = document.createElement("option");
                opt.text = "DD";
                opt.value = 0;
                day.options.add(opt);

                for (cnt = 1; cnt <= 30; cnt++) {
                    opt = document.createElement("option");
                    opt.text = cnt;
                    opt.value = cnt;
                    day.options.add(opt);
                }
            }

    }
    else {
        if (Calmonth == 2) {

            day.options.length = 0;
            var opt = document.createElement("option");
            opt.text = "DD";
            opt.value = 0;
            day.options.add(opt);

            for (cnt = 1; cnt <= 28; cnt++) {
                opt = document.createElement("option");
                opt.text = cnt;
                opt.value = cnt;
                day.options.add(opt);
            }
        }
        else

            if (Calmonth == 4 || Calmonth == 6 || Calmonth == 9 || Calmonth == 11) {

                day.options.length = 0;
                var opt = document.createElement("option");
                opt.text = "DD";
                opt.value = 0;
                day.options.add(opt);

                for (cnt = 1; cnt <= 30; cnt++) {
                    opt = document.createElement("option");
                    opt.text = cnt;
                    opt.value = cnt;
                    day.options.add(opt);
                }
            }
            else

                if (Calmonth == 1 || Calmonth == 3 || Calmonth == 5 || Calmonth == 7 || Calmonth == 8 || Calmonth == 10 || Calmonth == 12) {

                    day.options.length = 0;
                    var opt = document.createElement("option");
                    opt.text = "DD";
                    opt.value = 0;
                    day.options.add(opt);

                    for (cnt = 1; cnt <= 31; cnt++) {
                        opt = document.createElement("option");
                        opt.text = cnt;
                        opt.value = cnt;
                        day.options.add(opt);
                    }
                }

    }

    if (selectedDay <= day.options.length - 1) {
        day.options[selectedDay].selected = true;
    }
}

