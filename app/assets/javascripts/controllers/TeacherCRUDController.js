gradebookApp.controller('TeacherCRUDController', function($scope, TeachersService, $modal) {

      $scope.getTeachers = function() {
        TeachersService.getTeachers().success(function(data) {
          $scope.teachersData = data;
        });
      }
      $scope.getTeachers();

      $scope.openCreate = function(teacher) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/teacher_create_modal.html',
          controller: 'TeacherCreateModalController',
          size: 'md',
          resolve: {
            teacher: function() { return teacher; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getTeachers();
        });
      }

      $scope.openEdit = function(teacher) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/teacher_edit_modal.html',
          controller: 'TeacherEditModalController',
          size: 'md',
          resolve: {
            teacher: function() { return teacher; }
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
