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

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
