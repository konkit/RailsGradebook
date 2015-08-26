gradebookApp.controller(
  'DivisionCreateModalController',
  [
    '$scope', '$modalInstance', 'DivisionsService', 'ControllersFactory',
    function($scope, $modalInstance, DivisionsService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);

      $scope.serviceCall = function() {
        return DivisionsService.create($scope.division);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
