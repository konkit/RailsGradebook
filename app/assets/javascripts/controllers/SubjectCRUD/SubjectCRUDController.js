gradebookApp.controller('SubjectCRUDController', function($scope, SubjectsService, $modal) {

      $scope.getSubjects = function() {
        SubjectsService.getSubjects().success(function(data) {
          $scope.subjectsData = data;
        });
      }
      $scope.getSubjects();

      $scope.openCreate = function(subject) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/subject_create_modal.html',
          controller: 'SubjectCreateModalController',
          size: 'md',
          resolve: {
            subject: function() { return subject; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getSubjects();
        });
      }

      $scope.openEdit = function(subject) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/subject_edit_modal.html',
          controller: 'SubjectEditModalController',
          size: 'md',
          resolve: {
            subject: function() { return subject; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getSubjects();
        });
      }

      $scope.openDelete = function(subject) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/subject_delete_modal.html',
          controller: 'SubjectDeleteModalController',
          size: 'md',
          resolve: {
            subject: function() { return subject; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getSubjects();
        });
      }

    }
)
