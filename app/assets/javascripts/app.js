gradebookApp = angular.module('gradebookApp', [
  'ui.router',
  'templates',
  'gradebookApp.controllers',
  'gradebookApp.services',
  'ui.bootstrap'
])

gradebookApp.config(
  [
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
      $urlRouterProvider.when('', '/');

      $stateProvider
        .state('app', {
          url: '/',
          templateUrl: '/assets/home.html',
          controller: 'HomeController'
        })
        .state('studentRole', {
          templateUrl: '/assets/nav_student_role.html',
          controller: 'HomeController'
        })
        .state('teacherRole', {
          templateUrl: '/assets/nav_teacher_role.html',
          controller: 'HomeController'
        })
        .state('principalRole', {
          templateUrl: '/assets/nav_principal_role.html',
          controller: 'HomeController'
        })
        .state('studentRole.studentDashboard', {
          url: '/student_dashboard/',
          templateUrl: '/assets/student_dashboard.html',
          controller: 'StudentDashboardController'
        })
        .state('teacherRole.teacherDashboard', {
          url: '/teacher_dashboard/',
          templateUrl: '/assets/teacher_dashboard.html',
          controller: 'TeacherDashboardController'
        })
        .state('principalRole.principalDashboard', {
          url: '/principal_dashboard/',
          templateUrl: '/assets/principal_dashboard.html',
          controller: 'PrincipalNavigationController'
        })
        .state('principalRole.teachercrud', {
          url: '/teacher_crud/',
          templateUrl: '/assets/teacher_crud.html',
          controller: 'TeacherCRUDController'
        })
        .state('principalRole.studentcrud', {
          url: '/student_crud/',
          templateUrl: '/assets/student_crud.html',
          controller: 'StudentCRUDController'
        })
        .state('principalRole.divisioncrud', {
          url: '/division_crud/',
          templateUrl: '/assets/division_crud.html',
          controller: 'DivisionCRUDController'
        })
        .state('principalRole.subjectcrud', {
          url: '/subject_crud/',
          templateUrl: '/assets/subject_crud.html',
          controller: 'SubjectCRUDController'
        });
    }
  ]
)
