gradebookApp.controller( 'TeacherReportFilesController', ['$scope', '$state', 'ReportsService', function($scope, $state, ReportsService) {
    $scope.generateNewReport = function() {
      ReportsService.generateReport().success(function(response) {
        $scope.getReports();
      });
    }

    $scope.getReports = function() {
      ReportsService.getReportsFiles().success(function(response) {
        $scope.reportFiles = response;
      });
    }
    $scope.getReports();
}]);
