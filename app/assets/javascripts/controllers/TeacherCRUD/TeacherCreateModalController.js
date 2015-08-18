gradebookApp.controller(
  'TeacherCreateModalController',
  [
    '$scope', '$modalInstance', 'TeachersService',
    function ($scope, $modalInstance, TeachersService) {
      $scope.ok = function (obj) {
        $(obj.currentTarget).prop('disabled', true);

        TeachersService.create($scope.teacher)
          .success(function(response) {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);

            angular.forEach(response.errors, function(value, key) {
              $scope.addAlert(value, 'danger');
            });
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
    }
  ]
);
