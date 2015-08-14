gradebookApp.controller('SubjectCreateModalController', function ($scope, $modalInstance, SubjectsService, teachersData) {
  $scope.teachersData = teachersData;

  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    SubjectsService.create($scope.subject)
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
