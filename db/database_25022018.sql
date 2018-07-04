-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2018 a las 22:35:49
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_app_config`
--

CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', 'Lima - Perú'),
('company', 'Sistema de Ventas'),
('currency_side', '0'),
('currency_symbol', 'S/.'),
('custom10_name', ''),
('custom1_name', ''),
('custom2_name', ''),
('custom3_name', ''),
('custom4_name', ''),
('custom5_name', ''),
('custom6_name', ''),
('custom7_name', ''),
('custom8_name', ''),
('custom9_name', ''),
('default_tax_1_name', 'Impuesto de Ventas 1'),
('default_tax_1_rate', ''),
('default_tax_2_name', 'Impuesto de Ventas 2'),
('default_tax_2_rate', ''),
('default_tax_rate', '8'),
('email', 'admin@pappastech.com'),
('fax', '123'),
('language', 'es'),
('phone', '555-555-5555'),
('print_after_sale', '0'),
('return_policy', 'Test'),
('timezone', 'America/Bogota'),
('website', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_customers`
--

CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_customers`
--

INSERT INTO `ospos_customers` (`person_id`, `account_number`, `taxable`, `deleted`, `data`) VALUES
(2, NULL, 1, 1, NULL),
(12345678, NULL, 1, 1, NULL),
(87654321, NULL, 1, 0, NULL),
(43215678, NULL, 1, 1, NULL),
(87654346, NULL, 0, 1, NULL),
(48227010, NULL, 1, 0, NULL),
(48227019, NULL, 1, 0, NULL),
(48227020, NULL, 1, 0, NULL),
(2147483647, NULL, 1, 0, '[{"idObj":"text_6","id":"text_6","value":"12123343444","name":"Pasaporte","type":"text","parent":"text_6"},{"idObj":"date_5","id":"date_5","value":"2019-12-01","name":"Fecha Expiración","type":"date","parent":"date_5"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_design`
--

CREATE TABLE IF NOT EXISTS `ospos_design` (
`id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ospos_design`
--

INSERT INTO `ospos_design` (`id`, `name`, `description`, `price`, `state`, `created_at`, `stock`) VALUES
(1, 'prueba', 'prueba', '223.50', 1, '2017-06-18', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_employees`
--

CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', '81dc9bdb52d04dc20036dbd8313ed055', 1, 0),
('johanC', 'e10adc3949ba59abbe56e057f20f883e', 87654324, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_gallery`
--

CREATE TABLE IF NOT EXISTS `ospos_gallery` (
  `gallery_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ospos_gallery';

--
-- Volcado de datos para la tabla `ospos_gallery`
--

INSERT INTO `ospos_gallery` (`gallery_id`, `title`, `url`, `status`) VALUES
(NULL, NULL, '', 1),
(NULL, NULL, '', 1),
(NULL, NULL, '', 1),
(NULL, NULL, '', 1),
(NULL, NULL, '', 1),
(NULL, NULL, '', 1),
(NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_giftcards`
--

CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
`giftcard_id` int(11) NOT NULL,
  `giftcard_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_inventory`
--

CREATE TABLE IF NOT EXISTS `ospos_inventory` (
`trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Volcado de datos para la tabla `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_inventory`) VALUES
(1, 1, 1, '2014-08-15 00:45:13', 'Edición Manual de Cantidad', 10),
(2, 1, 1, '2014-08-15 00:46:08', 'POS 1', -1),
(3, 2, 1, '2014-08-15 14:50:24', 'Qty CSV Imported', 10),
(4, 3, 1, '2014-08-15 14:50:24', 'Qty CSV Imported', 10),
(5, 4, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(6, 5, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(7, 6, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(8, 7, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(9, 8, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(10, 9, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(11, 10, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(12, 11, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(13, 12, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(14, 13, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(15, 14, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(16, 15, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(17, 16, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(18, 17, 1, '2014-08-15 14:50:25', 'Qty CSV Imported', 10),
(19, 18, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(20, 19, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(21, 20, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(22, 21, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(23, 22, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(24, 23, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(25, 24, 1, '2014-08-15 14:50:26', 'Qty CSV Imported', 10),
(26, 3, 1, '2014-08-15 14:52:34', 'POS 2', -5),
(27, 7, 1, '2014-08-15 14:52:34', 'POS 2', -1),
(28, 1, 1, '2014-08-18 14:08:16', 'Edición Manual de Cantidad', -7),
(29, 1, 1, '2014-08-18 14:08:44', 'Edición Manual de Cantidad', 8),
(30, 1, 1, '2014-08-18 14:09:08', 'Edición Manual de Cantidad', -5),
(31, 25, 1, '2014-08-18 14:13:25', 'Qty CSV Imported', 10),
(32, 26, 1, '2014-08-18 14:13:25', 'Qty CSV Imported', 10),
(33, 27, 1, '2014-08-18 14:13:25', 'Qty CSV Imported', 10),
(34, 28, 1, '2014-08-18 14:13:25', 'Qty CSV Imported', 10),
(35, 29, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(36, 30, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(37, 31, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(38, 32, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(39, 33, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(40, 34, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(41, 35, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(42, 36, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(43, 37, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(44, 38, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(45, 39, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(46, 40, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(47, 41, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(48, 42, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(49, 43, 1, '2014-08-18 14:13:26', 'Qty CSV Imported', 10),
(50, 25, 1, '2014-08-18 14:14:53', 'Edición Manual de Cantidad', 0),
(51, 25, 1, '2014-08-18 14:15:14', 'Edición Manual de Cantidad', -9),
(52, 3, 1, '2014-08-18 14:22:57', 'POS 3', -5),
(53, 8, 1, '2014-08-18 14:22:57', 'POS 3', -2),
(54, 29, 1, '2014-08-18 14:23:40', 'POS 4', -1),
(55, 33, 1, '2014-08-18 14:24:31', 'POS 5', -1),
(56, 26, 1, '2014-08-18 14:27:46', 'POS 6', -1),
(57, 32, 1, '2014-08-18 14:27:46', 'POS 6', -2),
(58, 30, 1, '2014-08-18 14:33:14', 'POS 7', -1),
(59, 28, 1, '2014-12-04 13:45:07', 'POS 8', -1),
(60, 25, 1, '2016-07-29 17:29:14', 'Edición Manual de Cantidad', 0),
(61, 26, 1, '2016-07-29 17:36:20', 'Edición Manual de Cantidad', 0),
(62, 25, 1, '2016-07-29 19:42:01', 'Edición Manual de Cantidad', 0),
(63, 44, 1, '2016-07-29 19:43:48', 'Edición Manual de Cantidad', 10),
(64, 45, 1, '2016-07-29 19:44:28', 'Edición Manual de Cantidad', 20),
(65, 44, 1, '2016-07-29 19:55:11', 'RECV 1', 20),
(66, 44, 1, '2016-07-29 19:56:52', 'POS 9', -3),
(67, 44, 87654324, '2017-01-08 20:49:35', 'Error de inventario', 20),
(68, 44, 87654324, '2017-01-08 20:49:39', 'Error de inventario', 20),
(69, 44, 87654324, '2017-01-08 20:49:58', 'Error', -20),
(70, 44, 87654324, '2017-01-08 20:50:14', 'Error', -20),
(71, 44, 87654324, '2017-01-08 21:04:14', 'Error', 1),
(72, 44, 87654324, '2017-01-08 21:04:22', 'Edición Manual de Cantidad', 0),
(73, 46, 1, '2017-01-18 03:21:38', 'Edición Manual de Cantidad', 50),
(74, 46, 1, '2017-01-18 03:23:08', 'Edición Manual de Cantidad', 0),
(75, 27, 1, '2017-02-02 15:12:50', 'POS 10', -1),
(76, 47, 1, '2017-04-13 21:19:34', 'Edición Manual de Cantidad', 12),
(77, 48, 1, '2017-04-13 22:04:36', 'Edición Manual de Cantidad', 12),
(78, 49, 1, '2017-04-13 22:12:16', 'Edición Manual de Cantidad', 23),
(79, 50, 1, '2017-04-13 22:22:40', 'Edición Manual de Cantidad', 23),
(80, 50, 1, '2017-04-13 22:28:30', 'POS 11', -2),
(81, 49, 1, '2017-04-13 22:30:35', 'POS 12', -1),
(82, 46, 1, '2017-04-14 22:18:33', '', 0),
(83, 29, 1, '2017-04-14 22:18:42', '', 0),
(84, 27, 1, '2017-04-14 22:22:18', 'ASSSSSSSSSSSSSSS', 23),
(85, 47, 1, '2017-04-14 22:23:47', 'ssssssssssssss', 343),
(86, 27, 1, '2017-04-14 22:24:46', 'SAAAAAAAAA', 23),
(87, 46, 1, '2017-04-14 22:25:06', 'ASSSSSS', 20),
(88, 46, 1, '2017-04-14 22:26:27', '2', 2),
(89, 46, 1, '2017-04-14 22:28:56', '2', 2),
(90, 46, 1, '2017-04-14 22:29:25', '2', 2),
(91, 51, 1, '2017-04-14 22:40:26', 'Edición Manual de Cantidad', 23),
(92, 52, 1, '2017-04-14 22:42:09', 'Edición Manual de Cantidad', 23),
(93, 46, 1, '2017-04-14 22:46:54', 'Edición Manual de Cantidad', 0),
(94, 28, 1, '2017-04-14 22:48:19', 'Edición Manual de Cantidad', 0),
(95, 54, 1, '2017-08-19 18:39:34', 'Edición Manual de Cantidad', 12),
(96, 57, 1, '2017-08-19 18:43:17', 'Edición Manual de Cantidad', 12),
(97, 60, 1, '2017-08-19 18:51:29', 'Edición Manual de Cantidad', 23),
(98, 48, 1, '2017-08-19 18:56:33', 'RECV 2', 12),
(99, 51, 87654324, '2017-08-19 21:58:55', 'Edición Manual de Cantidad', 0),
(100, 61, 1, '2018-01-25 04:31:24', 'Edición Manual de Cantidad', 12),
(101, 61, 1, '2018-01-25 04:51:00', 'Edición Manual de Cantidad', 0),
(102, 62, 1, '2018-02-12 01:16:47', 'Edición Manual de Cantidad', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_items`
--

CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT '0.00',
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `location` varchar(255) DEFAULT NULL,
`item_id` int(10) NOT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL,
  `data_items` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Volcado de datos para la tabla `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `quantity`, `reorder_level`, `location`, `item_id`, `allow_alt_description`, `is_serialized`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`, `data_items`) VALUES
('Articulo 01', 'Golosinas', NULL, NULL, '', '20.00', '20.00', '5.00', '2.00', '', 1, 0, 0, 1, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Producto 01', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 2, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 02', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '0.00', '0.00', '', 3, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 03', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 4, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 04', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 5, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 05', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 6, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 06', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '9.00', '0.00', '', 7, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 07', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '8.00', '0.00', '', 8, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 08', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 9, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 09', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 10, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 10', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 11, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 11', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 12, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 12', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 13, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 13', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 14, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 14', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 15, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 15', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 16, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 16', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 17, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 17', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 18, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 18', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 19, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 19', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 20, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 20', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 21, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 21', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 22, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 22', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 23, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 23', 'Golosinas', NULL, NULL, '', '10.00', '12.00', '10.00', '0.00', '', 24, 0, 0, 1, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto_01', 'Golosinas', NULL, 'Producto_01', 'Producto_01', '10.00', '12.00', '1.00', '2.00', '2', 25, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Producto_02', 'Golosinas', NULL, 'Producto_02', 'Producto_02', '10.00', '12.00', '9.00', '2.00', 'Producto_02', 26, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Producto 03', 'Golosinas', NULL, 'p-003', '', '10.00', '12.00', '55.00', '2.00', '', 27, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 04', 'Golosinas', 87654323, 'p-004', 'ASSSSSSSSSSS', '10.00', '12.00', '9.00', '2.00', '3', 28, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Producto 05', 'Golosinas', NULL, 'p-005', '', '10.00', '12.00', '9.00', '2.00', '', 29, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 06', 'Golosinas', NULL, 'p-006', '', '10.00', '12.00', '9.00', '2.00', '', 30, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 07', 'Golosinas', NULL, 'p-007', '', '10.00', '12.00', '10.00', '2.00', '', 31, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 08', 'Golosinas', NULL, 'p-008', '', '10.00', '12.00', '8.00', '2.00', '', 32, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 09', 'Golosinas', NULL, 'p-009', '', '10.00', '12.00', '9.00', '2.00', '', 33, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 10', 'Golosinas', NULL, 'p-010', '', '10.00', '12.00', '10.00', '2.00', '', 34, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 11', 'Golosinas', NULL, 'p-011', '', '10.00', '12.00', '10.00', '2.00', '', 35, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 12', 'Golosinas', NULL, 'p-012', '', '10.00', '12.00', '10.00', '2.00', '', 36, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 13', 'Golosinas', NULL, 'p-013', '', '10.00', '12.00', '10.00', '2.00', '', 37, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 14', 'Golosinas', NULL, 'p-014', '', '10.00', '12.00', '10.00', '2.00', '', 38, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 15', 'Golosinas', NULL, 'p-015', '', '10.00', '12.00', '10.00', '2.00', '', 39, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 16', 'Golosinas', NULL, 'p-016', '', '10.00', '12.00', '10.00', '2.00', '', 40, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 17', 'Golosinas', NULL, 'p-017', '', '10.00', '12.00', '10.00', '2.00', '', 41, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 18', 'Golosinas', NULL, 'p-018', '', '10.00', '12.00', '10.00', '2.00', '', 42, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('Producto 19', 'Golosinas', NULL, 'p-019', '', '10.00', '12.00', '10.00', '2.00', '', 43, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', NULL),
('CARTELES', 'CARTELES', NULL, 'CARTELES', 'CARTELES', '200.00', '250.00', '28.00', '2.00', '3', 44, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('PRUEBA', 'PRUEBA', NULL, 'PRUEBA', 'PRUEBA', '10.00', '15.00', '20.00', '2.00', '1', 45, 0, 0, 1, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('PAPELES LA ROSA', 'CARTELES', 87654323, '23', 'Papeles la Rosa', '23.00', '0.50', '76.00', '10.00', '3', 46, 1, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('ASASA', 'ZAPATILLAS', 87654322, 'QWQW', 'ZAPATILLAS JANOSKI', '12.00', '12.00', '355.00', '23.00', '3', 47, 1, 1, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('ZAPATILLAS NIKE', 'ZAPATILLAS', 87654322, 'ZAP-NIKE', 'asaas', '23.00', '250.00', '24.00', '121.00', 'asasa', 48, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('DC WES KREMER', 'ZAPATILLAS', 87654322, 'ZAP-DC', 'aaaaaaaaaaa', '200.00', '250.00', '22.00', '2.00', '3', 49, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('CONVERSE', 'ZAPATILLAS', 87654322, 'ZAP-CONVERSE', 'qqqqqqqqqqqq', '200.00', '250.00', '21.00', '2.00', '2', 50, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('AAAAAAAAAAAA', 'ZAPATILLAS', 87654322, 'p-0001221', 'ASSSSSSS', '200.00', '250.00', '23.00', '2.00', '3', 51, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('AQUI NOMAS', 'ZAPATILLAS', 87654322, 'P-002323332', 'AQUI NOMAS', '200.00', '250.00', '23.00', '2.00', '3', 52, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Carteras', 'accesorios', 87654322, '123456789', 'CARTERA DE MESA', '200.00', '250.00', '12.00', '2.00', '3', 54, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('Carteras', 'accesorios', 87654322, '1234567891234567', 'CARTERA DE MESA', '200.00', '250.00', '12.00', '2.00', '3', 57, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('DC WES KREMER', 'ZAPATILLAS', 87654323, NULL, '1111111111111111111111111111', '200.00', '250.00', '23.00', '2.00', '3', 60, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL),
('LAPICES', 'LAPICES', NULL, '123455555', 'LAPICES', '23.00', '25.00', '12.00', '10.00', 'LAPICES', 61, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '[{"idObj":"cbo_property_1","id":"3","name":"pijama 2","type":"select","parent":1}]'),
('TEST_ITEM', 'CARTELES', NULL, '12345678', 'TEST_ITEM', '12.00', '12.00', '12.00', '12.00', 'TEST_ITEM', 62, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '[{"idObj":"cbo_property_1","id":"2","name":"Talla S","type":"select","parent":1}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_items_gallery`
--

CREATE TABLE IF NOT EXISTS `ospos_items_gallery` (
  `item_id` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `creafecha` datetime DEFAULT NULL,
  `creapor` varchar(20) DEFAULT NULL,
  `modifecha` datetime DEFAULT NULL,
  `modipor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ospos_items_gallery';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_items_taxes`
--

INSERT INTO `ospos_items_taxes` (`item_id`, `name`, `percent`) VALUES
(25, 'Impuesto de Ventas 1', '0.00'),
(25, 'Impuesto de Ventas 2', '0.00'),
(26, 'Impuesto de Ventas 1', '0.00'),
(26, 'Impuesto de Ventas 2', '0.00'),
(28, 'Impuesto de Ventas 1', '0.00'),
(28, 'Impuesto de Ventas 2', '0.00'),
(44, 'Impuesto de Ventas 1', '0.00'),
(44, 'Impuesto de Ventas 2', '0.00'),
(45, 'Impuesto de Ventas 1', '0.00'),
(45, 'Impuesto de Ventas 2', '0.00'),
(46, 'Impuesto de Ventas 1', '0.00'),
(46, 'Impuesto de Ventas 2', '0.00'),
(47, 'Impuesto de Ventas 1', '1.00'),
(47, 'Impuesto de Ventas 2', '2.00'),
(48, 'Impuesto de Ventas 1', '0.00'),
(48, 'Impuesto de Ventas 2', '0.00'),
(49, 'Impuesto de Ventas 1', '0.00'),
(49, 'Impuesto de Ventas 2', '0.00'),
(50, 'Impuesto de Ventas 1', '0.00'),
(50, 'Impuesto de Ventas 2', '0.00'),
(52, 'Impuesto de Ventas 1', '0.00'),
(52, 'Impuesto de Ventas 2', '0.00'),
(62, 'Impuesto de Ventas 1', '12.00'),
(62, 'Impuesto de Ventas 2', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_item_kits`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
`item_kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `ospos_item_kits`
--

INSERT INTO `ospos_item_kits` (`item_kit_id`, `name`, `description`) VALUES
(1, 'ZAPATILLAs', 'PROMOCIÓN DE ZAPATILLAS'),
(2, 'CARTELES', 'CARTELES'),
(5, 'CONVERSE', 'CONVERSE'),
(6, 'PAPELES DE MUESTRA', 'PAPELES DE MUESTRA'),
(7, 'CONVERSE', 'sdddddddddddd'),
(13, 'WES KREMER', 'WES KREMER'),
(16, 'ZAPATILLAS CONVERSE', 'ZAPATILLAS CONVERSE'),
(17, 'DULCES DE MESA', 'DULCES DE MESA'),
(18, 'DULCES DE MESA', 'DULCES DE MESA'),
(29, 'ZAPATILLAS', 'PROMOCION DE ZAPATILLAS'),
(30, 'sdasas', 'qeqqqqqe'),
(31, 'bbb', 'bbbbbbb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_item_kit_items`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_item_kit_items`
--

INSERT INTO `ospos_item_kit_items` (`item_kit_id`, `item_id`, `quantity`) VALUES
(17, 29, '1.00'),
(18, 29, '1.00'),
(16, 30, '1.00'),
(17, 30, '1.00'),
(18, 30, '1.00'),
(2, 44, '1.00'),
(6, 46, '1.00'),
(29, 48, '1.00'),
(1, 49, '25.00'),
(13, 49, '1.00'),
(29, 49, '1.00'),
(1, 50, '25.00'),
(5, 50, '2.00'),
(7, 50, '1.00'),
(29, 50, '1.00'),
(30, 51, '1.00'),
(31, 52, '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_modules`
--

CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `decription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`, `name`, `decription`) VALUES
('module_config', 'module_config_desc', 100, 'config', 'Configuración', 'Cambiar la configuración de la tienda'),
('module_customers', 'module_customers_desc', 10, 'customers', 'Clientes', 'Agregar, Actualizar, Borrar y Buscar clientes'),
('module_design', 'module_design_desc', 110, 'designs', 'Diseño', 'Agregar, Actualizar diseños'),
('module_employees', 'module_employees_desc', 80, 'employees', 'Empleados', 'Agregar, Actualizar, Borrar y Buscar empleados'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards', 'Tarjetas de Regalo', 'Agregar, Actualizar, Borrar y Buscar Tarjetas de Regalo'),
('module_items', 'module_items_desc', 20, 'items', 'Artículos', 'Agregar, Actualizar, Borrar y Buscar artículos'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits', 'Kits de Artículos', 'Agregar, Actualizar, Borrar y Buscar Kits de Artículos'),
('module_receivings', 'module_receivings_desc', 60, 'receivings', 'Compras', 'Procesar órdenes de compra'),
('module_reports', 'module_reports_desc', 50, 'reports', 'Reportes', 'Ver y generar reportes'),
('module_sales', 'module_sales_desc', 70, 'sales', 'Ventas', 'Procesar ventas y devoluciones'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers', 'Proveedores', 'Agregar, Actualizar, Borrar y Buscar proveedores'),
('module_travel', 'module_travel_desc', 120, 'travel', 'Viajes', 'Generar Viajes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_people`
--

CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `comments` text,
`person_id` int(10) NOT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2147483647 ;

--
-- Volcado de datos para la tabla `ospos_people`
--

INSERT INTO `ospos_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`, `birthdate`) VALUES
('Julio Cesar', 'Llavilla', '943973537', 'llavillaccama@gmail.com', 'Lima - Peru', '', '', '', '01', '', '', 1, NULL),
('', '', '', '', '', '', '', '', '', '', '', 2, NULL),
('JOHAN ANTONIO', 'CAÑARI HUAMANI', '5709327', 'johins2x@gmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', 'PERU', 'NUEVO CLIENTE', 12345678, NULL),
('BORRAR', 'BORRAR', '1234567', 'BORRAR', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', 'PERU', 'NUEVO CLIENTE', 43215678, NULL),
('aadsasddas', 'sddsdads', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', '', '', '', '', '', '', 48227010, NULL),
('Johan Antonio', 'Cañari Huamani', '', 'johanc.cca@gmail.com', '', '', '', '', '01', '', '', 48227019, NULL),
('JUAN CARLOS', 'REYES REYES', '', 'pelotero_tz89@hotmail.com', '', '', '', '', '01', '', '', 48227020, NULL),
('JOEL YENER', 'ESPINOZA HUAMANI', '1234567', 'canari_343@hotmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', '', '', 'PERU', 'NUEVO CLIENTE', 87654321, NULL),
('JOHAN ANTONIO', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', 'PERU', 'NUEVO PROVEEDORR', 87654322, NULL),
('JOEL YENER', 'ESPINOZA HUAMANI', '1234567', 'johins2x@gmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', 'PERU', 'NUEVO PROVEEDOR', 87654323, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', 'PERU', 'NUEVO EMPLEADO', 87654324, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '', '', '', 87654325, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'qwq', 'PERU', 'wqed1', 87654326, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', '', '', '', '', '', '', 'asddddddddddddddddd', 87654343, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', '', '', '', '', '', '', 'weeeeeeeeeeeeeeeeee', 87654344, NULL),
('JOHAN', 'CAÑARI HUAMANI', '1234567', 'johan2x_69@hotmail.com', '', '', '', '', '', '', 'qwwwwwwwwwwwwww', 87654345, NULL),
('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 87654346, NULL),
('ssssss', 'sssssss', '1234567', 'johan2x_69@hotmail.com', 'VILLA EL SALVADOR', '', '', '', '', '', '', 87654347, NULL),
('Naruto', 'Uzumaki', '1234567', 'naruto@gmail.com', '', '', '', '', '01', '', '', 2147483647, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_permissions`
--

CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`module_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('items', 1),
('item_kits', 1),
('receivings', 1),
('reports', 1),
('sales', 1),
('suppliers', 1),
('travel', 1),
('config', 87654324),
('customers', 87654324),
('employees', 87654324),
('items', 87654324),
('receivings', 87654324),
('reports', 87654324),
('sales', 87654324),
('suppliers', 87654324);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_property`
--

CREATE TABLE IF NOT EXISTS `ospos_property` (
`id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(200) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ospos_property`
--

INSERT INTO `ospos_property` (`id`, `name`, `description`, `created_at`, `updated_at`, `parent_id`, `type`, `module_id`, `sort`) VALUES
(1, 'Tipos de Tallas', 'Tipos de Tallas', '2018-01-23', NULL, 0, 'select', 'items', 0),
(2, 'Talla S', 'Talla S', '2018-01-23', NULL, 1, 'select', 'items', 0),
(3, 'Talla M', 'Talla M', '2018-01-23', NULL, 1, 'select', 'items', 0),
(4, 'Talla L', 'Talla L', '2018-01-24', NULL, 1, 'select', 'items', 0),
(5, 'Fecha Expiración', 'Fecha Expiración', '2018-02-24', NULL, 0, 'date', 'customer', 2),
(6, 'Pasaporte', 'Pasaporte', '2018-02-24', NULL, 0, 'text', 'customer', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_receivings`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
`receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ospos_receivings`
--

INSERT INTO `ospos_receivings` (`receiving_time`, `supplier_id`, `employee_id`, `comment`, `receiving_id`, `payment_type`) VALUES
('2016-07-29 19:55:11', 87654322, 1, 'COMPRA DE CARTELES', 1, 'Efectivo'),
('2017-08-19 18:56:33', 87654322, 1, 'PAGO POR ARTICULOS DE ZAPATILLAS.', 2, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_receivings_items`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_receivings_items`
--

INSERT INTO `ospos_receivings_items` (`receiving_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`) VALUES
(1, 44, 'CARTELES', '0', 1, '20.00', '200.00', '200.00', '0.00'),
(2, 48, 'asaas', '0', 1, '12.00', '23.00', '23.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales`
--

CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
`sale_id` int(10) NOT NULL,
  `payment_type` varchar(512) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `sale_id`, `payment_type`) VALUES
('2014-08-15 00:46:08', NULL, 1, '', 1, 'Efectivo: $20.00<br />'),
('2014-08-15 14:52:34', NULL, 1, '', 2, 'Efectivo: S/.72.00<br />'),
('2014-08-18 14:22:57', NULL, 1, '0', 3, 'Efectivo: S/.83.76<br />'),
('2014-08-18 14:23:40', NULL, 1, '0', 4, 'Efectivo: S/.0.00<br />'),
('2014-08-18 14:24:31', NULL, 1, '', 5, 'Efectivo: S/.0.00<br />'),
('2014-08-18 14:27:46', NULL, 1, '0', 6, 'Efectivo: S/.36.00<br />'),
('2014-08-18 14:33:13', NULL, 1, '0', 7, 'Efectivo: S/.12.00<br />'),
('2014-12-04 13:45:07', NULL, 1, '0', 8, 'Efectivo: S/.62.00<br />'),
('2016-07-29 19:56:52', 12345678, 1, 'COMPRA DE CARTELES', 9, 'Efectivo: S/.750.00<br />'),
('2017-02-02 15:12:50', 12345678, 1, 'GRACIAS POR SU COMPRA', 10, 'Efectivo: S/.12.00<br />'),
('2017-04-13 22:28:30', NULL, 1, '0', 11, 'Efectivo: S/.500.00<br />'),
('2017-04-13 22:30:35', 87654321, 1, '0', 12, 'Efectivo: S/.100.00<br />Tarjeta de Crédito: S/.150.00<br />');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`) VALUES
(1, 1, '', '', 1, '1.00', '20.00', '20.00', '0.00'),
(2, 3, '', '', 1, '5.00', '10.00', '12.00', '0.00'),
(2, 7, '', '', 2, '1.00', '10.00', '12.00', '0.00'),
(3, 3, '', '', 1, '5.00', '10.00', '12.00', '0.00'),
(3, 8, '0', '0', 3, '2.00', '10.00', '12.00', '1.00'),
(4, 29, '', '', 1, '1.00', '0.00', '0.00', '0.00'),
(5, 33, '', '', 1, '1.00', '0.00', '0.00', '0.00'),
(6, 26, '', '', 1, '1.00', '10.00', '12.00', '0.00'),
(6, 32, '0', '0', 2, '2.00', '10.00', '12.00', '0.00'),
(7, 30, '', '', 1, '1.00', '10.00', '12.00', '0.00'),
(8, 28, '', '', 1, '1.00', '10.00', '12.00', '0.00'),
(9, 44, '0', '0', 1, '3.00', '200.00', '250.00', '0.00'),
(10, 27, '', '', 1, '1.00', '10.00', '12.00', '0.00'),
(11, 50, '0', '0', 1, '2.00', '200.00', '250.00', '0.00'),
(12, 49, 'aaaaaaaaaaa', '', 1, '1.00', '200.00', '250.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_items_taxes`
--

INSERT INTO `ospos_sales_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`) VALUES
(9, 44, 1, 'Impuesto de Ventas 1', '0.00'),
(9, 44, 1, 'Impuesto de Ventas 2', '0.00'),
(12, 49, 1, 'Impuesto de Ventas 1', '0.00'),
(12, 49, 1, 'Impuesto de Ventas 2', '0.00'),
(11, 50, 1, 'Impuesto de Ventas 1', '0.00'),
(11, 50, 1, 'Impuesto de Ventas 2', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_payments`
--

INSERT INTO `ospos_sales_payments` (`sale_id`, `payment_type`, `payment_amount`) VALUES
(1, 'Efectivo', '20.00'),
(2, 'Efectivo', '72.00'),
(3, 'Efectivo', '83.76'),
(4, 'Efectivo', '0.00'),
(5, 'Efectivo', '0.00'),
(6, 'Efectivo', '36.00'),
(7, 'Efectivo', '12.00'),
(8, 'Efectivo', '62.00'),
(9, 'Efectivo', '750.00'),
(10, 'Efectivo', '12.00'),
(11, 'Efectivo', '500.00'),
(12, 'Efectivo', '100.00'),
(12, 'Tarjeta de Crédito', '150.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_suspended`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
`sale_id` int(10) NOT NULL,
  `payment_type` varchar(512) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ospos_sales_suspended`
--

INSERT INTO `ospos_sales_suspended` (`sale_time`, `customer_id`, `employee_id`, `comment`, `sale_id`, `payment_type`) VALUES
('2017-04-13 22:27:40', 12345678, 1, '', 1, 'Efectivo: S/.1100.00<br />');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_suspended_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_suspended_items`
--

INSERT INTO `ospos_sales_suspended_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`) VALUES
(1, 50, '0', '0', 1, '2.00', '200.00', '250.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_suspended_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_suspended_items_taxes`
--

INSERT INTO `ospos_sales_suspended_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`) VALUES
(1, 50, 1, 'Impuesto de Ventas 1', '0.00'),
(1, 50, 1, 'Impuesto de Ventas 2', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_suspended_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_suspended_payments`
--

INSERT INTO `ospos_sales_suspended_payments` (`sale_id`, `payment_type`, `payment_amount`) VALUES
(1, 'Efectivo', '1100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sessions`
--

CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('0a5e4049daf7d6566e324a68a40a3388', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 1495682670, 'a:1:{s:9:"person_id";s:1:"1";}'),
('0b5b9541101a036ff23caab7a3546adf', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36', 1478573480, ''),
('15ab9e1151ebbaaf2783afe9138f772c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 1492210626, ''),
('19ce0e45cffcfeb6b81e99c1a8eb1368', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 1492210294, ''),
('19db4993ef983e31fb78a08a4885e81d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1519440294, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('47f048adabaf69140fad485708c7879d', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1519440207, ''),
('576270e7516e3702b6b4517ebb490a40', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36', 1479002743, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('774f9dc5cefc710f0b9647aa8b497cbd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0', 1462669450, ''),
('7ab64dd9b46dcc3703165c5813b47d86', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1519579742, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('a20e5571b2e27679492d93672b953917', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 1497825027, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('b617719c875d994a0784478a0d31203b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36', 1479003997, ''),
('bbb608959c6ebec75ec15c5af8cf82a6', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', 1500004670, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('c762de67a11225edd345578eed4e8403', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', 1504672037, ''),
('cd6b2496da61571fd7ee436397fbf917', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1519579378, ''),
('d2c31f820701e8458fcee87531001733', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', 1500349611, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_suppliers`
--

CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_suppliers`
--

INSERT INTO `ospos_suppliers` (`person_id`, `company_name`, `account_number`, `deleted`) VALUES
(87654322, 'OCEO S.A.C', NULL, 0),
(87654323, 'DETODO', NULL, 0),
(87654325, 'SAP TECNO', NULL, 1),
(87654326, 'SAP TECNO', '12345678', 1),
(87654343, 'aasasad', NULL, 1),
(87654344, 'aasasad', NULL, 0),
(87654345, 'aasasad', NULL, 0),
(87654347, 'CDDD', NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ospos_app_config`
--
ALTER TABLE `ospos_app_config`
 ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `ospos_customers`
--
ALTER TABLE `ospos_customers`
 ADD UNIQUE KEY `account_number` (`account_number`), ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_design`
--
ALTER TABLE `ospos_design`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ospos_employees`
--
ALTER TABLE `ospos_employees`
 ADD UNIQUE KEY `username` (`username`), ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
 ADD PRIMARY KEY (`giftcard_id`), ADD UNIQUE KEY `giftcard_number` (`giftcard_number`);

--
-- Indices de la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
 ADD PRIMARY KEY (`trans_id`), ADD KEY `ospos_inventory_ibfk_1` (`trans_items`), ADD KEY `ospos_inventory_ibfk_2` (`trans_user`);

--
-- Indices de la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
 ADD PRIMARY KEY (`item_id`), ADD UNIQUE KEY `item_number` (`item_number`), ADD KEY `ospos_items_ibfk_1` (`supplier_id`);

--
-- Indices de la tabla `ospos_items_gallery`
--
ALTER TABLE `ospos_items_gallery`
 ADD KEY `FK_ITEM_ID` (`item_id`);

--
-- Indices de la tabla `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
 ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indices de la tabla `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
 ADD PRIMARY KEY (`item_kit_id`);

--
-- Indices de la tabla `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
 ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`), ADD KEY `ospos_item_kit_items_ibfk_2` (`item_id`);

--
-- Indices de la tabla `ospos_modules`
--
ALTER TABLE `ospos_modules`
 ADD PRIMARY KEY (`module_id`), ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`), ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indices de la tabla `ospos_people`
--
ALTER TABLE `ospos_people`
 ADD PRIMARY KEY (`person_id`);

--
-- Indices de la tabla `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
 ADD PRIMARY KEY (`module_id`,`person_id`), ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_property`
--
ALTER TABLE `ospos_property`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
 ADD PRIMARY KEY (`receiving_id`), ADD KEY `supplier_id` (`supplier_id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
 ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`), ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
 ADD PRIMARY KEY (`sale_id`), ADD KEY `customer_id` (`customer_id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`), ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`), ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
 ADD PRIMARY KEY (`sale_id`,`payment_type`);

--
-- Indices de la tabla `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
 ADD PRIMARY KEY (`sale_id`), ADD KEY `customer_id` (`customer_id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`), ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`), ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
 ADD PRIMARY KEY (`sale_id`,`payment_type`);

--
-- Indices de la tabla `ospos_sessions`
--
ALTER TABLE `ospos_sessions`
 ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
 ADD UNIQUE KEY `account_number` (`account_number`), ADD KEY `person_id` (`person_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ospos_design`
--
ALTER TABLE `ospos_design`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT de la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `ospos_people`
--
ALTER TABLE `ospos_people`
MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2147483647;
--
-- AUTO_INCREMENT de la tabla `ospos_property`
--
ALTER TABLE `ospos_property`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ospos_customers`
--
ALTER TABLE `ospos_customers`
ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Filtros para la tabla `ospos_employees`
--
ALTER TABLE `ospos_employees`
ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Filtros para la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`);

--
-- Filtros para la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Filtros para la tabla `ospos_items_gallery`
--
ALTER TABLE `ospos_items_gallery`
ADD CONSTRAINT `FK_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Filtros para la tabla `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`);

--
-- Filtros para la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Filtros para la tabla `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Filtros para la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Filtros para la tabla `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Filtros para la tabla `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Filtros para la tabla `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Filtros para la tabla `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
ADD CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Filtros para la tabla `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`);

--
-- Filtros para la tabla `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Filtros para la tabla `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
ADD CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`);

--
-- Filtros para la tabla `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
ADD CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
