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

    o.getFakeGrades = function() {
      return [
        {
          subject: 'Maths',
          grades: [5, 4, 3, 4, 5]
        },
        {
          subject: 'English',
          grades: [5, 4, 3, 4, 5]
        }
      ];
    }

    o.getStudentGrades = function(student_id) {
      return $http.get('/students/' + student_id + '/view_students_grades.json')
    }

    return o;
}]);
