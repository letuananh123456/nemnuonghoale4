$(document).ready(function () {
    calc.OnLoad();
});

var requestResponseStatus = {
    SUCCESS: 'SUCCESS',
    FAILURE: 'FAILURE',
    EXCEPTION: 'EXCEPTION'
}
var requestType = {
    NORMAL: 'NORMAL',
    UPDATE: 'UPDATE',
    RIDER: 'Rider'
}
var calc = {
    OnLoad: function () {
        this.InitializeEvents();
        //this.GetInitialCalculationResponse();
    },

    SwapPremiumEvents: function () {
        calc.PopulatePremiumDetails(UpdateCalresponse);
    },

    InitializeEvents: function () {

    },

    GetInitialCalculationResponse: function () {
        var url = 'http://termuat.policybazaar.com:8081/api/productInfo/879/?';
        //var querystring = window.location.search.substring(1);
        var querystring = 'enquiryId=<%postenquiryId%>&tabName=oneTimePlans&isMulti=true&isAlreadyExist=true&v=1500042703390';
        querystring = querystring.replace('<%postenquiryId%>', $('#hdnPostEnquiryId').val());
        initialRequest = querystring;
        url = url + querystring;
        url = "Landing.aspx/GetPBProductInfo";
        $.ajax({
            type: "POST",
            url: url,
            data: "{ 'request': '" + querystring + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                //if (response.status == undefined && response != null && response != undefined) {
                if (response != null && response.d != null && response.d.status == undefined) {
                    var result = $.parseJSON(response.d);
                    var orderedRespose = calcUtility.SetResponseOrder(result);
                    initialCalculationResponse = orderedRespose;
                    UpdateCalresponse = orderedRespose;
                    logger.LogDetails(calcUtility.GetEnquiryIdFromQueryString(initialRequest), initialRequest, JSON.stringify(result),
                        requestResponseStatus.SUCCESS, requestType.NORMAL);
                    calc.PopulatePremiumDetails(orderedRespose);


                }
                else if (result.status == 'failed') {
                    logger.LogDetails(calcUtility.GetEnquiryIdFromQueryString(initialRequest), initialRequest, JSON.stringify(result),
                        requestResponseStatus.FAILURE, requestType.NORMAL);
                    //alert('failed');
                }
                //alert('success');
            },
            error: function (xhr) {
                logger.LogDetails(calcUtility.GetEnquiryIdFromQueryString(initialRequest), initialRequest, xhr.responseText,
                    requestResponseStatus.EXCEPTION, requestType.NORMAL);
                //alert("Failed to load data");
            }
        });
    },

    RegisterCustomer: function () {
        var request = JSON.stringify(calcUtility.GetClientRequestParams());
        $.ajax({
            type: "POST",
            url: "Landing.aspx/UpdatePBProductInfo",//"http://termuat.policybazaar.com:8081/api/productInfo/update",
            data: "{ 'request': '" + request + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response != undefined && response.d != undefined && response.d.status == undefined) {
                    var result = $.parseJSON(response.d);
                    calc.PopulatePremiumDetails(result);
                    initialCalculationResponse = response;
                    UpdateCalresponse = response;
                }
                else if (result.status == 'failed') {
                    logger.LogDetails(initialCalculationResponse.custInfo.encodedEnquiryId, customerRequest, JSON.stringify(result),
                        requestResponseStatus.FAILURE, requestType.UPDATE);
                }
            },
            error: function (xhr) {
                logger.LogDetails(initialCalculationResponse.custInfo.encodedEnquiryId, customerRequest, xhr.responseText,
                    requestResponseStatus.EXCEPTION, requestType.UPDATE);
            }
        });
    },
    
    PopulatePremiumDetails: function (premiumDetails) {
        try {
            if (premiumDetails.HasError == false) {
                var costOfProduct = 8 - parseFloat(premiumDetails.ReturnValue.IRR);
                $('#lblProductCost').html(Math.round((costOfProduct) * 100) / 100 + ' %');
                $('#lblMaturityValue').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(premiumDetails.ReturnValue.HighReturnFund), 15);
                $('#lblTerm').html($('#ddlPolicyTerm').val() + ' Years');
                $('#lblPayTerm').html($('#ddlPayTerm').val() + ' Years');
                $('#LblBasePremium').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment($('#txtInvestAmount').val()), 15);
                $('#spnPremium').html( GetIndianCurrencyFormattedAmountPayment($('#txtInvestAmount').val().replace(/\,/g, '')), 15);
                $('#hdnFundValue').val(premiumDetails.ReturnValue.HighReturnFund);
                this.PopulateDynamicMaturity(costOfProduct);
            }
        }
        catch (e) {
            alert('Please try after sometime')
        }
    },

    PopulateDynamicMaturity: function (costOfProduct) {
        var request = calcUtility.GetClientRequestParams();
        var rateOfMaturity = parseFloat($('#hdnPerformanceRate').val());
        if (rateOfMaturity > 0) {
            $('#lblDynamicMaturityRate').html("Maturity Value @ " + rateOfMaturity + " %");
            $('#liDynamicMaturitySection').css('display', 'block');
            rateOfMaturity = rateOfMaturity - parseFloat(costOfProduct);
            var calculatedMaturity = calcUtility.CalculateHistoricalReturn(request.Premium, rateOfMaturity, request.PolicyTerm, request.PayTerm, request.Frequency)
            $('#spnDynamicMaturityValue').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + GetIndianCurrencyFormattedAmountPayment(calculatedMaturity), 15);
        } else {
            $('#liDynamicMaturitySection').css('display', 'none');
        }
    }
}

var logger = {
    LogDetails: function (enquiryId, request, response, status, typeOfRequest) {
        var pbPricingLog = new Object();
        pbPricingLog.EnquiryId = 0;
        pbPricingLog.RequestData = request;
        pbPricingLog.ResponseStatus = status;
        pbPricingLog.ResponseData = response;
        pbPricingLog.ApplicationNumber = enquiryId;
        pbPricingLog.CreatedBy = 1;
        pbPricingLog.ExceptionData = "";
        pbPricingLog.RequestType = typeOfRequest;
        pbPricingLog.RequestDateTime = new Date();
        pbPricingLog.ResponseDateTime = new Date();
        var request = JSON.stringify(pbPricingLog);
        $.ajax({
            type: "POST",
            url: "http://localhost:54821/Landing.aspx/LogDetails",
            data: "{'pbPricingLog': " + request + " }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

            },
            error: function (xhr) {
                //alert("Failed to load data");
            }
        });
    }
}
calcUtility = {
    GetEnquiryIdFromQueryString: function (queryString) {
        var enquiryId = '';
        var splittedQueryString = [];
        splittedQueryString = queryString.split('&');
        for (i = 0; i < splittedQueryString.length; i++) {
            var result = []; result = splittedQueryString[i].split('=');
            if (result[0] == 'enquiryId') {
                enquiryId = result[1];
                break;
            }
        }
        return enquiryId
    },

    SetResponseOrder: function (response) {
        var orderdResponse = new Object();
        orderdResponse.custInfo = response.custInfo;
        orderdResponse.isAllPlanLoaded = response.isAllPlanLoaded;
        orderdResponse.isMultiplePlanExist = response.isMultiplePlanExist;
        orderdResponse.planToSwitch = response.planToSwitch;
        orderdResponse.ppt = response.ppt;
        orderdResponse._class = response._class;
        orderdResponse.supplierPlans = null;
        orderdResponse.supplierPlans = new Array();
        for (var i = 0; i < response.supplierPlans.length; i++) {
            if (response.supplierPlans[i].planDetails[0].planId == 879) {
                orderdResponse.supplierPlans.push(response.supplierPlans[i]);
            }
        }
        for (var i = 0; i < response.supplierPlans.length; i++) {
            if (response.supplierPlans[i].planDetails[0].planId == 8791) {
                orderdResponse.supplierPlans.push(response.supplierPlans[i]);
            }
        }
        for (var i = 0; i < response.supplierPlans.length; i++) {
            if (response.supplierPlans[i].planDetails[0].planId == 8792) {
                orderdResponse.supplierPlans.push(response.supplierPlans[i]);
            }
        }
        return orderdResponse;
    },

    GetClientRequestParams: function () {
        var requestIsHigh = $('#hdnRequestIsHigh').val();
        var requestIsSecure = $('#hdnRequestIsSecure').val();
        var fundValue = new Object();
        fundValue.PlanID = 255;
        fundValue.LeadID = $('#hdnMatrixLeadId').val();
        fundValue.EnquiryID = $('#hdnEnquiryId').val();
        fundValue.ApplicationNo = "";
        fundValue.InsuredName = $('#txtFirstName').val();

        if (webApp.IsBuyingForSelf()) {
            fundValue.InsuredDOB = webApp.GetInsuredDOBForCalculation();
        } else {
            fundValue.InsuredDOB = webApp.GetChildDOB();
        }
        
        fundValue.InsuredGender = webApp.IsMaleGender() == true ? 1 : 2;
        fundValue.EmailID = $('#hdnEmail').val();
        fundValue.MobileNo = $('#hdnMobile').val();
        fundValue.PolicyTerm = webApp.PolicyTerm();
        fundValue.PayTerm = $('#ddlPayTerm').val();
        fundValue.Premium = parseInt($('#txtInvestAmount').val().replace(/\,/g, ''), 0);
        fundValue.MultiplierForLifeCover = $('#ddlLifeCoverMultiplierFactor').val();
        fundValue.Frequency = $('#ddlModeOfPremium').val();
        if ($('#hdnIsProposer').val() == "1") {
            fundValue.ProposerName = $('#txtChildFirstName').val();
            fundValue.ProposerAge = webUtility.CalculateChildAge();
            fundValue.ProposerGender = $('#rdoProMale').is(':checked') ? 1 : 2; //0;
        }
        else {
            fundValue.ProposerAge = 0;
            fundValue.ProposerGender = 0;
        }
        
        fundValue.FundPercentage = [
            {
                FundName: "BluechipEquityFund",
                Percent: calcUtility.GetFundAllocationNumber("BluechipEquityFund")
            },
            {
                FundName: "AssetAllocationFundII",
                Percent: calcUtility.GetFundAllocationNumber("AssetAllocationFundII")
            },
            {
                FundName: "EquityGrowthFundII",
                Percent: calcUtility.GetFundAllocationNumber("EquityGrowthFundII")
            },
            {
                FundName: "BondFund",
                Percent: calcUtility.GetFundAllocationNumber("BondFund")
            },
            {
                FundName: "Liquidfund",
                Percent: calcUtility.GetFundAllocationNumber("Liquidfund")
            },
            {
                FundName: "AcceleratorMidCapFundII",
                Percent: calcUtility.GetFundAllocationNumber("AcceleratorMidCapFundII")
            },
            {
                FundName: "PureStockFundII",
                Percent: calcUtility.GetFundAllocationNumber("PureStockFundII")
            },
            {
                FundName: "PureStockFund",
                Percent: calcUtility.GetFundAllocationNumber("PureStockFund")
            }
        ],

        fundValue.FundTransferPercentage = [
            {
                FundName: "BluechipEquityFund",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("BluechipEquityFund")
            },
            {
                FundName: "AssetAllocationFundII",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("AssetAllocationFundII")
            },
            {
                FundName: "EquityGrowthFundII",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("EquityGrowthFundII")
            },
            {
                FundName: "AcceleratorMidCapFundII",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("AcceleratorMidCapFundII")
            },
            {
                FundName: "PureStockFundII",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("PureStockFundII")
            },
            {
                FundName: "PureStockFund",
                Percent: calcUtility.GetAutoTransferFundAllocationNumber("PureStockFund")
            }
        ],

        fundValue.InvestmentStrategies = [
            {
                Strategy: "InvestorSelectable",
                IsApplied: calcUtility.GetBenefitOption("InvestorSelectable")
            },
            {
                Strategy: "WheelOfLife",
                IsApplied: calcUtility.GetBenefitOption("WheelOfLife")
            },
            {
                Strategy: "TriggerBased",
                IsApplied: calcUtility.GetBenefitOption("TriggerBased")
            },
            {
                Strategy: "AutoTransfer",
                IsApplied: calcUtility.GetBenefitOption("AutoTransfer")
            }
        ],
        fundValue.IsJnK = false,
        fundValue.GivenFileName = "abc.pdf",
        fundValue.IllustrationNo = null,
        fundValue.ProposalNo = null,
        fundValue.PolicyNo = null,
        fundValue.UIN = null,
        fundValue.Riders = null

        return fundValue;
    },

    GetFundAllocationNumber: function (fundName) {
        var fundSelections = fundAllocation.GetFundSelections();
        switch (fundName) {
            case "BluechipEquityFund":
                return fundSelections.BlueChipEquity;
                break;
            case "AssetAllocationFundII":
                return fundSelections.AssetAllocation;
                break;
            case "EquityGrowthFundII":
                return fundSelections.EquityGrowth;
                break;
            case "BondFund":
                return fundSelections.BondFund;
                break;
            case "Liquidfund":
                return fundSelections.LiquidFund;
                break;
            case "AcceleratorMidCapFundII":
                return fundSelections.AcceleratorMidCap;
                break;
            case "PureStockFundII":
                return fundSelections.PureStockFund2;
                break;
            case "PureStockFund":
                return fundSelections.PureStock;
                break;
        }
    },

    GetAutoTransferFundAllocationNumber: function (fundName) {
        var fundSelections = fundAllocation.GetAutoTransferFundSelections();
        switch (fundName) {
            case "BluechipEquityFund":
                return fundSelections.BlueChipEquity;
                break;
            case "AssetAllocationFundII":
                return fundSelections.AssetAllocation;
                break;
            case "EquityGrowthFundII":
                return fundSelections.EquityGrowth;
                break;
            case "AcceleratorMidCapFundII":
                return fundSelections.AcceleratorMidCap;
                break;
            case "PureStockFundII":
                return fundSelections.PureStockFund2;
                break;
            case "PureStockFund":
                return fundSelections.PureStock;
                break;
        }
    },

    GetBenefitOption: function (benefitName) {
        var fundSelections = fundAllocation.GetFundSelections();
        switch(benefitName){
            case "WheelOfLife":
                if(fundSelections.BenefitOptionSelected == "rdoWheelOfLifePortfolio")
                    return true;
                break;
            case "InvestorSelectable":
                if(fundSelections.BenefitOptionSelected == "rdoInvestorSelectablePortfolio")
                    return true;
                break;
            case "TriggerBased":
                if(fundSelections.BenefitOptionSelected == "rdoTriggerBasedPortfolio")
                    return true;
                break;
            case "AutoTransfer":
                if(fundSelections.BenefitOptionSelected == "rdoAutoTransferPortfolio")
                    return true;
                break;
        }

        return false;
    },

    CalculateHistoricalReturn: function (amount, rateOfReturn, term, payTerm, paymentFrequency) {
        amount = amount * 1;
        rateOfReturn = rateOfReturn * 1;
        term = term*1;
        payTerm = payTerm * 1;
        paymentFrequency = paymentFrequency * 1;

        amount = amount * paymentFrequency;
        if (paymentFrequency > 1) {
            paymentFrequency = 1;
        }
        var maturityValue = 0;
        if (rateOfReturn !== null) {
            if (term > payTerm) {
                var rate = (100 + rateOfReturn) / 100;
                var x = (1 - Math.pow(rate, (payTerm)));
                var y = 1 - rate;
                var tr = Math.round((amount * x) / y);
                maturityValue = Math.round(tr + tr * rateOfReturn / 100);
                maturityValue = maturityValue * Math.pow(rate, (term - payTerm));
            }
            else {
                var rate = (100 + rateOfReturn) / 100;
                var x = (1 - Math.pow(rate, (term)));
                var y = 1 - rate;
                var tr = Math.round((amount * x) / y);
                maturityValue = Math.round(tr + tr * rateOfReturn / 100);
            }
        }

        return maturityValue;
    }
}