gradebookApp.controller(
  'GradeEditModalController',
  [
    '$scope', '$modalInstance', 'subject', 'student', 'grade', 'GradesService', 'ControllersFactory',
    function($scope, $modalInstance, subject, student, grade, GradesService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;
      $scope.subject = subject;
      $scope.selectedGradeValue = grade.gradevalue;

      $scope.selectGrade = function(obj) {
        $scope.selectedGradeValue = parseInt(obj.currentTarget.innerText);
      };

      $scope.delete = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        grade.value = $scope.selectedGradeValue;
        GradesService.deleteGrade(grade)
          .success(function(response) {
            $modalInstance.close();
          })
          .error(function(response) {
            angular.forEach(response.errors, function(value, key) {
              $scope.addAlert(value, 'danger');
            });
          });
      };

      $scope.serviceCall = function() {
        grade.value = $scope.selectedGradeValue;
        return GradesService.deleteGrade(grade);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
