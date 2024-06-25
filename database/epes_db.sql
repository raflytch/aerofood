-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2024 pada 19.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epes_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `department_list`
--

CREATE TABLE `department_list` (
  `id` int(30) NOT NULL,
  `department` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `department_list`
--

INSERT INTO `department_list` (`id`, `department`, `description`) VALUES
(3, 'Departemen Keuangan', 'Departemen Keuangan\r\n'),
(4, 'Departemen Sumber Daya Manusia', 'Departemen Sumber Daya Manusia\r\n'),
(5, 'Departemen Operasional', 'Departemen Operasional\r\n'),
(6, 'Departemen Produksi dan Operasi', 'Departemen Produksi dan Operasi\r\n'),
(7, 'Departemen Pemasaran dan Bisnis', 'Departemen Pemasaran dan Bisnis\r\n'),
(8, 'Departemen Logistik', 'Departemen Logistik\r\n'),
(9, 'Departemen Layanan Pelanggan', 'Departemen Layanan Pelanggan\r\n'),
(10, 'Departemen Teknologi Informasi', 'Departemen Teknologi Informasi\r\n'),
(11, 'Departemen Kualitas dan Keamanan Makanan', 'Departemen Kualitas dan Keamanan Makanan\r\n'),
(12, 'Departemen Pengembangan Produk', 'Departemen Pengembangan Produk\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `designation_list`
--

CREATE TABLE `designation_list` (
  `id` int(30) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `designation_list`
--

INSERT INTO `designation_list` (`id`, `designation`, `description`) VALUES
(6, 'Direktur Keuangan', 'Direktur Keuangan\r\n'),
(7, 'Direktur Sumber Daya Manusia', 'Direktur Sumber Daya Manusia\r\n'),
(8, 'Direktur Operasional', 'Direktur Operasional\r\n'),
(9, 'Direktur Produksi dan Operasi', 'Direktur Produksi dan Operasi\r\n'),
(10, 'Direktur Pemasaran dan Bisnis', 'Direktur Pemasaran dan Bisnis\r\n'),
(11, 'Direktur Logistik', 'Direktur Logistik\r\n'),
(12, 'Direktur Layanan Pelanggan', 'Direktur Layanan Pelanggan\r\n'),
(13, 'Direktur Teknologi Informasi', 'Direktur Teknologi Informasi\r\n'),
(14, 'Direktur Kualitas dan Keamanan Makanan', 'Direktur Kualitas dan Keamanan Makanan\r\n'),
(15, 'Direktur Pengembangan Produk', 'Direktur Pengembangan Produk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_list`
--

CREATE TABLE `employee_list` (
  `id` int(30) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `department_id` int(30) NOT NULL,
  `designation_id` int(30) NOT NULL,
  `evaluator_id` int(30) NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employee_list`
--

INSERT INTO `employee_list` (`id`, `employee_id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `department_id`, `designation_id`, `evaluator_id`, `avatar`, `date_created`) VALUES
(3, '', 'Rafly', 'Aziz', 'Abdillah', 'rafly@rafly.com', '7b7225475f74107035cb19b252133294', 1, 1, 2, '1717526820_Vivek_Dhiman_Handsome.jpg', '2024-06-05 01:47:39'),
(4, '', 'Farhana', '', 'Basri', 'farhanah@farhanah.com', '946d949ae6ae1a7dd5bf03866e9d57bc', 1, 3, 2, '1717551180_jennie-kim-blackpink-1_169.jpeg', '2024-06-05 08:33:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `evaluator_list`
--

CREATE TABLE `evaluator_list` (
  `id` int(30) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `evaluator_list`
--

INSERT INTO `evaluator_list` (`id`, `employee_id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(2, '', 'Rafly', 'Aziz', 'Abdillah', 'rafly@rafly.com', '7b7225475f74107035cb19b252133294', '1717556940_Vivek_Dhiman_Handsome.jpg', '2024-06-05 01:45:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `evaluator_id` int(30) NOT NULL,
  `efficiency` int(11) NOT NULL,
  `timeliness` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`id`, `employee_id`, `task_id`, `evaluator_id`, `efficiency`, `timeliness`, `quality`, `accuracy`, `remarks`, `date_created`) VALUES
(2, 1, 1, 1, 5, 4, 5, 5, 'Sample', '2020-12-05 15:18:40'),
(4, 4, 4, 2, 5, 5, 5, 5, 'Sudah Bagus Tolong Ngaduknya Yang Benar', '2024-06-05 08:37:20'),
(5, 3, 3, 2, 5, 5, 5, 5, '', '2024-06-25 23:17:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Sistem Penilaian Karyawan Aerofood ACS', 'info@sample.comm', '+62 896 8498 1540', 'Indonesia', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `employee_id` int(30) NOT NULL,
  `due_date` date NOT NULL,
  `completed` date NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=pending, 1=on-progress,3=Completed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `task_list`
--

INSERT INTO `task_list` (`id`, `task`, `description`, `employee_id`, `due_date`, `completed`, `status`, `date_created`) VALUES
(1, 'Sample Task 1', '																					Sample Only																		', 1, '2020-12-02', '0000-00-00', 2, '2020-12-05 11:06:15'),
(2, 'Sample Task 2', '														&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida, magna eu sagittis venenatis, lorem tellus mollis tellus, viverra facilisis metus odio vel dui. Sed posuere interdum ultrices. Pellentesque blandit enim in condimentum pretium. Suspendisse id tortor sit amet augue rutrum condimentum. Fusce ac mattis purus, eget vehicula sem. Maecenas sit amet orci id lorem tristique tempor. Nullam iaculis quis velit at dapibus. Nullam scelerisque, metus vitae feugiat aliquam, risus turpis pellentesque justo, vitae varius urna leo vitae nisl. Pellentesque viverra ipsum et diam blandit varius. Suspendisse blandit ex vitae hendrerit volutpat. Nulla fermentum dolor at lorem accumsan, nec lacinia mi pellentesque. Mauris ac augue vel elit lobortis maximus.&lt;/span&gt;																									', 1, '2020-12-24', '0000-00-00', 0, '2020-12-05 13:09:05'),
(3, 'Slicing Ui  Ux', '																					Tolong Bro Slicing Ui Ux nya																		', 3, '2024-06-06', '0000-00-00', 2, '2024-06-05 01:48:32'),
(4, 'Tolong Bikin Kopi', '							Tolong Bikin Kopi Ngaduknya Pake', 4, '2024-06-07', '0000-00-00', 2, '2024-06-05 08:35:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_progress`
--

CREATE TABLE `task_progress` (
  `id` int(11) NOT NULL,
  `task_id` int(30) NOT NULL,
  `progress` text NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no,1=Yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `task_progress`
--

INSERT INTO `task_progress` (`id`, `task_id`, `progress`, `is_complete`, `date_created`) VALUES
(1, 1, '&lt;p&gt;Sample Progress&lt;/p&gt;', 0, '2020-12-05 11:29:48'),
(2, 1, '&lt;p&gt;Sample Progress&lt;/p&gt;', 0, '2020-12-05 11:32:15'),
(3, 1, '&lt;p&gt;Sample 2&lt;/p&gt;', 0, '2020-12-05 11:34:18'),
(4, 1, 'asdasd', 0, '2020-12-05 11:34:31'),
(5, 1, '&lt;p&gt;complete&lt;/p&gt;', 1, '2020-12-05 11:54:13'),
(6, 3, '&lt;p&gt;Sudah Selesai Bro&lt;/p&gt;', 1, '2024-06-05 01:51:27'),
(7, 4, '&lt;p&gt;Udah Saya Bikin Kopi&lt;/p&gt;', 1, '2024-06-05 08:36:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', '1607135820_avatar.jpg', '2020-11-26 10:57:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `designation_list`
--
ALTER TABLE `designation_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `employee_list`
--
ALTER TABLE `employee_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `evaluator_list`
--
ALTER TABLE `evaluator_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task_progress`
--
ALTER TABLE `task_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `department_list`
--
ALTER TABLE `department_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `designation_list`
--
ALTER TABLE `designation_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `employee_list`
--
ALTER TABLE `employee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `evaluator_list`
--
ALTER TABLE `evaluator_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `task_progress`
--
ALTER TABLE `task_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
