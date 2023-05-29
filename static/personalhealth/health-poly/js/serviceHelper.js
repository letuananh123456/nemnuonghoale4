Claim.service("serviceHelper",
        [
            "$q",
            "$timeout",
            "$http",
            "resourceConfig",
            "rootScopeService",
            "$window",
            function ($q, $timeout, $http, rConfig, rootScopeService, $window) {
                // Private
                var postDirect = function (url, requestData, timeout) {

                    var request = $q.defer();

                    requestData = requestData || {};
                    timeout = timeout || "s";

                    var req = {
                        method: "POST",
                        url: rConfig["connectionString"][rConfig["environment"]] + url,
                        headers: {
                            "Content-Type": "application/json",
                            "Authorization": rConfig["Authorization"][rConfig["environment"]]
                        },
                        data: JSON.stringify(requestData)
                    }

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    $http(req).then(function (response) {
                        // Success http
                        request.resolve({ data: response.data, status: response.status });

                        $timeout.cancel(timeoutPromise);
                    }, function (response) {
                        // Error http
                        request.reject({ config: response.config, status: response.status, statusText: response.statusText });

                        $timeout.cancel(timeoutPromise);
                    });
                    /*request.resolve();*/
                    return request.promise;
                }

                var getDirect = function (url, requestData, timeout) {

                    var request = $q.defer();

                    url = url + (requestData || "");
                    timeout = timeout || "s";

                    var req = {
                        method: "GET",
                        url: rConfig["connectionString"][rConfig["environment"]] + url,
                        headers: {
                            "Content-Type": "application/json",
                            "Authorization": rConfig["Authorization"][rConfig["environment"]]
                        },
                        data: JSON.stringify(requestData)
                    }

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    $http(req).then(function (response) {
                        // Success http
                        request.resolve({ data: response.data, status: response.status });

                        $timeout.cancel(timeoutPromise);
                    }, function (response) {
                        // Error http
                        request.reject({ config: response.config, status: response.status, statusText: response.statusText });

                        $timeout.cancel(timeoutPromise);
                    });
                    /*request.resolve();*/
                    return request.promise;
                }

                var postThirdPartyServices = function (Source, url, requestData, timeout) {

                    var request = $q.defer();

                    requestData = requestData || {};
                    timeout = timeout || "s";

                    var req = {
                        method: "POST",
                        url: rConfig[Source][rConfig["environment"]] + url,
                        headers: {
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(requestData)
                    }

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    $http(req).then(function (response) {
                        // Success http
                        request.resolve({ data: response.data, status: response.status });

                        $timeout.cancel(timeoutPromise);
                    }, function (response) {
                        // Error http
                        request.reject({ config: response.config, status: response.status, statusText: response.statusText });

                        $timeout.cancel(timeoutPromise);
                    });
                    /*request.resolve();*/
                    return request.promise;
                }

                var get = function (url, requestData, timeout) {

                    var request = $q.defer();
                    url = url + (requestData || "");
                    timeout = "o";

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    var req = {
                        method: "GET",
                        url: url,
                        data: ""
                    }

                    var inputx = {
                        objInputData: req
                    };

                    $.ajax({
                        url: './../../Service.asmx/Post',
                        type: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        cache: false,
                        data: JSON.stringify(inputx),
                        dataType: "json",
                        success: function (response) {
                            if (response != null && response.d.IsLogout == false) {
                                request.resolve({ data: JSON.parse(response.d.Response), status: 0 });
                                //return response.d;
                                $timeout.cancel(timeoutPromise);
                            } else {
                                $window.location = "login.html";
                            }
                        },
                        failure: function (response) {
                            if (response != null && response.d.IsLogout == false) {
                                request.reject({ config: '', status: 0, statusText: '' });
                                return response;
                                $timeout.cancel(timeoutPromise);
                            } else {
                                $window.location = "login.html";
                            }
                        }
                    });
                    return request.promise;
                };

                var post = function (url, requestData, timeout) {

                    var request = $q.defer();
                    timeout = "o";

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    var req = {
                        method: "POST",
                        url: url,
                        data: JSON.stringify(requestData)
                    }

                    var inputx = {
                        objInputData: req
                    };

                    $.ajax({
                        url: './../../Service.asmx/Post',
                        type: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        cache: false,
                        data: JSON.stringify(inputx),
                        dataType: "json",
                        success: function (response) {
                            if (response.d.OnButtonLogout == false) {
                                if (response != null && response.d.IsLogout == false) {
                                    request.resolve({ data: JSON.parse(response.d.Response), status: 0 });
                                    //return response.d;
                                    $timeout.cancel(timeoutPromise);
                                } else {
                                    $window.location = "login.html";
                                }
                            } else if (response.d.OnButtonLogout == true) {
                                if (response != null && response.d.IsLogout == true) {
                                    request.resolve({ data: JSON.parse(response.d.Response), status: 0 });
                                    //return response.d;
                                    $timeout.cancel(timeoutPromise);
                                }
                            }
                        },
                        failure: function (response) {
                            if (response != null && response.d.IsLogout == false) {
                                request.reject({ config: '', status: 0, statusText: '' });
                                return response;
                                $timeout.cancel(timeoutPromise);
                            } else {
                                $window.location = "login.html";
                            }
                        }
                    });
                    return request.promise;
                };

                var getLogin = function (url, requestData, timeout) {

                    var request = $q.defer();
                    url = url + (requestData || "");
                    timeout = timeout || "s";

                    var timeoutPromise = $timeout(function () {
                        if (request.promise.$$state.status === 0) {
                            console.error({ ErrorMessage: "Request timed out!", req: req });
                            request.reject({ data: "Request timed out!", status: 408 });
                        }
                    }, rConfig["timeout"][timeout]);

                    var req = {
                        method: "GET",
                        url: url,
                        data: JSON.stringify(requestData)
                    }

                    var inputx = {
                        objInputData: req
                    };

                    $.ajax({
                        url: './../../Service.asmx/PostForLogin',
                        type: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        cache: false,
                        data: JSON.stringify(inputx),
                        dataType: "json",
                        success: function (response) {
                            request.resolve({ data: JSON.parse(response.d), status: 0 });
                            //return response.d;
                            $timeout.cancel(timeoutPromise);
                        },
                        failure: function (response) {
                            request.reject({ config: '', status: 0, statusText: '' });
                            return response;
                            $timeout.cancel(timeoutPromise);
                        }
                    });
                    return request.promise;
                };

                var asyncHttp = function (input) {
                    //input = {url, requestData, timeout, method}

                    // Set defaults
                    input.timeout = input.timeout || "s";
                    input.method = input.method || "GET";
                    input.cache = input.cache || false;
                    input.service = input.service || "core";

                    // Prepare a deferred object
                    var request = $q.defer();

                    var URL;
                    var Headers;

                    //Set service and url
                    switch (input.service) {
                        case "core":
                            URL = rConfig["connectionString"][rConfig["environment"]] + input.url;
                            Headers = {
                                "Content-Type": "application/json",
                                "Authorization": rConfig["Authorization"][rConfig["environment"]]
                            }
                            break;
                        case "custom":
                            URL = input.url;
                            Headers = {
                                "Content-Type": "application/json"
                            }
                            //auth = rConfig["AuthorizationCommunication"][rConfig["environment"]];
                            break;
                    }

                    // Prepare reqData
                    var reqData = {
                        method: input.method,
                        url: URL,
                        headers: Headers,
                        cache: input.cache,
                        timeout: rConfig["timeout"][input.timeout]
                    };

                    // Add payload if provided
                    if (input.requestData != undefined) { reqData.data = JSON.stringify(input.requestData); }

                    $http(reqData).then(function (response) {
                        // Success http
                        request.resolve({ data: response.data, status: response.status });
                    }, function (response) {
                        // Error http
                        request.reject({ config: response.config, status: response.status, statusText: response.statusText });
                    });

                    // Return a promise object
                    return request.promise;
                }

                var call = function (Phone, claimId, context, agentId, uid, timeout) {
                    if (Phone != undefined || Phone > 0) {
                        var request = $q.defer();

                        if (rootScopeService.getProductID() == 117) {
                            var contextqueValue = "context";
                            var callingValue = "calling";
                        } else if (rootScopeService.getProductID() == 2) {
                            var contextqueValue = "contextHealth";
                            var callingValue = "callingHealth";
                        } else if (rootScopeService.getProductID() == 3) {
                            var contextqueValue = "contextTravel";
                            var callingValue = "callingTravel";
                        } else {
                            var contextqueValue = "";
                            var callingValue = "";
                        }
                        //var contextque = rootScopeService.getProductID() == 117 ? "context" : "contextHealth";
                        //var calling = rootScopeService.getProductID() == 117 ? "calling" : "callingHealth";
                        var contextque = contextqueValue;
                        var calling = callingValue;
                        var url = Phone + "&leadid=" + claimId + "&campaign=" + rConfig[contextque][context] + "&emp=" + agentId + "&uid=" + uid;

                        timeout = timeout || "s";
                        var req = {
                            method: "GET",
                            url: rConfig[calling][rConfig["environment"]] + url
                        }

                        var timeoutPromise = $timeout(function () {
                            if (request.promise.$$state.status === 0) {
                                console.error({ ErrorMessage: "Request timed out!", req: req });
                                request.reject({ data: "Request timed out!", status: 408 });
                            }
                        }, rConfig["timeout"][timeout]);

                        $http(req).then(function (response) {
                            // Success http
                            try {
                                request.resolve({ data: response.data, status: response.status });
                                $timeout.cancel(timeoutPromise);
                            }
                            catch (ex) {
                            }
                        }, function (response) {
                            // Error http
                            request.reject({ config: response.config, status: response.status, statusText: response.statusText });

                            $timeout.cancel(timeoutPromise);
                        });
                        /*request.resolve();*/
                        return request.promise;
                    } else {
                        alert("Mobile Number not Available.");
                    }
                    //http://10.0.8.66/services/easyobcall.php?phone=6457409650533523&leadid=1234567&campaign=ClaimCustomer&emp=PW00735&uid=123454321
                };

                var CallCustomer = function (Phone, claimId, context, agentId, uid, timeout) {
                    if (Phone != undefined || Phone > 0 || Phone != "0") {
                        if (rootScopeService.getProductID() == 117) {
                            var contextqueValue = "context";
                            var callingValue = "calling";
                        } else if (rootScopeService.getProductID() == 2) {
                            var contextqueValue = "contextHealth";
                            var callingValue = "callingHealth";
                        } else if (rootScopeService.getProductID() == 3) {
                            var contextqueValue = "contextTravel";
                            var callingValue = "callingTravel";
                        } else {
                            var contextqueValue = "";
                            var callingValue = "";
                        }

                        var request = $q.defer();
                        var contextque = contextqueValue;
                        var calling = callingValue;
                        //var contextque = rootScopeService.getProductID() == 117 ? "context" : "contextHealth";
                        //var calling = rootScopeService.getProductID() == 117 ? "calling" : "callingHealth";
                        var url = "&leadid=" + claimId + "&campaign=" + rConfig[contextque][context] + "&emp=" + agentId + "&uid=" + uid;

                        timeout = timeout || "s";
                        var req = {
                            method: "GET",
                            url: url,
                            headers: rConfig[calling][rConfig["environment"]],
                            data: Phone
                        }

                        var inputx = {
                            objInputData: req
                        };

                        var timeoutPromise = $timeout(function () {
                            //if (request.promise.$$state.status === 0) {
                            //    console.error({ ErrorMessage: "Request timed out!", req: req });
                            //    request.reject({ data: "Request timed out!", status: 408 });
                            //}
                        }, rConfig["timeout"][timeout]);

                        $.ajax({
                            url: './../../Service.asmx/CallCustomer',
                            type: 'POST',
                            contentType: 'application/json;charset=utf-8',
                            cache: false,
                            data: JSON.stringify(inputx),
                            dataType: "json",
                            success: function (response) {
                                try {
                                    if (response != null) {
                                        request.resolve({ data: JSON.parse(response.d.Response), status: 0 });
                                        //return response.d;
                                        $timeout.cancel(timeoutPromise);
                                    }
                                }
                                catch (e) {
                                }
                            },
                            failure: function (response) {
                                if (response != null) {
                                    request.reject({ config: '', status: 0, statusText: '' });
                                    return response;
                                    $timeout.cancel(timeoutPromise);
                                }
                            }
                        });
                        return request.promise;
                    } else {
                        alert("Mobile Number not Available.");
                    }
                };

                return {
                    postDirect: postDirect,
                    getDirect: getDirect,
                    getLogin: getLogin,
                    post: post,
                    postThirdPartyServices: postThirdPartyServices,
                    get: get,
                    postAsync: asyncHttp,
                    call: call,
                    CallCustomer: CallCustomer
                };
            }
        ]
    );