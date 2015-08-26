gradebookApp.controller('GradeCreateModalController',
  ['$scope', '$modalInstance', 'GradesService', 'subject', 'student', 'ControllersFactory',
  function($scope, $modalInstance, GradesService, subject, student, ControllersFactory) {
    ControllersFactory.decorateAlerts($scope, $modalInstance);
    $scope.student = student;
    $scope.subject = subject;
    $scope.selectedGradeValue = 1;

    $scope.selectGrade = function(obj) {
      $('.grades-list').children().removeClass('btn-primary').addClass('btn-default');
      $(obj.currentTarget).addClass('btn-primary');
      $scope.selectedGradeValue = parseInt(obj.currentTarget.innerText);
    };

    $scope.serviceCall = function() {
      return GradesService.createGrade(student.id, subject.id, $scope.selectedGradeValue);
    };

    ControllersFactory.decorateModalSubmit($scope, $modalInstance, $scope.serviceCall);
  },
]);
