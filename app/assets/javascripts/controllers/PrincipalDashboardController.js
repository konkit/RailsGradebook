gradebookApp.controller(
  'PrincipalDashboardController',
  [
    '$scope', '$state', 'PrincipalsService',
    function($scope, $state, PrincipalsService) {

      $scope.studentCountsLabels = [];
      $scope.studentCountsData = [ [] ];

      PrincipalsService.getStudentCounts().success(function(response) {
        angular.forEach(response, function(value, key) {
          $scope.studentCountsLabels.push(value.name);
          $scope.studentCountsData[0].push(value.student_count);
        });
      });

      $scope.gradesPerSubjectLabels = [];
      $scope.gradesPerSubjectData = [ [] ];

      PrincipalsService.grades_per_subject().success(function(response) {
        angular.forEach(response, function(value, key) {
          $scope.gradesPerSubjectLabels.push(value.name);
          $scope.gradesPerSubjectData[0].push(value.grades);
        });
      });
    }
  ]
);
