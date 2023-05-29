$(document).ready(function () {
    //fundAllocation.initialize();
    fundAllocationControl.initialize();

    $('.FundStrategy').change(function () {
        fundAllocationControl.ResetAndHideFundAllocation();
        fundAllocationControl.fundStrategyChanged();
    });

    $('.requiredFund').blur(function () {
        var sumOfAllocation = 0;
        if (fundAllocationControl.isAllocatedNumberValid()) {
            $(".requiredFund").each(function () {
                var allocatedNumber = parseInt($(this).val(), 0);
                if (allocatedNumber > 0) {
                    sumOfAllocation = sumOfAllocation + allocatedNumber;
                }
            });

            if (sumOfAllocation === 100) {
                $("#liInvalidSumFundAllocation").css('display', 'none');
                $(".requiredFund").each(function () {
                    $(this).removeClass('errorMsg');
                });
                fundAllocationControl.FundAllocationChanged();
            } else {
                $("#liInvalidSumFundAllocation").css('display', 'block');
                $(".requiredFund").each(function () {
                    var allocatedNumber = parseInt($(this).val(), 0);
                    if (allocatedNumber <= 0) {
                        $(this).addClass('errorMsg');
                    }
                });
            }
        }
    });



    $('.autoTransferFund').blur(function () {
        var sumOfAllocation = 0;
        if (fundAllocationControl.isAutoTransferAllocatedNumberValid()) {
            $(".autoTransferFund").each(function () {
                var allocatedNumber = parseInt($(this).val(), 0);
                if (allocatedNumber > 0) {
                    sumOfAllocation = sumOfAllocation + allocatedNumber;
                }
            });

            if (sumOfAllocation === 100) {
                $("#liInvalidAutoTransferSum").css('display', 'none');
                $(".autoTransferFund").each(function () {
                    $(this).removeClass('errorMsg');
                });
                fundAllocationControl.FundAllocationChanged();
            } else {
                $("#liInvalidAutoTransferSum").css('display', 'block');
                $(".autoTransferFund").each(function () {
                    var allocatedNumber = parseInt($(this).val(), 0);
                    if (allocatedNumber <= 0) {
                        $(this).addClass('errorMsg');
                    }
                });
            }
        }
    });

    if ($('#hdnPaymentFrequency').val() == "1") {
        $('.lblAutoTransferPortfolio').show();
    }
    else {
        $("#rdoAutoTransferPortfolio").prop("checked", false);
        $("#rdoInvestorSelectablePortfolio").prop("checked", true);
        $('.lblAutoTransferPortfolio').hide();
    }

});

var fundAllocationControl = {
    isAllocatedNumberValid: function () {
        var isValidated = true;
        $(".requiredFund").each(function () {
            var allocatedNumber = parseInt($(this).val(), 0);
            if (allocatedNumber > 0) {
                if ((allocatedNumber % 5) != 0) {
                    $(this).addClass("errorMsg");
                    $(this).focus();
                    isValidated = false;
                }
            } else {
                $(this).removeClass("errorMsg");
            }
        });

        return isValidated;
    },

    isAutoTransferAllocatedNumberValid: function () {
        var isValidated = true;
        $(".autoTransferFund").each(function () {
            var allocatedNumber = parseInt($(this).val(), 0);
            if (allocatedNumber > 0) {
                if ((allocatedNumber % 5) != 0) {
                    $(this).addClass("errorMsg");
                    $(this).focus();
                    isValidated = false;
                }
            } else {
                $(this).removeClass("errorMsg");
            }
        });

        return isValidated;
    },

    initialize: function () {
        $('#pnlFundDetails').slideUp();
        //if (fundAllocation.premiumPaymentFrequency === 12) {
        //    $('.lblAutoTransferPortfolio').css('display', 'none');
        //} else {
        //    $('.lblAutoTransferPortfolio').css('display', 'block');
        //}
        this.defaultLoad();
    },

    defaultLoad: function () {
        this.ShowHideFundAllFunds(false);
        var selectedFundName = fundAllocation.getSelected();
        switch (selectedFundName) {
            case "rdoWheelOfLifePortfolio":
                $('#lblSelectedFundStrategy').html("Wheel of Life Portfolio");
                $('.clsFundDiv').hide();
                this.AutoTransferFundDisplay(false, 0);
                break;
            case "rdoInvestorSelectablePortfolio":
                $('#lblSelectedFundStrategy').html("Investors Selectable portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(false, 0);
                this.ShowHideFundAllFunds(true);
                break;
            case "rdoAutoTransferPortfolio":
                $('#lblSelectedFundStrategy').html("Auto Transfer Portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(true, -1);
                fundAllocation.showBondFund(-1);
                fundAllocation.showLiquidFund(-1);
                break;
            case "rdoTriggerBasedPortfolio":
                $('#lblSelectedFundStrategy').html("Trigger Based Portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(false, 0);
                fundAllocation.showBondFund(-1, true);
                fundAllocation.showEquityGrowthFundII(-1, true);
                break;
        }
        fundAllocationControl.defaultFundSelectionOption();
    },

    defaultFundSelectionOption: function () {
        var requestIsSecure = $('#hdnRequestIsSecure').val();
        var requestIsHigh = $('#hdnRequestIsHigh').val();
        if (requestIsSecure === "true") {
            $('#spnDefaultFund').html("Bond Fund");
            $('#txtBondFund').val("100");
        }
        if (requestIsHigh === "true") {
            $('#spnDefaultFund').html("Equity Growth Fund II");
            $('#txtEquityGrowthFundII').val("100");
        }
    },

    fundStrategyChanged: function () {
        var selectedFundName = fundAllocation.getSelected();
        switch (selectedFundName) {
            case "rdoWheelOfLifePortfolio":
                $('#lblSelectedFundStrategy').html("Wheel of Life Portfolio");
                $('.clsFundDiv').hide();
                this.AutoTransferFundDisplay(false, 0);
                fundAllocationControl.FundAllocationChanged();
                break;
            case "rdoInvestorSelectablePortfolio":
                $('#lblSelectedFundStrategy').html("Investors Selectable portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(false, 0);
                this.ShowHideFundAllFunds(true);
                fundAllocation.AttachBlurRequiredFund();
                break;
            case "rdoAutoTransferPortfolio":
                $('#lblSelectedFundStrategy').html("Auto Transfer Portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(true, 0);
                fundAllocation.showBondFund(0);
                fundAllocation.showLiquidFund(0);
                break;
            case "rdoTriggerBasedPortfolio":
                $('#lblSelectedFundStrategy').html("Trigger Based Portfolio");
                $('.clsFundDiv').show();
                this.AutoTransferFundDisplay(false, 0);
                fundAllocation.showBondFund(25, true);
                fundAllocation.showEquityGrowthFundII(75, true);
                fundAllocationControl.FundAllocationChanged();
                break;
        }
    },

    ResetAndHideFundAllocation: function () {
        this.ResetFundAllocation();
        this.ShowHideFundAllFunds(false);
    },

    ResetFundAllocation: function () {
        $('.clsFundallocation').each(function () {
            $(this).val("0");
            $(this).removeClass('errorMsg');
            $(this).removeClass("requiredFund");
            $(this).attr("readonly", false);
        });
    },

    ShowHideFundAllFunds: function (value) {
        $('.clsFundallocation').each(function () {
            if (value) {
                $(this).addClass("required")
                $(this).addClass("requiredFund");
            } else {
                $(this).removeClass("required")
                $(this).removeClass("requiredFund");
            }
        });
        $('.selectableFund').each(function () {
            if (value) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    },

    ManageFundDetails: function (displayOn) {
        if (displayOn == true) {
            $('#pnlFundDetails').slideDown();
            $('.FundDetails_group_click').addClass('active');
            $('.dummyheaderfundDetails').css('display', 'none');

            if ($('.FundDetails_group_click').hasClass('active') == true) {
                $('.FundDetails_group_click').children().children().first().removeClass('editData');
                $('.FundDetails_group_click').children().children().first().addClass('closeData');
            }
        }
        else {
            $('#pnlFundDetails').slideUp();
            $('.FundDetails_group_click').removeClass('active');
            $('.dummyheaderfundDetails').css('display', 'block');

            if ($('.FundDetails_group_click').hasClass('active') != true) {
                $('.FundDetails_group_click').children().children().first().addClass('editData');
                $('.FundDetails_group_click').children().children().first().removeClass('closeData');
            }
        }
    },

    AutoTransferFundDisplay: function (displayOn, defaultValue) {
        if (displayOn) {
            $('.autoTransferApplicableFunds').show();
            $('#erInvalidSumFundAllocation').html("*One of Bond or Liquid fund should be 100 % and Sum of all below funds should be equal to 100.");
            $('#liInvalidSumFundAllocation').css('display', 'block');
            if (defaultValue >= 0) {
                $('.autoTransferFund').each(function () {
                    $(this).val("0").addClass("required")
                });
            }
        } else {
            $('.autoTransferApplicableFunds').hide();
            $('#erInvalidSumFundAllocation').html("*Sum of all the funds selected should be 100 only.");
            $('#liInvalidSumFundAllocation').css('display', 'none');
            $('.autoTransferFund').each(function () {
                $(this).val("0").removeClass("required")
            });
        }
    },

    IsValidAllocation: function () {
        var isValidated = false;
        var selectedFundName = fundAllocation.getSelected();
        switch (selectedFundName) {
            case "rdoWheelOfLifePortfolio":
                isValidated = true;
                break;
            case "rdoAutoTransferPortfolio":
                isValidated = this.isAutoTransferValidated();
                break;
            default:
                var sumOfAllocation = 0;
                $(".requiredFund").each(function () {
                    var allocatedNumber = parseInt($(this).val(), 0);
                    if (allocatedNumber > 0) {
                        sumOfAllocation = sumOfAllocation + allocatedNumber;
                    }
                });
                if (sumOfAllocation === 100) {
                    isValidated = true;
                }
                else {
                    $(".requiredFund").each(function () {
                        var allocatedNumber = parseInt($(this).val(), 0);
                        if (allocatedNumber < 1) {
                            $(this).addClass("errorMsg");
                        } else {
                            $(this).removeClass("errorMsg");
                        }
                    });
                }
                break;
        }
        return isValidated;
    },

    isAutoTransferValidated: function () {
        var isAutotransferValid = false;
        isAutotransferValid = fundAllocation.AutoTransferValidation();



        if (isAutotransferValid) {
            isAutotransferValid = false;
            var sumOfAllocationNested = 0;
            $(".autoTransferFund").each(function () {
                var allocatedNumber = parseInt($(this).val(), 0);
                if (allocatedNumber > 0) {
                    sumOfAllocationNested = sumOfAllocationNested + allocatedNumber;
                }
            });
            if (sumOfAllocationNested === 100) {
                isAutotransferValid = true;
                $('#liInvalidAutoTransferSum').css('display', 'none');
            }
            else {
                $('#liInvalidAutoTransferSum').css('display', 'block');
                $(".autoTransferFund").each(function () {
                    var allocatedNumber = parseInt($(this).val(), 0);
                    if (allocatedNumber < 1) {
                        $(this).addClass("errorMsg");
                    } else {
                        $(this).removeClass("errorMsg");
                    }
                });
            }
        }

        return isAutotransferValid;
    },

    FundAllocationChanged: function () {
        if (typeof changeDetected === "function") {
            changeDetected();
        }
    }
};

var fundAllocation = {
    premiumPaymentFrequency: 0,

    initialize: function () {
        if (this.premiumPaymentFrequency === 0) {
            this.premiumPaymentFrequency = 1;
        }
    },

    setPremiumPaymentFrequency: function (value) {
        this.premiumPaymentFrequency = value;
        //if (fundAllocation.premiumPaymentFrequency === 12) {
        //    $('.lblAutoTransferPortfolio').css('display', 'none');
        //} else {
        //    $('.lblAutoTransferPortfolio').css('display', 'block');
        //}
    },

    getSelected: function () {
        var checkedFundStrategy = "";
        $(".FundStrategy").children().each(function () { if ($(this).prop('checked')) { checkedFundStrategy = $(this).val() } });
        return checkedFundStrategy;
    },

    showEquityGrowthFundII: function (value, markDisable) {
        if (value >= 0) {
            $('#txtEquityGrowthFundII').val(value);
        }
        $('#txtEquityGrowthFundII').addClass("required").addClass("requiredFund");
        $('#txtEquityGrowthFundII').attr("readonly", markDisable);
        $('.equitygrowth').show();
    },

    showBlueChipEquityFund: function (value, markDisable) {
        if (value >= 0) {
            $('#txtBlueChipEquityFund').val(value);
        }
        $('#txtBlueChipEquityFund').addClass("required").addClass("requiredFund");
        $('#txtBlueChipEquityFund').attr("readonly", markDisable);
        $('.bluechip').show();
    },

    showBondFund: function (value, markDisable) {
        if (value >= 0) {
            $('#txtBondFund').val(value);
        }
        var selectedFundName = fundAllocation.getSelected();

        if (selectedFundName == "rdoAutoTransferPortfolio") {
            $('#txtBondFund').addClass("required").addClass("requiredFundAutoTransfer");
            this.AttachBlurEvent();
        }
        else {
            $('#txtBondFund').addClass("required").addClass("requiredFund");
            this.AttachBlurRequiredFund();
        }


        $('#txtBondFund').attr("readonly", markDisable);
        $('.bondfund').show();
    },

    showLiquidFund: function (value, markDisable) {
        if (value >= 0) {
            $('#txtLiquidFund').val(value);
        }
        var selectedFundName = fundAllocation.getSelected();

        if (selectedFundName == "rdoAutoTransferPortfolio") {
            $('#txtLiquidFund').addClass("required").addClass("requiredFundAutoTransfer");
            this.AttachBlurEvent();
        }
        else {
            $('#txtLiquidFund').addClass("required").addClass("requiredFund");
        }
        $('#txtLiquidFund').attr("readonly", markDisable);
        $('.liquidfund').show();
    },

    showMidcapFundII: function (value, markDisable) {
        if (value >= 0) {
            $('#txtMidcapFundII').val(value);
        }
        $('#txtMidcapFundII').addClass("required").addClass("requiredFund");
        $('#txtMidcapFundII').attr("readonly", markDisable);
        $('.midcap').show();
    },

    showAssetAllocationFund: function (value, markDisable) {
        if (value >= 0) {
            $('#txtAssetAllocationFund').val(value);
        }
        $('#txtAssetAllocationFund').addClass("required").addClass("requiredFund");
        $('#txtAssetAllocationFund').attr("readonly", markDisable);
        $('.assetallocation').show();
    },

    showPureStockFund: function (value, markDisable) {
        if (value >= 0) {
            $('#txtPureStockFund').val(value);
        }
        $('#txtPureStockFund').addClass("required").addClass("requiredFund");
        $('#txtPureStockFund').attr("readonly", markDisable);
        $('.purestock').show();
    },

    showPureStockFundII: function (value, markDisable) {
        if (value >= 0) {
            $('#txtPureStockFundII').val(value);
        }
        $('#txtPureStockFundII').addClass("required").addClass("requiredFund");
        $('#txtPureStockFundII').attr("readonly", markDisable);
        $('.purestockII').show();
    },

    GetFundSelections: function () {
        return {
            BenefitOptionSelected: fundAllocation.getSelected(),
            EquityGrowth: parseInt($('#txtEquityGrowthFundII').val(), 0),
            BlueChipEquity: parseInt($('#txtBlueChipEquityFund').val(), 0),
            BondFund: parseInt($('#txtBondFund').val(), 0),
            LiquidFund: parseInt($('#txtLiquidFund').val(), 0),
            AcceleratorMidCap: parseInt($('#txtMidcapFundII').val(), 0),
            AssetAllocation: parseInt($('#txtAssetAllocationFund').val(), 0),
            PureStock: parseInt($('#txtPureStockFund').val(), 0),
            PureStockFund2: parseInt($('#txtPureStockFundII').val(), 0)
        }
    },

    GetAutoTransferFundSelections: function () {
        return {
            BenefitOptionSelected: fundAllocation.getSelected(),
            EquityGrowth: parseInt($('#txtAutoEquityGrowth').val(), 0),
            BlueChipEquity: parseInt($('#txtAutoBlueChip').val(), 0),
            AcceleratorMidCap: parseInt($('#txtAutoMidCapII').val(), 0),
            AssetAllocation: parseInt($('#txtAutoAssetAllocationII').val(), 0),
            PureStock: parseInt($('#txtAutoPureStock').val(), 0),
            PureStockFund2: parseInt($('#txtAutoPureStockII').val(), 0)
        }
    },
    AttachBlurEvent: function () {
        $('.requiredFundAutoTransfer').blur(function () {
            fundAllocation.AutoTransferValidation();

        });
    },
    AttachBlurRequiredFund:function(){
        $('.requiredFund').blur(function () {
            var sumOfAllocation = 0;
            if (fundAllocationControl.isAllocatedNumberValid()) {
                $(".requiredFund").each(function () {
                    var allocatedNumber = parseInt($(this).val(), 0);
                    if (allocatedNumber > 0) {
                        sumOfAllocation = sumOfAllocation + allocatedNumber;
                    }
                });

                if (sumOfAllocation === 100) {
                    $("#liInvalidSumFundAllocation").css('display', 'none');
                    $(".requiredFund").each(function () {
                        $(this).removeClass('errorMsg');
                    });
                    fundAllocationControl.FundAllocationChanged();
                } else {
                    $("#liInvalidSumFundAllocation").css('display', 'block');
                    $(".requiredFund").each(function () {
                        var allocatedNumber = parseInt($(this).val(), 0);
                        if (allocatedNumber <= 0) {
                            $(this).addClass('errorMsg');
                        }
                    });
                }
            }
        });
    },
    AutoTransferValidation: function () {
        var BondFundValue = parseInt($('#txtBondFund').val(), 0);
        var LiquidFundValue = parseInt($('#txtLiquidFund').val(), 0);
        var invalidCounts = 0;
        if ((BondFundValue == 100 && LiquidFundValue == 0) || (LiquidFundValue == 100 && BondFundValue == 0)) {
            $('#txtBondFund').removeClass('errorMsg');
            $('#txtLiquidFund').removeClass('errorMsg');
        }
        else {
            invalidCounts++;
            $('#txtBondFund').addClass('errorMsg');
            $('#txtLiquidFund').addClass('errorMsg');

        }

        /*   if (invalidCounts == 0) {
               if (BondFundValue + LiquidFundValue > 100) {
                   invalidCounts++;
                   $('#txtBondFund').addClass('errorMsg');
                   $('#txtLiquidFund').addClass('errorMsg');
               }
               else {
                   $('#txtBondFund').removeClass('errorMsg');
                   $('#txtLiquidFund').removeClass('errorMsg');
               }
           }*/
        if (invalidCounts > 0) {
            $("#liInvalidSumFundAllocation").css('display', 'block');
        }
        else {
            $("#liInvalidSumFundAllocation").css('display', 'none');
        }
        return invalidCounts == 0;
    }
};