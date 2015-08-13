gradebookApp.controller('GradeEditModalController', function ($scope, $modalInstance, subject, student, grade, GradesService) {
  $scope.student = student;
  $scope.subject = subject;
  $scope.selectedGradeValue = grade.gradevalue;

  $scope.selectGrade = function(obj) {
    $scope.selectedGradeValue = parseInt( obj.currentTarget.innerText );
  }

  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    grade.value = $scope.selectedGradeValue;
    GradesService.updateGrade(grade, $scope.selectedGradeValue)
      .success(function(response) {
        $modalInstance.close();
      })
      .error(function(response) {
        $scope.addAlert(response.errors, 'danger');
      })
  };

  $scope.delete = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    grade.value = $scope.selectedGradeValue;
    GradesService.deleteGrade(grade)
      .success(function(response) {
        $modalInstance.close();
      })
      .error(function(response) {
        $scope.addAlert(response.errors, 'danger');
      })
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };

  $scope.alerts = [];

  $scope.addAlert = function(msg, type) {
    $scope.alerts.push({msg: msg, type: type});
  };

  $scope.closeAlert = function(index) {
    $scope.alerts.splice(index, 1);
  };
});
