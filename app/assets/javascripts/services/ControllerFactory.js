services.factory('ControllersFactory', [function() {
    o = {};

    o.decorateAlerts = function($scope, $modalInstance) {
      $scope.alerts = [];

      $scope.addAlert = function(msg, type) {
        $scope.alerts.push({msg: msg, type: type});
      };

      $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
      };

      $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
      };
    };

    o.decorateModalSubmit = function($scope, $modalInstance, serviceCall) {
      $scope.ok = function(obj) {
        $(obj.currentTarget).prop('disabled', true);

        serviceCall()
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
    };

    return o;
  },
]);
