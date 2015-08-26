gradebookApp.controller(
  'DivisionEditModalController',
  [
    '$scope', '$modalInstance', 'DivisionsService', 'division', 'subjectsData', '$filter', 'ControllersFactory',
    function($scope, $modalInstance, DivisionsService, division, subjectsData, $filter, ControllersFactory) {
      ControllersFactory.decorateAlerts($scope, $modalInstance);
      $scope.division = division;
      $scope.subjectsData = subjectsData;

      $scope.assignedSubjects = [];

      (initAssignedSubjectArray = function() {
        angular.forEach(subjectsData, function(v, k) {
          var newAssignedSubject = {subject: v, assigned: false};

          // check if given subject exists in $scope.division.subjects collection
          // in other words - whether it is assigned
          if ($filter('filter')($scope.division.subjects, {id: v.id}, true).length) {
            newAssignedSubject.assigned = true;
          }

          $scope.assignedSubjects[newAssignedSubject.subject.id] = newAssignedSubject;
        });
      })();

      $scope.serviceCall = function() {
        // Mapping subjects collection to collection of ids
        var subjects = $filter('filter')($scope.assignedSubjects, {assigned: true})
                       .map(function(x) {
                         return {id: x.subject.id};
                       });

        return DivisionsService.update($scope.division, subjects);
      };

      ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
    },
  ]
);
