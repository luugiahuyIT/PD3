-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 09, 2022 lúc 03:24 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `books`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add book category', 8, 'add_bookcategory'),
(30, 'Can change book category', 8, 'change_bookcategory'),
(31, 'Can delete book category', 8, 'delete_bookcategory'),
(32, 'Can view book category', 8, 'view_bookcategory'),
(33, 'Can add book', 9, 'add_book'),
(34, 'Can change book', 9, 'change_book'),
(35, 'Can delete book', 9, 'delete_book'),
(36, 'Can view book', 9, 'view_book');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_book`
--

CREATE TABLE `book_book` (
  `id_sach` int(11) NOT NULL,
  `namebook` varchar(500) NOT NULL,
  `author` varchar(225) NOT NULL,
  `categorybook` longtext NOT NULL,
  `pricebook` bigint(20) NOT NULL,
  `status` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `delete_date` datetime(6) NOT NULL,
  `id_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `book_book`
--

INSERT INTO `book_book` (`id_sach`, `namebook`, `author`, `categorybook`, `pricebook`, `status`, `create_date`, `update_date`, `delete_date`, `id_category_id`) VALUES
(4, 'Doraemon', 'AAAAA', 'Truyện Tranh', 12000, '1', '2022-08-09 13:18:31.917614', '2022-08-09 13:18:31.917614', '2022-08-09 13:18:31.917614', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_bookcategory`
--

CREATE TABLE `book_bookcategory` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `book_bookcategory`
--

INSERT INTO `book_bookcategory` (`id_category`, `name_category`) VALUES
(3, 'AAA'),
(4, 'AAA'),
(5, 'Truyen Tranh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(9, 'book', 'book'),
(8, 'book', 'bookcategory'),
(4, 'contenttypes', 'contenttype'),
(7, 'profile', 'userprofile'),
(5, 'sessions', 'session'),
(6, 'user', 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'user', '0001_initial', '2022-08-09 08:42:28.791310'),
(2, 'contenttypes', '0001_initial', '2022-08-09 08:42:28.904278'),
(3, 'admin', '0001_initial', '2022-08-09 08:42:29.212018'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-09 08:42:29.234081'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-09 08:42:29.256167'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-09 08:43:20.145208'),
(7, 'auth', '0001_initial', '2022-08-09 08:43:20.909244'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-08-09 08:43:21.110275'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-08-09 08:43:21.127096'),
(10, 'auth', '0004_alter_user_username_opts', '2022-08-09 08:43:21.151053'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-08-09 08:43:21.170035'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-08-09 08:43:21.178013'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-08-09 08:43:21.197151'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-08-09 08:43:21.217014'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-08-09 08:43:21.235348'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-08-09 08:43:21.330534'),
(17, 'auth', '0011_update_proxy_permissions', '2022-08-09 08:43:21.349267'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-08-09 08:43:21.365911'),
(19, 'book', '0001_initial', '2022-08-09 08:43:21.594256'),
(20, 'book', '0002_auto_20220809_1457', '2022-08-09 08:43:22.310337'),
(21, 'profile', '0001_initial', '2022-08-09 08:43:22.626298'),
(22, 'sessions', '0001_initial', '2022-08-09 08:43:22.819442'),
(23, 'profile', '0002_userprofile_role', '2022-08-09 09:02:11.514070'),
(24, 'profile', '0003_alter_userprofile_role', '2022-08-09 09:16:13.614944');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `id` char(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`password`, `last_login`, `id`, `email`, `is_active`, `is_staff`, `is_superuser`) VALUES
('pbkdf2_sha256$260000$CzuCrUleAq2202DXsQPF3G$pmi1eHqtJYJpTVlpn9qimBFNGLZcjOpAEhIGM3pqdok=', NULL, '1b20f7a849514b12979578bef543d6cb', 'tesasdasdts@gmail.com', 1, 0, 0),
('pbkdf2_sha256$260000$kq3i3vzU33qD8XjxC5a1EX$x+bjeMcI579cd/Zx2ttZMaWW+0dpYEd87g1SO9ngW/g=', NULL, '395993dc81c2498b84d62daa0268eaad', 'tesasdasdt@gmail.com', 1, 0, 0),
('pbkdf2_sha256$260000$FvIyW2nXVT9nVfuZsQSy19$CIrDkKsmpx//qGHlInSlXlnz4bnM5Sp1mjqJfyROS68=', '2022-08-09 08:46:01.420685', '587c20edd7ff4f14abf4cf630185a00e', 'tests@gmail.com', 1, 0, 0),
('pbkdf2_sha256$260000$f7YLxZaH1Ct42oXGvyibdm$3Kugd2O+pRQo5S2mePI6vgZLS0Bf2CMWv5fZtTrs6vg=', NULL, '86d743589739409ba5f7b365add7dc2b', 'admin@gmail.com', 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `id` char(32) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `age` int(10) UNSIGNED NOT NULL CHECK (`age` >= 0),
  `gender` varchar(1) NOT NULL,
  `user_id` char(32) NOT NULL,
  `role` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `phone_number`, `age`, `gender`, `user_id`, `role`) VALUES
('6aefc9b3d6b64e02915fd98ac5cc4176', 'fff', 'lll', '0457655477', 27, 'F', '395993dc81c2498b84d62daa0268eaad', 0),
('a8ee10eeda8e4ba4b2b6dc3e17f387fa', 'fff', 'lll', '0987655477', 27, 'F', '587c20edd7ff4f14abf4cf630185a00e', 1),
('c20c7b866b334bc591ed4f968149197a', 'fff', 'lll', '0387655477', 27, 'F', '1b20f7a849514b12979578bef543d6cb', 1),
('f2d702e7d1304644a69b0d087abcfebe', 'fff', 'lll', '123456', 27, 'F', '86d743589739409ba5f7b365add7dc2b', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `book_book`
--
ALTER TABLE `book_book`
  ADD PRIMARY KEY (`id_sach`),
  ADD KEY `book_book_id_category_id_d3c748e8_fk` (`id_category_id`);

--
-- Chỉ mục cho bảng `book_bookcategory`
--
ALTER TABLE `book_bookcategory`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_login_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `book_book`
--
ALTER TABLE `book_book`
  MODIFY `id_sach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `book_bookcategory`
--
ALTER TABLE `book_bookcategory`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `book_book`
--
ALTER TABLE `book_book`
  ADD CONSTRAINT `book_book_id_category_id_d3c748e8_fk` FOREIGN KEY (`id_category_id`) REFERENCES `book_bookcategory` (`id_category`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_login_id` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`);

--
-- Các ràng buộc cho bảng `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id_2aeb6f6b_fk_login_id` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
