<!DOCTYPE html>
<html lang="en">
<?php
session_start();
include ('./db_connect.php');
ob_start();
// if(!isset($_SESSION['system'])){

$system = $conn->query("SELECT * FROM system_settings")->fetch_array();
foreach ($system as $k => $v) {
  $_SESSION['system'][$k] = $v;
}
// }
ob_end_flush();
?>
<?php
if (isset($_SESSION['login_id']))
  header("location:index.php?page=home");
?>
<?php include 'header.php' ?>

<head>
  <style>
    body {
      position: relative;
      background-image: url('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjVz5BrrIBRvVe1A7KI83MosDrMszWYmXGHQL1M7uERzB863vOGpQY-k3qDJf5nV1QOu2xa9KKDXHlqBLdf1LFX03X7IE5oUzDgUWEPYZU07xL2hoEQq30FfrwSOwxogxJtX9vQJ3rHIpy9/s1600/jdl.JPG');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center center;
      color: white;
      z-index: 1;
    }

    body::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      /* Black overlay with 50% opacity */
      z-index: -1;
    }

    .login-box {
      position: relative;
      z-index: 2;
      /* Ensure login box is above the overlay */
      width: 360px;
      margin: 100px auto;
    }

    .card {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .login-card-body {
      padding: 20px;
      border-radius: 10px;
      background: rgba(255, 255, 255, 0.9);
    }

    .form-control {
      border-radius: 10px;
    }

    .input-group-text {
      border-radius: 0 10px 10px 0;
    }

    .btn-primary {
      background-color: #95D2B3;
      border-color: #95D2B3;
      color: #fff;
      border-radius: 10px;
    }

    .btn-primary:hover {
      background-color: #7cb89b;
      border-color: #7cb89b;
    }

    .alert {
      border-radius: 10px;
    }

    .icheck-primary input[type="checkbox"]:checked+label::before {
      background-color: #95D2B3;
      border-color: #95D2B3;
    }
  </style>
</head>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="card">
      <div class="card-body login-card-body">
        <form action="" id="login-form">
          <div class="input-group mb-3">
            <input type="email" class="form-control" name="email" required placeholder="Email">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" name="password" required placeholder="Password">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="form-group mb-3">
            <label for="" style="color: #333;">Login As</label>
            <select name="login" id="" class="custom-select custom-select-sm">
              <option value="0">Employee</option>
              <option value="1">Evaluator</option>
              <option value="2">Admin</option>
            </select>
          </div>
          <div class="row">
            <div class="col-8">
              <div class="icheck-primary">
                <input type="checkbox" id="remember">
                <label for="remember" style="color: #333;">
                  Remember Me
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-4">
              <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </div>
            <!-- /.col -->
          </div>
        </form>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->
  <script>
    $(document).ready(function () {
      $('#login-form').submit(function (e) {
        e.preventDefault()
        start_load()
        if ($(this).find('.alert-danger').length > 0)
          $(this).find('.alert-danger').remove();
        $.ajax({
          url: 'ajax.php?action=login',
          method: 'POST',
          data: $(this).serialize(),
          error: err => {
            console.log(err)
            end_load();
          },
          success: function (resp) {
            if (resp == 1) {
              location.href = 'index.php?page=home';
            } else {
              $('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
              end_load();
            }
          }
        })
      })
    })
  </script>
  <?php include 'footer.php' ?>

</body>

</html>