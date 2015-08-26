gradebookApp.controller(
  'StudentEditModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'student', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, DivisionsService, student, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;

      DivisionsService.getDivisions().success(function(data) {
        $scope.divisionsData = data;
      });

      $scope.serviceCall = function() {
        return StudentsService.update($scope.student);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
