/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE `bigio_school`.`courses`;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`data_rows`;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`data_types`;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`menu_items`;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`menus`;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`settings`;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`students`;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`),
  KEY `students_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `students_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`teachers`;
CREATE TABLE `teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`translations`;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `bigio_school`.`users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `courses` (`id`, `student_id`, `name`, `score`, `created_at`, `updated_at`) VALUES
(1, 3, 'Matematika', 100, '2021-08-29 22:12:33', '2021-08-29 22:12:33');
INSERT INTO `courses` (`id`, `student_id`, `name`, `score`, `created_at`, `updated_at`) VALUES
(2, 2, 'IPA', 90, '2021-08-29 22:12:47', '2021-08-29 22:12:47');


INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'password', 'password', 'Password', 1, 0, 1, 1, 1, 1, '{}', 4),
(26, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(27, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(28, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 5, 'teacher_id', 'text', 'Teacher Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(30, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(31, 5, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(32, 5, 'password', 'password', 'Password', 1, 1, 1, 1, 1, 1, '{}', 5),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(35, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(36, 6, 'student_id', 'hidden', 'Student Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(37, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(38, 6, 'score', 'number', 'Score', 1, 1, 1, 1, 1, 1, '{}', 4),
(39, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(40, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(42, 5, 'student_belongsto_teacher_relationship', 'relationship', 'teachers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Teacher\",\"table\":\"teachers\",\"type\":\"belongsTo\",\"column\":\"teacher_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"courses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(43, 5, 'student_hasmany_course_relationship', 'relationship', 'courses', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Course\",\"table\":\"courses\",\"type\":\"hasMany\",\"column\":\"student_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"courses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(44, 6, 'course_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"student_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"courses\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(45, 4, 'teacher_hasmany_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"hasMany\",\"column\":\"teacher_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"courses\",\"pivot\":\"0\",\"taggable\":null}', 7);

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(4, 'teachers', 'teachers', 'Teacher', 'Teachers', 'voyager-people', 'App\\Models\\Teacher', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-29 16:43:55', '2021-08-29 21:54:27'),
(5, 'students', 'students', 'Student', 'Students', 'voyager-study', 'App\\Models\\Student', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-29 16:44:28', '2021-08-29 22:09:01'),
(6, 'courses', 'courses', 'Course', 'Courses', 'voyager-receipt', 'App\\Models\\Course', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-29 16:44:52', '2021-08-29 16:48:06');



INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-08-29 16:42:32', '2021-08-29 16:42:32', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2021-08-29 16:42:32', '2021-08-29 16:47:39', 'voyager.media.index', NULL);
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 6, '2021-08-29 16:42:32', '2021-08-29 16:47:42', 'voyager.users.index', NULL);
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 5, '2021-08-29 16:42:32', '2021-08-29 16:47:42', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2021-08-29 16:42:32', '2021-08-29 16:47:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-08-29 16:42:32', '2021-08-29 16:47:21', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-08-29 16:42:32', '2021-08-29 16:47:21', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-08-29 16:42:32', '2021-08-29 16:47:21', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-08-29 16:42:32', '2021-08-29 16:47:21', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2021-08-29 16:42:32', '2021-08-29 16:47:39', 'voyager.settings.index', NULL),
(11, 1, 'Teachers', '', '_self', 'voyager-people', '#000000', NULL, 2, '2021-08-29 16:43:55', '2021-08-29 16:47:21', 'voyager.teachers.index', 'null'),
(12, 1, 'Students', '', '_self', 'voyager-study', NULL, NULL, 3, '2021-08-29 16:44:28', '2021-08-29 16:47:39', 'voyager.students.index', NULL),
(13, 1, 'Courses', '', '_self', 'voyager-receipt', '#000000', NULL, 4, '2021-08-29 16:44:53', '2021-08-29 16:47:42', 'voyager.courses.index', 'null');

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-08-29 16:42:32', '2021-08-29 16:42:32');


INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2021_08_29_092403_create_teachers_table', 1),
(26, '2021_08_29_092411_create_students_table', 1),
(27, '2021_08_29_092423_create_courses_table', 1);



INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 3);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 4);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(36, 3),
(36, 4),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3);

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(2, 'browse_bread', NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(3, 'browse_database', NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(4, 'browse_media', NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(5, 'browse_compass', NULL, '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(6, 'browse_menus', 'menus', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(7, 'read_menus', 'menus', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(8, 'edit_menus', 'menus', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(9, 'add_menus', 'menus', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(10, 'delete_menus', 'menus', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(11, 'browse_roles', 'roles', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(12, 'read_roles', 'roles', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(13, 'edit_roles', 'roles', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(14, 'add_roles', 'roles', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(15, 'delete_roles', 'roles', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(16, 'browse_users', 'users', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(17, 'read_users', 'users', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(18, 'edit_users', 'users', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(19, 'add_users', 'users', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(20, 'delete_users', 'users', '2021-08-29 16:42:32', '2021-08-29 16:42:32'),
(21, 'browse_settings', 'settings', '2021-08-29 16:42:33', '2021-08-29 16:42:33'),
(22, 'read_settings', 'settings', '2021-08-29 16:42:33', '2021-08-29 16:42:33'),
(23, 'edit_settings', 'settings', '2021-08-29 16:42:33', '2021-08-29 16:42:33'),
(24, 'add_settings', 'settings', '2021-08-29 16:42:33', '2021-08-29 16:42:33'),
(25, 'delete_settings', 'settings', '2021-08-29 16:42:33', '2021-08-29 16:42:33'),
(26, 'browse_teachers', 'teachers', '2021-08-29 16:43:55', '2021-08-29 16:43:55'),
(27, 'read_teachers', 'teachers', '2021-08-29 16:43:55', '2021-08-29 16:43:55'),
(28, 'edit_teachers', 'teachers', '2021-08-29 16:43:55', '2021-08-29 16:43:55'),
(29, 'add_teachers', 'teachers', '2021-08-29 16:43:55', '2021-08-29 16:43:55'),
(30, 'delete_teachers', 'teachers', '2021-08-29 16:43:55', '2021-08-29 16:43:55'),
(31, 'browse_students', 'students', '2021-08-29 16:44:28', '2021-08-29 16:44:28'),
(32, 'read_students', 'students', '2021-08-29 16:44:28', '2021-08-29 16:44:28'),
(33, 'edit_students', 'students', '2021-08-29 16:44:28', '2021-08-29 16:44:28'),
(34, 'add_students', 'students', '2021-08-29 16:44:28', '2021-08-29 16:44:28'),
(35, 'delete_students', 'students', '2021-08-29 16:44:28', '2021-08-29 16:44:28'),
(36, 'browse_courses', 'courses', '2021-08-29 16:44:53', '2021-08-29 16:44:53'),
(37, 'read_courses', 'courses', '2021-08-29 16:44:53', '2021-08-29 16:44:53'),
(38, 'edit_courses', 'courses', '2021-08-29 16:44:53', '2021-08-29 16:44:53'),
(39, 'add_courses', 'courses', '2021-08-29 16:44:53', '2021-08-29 16:44:53'),
(40, 'delete_courses', 'courses', '2021-08-29 16:44:53', '2021-08-29 16:44:53');



INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-08-29 16:42:32', '2021-08-29 16:42:32');
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(3, 'teacher', 'teacher', '2021-08-29 16:50:04', '2021-08-29 16:50:04');
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(4, 'student', 'student', '2021-08-29 21:47:12', '2021-08-29 21:47:12');

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site');
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site');
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site');
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Bigio School', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome CMS Bigio School', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

INSERT INTO `students` (`id`, `teacher_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 2, 'james', 'james@gmail.com', '$2y$10$c2nIy.AmydiBbefBv6Rta.PoduKGH.nJxKTXu1jbIeZFVMOYmPFpi', '2021-08-29 16:56:00', '2021-08-29 22:11:22');
INSERT INTO `students` (`id`, `teacher_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 2, 'Huge', 'huge@gmail.com', '$2y$10$YBM4kOB.NoNR0ILYX8Zfc.olW4MAjvvAS7DUCJKU1CDkwEQ3PWsBm', '2021-08-29 16:57:15', '2021-08-29 16:57:15');
INSERT INTO `students` (`id`, `teacher_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(3, 1, 'Ray', 'ray@gmail.com', '$2y$10$4EtRpRdjdMhu90KHINU92uYw9xiJheuj6vnOdmsfMECmFazCyiKaW', '2021-08-29 16:57:26', '2021-08-29 16:57:26');

INSERT INTO `teachers` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@gmail.com', '$2y$10$x9.G.d5ZFqHD41ihoJsYYeD4CCJJDFC1coitOxm8dB7RboTOHzIGW', '2021-08-29 16:55:00', '2021-08-29 16:57:41');
INSERT INTO `teachers` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Alvin Lander', 'alvinlander@gmail.com', '$2y$10$FbeCvGATLcq0kOWgLzjQTe4UQn5qkzM0RBmvRe2Z6KBfUJYdqPx6G', '2021-08-29 16:56:00', '2021-08-29 21:20:48');






INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'admin@bigio.test', 'users/default.png', NULL, '$2y$10$EfK0UFJHTnkUnzWRlLCLNeCh15C1l7IWG9TAL/ZQvi68V01A5gsmC', '1TQkUK2u4Tb8XRaKre4lM0Jy5hrN85f5YTvNhyFAr8a6Rw8CT2AS6SM14qrb', NULL, '2021-08-29 16:43:26', '2021-08-29 16:43:26');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(2, 3, 'Alvin Lander', 'alvinlander@gmail.com', 'users/default.png', NULL, '$2y$10$GKm9QyNtwmaS3L24dxMx3eWkFJxanb0YVDUlwIc3utbqBrf/RfiLO', NULL, '{\"locale\":\"en\"}', '2021-08-29 21:48:51', '2021-08-29 21:48:51');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(3, 4, 'ray', 'ray@gmail.com', 'users/default.png', NULL, '$2y$10$tkCggx0ksLC9N19hqHE2.OO6U6GWfSIX2j6n9w8cRsXo1E3Aav1ba', NULL, '{\"locale\":\"en\"}', '2021-08-29 22:10:47', '2021-08-29 22:10:47');
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(4, 4, 'james', 'james@gmail.com', 'users/default.png', NULL, '$2y$10$qqIIppqxqjHWuN690gIWMeeKEnDlFLIijhlnF2lLuN2Ce4WWbu9R.', NULL, '{\"locale\":\"en\"}', '2021-08-29 22:11:05', '2021-08-29 22:11:05'),
(5, 4, 'huge', 'huge@gmail.com', 'users/default.png', NULL, '$2y$10$9OBMSPQ8wqHFQ1Pm53ZU0OWF4Nsf9DnLQp7QLZjXq7lpYwxusgcX.', NULL, '{\"locale\":\"en\"}', '2021-08-29 22:11:39', '2021-08-29 22:11:39'),
(6, 3, 'john doe', 'john.doe@gmail.com', 'users/default.png', NULL, '$2y$10$pJVA1IiIDmwaIhktSRD/MOob7EjLDQTYqtvcWdt84DFobpJ/jUhui', NULL, '{\"locale\":\"en\"}', '2021-08-29 22:12:05', '2021-08-29 22:12:05');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;