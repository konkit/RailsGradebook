gradebookApp.controller('LoginModalController', ['$scope', '$modalInstance', 'LoginService', function ($scope, $modalInstance, LoginService) {
  $scope.user_credentials = { email: '', password: ''}


  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    LoginService.login($scope.user_credentials)
      .success(function() {
        $modalInstance.close();
      })
      .error(function(response) {
        $(obj.currentTarget).prop('disabled', false);
        $scope.addAlert(response.errors, 'danger');
      })
  };

  function loginCallback(response) {
    LoginService.getCurrentUser().success(function(response) {
      $scope.current_user = response;

      console.log($scope.current_user);

      $modalInstance.close();
    });
  }

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };

  $scope.alerts = [];

  $scope.addAlert = function(msg, type) {
    $scope.alerts.push({msg: msg, type: type});
  };

  $scope.closeAlert = function(index) {
    $scope.alerts.splice(index, 1);
  };
}]);
