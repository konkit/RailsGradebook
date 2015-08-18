gradebookApp.controller(
  'PrincipalDashboardController',
  [
    '$scope', '$state', 'DivisionsService', 'GradesService',
    function($scope, $state, DivisionsService, GradesService) {
      $scope.goToStats = function() {
        $state.go('principalRole.principalDashboard');
      }

      $scope.goToStudentsCRUD = function() {
        $state.go('principalRole.studentcrud');
      }

      $scope.goToTeachersCRUD = function() {
        $state.go('principalRole.teachercrud');
      }

      $scope.goToDivisionsCRUD = function() {
        $state.go('principalRole.divisioncrud');
      }

      $scope.goToSubjectsCRUD = function() {
        $state.go('principalRole.subjectcrud');
      }

      $scope.studentCountsLabels = [];
      $scope.studentCountsData = [ [] ];

      DivisionsService.getStudentCounts().success(function(response) {
        angular.forEach(response, function(value, key) {
          $scope.studentCountsLabels.push(value.name);
          $scope.studentCountsData[0].push(value.student_count);
        });
      });

      $scope.gradesPerSubjectLabels = [];
      $scope.gradesPerSubjectData = [ [] ];

      GradesService.grades_per_subject().success(function(response) {
        angular.forEach(response, function(value, key) {
          $scope.gradesPerSubjectLabels.push(value.name);
          $scope.gradesPerSubjectData[0].push(value.grades);
        });
      });
    }
  ]
);
