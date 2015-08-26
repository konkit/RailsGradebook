gradebookApp.controller(
  'StudentShowModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'student', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, DivisionsService, student, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;

      DivisionsService.getDivisions().success(function(data) {
        $scope.divisionsData = data;
      });

      StudentsService.showStudent($scope.student).success(function(data) {
        $scope.student = data;
      });

      $scope.ok = function(obj) {
        $modalInstance.dismiss('cancel');
      };
    },
  ]
);
