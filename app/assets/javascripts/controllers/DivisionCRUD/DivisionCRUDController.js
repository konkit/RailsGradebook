gradebookApp.controller('DivisionCRUDController', function($scope, DivisionsService, $modal) {

      $scope.getDivisions = function() {
        DivisionsService.getDivisions().success(function(data) {
          $scope.divisionsData = data;
        });
      }
      $scope.getDivisions();

      $scope.openCreate = function(division) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/division_create_modal.html',
          controller: 'DivisionCreateModalController',
          size: 'md',
          resolve: {
            division: function() { return division; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getDivisions();
        });
      }

      $scope.openEdit = function(division) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/division_edit_modal.html',
          controller: 'DivisionEditModalController',
          size: 'md',
          resolve: {
            division: function() { return division; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getDivisions();
        });
      }

      $scope.openDelete = function(division) {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/division_delete_modal.html',
          controller: 'DivisionDeleteModalController',
          size: 'md',
          resolve: {
            division: function() { return division; }
          }
        })

        modalInstance.result.then(function() {
          $scope.getDivisions();
        });
      }

    }
)
