gradebookApp.controller(
  'LoginModalController',
  [
    '$scope', '$modalInstance', 'LoginService', 'ControllersFactory',
    function($scope, $modalInstance, LoginService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.user_credentials = { email: '', password: ''}

      function loginCallback(response) {
        LoginService.getCurrentUser().success(function(response) {
          $scope.current_user = response;
          $modalInstance.close();
        });
      }

      $scope.serviceCall = function() {
        return LoginService.login($scope.user_credentials);
      };

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        $scope.serviceCall()
          .success(function(response) {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);
            $scope.alerts = [];
            //!!! Here we take response.error ( not errorS )
            $scope.addAlert(response.error, 'danger');
          });
      };

    },
  ]
);
