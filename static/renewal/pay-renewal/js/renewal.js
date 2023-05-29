
$(document).ready(function () {
    BindInsurer();
    var dt = new Date();
    var currentYear = dt.getFullYear();
    // currentDate = currentYear + 01
    $(".datepicker").datepicker({
        dateFormat: 'yy-mm-dd', changeYear: true, changeMonth: true, minDate: "-76Y", defaultDate: '-30Y',
        maxDate: '0Y', yearRange: "-100:+0",
    });

    
});

var userAssist =
        {
            ShowError: function (srcErrorCtrl, flag, label, isFocus) {
                //$(srcErrorCtrl).attr("label", label);
                if (isFocus == undefined) {
                    isFocus = true;
                }

                if (label == undefined || label == null || label == '') { label = "Please enter valid value." }
                $(".tooltipBox").hide();
                srcInput = $(srcErrorCtrl);
                var htmlVal = '<div class="ErrorTip ErrorDiv" id="ErrorDiv" ><div class="arrow-left"></div><font class="clsBuyOption">' + label + '</font></div>';
                var ErrorDiv = $(".ErrorDiv");
                if (flag) {
                    $(srcInput).next().hide();
                    $(srcInput).next().remove();
                    return flag;
                }
                if (!$(srcInput).next().hasClass('ErrorDiv')) {
                    srcInput.after(htmlVal);
                }
                srcInput.addClass("processBTndis");
                //  ErrorDiv.fadeOut(9000);
                if (isFocus) {
                    setTimeout(function () { srcErrorCtrl.focus(); }, 0);
                }
                return flag;
            },


        };


function BindInsurer() {

    $.getJSON("./Json/Insurers.json", function (data) {
        var insurerIDQueryString = window.location.search.split("=");
        $.grep(data, function (n, i) {
            if (n.ID == parseInt(insurerIDQueryString[1])) {
                $('#imgInsurer').attr('src', n.InsurerLogo);
                $('#txtInsurer').attr('value', n.Insurer);
                $('#txtInsurer').attr('disabled', true);
            }

        })
    });
}

function ValidData() {
    var invalid = true;
    var control = $('.required')
    $(control).each(function () {
        if ($(this).val() == '') {
            invalid = false;
            userAssist.ShowError(this, false, $(this).attr("ValidationText"));
        }
        else {
            userAssist.ShowError(this, true, $(this).attr("ValidationText"));
        }
    });
    return invalid;
}

function HideLabel(controlID) {
      $("#" + controlID).hide();
   // document.getElementById("<%=lblError.ClientID %>").style.display = "none";
  /*  var seconds = 1;
    setTimeout(function () {
        $("#" + controlID).hide();
        //  document.getElementById("<%=lblBaxaError.ClientID %>").style.display = "none";
        //  document.getElementById("<%=lblMaxError.ClientID %>").style.display = "none";
    }, seconds * 1000);*/
};
function ShowLabel(controlID) {
    $("#" + controlID).show();
   
};

function BindText(controlID, text) {
    $("#" + controlID).show();
    $("#" + controlID).html(text);

};
