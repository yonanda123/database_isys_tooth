-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 07.40
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pakar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `indications`
--

CREATE TABLE `indications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_indication` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indication` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `indications`
--

INSERT INTO `indications` (`id`, `code_indication`, `indication`, `created_at`, `updated_at`) VALUES
(6, 'IDC-0000', 'Terasa tidak nyaman dimulut', '2023-04-08 12:36:10', '2023-04-08 12:36:10'),
(7, 'IDC-0001', 'Bengkak di gusi sekitar gigi yang sakit', '2023-04-08 13:45:25', '2023-04-08 13:45:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `medicine_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicine_information` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `medicines`
--

INSERT INTO `medicines` (`id`, `medicine_name`, `medicine_information`, `created_at`, `updated_at`) VALUES
(1, 'Albotil', 'sariawan', '2023-04-04 19:22:19', '2023-04-04 19:22:19'),
(2, 'asdd', 'asdd', '2023-04-08 11:24:38', '2023-04-08 11:24:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_03_25_021326_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 2),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2019_08_19_000000_create_failed_jobs_table', 2),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(6, '2023_04_01_063130_create_articles_table', 2),
(7, '2023_04_01_155941_create_medicines_table', 2),
(8, '2023_04_03_174154_create_sicknesses_table', 2),
(9, '2023_04_04_011702_create_indications_table', 2),
(10, '2023_04_04_012055_create_regulations_table', 2),
(11, '2023_04_04_012438_create_results_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `regulations`
--

CREATE TABLE `regulations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sickness_id` bigint(20) UNSIGNED NOT NULL,
  `indication_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `regulations`
--

INSERT INTO `regulations` (`id`, `sickness_id`, `indication_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2023-04-10 08:41:09', '2023-04-10 08:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL,
  `indication_id` bigint(20) UNSIGNED NOT NULL,
  `sickness_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-04-04 08:41:53', '2023-04-04 08:41:53'),
(2, 'Dokter', '2023-04-04 08:41:53', '2023-04-04 08:41:53'),
(3, 'User', '2023-04-04 08:41:53', '2023-04-04 08:41:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sicknesses`
--

CREATE TABLE `sicknesses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sickness_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sickness_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sickness_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sickness_solution` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sicknesses`
--

INSERT INTO `sicknesses` (`id`, `sickness_name`, `sickness_image`, `sickness_description`, `sickness_solution`, `medicine_id`, `created_at`, `updated_at`) VALUES
(1, 'sariawan', '230408013346.Pengertian Analisis Data.jpg', '<p><strong>Sariawan atau <em>s</em></strong><strong><em>tomatitis aphtosa</em></strong><strong>&nbsp;adalah luka atau peradangan di bibir dan di dalam mulut. Luka ini dapat menimbulkan rasa sakit dan tidak nyaman.&nbsp;</strong><strong>Meski sering dianggap sepele, sariawan dapat terasa mengganggu saat penderitanya sedang makan, minum, atau bicara.&nbsp;</strong></p>\r\n<p>Meski bentuknya serupa, sariawan dan&nbsp;<a href=\"https://www.alodokter.com/mengenali-herpes-di-bibir-dan-mulut-dan-cara-mengatasinya\" target=\"_blank\" rel=\"noopener\">herpes oral</a>&nbsp;merupakan kondisi yang berbeda. Herpes oral umumnya terdapat di permukaan bibir, sedangkan sariawan terdapat di dalam mulut. Selain itu, herpes oral dapat menular dengan mudah, sedangkan sariawan biasanya tidak menular.</p>', '<h3><strong>Pengobatan dan Pencegahan Sariawan</strong></h3>\r\n<p>Umumnya, sariawan tidak perlu diobati dan akan sembuh dengan sendirinya dalam 1&ndash;2 minggu. Pasien bisa melakukan penanganan secara mandiri di rumah untuk meredakan nyeri, misalnya dengan mengompres bagian yang terasa sakit dengan es batu.</p>\r\n<p>Jika sariawan tidak juga membaik, pasien dianjurkan untuk melakukan pemeriksaan ke dokter, agar mendapatkan pengobatan yang sesuai dengan penyebab sariawan yang dialami.</p>\r\n<p>Agar sariawan tidak muncul kembali, ada beberapa cara yang dapat dilakukan untuk mencegahnya, yaitu:</p>\r\n<ul>\r\n<li>Menjaga kesehatan gigi dan mulut</li>\r\n<li>Menyikat gigi secara teratur dan benar</li>\r\n<li>Memeriksakan gigi dan mulut secara rutin</li>\r\n<li>Mengonsumsi&nbsp;<span style=\"color: rgb(0, 0, 0);\"><a style=\"color: rgb(0, 0, 0); text-decoration: underline;\" href=\"https://www.alodokter.com/memenuhi-gizi-seimbang-dengan-panduan-piring-makan\" target=\"_blank\" rel=\"noopener\">makanan bergizi seimbang</a></span></li>\r\n</ul>', 1, '2023-04-04 19:41:16', '2023-04-08 06:42:47'),
(4, 'asd', '230414011116.jpg', '<p>asd</p>', '<p>asd</p>', 1, '2023-04-13 18:11:16', '2023-04-13 18:11:16'),
(5, 'asd', '230414011117.jpg', '<p>asd</p>', '<p>asd</p>', 1, '2023-04-13 18:11:17', '2023-04-13 18:11:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `address`, `phone`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'default.png', '', '', '$2y$10$ExBNlRtzJuBhNyQpERUxTeFynbs80Eo3sRHanEN7ou97DbfGTnxOa', 1, NULL, NULL),
(2, 'doctor', 'doctor@gmail.com', 'default.png', '', '', '$2y$10$rEkkF7/uP.5d3/cs3j92CuW2jMx1.m986Qm3dXdms2HXthUnQkgba', 2, NULL, NULL),
(3, 'user', 'user@gmail.com', 'default.png', 'empty', 'empty', '$2y$10$Mov93c3uEdwjhfeUAsGrZ.2Nz2P/OPDoAVEH40q2sZBQKJ0Vwh0sS', 3, '2023-04-04 08:51:21', '2023-04-04 08:51:21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `indications`
--
ALTER TABLE `indications`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `regulations`
--
ALTER TABLE `regulations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regulations_sickness_id_foreign` (`sickness_id`),
  ADD KEY `regulations_indication_id_foreign` (`indication_id`);

--
-- Indeks untuk tabel `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_indication_id_foreign` (`indication_id`),
  ADD KEY `results_sickness_id_foreign` (`sickness_id`),
  ADD KEY `results_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sicknesses`
--
ALTER TABLE `sicknesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sicknesses_medicine_id_foreign` (`medicine_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `indications`
--
ALTER TABLE `indications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `regulations`
--
ALTER TABLE `regulations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sicknesses`
--
ALTER TABLE `sicknesses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `regulations`
--
ALTER TABLE `regulations`
  ADD CONSTRAINT `regulations_indication_id_foreign` FOREIGN KEY (`indication_id`) REFERENCES `indications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `regulations_sickness_id_foreign` FOREIGN KEY (`sickness_id`) REFERENCES `sicknesses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_indication_id_foreign` FOREIGN KEY (`indication_id`) REFERENCES `indications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_sickness_id_foreign` FOREIGN KEY (`sickness_id`) REFERENCES `sicknesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sicknesses`
--
ALTER TABLE `sicknesses`
  ADD CONSTRAINT `sicknesses_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
