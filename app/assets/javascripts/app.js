gradebookApp = angular.module('gradebookApp', [
  'ui.router',
  'templates',
  'gradebookApp.controllers',
  'gradebookApp.services',
  'ui.bootstrap'
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
        url: '/student_dashboard/',
        templateUrl: '/assets/student_dashboard.html',
        controller: 'StudentDashboardController'
      })
      .state('teachergrades', {
        url: '/teacher_dashboard/',
        templateUrl: '/assets/teacher_dashboard.html',
        controller: 'TeacherDashboardController'
      })
      .state('teachercrud', {
        url: '/teacher_crud/',
        templateUrl: '/assets/teacher_crud.html',
        controller: 'TeacherCRUDController'
      })
      .state('studentcrud', {
        url: '/student_crud/',
        templateUrl: '/assets/student_crud.html',
        controller: 'StudentCRUDController'
      })
      .state('divisioncrud', {
        url: '/division_crud/',
        templateUrl: '/assets/division_crud.html',
        controller: 'DivisionCRUDController'
      })
      .state('subjectcrud', {
        url: '/subject_crud/',
        templateUrl: '/assets/subject_crud.html',
        controller: 'SubjectCRUDController'
      });
  }
])
