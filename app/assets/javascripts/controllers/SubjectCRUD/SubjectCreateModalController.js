gradebookApp.controller(
  'SubjectCreateModalController',
  ['$scope', '$modalInstance', 'SubjectsService', 'teachersData', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, teachersData, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.teachersData = teachersData;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        SubjectsService.create($scope.subject)
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
