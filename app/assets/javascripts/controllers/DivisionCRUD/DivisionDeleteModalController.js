gradebookApp.controller(
  'DivisionDeleteModalController',
  [
    '$scope', '$modalInstance', 'DivisionsService', 'division', 'ControllersFactory',
    function($scope, $modalInstance, DivisionsService, division, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.division = division;

      $scope.serviceCall = function() {
        return DivisionsService.delete($scope.division);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
