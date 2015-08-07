gradebookApp = angular.module('gradebookApp', [
  'ui.router',
  'templates'
])

gradebookApp.config([
  '$stateProvider',
  function($stateProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: '/assets/home.html',
        controller: 'MainCtrl'
      })
      .state('studentgrades', {
        url: '/student/grades',
        templateUrl: '/assets/student_grades.html',
        controller: 'MainCtrl'
      });
  }
])

gradebookApp.controller('MainCtrl', ['$scope', function($scope) {
    $scope.test = 'Hello world!';
  }
])
