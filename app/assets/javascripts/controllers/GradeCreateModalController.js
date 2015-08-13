gradebookApp.controller('GradeCreateModalController', function ($scope, $modalInstance, GradesService, subject, student) {
  $scope.student = student;
  $scope.subject = subject;
  $scope.selectedGradeValue = 1;

  $scope.selectGrade = function(obj) {
    $('.grades-list').children().removeClass('btn-primary').addClass('btn-default');
    $(obj.currentTarget).addClass('btn-primary');
    $scope.selectedGradeValue = parseInt( obj.currentTarget.innerText );
  }

  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    GradesService.createGrade(student.id, subject.id, $scope.selectedGradeValue)
      .success(function(response) {
        $modalInstance.close();
      })
      .error(function(response) {
        alert(response);
      })
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});