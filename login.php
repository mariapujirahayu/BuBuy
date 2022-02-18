<?php
session_start();
include 'koneksi.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Pelanggan</title>
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>
    <?php include 'menu.php' ?>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login Pelanggan</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="email" class="form-control" name="email">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <button class="btn btn-primary" name="login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php
        if(isset($_POST["login"])){
            $email = $_POST["email"];
            $password = $_POST["password"];
            $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email' AND password_pelanggan='$password'");
            $akunbenar = $ambil->num_rows;
            if($akunbenar==1){
                $akun = $ambil->fetch_assoc();
                $_SESSION["pelanggan"] = $akun;
                echo "<script>alert('Anda Sukses Login'); </script>";

                //jika sudah belanja dan memasukkan barang ke keranjang dengan klik checkout saat blm login
                if(isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"])){
                    echo "<script>location='checkout.php';</script>";
                }
                else{
                    echo "<script>location='index.php';</script>";
                }
            }
            else{
                echo "<script>alert('Anda Gagal Login, periksa lagi akun anda'); </script>";
                echo "<script>location=login.php';</script>";
            }
        }
    ?>
</body>
</html>