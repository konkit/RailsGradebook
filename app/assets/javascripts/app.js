gradebookApp = angular.module('gradebookApp', [
  'ui.router',
  'templates',
  'gradebookApp.controllers',
  'gradebookApp.services'
])

gradebookApp.config([
  '$stateProvider',
  function($stateProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: '/assets/home.html',
        controller: 'MainController'
      })
      .state('studentgrades', {
        url: '/student/grades',
        templateUrl: '/assets/student_grades.html',
        controller: 'MainController'
      });
  }
])
