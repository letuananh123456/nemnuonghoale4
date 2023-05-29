Claim.service("resourceConfig", [function () {
    return {
        "environment": "L",
        "timeout": {
            "s": 3000,
            "m": 6000,
            "l": 12000,
            "o": 1800000
        },
        "connectionString": {
            "D": "http://localhost:50396/",
            "Q": "https://claimqaapi.policybazaar.com/",
            "U": "https://uatmatrixapi.policybazaar.com/MRS/",
            "L": "https://claimapi.policybazaar.com/"
        },
        "context": {
            "C": "ClaimCustomer",
            "G": "ClaimGarage",
            "S": "ClaimSurveyor",
            "I": "ClaimInsurer",
            "IN": "ClaimInvestigator",
            "DG": "GarageOb",
            "SR":"Surveyor"
        },
        "contextHealth": {
            "C": "ClaimCustomerhl",
            "H": "ClaimHospitalhl",
            "T": "ClaimTPAhl",
            "I": "ClaimInsurerhl"
        },
        "calling": {
            "D": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "Q": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "U": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "L": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740"
        },
        "callingHealth": {
            "D": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "Q": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "U": "http://10.0.91.32/services/easyobcall.php?phone=645740",
            "L": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740"
        },
        "communication": {
            "D": "http://10.0.10.19:8091/Mailbox/MailBox/",
            "Q": "http://10.0.10.19:8091/Mailbox/MailBox/",
            "U": "http://10.0.10.19:8091/Mailbox/MailBox/",
            "L": "https://matrixliveapi.policybazaar.com/CommnMailBox/Mailbox/MailBox/"
        },
        "combox": {
            "D": "http://qamatrixapi.policybazaar.com/CommnMailBox/Mailbox/index/",
            "Q": "http://qamatrixapi.policybazaar.com/CommnMailBox/Mailbox/index/",
            "U": "http://qamatrixapi.policybazaar.com/CommnMailBox/Mailbox/index/",
            "L": "https://matrixliveapi.policybazaar.com/CommnMailBox/Mailbox/index/"
        },
        "BMSLink": {
            "D": "http://bmstest.policybazaar.com/",
            "Q": "http://bmstest.policybazaar.com/",
            "U": "http://bmstest.policybazaar.com/",
            "L": "http://bmszone.policybazaar.com/"
        },
        "TicketsLink": {
            "D": "http://10.0.10.29:5562/",
            "Q": "http://10.0.10.29:5562/",
            "U": "http://tickets.policybazaar.com/",
            "L": "http://tickets.policybazaar.com/"
        },
        "TranscriptsLink": {
            "D": "http://ai.policybazaar.com/transcript/",
            "Q": "http://ai.policybazaar.com/transcript/",
            "U": "http://ai.policybazaar.com/transcript/",
            "L": "http://ai.policybazaar.com/transcript/"
        },
        "ComUpdate": {
            "D": "http://qamatrixapi.policybazaar.com/Communication/Communication.svc/",
            "Q": "http://qamatrixapi.policybazaar.com/Communication/Communication.svc/",
            "U": "http://qamatrixapi.policybazaar.com/Communication/Communication.svc/",
            "L": "https://matrixliveapi.policybazaar.com/Communication/Communication.svc/"
        },
        "callTransfer": {
            "D": "http://10.0.10.19:8910/#/",
            "Q": "http://10.0.10.19:8910/#/",
            "U": "http://10.0.10.19:8910/#/",
            "L": "http://callmanager.policybazaar.com/#/"
        },
        "ChatRoom": {
            "D": "http://qamatrixapi.policybazaar.com/communication/Commhistory.svc/GetChatRooms/",
            "Q": "http://qamatrixapi.policybazaar.com/communication/Commhistory.svc/GetChatRooms/",
            "U": "http://matrixliveapi.policybazaar.com/communication/Commhistory.svc/GetChatRooms/",
            "L": "https://matrixliveapi.policybazaar.com/communication/Commhistory.svc/GetChatRooms/"
        },
        "ChatHistory": {
            "D": "http://matrixliveapi.policybazaar.com/communication/commhistory.svc/GetCommReports",
            "Q": "http://matrixliveapi.policybazaar.com/communication/commhistory.svc/GetCommReports",
            "U": "http://matrixliveapi.policybazaar.com/communication/commhistory.svc/GetCommReports",
            "L": "https://matrixliveapi.policybazaar.com/communication/commhistory.svc/GetCommReports"
        },
        "NCBConfirmation": {
            "D": "http://10.80.10.98:8080/pa/MaxLife?ApplicationNo=0&SupplierId=0&ProductId=117&Hit=2&RegNo=",
            "Q": "http://10.80.10.98:8080/pa/MaxLife?ApplicationNo=0&SupplierId=0&ProductId=117&Hit=2&RegNo=",
            "U": "http://10.80.10.98:8080/pa/MaxLife?ApplicationNo=0&SupplierId=0&ProductId=117&Hit=2&RegNo=",
            "L": "http://10.80.10.98:8080/pa/MaxLife?ApplicationNo=0&SupplierId=0&ProductId=117&Hit=2&RegNo="
        },
        "InboundQueue": {
            "D": "http://10.0.48.26/api/claimapi/addqueue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            "Q": "http://10.0.48.26/api/claimapi/addqueue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            "U": "http://10.0.48.26/api/claimapi/addqueue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            //"L": "https://asterisk9132.policybazaar.com/api/claimapi/addqueue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue"
            "L": "http://10.80.30.96/api/dialer/queue_actions.php?queue_name=@Queue&emp_id=@EmployeeID&action=login"
        },
        "RemoveInboundQueue": {
            "D": "http://10.0.48.26/api/claimapi/removequeue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            "Q": "http://10.0.48.26/api/claimapi/removequeue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            "U": "http://10.0.48.26/api/claimapi/removequeue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue",
            //"L": "https://asterisk9132.policybazaar.com/api/claimapi/removequeue.php?emp_id=@EmployeeID&queue_name=@Queue&product_name=@Queue"			
            "L": "http://10.80.30.96/api/dialer/queue_actions.php?queue_name=@Queue&emp_id=@EmployeeID&action=logout"
        },
        "calendar": {
            "D": "/calendar.htm",
            "Q": "/calendar.htm",
            "U": "/calendar.htm",
            "L": "/calendar.htm"
        },
        "Authorization": {
            "D": "cG9saWN5 YmF6YWFy",
            "Q": "cG9saWN5 YmF6YWFy",
            "U": "cG9saWN5 YmF6YWFy",
            "L": "cG9saWN5 YmF6YWFy"
        },
        "AuthorizationCommunication": {
            "D": "",
            "Q": "",
            "U": "",
            "L": ""
        },
        "internalMatrixRef": {
            "serviceUrl": "../Service.asmx/",
            "settings": "../Content/XML/Resource.xml"
        },
        "AsteriskUrl": {
            "D": "asterisk9132.policybazaar.com",
            "Q": "asterisk9132.policybazaar.com",
            "L": "asterisk9132.policybazaar.com"
        },
        "QFCGarageDetailUrl": {
            "D": "https://qaapi.quickfixcars.com/claim/garage-details-oem-oes?claimid=",
            "Q": "https://qaapi.quickfixcars.com/claim/garage-details-oem-oes?claimid=",
            "L": "https://api.quickfixcars.com/claim/garage-details-oem-oes?claimid="
        },
        "AudatexAIUrl": {
            "D": "https://www-a.audatex.net/axnlogin/opentask.do?username=policybzr&password=policybzr&processName=General&toDoListItem=Policy+Data&task=",
            "Q": "https://www-a.audatex.net/axnlogin/opentask.do?username=policybzr&password=policybzr&processName=General&toDoListItem=Policy+Data&task=",
            "L": "https://www.audatex.in/axnlogin/opentask.do?username=policybzr1&password=policybzr1&processName=General&toDoListItem=Policy+Details&task="
        },
        "QFCGarageBooking": {
            "D": "https://qaapi.quickfixcars.com/garage/booking/create",
            "Q": "https://qaapi.quickfixcars.com/garage/booking/create",
            "L": "https://api.quickfixcars.com/garage/booking/create"
        },
        "QFCDeepLink": {
            "D": "https://qacrm.quickfixcars.com/dashboard/lead/detail-claim/",
            "Q": "https://qacrm.quickfixcars.com/dashboard/lead/detail-claim/",
            "L": "https://crm.quickfixcars.com/dashboard/lead/detail-claim/"
        },
        "AddUserToWebphone": {
            "D": "http://pbdialcrm.policybazaar.com/sip.php?action=add&agents=@EmployeeID",
            "Q": "http://pbdialcrm.policybazaar.com/sip.php?action=add&agents=@EmployeeID",
            "L": "http://pbdialcrm.policybazaar.com/sip.php?action=add&agents=@EmployeeID"
        },
        "contextTravel": {
            "C": "ClaimCustomertrvl",
            "I": "ClaimInsurertrvl"
        },
        "callingTravel": {
            "D": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740",
            "Q": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740",
            "U": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740",
            "L": "https://asterisk9132.policybazaar.com/services/easyobcall.php?phone=645740"
        }
    };
}]);