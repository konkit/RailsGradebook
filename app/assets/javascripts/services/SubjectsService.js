services.factory('SubjectsService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getSubjects = function() {
      return $http.get( 'subjects.json' )
    }

    o.create = function( subject ) {
      return $http.post( 'subjects/',
        {
          'subject': subject
        }
      )
    }

    o.update = function( subject ) {
      return $http.put( 'subjects/' + subject.id + '.json',
        {
          'subject': subject
        }
      )
    }

    o.delete = function( subject ) {
      return $http.delete( 'subjects/' + subject.id + '.json')
    }

    return o;
}]);
