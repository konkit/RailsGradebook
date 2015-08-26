gradebookApp.controller('TeacherDashboardController', ['$scope', 'GradesService', '$modal', function($scope, GradesService, $modal) {
  $scope.subjects_and_divisions = {};
  $scope.selectedSubject = {};
  $scope.selectedDivision = {};

  function getSubjectsAndDivisions(callback) {
    GradesService.getSubjectsAndDivisions().success(function(data) {
      $scope.subjects_and_divisions = data;
      $scope.selectedSubject = data[0];
      $scope.selectedDivision = data[0].divisions[0];

      callback();
    });
  }

  $scope.openShow = function(student) {
    var modalInstance = $modal.open({
      animation: true,
      templateUrl: '/assets/student_show_modal.html',
      controller: 'StudentShowModalController',
      size: 'md',
      resolve: {
        student: function() { return student; },
      },
    });
  };

  $scope.getGrades = function() {
    if ($scope.selectedDivision == null) {
      $scope.selectedDivision = $scope.selectedSubject.divisions[0];
    }

    if( $scope.selectedSubject == null || $scope.selectedDivision == null ) {
      return;
    }

    GradesService.getGrades($scope.selectedSubject, $scope.selectedDivision).success(function(data) {
      $scope.gradesData = data;
    });
  };

  getSubjectsAndDivisions($scope.getGrades);

  $scope.openCreate = function(subject, student) {
    var modalInstance = $modal.open({
      animation: true,
      templateUrl: '/assets/grade_create_modal.html',
      controller: 'GradeCreateModalController',
      size: 'md',
      resolve: {
        subject: function() { return subject; },
        student: function() { return student; },
      },
    });

    modalInstance.result.then(function() {
      $scope.getGrades();
    });
  }

  $scope.openEdit = function(subject, student, grade) {
    var modalInstance = $modal.open({
      animation: true,
      templateUrl: '/assets/grade_edit_modal.html',
      controller: 'GradeEditModalController',
      size: 'md',
      resolve: {
        subject: function() { return subject; },
        student: function() { return student; },
        grade: function() { return grade; },
      },
    });

    modalInstance.result.then(function() {
      $scope.getGrades();
    });
  }
}])
