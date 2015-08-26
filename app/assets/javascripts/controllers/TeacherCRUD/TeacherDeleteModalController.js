gradebookApp.controller(
  'TeacherDeleteModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'teacher', 'ControllersFactory',
    function($scope, $modalInstance, TeachersService, teacher, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.teacher = teacher;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        TeachersService.delete($scope.teacher)
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
