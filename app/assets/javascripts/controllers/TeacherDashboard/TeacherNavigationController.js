gradebookApp.controller(
  'TeacherNavigationController',
  [
    '$scope', '$state', 'PrincipalsService',
    function($scope, $state, PrincipalsService) {

      $scope.goToGrades = function() {
        $state.go('teacherRole.teacherDashboard');
      }

      $scope.goToReportFiles = function() {
        $state.go('teacherRole.teacherReportFiles');
      }
    }
  ]
);
