gradebookApp.controller(
  'SubjectCreateModalController',
  ['$scope', '$modalInstance', 'SubjectsService', 'teachersData', 'ControllersFactory',
    function($scope, $modalInstance, SubjectsService, teachersData, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.teachersData = teachersData;

      $scope.serviceCall = function() {
        return SubjectsService.create($scope.subject);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
