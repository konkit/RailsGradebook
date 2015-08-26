gradebookApp.controller(
  'SubjectEditModalController',
  [
    '$scope', '$modalInstance', 'SubjectsService', 'subject', 'teachersData', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, subject, teachersData, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.subject = subject;
      $scope.teachersData = teachersData;

      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        SubjectsService.update($scope.subject)
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

      $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
      };

      $scope.alerts = [];

      $scope.addAlert = function(msg, type) {
        $scope.alerts.push({msg: msg, type: type});
      };

      $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
      };
    },
  ]
);
