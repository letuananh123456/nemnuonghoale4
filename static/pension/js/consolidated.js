$(document).ready(function () {
    $(".male_yes").click(function () {
        $(this).addClass('active');
        $(".female_yes").removeClass('active');
    });
    $(".female_yes").click(function () {
        $(this).addClass('active');
        $(".male_yes").removeClass('active');
    });

    //smoker js

    $(".bottom_fields").hide();
    $(".smoke_yes").click(function () {
        $(this).addClass('active');
        $(".smoke_no").removeClass('active');
        $(".bottom_fields").slideDown();
    });
    $(".smoke_no").click(function () {
        $(this).addClass('active');
        $(".smoke_yes").removeClass('active');
        $(".bottom_fields").slideDown();
    });
    //js for Edit Section
    $(".edit_data").hide();
    $(".edit_button").click(function () {
        $(this).children().addClass('minus');
        $(".edit_data").slideDown(100);
        $(".black_shade").show();
    });

    //Js for checkRider
    $(".chk").click(function () {
        $(this).parent().toggleClass('checked');
    });
    //Annual premium JS
    $(".ann_pre").click(function () {
        $(this).toggleClass('single_pre');
    });
    //radio buttons js permanent address
    $(".perm_y").click(function () {
        $(this).toggleClass('active');
        $(".perm_n").removeClass('active');
    });
    $(".perm_n").click(function () {
        $(this).toggleClass('active');
        $(".perm_y").removeClass('active');
    });
    //radio buttons js permanent address	
    $(".political_y").click(function () {
        $(this).toggleClass('active');
        $(".political_n").removeClass('active');
    });
    $(".political_n").click(function () {
        $(this).toggleClass('active');
        $(".political_y").removeClass('active');
    });
    //radio buttons js Political 
    $(".political_y").click(function () {
        $(this).toggleClass('active');
        $(".political_n").removeClass('active');
    });
    $(".political_n").click(function () {
        $(this).toggleClass('active');
        $(".political_y").removeClass('active');
    });
    //radio buttons js Nominee address	
    $(".nom_1").click(function () {
        $(this).toggleClass('active');
        $(".nom_2").removeClass('active');
        $(".nom_3").removeClass('active');
    });
    $(".nom_2").click(function () {
        $(this).toggleClass('active');
        $(".nom_1").removeClass('active');
        $(".nom_3").removeClass('active');
    });
    $(".nom_3").click(function () {
        $(this).toggleClass('active');
        $(".nom_1").removeClass('active');
        $(".nom_2").removeClass('active');

    });

    //js for permanent address
    $(".perm_add").hide();
    $(".add .radio_no").click(function () {
        $(".perm_add").slideDown();
    });
    $(".add .radio_yes").click(function () {
        $(".perm_add").slideUp();
    });

    //js for contact info
    $(".data_boxes").hide();
    $(".ulMedicalList").show();

    //$(".app_info").hide();
    $(".headbar").click(function () {
        $(this).next().find('section').children('.data_boxes').slideToggle();
        $(this).toggleClass('active');
        $(this).next().find(".dummy_data").toggle();
    });

    //raj added 19-06-17


    $(".edit_data").hide();
    $(".edit_button").click(function () {
        $(this).children().addClass('minus');
        $(".edit_data").slideDown(100);
        $(".black_shade").show();

    });



    $(".slidingContent").hide();
    $(".slidingHeading").click(function () {
        $(this).next().slideToggle();
        $(this).toggleClass('active');
        $(this).find(".HeadingInfo").toggle();

        if ($(this).hasClass('active') == true) {
            $(this).children().children().first().removeClass('editData');
            $(this).children().children().first().addClass('closeData');
           
         }
        else {
            $(this).children().children().first().addClass('editData');
            $(this).children().children().first().removeClass('closeData');
        }
        //        ($(this).css() == 'active')

    });


    //raj added 19-06-17

    //js for radiobuttons
    // $(".radios input").attr("checked", false);
    $(".faq input").attr("checked", false);
    $(".yes input").click(function () {
        $(this).parent().next().addClass("blue");
        $(this).parents(".radios").find('.no').next().removeClass("blue");
        $(this).parents(".faq").find('.no').next().removeClass("blue");
    });
    $(".no input").click(function () {
        $(this).parent().next().addClass("blue");
        $(this).parents(".radios").find('.yes').next().removeClass("blue");
        $(this).parents(".faq").find('.yes').next().removeClass("blue");
    });
    //js for radios...................................
    $(".sel_yes").click(function () {
        $(this).addClass("blue");
        $(this).parents(".radios").find(".sel_no").removeClass("blue");
        $(this).parents(".radios").find(".sel_three").removeClass("blue");
    });
    $(".sel_no").click(function () {
        $(this).addClass("blue");
        $(this).parents(".radios").find(".sel_yes").removeClass("blue");
        $(this).parents(".radios").find(".sel_three").removeClass("blue");
    });
    $(".sel_three").click(function () {
        $(this).addClass("blue");
        $(this).parents(".radios").find(".sel_yes").removeClass("blue");
        $(this).parents(".radios").find(".sel_no").removeClass("blue");
    });

    $(".aspNetDisabled").parent().unbind().click();
    //js for three radiobuttons
    $(".radone input").click(function () {
        $(this).parent().next().addClass("blue");
        $(this).parents(".radios").find('.radtwo').next().removeClass("blue");
        $(this).parents(".radios").find('.radthree').next().removeClass("blue");
    });
    //////////////////////////////////
    $(".radtwo input").click(function () {
        $(this).parent().next().addClass("blue");
        $(this).parents(".radios").find('.radone').next().removeClass("blue");
        $(this).parents(".radios").find('.radthree').next().removeClass("blue");
    });
    $(".radthree input").click(function () {
        $(this).parent().next().addClass("blue");
        $(this).parents(".radios").find('.radone').next().removeClass("blue");
        $(this).parents(".radios").find('.radtwo').next().removeClass("blue");
    });
    //Js for Lifestyle section
    $(".ques_open").hide();
    $(".always_open").show();
    $(".ques_blocks .yes").click(function () {
        //$(this).parents(".ques_blocks").addClass("active").next().slideDown();
        $(this).parent().addClass("selected");
        $(this).parents(".ques_blocks").addClass("active");
        $(this).parents(".radios").find(".block_no").removeClass("selected");

    });
    $(".ques_blocks .no").click(function () {
        //$(this).parents(".ques_blocks").removeClass("active").next().slideUp();
        $(this).parent().addClass("selected");
        $(this).parents(".radios").find(".block_yes").removeClass("selected");
        $(this).parents('.ques_blocks').removeClass("active");
    });
    //Js for checkbox
    $(".chk_box input").attr("checked", false);
    $(".chk_box").click(function () {
        $(this).next().toggleClass("checked");
    });
    //js for last name
    //    $("#txtLastName").focus(function () {
    //        if ($(this).val() !== "*Last Name") $(this).addClass("blue");
    //           else $(this).removeClass("blue")
    //      });
    //js for dropdown color change
    $('select').change(function () {
        $(this).removeClass("empty");
    });
    //    if ($("select").live) {
    //        $("select").live('change', function () {
    //            if ($(this).val() == "selected" || $(this).val() == "0") $(this).addClass("empty");
    //            else $(this).removeClass("empty")
    //        });
    //    }
    $("select").addClass("empty");
    //js for summary page
    $(".summary_bot li input").attr("checked", false);
    $(".summary_bot li input").click(function () {
        $(this).parents('.summary_bot li').find('.txt').toggleClass("blue");
    });
    //js for dropdown
    $('.left_section select').change(function () {
        if ($(this).val() == "selected") $(this).addClass("empty");
        else $(this).addClass("bluesel")
        //$(this).addClass("bluesel");
    });
    $('.left_section select').change(function () {
        if ($(this).val() == "0") $(this).addClass("empty");
        else $(this).addClass("bluesel")
        //$(this).addClass("bluesel");
    });
    $('.left_section select').change(function () {
        if ($(this).val() == "-1") $(this).addClass("empty");
        else $(this).addClass("bluesel")
        //$(this).addClass("bluesel");
    });
    $('.text_transforms').keyup(function (evt) {
        var txtBoxValue = $(this).val();
        txtBoxValue = txtBoxValue.substring(0, 1).toUpperCase() + txtBoxValue.substring(1);
        $(this).val(txtBoxValue);
    });

    $('.text_transforms').blur(function (evt) {
        var txtBoxValue = $(this).val();
        if ($(this)[0].defaultValue != txtBoxValue) {
            txtBoxValue = txtBoxValue.toLowerCase();
            var splitName = txtBoxValue.split(' ');
            var formattedName = "";
            if (splitName.length > 0) {
                for (var nameIndex = 0; nameIndex < splitName.length; nameIndex++) {
                    splitName[nameIndex] = splitName[nameIndex].substring(0, 1).toUpperCase() + splitName[nameIndex].substring(1);
                    formattedName += splitName[nameIndex] + " ";
                }
            }
            txtBoxValue = formattedName; // txtBoxValue.substring(0, 1).toUpperCase() + txtBoxValue.substring(1);
            $(this).val(txtBoxValue);
        }
    });
});
//javascript###########################################
//JS for input focus and blur
//function myFocus(element,defaultvalue) {
//    if (element.value == element.defaultValue) 
//    {
//        element.value = '';
//        element.setAttribute("style","color: #1290c3;");
//    }
//}
//function myBlur(element, defaultvalue) 
//{
//    if (element.value == '') 
//    {
//        element.value = element.defaultValue;
//        element.setAttribute("style","color: #e6e6e6;");
//    }
//}

function myFocusColor(element, defaultvalue) {
    // element.setAttribute("style", "color: #1290c3;");
}
function myBlurColor(element, defaultvalue) {
    // element.setAttribute("style", "color: #A9A9A9;");
}

function myFocus(element, defaultvalue) {
    if ($(element).attr("DefaultValue") != undefined) {
        if (element.value.toLower().trim() == $(element).attr("DefaultValue").toLower()) {
            element.value = '';
            element.setAttribute("style", "color: #6e6c6c;");
            element.select();
        }
    }
    else if (element.defaultValue) {
        if (element.value.toLower().trim() == element.defaultValue.toLower()) {
            element.value = '';
            element.setAttribute("style", "color: #6e6c6c;");
            element.select();
        }
    }
    else {
        if (element.tagName == "INPUT") {
            element.select();
        }
    }
}



//function handles default value also and behave so..
function myBlur(element, defaultvalue) {
    if (element.value == '') {
        if ($(element).attr("DefaultValue") != undefined) {
            element.value = $(element).attr("DefaultValue");
            element.setAttribute("style", "color: #e6e6e6;");
        }
        else {
            if (element.defaultValue) {
                element.value = element.defaultValue;
                element.setAttribute("style", "color: #e6e6e6;");
            }
        }
    }
}

function myFocusLifeStyle(element, defaultvalue) {
    if ($(element).attr("DefaultValue") != undefined) {
        if (element.value.toLowerCase() == $(element).attr("DefaultValue").toLowerCase()) {
            element.value = '';
            element.setAttribute("style", "color: #6e6c6c;");
            element.select();
        }
    }
    else if (element.defaultValue) {
        if (element.value.toLowerCase() == element.defaultValue.toLowerCase()) {
            element.value = '';
            element.setAttribute("style", "color: #6e6c6c;");
            element.select();
        }
    }
    else {
        if (element.tagName == "INPUT") {
            element.select();
        }
    }
}

//function handles default value also and behave so..
function myBlurLifeStyle(element, defaultvalue) {
    if (element.value == '') {
        if ($(element).attr("DefaultValue") != undefined) {
            element.value = $(element).attr("DefaultValue");
            element.setAttribute("style", "color: #e6e6e6;");
        }
        else {
            if (element.defaultValue) {
                element.value = element.defaultValue;
                element.setAttribute("style", "color: #e6e6e6;");
            }
        }
    }
}

function myBlurLifeStyle_HisIns(element, defaultvalue) {
    if (element.value == '') {
        if ($(element).attr("DefaultValue") != undefined) {
            element.value = $(element).attr("DefaultValue");
            element.setAttribute("style", "color: #e6e6e6;");
        }
        else {
            if (element.defaultValue) {
                element.value = element.defaultValue;
                element.setAttribute("style", "color: #e6e6e6;");
            }
        }
    }
    else if (element.value.charAt(0) == '0') {
        element.value = $(element).attr("DefaultValue");
        element.setAttribute("style", "color: #e6e6e6;");
    }
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
 } 