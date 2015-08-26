gradebookApp.controller(
  'SubjectDeleteModalController',
  [
    '$scope', '$modalInstance', 'SubjectsService', 'subject', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, subject, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.subject = subject;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        SubjectsService.delete($scope.subject)
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
