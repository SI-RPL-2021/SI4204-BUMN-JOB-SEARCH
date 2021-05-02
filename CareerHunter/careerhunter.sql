-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 02, 2021 at 05:51 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `careerhuntersql`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `updated_at`, `created_at`) VALUES
(1, 'admin', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lokers`
--

CREATE TABLE `lokers` (
  `id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL DEFAULT 0,
  `posisi` varchar(255) NOT NULL DEFAULT '0',
  `job_desc` text NOT NULL DEFAULT '0',
  `persyaratan` text NOT NULL DEFAULT '0',
  `jenis_pekerjaan` varchar(255) NOT NULL DEFAULT '0',
  `usia_min` int(11) NOT NULL,
  `usia_max` int(11) NOT NULL,
  `gaji_min` int(11) DEFAULT NULL,
  `gaji_max` int(11) DEFAULT NULL,
  `kualifikasi` text NOT NULL,
  `pengalaman_min` int(11) NOT NULL DEFAULT 0,
  `status_loker` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokers`
--

INSERT INTO `lokers` (`id`, `perusahaan_id`, `posisi`, `job_desc`, `persyaratan`, `jenis_pekerjaan`, `usia_min`, `usia_max`, `gaji_min`, `gaji_max`, `kualifikasi`, `pengalaman_min`, `status_loker`, `updated_at`, `created_at`) VALUES
(1, 1, 'developer', 'deskripsi developer', 'ipk minimal 3.0', 'fulltime', 18, 28, NULL, NULL, 'kualifikasi', 0, 'avail', '2021-04-23 19:12:47', '2021-04-23 10:37:39'),
(2, 2, 'sistem analis', 'melakukan analisa sistem', 'minimal ipk 3.0', 'fulltime', 18, 25, 1000000, 9000000, 'kualifikasi sistem analis', 2, 'avail', '2021-04-30 06:58:39', '2021-04-30 06:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_users`
--

CREATE TABLE `perusahaan_users` (
  `id` int(11) NOT NULL,
  `nama_pj` varchar(255) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `no_hp_pj` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `email_perusahaan` varchar(255) DEFAULT NULL,
  `no_perusahaan` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `foto_akta` varchar(255) DEFAULT NULL,
  `status_verifikasi` varchar(255) NOT NULL DEFAULT 'belum',
  `website` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT 'belum',
  `tujuan` text DEFAULT 'belum',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perusahaan_users`
--

INSERT INTO `perusahaan_users` (`id`, `nama_pj`, `foto_profil`, `no_hp_pj`, `nama_perusahaan`, `email_perusahaan`, `no_perusahaan`, `username`, `password`, `kota`, `alamat`, `foto_akta`, `status_verifikasi`, `website`, `deskripsi`, `tujuan`, `updated_at`, `created_at`) VALUES
(1, 'userPerusahaan', '19075_money.png', '087874097687', 'user.perusahaan@gmail.com', 'user.perusahaan@gmail.com', '088888888888', 'userperusahaan', 'password', 'Bandung', 'Bandung', '890399ktm.jpg', 'sudah', NULL, 'belum', 'belum', '2021-04-23 14:18:37', '2021-04-23 10:31:59'),
(2, 'userPerusahaan', '353100_NECIS.png', '087874097687', 'Mo&Ko', 'moandko@gmail.com', '088888888888', 'moandko.official', 'password', 'Bandung', 'Bandung', '10112WhatsApp Image 2021-04-22 at 13.10.13.jpeg', 'sudah', NULL, 'belum', 'belum', '2021-04-30 06:59:20', '2021-04-29 11:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `request_posisi`
--

CREATE TABLE `request_posisi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `loker_id` int(11) NOT NULL DEFAULT 0,
  `status_request` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_posisi`
--

INSERT INTO `request_posisi` (`id`, `user_id`, `loker_id`, `status_request`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 'avail', '2021-04-24 14:21:37', NULL),
(2, 2, 1, 'avail', '2021-04-24 14:27:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kelamin` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `foto_ktp` varchar(255) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `education` text DEFAULT '',
  `tentang` text DEFAULT '',
  `experience` text DEFAULT '',
  `cv` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `portfolio` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `email`, `no_hp`, `password`, `kelamin`, `tanggal_lahir`, `foto_ktp`, `foto_profil`, `education`, `tentang`, `experience`, `cv`, `website`, `portfolio`, `updated_at`, `created_at`) VALUES
(1, 'moandko', 'moandko.official@gmail.com', '087874097687', 'password', 'pria', '1995-02-08', '32168ktm.jpg', NULL, '', '', '', '312060_US_Digital_Civility_Year_5.pdf', 'moandko.com', NULL, '2021-04-30 07:01:55', '2021-04-23 10:30:29'),
(2, 'inzagi', 'inzagi@gmail.com', '087874097687', 'password', 'pria', '1997-02-24', '65999IMG_20210405_0001.jpg', NULL, '', '', '', NULL, NULL, NULL, '2021-04-24 14:04:16', '2021-04-24 14:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokers`
--
ALTER TABLE `lokers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perusahaan_users`
--
ALTER TABLE `perusahaan_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_posisi`
--
ALTER TABLE `request_posisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lokers`
--
ALTER TABLE `lokers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perusahaan_users`
--
ALTER TABLE `perusahaan_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_posisi`
--
ALTER TABLE `request_posisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
