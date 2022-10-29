<!-- CSS LOGIN -->
<link rel="stylesheet" href="assets/css/styleLogin.css">
<title><?= $data['title']; ?></title>
<main class="form-signin w-100 m-auto">
    <form action="<?= $base_url?>c_login/Send" method="POST">
      <img class="mb-4 rounded-circle" src="../assets/img/login.jpg" alt="" width="72" height="57">
      <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

      <?php
          if(isset($_GET['pesan'])){
              if($_GET['pesan'] == "belum_login"){
                  echo "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                  Anda harus Login terlebih dahulu!
                  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                </div>";
              }else  if($_GET['pesan'] == "gagal"){
                echo "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                Email dan Password Anda Salah!
                <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
              </div>";
            }else  if($_GET['pesan'] == "logout"){
              echo "<div class='alert alert-success alert-dismissible fade show' role='alert'>
              Anda Berhasil Logout!
              <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
            </div>";
            }
          }