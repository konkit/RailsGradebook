gradebookApp.controller('PrincipalGradesController', ['$scope', 'PrincipalsService', '$modal', function($scope, PrincipalsService, $modal) {
      $scope.subjects_and_divisions = {};
      $scope.selectedSubject = {};
      $scope.selectedDivision = {};

      function getSubjectsAndDivisions(callback) {
        PrincipalsService.getPrincipalSubjectsAndDivisions().success(function(data) {
          $scope.subjects_and_divisions = data;
          $scope.selectedSubject = data[0];
          $scope.selectedDivision = data[0].divisions[0];

          callback();
        });
      }

      $scope.getGrades = function() {
        if( $scope.selectedDivision == null ) {
          $scope.selectedDivision = $scope.selectedSubject.divisions[0];
        }

        if( $scope.selectedSubject == null || $scope.selectedDivision == null ) {
          return;
        }

        PrincipalsService.getPrincipalGrades($scope.selectedSubject, $scope.selectedDivision).success(function(data) {
          $scope.gradesData = data;
        });
      }

      getSubjectsAndDivisions($scope.getGrades);
}])
