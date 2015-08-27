describe('DivisionCreateModalController', function() {
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
      ['create']
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

        divisionsServiceMock.create.and.returnValue(true);

        controller = $controller('DivisionCreateModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
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

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(divisionsServiceMock.create).toHaveBeenCalled();
  });
});
