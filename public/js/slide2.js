var app = angular.module('myapp', []).constant('api', '/api/slide2s/');
app.controller('mycontrol', ['$scope', '$http', '$filter', 'api', mycontrol]);

function mycontrol($scope, $http, $filter, api) {
    $scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.data = [];
    $scope.q = '';
    $scope.timkiem = "";
    $http({
        method: "GET",
        url: api
    }).then(function(res) {
        $scope.slide2s = res.data;
    });
    $scope.numberOfPages = function() {
        return Math.ceil($scope.slide2s.length / $scope.pageSize);
    }
    $scope.getData = function() {

        return $filter('filter')($scope.slide2s, $scope.timkiem)
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
            $scope.slide2s = res.data;
        });
    }
    $scope.showModal = function(id) {
        $scope.id = id;
        if (id == 0) {
            $scope.modaltitle = "Thêm mới +";
            if ($scope.slide2) {
                delete $scope.slide2;
            }
        } else {
            $scope.modaltitle = "Sửa chi tiết";
            $http({
                method: "GET",
                url: api + id
            }).then(function(res) {
                $scope.slide2 = res.data;
            });
        }
        $('#modelId').modal('show');
        const fileUpload = document.querySelector("#file-upload");
        fileUpload.addEventListener("change", (e) => {
            const files = e.target.files;
            document.getElementById('image').innerHTML = `<img src="/admin_layout/uploads/` + files[0].name + `" alt="Ảnh" style="width:100%;height:100%">`;
            for (const file of files) {
                const { name, type, size, lastModified } = file;
                // Làm gì đó với các thông tin trên
                $scope.slide2.image = file.name;
                document.getElementById('image').innerHTML = `<img src="/admin_layout/uploads/` + file.name + `" alt="Ảnh" style="width:100%;height:100%">`;
            };
        });
    }
    $scope.hideModal = function() {
        $('#modelId').modal('hide');
    }
    $scope.saveData = function() {
        var m = $scope.id == 0 ? "POST" : "PUT";
        var url = $scope.id == 0 ? api : api + $scope.id;
        $http({
            method: m,
            url: url,
            data: $scope.slide2,
            'content-Type': 'application/json'

        }).then(function(res) {
            $scope.slide2 == res.data;
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
}
app.filter('begin', function() {
    return function(input, start) {
        start = +start;
        return input.slice(start);
    }
});