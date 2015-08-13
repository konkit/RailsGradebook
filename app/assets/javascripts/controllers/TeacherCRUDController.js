gradebookApp.controller('TeacherCRUDController', function($scope, GradesService, $modal) {

      $scope.getTeachers = function() {
        GradesService.getGrades($scope.selectedSubject, $scope.selectedDivision).success(function(data) {
          $scope.gradesData = data;
        });
      }

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

      $scope.openDelete = function(subject, student, grade) {
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
