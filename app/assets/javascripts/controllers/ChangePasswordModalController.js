gradebookApp.controller(
  'ChangePasswordModalController',
  [
    '$scope', '$modalInstance', 'LoginService', 'user_data', 'ControllersFactory',
    function ($scope, $modalInstance, LoginService, user_data, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.user_data = { email: user_data.email };

      $scope.serviceCall = function() {
        return LoginService.changePassword($scope.user_data);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
