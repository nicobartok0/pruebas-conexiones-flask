-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-01-2025 a las 19:17:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ilporco_pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `legajo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `sucursal_fk` int(11) DEFAULT NULL,
  `num_empleado` int(11) DEFAULT NULL,
  `funcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`legajo`, `nombre`, `apellido`, `sucursal_fk`, `num_empleado`, `funcion_fk`) VALUES
(1000, 'DUAN', 'CASTRO', 4, 100, 7),
(1221, 'MAJO', 'MONDATI', 4, 13, 3),
(1903, 'MAURICIO', 'OLMEDO', 4, 12, 1),
(2000, 'NICOLÁS', 'LABRUNE', 3, 777, 4),
(3000, 'BRUNO', 'MASTROPIETRO', 3, 666, 4),
(3254, 'DALI', 'PIAZZOLI', 4, 11, 1),
(4000, 'GUADALUPE', 'MANONNE', 3, 555, 3),
(4525, 'NICOLÁS', 'BARTOLOMEO', 4, 121, 4),
(5000, 'LEANDRO', 'SACCA', 6, 444, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp_hor`
--

CREATE TABLE `emp_hor` (
  `id_emp_hor` int(11) NOT NULL,
  `legajo_fk` int(11) DEFAULT NULL,
  `id_horario_fk` int(11) DEFAULT NULL,
  `turno_dia_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emp_hor`
--

INSERT INTO `emp_hor` (`id_emp_hor`, `legajo_fk`, `id_horario_fk`, `turno_dia_fk`) VALUES
(1, 3254, 1, 1),
(2, 1221, 2, 1),
(3, 1903, 1, 1),
(4, 2000, 1, 1),
(5, 3000, 1, 1),
(6, 5000, 4, 1),
(7, 5000, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id_funcion` int(11) NOT NULL,
  `nombre_funcion` varchar(30) DEFAULT NULL,
  `desc_funcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`id_funcion`, `nombre_funcion`, `desc_funcion`) VALUES
(1, 'ADMINISTRATIVO', 'Empleado de casa central encargado de manejo de precios e informes'),
(2, 'RECURSOS HUMANOS', 'Empleado de casa central encargado del manejo de personal'),
(3, 'LIMPIEZA', 'Empleado encargado de la higenización de los ambientes'),
(4, 'DESARROLLO', 'Desarrollador de sistemas informáticos'),
(5, 'GERENCIA', 'Administrador general de la empresa'),
(6, 'CONTADURÍA', 'Encargado de los movimientos monetarios y sus cantidades asociadas'),
(7, 'COSTOS', 'Encargado de evaluar costos de la empresa'),
(8, 'GRANJA', 'Empleado de la granja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `horario_entrada` time DEFAULT '00:00:00',
  `horario_salida` time DEFAULT '00:00:00',
  `desc_horario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horario`, `horario_entrada`, `horario_salida`, `desc_horario`) VALUES
(1, '08:30:00', '17:30:00', 'Jornada completa casa Central'),
(2, '08:30:00', '13:00:00', 'Media jornada turno mañana Casa Central'),
(3, '12:30:00', '17:30:00', 'Media jornada turno tarde Casa Central'),
(4, '05:00:00', '13:00:00', 'Jornada de Granja Verano'),
(5, '06:00:00', '14:00:00', 'Jornada de Granja Invierno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas_reloj`
--

CREATE TABLE `marcas_reloj` (
  `id_marca` int(11) NOT NULL,
  `hs_entrada` time DEFAULT '00:00:00',
  `hs_salida` time DEFAULT '00:00:00',
  `id_empleado_fk` int(11) DEFAULT NULL,
  `fecha_marca` date DEFAULT NULL,
  `novedad_fk` int(11) DEFAULT NULL,
  `observaciones` varchar(60) DEFAULT NULL,
  `hs_almuerzo_inicio` time DEFAULT NULL,
  `hs_almuerzo_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas_reloj`
--

INSERT INTO `marcas_reloj` (`id_marca`, `hs_entrada`, `hs_salida`, `id_empleado_fk`, `fecha_marca`, `novedad_fk`, `observaciones`, `hs_almuerzo_inicio`, `hs_almuerzo_fin`) VALUES
(36, '08:30:00', '17:30:00', 1903, '2024-12-26', 3, NULL, '14:00:00', '14:20:00'),
(37, '08:30:00', '17:30:00', 1903, '2024-12-27', 3, NULL, '14:00:00', '14:20:00'),
(38, '08:30:00', '17:30:00', 1903, '2024-12-28', 3, NULL, '14:00:00', '14:20:00'),
(39, '08:30:00', '17:30:00', 1903, '2024-12-29', 3, NULL, '14:00:00', '14:20:00'),
(40, '08:30:00', '17:30:00', 1903, '2024-12-30', 3, NULL, '14:00:00', '14:20:00'),
(41, '07:55:00', '12:03:00', 3254, '2024-12-30', 3, NULL, NULL, NULL),
(42, '07:55:00', '17:33:00', 3254, '2025-01-01', 3, NULL, '14:31:00', '15:02:00'),
(43, '07:55:00', '17:32:00', 3254, '2025-01-02', 3, NULL, '14:31:00', '15:02:00'),
(44, '07:55:00', '17:29:00', 3254, '2025-01-03', 3, NULL, '14:31:00', '15:02:00'),
(45, '07:55:00', '17:31:00', 3254, '2025-01-06', 3, NULL, '14:31:00', '15:02:00'),
(46, '07:55:00', '17:30:00', 3254, '2025-01-07', 3, NULL, '14:31:00', '15:02:00'),
(47, '07:55:00', '17:38:00', 3254, '2025-01-08', 3, NULL, '14:31:00', '15:02:00'),
(48, '07:55:00', '17:25:00', 3254, '2025-01-09', 3, NULL, '14:31:00', '15:02:00'),
(49, '07:55:00', '17:17:00', 3254, '2025-01-10', 3, NULL, '14:31:00', '15:02:00'),
(50, '07:55:00', '12:03:00', 1903, '2024-12-30', 3, NULL, NULL, NULL),
(51, '07:55:00', '17:33:00', 1903, '2025-01-01', 3, NULL, '14:31:00', '15:02:00'),
(52, '07:55:00', '17:32:00', 1903, '2025-01-02', 3, NULL, '14:31:00', '15:02:00'),
(53, '07:55:00', '17:29:00', 1903, '2025-01-03', 3, NULL, '14:31:00', '15:02:00'),
(54, '07:55:00', '17:31:00', 1903, '2025-01-06', 3, NULL, '14:31:00', '15:02:00'),
(55, '07:55:00', '17:30:00', 1903, '2025-01-07', 3, NULL, '14:31:00', '15:02:00'),
(56, '07:55:00', '17:38:00', 1903, '2025-01-08', 3, NULL, '14:31:00', '15:02:00'),
(57, '07:55:00', '17:25:00', 1903, '2025-01-09', 3, NULL, '14:31:00', '15:02:00'),
(58, '07:55:00', '17:17:00', 1903, '2025-01-10', 3, NULL, '14:31:00', '15:02:00'),
(59, '07:55:00', '12:03:00', 4525, '2024-12-30', 3, NULL, NULL, NULL),
(60, '07:55:00', '17:33:00', 4525, '2025-01-01', 3, NULL, '14:31:00', '15:02:00'),
(61, '07:55:00', '17:32:00', 4525, '2025-01-02', 3, NULL, '14:31:00', '15:02:00'),
(62, '07:55:00', '17:29:00', 4525, '2025-01-03', 3, NULL, '14:31:00', '15:02:00'),
(63, '07:55:00', '17:31:00', 4525, '2025-01-06', 3, NULL, '14:31:00', '15:02:00'),
(64, '07:55:00', '17:30:00', 4525, '2025-01-07', 3, NULL, '14:31:00', '15:02:00'),
(65, '07:55:00', '17:38:00', 4525, '2025-01-08', 3, NULL, '14:31:00', '15:02:00'),
(66, '07:55:00', '17:25:00', 4525, '2025-01-09', 3, NULL, '14:31:00', '15:02:00'),
(67, '07:55:00', '17:17:00', 4525, '2025-01-10', 3, NULL, '14:31:00', '15:02:00'),
(68, '05:12:00', '13:02:00', 5000, '2024-12-30', 3, NULL, NULL, NULL),
(69, '05:12:00', '13:02:00', 5000, '2024-12-31', 3, NULL, NULL, NULL),
(70, '05:12:00', '13:02:00', 5000, '2025-01-01', 3, NULL, NULL, NULL),
(71, '05:12:00', '13:02:00', 5000, '2025-01-02', 3, NULL, NULL, NULL),
(72, '05:12:00', '13:02:00', 5000, '2025-01-03', 3, NULL, NULL, NULL),
(73, '05:12:00', '13:02:00', 5000, '2025-01-04', 3, NULL, NULL, NULL),
(74, '05:12:00', '13:02:00', 5000, '2025-01-05', 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `metodo_pago` varchar(30) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `sucursal_fk` int(11) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `tipo`, `fecha`, `categoria`, `metodo_pago`, `monto`, `sucursal_fk`, `observacion`) VALUES
(221, 'EGRESO', '2024-12-12', 'ALARMA', '-', 1180, 1, ''),
(222, 'EGRESO', '2024-12-12', 'ALQUILER', '-', 1109, 2, ''),
(223, 'EGRESO', '2024-12-12', 'ALQUILER', '-', 1802, 1, ''),
(224, 'EGRESO', '2024-12-12', 'ALQUILER', '-', 800, 3, ''),
(225, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 1000, 2, ''),
(226, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 3000, 1, ''),
(227, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 300, 3, ''),
(228, 'EGRESO', '2024-12-12', 'INTERNET', '-', 300, 2, ''),
(229, 'EGRESO', '2024-12-12', 'INTERNET', '-', 2700, 1, ''),
(230, 'EGRESO', '2024-12-12', 'INTERNET', '-', 500, 3, ''),
(231, 'EGRESO', '2024-12-12', 'GAS', '-', 0, 1, ''),
(232, 'EGRESO', '2024-12-12', 'IMPUESTO MUNICIPAL', '-', 0, 1, ''),
(233, 'EGRESO', '2024-12-12', 'HABILITACIÓN', '-', 0, 1, ''),
(234, 'EGRESO', '2024-12-12', 'ACCESORIOS CARNICERÍA', '-', 0, 1, ''),
(235, 'EGRESO', '2024-12-12', 'ACCESORIOS CARNICERÍA', '-', 1100, 3, ''),
(236, 'EGRESO', '2024-12-12', 'AFILADOS', '-', 0, 1, ''),
(237, 'EGRESO', '2024-12-12', 'AFILADOS', '-', 7000, 3, ''),
(238, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIBRERÍA', '-', 500, 2, ''),
(239, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIBRERÍA', '-', 41, 1, ''),
(240, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIBRERÍA', '-', 15000, 3, ''),
(241, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIMPIEZA***', '-', 980, 2, ''),
(242, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIMPIEZA***', '-', 5300, 1, ''),
(243, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIMPIEZA***', '-', 2000, 3, ''),
(244, 'EGRESO', '2024-12-12', 'CERRAJERÍA', '-', 3000, 1, ''),
(245, 'EGRESO', '2024-12-12', 'COLABORACION INSTITUCIONAL', '-', 1500, 1, ''),
(246, 'EGRESO', '2024-12-12', 'COMBUSTIBLE', '-', 4400, 2, ''),
(247, 'EGRESO', '2024-12-12', 'COMBUSTIBLE', '-', 7600, 1, ''),
(248, 'EGRESO', '2024-12-12', 'COMBUSTIBLE', '-', 1000, 3, ''),
(249, 'EGRESO', '2024-12-12', 'COMPENSACIONES', '-', 600, 2, ''),
(250, 'EGRESO', '2024-12-12', 'CUOTA PARTNER', '-', 8000, 2, ''),
(251, 'EGRESO', '2024-12-12', 'DESCARTABLES', '-', 500, 2, ''),
(252, 'EGRESO', '2024-12-12', 'DESCARTABLES', '-', 1500, 1, ''),
(253, 'EGRESO', '2024-12-12', 'DESCARTABLES', '-', 2000, 3, ''),
(254, 'EGRESO', '2024-12-12', 'DESINFECCIÓN', '-', 3000, 2, ''),
(255, 'EGRESO', '2024-12-12', 'DESINFECCIÓN', '-', 5000, 1, ''),
(256, 'EGRESO', '2024-12-12', 'FERRETERÍA', '-', 2300, 2, ''),
(257, 'EGRESO', '2024-12-12', 'FERRETERÍA', '-', 6380, 1, ''),
(258, 'EGRESO', '2024-12-12', 'FERRETERÍA', '-', 4400, 3, ''),
(259, 'EGRESO', '2024-12-12', 'FLETES', '-', 9800, 1, ''),
(260, 'EGRESO', '2024-12-12', 'HONORARIOS BROMATÓLOGO', '-', 7700, 2, ''),
(261, 'EGRESO', '2024-12-12', 'HONORARIOS BROMATÓLOGO', '-', 4000, 1, ''),
(262, 'EGRESO', '2024-12-12', 'HONORARIOS BROMATÓLOGO', '-', 7000, 3, ''),
(263, 'EGRESO', '2024-12-12', 'HONORARIOS SEG E HIGIENE', '-', 1000, 2, ''),
(264, 'EGRESO', '2024-12-12', 'HONORARIOS SEG E HIGIENE', '-', 5000, 1, ''),
(265, 'EGRESO', '2024-12-12', 'INSUMOS', '-', 5400, 3, ''),
(266, 'EGRESO', '2024-12-12', 'LAVADERO VEHÍCULO', '-', 4560, 1, ''),
(267, 'EGRESO', '2024-12-12', 'MANO DE OBRA CONTRATISTA', '-', 6600, 3, ''),
(268, 'EGRESO', '2024-12-12', 'MATERIALES DE CONSTRUCCIÓN', '-', 3100, 1, ''),
(269, 'EGRESO', '2024-12-12', 'MATERIALES DE CONSTRUCCIÓN', '-', 6100, 3, ''),
(270, 'EGRESO', '2024-12-12', 'MÉDICO LABORAL', '-', 27100, 3, ''),
(271, 'EGRESO', '2024-12-12', 'MERCADERÍA PARA LA VENTA', '-', 600, 2, ''),
(272, 'EGRESO', '2024-12-12', 'MERCADERÍA PARA LA VENTA', '-', 4500, 1, ''),
(273, 'EGRESO', '2024-12-12', 'MERCADERÍA PARA LA VENTA', '-', 11748984, 3, ''),
(274, 'EGRESO', '2024-12-12', 'PEAJE', '-', 2400, 1, ''),
(275, 'EGRESO', '2024-12-12', 'PUBLICIDAD', '-', 5000, 2, ''),
(276, 'EGRESO', '2024-12-12', 'PUBLICIDAD', '-', 5560, 1, ''),
(277, 'EGRESO', '2024-12-12', 'PUBLICIDAD', '-', 2200, 3, ''),
(278, 'EGRESO', '2024-12-12', 'CONSUMO PERSONAL', '-', 2400, 2, ''),
(279, 'EGRESO', '2024-12-12', 'CONSUMO PERSONAL', '-', 6540, 1, ''),
(280, 'EGRESO', '2024-12-12', 'CONSUMO PERSONAL', '-', 1200, 3, ''),
(281, 'EGRESO', '2024-12-12', 'REPARACIONES', '-', 3000, 2, ''),
(282, 'EGRESO', '2024-12-12', 'REPARACIONES', '-', 8520, 1, ''),
(283, 'EGRESO', '2024-12-12', 'REPUESTOS Y REP. VEHÍCULOS', '-', 4200, 2, ''),
(284, 'EGRESO', '2024-12-12', 'REPUESTOS Y REP. VEHÍCULOS', '-', 9000, 1, ''),
(285, 'EGRESO', '2024-12-12', 'SERVICIO DE RASTREO (STOPCAR)', '-', 2500, 2, ''),
(286, 'EGRESO', '2024-12-12', 'SERVICIO DE RASTREO (STOPCAR)', '-', 2500, 1, ''),
(287, 'EGRESO', '2024-12-12', 'SERVICIO DE RASTREO (STOPCAR)', '-', 1100, 3, ''),
(288, 'EGRESO', '2024-12-12', 'SINDICATOS', '-', 8900, 3, ''),
(289, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 7300, 2, ''),
(290, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 1200, 1, ''),
(291, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 7600, 3, ''),
(292, 'EGRESO', '2024-12-12', 'TASA DE VETERINARIA', '-', 1200, 2, ''),
(293, 'EGRESO', '2024-12-12', 'TAXI', '-', 8150, 1, ''),
(294, 'EGRESO', '2024-12-12', 'ALQUILER', '-', 2500, NULL, ''),
(295, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 2100, NULL, ''),
(296, 'EGRESO', '2024-12-12', 'COMBUSTIBLE TRACTORES', '-', 1100, NULL, ''),
(297, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 6500, NULL, ''),
(298, 'EGRESO', '2024-12-12', 'INTERNET', '-', 9600, NULL, ''),
(299, 'EGRESO', '2024-12-12', 'GAS', '-', 7600, NULL, ''),
(300, 'EGRESO', '2024-12-12', 'FERRETERÍA', '-', 5800, NULL, ''),
(301, 'EGRESO', '2024-12-12', 'DOSIS', '-', 1100, NULL, ''),
(302, 'EGRESO', '2024-12-12', 'SEGURIDAD E HIGIENE', '-', 3200, NULL, ''),
(303, 'EGRESO', '2024-12-12', 'MAÍZ', '-', 2100, NULL, ''),
(304, 'EGRESO', '2024-12-12', 'SERVICIO TÉCNICO', '-', 2500, NULL, ''),
(305, 'EGRESO', '2024-12-12', 'EXPELER', '-', 4500, NULL, ''),
(306, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 6300, NULL, ''),
(307, 'EGRESO', '2024-12-12', 'GENÉTICA', '-', 6900, NULL, ''),
(308, 'EGRESO', '2024-12-12', 'MEDICAMENTOS', '-', 1300, NULL, ''),
(309, 'EGRESO', '2024-12-12', 'NUCLEOS', '-', 1100, NULL, ''),
(310, 'EGRESO', '2024-12-12', 'FLETE', '-', 1000, NULL, ''),
(311, 'EGRESO', '2024-12-12', 'SEGURIDAD E HIGIENE', '-', 3200, NULL, ''),
(312, 'EGRESO', '2024-12-12', 'SERVICIO DE RASTREO', '-', 2500, NULL, ''),
(313, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 7400, NULL, ''),
(314, 'EGRESO', '2024-12-12', 'HONORARIOS VETERINARIO', '-', 8900, NULL, ''),
(315, 'EGRESO', '2024-12-12', 'LABORATORIO', '-', 1400, NULL, ''),
(316, 'EGRESO', '2024-12-12', 'DESINFECCIÓN', '-', 3200, NULL, ''),
(317, 'EGRESO', '2024-12-12', 'LIMPIEZA', '-', 1300, NULL, ''),
(318, 'EGRESO', '2024-12-12', 'REPARACIÓN', '-', 1500, NULL, ''),
(319, 'EGRESO', '2024-12-12', 'None', '-', 0, NULL, ''),
(320, 'EGRESO', '2024-12-12', 'None', '-', 0, NULL, ''),
(321, 'EGRESO', '2024-12-12', 'ALQUILER', '-', 2500, 5, ''),
(322, 'EGRESO', '2024-12-12', 'AGUA CORRIENTE', '-', 4510, 4, ''),
(323, 'EGRESO', '2024-12-12', 'AGUA POTABLE', '-', 7000, 4, ''),
(324, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 1300, 5, ''),
(325, 'EGRESO', '2024-12-12', 'ELECTRICIDAD', '-', 6800, 4, ''),
(326, 'EGRESO', '2024-12-12', 'INTERNET', '-', 9000, 5, ''),
(327, 'EGRESO', '2024-12-12', 'GAS', '-', 3100, 4, ''),
(328, 'EGRESO', '2024-12-12', 'CÁMARAS', '-', 3300, 5, ''),
(329, 'EGRESO', '2024-12-12', 'GAS', '-', 7600, 5, ''),
(330, 'EGRESO', '2024-12-12', 'HON ALTIERI', '-', 2500, 4, ''),
(331, 'EGRESO', '2024-12-12', 'ADITIVOS', '-', 1900, 5, ''),
(332, 'EGRESO', '2024-12-12', 'IMPUESTOS ', '-', 1300, 4, ''),
(333, 'EGRESO', '2024-12-12', 'AFILADO', '-', 7600, 5, ''),
(334, 'EGRESO', '2024-12-12', 'ARTÍCULOS DE LIMPIEZA', '-', 2200, 5, ''),
(335, 'EGRESO', '2024-12-12', 'HON SABATINI', '-', 2300, 4, ''),
(336, 'EGRESO', '2024-12-12', 'BROMATÓLOGO', '-', 3300, 5, ''),
(337, 'EGRESO', '2024-12-12', 'INTERNET', '-', 1600, 4, ''),
(338, 'EGRESO', '2024-12-12', 'CINTA DE EMBALAR', '-', 1100, 5, ''),
(339, 'EGRESO', '2024-12-12', 'LIBRERÍA', '-', 1500, 4, ''),
(340, 'EGRESO', '2024-12-12', 'CLORO', '-', 1200, 5, ''),
(341, 'EGRESO', '2024-12-12', 'COMBUSTIBLE CAMIONES', '-', 1600, 5, ''),
(342, 'EGRESO', '2024-12-12', 'PUBLICIDAD', '-', 1800, 4, ''),
(343, 'EGRESO', '2024-12-12', 'CONTRATISTA', '-', 9700, 5, ''),
(344, 'EGRESO', '2024-12-12', 'REC PROMO BNA', '-', 1500, 4, ''),
(345, 'EGRESO', '2024-12-12', 'SEGUROS', '-', 1200, 4, ''),
(346, 'EGRESO', '2024-12-12', 'CUOTA IVECO', '-', 7400, 5, ''),
(347, 'EGRESO', '2024-12-12', 'SEGUROS FASA', '-', 2400, 4, ''),
(348, 'EGRESO', '2024-12-12', 'DESCARTABLES', '-', 1200, 5, ''),
(349, 'EGRESO', '2024-12-12', 'SIND SEOCA', '-', 2000, 4, ''),
(350, 'EGRESO', '2024-12-12', 'DESINFECCIÓN', '-', 3000, 5, ''),
(351, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 3500, 4, ''),
(352, 'EGRESO', '2024-12-12', 'VEP FAENA', '-', 8900, 4, ''),
(353, 'EGRESO', '2024-12-12', 'FAENAS', '-', 6400, 5, ''),
(354, 'EGRESO', '2024-12-12', 'DISEÑADOR', '-', 2000, 4, ''),
(355, 'EGRESO', '2024-12-12', 'FERRETERÍA/PINTURERÍA', '-', 1300, 5, ''),
(356, 'EGRESO', '2024-12-12', 'GASTO PANADERÍA', '-', 1000, 4, ''),
(357, 'EGRESO', '2024-12-12', 'FLETES', '-', 6900, 5, ''),
(358, 'EGRESO', '2024-12-12', 'IMPUESTOS Y SERVICIOS FASA', '-', 2100, 4, ''),
(359, 'EGRESO', '2024-12-12', 'HILO-PRESCINTOS', '-', 2000, 5, ''),
(360, 'EGRESO', '2024-12-12', 'INSUMOS', '-', 6900, 5, ''),
(361, 'EGRESO', '2024-12-12', 'LIBRERÍA', '-', 4400, 5, ''),
(362, 'EGRESO', '2024-12-12', 'LIMPIEZA', '-', 22, 5, ''),
(363, 'EGRESO', '2024-12-12', 'REPARACIONES', '-', 4200, 5, ''),
(364, 'EGRESO', '2024-12-12', 'SEGURIDAD E HIGIENE', '-', 3200, 5, ''),
(365, 'EGRESO', '2024-12-12', 'SERVICIO DE RASTREO', '-', 2500, 5, ''),
(366, 'EGRESO', '2024-12-12', 'SUELDOS', '-', 1600, 5, ''),
(367, 'INGRESO', '2024-12-05', 'Transferencia MP', 'Transferencia', 3000, 4, ''),
(368, 'INGRESO', '2024-12-05', 'Transferencia MP', 'Transferencia', 20000, 4, ''),
(369, 'EGRESO', '2024-12-05', 'Transferencia MP', 'Transferencia', 2500, 4, ''),
(370, 'EGRESO', '2024-12-05', 'Transferencia MP', 'Transferencia', 500, 4, ''),
(371, 'EGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(372, 'EGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 1250, 4, ''),
(373, 'INGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 8000, 4, ''),
(374, 'EGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 8000, 4, ''),
(375, 'INGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 1500, 4, ''),
(376, 'EGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 13639, 4, ''),
(377, 'EGRESO', '2024-12-06', 'Transferencia MP', 'Transferencia', 400, 4, ''),
(378, 'EGRESO', '2024-12-07', 'Transferencia MP', 'Transferencia', 11000, 4, ''),
(379, 'INGRESO', '2024-12-09', 'Transferencia MP', 'Transferencia', 3000, 4, ''),
(380, 'EGRESO', '2024-12-09', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(381, 'EGRESO', '2024-12-10', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(382, 'INGRESO', '2024-12-10', 'Transferencia MP', 'Transferencia', 5000, 4, ''),
(383, 'INGRESO', '2024-12-11', 'Transferencia MP', 'Transferencia', 1000, 4, ''),
(384, 'INGRESO', '2024-12-14', 'Transferencia MP', 'Transferencia', 3000, 4, ''),
(385, 'EGRESO', '2024-12-14', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(386, 'INGRESO', '2024-12-14', 'Transferencia MP', 'Transferencia', 20000, 4, ''),
(387, 'EGRESO', '2024-12-14', 'Transferencia MP', 'Transferencia', 8800, 4, ''),
(388, 'EGRESO', '2024-12-14', 'Transferencia MP', 'Transferencia', 13270, 4, ''),
(389, 'INGRESO', '2024-12-16', 'Transferencia MP', 'Transferencia', 20000, 4, ''),
(390, 'EGRESO', '2024-12-16', 'Transferencia MP', 'Transferencia', 5559, 4, ''),
(391, 'INGRESO', '2024-12-17', 'Transferencia MP', 'Transferencia', 20000, 4, ''),
(392, 'INGRESO', '2024-12-18', 'Transferencia MP', 'Transferencia', 6000, 4, ''),
(393, 'EGRESO', '2024-12-18', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(394, 'EGRESO', '2024-12-18', 'Transferencia MP', 'Transferencia', 2800, 4, ''),
(395, 'EGRESO', '2024-12-18', 'Transferencia MP', 'Transferencia', 4690, 4, ''),
(396, 'INGRESO', '2024-12-19', 'Transferencia MP', 'Transferencia', 12500, 4, ''),
(397, 'INGRESO', '2024-12-20', 'Transferencia MP', 'Transferencia', 3000, 4, ''),
(398, 'EGRESO', '2024-12-20', 'Transferencia MP', 'Transferencia', 3000, 4, ''),
(399, 'EGRESO', '2024-12-20', 'Transferencia MP', 'Transferencia', 8250, 4, ''),
(400, 'INGRESO', '2024-12-20', 'Transferencia MP', 'Transferencia', 40000, 4, ''),
(401, 'EGRESO', '2024-12-21', 'Transferencia MP', 'Transferencia', 28000, 4, ''),
(402, 'INGRESO', '2024-12-21', 'Transferencia MP', 'Transferencia', 28000, 4, ''),
(403, 'EGRESO', '2024-12-21', 'Transferencia MP', 'Transferencia', 2000, 4, ''),
(404, 'INGRESO', '2024-12-20', 'VENTA DE MERCADERÍA', 'Efectivo', 5500, 1, 'Venta de mercadería a un cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id_novedad` int(11) NOT NULL,
  `nombre_novedad` varchar(30) DEFAULT NULL,
  `desc_novedad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id_novedad`, `nombre_novedad`, `desc_novedad`) VALUES
(1, 'AUSENCIA JUSTIFICADA', 'Ausencia bajo justificación presentada a la gerencia de RRHH'),
(2, 'AUSENCIA POR FERIADO', 'Ausencia justificada por feriado de calendario.'),
(3, 'NINGUNA', 'Sin novedades registradas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `direccion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_sucursal`, `nombre`, `direccion`) VALUES
(1, 'ALVEAR', 'AV. LIBERTADOR NORTE 897'),
(2, 'SAN RAFAEL', 'AV. BALLOFET 1514 '),
(3, 'SAN MARTIN', 'PUEYRREDÓN 58'),
(4, 'ADMIN', 'Bandera de los Andes 1483'),
(5, 'FRIGO', 'Av. Pepe Honguito 111'),
(6, 'GRANJA', 'AV. CAMPESTRE 2025');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno_dias`
--

CREATE TABLE `turno_dias` (
  `id_turno_dia` int(11) NOT NULL,
  `turno_dia_desc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turno_dias`
--

INSERT INTO `turno_dias` (`id_turno_dia`, `turno_dia_desc`) VALUES
(1, 'Lunes a Viernes'),
(2, 'Sábado'),
(3, 'Domingo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`legajo`),
  ADD KEY `sucursal_fk` (`sucursal_fk`),
  ADD KEY `funcion_fk` (`funcion_fk`);

--
-- Indices de la tabla `emp_hor`
--
ALTER TABLE `emp_hor`
  ADD PRIMARY KEY (`id_emp_hor`),
  ADD KEY `legajo_fk` (`legajo_fk`),
  ADD KEY `id_horario_fk` (`id_horario_fk`),
  ADD KEY `turno_dia_fk` (`turno_dia_fk`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id_funcion`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `marcas_reloj`
--
ALTER TABLE `marcas_reloj`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_empleado_fk` (`id_empleado_fk`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `sucursal_fk` (`sucursal_fk`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`id_novedad`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `turno_dias`
--
ALTER TABLE `turno_dias`
  ADD PRIMARY KEY (`id_turno_dia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `legajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5001;

--
-- AUTO_INCREMENT de la tabla `emp_hor`
--
ALTER TABLE `emp_hor`
  MODIFY `id_emp_hor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `id_funcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marcas_reloj`
--
ALTER TABLE `marcas_reloj`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `id_novedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turno_dias`
--
ALTER TABLE `turno_dias`
  MODIFY `id_turno_dia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`sucursal_fk`) REFERENCES `sucursales` (`id_sucursal`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`funcion_fk`) REFERENCES `funcion` (`id_funcion`);

--
-- Filtros para la tabla `emp_hor`
--
ALTER TABLE `emp_hor`
  ADD CONSTRAINT `emp_hor_ibfk_1` FOREIGN KEY (`legajo_fk`) REFERENCES `empleados` (`legajo`),
  ADD CONSTRAINT `emp_hor_ibfk_2` FOREIGN KEY (`id_horario_fk`) REFERENCES `horarios` (`id_horario`),
  ADD CONSTRAINT `emp_hor_ibfk_3` FOREIGN KEY (`turno_dia_fk`) REFERENCES `turno_dias` (`id_turno_dia`);

--
-- Filtros para la tabla `marcas_reloj`
--
ALTER TABLE `marcas_reloj`
  ADD CONSTRAINT `marcas_reloj_ibfk_1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleados` (`legajo`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`sucursal_fk`) REFERENCES `sucursales` (`id_sucursal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
