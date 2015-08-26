gradebookApp.controller(
  'ChangePasswordModalController',
  [
    '$scope', '$modalInstance', 'LoginService', 'user_data', 'ControllersFactory',
    function ($scope, $modalInstance, LoginService, user_data, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.user_data = { email: user_data.email };

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        console.log($scope.user_data);

        LoginService.changePassword($scope.user_data)
          .success(function() {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);
            $scope.addAlert(response.errors, 'danger');
          });
      };
    },
  ]
);
