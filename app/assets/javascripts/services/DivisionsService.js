services.factory('DivisionsService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getDivisions = function() {
      return $http.get( 'divisions.json' )
    }

    o.create = function( division ) {
      return $http.post( 'divisions/',
        {
          'division': division
        }
      )
    }

    o.update = function( division, subjects ) {
      return $http.put( 'divisions/' + division.id + '.json',
        {
          'division': division,
          'subjects': subjects
        }
      )
    }

    o.delete = function( division ) {
      return $http.delete( 'divisions/' + division.id + '.json')
    }

    return o;
}]);
