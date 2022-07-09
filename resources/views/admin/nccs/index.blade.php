@extends('_admin_layout')
@section('content')
<div lang="en" ng-app="myapp" ng-controller="mycontrol" class="card">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        Danh sách nhà cung cấp
    </div>
    <div class="card-body">
    <p><button class="btn btn-success" ng-click="showModal(0)"> Thêm mới <i class="fa fa-plus"></i></button></p>

        <div class="row">
            <div class="col-sm-12 col-md-6">
                <div class="dataTables_length" id="example_length">
                    <label>Show
                        <select ng-model="pageSize" id="pageSize"
                            class="custom-select custom-select-sm form-control form-control-sm">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="25">25</option>
                        </select>
                        entries</label>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div id="example_filter" class="dataTables_filter"><label>Search:
                        <input type="search" class="form-control form-control-sm" ng-model="timkiem"></label></div>
            </div>
        </div>

        <table class="table table-bordered table-stripper">
            <tr>
                <th>TT</th>
                <th>Tên NCC</th>
                <th>Địa chỉ</th>
                <th>Email</th>
                <th>SDT</th>
                <th>Sửa</th>
                <th>Xóa</th>
            </tr>
            <tr ng-repeat="ncc in staffs|filter: timkiem | begin:currentPage*pageSize | limitTo:pageSize">
        <td>@{{$index+1+(currentPage)*pageSize}}</td>
        <td>@{{ncc.ten_ncc}}</td>
        <td>@{{ncc.diachi_ncc}}</td>
        <td>@{{ncc.email}}</td>
        <td>@{{ncc.sdt}}</td>
        <td><button class=" btn btn-primary" ng-click="showModal(ncc.id)"> <i class="fa fa-pen"></i></button></td>
                <td><button class="btn btn-danger" ng-click="deleteClick(ncc.id)"> <i class="fa fa-trash"></i></button></td>
            </tr>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item" ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1"><a
                        class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                <li class="page-item"><a class="page-link" href="#">@{{currentPage + 1}}/@{{numberOfPages()}}</a></li>
                <li class="page-item" ng-disabled="currentPage >= getData().length/pageSize - 1"
                    ng-click="currentPage=currentPage+1"><a class="page-link" href="#"><i
                            class="fa fa-angle-right"></i></a></li>
            </ul>
        </nav>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
            integrity="sha512-Cy3gSrKCS8aJ7AIaammc0wLXyKRmTa8ntgHvU01Tuz4EdsqVgk/lKzFm/b/8RxOWBaoHI2uGLLU6rXMbqKcGHA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="/js/angular.min.js"></script>
        <script src="/js/ncc.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

        <!-- Modal -->
        <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">@{{modaltitle}}</h5>
                        <button type="button" ng-click="hideModal()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="">Tên NCC: </label>
                                <div><input type="text" ng-model="staff.ten_ncc" class="form-control"></div>
                            </div>
                            <div class="form-group">
                                <label for="">Địa chỉ: </label>
                                <div><input type="text" ng-model="staff.diachi_ncc" class="form-control"></div>
                            </div>
                            <div class="form-group">
                                <label for="">Email: </label>
                                <div><input type="text" ng-model="staff.email" class="form-control"></div>
                            </div>
                            <div class="form-group">
                                <label for="">SDT: </label>
                                <div><input type="text" ng-model="staff.sdt" class="form-control"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" ng-click="hideModal()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" ng-click="saveData()">Save</button>
                    </div>
                </div>
            </div>
        </div>

        
        </script>
        @stop