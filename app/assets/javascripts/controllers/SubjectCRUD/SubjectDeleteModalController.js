gradebookApp.controller(
  'SubjectDeleteModalController',
  [
    '$scope', '$modalInstance', 'SubjectsService', 'subject', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, subject, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.subject = subject;

      $scope.serviceCall = function() {
        return SubjectsService.delete($scope.subject);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
