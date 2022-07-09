<!DOCTYPE html>
<html lang="en" ng-app="myapp" ng-controller="mycontrol">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<title>Chi tiết đơn hàng</title>
</head>
<body>

<table class="table table-hover" style="width:600px">
    <tbody>
        <tr>
            <td style="text-align: center">
                ANH<br>
                COFFEE<br>
                Đc: Dạ Trạch - Khoái Châu<br>
            </td>
            <td style="text-align: center">
                HÓA ĐƠN BÁN HÀNG<br>
                Chuyên:<br>
                In hóa đơn bán lẻ:<br>
            </td>
        </tr>
    </tbody>
</table>
<div ng-repeat="dh in donhangs">
<p>Người mua hàng: @{{dh.ho}} @{{dh.ten}} </p>
<p>Địa chỉ: @{{dh.diachi}}</p>
<p>Tỉnh/TP: @{{dh.thanhpho}}</p>
<p>Số điện thoại: @{{dh.sdt}}</p>
<p>Email: @{{dh.email}}</p>
</div>

<table class="table table-bordered table-hover" style="width:600px">
    <thead>
        <tr>
            <th>TT</th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Thành tiền</th>
        </tr>
    </thead>
    <tbody>
    
        
                    <tr ng-repeat="c in cart">
                        <td>@{{$index+1}}</td>
                        <td>@{{c.name}}</td>
                        <td>@{{c.quantity}}</td>
                        <td>@{{c.unit_price | number : 0}}</td>
                        <td>@{{c.quantity * c.unit_price | number : 0}}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><b>Tổng</b></td>
                        <td>@{{total| number : 0}}</td>
                    </tr>
                
        
    </tbody>
</table>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/angular.min.js"></script>
<script src="/js/donhang-ct.js"></script>
</body>
</html>

        