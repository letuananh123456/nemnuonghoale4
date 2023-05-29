Claim.controller('health',
    ['$scope', "$q", '$location', '$window', '$http', '$timeout', 'rootScopeService', 'serviceHelper',
    function ($scope, $q, $location, $window, $http, $timeout, rootScopeService, serviceHelper) {

        $scope.ClaimRequest = {
            ProductID: 2,
            Name: '',
            MobileNo: '',
            EmailID: '',
            PolicyNumber: '',
            Remarks: '',
            Comments: '',
            LeadID: 0,
            InsurerClaimId: '',
            AlternateNo: '',
            ClaimSource: 'PB',
            CreatedBy: 124
        };

        $scope.SetClaimRequest = function () {

            if ($scope.ClaimRequest.Name == '') {
                alert("Please enter Name");
                return false;
            } if (/^[a-zA-Z\s-, ]+$/.test($scope.ClaimRequest.Name)) {
                //return true;
            } else {
                alert('Please enter alphabets only');
                return false;
            }

            if ($scope.ClaimRequest.MobileNo == '') {
                alert("Please enter Mobile No.");
                return false;
            } else if (/^\d{10}$/.test($scope.ClaimRequest.MobileNo)) {
                //return true;
            } else {
                alert("Please enter ten digit Mobile No.");
                return false;
            }

            if ($scope.ClaimRequest.AlternateNo != '') {
                if (/^\d{10}$/.test($scope.ClaimRequest.AlternateNo)) {
                    //return true;
                } else {
                    alert("Please enter ten digit Alternate No.");
                    return false;
                }
            }


            $scope.ClaimRequest.Remarks = ((($scope.ClaimRequest.PolicyNumber != '') ? ("PolicyNumber:" + $scope.ClaimRequest.PolicyNumber + " | ") : "")
                + (($scope.ClaimRequest.InsurerClaimId != '') ? ("InsurerClaimId:" + $scope.ClaimRequest.InsurerClaimId + " | ") : "")
                + (($scope.ClaimRequest.AlternateNo != '') ? ("AlternateNo:" + $scope.ClaimRequest.AlternateNo + " | ") : "")
                + (($scope.ClaimRequest.Comments != '') ? ("Remarks:" + $scope.ClaimRequest.Comments) : ""));

            var reqData = $scope.ClaimRequest;
            var request = $q.defer();
            var promise = serviceHelper.post("Claim/SetClaimRequest", reqData, "l");
            promise.then(function (response) {
                // Success
                if (response.data.Data != null) {
                    $scope.ClaimRequest = {
                        ProductID: 2,
                        Name: '',
                        MobileNo: '',
                        EmailID: '',
                        PolicyNumber: '',
                        Remarks: '',
                        Comments: '',
                        LeadID: 0,
                        InsurerClaimId: '',
                        AlternateNo: '',
                        ClaimSource: 'PB',
                        CreatedBy: 0
                    };
                    alert("Thank You for contacting us.\nOur claims expert will get in touch with you soon.");
                } else {
                    $scope.ErrorMsg = "Error : Something went wrong!";
                }
            }, function (response) {
                // Error
                console.error("Error : Something went wrong!");
            });

            return request.promise;
        };

    }]).config(function ($locationProvider) {
        $locationProvider.html5Mode(true);
    });