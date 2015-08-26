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

    return o;
  },
]);
