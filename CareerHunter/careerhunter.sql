-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table careerhuntersql.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table careerhuntersql.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `updated_at`, `created_at`) VALUES
	(1, 'admin', 'admin', NULL, NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table careerhuntersql.lokers
CREATE TABLE IF NOT EXISTS `lokers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table careerhuntersql.lokers: ~0 rows (approximately)
/*!40000 ALTER TABLE `lokers` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokers` ENABLE KEYS */;

-- Dumping structure for table careerhuntersql.perusahaan_users
CREATE TABLE IF NOT EXISTS `perusahaan_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table careerhuntersql.perusahaan_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `perusahaan_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `perusahaan_users` ENABLE KEYS */;

-- Dumping structure for table careerhuntersql.request_posisi
CREATE TABLE IF NOT EXISTS `request_posisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `loker_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table careerhuntersql.request_posisi: ~0 rows (approximately)
/*!40000 ALTER TABLE `request_posisi` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_posisi` ENABLE KEYS */;

-- Dumping structure for table careerhuntersql.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table careerhuntersql.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
