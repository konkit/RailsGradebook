describe('A suite', function() {
  it('at least runs the tests', function() {
    expect(true).toBe(true);
  });
});

describe('StudentDeleteModalController', function() {
  var scope;
  var controller;

  beforeEach(function() {
    module('gradebookApp');

    controllerFactoryMock = jasmine.createSpyObj(
      'ControllersFactory',
      ['decorateAlerts', 'decorateModalSubmit']
    );

    studentsServiceMock = jasmine.createSpyObj(
      'StudentsService',
      ['delete']
    );

    modalInstanceMock = jasmine.createSpyObj(
      '$modalInstance', ['']
    );

    student = {id: '1'};

    inject(
      function($rootScope, $controller, $q) {
        scope = $rootScope.$new();

        controllerFactoryMock.decorateAlerts.and.returnValue($q.when('wee'));
        controllerFactoryMock.decorateModalSubmit.and.returnValue($q.when('wee'));

        studentsServiceMock.delete.and.returnValue(true);

        controller = $controller('StudentDeleteModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
          StudentsService: studentsServiceMock,
          ControllersFactory: controllerFactoryMock,
          student: student,
        });
      }
    );
  });

  it('should call decorateAlerts from service', function() {
    expect(controllerFactoryMock.decorateAlerts).toHaveBeenCalledWith(scope, modalInstanceMock);
  });

  it('should call decorateModalSubmit from service', function() {
    expect(controllerFactoryMock.decorateModalSubmit).toHaveBeenCalledWith(scope, modalInstanceMock, scope.serviceCall);
  });

  it('should assign function to $scope.serviceCall', function() {
    expect(typeof scope.serviceCall).toEqual('function');
  });

  it('should assign student to $scope.student', function() {
    expect(scope.student).toEqual(student);
  });

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(studentsServiceMock.delete).toHaveBeenCalledWith(student);
  });
});
