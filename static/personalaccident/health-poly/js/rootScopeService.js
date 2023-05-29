Claim.service('rootScopeService', function ($rootScope, $window) {
    // Variables

    $rootScope.AgentID = 0;
    $rootScope.AgentEmpID = "TEMP";
    $rootScope.IsAgent = true;
    $rootScope.ClaimID = 0;
    $rootScope.CustomerID = 0;
    $rootScope.CustName = '';

    $rootScope.MobileNo = 0;
    $rootScope.CountryCode = 0;
    $rootScope.OTP = 0;
    $rootScope.Name = "Guest";
    $rootScope.BookingId = 0;
    $rootScope.tabId = "tracking";
    $rootScope.IsReset = false;
    $rootScope.OtpLogin = false;
    $rootScope.Message = "";
    $rootScope.ActiveLink = "Policy";
    $rootScope.MyPolicyLink = "PB";

    $rootScope.ProductID = 0;
    $rootScope.ProductName = "";
    $rootScope.InsurerID = 0;
    $rootScope.Insurer = "";
    $rootScope.Plan = "";
    $rootScope.Email = "";
    $rootScope.City = "";
    $rootScope.PraposalURL = "";
    $rootScope.Actions = "";
    $rootScope.PageId = 0;
    $rootScope.ChatLeadID = 0;
    $rootScope.IsRegistrationReq = false;
    $rootScope.CommunicationID = "";
    $rootScope.SearchFilter = "";
    $rootScope.AgentProductList = "";
    $rootScope.PaymentApprovedAmount = 0;
    $rootScope.Source = "";
    $rootScope.LoginID = 0;
    $rootScope.UserTypeID = 0;
    $rootScope.ClaimRegNo = "";
    $rootScope.ClaimMobileNo = 0;
    $rootScope.ClaimPolicyNo = "";
    $rootScope.IsInbound = false;
    $rootScope.IsWebPhone = false;
    $rootScope.PrimaryQueue = "";
    $rootScope.SecondaryQueue = "";

    $rootScope.TicketIssuesList = [11, 12, 13, 14, 15, 16, 27, 28, 29, 30, 31, 42, 43, 18, 35];

    $rootScope.TicketIssues = {
        "11": "1423;Policy Status Required",
        "12": "1426;Refund Pending",
        "13": "1424;Soft Copy not received",
        "14": "1425;Hard Copy not received",
        "15": "1431;Changes required in Policy copy",
        "16": "1420;Payment Issue",
        "43": "1430:Cancellation Request",
        "27": "1829;Inspection Status",
        "28": "1528;Refund Pending",
        "29": "1526;Soft Copy not received",
        "30": "1527;Hard Copy not received",
        "31": "1532;Changes required in Policy copy",
        "42": "1531;Cancellation Request",
        "18": "297;Policy Related",
        "35": "297;Policy Related",
        "44": "5511;Claim Related",
        "45": "5511;Claim Related"
    };

    $rootScope.ActionableBy =
    [
        { ID: 1, User: 'PB' },
        { ID: 2, User: 'Insurer' },
        { ID: 3, User: 'Garage' },
        { ID: 4, User: 'PB & Insurer' },
        { ID: 5, User: 'PB & Garage' },
        { ID: 6, User: 'PB & Insurer & Garage' },
        { ID: 7, User: 'QFC' },
        { ID: 8, User: 'PB & QFC' },
        { ID: 9, User: 'QFC & Garage' },
        { ID: 10, User: 'PB & QFC & Garage' }
    ];

    $rootScope.PendencyBy =
    [
        { ID: 1, User: 'PB' },
        { ID: 2, User: 'Insurer' },
        { ID: 3, User: 'Surveyor' },
        { ID: 4, User: 'Customer' },
        { ID: 5, User: 'Garage' },
        { ID: 6, User: 'TPA' },
        { ID: 7, User: 'Hospital' },
        { ID: 8, User: 'QFC' }
    ];

    $rootScope.Pendency = {
        "1": "Policybazaar",
        "2": "Insurer",
        "3": "Surveyor",
        "4": "Customer",
        "5": "Garage",
        "6": "TPA",
        "7": "Hospital",
        "8": "QFC"
    };

    $rootScope.ProductIcon = {
        "2": "health",
        "3": "travel",
        "7": "term",
        "101": "home",
        "106": "critical_illness",
        "114": "two_wheeler",
        "115": "investment",
        "117": "car",
        "118": "personal_accident",
        "130": "super_top-up",
        "138": "cancer_cover",
        "143": "heart",
        "144": "heart_and_cancer",
        "255": "others"
    };

    $rootScope.Product = {
        "2": "Health Insurance",
        "3": "Travel Insurance",
        "7": "Term Insurance",
        "101": "Home Insurance",
        "106": "Critical Insurance",
        "114": "Two Wheeler Insurance",
        "115": "Investment Insurance",
        "117": "Car Insurance",
        "118": "Personal Accident Insurance",
        "130": "Super Top- Up Insurance",
        "138": "Cancer Insurance",
        "143": "Heart Insurance",
        "144": "Heart and Cancer Insurance",
        "255": "Others"
    };

    $rootScope.DocsStatus =
    [
        { DocStatusID: 0, NextAppStatus: [{ DocStatusID: 3, DocStatus: 'Waiting for approval' }, { DocStatusID: 1, DocStatus: 'Approved' }] },
        { DocStatusID: 3, NextAppStatus: [{ DocStatusID: 1, DocStatus: 'Approved' }, { DocStatusID: 2, DocStatus: 'Rejected' }] },
        { DocStatusID: 1, NextAppStatus: [{ DocStatusID: 2, DocStatus: 'Rejected' }] },
        { DocStatusID: 2, NextAppStatus: [{ DocStatusID: 1, DocStatus: 'Approved' }] }
    ];

    $rootScope.VideoImageStatus =
    [
        { StatusID: 0, Status: 'Pending' },
        { StatusID: 3, Status: 'Approval Awaited' },
        { StatusID: 1, Status: 'Approved' },
        { StatusID: 2, Status: 'Rejected' }
    ];

    $rootScope.HardCopyInsurerList = [1, 8, 9, 10, 11, 13, 14, 17, 28, 35];

    $rootScope.ProductList =
        [
            { ProductId: 2, Product: 'Health Insurance' },
            { ProductId: 3, Product: 'Travel Insurance' },
            { ProductId: 7, Product: 'Term Insurance' },
            { ProductId: 101, Product: 'Home Insurance' },
            { ProductId: 106, Product: 'Critical Illness' },
            { ProductId: 114, Product: 'Two Wheeler Insurance' },
            { ProductId: 115, Product: 'Investment Plans' },
            { ProductId: 117, Product: 'Car Insurance' },
            { ProductId: 118, Product: 'Personal Accident Insurance' },
            { ProductId: 138, Product: 'Cancer Insurance' },
            { ProductId: 143, Product: 'Heart Insurance' },
            { ProductId: 144, Product: 'Heart and Cancer Insurance' },
            { ProductId: 255, Product: 'Others' }
        ];

    $rootScope.SupplierList = ["Aegon Religare.", "Apollo Munich", "Aviva Life", "Bajaj Allianz", "Bharti Axa", "Birla Sun Life",
        "Cholamandalam", "Cigna", "Future Generali", "HDFC ERGO", "HDFC Life", "ICICI Lombard", "Iffco Tokio", "Liberty Videocon",
        "Magma", "Max Bupa", "Max Life", "National Insurance", "New India Assurance", "Oriental", "Reliance", "Religare",
        "Royal Sundaram", "SBI", "Shriram", "Star", "Tata AIG", "United India", "Universal Sompo", "L&amp;amp;T", "IHO",
        "Edelweiss Tokio", "India First", "PNB Metlife", "Kotak", "Others"];

    $rootScope.CommentTypes =
    [
        { ProductId: "2", TypeValue: 1, TypeText: 'Private' },
        { ProductId: "2", TypeValue: 2, TypeText: 'Public' },
        { ProductId: "117", TypeValue: 1, TypeText: 'Private' },
        { ProductId: "117", TypeValue: 2, TypeText: 'Public' },
        { ProductId: "117", TypeValue: 3, TypeText: 'To Insurer' },
        { ProductId: "117", TypeValue: 4, TypeText: 'To Garage' },
        { ProductId: "117", TypeValue: 5, TypeText: 'To Customer' },
        { ProductId: "3", TypeValue: 1, TypeText: 'Private' },
        { ProductId: "3", TypeValue: 2, TypeText: 'Public' }
    ];

    $rootScope.RejectReason =
    [
        { RejectId: 1, RejectText: 'Other Product' },
        { RejectId: 2, RejectText: 'Advertisement' },
        { RejectId: 3, RejectText: 'Email by Insurer' },
        { RejectId: 4, RejectText: 'Customer Details not found' }
    ];

    $rootScope.RequestType =
    [
        { RequestTypeId: 1, RequestTypeText: 'New Email Requests' },
        { RequestTypeId: 2, RequestTypeText: 'New Requests' },
        { RequestTypeId: 3, RequestTypeText: 'Claim Cases' }
    ];

    $rootScope.UserTypes =
    [
        { UserTypeID: 1, UserTypeName: 'Admin' },
        //{ UserTypeID: 2, UserTypeName: 'Supervisor' },
        { UserTypeID: 3, UserTypeName: 'Team Lead' },
        { UserTypeID: 4, UserTypeName: 'Agent' }
    ];

    $rootScope.InboundStatus =
    [
        { IsInboundID: true, IsInboundText: 'Yes' },
        { IsInboundID: false, IsInboundText: 'No' }
    ];

    $rootScope.IsActiveStatus =
    [
        { IsActiveID: true, IsActiveText: 'Yes', IsActiveValue: 'Active' },
        { IsActiveID: false, IsActiveText: 'No', IsActiveValue: 'InActive' }
    ];

    $rootScope.IsAllocationStatus =
    [
        { IsAllocationID: true, IsAllocationText: 'Yes' },
        { IsAllocationID: false, IsAllocationText: 'No' }
    ];

    $rootScope.IsOnlineAllocationStatus =
    [
        { IsOnlineAllocationID: true, IsOnlineAllocationText: 'Yes' },
        { IsOnlineAllocationID: false, IsOnlineAllocationText: 'No' }
    ];

    $rootScope.GarageType =
    [
        { Type: 'Authorized' },
        { Type: 'MultiBrand' },
        { Type: 'All' }
    ];

    $rootScope.GarageTypes =
    [
        { Type: 'Authorized' },
        { Type: 'MultiBrand' }
    ];

    $rootScope.IsOnlineInsurer =
    [
        { IsOnlineID: true, IsOnlineText: 'Yes' },
        { IsOnlineID: false, IsOnlineText: 'No' }
    ];

    $rootScope.InsurerCategory =
    [
        { CategoryID: 1, CategoryText: 'A' },
        { CategoryID: 2, CategoryText: 'B' },
        { CategoryID: 3, CategoryText: 'C' }
    ];

    $rootScope.WebPhoneStatus =
    [
        { IsWebPhoneID: true, IsWebPhoneText: 'Yes' },
        { IsWebPhoneID: false, IsWebPhoneText: 'No' }
    ];

    $rootScope.CurrencyList =
    [
        { CurrencyID: 1, CurrencyText: 'INR' },
        { CurrencyID: 2, CurrencyText: 'USD' },
        { CurrencyID: 3, CurrencyText: 'EUR' }
    ];

    $rootScope.UserRole =
   [
       { UserTypeID: 1, UserTypeText: 'Admin' },
       { UserTypeID: 2, UserTypeText: 'Claim Officer' },
       { UserTypeID: 3, UserTypeText: 'Surveyor' }
   ];

    $rootScope.GarageCat = { "1": "partner", "2": "online agreed", "3": "inactive" };

    $rootScope.GarageStatusList =
    [
        { StatusID: 0, Status: 'Pending' },
        { StatusID: 1, Status: 'Active' },
        { StatusID: 2, Status: 'Inactive' }
    ];

    $rootScope.GarageStatusListFilter =
    [
        { StatusID: 0, Status: 'Pending' },
        { StatusID: 1, Status: 'Active' },
        { StatusID: 2, Status: 'Inactive' },
        { StatusID: 3, Status: 'Preferred' }
    ];

    //$rootScope.SuperAgentList = [12219, 12620, 11269, 12173, 3246, 3345, 12642, 2595, 2740, 2317,3016];

    var storage = JSON.stringify({

        AgentID: 0,
        AgentEmpID: "TEMP",
        IsAgent: true,
        ClaimID: 0,
        CustomerID: 0,
        CustName: '',

        MobileNo: 0,
        CountryCode: 0,
        OTP: 0,
        Name: "Guest",
        BookingId: 0,
        tabId: "tracking",
        IsReset: false,
        OtpLogin: false,
        Message: "",
        ActiveLink: "Policy",
        MyPolicyLink: "PB",
        ProductID: 0,
        ProductName: "",
        InsurerID: 0,
        Insurer: "",
        Plan: "",
        Email: "",
        City: "",
        PraposalURL: "",
        Actions: "",
        PageId: 0,
        ChatLeadID: 0,
        IsRegistrationReq: false,
        CommunicationID: "",
        SearchFilter: "",
        AgentProductList: "",
        PaymentApprovedAmount: 0,
        Source: "",
        LoginID: 0,
        UserTypeID: 0,
        ClaimRegNo: "",
        ClaimMobileNo: 0,
        ClaimPolicyNo: "",
        IsInbound: false,
        IsWebPhone: false,
        PrimaryQueue: "",
        SecondaryQueue: ""
    });

    var saveData = function (key, value) {
        var storage = JSON.parse($window.localStorage.getItem('data'));
        storage[key] = value;
        localStorage.setItem('data', JSON.stringify(storage));
    };

    var setValues = function () {
        var storage = JSON.stringify({
            AgentID: 0,
            AgentEmpID: "TEMP",
            IsAgent: true,
            ClaimID: 0,
            CustomerID: 0,
            CustName: '',

            MobileNo: 0,
            CountryCode: 0,
            OTP: 0,
            Name: "Guest",
            BookingId: 0,
            tabId: "tracking",
            IsReset: false,
            OtpLogin: false,
            Message: "",
            ActiveLink: "Policy",
            MyPolicyLink: "PB",
            ProductID: 0,
            ProductName: "",
            InsurerID: 0,
            Insurer: "",
            Plan: "",
            Email: "",
            City: "",
            PraposalURL: "",
            Actions: "",
            PageId: 0,
            ChatLeadID: 0,
            IsRegistrationReq: false,
            CommunicationID: "",
            SearchFilter: "",
            AgentProductList: "",
            PaymentApprovedAmount: 0,
            Source: "",
            LoginID: 0,
            UserTypeID: 0,
            ClaimRegNo: "",
            ClaimMobileNo: 0,
            ClaimPolicyNo: "",
            IsInbound: false,
            IsWebPhone: false,
            PrimaryQueue: "",
            SecondaryQueue: ""
        });

        if (localStorage.getItem("data") === null) {
            localStorage.setItem('data', storage);
            storage = JSON.parse($window.localStorage.getItem('data'));
        }
        else {
            storage = JSON.parse($window.localStorage.getItem('data'));
        }


        $rootScope.AgentID = storage.AgentID || 0;
        $rootScope.AgentEmpID = storage.AgentEmpID || "TEMP";
        $rootScope.IsAgent = storage.IsAgent;
        $rootScope.ClaimID = storage.ClaimID || 0;
        $rootScope.CustomerID = storage.CustomerID || 0;
        $rootScope.CustName = storage.CustName || '';
        $rootScope.IsInbound = storage.IsInbound;
        $rootScope.IsWebPhone = storage.IsWebPhone;

        $rootScope.MobileNo = storage.MobileNo;
        $rootScope.CountryCode = parseInt(storage.CountryCode) || 0;
        $rootScope.OTP = parseInt(storage.OTP) || 0;
        $rootScope.Name = storage.Name || "Guest";
        $rootScope.BookingId = storage.BookingId || 0;
        $rootScope.tabId = storage.tabId || "tracking";
        $rootScope.IsReset = storage.IsReset || false;
        $rootScope.OtpLogin = storage.OtpLogin || false;
        $rootScope.Message = storage.Message || "";
        $rootScope.ActiveLink = storage.ActiveLink || "Policy";
        $rootScope.MyPolicyLink = storage.MyPolicyLink || "PB";
        $rootScope.ProductName = storage.ProductName || "";
        $rootScope.InsurerID = storage.InsurerID || 0;
        $rootScope.Insurer = storage.Insurer || "";
        $rootScope.Plan = storage.Plan || "";
        $rootScope.Email = storage.Email || "";
        $rootScope.City = storage.City || "";
        $rootScope.PraposalURL = storage.PraposalURL || "";
        $rootScope.ProductID = storage.ProductID || 0;
        $rootScope.Actions = storage.Actions || "";
        $rootScope.PageId = storage.PageId || 0;
        $rootScope.ChatLeadID = storage.ChatLeadID || 0;
        $rootScope.IsRegistrationReq = storage.IsRegistrationReq || false;
        $rootScope.CommunicationID = storage.CommunicationID || "";
        $rootScope.SearchFilter = storage.SearchFilter || "";
        $rootScope.AgentProductList = storage.AgentProductList || "";
        $rootScope.PaymentApprovedAmount = storage.PaymentApprovedAmount || 0;
        $rootScope.Source = storage.Source || "";
        $rootScope.LoginID = storage.LoginID || 0;
        $rootScope.UserTypeID = storage.UserTypeID || 0;
        $rootScope.ClaimRegNo = storage.ClaimRegNo || "";
        $rootScope.ClaimMobileNo = storage.ClaimMobileNo || 0;
        $rootScope.ClaimPolicyNo = storage.ClaimPolicyNo || 0;
        $rootScope.PrimaryQueue = storage.PrimaryQueue || "";
        $rootScope.SecondaryQueue = storage.SecondaryQueue || "";
    }

    var setAgentID = function (AgentID) {
        saveData("AgentID", AgentID);
        return $rootScope.AgentID = AgentID;
    };

    var setAgentEmpID = function (AgentEmpID) {
        saveData("AgentEmpID", AgentEmpID);
        return $rootScope.AgentEmpID = AgentEmpID;
    };

    var setIsAgent = function (IsAgent) {
        saveData("IsAgent", IsAgent);
        return $rootScope.IsAgent = IsAgent;
    };

    var setIsInbound = function (IsInbound) {
        saveData("IsInbound", IsInbound);
        return $rootScope.IsInbound = IsInbound;
    };

    var setClaimID = function (ClaimID) {
        saveData("ClaimID", ClaimID);
        return $rootScope.ClaimID = ClaimID;
    };

    var setCustomerID = function (CustomerID) {
        saveData("CustomerID", CustomerID);
        return $rootScope.CustomerID = CustomerID;
    };

    var setCustName = function (CustName) {
        saveData("CustName", CustName);
        return $rootScope.CustName = CustName;
    };

    var setOtpLogin = function (OtpLogin) {
        saveData("OtpLogin", OtpLogin);
        return $rootScope.OtpLogin = OtpLogin;
    };

    var setActions = function (Actions) {
        saveData("Actions", Actions);
        return $rootScope.Actions = Actions;
    };

    var setProductID = function (ProductID) {
        saveData("ProductID", ProductID);
        return $rootScope.ProductID = ProductID;
    };

    var setProductName = function (ProductName) {
        saveData("ProductName", ProductName);
        return $rootScope.ProductName = ProductName;
    };

    var setInsurerID = function (InsurerID) {
        saveData("InsurerID", InsurerID);
        return $rootScope.InsurerID = InsurerID;
    };

    var setInsurer = function (Insurer) {
        saveData("Insurer", Insurer);
        return $rootScope.Insurer = Insurer;
    };

    var setPlan = function (Plan) {
        saveData("Plan", Plan);
        return $rootScope.Plan = Plan;
    };

    var setEmail = function (Email) {
        saveData("Email", Email);
        return $rootScope.Email = Email;
    };

    var setCity = function (City) {
        saveData("City", City);
        return $rootScope.City = City;
    };

    var setPraposalURL = function (PraposalURL) {
        saveData("PraposalURL", PraposalURL);
        return $rootScope.PraposalURL = PraposalURL;
    };

    var setIsWebPhone = function (IsWebPhone) {
        saveData("IsWebPhone", IsWebPhone);
        return $rootScope.IsWebPhone = IsWebPhone;
    };

    var setPrimaryQueue = function (PrimaryQueue) {
        saveData("PrimaryQueue", PrimaryQueue);
        return $rootScope.PrimaryQueue = PrimaryQueue;
    };

    var setSecondaryQueue = function (SecondaryQueue) {
        saveData("SecondaryQueue", SecondaryQueue);
        return $rootScope.SecondaryQueue = SecondaryQueue;
    };

    // Setter
    var setMobileNo = function (MobileNo) {
        saveData("MobileNo", MobileNo);
        return $rootScope.MobileNo = MobileNo;
    };
    var setCountryCode = function (CountryCode) {
        saveData("CountryCode", CountryCode);
        $rootScope.CountryCode = parseInt(CountryCode) || 0;
    };

    var setOTP = function (OTP) {
        saveData("OTP", OTP);
        $rootScope.OTP = parseInt(OTP) || 0;
    };

    var setName = function (Name) {
        saveData("Name", Name);
        $rootScope.Name = Name || "Guest";
    };

    var setBooking = function (BookingId) {
        saveData("BookingId", BookingId);
        $rootScope.BookingId = BookingId || 0;
    };

    var setTab = function (tabId) {
        saveData("tabId", tabId);
        return $rootScope.tabId = tabId || "tracking";
    };

    var setIsReset = function (IsReset) {
        saveData("IsReset", IsReset);
        return $rootScope.IsReset = IsReset;
    };

    var setMessage = function (Message) {
        saveData("Message", Message);
        return $rootScope.Message = Message;
    };

    var setActiveLink = function (ActiveLink) {
        saveData("ActiveLink", ActiveLink);
        return $rootScope.ActiveLink = ActiveLink;
    };

    var setMyPolicyLink = function (MyPolicyLink) {
        saveData("MyPolicyLink", MyPolicyLink);
        return $rootScope.MyPolicyLink = MyPolicyLink;
    };

    var setPageId = function (PageId) {
        saveData("PageId", PageId);
        return $rootScope.PageId = PageId;
    };

    var setChatLeadID = function (ChatLeadID) {
        saveData("ChatLeadID", ChatLeadID);
        return $rootScope.ChatLeadID = ChatLeadID;
    };

    var setIsRegistrationReq = function (IsRegistrationReq) {
        saveData("IsRegistrationReq", IsRegistrationReq);
        return $rootScope.IsRegistrationReq = IsRegistrationReq;
    };

    var setCommunicationID = function (CommunicationID) {
        saveData("CommunicationID", CommunicationID);
        return $rootScope.CommunicationID = CommunicationID;
    };

    var setSearchFilter = function (SearchFilter) {
        saveData("SearchFilter", SearchFilter);
        return $rootScope.SearchFilter = SearchFilter;
    };

    var setAgentProductList = function (AgentProductList) {
        saveData("AgentProductList", AgentProductList);
        return $rootScope.AgentProductList = AgentProductList;
    };

    var setPaymentApprovedAmount = function (PaymentApprovedAmount) {
        saveData("PaymentApprovedAmount", PaymentApprovedAmount);
        return $rootScope.PaymentApprovedAmount = PaymentApprovedAmount;
    };

    var setSource = function (Source) {
        saveData("Source", Source);
        return $rootScope.Source = Source;
    };

    var setLoginID = function (LoginID) {
        saveData("LoginID", LoginID);
        return $rootScope.LoginID = LoginID;
    };

    var setUserTypeID = function (UserTypeID) {
        saveData("UserTypeID", UserTypeID);
        return $rootScope.UserTypeID = UserTypeID;
    };

    var setClaimRegNo = function (ClaimRegNo) {
        saveData("ClaimRegNo", ClaimRegNo);
        return $rootScope.ClaimRegNo = ClaimRegNo;
    };

    var setClaimMobileNo = function (ClaimMobileNo) {
        saveData("ClaimMobileNo", ClaimMobileNo);
        return $rootScope.ClaimMobileNo = ClaimMobileNo;
    };

    var setClaimPolicyNo = function (ClaimPolicyNo) {
        saveData("ClaimPolicyNo", ClaimPolicyNo);
        return $rootScope.ClaimPolicyNo = ClaimPolicyNo;
    };

    // Getter

    var getAgentID = function () {
        return $rootScope.AgentID;
    };
    var getAgentEmpID = function () {
        return $rootScope.AgentEmpID;
    };
    var getIsAgent = function () {
        return $rootScope.IsAgent;
    };
    var getIsInbound = function () {
        return $rootScope.IsInbound;
    };
    var getClaimID = function () {
        return $rootScope.ClaimID;
    };
    var getCustomerID = function () {
        return $rootScope.CustomerID;
    };
    var getCustName = function () {
        return $rootScope.CustName;
    };


    var getMobileNo = function () {
        return $rootScope.MobileNo;
    };
    var getCountryCode = function () {
        return "+" + $rootScope.CountryCode;
    }

    var getOTP = function () {
        return $rootScope.OTP;
    }

    var getName = function () {
        return $rootScope.Name;
    }

    var getBooking = function () {
        return $rootScope.BookingId;
    }

    var getTab = function () {
        return $rootScope.tabId;
    }

    var getIsReset = function () {
        return $rootScope.IsReset;
    }

    var getMessage = function () {
        return $rootScope.Message;
    };

    var getActiveLink = function () {
        return $rootScope.ActiveLink;
    };

    var getMyPolicyLink = function () {
        return $rootScope.MyPolicyLink;
    };

    var getProductIcon = function (ProductID) {
        return $rootScope.ProductIcon[ProductID];
    };

    var getProduct = function (ProductID) {
        return $rootScope.Product[ProductID];
    };

    var getProductID = function () {
        return $rootScope.ProductID;
    };

    var getProductName = function () {
        return $rootScope.ProductName;
    };

    var getInsurerID = function () {
        return $rootScope.InsurerID;
    };

    var getInsurer = function () {
        return $rootScope.Insurer;
    };

    var getPlan = function () {
        return $rootScope.Plan;
    };

    var getEmail = function () {
        return $rootScope.Email;
    };

    var getCity = function () {
        return $rootScope.City;
    };

    var getPraposalURL = function () {
        return $rootScope.PraposalURL;
    };

    var getProductList = function () {
        return $rootScope.ProductList;
    };

    var getSupplierList = function () {
        return $rootScope.SupplierList;
    };

    var getActions = function () {
        return $rootScope.Actions;
    };

    var getPageId = function () {
        return $rootScope.PageId;
    };

    var getOtpLogin = function () {
        return $rootScope.OtpLogin;
    };

    var getChatLeadID = function () {
        return $rootScope.ChatLeadID;
    };

    var getIsRegistrationReq = function () {
        return $rootScope.IsRegistrationReq;
    };

    var getHardCopyInsurerList = function () {
        return $rootScope.HardCopyInsurerList;
    };

    var getCommunicationID = function () {
        return $rootScope.CommunicationID;
    };

    var getSearchFilter = function () {
        return $rootScope.SearchFilter;
    }

    var getAgentProductList = function () {
        return $rootScope.AgentProductList;
    }

    var getPaymentApprovedAmount = function () {
        return $rootScope.PaymentApprovedAmount;
    }

    var getSource = function () {
        return $rootScope.Source;
    };

    var getCommentTypes = function () {
        return $rootScope.CommentTypes;
    };

    var getLoginID = function () {
        return $rootScope.LoginID;
    };

    var getUserTypeID = function () {
        return $rootScope.UserTypeID;
    };

    var getClaimRegNo = function () {
        return $rootScope.ClaimRegNo;
    };

    var getClaimMobileNo = function () {
        return $rootScope.ClaimMobileNo;
    };

    var getClaimPolicyNo = function () {
        return $rootScope.ClaimPolicyNo;
    };

    var getPendencyBy = function (ID) {
        return $rootScope.Pendency[ID];
    };

    var getActionableBy = function (ID) {
        return $rootScope.ActionableBy[ID];
    };

    var getTicketIssues = function (ID) {
        return $rootScope.TicketIssues[ID];
    };

    var getIsWebPhone = function () {
        return $rootScope.IsWebPhone;
    };

    var getPrimaryQueue = function () {
        return $rootScope.PrimaryQueue;
    };

    var getSecondaryQueue = function () {
        return $rootScope.SecondaryQueue;
    };

    // clear all stored value
    var clearRootScope = function () {

        $rootScope.AgentID = 0;
        $rootScope.AgentEmpID = "TEMP";
        $rootScope.IsAgent = true;
        $rootScope.ClaimID = 0;
        $rootScope.CustomerID = 0;
        $rootScope.CustName = '';

        $rootScope.MobileNo = 0;
        $rootScope.CountryCode = 0;
        $rootScope.OTP = 0;
        $rootScope.Name = "Guest";
        $rootScope.BookingId = 0;
        $rootScope.tabId = "tracking";
        $rootScope.IsReset = false;
        $rootScope.OtpLogin = false;
        $rootScope.Message = "";
        $rootScope.ActiveLink = "Policy";
        $rootScope.MyPolicyLink = "PB";
        $rootScope.ProductID = 0;
        $rootScope.ProductName = "";
        $rootScope.InsurerID = 0;
        $rootScope.Insurer = "";
        $rootScope.Plan = "";
        $rootScope.Email = getEmail();
        $rootScope.City = "";
        $rootScope.PraposalURL = "";
        $rootScope.Actions = "";
        $rootScope.PageId = 0;
        $rootScope.ChatLeadID = 0;
        $rootScope.IsRegistrationReq = false;
        $rootScope.CommunicationID = "";
        $rootScope.SearchFilter = "";
        $rootScope, AgentProductList = "";
        $rootScope.PaymentApprovedAmount = 0;
        $rootScope.Source = "";
        $rootScope.LoginID = 0;
        $rootScope.UserTypeID = 0;
        $rootScope.ClaimRegNo = 0;
        $rootScope.ClaimMobileNo = 0;
        $rootScope.ClaimPolicyNo = 0;
        $rootScope.IsInbound = false;
        $rootScope.IsWebPhone = false;
        $rootScope.PrimaryQueue = "";
        $rootScope.SecondaryQueue = "";

        var storage = JSON.stringify({
            AgentID: 0,
            AgentEmpID: "TEMP",
            IsAgent: true,
            ClaimID: 0,
            CustomerID: 0,
            CustName: '',

            MobileNo: 0,
            CountryCode: 0,
            OTP: 0,
            Name: "Guest",
            BookingId: 0,
            tabId: "tracking",
            IsReset: false,
            OtpLogin: false,
            Message: "",
            ActiveLink: "Policy",
            MyPolicyLink: "PB",
            ProductID: 0,
            ProductName: "",
            InsurerID: 0,
            Insurer: "",
            Plan: "",
            Email: getEmail(),
            City: "",
            PraposalURL: "",
            Actions: "",
            PageId: 0,
            ChatLeadID: 0,
            IsRegistrationReq: false,
            CommunicationID: "",
            SearchFilter: "",
            AgentProductList: "",
            PaymentApprovedAmount: 0,
            Source: "",
            LoginID: 0,
            UserTypeID: 0,
            ClaimRegNo: "",
            ClaimMobileNo: 0,
            ClaimPolicyNo: "",
            IsInbound: false,
            IsWebPhone: false,
            PrimaryQueue: "",
            SecondaryQueue: ""

        });

        localStorage.setItem('data', storage);
    };

    setValues();

    // Public
    return {
        clearRootScope: clearRootScope,

        setAgentID: setAgentID,
        getAgentID: getAgentID,

        setAgentEmpID: setAgentEmpID,
        getAgentEmpID: getAgentEmpID,

        setIsAgent: setIsAgent,
        getIsAgent: getIsAgent,

        setIsInbound: setIsInbound,
        getIsInbound: getIsInbound,

        setClaimID: setClaimID,
        getClaimID: getClaimID,

        setCustomerID: setCustomerID,
        getCustomerID: getCustomerID,

        setCustName: setCustName,
        getCustName: getCustName,

        setMobileNo: setMobileNo,
        getMobileNo: getMobileNo,

        setCountryCode: setCountryCode,
        getCountryCode: getCountryCode,

        setOTP: setOTP,
        getOTP: getOTP,

        setName: setName,
        getName: getName,

        setBooking: setBooking,
        getBooking: getBooking,

        setTab: setTab,
        getTab: getTab,

        setIsReset: setIsReset,
        getIsReset: getIsReset,

        setOtpLogin: setOtpLogin,
        getOtpLogin: getOtpLogin,

        setMessage: setMessage,
        getMessage: getMessage,

        setActiveLink: setActiveLink,
        getActiveLink: getActiveLink,

        setMyPolicyLink: setMyPolicyLink,
        getMyPolicyLink: getMyPolicyLink,

        getProductIcon: getProductIcon,
        getProduct: getProduct,

        setProductID: setProductID,
        getProductID: getProductID,

        setProductName: setProductName,
        getProductName: getProductName,

        setInsurerID: setInsurerID,
        getInsurerID: getInsurerID,

        setInsurer: setInsurer,
        getInsurer: getInsurer,

        setPlan: setPlan,
        getPlan: getPlan,

        setEmail: setEmail,
        getEmail: getEmail,

        setCity: setCity,
        getCity: getCity,

        setPraposalURL: setPraposalURL,
        getPraposalURL: getPraposalURL,

        getProductList: getProductList,
        getSupplierList: getSupplierList,
        getHardCopyInsurerList: getHardCopyInsurerList,
        getPendencyBy: getPendencyBy,
        getActionableBy: getActionableBy,
        getTicketIssues: getTicketIssues,

        setActions: setActions,
        getActions: getActions,

        setPageId: setPageId,
        getPageId: getPageId,

        setChatLeadID: setChatLeadID,
        getChatLeadID: getChatLeadID,

        setIsRegistrationReq: setIsRegistrationReq,
        getIsRegistrationReq: getIsRegistrationReq,

        setCommunicationID: setCommunicationID,
        getCommunicationID: getCommunicationID,

        setSearchFilter: setSearchFilter,
        getSearchFilter: getSearchFilter,

        setAgentProductList: setAgentProductList,
        getAgentProductList: getAgentProductList,

        setPaymentApprovedAmount: setPaymentApprovedAmount,
        getPaymentApprovedAmount: getPaymentApprovedAmount,

        setSource: setSource,
        getSource: getSource,

        setLoginID: setLoginID,
        getLoginID: getLoginID,

        setUserTypeID: setUserTypeID,
        getUserTypeID: getUserTypeID,

        setClaimRegNo: setClaimRegNo,
        getClaimRegNo: getClaimRegNo,

        setClaimMobileNo: setClaimMobileNo,
        getClaimMobileNo: getClaimMobileNo,

        setClaimPolicyNo: setClaimPolicyNo,
        getClaimPolicyNo: getClaimPolicyNo,

        setIsWebPhone: setIsWebPhone,
        getIsWebPhone: getIsWebPhone,

        setPrimaryQueue: setPrimaryQueue,
        getPrimaryQueue: getPrimaryQueue,

        setSecondaryQueue: setSecondaryQueue,
        getSecondaryQueue: getSecondaryQueue,

        setValues: setValues
    };
});