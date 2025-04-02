-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 02 2025 г., 16:13
-- Версия сервера: 10.5.17-MariaDB
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cs2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `knives`
--

CREATE TABLE `knives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rarity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wear` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `knives`
--

INSERT INTO `knives` (`id`, `name`, `skin`, `price`, `rarity`, `pattern`, `wear`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Наваха | Сажа', 'sefwerwe', '345345.00', 'Rare', '345345', 'Field-Tested', 'knives/y9ZN0mqJh6eqzGBlKWtTsNe1NE5lXi8NgKMPCrV4.png', NULL, NULL),
(3, 'Наваха | Пыльник', 'fgbfghdrfg', '456345.00', 'Rare', '345345345', 'Field-Tested', 'knives/KReAb6JaS8cvY0IdMeDbmhVTD7qfOLIWiKo03mq0.png', NULL, NULL),
(4, 'Наваха | Африканская сетка', 'efwef', '324234.00', 'Uncommon', '234234234', 'Minimal Wear', 'knives/iMUwcZlUrh4hrq8r1tnxmMcV9zI86xW4536EfyTw.png', NULL, NULL),
(5, 'Наваха | Пиксельный камуфляж', '345345', '234234.00', 'Rare', '234234', 'Well-Worn', 'knives/y90iWFEZ1LdksMyaMgRx2zhehxMSDFi11jDdAfnl.png', NULL, NULL),
(6, 'Фальшион | Легенды', 'fgfgdfg', '234234.00', 'Epic', '23423423', 'Well-Worn', 'knives/SSaooMVfWTgnp7JD4TjkFHB3cYS6Qa7jwPB4b2Yu.png', NULL, NULL),
(7, 'RRYER', 'RGDFG', '345634.00', 'Epic', '34634636', 'Well-Worn', 'knives/xF2HIVKvn1xH8PIJwPZFupi0K4jRRiKeFHylnXpZ.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `name`, `tr_name`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Жүйеден шықты', 'Çıkış yaptı', 5, 2, '2025-03-31 11:26:11', '2025-03-31 11:26:11'),
(2, 'Жүйеге кірді', 'Giriş yaptı', 1, 3, '2025-03-31 11:26:14', '2025-03-31 11:26:14'),
(3, 'Жүйеден шықты', 'Çıkış yaptı', 5, 3, '2025-03-31 11:26:16', '2025-03-31 11:26:16'),
(4, 'Жүйеге кірді', 'Giriş yaptı', 1, 3, '2025-03-31 12:49:48', '2025-03-31 12:49:48'),
(5, 'Жүйеден шықты', 'Çıkış yaptı', 5, 3, '2025-03-31 12:49:51', '2025-03-31 12:49:51'),
(6, 'Жүйеге кірді', 'Giriş yaptı', 1, 3, '2025-03-31 12:50:00', '2025-03-31 12:50:00'),
(7, 'Жүйеден шықты', 'Çıkış yaptı', 5, 3, '2025-03-31 13:04:33', '2025-03-31 13:04:33'),
(8, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-03-31 13:04:42', '2025-03-31 13:04:42'),
(9, 'Жүйеден шықты', 'Çıkış yaptı', 5, 2, '2025-03-31 13:04:51', '2025-03-31 13:04:51'),
(10, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-03-31 13:05:02', '2025-03-31 13:05:02'),
(11, 'Жүйеге кірді', 'Giriş yaptı', 1, 3, '2025-04-01 09:02:47', '2025-04-01 09:02:47'),
(12, 'Жүйеден шықты', 'Çıkış yaptı', 5, 3, '2025-04-01 09:03:10', '2025-04-01 09:03:10'),
(13, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-01 09:03:21', '2025-04-01 09:03:21'),
(14, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-01 11:42:44', '2025-04-01 11:42:44'),
(15, 'Жүйеден шықты', 'Çıkış yaptı', 5, 2, '2025-04-01 12:30:37', '2025-04-01 12:30:37'),
(16, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-01 12:30:51', '2025-04-01 12:30:51'),
(17, 'Жүйеден шықты', 'Çıkış yaptı', 5, 2, '2025-04-01 13:07:44', '2025-04-01 13:07:44'),
(18, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-01 13:07:45', '2025-04-01 13:07:45'),
(19, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-02 07:48:15', '2025-04-02 07:48:15'),
(20, 'Жүйеден шықты', 'Çıkış yaptı', 5, 2, '2025-04-02 08:26:24', '2025-04-02 08:26:24'),
(21, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-02 08:26:28', '2025-04-02 08:26:28'),
(22, 'Жүйеге кірді', 'Giriş yaptı', 1, 2, '2025-04-02 11:31:12', '2025-04-02 11:31:12');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_18_120706_create_users_table', 1),
(3, '2024_04_18_123553_create_roles_table', 1),
(4, '2024_04_18_153145_create_user_roles_table', 1),
(5, '2024_05_06_145457_create_logs_table', 1),
(6, '2024_05_06_160218_create_site_settings_table', 1),
(7, '2024_12_08_200711_create_music_table', 1),
(8, '2024_12_08_201329_create_albums_table', 1),
(9, '2024_12_08_201547_create_user_music_table', 1),
(10, '2024_12_08_230933_create_user_albums_table', 1),
(11, '2025_03_31_155612_create_knives_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `site_settings`
--

INSERT INTO `site_settings` (`id`, `log_status`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kz'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `second_name`, `surname`, `phone`, `iin`, `email`, `job`, `password`, `real_password`, `is_active`, `lang_code`) VALUES
(2, 'Карина Абдуллаева', 'Карина', 'Абдуллаева', '87001418004', '040210600375', 'nekrasova11b04@gmail.com', 'софтваре', '$2y$10$4W6vc.ZdE/1oj5TbgAzQMe7uDR0WEL.06OUm6wcNJyurT..mom3ae', '123', 1, 'kz'),
(3, 'Test', 'Test', 'Test', '87001418004', '040210600375', 'test@gmail.com', 'софтваре', '$2y$10$4W6vc.ZdE/1oj5TbgAzQMe7uDR0WEL.06OUm6wcNJyurT..mom3ae', '123', 1, 'kz');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`) VALUES
(1, 2, 2),
(3, 1, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `knives`
--
ALTER TABLE `knives`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `knives`
--
ALTER TABLE `knives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
