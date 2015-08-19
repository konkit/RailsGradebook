gradebookApp.controller(
  'ChangePasswordModalController',
  [
    '$scope', '$modalInstance', 'LoginService', 'user_data',
    function ($scope, $modalInstance, LoginService, user_data) {
      $scope.user_data = { email: user_data.email };

      $scope.ok = function (obj) {
        $(obj.currentTarget).prop('disabled', true);

        console.log($scope.user_data);

        LoginService.changePassword($scope.user_data)
          .success(function() {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);
            $scope.addAlert(response.errors, 'danger');
          })
      };

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
    }
  ]
);
