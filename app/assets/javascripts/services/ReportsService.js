services.factory('ReportsService', ['$http', function ($http) {
    o = {
      grades: []
    };

    o.generateReport = function() {
      return $http.get( 'reports/generate_report' )
    }

    o.getReportsFiles = function() {
      return $http.get( 'reports/get_reports.json' )
    }

    return o;
}]);
