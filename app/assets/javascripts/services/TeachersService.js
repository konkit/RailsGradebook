services.factory('TeachersService', ['$http', function($http) {
    o = {
      grades: [],
    };

    o.getTeachers = function() {
      return $http.get('teachers.json');
    };

    o.showTeacher = function(teacher) {
      return $http.get('teachers/' + teacher.id + '.json');
    };

    o.create = function(teacher) {
      return $http.post('teachers/', { teacher: teacher});
    };

    o.update = function(teacher) {
      return $http.put('teachers/' + teacher.id + '.json', { teacher: teacher });
    };

    o.delete = function(teacher) {
      return $http.delete('teachers/' + teacher.id + '.json');
    };

    return o;
  },
]);
