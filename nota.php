<?php 
session_start();
include 'koneksi.php'; 
?>

<!DOCTYPE html>
<html>
<head>
    <title>Nota Pembelian</title>
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>
    <?php include 'menu.php' ?>

    <section class="konten">
        <div class="container">
        <h2>Detail Pembelian</h2>
        <?php
            $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan WHERE pembelian.id_pembelian='$_GET[id]'");
            $detail = $ambil->fetch_assoc();
        ?>

        <?php
        //hanya dapat menampilkan id_pembelian sesuai id_pelanggan saja
        $idpelangganbeli = $detail["id_pelanggan"];
        $idpelangganlogin = $_SESSION["pelanggan"]["id_pelanggan"];

        if($idpelangganbeli!==$idpelangganlogin){
            echo "<script>alert('Maaf ini bukan id anda');</script>";
            echo "<script>location='riwayat.php';</script>";
            exit();
        }
        ?>
        
        <div class="row">
            <div class="col-md-4">
                <h3>Pembelian</h3>
                <strong>No. Pembelian : <?php echo $detail['id_pembelian'] ?></strong><br>
                Tanggal : <?php echo $detail['tanggal_pembelian']; ?><br>
                Total : Rp. <?php echo number_format($detail['total_pembelian']) ?>
            </div>
            <div class="col-md-4">
                <h3>Pelanggan</h3>
                <strong><?php echo $detail['nama_pelanggan']; ?></strong>
                <p>
                    <?php echo $detail['telepon_pelanggan']; ?><br>
                    <?php echo $detail['email_pelanggan']; ?>
                </p>
            </div>
            <div class="col-md-4">
                <h3>Pengiriman</h3>
                <strong><?php echo $detail['ekspedisi'] ?></strong> <br>
                Ongkos Kirim : Rp. <?php echo number_format($detail['tarif']); ?><br>
                Alamat : <?php echo $detail['alamat_pengiriman'] ?>
            </div>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Produk</th>
                    <th>Harga</th>
                    <th>Berat</th>
                    <th>Jumlah</th>
                    <th>Subberat</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
            <?php $nomor=1; ?>
                <?php $ambil=$koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'"); ?>
                <?php while($pecah=$ambil->fetch_assoc()){ ?>
                <tr>
                    <td><?php echo $nomor; ?></td>
                    <td><?php echo $pecah['nama']; ?></td>
                    <td>Rp. <?php echo number_format($pecah['harga']); ?></td>
                    <td><?php echo $pecah['berat']; ?> Gr.</td>
                    <td><?php echo $pecah['jumlah']; ?></td>
                    <td><?php echo $pecah['subberat']; ?> Gr.</td>
                    <td><?php echo number_format($pecah['subharga']) ?></td>
                </tr>
                <?php $nomor++; ?>
                <?php } ?>
            </tbody>
        </table>

        <div class="row">
            <div class="col-md-7">
                <div class="alert alert-info">
                    <p>
                        Total yang harus dibayar Rp. <?php echo number_format($detail['total_pembelian']); ?> <br>
                        <strong>BANK BRI <br>6272-01-001006-50-7<br> a.n. Maria Puji</strong>
                    </p>
                </div>
            </div>
            <div>
                <a href="<?php echo $pecah["id_pembelian"]; ?>">
                    <button onClick="window.print();">Print</button>
                </a>
            </div>
        </div>
    </section>
</body>
</html>