describe('A suite', function() {
  it('at least runs the tests', function() {
    expect(true).toBe(true);
  });
});

describe('TeacherDeleteModalController', function() {
  var scope;
  var controller;

  beforeEach(function() {
    module('gradebookApp');

    controllerFactoryMock = jasmine.createSpyObj(
      'ControllersFactory',
      ['decorateAlerts', 'decorateModalSubmit']
    );

    teachersServiceMock = jasmine.createSpyObj(
      'TeachersService',
      ['delete']
    );

    modalInstanceMock = jasmine.createSpyObj(
      '$modalInstance', ['']
    );

    teacher = {id: '1'};

    inject(
      function($rootScope, $controller, $q) {
        scope = $rootScope.$new();

        controllerFactoryMock.decorateAlerts.and.returnValue($q.when('wee'));
        controllerFactoryMock.decorateModalSubmit.and.returnValue($q.when('wee'));

        teachersServiceMock.delete.and.returnValue(true);

        controller = $controller('TeacherDeleteModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
          TeachersService: teachersServiceMock,
          ControllersFactory: controllerFactoryMock,
          teacher: teacher,
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

  it('should assign teacher to $scope.teacher', function() {
    expect(scope.teacher).toEqual(teacher);
  });

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(teachersServiceMock.delete).toHaveBeenCalledWith(teacher);
  });
});
