services.factory('LoginService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.login = function( user ) {
      return $http.post( 'users/sign_in.json', { user: user } );
    }

    o.getCurrentUser = function() {
      return $http.get( 'welcome/get_current_user', {} )
    }

    o.logout = function() {
      return $http.delete( 'users/sign_out.json', {})
    }

    return o;
}]);
