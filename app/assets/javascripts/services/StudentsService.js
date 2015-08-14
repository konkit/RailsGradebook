services.factory('StudentsService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getStudents = function() {
      return $http.get( 'students.json' )
    }

    o.create = function( student ) {
      return $http.post( 'students/',
        {
          'student': student
        }
      )
    }

    o.update = function( student ) {
      return $http.put( 'students/' + student.id + '.json',
        {
          'student': student
        }
      )
    }

    o.delete = function( student ) {
      return $http.delete( 'students/' + student.id + '.json')
    }

    return o;
}]);
