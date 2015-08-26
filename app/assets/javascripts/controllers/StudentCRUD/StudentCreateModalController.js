gradebookApp.controller(
  'StudentCreateModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, DivisionsService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);

      DivisionsService.getDivisions().success(function(data) {
        $scope.divisionsData = data;
      });

      $scope.serviceCall = function() {
        return StudentsService.create($scope.student);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
