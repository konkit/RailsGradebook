describe('A suite', function() {
  it('at least runs the tests', function() {
    expect(true).toBe(true);
  });
});

describe('SubjectDeleteModalController', function() {
  var scope;
  var controller;

  beforeEach(function() {
    module('gradebookApp');

    controllerFactoryMock = jasmine.createSpyObj(
      'ControllersFactory',
      ['decorateAlerts', 'decorateModalSubmit']
    );

    subjectsServiceMock = jasmine.createSpyObj(
      'SubjectsService',
      ['delete']
    );

    modalInstanceMock = jasmine.createSpyObj(
      '$modalInstance', ['']
    );

    subject = {id: '1'};

    inject(
      function($rootScope, $controller, $q) {
        scope = $rootScope.$new();

        controllerFactoryMock.decorateAlerts.and.returnValue($q.when('wee'));
        controllerFactoryMock.decorateModalSubmit.and.returnValue($q.when('wee'));

        subjectsServiceMock.delete.and.returnValue(true);

        controller = $controller('SubjectDeleteModalController', {
          $scope: scope,
          $modalInstance: modalInstanceMock,
          SubjectsService: subjectsServiceMock,
          ControllersFactory: controllerFactoryMock,
          subject: subject,
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

  it('should assign subject to $scope.subject', function() {
    expect(scope.subject).toEqual(subject);
  });

  it('should make service call in serviceCall function', function() {
    scope.serviceCall();
    expect(subjectsServiceMock.delete).toHaveBeenCalledWith(subject);
  });
});
