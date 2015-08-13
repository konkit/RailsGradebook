gradebookApp.controller('StudentDashboardController', ['$scope', 'GradesService', function($scope, GradesService) {
      GradesService.getStudentGrades(1).success(function(data) {
        $scope.grades = data;
      });
    }
  ]
)
