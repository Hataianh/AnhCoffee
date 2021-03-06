<!doctype html>
<html lang="en">

<head>
    <title>Anh Coffee - Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/admin_layout/css/style.css">

</head>

<body>




    <section class="ftco-section">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-10">
                    <div class="wrap d-md-flex">
                        <div class="img" style="background-image: url(/admin_layout/uploads/product5.jpg);">
                        </div>
                        <div class="login-wrap p-4 p-md-5">
                            <div class="d-flex">
                                <div class="w-100">
                                    <h3 class="mb-4">Sign In</h3>
                                </div>
                                <div class="w-100">
                                    <p class="social-media d-flex justify-content-end">
                                        <a href="#"
                                            class="social-icon d-flex align-items-center justify-content-center"><span
                                                class="fa fa-facebook"></span></a>
                                        <a href="#"
                                            class="social-icon d-flex align-items-center justify-content-center"><span
                                                class="fa fa-twitter"></span></a>
                                    </p>
                                </div>
                            </div>
                            <form  action="/admin" method="GET" class="signin-form">
                                <div class="form-group mb-3">
                                    <label class="label" for="name">Username</label>
                                    <input type="text"  class="form-control" placeholder="Username" id="username"
                                        required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="password">Password</label>
                                    <input type="password" class="form-control" placeholder="Password" id="password"
                                        required>
                                </div>
                                <div class="form-group">
                                    <button  type="submit"  onclick=" return singin()"
                                        class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50 text-left">
                                        <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="/admin/forgot">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                            <!-- <p class="text-center">Not a member? <a data-toggle="tab" href="/admin/register">Sign Up</a>
                            </p> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
    function singin() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        if (username == '') {
            alert('T??n ????ng nh???p kh??ng h???p l???');
        } else if (password == '') {
            alert('M???t kh???u kh??ng h???p l???');
        } else if (username == 'admin' && password == 'anhcoffee') {
            return true;
        } else {
            alert('T??i kho???n ho???c m???t kh???u kh??ng ch??nh x??c!');
        }
        return false;
    }
    </script>
    <script src="/admin_layout/js/jquery.min.js"></script>
    <script src="/admin_layout/js/popper.js"></script>
    <script src="/admin_layout/js/bootstrap.min.js"></script>
    <script src="/admin_layout/js/main.js"></script>
</body>

</html>