gradebookApp.controller(
  'SubjectEditModalController',
  [
    '$scope', '$modalInstance', 'SubjectsService', 'subject', 'teachersData', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, subject, teachersData, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.subject = subject;
      $scope.teachersData = teachersData;

      $scope.serviceCall = function() {
        return SubjectsService.update($scope.subject);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
