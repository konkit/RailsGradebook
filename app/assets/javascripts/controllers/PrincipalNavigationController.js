gradebookApp.controller(
  'PrincipalNavigationController',
  [
    '$scope', '$state', 'PrincipalsService',
    function($scope, $state, PrincipalsService) {
      $scope.goToStats = function() {
        $state.go('principalRole.principalDashboard');
      }

      $scope.goToPrincipalGrades = function() {
        $state.go('principalRole.grades');
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
    }
  ]
);
