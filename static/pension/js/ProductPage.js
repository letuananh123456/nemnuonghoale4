$(document).ready(function () {
    personalInfo.OnLoad();
    ControlBase.Initialize();
    $('.liHousewifeDetails').css('display', 'none');
    ControlBase.RegisterEvents();
    ControlBase.LoadBasicControls();
    Validator.ValidateAndOpenDefaultAccordion();
    // For Mobile Highlight
    //if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
    // HightLightProceedButton();
    //}
    HightLightProceedButton(); //for desktop only
    $('.mobileFullBtnHighlight').blur(function () {
        HightLightProceedButton();
    })

    $('.mobileFullBtnHighlightChange').change(function () {
        HightLightProceedButton();
    })
});

function changeDetected() {
    if (Validator.CalculationFunction() == true) {
        calc.RegisterCustomer();
        webEvent.PremiumPaymentModeChange();
    }
}

function SetSumAssuredPayment(ClassName) {
    $('.' + ClassName).each(function (index) {
        if ($(this).is("input")) {
            var Amount = $(this).val();

            if (Amount != "NA")
                var formatedAmount = GetIndianCurrencyFormattedAmountPayment(Amount, 11);
            $(this).val(formatedAmount);

        }
        else {
            var Amount = $(this).html();
            if (Amount != "NA")
                var formatedAmount = GetIndianCurrencyFormattedAmountPayment(Amount, 11);
            $(this).html(formatedAmount);
        }
    });
}

var enquiryResponse = {
    FirstName: "",
    MiddleName: "",
    LastName: "",
    MobileNumber: "",
    EmailId: "",
    IsGenderMale: false,
    DateOfBirth: "",
    CitySelected: 0,

    SetEnquiryResult: function () {
        this.FirstName = $('#txtFirstName').val();
        this.MiddleName = $('#txtMiddleName').val();
        this.LastName = $('#txtLastName').val();
        this.MobileNumber = $('#txtMobileNo').val();
        this.EmailId = $('#txtEmail').val();
        this.IsGenderMale = $('#rdogenderMale').is(':checked');
    }
}

var personalInfo = {

    InsuredMailingCity: null,

    ProposerMailingCity: null,

    OnInit: function () {
        this.QuoteInfo();
        this.BasicInfo();
        enquiryResponse.SetEnquiryResult();
    },

    OnLoad: function () {
        this.OnInit();

        if ($('#rdogenderFemale').is(':checked')) {
            $('.productList').addClass('female');
            $('.productList').removeClass('male');
        }

        $('#ddlModeOfPremium').val($('#hdnPostPaymentFreqency').val());
        if ($('#ddlModeOfPremium').val() == "1") {
            $('.lblAutoTransferPortfolio').show();
        }
        else {
            $("#rdoAutoTransferPortfolio").prop("checked", false);
            $("#rdoInvestorSelectablePortfolio").prop("checked", true);
            $('.lblAutoTransferPortfolio').hide();
        }
        if (fundAllocation) {
            fundAllocation.setPremiumPaymentFrequency(parseInt($('#hdnPostPaymentFreqency').val(), 0));
        }

        Validator.InternationalNumberValidation(false);
    },

    BasicInfo: function () {
        $('#txtFirstName').blur(function () {
            var BasicSumAssured = document.getElementById("txtFirstName");
            $('#lblName').html(BasicSumAssured.value);
        });
        $('#txtMobileNo').blur(function () {
            var BasicSumAssured = document.getElementById("txtMobileNo");
            $('#lblMobileNo').html(BasicSumAssured.value);
        });
        $('#txtEmail').blur(function () {
            var BasicSumAssured = document.getElementById("txtEmail");
            $('#lblEmail').html(BasicSumAssured.value);
        });
        $('#ddlResidentialStatus').change(function () {
            var SelectedVal = $('#ddlResidentialStatus option:selected').text();
            $('#lblResidentialStatus').html(SelectedVal);
        });

        $('#txtChildFirstName').blur(function () {
            var BasicSumAssured = document.getElementById("txtChildFirstName");
            $('#lblChildName').html(BasicSumAssured.value);
        });

        $('#rdoProMale').click(function () {
            var Sel = $(this).val();
            $('#lblChildGender').html(Sel);
            changeDetected();
        });
        $('#rdoProFemale').click(function () {
            var Sel = $(this).val();
            $('#lblChildGender').html(Sel);
            changeDetected();
        });
        $('.Prodob').change(function () {
            var SelectedDay = $('#ddlChildDay option:selected').text();
            var SelectedMonth = $('#ddlChildMonth option:selected').text();
            var SelectedYear = $('#ddlChildYear option:selected').text();
            $('#lblChildDOB').html(SelectedDay + '-' + SelectedMonth + '-' + SelectedYear);
            changeDetected();
        });
    },

    QuoteInfo: function () {
        $('.LAdob').change(function () {
            var SelectedDay = $('#ddlDay option:selected').text();
            var SelectedMonth = $('#ddlMonth option:selected').text();
            var SelectedYear = $('#ddlYear option:selected').text();
            $('#lblDOB').html(SelectedDay + '-' + SelectedMonth + '-' + SelectedYear);
            changeDetected();
        });
        $('#txtInvestAmount').blur(function () {
            if ($('#txtInvestAmount').val().trim() != '') {
                if (Validator.CalculationFunction() == true) {
                    $('#txtBasicSumAssured').val(webApp.GetSumAssured());
                    $('#spnPremium').html(GetIndianCurrencyFormattedAmountPayment($('#txtInvestAmount').val().replace(/\,/g, '')), 15);
                    changeDetected();
                }
                webEvent.PremiumPaymentModeChange();
            }
        });



        $('#txtBasicSumAssured').blur(function () {
            var BasicSumAssured = document.getElementById("txtBasicSumAssured");
            $('#lblTotalPayout').html(GetIndianCurrencyFormattedAmountPayment(BasicSumAssured.value, 14));

            //$('#lblSumAssured').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(BasicSumAssured.value, 14));
            $('.LifeCover').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(BasicSumAssured.value, 14));
            changeDetected();
        });
        $('#ddlPolicyTerm').change(function () {

            if ($('#ddlPolicyTerm option:selected').val() === "0") {
                $('#ddlPolicyTerm').addClass("errorMsg").focus();
                $('#errPolicyTerm').css('display', 'block');
            } else {
                $('#ddlPolicyTerm').removeClass("errorMsg");
                $('#errPolicyTerm').css('display', 'none');
                var SelectedVal = $('#ddlPolicyTerm option:selected').text();
                ControlBase.BindPayTerm();
                $('#txtBasicSumAssured').val(webApp.GetSumAssured());
                $('#hdnPostTerm').val($('#ddlPolicyTerm').val());
                changeDetected();
                webEvent.PremiumPaymentModeChange();
                webEvent.TriggerLifeCoverOptions();
            }
        });
        $('#ddlPayTerm').change(function () {
            var SelectedVal = $('#ddlPayTerm option:selected').text();
            $('#lblPayOption').html($('#ddlPayTerm option:selected').text());
            $('#hdnPayingTermType').val($('#ddlPayTerm').val());
            changeDetected();
            webEvent.PremiumPaymentModeChange();
        });
        $('#rdogenderMale').click(function () {
            $('.productList').removeClass('female');
            $('.productList').addClass('male');
            var Sel = $(this).val();
            $('#lblGender').html(Sel);
            changeDetected();
            webEvent.PremiumPaymentModeChange();

        });
        $('#rdogenderFemale').click(function () {
            $('.productList').addClass('female');
            $('.productList').removeClass('male');
            var Sel = $(this).val();
            $('#lblGender').html(Sel);
            changeDetected();
            webEvent.PremiumPaymentModeChange();
        });
        $('#rdosmokeYes').click(function () {
            var Sel = $(this).val();

            $('#lblSmoke').html(Sel);
        });
        $('#rdosmokeNo').click(function () {
            var Sel = $(this).val();
            $('#lblSmoke').html(Sel);

        });
        $('#ddlModeOfPremium').change(function () {
            var SelectedVal = $('#ddlModeOfPremium option:selected').text();
            if (SelectedVal) {
                $('#lblModeOfPremium').html(SelectedVal);
            }
            if (SelectedVal == "Annual") {
                $('.lblAutoTransferPortfolio').show();
            }
            else {
                $("#rdoAutoTransferPortfolio").prop("checked", false);
                $("#rdoInvestorSelectablePortfolio").prop("checked", true);
                $('.lblAutoTransferPortfolio').hide();
            }
            $('#txtBasicSumAssured').val(webApp.GetSumAssured());
            changeDetected();
            webEvent.PremiumPaymentModeChange();
        });
        $('#ddlLifeCoverMultiplierFactor').change(function () {
            $('#txtBasicSumAssured').val(webApp.GetSumAssured());
            changeDetected();
        });
        $('#rdoInvestforself').click(function () {
            $('#headerLifeAssuredTitle').html("Life Assured Info");
            $('#spnAdditionalInfoHeader').html("Additional Details");
            $('#divProposerInfo').css('display', 'none');
            $('#hdnIsProposer').val('0');
            Validator.ValidateAndOpenDefaultAccordion();
            changeDetected();
        });

        $('#rdoInvestforChild').click(function () {
            $('#divProposerInfo').css('display', 'block');
            $('#headerLifeAssuredTitle').html("Proposer's Info");
            $('#spnAdditionalInfoHeader').html("Additional Details (Proposer)");
            $('#hdnIsProposer').val('1');
            $('#liOccupation').css('display', 'none');
            Validator.ValidateAndOpenDefaultAccordion();
            changeDetected();
        });
    },

    ManageDOBYearOnBuyingForSelection: function () {
        var currentYear = parseInt($('#hdnCurrentYear').val(), 0);
        var LaDOBYear = $('#ddlYear');
        var PropDOBYear = $('#ddlChildYear');
        var selectedLADobYear = parseInt(LaDOBYear.val(), 0);
        var selectedPropDobYear = parseInt(PropDOBYear.val(), 0);
        if (webApp.IsBuyingForSelf()) {
            this.FillYearToControl(LaDOBYear, currentYear - 60, currentYear - 18);
            this.FillYearToControl(PropDOBYear, currentYear - 60, currentYear - 18);

            if (!isNaN(selectedLADobYear)) {
                if (selectedLADobYear > 0) {
                    LaDOBYear.val(selectedLADobYear);
                }
            }
            else if ($('#hdnDOBYear').val() !== "") {
                var selectedYear = parseInt($('#hdnDOBYear').val(), 0);
                if (selectedYear > 0) {
                    LaDOBYear.val(selectedYear);
                }
            }
        }
        else {
            this.FillYearToControl(LaDOBYear, currentYear - 18, currentYear - 1);
            this.FillYearToControl(PropDOBYear, currentYear - 60, currentYear - 18);

            if (!isNaN(selectedLADobYear)) {
                if (selectedLADobYear > 0) {
                    LaDOBYear.val(selectedLADobYear);
                }
            }

            if (!isNaN(selectedPropDobYear)) {
                if (selectedPropDobYear > 0) {
                    PropDOBYear.val(selectedPropDobYear);
                }
            }
            else if ($('#hdnDOBYear').val() !== "") {
                var selectedYear = parseInt($('#hdnDOBYear').val(), 0);
                if (selectedYear > 0) {
                    PropDOBYear.val(selectedYear);
                }
            }
        }
    },

    FillYearToControl: function (controlToFill, startYear, endYear) {
        controlToFill.empty();
        controlToFill.append($('<option></option>').val("selected").html("YYYY"));
        for (var index = startYear; index <= endYear; index++) {
            controlToFill.append($('<option></option>').val(index).html(index));
        }
    }
}


function ChangePremium() {
    if ($('#ddlModeOfPremium').val() == 1) {
        $('#ddlModeOfPremium').val(12);
        var beforechangePrem = $('#txtInvestAmount').val().replace(/\,/g, '');
        $('#txtInvestAmount').val($('#spnSecPremium').html());
        $('#emPaymentMode').html("monthly");
        $('#aPremiumhange').html(" change to Annual");
        $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt(beforechangePrem), 11) + "");
        
        changeDetected();
    }
    else if ($('#ddlModeOfPremium').val() == 2) {
        $('#ddlModeOfPremium').val(1);
        var beforechangePrem = $('#txtInvestAmount').val().replace(/\,/g, '');
        $('#txtInvestAmount').val($('#spnSecPremium').html());
        $('#emPaymentMode').html("Annual");
        $('#aPremiumhange').html(" change to monthly");
        $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt(beforechangePrem) / 6, 11) + "");
        changeDetected();
    }
    else if ($('#ddlModeOfPremium').val() == 4) {
        $('#ddlModeOfPremium').val(1);
        var beforechangePrem = $('#txtInvestAmount').val().replace(/\,/g, '');
        $('#txtInvestAmount').val($('#spnSecPremium').html());
        $('#emPaymentMode').html("Annual");
        $('#aPremiumhange').html(" change to monthly");
        $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt(beforechangePrem) / 3, 11) + "");
        changeDetected();
    }
    else if ($('#ddlModeOfPremium').val() == 12) {
        $('#ddlModeOfPremium').val(1);
        var beforechangePrem = $('#txtInvestAmount').val().replace(/\,/g, '');
        $('#txtInvestAmount').val($('#spnSecPremium').html());
        $('#emPaymentMode').html("Annual");
        $('#aPremiumhange').html(" change to monthly");
        $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt(beforechangePrem), 11) + "");
        changeDetected();
    }
    if ($('#ddlModeOfPremium').val() = "1") {
        $('.lblAutoTransferPortfolio').show();
    }
    else {
        $("#rdoAutoTransferPortfolio").prop("checked", false);
        $("#rdoInvestorSelectablePortfolio").prop("checked", true);
        $('.lblAutoTransferPortfolio').hide();
    }
    return false;
}

var webApp =
  {
      IsBuyingForSelf: function () {
          return $('#rdoInvestforself').is(':checked');
      },

      GetAge: function () {
          var day = $('#ddlDay option:selected').val();
          var month = $('#ddlMonth option:selected').val();
          var year = $('#ddlYear option:selected').val();
          var dob = day + "-" + month + "-" + year;
          //$('input[id$=hdnDOB]', $('#dvHiddenContainer')).val(dob);
          var age = webUtility.CalculateAge();
          if ($("#ddlDay").val() != 'selected' && $("#ddlMonth").val() != 'selected' && $("#ddlYear").val() != 'selected') {
              $('#hdnAge').val(age);
          }
          else {
              age = $('#hdnAge').val();
          }
          return age;
      },

      GetAnnualIncome: function () {
          var annualIncome = 0;//$('#txtAnnualIncome').val();
          // annualIncome = annualIncome.replace(/\,/g, '');
          return annualIncome;
      },

      PolicyTerm: function () {
          Age = this.GetAge();
          var PolicyTerm = $('#ddlPolicyTerm').val();
          var Term;
          if (parseInt(250 - Age) == parseInt(PolicyTerm)) {
              Term = -1;
          }
          else {
              Term = PolicyTerm;
          }

          return Term;
      },

      IsMaleGender: function () {
          var isMaleGender = $('#rdogenderMale').is(':checked');
          return isMaleGender;
      },

      IsSmoker: function () {
          var isSmoker = 0;
          return isSmoker;
      },

      GetSumAssured: function () {
          var annualPremium = parseFloat($('#txtInvestAmount').val().replace(/\,/g, '')) * parseFloat($('#ddlModeOfPremium').val());
          var SumAssured = 0;
          var selectedLifeCoverFactor = parseFloat($('#ddlLifeCoverMultiplierFactor').val());
          if (selectedLifeCoverFactor) {
              SumAssured = selectedLifeCoverFactor * annualPremium;
          }
          else {
              SumAssured = webEvent.GetMinimumSumAssuredFactor() * annualPremium;
          }
          if (isNaN(SumAssured)) {
              SumAssured = 0;
          }
          //$('#lblSumAssured').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(SumAssured, 14));
          $('.LifeCover').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(SumAssured, 14));
          $('#hdnMaximumSumAssured').val(SumAssured);
          $('#hdnLifeCoverMultiplier').val(selectedLifeCoverFactor);
          $('#lblPolicyTerm').html($('#ddlPolicyTerm option:selected').text());
          $('#lblPayOption').html($('#ddlPayTerm option:selected').text());
          $('#lblLifeCoverMultiplier').html($('#ddlLifeCoverMultiplierFactor option:selected').text());
          $('#lblTotalPayout').html(GetIndianCurrencyFormattedAmountPayment($("#txtInvestAmount").val(), 14));
          $('#lblCoverage').html(GetIndianCurrencyFormattedAmountPayment(SumAssured, 14));
          return SumAssured;
      },

      GetFullName: function () {
          var fullName = $('#txtFirstName').val().trim();
          fullName.concat(" ").concat($('#txtMiddleName').val().trim());
          fullName.concat(" ").concat($('#txtLastName').val().trim());
          return fullName;
      },

      IsNRIResident: function () {
          return $('#ddlResidentialStatus').val() === "2";
      },

      GetInsuredDOBForCalculation: function () {
          var day = $('#ddlDay option:selected').val();
          var month = $('#ddlMonth option:selected').val();
          var year = $('#ddlYear option:selected').val();
          var dob = day + "-" + month + "-" + year;
          var splitedDOB = dob.split('-');
          var iDay = parseInt(splitedDOB[0], 10);
          var iMonth = parseInt(splitedDOB[1], 10);
          var iYear = parseInt(splitedDOB[2], 10);
          if (iDay > 0 && iMonth > 0 && iYear > 0) {
              return ("0" + iDay).slice(-2) + "/" + ("0" + iMonth).slice(-2) + "/" + iYear;
          }
          else {
              if ($('#hdnDOBYear').val() === "") {
                  return "01/01/1984";
              } else {
                  return "01/01/" + $('#hdnDOBYear').val();
              }
          }
      },

      GetInsuredDOB: function () {
          var day = $('#ddlDay option:selected').val();
          var month = $('#ddlMonth option:selected').val();
          var year = $('#ddlYear option:selected').val();
          var dob = day + "-" + month + "-" + year;
          var splitedDOB = dob.split('-');
          var iDay = parseInt(splitedDOB[0], 10);
          var iMonth = parseInt(splitedDOB[1], 10);
          var iYear = parseInt(splitedDOB[2], 10);
          if (iDay > 0 && iMonth > 0 && iYear > 0) {
              return ("0" + iDay).slice(-2) + "/" + ("0" + iMonth).slice(-2) + "/" + iYear;
          }
          else {
              return "00/00/0000";
          }
      },

      GetChildDOB: function () {
          var day = $('#ddlChildDay option:selected').val();
          var month = $('#ddlChildMonth option:selected').val();
          var year = $('#ddlChildYear option:selected').val();
          var dob = day + "-" + month + "-" + year;
          var splitedDOB = dob.split('-');
          var iDay = parseInt(splitedDOB[0], 10);
          var iMonth = parseInt(splitedDOB[1], 10);
          var iYear = parseInt(splitedDOB[2], 10);
          if (iDay > 0 && iMonth > 0 && iYear > 0) {
              return ("0" + iDay).slice(-2) + "/" + ("0" + iMonth).slice(-2) + "/" + iYear;
          }
          else {
              return "00/00/0000";
          }
      }
  }

var webUtility =
    {
        CalculateAgeByDate: function (dateOfBirth, splitter) {
            var ryear = 0;
            var rmonth = 0;
            var rday = 0;
            var age = -1;
            var splitedDOB = dateOfBirth.split(splitter);
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
        },

        CalculateAge: function () {
            var ryear = 0;
            var rmonth = 0;
            var rday = 0;
            var age = -1;
            var day = $('#ddlDay option:selected').val();
            var month = $('#ddlMonth option:selected').val();
            var year = $('#ddlYear option:selected').val();
            var dob = day + "-" + month + "-" + year;
            //   $('input[id$=hdnDOB]', $('#dvHiddenContainer')).val(dob);
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
        },

        CalculateChildAge: function () {
            var ryear = 0;
            var rmonth = 0;
            var rday = 0;
            var age = -1;
            var day = $('#ddlChildDay option:selected').val();
            var month = $('#ddlChildMonth option:selected').val();
            var year = $('#ddlChildYear option:selected').val();
            var dob = day + "-" + month + "-" + year;
            //   $('input[id$=hdnDOB]', $('#dvHiddenContainer')).val(dob);
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
    }

var webEvent =
   {
       TriggerLifeCoverOptions: function () {
           var annualisedPremium = parseFloat($('#txtInvestAmount').val().replace(/\,/g, '')) * parseFloat($('#ddlModeOfPremium').val());
           var PolicyTermVal = $('#ddlPolicyTerm').val();
           var sumAssuredList = $('#ddlLifeCoverMultiplierFactor');
           sumAssuredList.empty();
           if (parseInt(PolicyTermVal, 0) > 0) {
               var MaxSumAssured = 0;
               var MinSumAssured = 0;

               var existingMultiplierFactor = parseFloat($('#hdnLifeCoverMultiplier').val());
               if (annualisedPremium != 'NaN') {
                   MinSumAssured = this.GetMinimumSumAssuredFactor();
                   MaxSumAssured = this.GetMaximumSumAssuredFactor();
               }

               for (var saInterval = MinSumAssured; saInterval <= MaxSumAssured; saInterval += .5) {
                   sumAssuredList.append($('<option></option>').val(saInterval).html(saInterval));
               }

               if (existingMultiplierFactor > 0) {
                   sumAssuredList.val(existingMultiplierFactor);
                   webApp.GetSumAssured();
               }
               $('#txtBasicSumAssured').val(webApp.GetSumAssured());
           }
           else {
               sumAssuredList.append($('<option></option>').val("0").html("Select Life Cover"));
           }
       },

       GetMinimumSumAssuredFactor: function () {
           var age = 0;
           if (webApp.IsBuyingForSelf()) {
               age = parseInt(webUtility.CalculateAge());
           }
           else {
               age = parseInt(webUtility.CalculateChildAge());
           }
           if (age == -1) {
               age = parseInt($('#hdnAge').val());
           }
           var tenTimeAnnualSA = 0;
           var factoredSA = 0;
           var SumAssuredFactor = 0;
           var PolicyTerm = parseFloat($('#ddlPolicyTerm').val());
           tenTimeAnnualSA = 10;
           if (age >= 0 && age < 45) {
               //factoredSA = 0.5 * PolicyTerm;
               factoredSA = 10;
           }
           else if (age >= 45) {
              // factoredSA = 0.25 * PolicyTerm;
               factoredSA = 10;
           }

           SumAssuredFactor = tenTimeAnnualSA > factoredSA ? tenTimeAnnualSA : factoredSA;
           return SumAssuredFactor;
       },

       GetMaximumSumAssuredFactor: function () {
           var age = 0;
           if (webApp.IsBuyingForSelf()) {
               age = parseInt(webUtility.CalculateAge());
           }
           else {
               age = parseInt(webUtility.CalculateChildAge());
           }
           if (age == -1) {
               age = parseInt($('#hdnAge').val());
           }
           var tenTimeAnnualSA = 0;
           var factoredSA = 0;
           var SumAssuredFactor = 0;
           var annualPremium = parseFloat($('#txtInvestAmount').val().replace(/\,/g, '')) * parseFloat($('#ddlModeOfPremium').val());
           var PolicyTerm = parseFloat($('#ddlPolicyTerm').val());
           tenTimeAnnualSA = 10;

           if (annualPremium < 500000) {
               if (age >= 0 && age < 45) {
                   switch (PolicyTerm) {
                       case 5:
                       case 10:
                           factoredSA = 0.5 * PolicyTerm;
                           SumAssuredFactor = tenTimeAnnualSA > factoredSA ? tenTimeAnnualSA : factoredSA;
                           break;
                       case 15:
                       case 20:
                           SumAssuredFactor = 15;
                           break;
                   }
               }
               else if (age >= 45) {
                   factoredSA = 0.25 * PolicyTerm;
                   SumAssuredFactor = tenTimeAnnualSA > factoredSA ? tenTimeAnnualSA : factoredSA;
               }
           }
           else {
               if (age >= 0 && age < 45) {
                   switch (PolicyTerm) {
                       case 5:
                       case 10:
                           factoredSA = 0.5 * PolicyTerm;
                           SumAssuredFactor = tenTimeAnnualSA > factoredSA ? tenTimeAnnualSA : factoredSA;
                           break;
                       case 15:
                       case 20:
                           SumAssuredFactor = 20;
                           break;
                   }
               }
               else if (age >= 45) {
                   factoredSA = 0.25 * PolicyTerm;
                   SumAssuredFactor = tenTimeAnnualSA > factoredSA ? tenTimeAnnualSA : factoredSA;
               }
           }

           return SumAssuredFactor;
       },

       PremiumPaymentModeChange: function () {
           var premiumPaymentMode = parseInt($('#ddlModeOfPremium').val(), 0);
           var premiumPaymentModeValue = $("#ddlModeOfPremium option:selected").text();
           if (fundAllocation) {
               fundAllocation.setPremiumPaymentFrequency(premiumPaymentMode);
           }
           $('#emPaymentMode').html(premiumPaymentModeValue);
           switch (premiumPaymentMode) {
               case 1:
                   $('#aPremiumhange').html("change to Monthly");
                   $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt($('#txtInvestAmount').val().replace(/\,/g, '')) / 12, 11) + " ");
                   break;
               default:
                   $('#aPremiumhange').html("change to Annual");
                   $('#spnSecPremium').html(GetIndianCurrencyFormattedAmountPayment(parseInt($('#txtInvestAmount').val().replace(/\,/g, '')) * premiumPaymentMode, 11) + " ");
                   break;
           }

           webEvent.TriggerLifeCoverOptions();
       },

       InvestmentAmountChange: function () {
           this.TriggerLifeCoverOptions();
       },

       InvestmentForOptionChange: function () {
           if (webApp.IsBuyingForSelf()) {
               $('#divProposerInfo').css('display', 'none');
               $('#headerLifeAssuredTitle').html("Life Assured Info");
               $('#hdnIsProposer').val('0');
           } else {
               $('#divProposerInfo').css('display', 'block');
               $('#headerLifeAssuredTitle').html("Proposers Info");
               $('#hdnIsProposer').val('1');
           }
           //this.SwitchBetweenLAandProposer();
       },

       SwitchBetweenLAandProposer: function () {
           this.SwitchBetweenControls();
           if (webApp.IsBuyingForSelf()) {
               webEvent.ClearProposerDetails();
               webEvent.FillLifeInsuredDetails();
           } else {
               webEvent.ClearLifeInsuredDetails();
               webEvent.FillProposerDetails();
           }
       },

       FillLifeInsuredDetails: function () {
           webEvent.ClearLaDetailsLabels();
           $('#txtFirstName').val(enquiryResponse.FirstName);
           $('#txtMiddleName').val(enquiryResponse.MiddleName);
           $('#txtLastName').val(enquiryResponse.LastName);
           $('#txtMobileNo').val(enquiryResponse.MobileNumber);
           $('#txtEmail').val(enquiryResponse.EmailId);
           if (enquiryResponse.IsGenderMale) {
               $('#rdogenderMale').prop('checked', true);
               $('#rdogenderFemale').prop('checked', false);
           } else {
               $('#rdogenderFemale').prop('checked', true);
               $('#rdogenderMale').prop('checked', false);
           }
           webEvent.SetLaDetailsLabels();
       },

       FillProposerDetails: function () {
           webEvent.ClearProposerDetailsLables();
           $('#txtChildFirstName').val(enquiryResponse.FirstName);
           $('#txtChildMiddleName').val(enquiryResponse.MiddleName);
           $('#txtChildLastName').val(enquiryResponse.LastName);
           $('#txtProEmail').val(enquiryResponse.EmailId);
           if (enquiryResponse.IsGenderMale) {
               $('#rdoProMale').prop('checked', true);
               $('#rdoProFemale').prop('checked', false);
           } else {
               $('#rdoProFemale').prop('checked', true);
               $('#rdoProMale').prop('checked', false);
           }
           webEvent.SetProposerDetailsLabels();
       },

       ClearLifeInsuredDetails: function () {
           $('#txtFirstName').val("");
           $('#txtMiddleName').val("");
           $('#txtLastName').val("");
           $('#txtMobileNo').val("");
           $('#txtEmail').val("");
           $('#rdogenderMale').prop('checked', true);
           $('#rdogenderFemale').prop('checked', false);
           webEvent.ClearLaDetailsLabels();
       },

       ClearProposerDetails: function () {
           $('#txtChildFirstName').val("");
           $('#txtChildMiddleName').val("");
           $('#txtChildLastName').val("");
           $('#txtProEmail').val("");
           $('#rdoProMale').prop('checked', true);
           $('#rdoProFemale').prop('checked', false);
           webEvent.ClearProposerDetailsLables();
       },

       SwitchBetweenControls: function () {
           if (webApp.IsBuyingForSelf()) {
               $('#liLAMobileNumber').css('display', 'inline-block');
               $("#txtMobileNo").val("").addClass("required");
               $('#lblMobileNo').html("");
               $('#errcity').html("*Please select the city that you currently reside in.");
               $('#liLAEmailAddress').css('display', 'inline-block');
               $("#txtEmail").val("").addClass("required");
               $('#lblEmail').html("");
           } else {
               $('#liLAMobileNumber').css('display', 'none');
               $("#txtMobileNo").val("").removeClass("required");
               $('#lblMobileNo').html("");
               $('#errcity').html("*Please select the city, Child currently resides in.");
               $('#liLAEmailAddress').css('display', 'none');
               $("#txtEmail").val("").removeClass("required");
               $('#lblEmail').html("");
           }
           Validator.InternationalNumberValidation(false);
       },

       SetLaDetailsLabels: function () {
           $('#lblName').html(webApp.GetFullName());
           $('#lblMobileNo').html($("#txtMobileNo").val());
           $('#lblEmail').html($("#txtEmail").val());
           var SelectedDay = $('#ddlDay option:selected').text();
           var SelectedMonth = $('#ddlMonth option:selected').text();
           var SelectedYear = $('#ddlYear option:selected').text();
           $('#lblDOB').html(SelectedDay + '-' + SelectedMonth + '-' + SelectedYear);

           if ($('#rdogenderMale').is(':checked')) {
               $('#lblGender').html('Male');
           }
           else {
               $('#lblGender').html('Female');
           }
       },

       SetProposerDetailsLabels: function () {
           $('#lblChildName').html($("#txtChildFirstName").val());
           var SelectedProDay = $('#ddlChildDay option:selected').text();
           var SelectedProMonth = $('#ddlChildMonth option:selected').text();
           var SelectedProYear = $('#ddlChildYear option:selected').text();
           $('#lblChildDOB').html(SelectedProDay + '-' + SelectedProMonth + '-' + SelectedProYear);
           if ($('#rdoProMale').is(':checked')) {
               $('#lblChildGender').html('Male');
           }
           else {
               $('#lblChildGender').html('Female');
           }
       },

       ClearLaDetailsLabels: function () {
           $('#lblName').html("");
           $('#lblMobileNo').html("");
           $('#lblEmail').html("");
           $('#lblDOB').html("");
           $('#lblCity').html("");
           $('#lblGender').html("");
       },

       ClearProposerDetailsLables: function () {
           $('#lblChildName').html("");
           $('#lblChildDOB').html("");
           $('#lblChildGender').html("");
       }
   }

var Validator =
{
    SectionToOpen: "",

    ControlToFocus: "",

    ValidateAndOpenDefaultAccordion: function () {
        if (webApp.IsBuyingForSelf()) {
            $('#liYourself').addClass('active'); $('#liChild').removeClass('active');
        } else {
            $('#liYourself').removeClass('active'); $('#liChild').addClass('active');
        }
        this.ValidateAllValidators();
    },

    NameValidation: function () {
        if ($('#txtFirstName').val() != "") {
            $('#txtFirstName').removeClass('errorMsg');
            $('#errFName').css('display', 'none');
            return true;
        }
        else {
            $('#txtFirstName').addClass('errorMsg');
            $('#errFName').css('display', 'block');
            Validator.SetControlToFocus("#txtFirstName");
            return false;
        }
    },

    LastNameValidation: function () {
        if ($('#txtLastName').val() != "") {
            $('#txtLastName').removeClass('errorMsg');
            $('#errLName').css('display', 'none');
            return true;
        }
        else {
            $('#txtLastName').addClass('errorMsg');
            $('#errLName').css('display', 'block');
            Validator.SetControlToFocus("#txtLastName");
            return false;
        }
    },

    ChildNameValidation: function () {
        if ($('#txtChildFirstName').val() != "") {
            $('#txtChildFirstName').removeClass('errorMsg');
            $('#errProFName').css('display', 'none');
            return true;
        }
        else {
            $('#txtChildFirstName').addClass('errorMsg');
            $('#errProFName').css('display', 'block');
            Validator.SetControlToFocus("#txtChildFirstName");
            return false;
        }
    },

    ChildLastNameValidation: function () {
        if ($('#txtChildLastName').val() != "") {
            $('#txtChildLastName').removeClass('errorMsg');
            $('#errProLName').css('display', 'none');
            return true;
        }
        else {
            $('#txtChildLastName').addClass('errorMsg');
            $('#errProLName').css('display', 'block');
            Validator.SetControlToFocus("#txtChildLastName");
            return false;
        }
    },

    EmailValidation: function () {
        var Email = $('#txtEmail').val();
        if (!isValueMasked(Email)) {
            if (Email != '' && validateEmail(Email) == true) {
                $('#txtEmail').removeClass('errorMsg');
                $('#errEmail').css('display', 'none');
                return true;
            }
            else {
                $('#txtEmail').addClass('errorMsg');
                $('#errEmail').css('display', 'block');
                Validator.SetControlToFocus("#txtEmail");
                return false;
            }
        }
    },

    MobileNumberValidation: function () {
        var Mobile = $('#txtMobileNo').val();
        if (!isValueMasked(Mobile)) {
            if (Mobile != '' && isValidMobileNumber(Mobile) == true) {
                $('#txtMobileNo').removeClass('errorMsg');
                $('#errMobileNo').css('display', 'none');
                return true;
            }
            else {
                $('#txtMobileNo').addClass('errorMsg');
                $('#errMobileNo').css('display', 'block');
                Validator.SetControlToFocus("#txtMobileNo");
                return false;
            }
        }
        return true;
    },

    InvestAmountSelected: function () {
        var InvestAmount = parseFloat($('#txtInvestAmount').val().replace(/\,/g, ''));
        if (isNaN(InvestAmount)) {
            InvestAmount = 0;
        }

        if (InvestAmount <= 0) {
            $('#txtInvestAmount').addClass('errorMsg');
            $('#errInvestAmount').css('display', 'block');
            Validator.SetControlToFocus("#txtInvestAmount");
            $('#errInvestAmount')[0].innerHTML = 'Please enter the Investment amount.';
            return false;
        }

        var paymentMode = parseFloat($('#ddlModeOfPremium').val());
        var PayTerm = $('#ddlPayTerm').val();
        var minimumAnnualInvestment = 36000;

        if (InvestAmount * paymentMode < minimumAnnualInvestment) {
            $('#txtInvestAmount').addClass('errorMsg');
            $('#errInvestAmount').css('display', 'block');
            Validator.SetControlToFocus("#txtInvestAmount");
            $('#errInvestAmount')[0].innerHTML = 'Invest amount entered is less than the min. Rs. ' + (minimumAnnualInvestment / paymentMode);
            return false;
        }
        else {
            var returnVal = true;
            $('#txtInvestAmount').removeClass('errorMsg');
            $('#errInvestAmount').css('display', 'none');
            $('#errInvestAmount')[0].innerHTML = "";
            if ($('#txtInvestAmount').val().replace(/\,/g, '') % 100 != 0) {
                $('#txtInvestAmount').addClass('errorMsg');
                $('#errInvestAmountMultiple').css('display', 'block');
                Validator.SetControlToFocus("#txtInvestAmount");
                returnVal = false;
            }
            else {
                $('#txtInvestAmount').removeClass('errorMsg');
                $('#errInvestAmountMultiple').css('display', 'none');

            }

            return returnVal;
        }

    },

    PolicyTermSelected: function () {
        if ($("#ddlPolicyTerm").val() != '0') {
            $('#ddlPolicyTerm').removeClass('errorMsg');
            $('#errPolicyTerm').css('display', 'none');
            return true;
        }
        else {
            $('#ddlPolicyTerm').addClass('errorMsg');
            $('#errPolicyTerm').css('display', 'block');
            Validator.SetControlToFocus("#ddlPolicyTerm");
            return false;
        }
    },

    ModeOfPremiumSelected: function () {
        if ($("#ddlModeOfPremium").val() != '0') {
            $('#ddlModeOfPremium').removeClass('errorMsg');
            $('#errModeOfPremium').css('display', 'none');
            return true;
        }
        else {
            $('#ddlModeOfPremium').addClass('errorMsg');
            $('#errModeOfPremium').css('display', 'block');
            Validator.SetControlToFocus("#ddlModeOfPremium");
            return false;
        }
    },

    DOBSelected: function () {
        if (($("#ddlDay").val() != 'selected') && ($("#ddlMonth").val() != 'selected') && ($("#ddlYear").val() != 'selected')) {
            var DOB = $("#ddlMonth").val() + '-' + $("#ddlDay").val() + '-' + $("#ddlYear").val();
            var age = parseInt(webUtility.CalculateAge());
            $('#hdnAge').val(age);
            var minAge = 18;
            var maxAge = 60;

            if (age >= minAge && age <= maxAge) {
                ControlBase.BindPolicyTerm();
                $('.LAdob').removeClass('errorMsg');
                $('#errDOB').css('display', 'none');
                return true;
            }
            else {
                $('.LAdob').addClass('errorMsg');
                $('#errDOB').css('display', 'block');
                $('#errDOB')[0].innerHTML = 'Please enter age between ' + minAge + ' and ' + maxAge;
                Validator.SetControlToFocus(".LAdob");
                return false;
            }
        }
        else {
            $('.LAdob').addClass('errorMsg');
            $('#lblError_DOB').css('display', '');
            Validator.SetControlToFocus(".LAdob");
            return false;
        }
    },

    ChildDOBSelected: function () {
        if (($("#ddlChildDay").val() != 'selected') && ($("#ddlChildMonth").val() != 'selected') && ($("#ddlChildYear").val() != 'selected')) {
            var DOB = $("#ddlChildDay").val() + '-' + $("#ddlChildMonth").val() + '-' + $("#ddlChildYear").val();
            var age = parseInt(webUtility.CalculateChildAge());
            var minAge = 0;
            var maxAge = 18;

            if (age >= minAge && age < maxAge) {
                $('.Prodob').removeClass('errorMsg');
                $('#errProDOB').css('display', 'none');
                ControlBase.BindPolicyTerm();
                return true;
            }
            else {
                $('.Prodob').addClass('errorMsg');
                $('#errProDOB').css('display', 'block');
                $('#errProDOB')[0].innerHTML = 'Please enter age between ' + minAge + ' and ' + maxAge;
                Validator.SetControlToFocus(".Prodob");
                return false;
            }
        }
        else {
            $('.Prodob').addClass('errorMsg');
            $('#errProDOB').css('display', '');
            Validator.SetControlToFocus(".Prodob");
            return false;
        }
    },

    IsValidDOBSelectedForCalculation: function () {
        var minAge = 18; var maxAge = 60;
        var age = parseInt(webUtility.CalculateAgeByDate(webApp.GetInsuredDOBForCalculation(), '/'));;
        if (!webApp.IsBuyingForSelf()) {
            minAge = 0; maxAge = 18;
            age = parseInt(webUtility.CalculateAgeByDate(webApp.GetChildDOB(), '/'));
        }

        if (age >= minAge && age <= maxAge) {
            return true;
        }
        else {
            return false;
        }
    },

    IsValidDOBSelected: function () {
        var age = webUtility.CalculateAge();
        var minAge = 18; var maxAge = 60;

        if (age >= minAge && age <= maxAge) {
            return true;
        }
        else {
            return false;
        }
    },

    IsValidChildDOBSelected: function () {
        var age = webUtility.CalculateChildAge();
        var minAge = 0; var maxAge = 18;

        if (age >= minAge && age <= maxAge) {
            return true;
        }
        else {
            return false;
        }
    },

    InternationalNumberValidation: function (isDisplay) {
        $('#txtInternationalNumber').removeClass("required");
        if (webApp.IsNRIResident()) {
            $('#liInternationalMobileNumberLA').css('display', 'inline-block');
            var Mobile = $('#txtInternationalNumber').val();
            if (!isValueMasked(Mobile)) {
                if (Mobile != '' && isValidInternationalMobileNumber(Mobile) == true) {
                    $('#txtInternationalNumber').removeClass('errorMsg');
                    $('#errInternationalMobileNoLA').css('display', 'none');
                    return true;
                }
                else {
                    $('#txtInternationalNumber').addClass('errorMsg');
                    $('#errInternationalMobileNoLA').css('display', 'block');
                    Validator.SetControlToFocus('#txtInternationalNumber');
                    return false;
                }
            }
        }
        else {
            $('#liInternationalMobileNumberLA').css('display', 'none');
            return true;
        }
        return true;
    },

    CalculationFunction: function () {
        var check = "";
        check = check + ',' + Validator.InvestAmountSelected();
        check = check + ',' + Validator.IsValidDOBSelectedForCalculation();
        check = check + ',' + Validator.isValidFundAllocationInfo();
        var blnResult = true;

        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                blnResult = false;
                break;
            }
        }
        return blnResult;
    },

    SetAccordionToOpen: function (sectionName) {
        if (Validator.SectionToOpen === "") {
            Validator.SectionToOpen = sectionName;
        }
    },

    SetControlToFocus: function (controlName) {
        if (Validator.ControlToFocus === "") {
            Validator.ControlToFocus = controlName;
        }
    },

    ResetValidationParams: function () {
        ShowHide.ShowHideAllAccordions(false);
        Validator.ControlToFocus = "";
        Validator.SectionToOpen = "";
    },

    ValidateAllValidators: function () {
        Validator.ResetValidationParams();

        var check = "";
        if (!webApp.IsBuyingForSelf()) {
            check = check + ',' + Validator.isValidChildInfo();
        }
        check = check + ',' + Validator.isValidAdditionalInfo();
        check = check + ',' + Validator.isValidInsuredInfo();
        check = check + ',' + Validator.isValidPremiumInfo();
        check = check + ',' + Validator.isValidFundAllocationInfo();
        var blnResult = true;

        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                blnResult = false;
                break;
            }
        }

        if (!blnResult) {
            ShowHide.VerifyAccordionToOpen();
        }

        if (blnResult) {
            $('#txtInvestAmount').val(parseInt($('#txtInvestAmount').val().replace(/\,/g, ''), 0));
        }

        return blnResult;
    },

    isValidPremiumInfo: function () {
        var isValid = true;
        var check = "";
        check = check + ',' + Validator.InvestAmountSelected();
        check = check + ',' + Validator.PolicyTermSelected();
        check = check + ',' + Validator.ModeOfPremiumSelected();
        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                isValid = false;
                break;
            }
        }
        if (!isValid) {
            Validator.SetAccordionToOpen(ShowHide.ACCORDION_PREMIUM);
        }

        return isValid;
    },

    isValidInsuredInfo: function () {
        var isValid = true;
        var check = "";
        check = check + ',' + Validator.NameValidation();
        check = check + ',' + Validator.LastNameValidation();
        //if (webApp.IsBuyingForSelf()) {
        //    check = check + ',' + Validator.InternationalNumberValidation();
        //    check = check + ',' + Validator.MobileNumberValidation();

        //}
        check = check + ',' + Validator.InternationalNumberValidation();
        check = check + ',' + Validator.MobileNumberValidation();
        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                isValid = false;
                break;
            }
        }
        if (!isValid) {
            Validator.SetAccordionToOpen(ShowHide.ACCORDION_INSURED);
        }

        return isValid;
    },

    isValidChildInfo: function () {
        var isValid = true;
        var check = "";
        check = check + ',' + Validator.ChildNameValidation();
        check = check + ',' + Validator.ChildLastNameValidation();
        check = check + ',' + Validator.ChildDOBSelected();
        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                isValid = false;
                break;
            }
        }
        if (!isValid) {
            Validator.SetAccordionToOpen(ShowHide.ACCORDION_PROPOSER);
        }

        return isValid;
    },

    isValidAdditionalInfo: function () {
        var isValid = true;
        var check = "";
        check = check + ',' + Validator.DOBSelected();
        check = check + ',' + Validator.EmailValidation();
        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                isValid = false;
                break;
            }
        }
        if (!isValid) {
            Validator.SetAccordionToOpen(ShowHide.ACCORDION_ADDITIONAL);
        }

        return isValid;
    },

    isValidFundAllocationInfo: function () {
        var isValid = true;
        var check = "";
        check = check + ',' + fundAllocationControl.IsValidAllocation();
        var sepratecomma = check.split(',');
        for (var i = 0; i < sepratecomma.length; i++) {
            if (sepratecomma[i] == "false") {
                isValid = false;
                break;
            }
        }

        if (!isValid) {
            Validator.SetAccordionToOpen(ShowHide.ACCORDION_FUND);
        }

        return isValid;
    }
}

var ShowHide =
    {
        ACCORDION_PREMIUM: "PREMIUM",
        ACCORDION_INSURED: "INSURED",
        ACCORDION_PROPOSER: "PROPOSER",
        ACCORDION_ADDITIONAL: "ADDITIONAL",
        ACCORDION_FUND: "FUND",

        ShowHideAllAccordions: function (displayOn) {
            ShowHide.ManagePremiumInfo(displayOn);
            ShowHide.ManageBasicInfo(displayOn);
            ShowHide.ManageProInfo(displayOn);
            ShowHide.ManageAdditionalDetails(displayOn);
            fundAllocationControl.ManageFundDetails(displayOn);
        },

        ManageBasicInfo: function (displayOn) {
            if (displayOn == true) {
                $('#pnlBasic').slideDown();
                $('.BasicInfo_group_click').addClass('active');
                $('.dummyheaderbasic').css('display', 'none');

                if ($('.BasicInfo_group_click').hasClass('active') == true) {
                    $('.BasicInfo_group_click').children().children().first().removeClass('editData');
                    $('.BasicInfo_group_click').children().children().first().addClass('closeData');
                }
            }
            else {
                $('#pnlBasic').slideUp();
                $('.BasicInfo_group_click').removeClass('active');
                $('.dummyheaderbasic').css('display', 'block');

                if ($('.BasicInfo_group_click').hasClass('active') != true) {
                    $('.BasicInfo_group_click').children().children().first().addClass('editData');
                    $('.BasicInfo_group_click').children().children().first().removeClass('closeData');
                }
            }
        },

        ManageProInfo: function (displayOn) {
            if (displayOn == true) {
                $('#pnlProBasic').slideDown();
                $('.ProBasicInfo_group_click').addClass('active');
                $('.dummyheaderProposerbasic').css('display', 'none');

                if ($('.ProBasicInfo_group_click').hasClass('active') == true) {
                    $('.ProBasicInfo_group_click').children().children().first().removeClass('editData');
                    $('.ProBasicInfo_group_click').children().children().first().addClass('closeData');
                }
            }
            else {
                $('#pnlProBasic').slideUp();
                $('.ProBasicInfo_group_click').removeClass('active');
                $('.dummyheaderProposerbasic').css('display', 'block');

                if ($('.ProBasicInfo_group_click').hasClass('active') != true) {
                    $('.ProBasicInfo_group_click').children().children().first().addClass('editData');
                    $('.ProBasicInfo_group_click').children().children().first().removeClass('closeData');
                }
            }
        },

        ManagePremiumInfo: function (displayOn) {
            if (displayOn == true) {
                $('#pnlPremiumInfo').slideDown();
                $('.PremiumInfo_group_click').addClass('active');
                $('.dummyheaderPremium').css('display', 'none');

                if ($('.PremiumInfo_group_click').hasClass('active') == true) {
                    $('.PremiumInfo_group_click').children().children().first().removeClass('editData');
                    $('.PremiumInfo_group_click').children().children().first().addClass('closeData');
                }
            }
            else {
                $('#pnlPremiumInfo').slideUp();
                $('.PremiumInfo_group_click').removeClass('active');
                $('.dummyheaderPremium').css('display', 'block');

                if ($('.PremiumInfo_group_click').hasClass('active') != true) {
                    $('.PremiumInfo_group_click').children().children().first().addClass('editData');
                    $('.PremiumInfo_group_click').children().children().first().removeClass('closeData');
                }
            }
        },

        ManageAdditionalDetails: function (displayOn) {
            if (displayOn == true) {
                $('#pnlAdditionalDetails').slideDown();
                $('.AdditionalDetails_group_click').addClass('active');
                $('.dummyheaderadditional').css('display', 'none');

                if ($('.AdditionalDetails_group_click').hasClass('active') == true) {
                    $('.AdditionalDetails_group_click').children().children().first().removeClass('editData');
                    $('.AdditionalDetails_group_click').children().children().first().addClass('closeData');
                }
            }
            else {
                $('#pnlAdditionalDetails').slideUp();
                $('.AdditionalDetails_group_click').removeClass('active');
                $('.dummyheaderadditional').css('display', 'block');

                if ($('.AdditionalDetails_group_click').hasClass('active') != true) {
                    $('.AdditionalDetails_group_click').children().children().first().addClass('editData');
                    $('.AdditionalDetails_group_click').children().children().first().removeClass('closeData');
                }
            }
        },

        VerifyAccordionToOpen: function () {

            if (Validator.SectionToOpen !== "") {
                switch (Validator.SectionToOpen) {
                    case ShowHide.ACCORDION_PREMIUM:
                        ShowHide.ManagePremiumInfo(true);
                        break;
                    case ShowHide.ACCORDION_INSURED:
                        ShowHide.ManageBasicInfo(true);
                        break;
                    case ShowHide.ACCORDION_PROPOSER:
                        ShowHide.ManageProInfo(true);
                        break;
                    case ShowHide.ACCORDION_ADDITIONAL:
                        ShowHide.ManageAdditionalDetails(true);
                        break;
                    case ShowHide.ACCORDION_FUND:
                        fundAllocationControl.ManageFundDetails(true);
                        break;
                    default:
                        ShowHide.ManagePremiumInfo(true);
                        break;
                }
            }

            if (Validator.ControlToFocus !== "") {
                var control = $(Validator.ControlToFocus);
                if (control) {
                    control.focus();
                }
            }
        }
    }

var ControlBase =
    {
        Initialize: function () {
            this.BindPolicyTerm();
            this.BindPayTerm();
            webEvent.TriggerLifeCoverOptions();
        },

        BindPolicyTerm: function () {
            var Age = webApp.GetAge();
            var PolicyTerm = $('#ddlPolicyTerm');
            var PropAge = parseInt(webUtility.CalculateChildAge());
            if (isNaN(PropAge)) {
                PropAge = 0;
            }
            var minPolicyterm = 5;
            var maxPolicyterm = 20;
            var selectedPolicyTerm = parseInt(PolicyTerm.val(), 0);

            if (webApp.IsBuyingForSelf()) {
                if (Age > 55) {
                    maxPolicyterm = 15;
                }
            }

            PolicyTerm.empty();
            PolicyTerm.append($('<option></option>').val("0").html("Select PolicyTerm"));
            for (var i = minPolicyterm; i <= maxPolicyterm; i += 5) {
                if (webApp.IsBuyingForSelf()) {
                    PolicyTerm.append($('<option></option>').val(i).html(i + ' years'));
                }
                else {
                    if ((PropAge + i) >= 18) {
                        PolicyTerm.append($('<option></option>').val(i).html(i + ' years'));
                    }
                }
            }

            PolicyTerm.val($('#hdnPostTerm').val());
            document.getElementById('ddlPolicyTerm').setAttribute("style", "color:#737373;");
        },

        BindPayTerm: function () {
            var Age = webApp.GetAge();
            var PolicyTermVal = parseInt($('#ddlPolicyTerm').val());
            var PayTerm = $('#ddlPayTerm');
            PayTerm.empty();
            if ((parseInt(PolicyTermVal, 0) > 0)) {
                var allowedPaymentTerm = [];
                switch (PolicyTermVal) {
                    case 10:
                        allowedPaymentTerm.push(5);
                        allowedPaymentTerm.push(7);
                        break;
                    case 15:
                        allowedPaymentTerm.push(10);
                        break;
                    case 20:
                        allowedPaymentTerm.push(15);
                        break;
                }

                allowedPaymentTerm.push(PolicyTermVal);
                allowedPaymentTerm.forEach(function (element) {
                    PayTerm.append($('<option></option>').val(element).html(element + ' years'));
                });
            } else {
                PayTerm.append($('<option></option>').val("0").html("Select Payment Term"));
            }

            PayTerm.val($('#hdnPayingTermType').val());
        },

        RegisterEvents: function () {
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
        },

        LoadBasicControls: function () {
            $('#txtBasicSumAssured').val(webApp.GetSumAssured());
            var BasicSumAssured = document.getElementById("txtBasicSumAssured");
            //$('#lblSumAssured').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(BasicSumAssured.value, 14));
            $('#lblName').html(webApp.GetFullName());
            $('#lblMobileNo').html($("#txtMobileNo").val());
            $('#lblEmail').html($("#txtEmail").val());
            var SelectedDay = $('#ddlDay option:selected').text();
            var SelectedMonth = $('#ddlMonth option:selected').text();
            var SelectedYear = $('#ddlYear option:selected').text();
            $('#lblDOB').html(SelectedDay + '-' + SelectedMonth + '-' + SelectedYear);
            $('#lblTotalPayout').html(GetIndianCurrencyFormattedAmountPayment($("#txtInvestAmount").val(), 14));
            $('#lblModeOfPremium').html($('#ddlModeOfPremium option:selected').text());
            $('#lblCoverage').html(GetIndianCurrencyFormattedAmountPayment($("#txtBasicSumAssured").val(), 14));

            $('#lblResidentialStatus').html($('#ddlResidentialStatus option:selected').text());
            $('#lblPolicyTerm').html($('#ddlPolicyTerm option:selected').text());
            $('#lblPayOption').html($('#ddlPayTerm option:selected').text());

            var SelectedProDay = $('#ddlChildDay option:selected').text();
            var SelectedProMonth = $('#ddlChildMonth option:selected').text();
            var SelectedProYear = $('#ddlChildYear option:selected').text();

            $('#lblChildDOB').html(SelectedProDay + '-' + SelectedProMonth + '-' + SelectedProYear);
            $('#lblChildName').html($("#txtChildFirstName").val());
            if ($('#rdogenderMale').is(':checked')) {
                $('#lblGender').html('Male');
            }
            else {
                $('#lblGender').html('Female');
            }
            if ($('#rdoProMale').is(':checked')) {
                $('#lblChildGender').html('Male');
            }
            else {
                $('#lblChildGender').html('Female');
            }
            if ($('#hdnIsProposer').val() * 1 == 1) {
                $('#divProposerInfo').css('display', 'block');
            }
            else {
                $('#divProposerInfo').css('display', 'none');
            }

            webEvent.PremiumPaymentModeChange();
            changeDetected();
            if ($('#rdoInvestforChild').is(':checked') == true) {
                $('#liOccupation').css('display', 'none');
            }

            //personalInfo.ManageDOBYearOnBuyingForSelection();
        }
    }

function HightLightProceedButton() {
    var isValid = isValidationPassedForMobile();
    if (isValid) {
        $('#divTotalPremium').addClass('btnHightLight');
    }
    else {
        $('#divTotalPremium').removeClass('btnHightLight');
    }
}

function isValidationPassedForMobile() {
    if ($('#txtInvestAmount').val() == '') {
        return false;
    }

    if ($("#ddlPolicyTerm").val() == '0') {
        return false;
    }

    if ($('#txtFirstName').val() == '') {
        return false;
    }
    if ($('#txtLastName').val() == '') {
        return false;
    }

    if (($("#ddlDay").val() == 'selected') || ($("#ddlMonth").val() == 'selected') || ($("#ddlYear").val() == 'selected')) {
        return false;
    }

    if ($('#hdnCity').val() == '') {
        return false;
    }

    if ($("#ddlResidentialStatus").val() == '0') {
        return false;
    }

    if (webApp.IsBuyingForSelf()) {
        if ($('#txtMobileNo').val().length != 10) {
            return false;
        }
        if ($('#txtEmail').val() == '') {
            return false;
        }
    }

    // If Proposer Is Selected
    if ($('#hdnIsProposer').val() == "1") {
        if ($('#txtChildFirstName').val() == '') {
            return false;
        }

        if ($('#txtChildLastName').val() == '') {
            return false;
        }

        if ($('#txtProEmail').val() == '') {
            return false;
        }

        if (($("#ddlChildDay").val() == 'selected') || ($("#ddlChildMonth").val() == 'selected') || ($("#ddlChildYear").val() == 'selected')) {
            return false;
        }
    }

    var isFundValid = Validator.isValidFundAllocationInfo();
    if (!isFundValid)
        return false;

    return true;
}
