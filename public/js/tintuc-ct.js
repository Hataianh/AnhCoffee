var app = angular.module('myapp', []).constant('api', '/api/tintucs/');
app.controller('ct', ['$scope', '$http', '$filter', 'api', mycontrol]);


function ct($scope, $http, $filter, api) {
    const id = localStorage.getItem('chosenId') || 1;

    $scope.openDetails = (id) => {
        // console.log(id)
        localStorage.setItem('chosenId', id);
        // window.open('/detail');
    }
    $http({
        method: "GET",
        url: api + localStorage.getItem('chosenId')
    }).then(function(res) {
        $scope.tt = res.data;
        console.log($scope.tt);
    });
    $http({
        Method: "GET",
        url: "/api/tintucs/"
    }).success(function(response) {
        console.log(response);
        $scope.tintucs = response;
    });
}
app.filter('begin', function() {
    return function(input, start) {
        start = ++start;
        return input.slice(start);
    }
});