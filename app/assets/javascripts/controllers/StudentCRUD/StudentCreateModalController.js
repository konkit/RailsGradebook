gradebookApp.controller(
  'StudentCreateModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, DivisionsService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);

      DivisionsService.getDivisions().success(function(data) {
        $scope.divisionsData = data;
      });

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        StudentsService.create($scope.student)
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
