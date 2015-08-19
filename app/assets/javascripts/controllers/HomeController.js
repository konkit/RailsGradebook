gradebookApp.controller(
  'HomeController',
  [
    '$scope', 'LoginService', '$modal', '$state',
    function($scope, LoginService, $modal, $state) {
      $scope.current_user = {name: ''}

      $scope.moveToDashboard = function(response) {
        var role = $scope.current_user.role.toLowerCase()

        if( role == 'student') {
          $state.go('studentRole.studentDashboard');
        } else if( role == 'teacher') {
          $state.go('teacherRole.teacherDashboard');
        } else if( role == 'principal' ) {
          $state.go('principalRole.principalDashboard');
        } else {
          $state.go('app');
        }
      }

      refreshCurrentUserData = function(callback) {
        LoginService.getCurrentUser().success(function(response) {
          $scope.current_user = response;

          if( $scope.current_user.id === null ) {
            $state.go('app');
          }

          typeof callback === 'function' && callback();
        });
      };
      refreshCurrentUserData();

      $scope.openLoginModal = function() {
        var modalInstance = $modal.open( {
          animation: true,
          templateUrl: '/assets/login_modal.html',
          controller: 'LoginModalController',
          size: 'sm'
        });

        modalInstance.result.then(function() {
          refreshCurrentUserData($scope.moveToDashboard);
        });
      }

      $scope.logout = function() {
        LoginService.logout().success(function() {
          refreshCurrentUserData();
        });
      }
    }
  ]
);
