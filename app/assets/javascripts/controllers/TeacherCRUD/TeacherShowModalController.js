gradebookApp.controller(
  'TeacherShowModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'teacher',
    function($scope, $modalInstance, TeachersService, teacher) {
      $scope.teacher = teacher;

      TeachersService.showTeacher($scope.teacher).success(function(data) {
        $scope.teacher = data;
      });

      $scope.ok = function(obj) {
        $modalInstance.dismiss('cancel');
      };

      $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
      };
    },
  ]
);
