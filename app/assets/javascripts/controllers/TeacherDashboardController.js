gradebookApp.controller('TeacherDashboardController', function($scope, GradesService, $modal) {
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

      $scope.getGrades = function() {
        GradesService.getGrades($scope.selectedSubject, $scope.selectedDivision).success(function(data) {
          $scope.gradesData = data;
        });
      }

      getSubjectsAndDivisions($scope.getGrades);

      $scope.openCreate = function(subject, student) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/grade_create_modal.html',
          controller: 'GradeCreateModalController',
          size: 'md',
          resolve: {
            subject: function() { return subject; },
            student: function() { return student; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getGrades();
        });
      }

      $scope.openEdit = function(subject, student, grade) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/grade_edit_modal.html',
          controller: 'GradeEditModalController',
          size: 'md',
          resolve: {
            subject: function() { return subject; },
            student: function() { return student; },
            grade: function() { return grade; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getGrades();
        });
      }


    }
)
