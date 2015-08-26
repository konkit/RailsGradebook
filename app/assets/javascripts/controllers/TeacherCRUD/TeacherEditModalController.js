gradebookApp.controller(
  'TeacherEditModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'teacher', 'ControllersFactory',
    function($scope, $modalInstance, TeachersService, teacher, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.teacher = teacher;

      $scope.serviceCall = function() {
        return TeachersService.update($scope.teacher);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
