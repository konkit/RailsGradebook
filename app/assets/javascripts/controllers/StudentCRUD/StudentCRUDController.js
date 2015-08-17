gradebookApp.controller(
  'StudentCRUDController',
  [
    '$scope', 'StudentsService', '$modal',
    function($scope, StudentsService, $modal) {
      $scope.getStudents = function() {
        StudentsService.getStudents().success(function(data) {
          $scope.studentsData = data;
        });
      }
      $scope.getStudents();

      $scope.openCreate = function(student) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/student_create_modal.html',
          controller: 'StudentCreateModalController',
          size: 'md',
          resolve: {
            student: function() { return student; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getStudents();
        });
      }

      $scope.openEdit = function(student) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/student_edit_modal.html',
          controller: 'StudentEditModalController',
          size: 'md',
          resolve: {
            student: function() { return student; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getStudents();
        });
      }

      $scope.openDelete = function(student) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/student_delete_modal.html',
          controller: 'StudentDeleteModalController',
          size: 'md',
          resolve: {
            student: function() { return student; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getStudents();
        });
      }
    }
  ]
);
