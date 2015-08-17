gradebookApp.controller(
  'DivisionEditModalController',
  ['$scope', '$modalInstance', 'DivisionsService', 'division', 'subjectsData', '$filter',
    function ($scope, $modalInstance, DivisionsService, division, subjectsData, $filter) {
      $scope.division = division;
      $scope.subjectsData = subjectsData;

      $scope.assignedSubjects = [];

      (initAssignedSubjectArray = function() {
        angular.forEach(subjectsData, function(v, k) {
          var newAssignedSubject = {subject: v, assigned: false};

          // check if given subject exists in $scope.division.subjects collection
          // in other words - whether it is assigned
          if( $filter('filter')($scope.division.subjects, {id: v.id}, true).length ) {
            newAssignedSubject.assigned = true;
          }

          $scope.assignedSubjects[newAssignedSubject.subject.id] = newAssignedSubject;
        });
      })();

      $scope.ok = function (obj) {
        $(obj.currentTarget).prop('disabled', true);

        // Mapping subjects collection to collection of ids
        var subjects = $filter('filter')($scope.assignedSubjects, {assigned: true}).map(function(x){ return {id: x.subject.id} });

        DivisionsService.update($scope.division, subjects)
          .success(function(response) {
            $modalInstance.close();
          })
          .error(function(response) {
            $(obj.currentTarget).prop('disabled', false);
            $scope.addAlert(response.errors, 'danger');
          })
      };

      $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
      };

      $scope.alerts = [];

      $scope.addAlert = function(msg, type) {
        $scope.alerts.push({msg: msg, type: type});
      };

      $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
      };
}]);
