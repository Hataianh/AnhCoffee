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
        url: "/api/donhangs/"
    }).success(function(response) {
        console.log(response);
        $scope.donhangs = response;
    });
    $scope.LoadCart = function() {
        $scope.cart = JSON.parse(localStorage.getItem('cart'));

    }
    $scope.LoadCart();

    $scope.total = 0;

    function reCaculatioTotalPrice() {
        let total = 0;
        $scope.cart.forEach(e => {
            total += e.unit_price * e.quantity
        });
        $scope.total = total;
    }
    reCaculatioTotalPrice()
});