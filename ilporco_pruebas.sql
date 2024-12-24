-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-12-2024 a las 15:42:39
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
  `num_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`legajo`, `nombre`, `apellido`, `sucursal_fk`, `num_empleado`) VALUES
(1221, 'MAJO', 'MONDATI', 4, 13),
(1903, 'MAURICIO', 'OLMEDO', 4, 12),
(3254, 'DALI', 'PIAZZOLI', 4, 11);

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
(1, 3254, 1, 1);

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
(3, '12:30:00', '17:30:00', 'Media jornada turno tarde Casa Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas_reloj`
--

CREATE TABLE `marcas_reloj` (
  `id_marca` int(11) NOT NULL,
  `hs_entrada` time DEFAULT '00:00:00',
  `hs_salida` time DEFAULT '00:00:00',
  `id_empleado_fk` int(11) DEFAULT NULL,
  `fecha_marca` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas_reloj`
--

INSERT INTO `marcas_reloj` (`id_marca`, `hs_entrada`, `hs_salida`, `id_empleado_fk`, `fecha_marca`) VALUES
(2, '08:30:00', '14:00:00', 3254, '2024-12-24'),
(5, '08:30:00', '17:30:00', 3254, '2024-12-23'),
(6, '08:30:00', '17:30:00', 3254, '2024-12-20'),
(7, '08:30:00', '17:30:00', 3254, '2024-12-19');

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
(5, 'FRIGO', 'Av. Pepe Honguito 111');

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
  ADD KEY `sucursal_fk` (`sucursal_fk`);

--
-- Indices de la tabla `emp_hor`
--
ALTER TABLE `emp_hor`
  ADD PRIMARY KEY (`id_emp_hor`),
  ADD KEY `legajo_fk` (`legajo_fk`),
  ADD KEY `id_horario_fk` (`id_horario_fk`),
  ADD KEY `turno_dia_fk` (`turno_dia_fk`);

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
  MODIFY `legajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3255;

--
-- AUTO_INCREMENT de la tabla `emp_hor`
--
ALTER TABLE `emp_hor`
  MODIFY `id_emp_hor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas_reloj`
--
ALTER TABLE `marcas_reloj`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`sucursal_fk`) REFERENCES `sucursales` (`id_sucursal`);

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
