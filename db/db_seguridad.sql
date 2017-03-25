-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-11-2016 a las 00:29:41
-- Versión del servidor: 5.7.16-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_seguridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

CREATE TABLE `agentes` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`id`, `codigo`, `descripcion`) VALUES
(1, 'agen-1', 'Descripcion agente 1'),
(2, 'agen-2', 'Descripcion agente 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amenazas`
--

CREATE TABLE `amenazas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amenazas`
--

INSERT INTO `amenazas` (`id`, `codigo`, `descripcion`) VALUES
(1, 'amen-1', 'Descripcion amenaza 1'),
(2, 'amen-2', 'Descripcion amanaza 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amenazas_grupo_activos`
--

CREATE TABLE `amenazas_grupo_activos` (
  `id` int(11) NOT NULL,
  `amenaza_id` int(11) NOT NULL,
  `grupo_activo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amenazas_grupo_activos`
--

INSERT INTO `amenazas_grupo_activos` (`id`, `amenaza_id`, `grupo_activo_id`) VALUES
(3, 1, 5),
(4, 2, 1),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capas`
--

CREATE TABLE `capas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `capas`
--

INSERT INTO `capas` (`id`, `nombre`) VALUES
(3, 'capa 1'),
(4, 'capa 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles`
--

CREATE TABLE `controles` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `controles`
--

INSERT INTO `controles` (`id`, `codigo`, `descripcion`) VALUES
(1, 'contro-1', 'Descripcion control 1'),
(5, 'control-2', 'Descripcion control 2'),
(7, 'control-3', 'Descripcion control 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criticidades`
--

CREATE TABLE `criticidades` (
  `id` int(11) NOT NULL,
  `grado` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `criticidades`
--

INSERT INTO `criticidades` (`id`, `grado`, `descripcion`) VALUES
(1, 1, 'nombre criticdiad 1'),
(2, 2, 'nombre criticidad 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_activos`
--

CREATE TABLE `grupo_activos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo_activos`
--

INSERT INTO `grupo_activos` (`id`, `nombre`) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4'),
(5, 'Grupo 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgos`
--

CREATE TABLE `riesgos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `riesgos`
--

INSERT INTO `riesgos` (`id`, `codigo`, `descripcion`) VALUES
(1, 'rieg-1', 'Descripcion riesgo 1'),
(2, 'rieg-2', 'Descripcion riesgo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_activos`
--

CREATE TABLE `tipo_activos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_activos`
--

INSERT INTO `tipo_activos` (`id`, `nombre`) VALUES
(1, 'tipo 1'),
(3, 'tipo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `nombre`) VALUES
(3, 'ubicacion 1'),
(4, 'ubicacion 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vulnerabilidades`
--

CREATE TABLE `vulnerabilidades` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vulnerabilidades`
--

INSERT INTO `vulnerabilidades` (`id`, `codigo`, `descripcion`) VALUES
(1, 'vulne-1', 'Descripcion vulnerabildiad 1'),
(2, 'vulne-2', 'Desciprcion vulnerabildiad 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vulnerabilidades_grupo_activos`
--

CREATE TABLE `vulnerabilidades_grupo_activos` (
  `id` int(11) NOT NULL,
  `vulnerabilidad_id` int(11) NOT NULL,
  `grupo_activo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vulnerabilidades_grupo_activos`
--

INSERT INTO `vulnerabilidades_grupo_activos` (`id`, `vulnerabilidad_id`, `grupo_activo_id`) VALUES
(4, 1, 1),
(5, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentes`
--
ALTER TABLE `agentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `amenazas`
--
ALTER TABLE `amenazas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `amenazas_grupo_activos`
--
ALTER TABLE `amenazas_grupo_activos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenaza_id` (`amenaza_id`),
  ADD KEY `grupo_activo_id` (`grupo_activo_id`);

--
-- Indices de la tabla `capas`
--
ALTER TABLE `capas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `controles`
--
ALTER TABLE `controles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `criticidades`
--
ALTER TABLE `criticidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo_activos`
--
ALTER TABLE `grupo_activos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_activos`
--
ALTER TABLE `tipo_activos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vulnerabilidades`
--
ALTER TABLE `vulnerabilidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vulnerabilidades_grupo_activos`
--
ALTER TABLE `vulnerabilidades_grupo_activos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vulnerabilidad_id` (`vulnerabilidad_id`),
  ADD KEY `grupo_activo_id` (`grupo_activo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agentes`
--
ALTER TABLE `agentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `amenazas`
--
ALTER TABLE `amenazas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `amenazas_grupo_activos`
--
ALTER TABLE `amenazas_grupo_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `capas`
--
ALTER TABLE `capas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `controles`
--
ALTER TABLE `controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `criticidades`
--
ALTER TABLE `criticidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `grupo_activos`
--
ALTER TABLE `grupo_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `riesgos`
--
ALTER TABLE `riesgos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_activos`
--
ALTER TABLE `tipo_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `vulnerabilidades`
--
ALTER TABLE `vulnerabilidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `vulnerabilidades_grupo_activos`
--
ALTER TABLE `vulnerabilidades_grupo_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amenazas_grupo_activos`
--
ALTER TABLE `amenazas_grupo_activos`
  ADD CONSTRAINT `amenazas_grupo_activos_ibfk_1` FOREIGN KEY (`amenaza_id`) REFERENCES `amenazas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amenazas_grupo_activos_ibfk_2` FOREIGN KEY (`grupo_activo_id`) REFERENCES `grupo_activos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vulnerabilidades_grupo_activos`
--
ALTER TABLE `vulnerabilidades_grupo_activos`
  ADD CONSTRAINT `vulnerabilidades_grupo_activos_ibfk_1` FOREIGN KEY (`vulnerabilidad_id`) REFERENCES `vulnerabilidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vulnerabilidades_grupo_activos_ibfk_2` FOREIGN KEY (`grupo_activo_id`) REFERENCES `grupo_activos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
