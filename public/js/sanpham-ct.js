var app = angular.module('myapp', []).constant('api', '/api/sanphams/');
app.controller('mycontrol', ['$scope', '$http', '$filter', 'api', mycontrol]);


function mycontrol($scope, $http, $filter, api) {
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
        $scope.sp = res.data;
        console.log($scope.sp);
    });
    $http({
        Method: "GET",
        url: "/api/sanphams/"
    }).success(function(response) {
        console.log(response);
        $scope.sanphams = response;
    });
    $scope.addToCart = function() {



        let item = {};
        item.id = $scope.sp.id;
        item.name = $scope.sp.name;
        item.gia_kkm = $scope.sp.gia_kkm;
        item.unit_price = $scope.sp.unit_price;
        item.image = $scope.sp.image;


        // console.log(item);
        item.quantity = 1;
        console.log(item.quantity)
        var list;
        if (localStorage.getItem('cart') == null) {
            list = [item];
        } else {
            list = JSON.parse(localStorage.getItem('cart')) || [];
            let ok = true;
            for (let x of list) {
                if (x.id == item.id) {
                    x.quantity += 1;
                    ok = false;
                    break;
                }
            }
            if (ok) {
                list.push(item);
            }
        }
        localStorage.setItem('cart', JSON.stringify(list));
        alert("Đã thêm giỏ hàng thành công");
    }

}
app.filter('begin', function() {
    return function(input, start) {
        start = ++start;
        return input.slice(start);
    }
});