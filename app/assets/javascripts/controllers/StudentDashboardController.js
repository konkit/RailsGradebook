gradebookApp.controller(
  'StudentDashboardController',
  [
    '$scope',
    'GradesService',
    function($scope, GradesService) {
      GradesService.getStudentGrades().success(function(data) {
        $scope.grades = data;
      });
    }
  ]
);
