describe('A suite', function() {
  it('at least runs the tests', function() {
    expect(true).toBe(true);
  });
});

describe('StudentCreateModalController', function() {
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
      ['create']
    );

    divisionsServiceMock = jasmine.createSpyObj(
      'DivisionsService',
      ['getDivisions']
    );

    modalInstanceMock = jasmine.createSpyObj(
      '$modalInstance', ['']
    );

    inject(
      function($rootScope, $controller, $q) {
        scope = $rootScope.$new();

        division = {id: '1'};
        scope.division = division;

        controllerFactoryMock.decorateAlerts.and.returnValue($q.when('wee'));
        controllerFactoryMock.decorateModalSubmit.and.returnValue($q.when('wee'));

        studentsServiceMock.create.and.returnValue(true);
        divisionsServiceMock.getDivisions.and.returnValue({success: function() {
          scope.divisionsData = [{id: 1}, {id: 2},];
        },});

        controller = $controller('StudentCreateModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
          StudentsService: studentsServiceMock,
          DivisionsService: divisionsServiceMock,
          ControllersFactory: controllerFactoryMock,
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

  it('should assign divisionsData to $scope.divisions', function() {
    expect(scope.divisionsData).toEqual([{id: 1}, {id: 2},]);
  });

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(studentsServiceMock.create).toHaveBeenCalled();
  });
});
