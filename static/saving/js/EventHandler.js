var pbEventTracker = {
    Event:{
        PlatformLeadId: 0,
        EventName: '',
        PageName: ''
    },

    Clear: function(){
        this.Event.PlatformLeadId = 0;
        this.Event.EventName = '';
        this.Event.PageName = '';
    },

    LogEvent: function () {
        var request = JSON.stringify(this.Event);

        $.ajax({
            type: "POST",
            url: "Landing.aspx/TrackLeadJourney",
            data: "{ 'request': '" + request + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response != undefined && response.d != undefined && response.d.status == undefined) {
                    var result = $.parseJSON(response.d);
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
}

var applicationEvents = {
    JourneyTracker: {
        LogEvent: function (leadId, requestName, pageName) {
            pbEventTracker.Clear();
            if (leadId> 0 && requestName != "") {
                pbEventTracker.Event.PlatformLeadId = leadId;
                pbEventTracker.Event.EventName = requestName;
                pbEventTracker.Event.PageName = pageName;
                pbEventTracker.LogEvent();
            }
        }
    },

    Logger: {
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
                url: "Landing.aspx/LogDetails",
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
}