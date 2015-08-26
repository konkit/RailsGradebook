gradebookApp.controller(
  'TeacherCreateModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'ControllersFactory',
    function($scope, $modalInstance, TeachersService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        TeachersService.create($scope.teacher)
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
