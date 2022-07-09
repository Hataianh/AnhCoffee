var app = angular.module('myapp', []).constant('api', '/api/donhangs/');
app.controller('mycontrol', ['$scope', '$http', '$filter', 'api', mycontrol]);

function mycontrol($scope, $http, $filter, api) {
    $scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.data = [];
    $scope.q = '';
    $scope.timkiem = "";
    const id = localStorage.getItem('chosenId') || 1;

    $scope.openDetails = (id) => {
        // console.log(id)
        localStorage.setItem('chosenId', id);
        // window.open('/detail');
    }
    $http({
        method: "GET",
        url: api
    }).then(function(res) {
        $scope.donhangs = res.data;
    });
    $scope.numberOfPages = function() {
        return Math.ceil($scope.donhangs.length / $scope.pageSize);
    }
    $scope.getData = function() {

        return $filter('filter')($scope.donhangs, $scope.timkiem)
    }

    $scope.$watch('timkiem', function(newValue, oldValue) {
        if (oldValue != newValue) {
            $scope.currentPage = 0;
        }
    }, true);

    $scope.reloadData = function() {
        $http({
            method: "GET",
            url: api
        }).then(function(res) {
            $scope.donhangs = res.data;
        });
    }
    $scope.showModal = function(id) {
        $scope.id = id;
        if (id == 0) {
            $scope.modaltitle = "Thêm mới +";
            if ($scope.donhang) {
                delete $scope.donhang;
            }
        } else {
            $scope.modaltitle = "Sửa chi tiết";
            $http({
                method: "GET",
                url: api + id
            }).then(function(res) {
                $scope.donhang = res.data;
            });
        }
        $('#modelId').modal('show');
    }
    $scope.hideModal = function() {
            $('#modelId').modal('hide');
        }
        // $scope.showModalct = function(id) {
        //     $scope.id = id;
        //     $scope.modaltitle = "Chi tiết";
        //     $http({
        //         method: "GET",
        //         url: api + id
        //     }).then(function(res) {
        //         $scope.donhang = res.data;
        //     });

    //     $('#modelIdct').modal('show');
    // }
    // $scope.hideModalct = function() {
    //     $('#modelIdct').modal('hide');
    // }
    $scope.ctdonhang = function(id) {
        $scope.id = id;

        $http({
            method: "GET",
            url: api + id
        }).then(function(res) {
            $scope.donhang = res.data;
        });
    }
    $scope.saveData = function() {
        var m = $scope.id == 0 ? "POST" : "PUT";
        var url = $scope.id == 0 ? api : api + $scope.id;
        $http({
            method: m,
            url: url,
            data: $scope.donhang,
            'content-Type': 'application/json'

        }).then(function(res) {
            $scope.donhang == res.data;
        });
        $('#modelId').modal('hide');
        $scope.reloadData();
    }
    $scope.deleteClick = function(id) {
        var hoi = confirm('Bạn có muốn xóa không?');
        if (hoi) {
            $http({
                method: "DELETE",
                url: api + id
            }).then(function(res) {
                $scope.message = res.data;
                $scope.reloadData();
            });
        }


    }

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
}
app.filter('begin', function() {
    return function(input, start) {
        start = +start;
        return input.slice(start);
    }
});