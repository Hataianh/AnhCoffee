var app = angular.module('myapp', []);
app.controller('mycontrol', function($scope, $http) {
    var list = JSON.parse(localStorage.getItem('cart'));
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


    // $scope.DatHang = function() {



    //     let item = {};
    //     item.ten = document.getElementById('txt_ten').value;
    //     item.ho = document.getElementById('txt_ho').value;
    //     item.diachi = document.getElementById('txt_diachi').value;
    //     item.thanhpho = document.getElementById('txt_thanhpho').value;
    //     item.sdt = document.getElementById('txt_sdt').value;
    //     item.email = document.getElementById('txt_email').value;
    //     item.ghichu = document.getElementById('txt_ghichu').value;


    //     // console.log(item);
    //     var list;
    //     if (localStorage.getItem('info') == null) {
    //         list = [item];
    //     } else {
    //         list = JSON.parse(localStorage.getItem('info')) || [];
    //         let ok = true;
    //         for (let x of list) {

    //             ok = false;
    //             break;

    //         }
    //         if (ok) {
    //             list.push(item);
    //         }
    //     }
    //     localStorage.setItem('info', JSON.stringify(list));
    //     alert("Đặt hàng thành công");
    // }


    $scope.dathang = () => {
        const order = {
            ten: $scope.ten,
            ho: $scope.ho,
            diachi: $scope.diachi,
            thanhpho: $scope.thanhpho,
            sdt: $scope.sdt,
            email: $scope.email,
            ghichu: $scope.ghichu,
            tongtien: $rootScope.total,
            details: $scope.cart,
        };

        $http({
            method: "POST",
            url: "/api/donhangs/",
            data: order
        }).then(res => {
            localStorage.removeItem('cart');
            location.href = "/dat-hang"
        }, err => console.log(err));
    }
});