services.factory('TeachersService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getTeachers = function() {
      return $http.get( 'teachers.json' )
    }

    o.create = function( teacher ) {
      return $http.post( 'teachers/',
        {
          'teacher': teacher
        }
      )
    }

    o.update = function(grade ) {

    }

    o.delete = function(grade ) {
    }

    return o;
}]);
