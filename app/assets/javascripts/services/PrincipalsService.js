services.factory('PrincipalsService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getPrincipalGrades = function(subject, division) {
      return $http.get('/principals/get_grades.json?subject_id=' + subject.id + '&division_id=' + division.id )
    }

    o.getPrincipalSubjectsAndDivisions = function() {
      return $http.get('/principals/subjects_and_divisions.json')
    }

    o.getStudentCounts = function() {
      return $http.get( '/principals/get_student_count_in_divisions.json' )
    }

    o.grades_per_subject = function() {
      return $http.get( '/principals/grades_per_subject.json' )
    }

    return o;
}]);
