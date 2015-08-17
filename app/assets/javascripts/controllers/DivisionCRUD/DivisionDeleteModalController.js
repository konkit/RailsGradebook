gradebookApp.controller(
  'DivisionDeleteModalController',
  ['$scope', '$modalInstance', 'DivisionsService', 'division', function ($scope, $modalInstance, DivisionsService, division) {
    $scope.division = division;

    $scope.ok = function (obj) {
      $(obj.currentTarget).prop('disabled', true);

      DivisionsService.delete($scope.division)
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
