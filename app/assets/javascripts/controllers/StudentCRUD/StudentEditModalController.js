gradebookApp.controller(
  'StudentEditModalController',
  [
    '$scope', '$modalInstance', 'StudentsService', 'DivisionsService', 'student', 'ControllersFactory',
    function($scope, $modalInstance, StudentsService, DivisionsService, student, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.student = student;

      DivisionsService.getDivisions().success(function(data) {
        $scope.divisionsData = data;
      });

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        StudentsService.update($scope.student)
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
