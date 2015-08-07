gradebookApp.controller('MainController', ['$scope', function($scope) {
    $scope.test = 'Hello world!';

    $scope.grades = [{gradevalue: 5, subject: 'Maths'}, {gradevalue: 4, subject: 'Maths'}]
  }
])
