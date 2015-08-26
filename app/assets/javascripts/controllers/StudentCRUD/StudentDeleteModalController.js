gradebookApp.controller(
  'StudentDeleteModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'student', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, student, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;

      $scope.serviceCall = function() {
        return StudentsService.delete($scope.student);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
