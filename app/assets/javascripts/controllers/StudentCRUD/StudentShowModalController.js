gradebookApp.controller(
  'StudentShowModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'student',
    function($scope, $modalInstance, StudentsService, DivisionsService, student) {
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

      $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
      };
    },
  ]
);
