gradebookApp.controller('PrincipalNavigationController', ['$scope', '$state', function($scope, $state) {
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
}])
