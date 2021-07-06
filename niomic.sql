-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jul 2021 pada 05.11
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niomic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_niomic`
--

CREATE TABLE `mahasiswa_niomic` (
  `nim` int(9) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `asal` varchar(50) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `nilai_uan` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa_niomic`
--

INSERT INTO `mahasiswa_niomic` (`nim`, `nama`, `asal`, `jurusan`, `nilai_uan`) VALUES
(17020217, 'Irfan Arifin', 'Lampung', 'Kedokteran Gigi', '341.10'),
(17080225, 'Husli Khairan', 'Jakarta', 'Akutansi', '500.00'),
(17080305, 'Rina Kumala Sari', 'Jakarta', 'Akutansi', '337.99'),
(17090113, 'Riana Putria', 'Padang', 'Kimia', '339.20'),
(17090141, 'Lidya Fitriana', 'Surabaya', 'Kimia', '290.54'),
(17090222, 'Sari Citra Lestari', 'Jakarta', 'Manajemen', '310.60'),
(17090308, 'Christine Wijaya', 'Medan', 'Manajemen', '321.74'),
(17140119, 'Sandri Fatmala', 'Bandung', 'Ilmu Komputer', '322.91'),
(17140120, 'Bobby Permana', 'Medan', 'Ilmu Komputer', '280.82'),
(17140133, 'Ikhsan Prayoga', 'Jakarta', 'Ilmu Komputer', '300.16'),
(17140143, 'Rudi Permana', 'Bandung', 'Ilmu Komputer', '290.44');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_ipk`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_ipk` (
`nim` char(8)
,`nama` varchar(50)
,`IPK` decimal(10,6)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_ipk_format`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_ipk_format` (
`Nama dan IPK` varchar(65)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_mahasiswa`
--

CREATE TABLE `nilai_mahasiswa` (
  `nim` char(8) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `semester_1` decimal(4,2) DEFAULT NULL,
  `semester_2` decimal(4,2) DEFAULT NULL,
  `semester_3` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_mahasiswa`
--

INSERT INTO `nilai_mahasiswa` (`nim`, `nama`, `semester_1`, `semester_2`, `semester_3`) VALUES
('17080305', 'Rina Kumala Sari', '3.45', '2.56', '3.67'),
('17090113', 'Riana Putria', '3.12', '2.98', '3.45'),
('17090308', 'Christine Wijaya', '3.78', '3.23', '3.11'),
('17140119', 'Sandri Fatmala', '2.12', '2.78', '2.56'),
('17140143', 'Rudi Permana', '2.56', '3.14', '3.22');

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_ipk`
--
DROP TABLE IF EXISTS `nilai_ipk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_ipk`  AS SELECT `nilai_mahasiswa`.`nim` AS `nim`, `nilai_mahasiswa`.`nama` AS `nama`, (`nilai_mahasiswa`.`semester_1` + `nilai_mahasiswa`.`semester_2` + `nilai_mahasiswa`.`semester_3`) / 3 AS `IPK` FROM `nilai_mahasiswa` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_ipk_format`
--
DROP TABLE IF EXISTS `nilai_ipk_format`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_ipk_format`  AS SELECT concat(`nilai_ipk`.`nama`,' ','(',`nilai_ipk`.`IPK`,')') AS `Nama dan IPK` FROM `nilai_ipk` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa_niomic`
--
ALTER TABLE `mahasiswa_niomic`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD PRIMARY KEY (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
