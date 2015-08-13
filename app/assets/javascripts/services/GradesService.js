services.factory('GradesService', ['$http', function ($http) {
    // return $resource('manager/restaurants/', {restaurants: "@restaurants"}, {
    //         getAllRestaurants: {
    //             method: 'GET',
    //             responseType: 'json',
    //             params: {}
    //         }
    //     }
    // )

    o = {
      grades: []
    };

    o.getStudentGrades = function(student_id) {
      return $http.get('/students/' + student_id + '/view_students_grades.json')
    }

    o.createGrade = function(student_id, subject_id, gradevalue ) {
      return $http.post( 'grades/',
        {
          'student_id': student_id,
          'subject_id': subject_id,
          'gradevalue': gradevalue
        }
      )
    }

    o.updateGrade = function(grade ) {
      return $http.put( 'grades/' + grade.id,
        {
          'gradevalue': grade.value
        }
      )
    }

    o.deleteGrade = function(grade ) {
      return $http.delete( 'grades/' + grade.id )
    }

    return o;
}]);
