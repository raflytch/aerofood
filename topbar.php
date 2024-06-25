<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-light-green navbar-dark">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <?php if (isset($_SESSION['login_id'])): ?>
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="" role="button"><i class="fas fa-bars"></i></a>
      </li>
    <?php endif; ?>
    <li class="nav-item">
      <!-- Logo and Title -->
      <a class="navbar-brand d-flex align-items-center" href="./">
        <img src="https://aerofoodacs.com/wp-content/uploads/2019/06/favicon-logo-1.png" alt="Aerofood Logo"
          class="brand-logo" style="height: 30px; width: auto; margin-right: 10px;">
        <span class="text-white"><b>Sistem Penilaian Karyawan Aerofood ACS</b></span>
      </a>
      <!-- End Logo and Title -->
    </li>
  </ul>

  <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link" data-widget="fullscreen" href="#" role="button">
        <i class="fas fa-expand-arrows-alt"></i>
      </a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" aria-expanded="true" href="javascript:void(0)">
        <span>
          <div class="d-flex badge-pill">
            <span class=""><img src="assets/uploads/<?php echo $_SESSION['login_avatar'] ?>" alt=""
                class="user-img border "></span>
            <span><b><?php echo ucwords($_SESSION['login_firstname']) ?></b></span>
            <span class="fa fa-angle-down ml-2"></span>
          </div>
        </span>
      </a>
      <div class="dropdown-menu" aria-labelledby="account_settings" style="left: -2.5em;">
        <a class="dropdown-item" href="javascript:void(0)" id="manage_account"><i class="fa fa-cog"></i> Manage
          Account</a>
        <a class="dropdown-item" href="ajax.php?action=logout"><i class="fa fa-power-off"></i> Logout</a>
      </div>
    </li>
  </ul>
</nav>
<!-- /.navbar -->
<script>
  $('#manage_account').click(function () {
    uni_modal('Manage Account', 'manage_user.php?id=<?php echo $_SESSION['login_id'] ?>')
  })
</script>
<style>
  .navbar-light-green {
    background-color: #4CC074 !important;
    /* Light green color */
  }

  .user-img {
    border-radius: 50%;
    height: 25px;
    width: 25px;
    object-fit: cover;
  }

  .brand-logo {
    height: 30px;
    width: auto;
  }

  .navbar-brand {
    display: flex;
    align-items: center;
  }

  .navbar-brand .text-white {
    margin-top: 3px;
    /* Adjust margin to align with logo */
  }
</style>