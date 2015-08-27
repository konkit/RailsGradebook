describe('A suite', function() {
  it('at least runs the tests', function() {
    expect(true).toBe(true);
  });
});

describe('DivisionDeleteModalController', function() {
  var scope;
  var controller;

  beforeEach(function() {
    module('gradebookApp');

    controllerFactoryMock = jasmine.createSpyObj(
      'ControllersFactory',
      ['decorateAlerts', 'decorateModalSubmit']
    );

    divisionsServiceMock = jasmine.createSpyObj(
      'DivisionsService',
      ['delete']
    );

    modalInstanceMock = jasmine.createSpyObj(
      '$modalInstance', ['']
    );

    division = {id: '1'};

    inject(
      function($rootScope, $controller, $q) {
        scope = $rootScope.$new();

        controllerFactoryMock.decorateAlerts.and.returnValue($q.when('wee'));
        controllerFactoryMock.decorateModalSubmit.and.returnValue($q.when('wee'));

        divisionsServiceMock.delete.and.returnValue(true);

        controller = $controller('DivisionDeleteModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
          DivisionsService: divisionsServiceMock,
          ControllersFactory: controllerFactoryMock,
          division: division,
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

  it('should assign division to $scope.division', function() {
    expect(scope.division).toEqual(division);
  });

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(divisionsServiceMock.delete).toHaveBeenCalledWith(division);
  });
});
