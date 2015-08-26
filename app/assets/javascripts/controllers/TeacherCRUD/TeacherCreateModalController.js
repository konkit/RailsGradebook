gradebookApp.controller(
  'TeacherCreateModalController',
  [
    '$scope', '$modalInstance', 'TeachersService', 'ControllersFactory',
    function($scope, $modalInstance, TeachersService, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);

      $scope.serviceCall = function() {
        return TeachersService.create($scope.teacher);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
