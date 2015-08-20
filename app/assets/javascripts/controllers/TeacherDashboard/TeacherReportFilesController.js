gradebookApp.controller(
  'TeacherReportFilesController',
  [
    '$scope', '$state',
    function($scope, $state) {

      $scope.goToGrades = function() {
        $state.go('teacherRole.teacherDashboard');
      }

      $scope.goToReportFiles = function() {
        $state.go('teacherRole.teacherReportFiles');
      }
    }
  ]
);
