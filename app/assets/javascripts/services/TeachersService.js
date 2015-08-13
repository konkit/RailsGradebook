services.factory('GradesService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getTeachers = function(student_id) {
      return $http.get('/teachers.json')
    }

    o.create = function(student_id, subject_id, gradevalue ) {
      return $http.post('/teachers.json',
        {
          'student_id': student_id,
          'subject_id': subject_id,
          'gradevalue': gradevalue
        }
      )
    }

    o.updateGrade = function( teacher ) {
      return $http.put('teachers/' + teacher.id,
        {
          'gradevalue': grade.value
        }
      )
    }

    o.deleteGrade = function( teacher ) {
      return $http.delete( 'teachers/' + teacher.id )
    }

    return o;
}]);
