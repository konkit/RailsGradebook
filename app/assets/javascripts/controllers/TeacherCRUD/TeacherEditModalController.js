gradebookApp.controller(
  'TeacherEditModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'teacher', 'ControllersFactory',
    function($scope, $modalInstance, TeachersService, teacher, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.teacher = teacher;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        TeachersService.update($scope.teacher)
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
