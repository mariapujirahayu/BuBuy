-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Mar 2019 pada 12.22
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bubuy`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'maria', 'maria', 'Maria Puji Rahayu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `ekspedisi` varchar(20) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `ekspedisi`, `tarif`) VALUES
(1, 'Area Lowokwaru', 5000),
(2, 'Area Sukun', 8000),
(3, 'Area Klojen', 7000),
(4, 'Area Blimbing', 5000),
(5, 'Area Kedungkandang', 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'maria@gmail.com', 'maria', 'Maria Puji', '08123456789', ''),
(2, 'puput@gmail.com', 'puput', 'Puput Puji', '08123123123', ''),
(3, 'mariapujir@gmail.com', 'maria123', 'Maria Puji Rahayu', '0819283798383', 'Kediri'),
(4, 'katarina@gmail.com', 'katarina', 'Katarina', '081728917263', 'Seoul');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `ekspedisi` varchar(15) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `ekspedisi`, `tarif`, `alamat_pengiriman`) VALUES
(1, 2, 1, '2018-11-29', 330000, '', 0, ''),
(2, 2, 1, '2018-11-30', 165000, '', 0, ''),
(6, 2, 2, '2018-12-05', 503000, '', 0, ''),
(7, 2, 3, '2018-12-05', 506000, '', 0, ''),
(8, 2, 3, '2018-12-05', 506000, '', 0, ''),
(9, 2, 2, '2018-12-05', 503000, '', 0, ''),
(10, 2, 3, '2018-12-05', 506000, '', 0, ''),
(11, 2, 1, '2018-12-05', 242000, '', 0, ''),
(12, 2, 3, '2018-12-05', 241000, '', 0, ''),
(13, 1, 2, '2018-12-05', 283000, 'Pos Indonesia', 18000, ''),
(14, 1, 1, '2018-12-05', 167000, 'JNE', 22000, 'Jl. Kumis Kucing No. 30 Lowokwaru Malang'),
(15, 3, 1, '2018-12-07', 262000, 'JNE', 22000, 'mm'),
(16, 1, 1, '2018-12-08', 552000, 'JNE', 22000, 'Malang'),
(17, 1, 2, '2018-12-08', 938000, 'Pos Indonesia', 18000, 'Malang'),
(18, 3, 1, '2018-12-08', 357000, 'JNE', 22000, 'Kediri'),
(19, 3, 1, '2018-12-08', 167000, 'JNE', 22000, 'Malang'),
(21, 1, 3, '2018-12-18', 426000, 'JNT', 21000, 'Kediri'),
(22, 1, 2, '2018-12-18', 453000, 'Pos Indonesia', 18000, 'Kediri'),
(23, 1, 2, '2018-12-19', 253000, 'Pos Indonesia', 18000, 'Kediri'),
(24, 1, 1, '2018-12-19', 117000, 'JNE', 22000, 'Kediri'),
(25, 1, 1, '2018-12-20', 232000, 'JNE', 22000, 'Surabaya'),
(27, 1, 3, '2018-12-20', 501000, 'JNT', 21000, 'Solo'),
(28, 4, 2, '2018-12-20', 243000, 'Pos Indonesia', 18000, 'Seoul'),
(29, 1, 1, '2018-12-21', 793000, 'JNE', 22000, 'Solo'),
(30, 1, 1, '2019-03-22', 117000, 'JNE', 22000, 'Jogja'),
(31, 1, 1, '2019-03-22', 50000, 'Area Lowokwaru', 5000, 'Kumis Kucing');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 1, '', 0, 0, 0, 0),
(3, 0, 4, 2, '', 0, 0, 0, 0),
(4, 0, 2, 1, '', 0, 0, 0, 0),
(5, 9, 4, 2, '', 0, 0, 0, 0),
(6, 9, 2, 1, '', 0, 0, 0, 0),
(7, 10, 4, 2, '', 0, 0, 0, 0),
(8, 10, 2, 1, '', 0, 0, 0, 0),
(9, 11, 3, 1, '', 0, 0, 0, 0),
(10, 11, 2, 1, '', 0, 0, 0, 0),
(11, 12, 3, 1, 'Kaos Kuning', 75000, 0, 500, 75000),
(12, 12, 2, 1, 'Kemeja Putih', 145000, 0, 500, 145000),
(13, 13, 3, 1, 'Kaos Kuning', 95000, 0, 500, 95000),
(14, 13, 4, 1, 'Jaket jeans', 170000, 0, 500, 170000),
(15, 14, 2, 1, 'Kemeja Putih', 145000, 0, 500, 145000),
(16, 15, 2, 1, 'Kemeja Putih', 145000, 0, 500, 145000),
(17, 15, 3, 1, 'Kaos Kuning', 95000, 0, 500, 95000),
(18, 16, 2, 3, 'Kemeja Putih', 145000, 0, 1500, 435000),
(19, 16, 3, 1, 'Kaos Kuning', 95000, 0, 500, 95000),
(20, 17, 4, 2, 'Jaket jeans', 170000, 0, 1000, 340000),
(21, 17, 2, 4, 'Kemeja Putih', 145000, 0, 2000, 580000),
(22, 19, 2, 1, 'Kemeja Putih', 145000, 0, 500, 145000),
(24, 21, 14, 1, 'Cardigan Panjang', 170000, 0, 500, 170000),
(25, 21, 8, 2, 'Topi Warna', 95000, 0, 1000, 190000),
(26, 21, 2, 1, 'Kaos Kaki Garis', 45000, 0, 500, 45000),
(27, 22, 11, 1, 'Round Cardigan', 210000, 0, 500, 210000),
(28, 22, 5, 1, 'Skinny Jeans', 225000, 0, 500, 225000),
(29, 23, 2, 1, 'Kaos Kaki Garis', 45000, 0, 500, 45000),
(30, 23, 3, 2, 'Kaos Striped', 95000, 0, 1000, 190000),
(31, 24, 3, 1, 'Kaos Striped', 95000, 0, 500, 95000),
(32, 25, 11, 1, 'Round Cardigan', 210000, 0, 500, 210000),
(33, 26, 13, 1, 'Print Socks', 65000, 0, 500, 65000),
(34, 26, 12, 1, 'Slim Fit Pants', 241000, 0, 500, 241000),
(35, 27, 8, 1, 'Topi Warna', 95000, 0, 500, 95000),
(36, 27, 10, 1, 'Dress Floral', 340000, 0, 500, 340000),
(37, 27, 2, 1, 'Kaos Kaki Garis', 45000, 0, 500, 45000),
(38, 28, 8, 1, 'Topi Warna', 95000, 0, 500, 95000),
(39, 28, 13, 2, 'Print Socks', 65000, 0, 1000, 130000),
(40, 29, 12, 1, 'Slim Fit Pants', 241000, 0, 500, 241000),
(41, 29, 10, 1, 'Dress Floral', 340000, 0, 500, 340000),
(42, 29, 3, 2, 'Kaos Striped', 95000, 0, 1000, 190000),
(43, 30, 3, 1, 'Kaos Striped', 95000, 0, 500, 95000),
(44, 31, 2, 1, 'Kaos Kaki Garis', 45000, 0, 500, 45000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(2, 'Kaos Kaki Garis', 45000, 500, 'L_g0075561456.jpg', '            Kaos kaki garis-garis lucu        ', 0),
(3, 'Kaos Striped', 95000, 500, 'L_g0088750758.jpg', '            Kaos Striped Kuning bagus        ', 2),
(4, 'Jeans', 170000, 500, '0048672272.jpg', 'Celana Jeans', 8),
(5, 'Skinny Jeans', 225000, 500, '0042659108.jpg', '                        Skinny Jeans                ', 14),
(7, 'Sweatshirt Panjang', 155000, 500, 'L_g0073905761.jpg', '            Striped Panjang Sweatshirt        ', 23),
(8, 'Topi Warna', 95000, 500, 'L_g0056657121.jpg', '            Topi warna tersedia dalam 5 warna        ', 13),
(9, 'Topi Baret', 125000, 500, 'L_g0057734451.jpg', '            Topi baret tersedia 3 warna        ', 6),
(10, 'Dress Floral', 340000, 500, '0051743939.jpg', '            Dress Floral hanya tersedia warna hitam dengan ukuran S, M dan L        ', 9),
(11, 'Round Cardigan', 210000, 500, '0051743495.jpg', '                        Round neck cardigan tersedia hanya satu ukuran                ', 18),
(12, 'Slim Fit Pants', 241000, 500, 'L_g0079959553.jpg', '            Slim fit pants corak hitam putih        ', 3),
(13, 'Print Socks', 65000, 500, 'L_g0077382782.jpg', '            Tersedia 2 warna :\r\nHitam dan putih        ', 10),
(14, 'Cardigan Panjang', 170000, 500, 'L_g0094299860.jpg', '                        Cardigan panjang all size                ', 17);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
