services.factory('TeachersService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.getStudentGrades = function(student_id) {
      return $http.get('/students/' + student_id + '/view_students_grades.json')
    }

    o.getGrades = function(subject, division) {
      return $http.get('/teachers/get_grades.json?subject_id=' + subject.id + '&division_id=' + division.id )
    }

    o.getSubjectsAndDivisions = function() {
      return $http.get('/teachers/subjects_and_divisions.json')
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
