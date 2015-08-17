gradebookApp.controller(
  'StudentDeleteModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'student',
    function ($scope, $modalInstance, StudentsService, student) {
      $scope.student = student;

      $scope.ok = function (obj) {
        $(obj.currentTarget).prop('disabled', true);

        StudentsService.delete($scope.student)
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
    }
  ]
);
