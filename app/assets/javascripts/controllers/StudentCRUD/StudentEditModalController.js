gradebookApp.controller('StudentEditModalController', function ($scope, $modalInstance, StudentsService, DivisionsService, student) {
  $scope.student = student;

  DivisionsService.getDivisions().success(function(data) {
    $scope.divisionsData = data;
  });

  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    StudentsService.update($scope.student)
      .success(function(response) {
        $modalInstance.close();
      })
      .error(function(response) {
        $(obj.currentTarget).prop('disabled', false);
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
