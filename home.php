<?php include ('db_connect.php') ?>
<?php
$twhere = "";
if ($_SESSION['login_type'] != 1)
  $twhere = "  ";
?>
<!-- Info boxes -->
<?php if ($_SESSION['login_type'] == 2): ?>
  <div class="row">
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM department_list ")->num_rows; ?></h3>
          <p>Total Departemen</p>
        </div>
        <div class="icon">
          <i class="fa fa-th-list"></i>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM designation_list")->num_rows; ?></h3>
          <p>Total Jabatan</p>
        </div>
        <div class="icon">
          <i class="fa fa-list-alt"></i>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM users")->num_rows; ?></h3>
          <p>Total User</p>
        </div>
        <div class="icon">
          <i class="fa fa-users"></i>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM employee_list")->num_rows; ?></h3>
          <p>Total Karyawan</p>
        </div>
        <div class="icon">
          <i class="fa fa-user-friends"></i>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM evaluator_list")->num_rows; ?></h3>
          <p>Total Penilai</p>
        </div>
        <div class="icon">
          <i class="fa fa-user-secret"></i>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-6 col-md-4">
      <div class="small-box bg-light shadow-sm border">
        <div class="inner">
          <h3><?php echo $conn->query("SELECT * FROM task_list")->num_rows; ?></h3>
          <p>Total Tugas</p>
        </div>
        <div class="icon">
          <i class="fa fa-tasks"></i>
        </div>
      </div>
    </div>
  </div>
<?php else: ?>
  <div class="col-12">
    <div class="card">
      <div class="card-body">
        <h5 class="text-center mb-4">Selamat Datang, <?php echo $_SESSION['login_name'] ?>!</h5>
        <div class="row">
          <?php if ($_SESSION['login_type'] == 0): // Employee ?>
            <?php
            $employee_id = $_SESSION['login_id'];
            $completed_tasks = $conn->query("SELECT * FROM task_list WHERE employee_id = $employee_id AND id IN (SELECT task_id FROM task_progress WHERE is_complete = 1)")->num_rows;
            $in_progress_tasks = $conn->query("SELECT * FROM task_list WHERE employee_id = $employee_id AND id NOT IN (SELECT task_id FROM task_progress WHERE is_complete = 1)")->num_rows;
            $total_assigned_tasks = $conn->query("SELECT * FROM task_list WHERE employee_id = $employee_id")->num_rows;
            ?>
            <div class="col-md-6">
              <div class="info-box bg-success">
                <span class="info-box-icon"><i class="fa fa-check"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Tugas Selesai</span>
                  <span class="info-box-number"><?php echo $completed_tasks; ?></span>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="info-box bg-warning">
                <span class="info-box-icon"><i class="fa fa-tasks"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Tugas Belum Selesai</span>
                  <span class="info-box-number"><?php echo $in_progress_tasks; ?></span>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="info-box bg-info">
                <span class="info-box-icon"><i class="fa fa-tasks"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Total Tugas Diberikan</span>
                  <span class="info-box-number"><?php echo $total_assigned_tasks; ?></span>
                </div>
              </div>
            </div>
          <?php elseif ($_SESSION['login_type'] == 1): // Evaluator ?>
            <?php
            $evaluator_id = $_SESSION['login_id'];
            $completed_evaluations = $conn->query("SELECT * FROM ratings WHERE evaluator_id = $evaluator_id AND accuracy > 0")->num_rows;
            $pending_evaluations = $conn->query("SELECT * FROM ratings WHERE evaluator_id = $evaluator_id AND accuracy = 0")->num_rows;
            $total_given_evaluations = $conn->query("SELECT * FROM ratings WHERE evaluator_id = $evaluator_id")->num_rows;
            ?>
            <div class="col-md-6">
              <div class="info-box bg-success">
                <span class="info-box-icon"><i class="fa fa-check-circle"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Penilaian Selesai</span>
                  <span class="info-box-number"><?php echo $completed_evaluations; ?></span>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="info-box bg-warning">
                <span class="info-box-icon"><i class="fa fa-spinner"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Penilaian Belum Selesai</span>
                  <span class="info-box-number"><?php echo $pending_evaluations; ?></span>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="info-box bg-info">
                <span class="info-box-icon"><i class="fa fa-tasks"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Total Penilaian Diberikan</span>
                  <span class="info-box-number"><?php echo $total_given_evaluations; ?></span>
                </div>
              </div>
            </div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </div>
<?php endif; ?>

<!-- Add some CSS for the info boxes -->
<style>
  .info-box {
    display: flex;
    background: #f7f7f7;
    border-radius: 5px;
    margin-bottom: 20px;
    padding: 10px;
    color: #444;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  }

  .info-box .info-box-icon {
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 70px;
    font-size: 36px;
  }

  .info-box .info-box-content {
    flex-grow: 1;
    padding: 5px 10px;
  }

  .info-box .info-box-text {
    font-weight: bold;
    font-size: 16px;
  }

  .info-box .info-box-number {
    font-size: 24px;
  }

  .info-box.bg-success {
    background: #28a745 !important;
    color: white;
  }

  .info-box.bg-warning {
    background: #ffc107 !important;
    color: white;
  }

  .info-box.bg-info {
    background: #17a2b8 !important;
    color: white;
  }

  .small-box {
    position: relative;
    padding: 20px;
    overflow: hidden;
    border-radius: 10px;
    text-align: center;
  }

  .small-box .icon {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 0;
    font-size: 90px;
    opacity: 0.2;
  }
</style>