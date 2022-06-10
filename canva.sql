-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2022 a las 06:14:32
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `canva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binders`
--

CREATE TABLE `binders` (
  `binder_id` int(10) UNSIGNED NOT NULL,
  `binder_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `binder_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `binder_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `binders`
--

INSERT INTO `binders` (`binder_id`, `binder_name`, `binder_date`, `user_id`, `binder_status`, `created_at`, `updated_at`) VALUES
(1, 'Carpeta 1', '2022-06-05', 3, 1, '2022-06-06 03:30:50', '2022-06-06 03:30:50'),
(2, 'Carpeta 2', '2022-06-06', 3, 1, '2022-06-07 02:27:31', '2022-06-07 02:27:31'),
(3, 'Carpeta 3', '2022-06-09', 3, 1, '2022-06-10 03:32:50', '2022-06-10 03:32:50'),
(4, 'Carpeta 4', '2022-06-09', 6, 1, '2022-06-10 03:33:31', '2022-06-10 03:33:31'),
(5, 'Marketing', '2022-06-09', 3, 1, '2022-06-10 03:34:51', '2022-06-10 03:34:51'),
(6, 'Turismo', '2022-06-09', 3, 1, '2022-06-10 03:35:02', '2022-06-10 03:35:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(10) UNSIGNED NOT NULL,
  `categories_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_status`, `created_at`, `updated_at`) VALUES
(1, 'Categoria 1', 1, NULL, NULL),
(2, 'Categoria 2', 1, NULL, NULL),
(3, 'Categoria 3', 1, NULL, NULL),
(4, 'Category-1', 1, '2022-06-03 07:29:03', '2022-06-03 07:29:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files`
--

CREATE TABLE `files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `binder_id` int(11) DEFAULT NULL,
  `file_url` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `file_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `files`
--

INSERT INTO `files` (`file_id`, `binder_id`, `file_url`, `file_date`, `file_status`, `created_at`, `updated_at`) VALUES
(6, 1, 'file-1-c32ac8ed-ea2e-46d7-830c-c96856e01237.jpg', NULL, NULL, '2022-06-06 05:09:09', '2022-06-06 05:09:09'),
(7, 1, 'file-1-7912c14f-7b54-4465-a2da-ea289f027133.png', NULL, NULL, '2022-06-06 05:22:50', '2022-06-06 05:22:50'),
(8, 1, 'file-1-ede809e6-125b-41bd-a4f9-2e560cc1297c.jpg', NULL, NULL, '2022-06-06 05:24:24', '2022-06-06 05:24:24'),
(9, 2, 'file-2-3c588710-7a4a-44e0-a3c0-766adac18a53.jpg', NULL, NULL, '2022-06-07 02:28:35', '2022-06-07 02:28:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_offers`
--

CREATE TABLE `job_offers` (
  `job_offer_id` int(10) UNSIGNED NOT NULL,
  `job_offer_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_offer_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_offer_date` date DEFAULT NULL,
  `job_offer_finished` date DEFAULT NULL,
  `job_offer_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `job_offers`
--

INSERT INTO `job_offers` (`job_offer_id`, `job_offer_name`, `job_offer_description`, `user_id`, `job_offer_date`, `job_offer_finished`, `job_offer_status`, `created_at`, `updated_at`) VALUES
(2, 'Oferta Laboral 1', '<p>¡Porque apostamos por los más jóvenes!</p><p><br></p><p>Empresa Líder en el Ramo de Telecomunicaciones te invita a ingresar al mundo laboral de la mano de los mejores profesionales.</p><p><br></p><p>REQUISITOS:</p><p><br></p><p>• Estudiantes , egresados de la carrera de Ing de telecomunicaciones</p><p><br></p><p>• No es necesario experiencia</p><p><br></p><p>• Actitud para el aprendizaje</p><p><br></p><p>• Disponibilidad para capacitación de una semana</p><p><br></p><p>SE OFRECE:</p><p><br></p><p>• Salario acorde al mercado</p><p><br></p><p>• SCTR y cumplimiento seguro de vida Ley</p><p><br></p><p>• Capacitaciones constantes</p><p><br></p><p>• Excelente clima laboral</p><p><strong>Requerimientos</strong></p><ul><li>Educación mínima: Técnico</li><li>Disponibilidad de viajar: No</li><li>Disponibilidad de cambio de residencia: No</li></ul><p>Hace 15 horas</p>', 6, '2022-06-08', '2022-06-29', 1, '2022-06-08 10:55:01', '2022-06-08 10:55:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membreships`
--

CREATE TABLE `membreships` (
  `membership_id` int(10) UNSIGNED NOT NULL,
  `membership_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_price` decimal(10,2) DEFAULT NULL,
  `membership_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `membreships`
--

INSERT INTO `membreships` (`membership_id`, `membership_name`, `membership_description`, `membership_price`, `membership_status`, `created_at`, `updated_at`) VALUES
(1, 'Membresía 1', '<h3 class=\"ql-align-center\"><strong>Gratis</strong></h3><p class=\"ql-align-center\">Todo lo que necesitas para empezar a diseñar</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p>', '50.00', 1, '2022-06-08 20:18:35', '2022-06-08 20:18:35'),
(2, 'Membresía 1', '<h3 class=\"ql-align-center\"><strong>PRO</strong></h3><p class=\"ql-align-center\">Todo lo que necesitas para empezar a diseñar</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p>', '50.00', 1, '2022-06-08 20:18:47', '2022-06-08 20:18:47'),
(3, 'Membresía 1', '<h3 class=\"ql-align-center\"><strong>PREMIUM</strong></h3><p class=\"ql-align-center\">Todo lo que necesitas para empezar a diseñar</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p><p class=\"ql-align-center\"><span style=\"color: rgb(128, 128, 128);\">&lt;</span><span style=\"color: rgb(86, 156, 214);\">i</span> <span style=\"color: rgb(156, 220, 254);\">class</span>=<span style=\"color: rgb(206, 145, 120);\">\"fa fa-check\"</span><span style=\"color: rgb(128, 128, 128);\">&gt;&lt;/</span><span style=\"color: rgb(86, 156, 214);\">i</span><span style=\"color: rgb(128, 128, 128);\">&gt;</span>Más de 250.000 plantillas gratis</p>', '50.00', 1, '2022-06-08 20:19:18', '2022-06-08 20:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membreship_users`
--

CREATE TABLE `membreship_users` (
  `membership_user_id` int(10) UNSIGNED NOT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `membership_user_date` date DEFAULT NULL,
  `membership_user_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_05_22_031436_create_roles_table', 1),
(5, '2022_05_26_140222_create_categories_table', 1),
(6, '2022_05_31_194654_create_membreships_table', 1),
(7, '2022_05_31_195135_create_membreship_users_table', 1),
(8, '2022_05_31_195616_create_binders_table', 1),
(9, '2022_05_31_195849_create_files_table', 1),
(10, '2022_05_31_202955_create_job_offers_table', 1),
(11, '2022_05_31_203212_create_poll_job_offers_table', 1),
(12, '2022_05_31_203544_create_postulant_job_offers_table', 1),
(13, '2022_05_31_205423_create_response_job_offers_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_job_offers`
--

CREATE TABLE `poll_job_offers` (
  `poll_job_offer_id` int(10) UNSIGNED NOT NULL,
  `poll_job_offer_question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_offer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulant_job_offers`
--

CREATE TABLE `postulant_job_offers` (
  `postulant_job_offer_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_offer_id` int(11) DEFAULT NULL,
  `postulant_job_offer_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `response_job_offers`
--

CREATE TABLE `response_job_offers` (
  `response_job_offer_id` int(10) UNSIGNED NOT NULL,
  `poll_job_offer_response` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poll_job_offer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(10) UNSIGNED NOT NULL,
  `roles_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', NULL, NULL),
(2, 'User', NULL, NULL),
(3, 'Empresa', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_id` int(11) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_id`, `membership_id`, `categories_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@gmail.com', NULL, '$2y$10$l7w.hErOd.RoHiI/4IbP6.sEtkSk9in.10YIuWTGTQ8Q81wsSBOAe', 1, NULL, NULL, 1, NULL, NULL, NULL),
(2, 'Usuario', 'user@gmail.com', NULL, '$2y$10$fObgfV2O2LcXv5JXwlWMiuHMsdYtB41aQZOxmEhK/N7bF3MWclsge', 2, NULL, NULL, 1, NULL, NULL, NULL),
(3, 'Empresa', 'empresa@gmail.com', NULL, '$2y$10$8XVF/voeNy6Edgsnf6U4VOMLF2kDwKtNPxr.71D8js8bWbjCA7ezm', 3, 1, 2, 1, NULL, NULL, NULL),
(4, 'Samuel Leonardo Rivas Rivas', 'rivasrivas506@gmail.com', NULL, '$2y$10$Z/Tdg./LOSDk2edOA95dZOVbMY3Cn1hRyVvI6TrLQFmBFsXUf36ki', 2, NULL, NULL, 1, NULL, '2022-06-06 08:26:50', '2022-06-06 08:26:50'),
(6, 'empresa2@gmail.com', 'empresa2@gmail.com', NULL, '$2y$10$CCzPL/Js/yjCo9AGWt6ua..AwbuOKl/Y271mVFVCC6Tgw.ZN2Ygaa', 3, NULL, NULL, 1, NULL, '2022-06-07 02:37:28', '2022-06-07 02:37:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `binders`
--
ALTER TABLE `binders`
  ADD PRIMARY KEY (`binder_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indices de la tabla `job_offers`
--
ALTER TABLE `job_offers`
  ADD PRIMARY KEY (`job_offer_id`);

--
-- Indices de la tabla `membreships`
--
ALTER TABLE `membreships`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indices de la tabla `membreship_users`
--
ALTER TABLE `membreship_users`
  ADD PRIMARY KEY (`membership_user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `poll_job_offers`
--
ALTER TABLE `poll_job_offers`
  ADD PRIMARY KEY (`poll_job_offer_id`);

--
-- Indices de la tabla `postulant_job_offers`
--
ALTER TABLE `postulant_job_offers`
  ADD PRIMARY KEY (`postulant_job_offer_id`);

--
-- Indices de la tabla `response_job_offers`
--
ALTER TABLE `response_job_offers`
  ADD PRIMARY KEY (`response_job_offer_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `binders`
--
ALTER TABLE `binders`
  MODIFY `binder_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `job_offers`
--
ALTER TABLE `job_offers`
  MODIFY `job_offer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `membreships`
--
ALTER TABLE `membreships`
  MODIFY `membership_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `membreship_users`
--
ALTER TABLE `membreship_users`
  MODIFY `membership_user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `poll_job_offers`
--
ALTER TABLE `poll_job_offers`
  MODIFY `poll_job_offer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postulant_job_offers`
--
ALTER TABLE `postulant_job_offers`
  MODIFY `postulant_job_offer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `response_job_offers`
--
ALTER TABLE `response_job_offers`
  MODIFY `response_job_offer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
