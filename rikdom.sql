-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2024 a las 16:21:37
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
-- Base de datos: `rikdom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_document` varchar(45) DEFAULT NULL,
  `cli_nombres` varchar(45) DEFAULT NULL,
  `cli_apellidos` varchar(45) DEFAULT NULL,
  `cli_direccion` varchar(45) DEFAULT NULL,
  `cli_telefono` int(11) DEFAULT NULL,
  `usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_document`, `cli_nombres`, `cli_apellidos`, `cli_direccion`, `cli_telefono`, `usu_id`) VALUES
(1, '23455432', 'Luis', 'Martz', 'cr 22', 2147483647, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `ent_id` int(11) NOT NULL,
  `ent_fecha` varchar(45) DEFAULT NULL,
  `solicitudes_sol_id` int(11) NOT NULL,
  `tarjetas_creditos_tdc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `entrega`
--

INSERT INTO `entrega` (`ent_id`, `ent_fecha`, `solicitudes_sol_id`, `tarjetas_creditos_tdc_id`) VALUES
(1, '23072022', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `sol_id` int(11) NOT NULL,
  `sol_estado` varchar(45) DEFAULT NULL,
  `sol_fecha` varchar(45) DEFAULT NULL,
  `clientes_cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`sol_id`, `sol_estado`, `sol_fecha`, `clientes_cli_id`) VALUES
(1, 'Activo', '2403', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas_creditos`
--

CREATE TABLE `tarjetas_creditos` (
  `tdc_id` int(11) NOT NULL,
  `tdc_numero` int(11) DEFAULT NULL,
  `tdc_fecha` varchar(45) DEFAULT NULL,
  `tdc_monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tarjetas_creditos`
--

INSERT INTO `tarjetas_creditos` (`tdc_id`, `tdc_numero`, `tdc_fecha`, `tdc_monto`) VALUES
(1, 10531234, '23112024', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_correo` varchar(45) DEFAULT NULL,
  `usu_contraseña` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_correo`, `usu_contraseña`) VALUES
(1, 'lmll@gmail.com', '23432');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `fk_clientes_usuarios_idx` (`usu_id`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`ent_id`),
  ADD KEY `fk_entrega_solicitudes1_idx` (`solicitudes_sol_id`),
  ADD KEY `fk_entrega_tarjetas_creditos1_idx` (`tarjetas_creditos_tdc_id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`sol_id`),
  ADD KEY `fk_solicitudes_clientes1_idx` (`clientes_cli_id`);

--
-- Indices de la tabla `tarjetas_creditos`
--
ALTER TABLE `tarjetas_creditos`
  ADD PRIMARY KEY (`tdc_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_usuarios` FOREIGN KEY (`usu_id`) REFERENCES `usuarios` (`usu_id`),
  ADD CONSTRAINT `fk_usuarios_clientes` FOREIGN KEY (`usu_id`) REFERENCES `usuarios` (`usu_id`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `fk_entrega_solicitudes1` FOREIGN KEY (`solicitudes_sol_id`) REFERENCES `solicitudes` (`sol_id`),
  ADD CONSTRAINT `fk_entrega_tarjetas_creditos1` FOREIGN KEY (`tarjetas_creditos_tdc_id`) REFERENCES `tarjetas_creditos` (`tdc_id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk_solicitudes_clientes1` FOREIGN KEY (`clientes_cli_id`) REFERENCES `clientes` (`cli_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
