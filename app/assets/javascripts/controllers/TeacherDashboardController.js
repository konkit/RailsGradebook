gradebookApp.controller('TeacherDashboardController', function($scope, GradesService, $modal, $stateParams) {
      $scope.student_id = $stateParams.id;

      console.log('Student_id');
      console.log($scope.student_id);

      function getGrades() {
        GradesService.getStudentGrades($scope.student_id).success(function(data) {
          $scope.grades = data;
        });
      }

      getGrades();

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
          getGrades();
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
          getGrades();
        });
      }

    }
)
