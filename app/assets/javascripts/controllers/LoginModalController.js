gradebookApp.controller(
  'LoginModalController',
  [
    '$scope', '$modalInstance', 'LoginService', 'ControllersFactory',
    function($scope, $modalInstance, LoginService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.user_credentials = { email: '', password: ''}

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        LoginService.login($scope.user_credentials)
          .success(function() {
            $modalInstance.close();
          })
          .error(function(response) {
            $scope.alerts = [];
            $(obj.currentTarget).prop('disabled', false);
            $scope.addAlert(response.error, 'danger');
          });
      };

      function loginCallback(response) {
        LoginService.getCurrentUser().success(function(response) {
          $scope.current_user = response;
          $modalInstance.close();
        });
      }
    },
  ]
);
