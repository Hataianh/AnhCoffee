var app = angular.module('myapp', []);
app.controller('mycontrol', function($scope, $http) {
    const id = localStorage.getItem('chosenId') || 1;

    $scope.openDetails = (id) => {
        // console.log(id)
        localStorage.setItem('chosenId', id);
        // window.open('/detail');
    }
    $http({
        Method: "GET",
        url: "/api/sanphamhomes/"
    }).success(function(response) {
        console.log(response);
        $scope.sanphams = response;
    });
    $http({
        Method: "GET",
        url: "/api/tintuchomes/"
    }).success(function(response) {
        console.log(response);
        $scope.tintucs = response;
    });
});