gradebookApp.controller(
  'StudentDeleteModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'student', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, student, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        StudentsService.delete($scope.student)
          .success(function(response) {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);
            $scope.alerts = [];
            angular.forEach(response.errors, function(value, key) {
              $scope.addAlert(value, 'danger');
            });
          });
      };
    },
  ]
);
