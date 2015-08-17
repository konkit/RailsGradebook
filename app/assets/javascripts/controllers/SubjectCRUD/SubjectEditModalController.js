gradebookApp.controller('SubjectEditModalController',
['$scope', '$modalInstance', 'SubjectsService', 'subject', 'teachersData', function ($scope, $modalInstance, SubjectsService, subject, teachersData) {
  $scope.subject = subject;
  $scope.teachersData = teachersData;

  $scope.ok = function (obj) {
    $(obj.currentTarget).prop('disabled', true);

    SubjectsService.update($scope.subject)
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
}]);
