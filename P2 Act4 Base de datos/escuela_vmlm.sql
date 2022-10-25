-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 01:52:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_vmlm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('142', 'Construye BD', 6, 90),
('143', 'Desarrolla Aplicaciones Web con conexion a Base de Datos', 6, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Administracion ', 'Mixto', NULL),
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Mixto', NULL),
('Logistica', 'Mixto', NULL),
('Mecanica Industrial', 'Mixto', NULL),
('Programacion', 'Mixto', 'Ricardo Mendez Rojas'),
('Soporte', 'Mixto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `edad` int(3) NOT NULL,
  `domicilio` varchar(20) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `telefono`, `edad`, `domicilio`, `grupo`) VALUES
('19311028406872', 'Tristan', 'Martinez Gonzalez', '4182946184', 19, 'Benito Juarez 12', '5PV'),
('19311050750470', 'Brian Ulises', 'Almaguer Perez', '4182379867', 18, 'Emiliano Zapata 5', '5PV'),
('19311057593804', 'Juan Angel', 'Almanza Arevalo', '4182953017', 18, 'Guanajuato 10', '5PV'),
('19311083748291', 'Victor Manuel', 'Landeros Morales', '4182946201', 18, 'Lazaro Cardenas 1', '5PV'),
('20104628438921', 'Cesar Eduardo ', 'Mendez Monjaras', '4186291638', 16, 'Chilpancingo 72', '5PM'),
('20311001274845', 'Luis Ricardo', 'Villegas Dallidet', '4182712503', 18, 'Mexico 8', '5PM'),
('20311028457258', 'Diego Alejandro', 'Godinez Ramirez', '4182945193', 18, 'Zapata 58', '5PM'),
('20311057301749', 'Roberto Carlos', 'Aviles Martinez', '4182913540', 17, 'Aurrera 28', '5PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` float NOT NULL,
  `parcial` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`, `parcial`) VALUES
('19311083748291', '142', '2022-09-27', 5, 8, 1),
('19311083748291', '143', '2022-09-27', 5, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(4) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `tutor` varchar(30) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `tutor`, `representante`, `carrera`) VALUES
('5AM', 'Matutino', 'Luis Godinez', 'Ricardo Villegas', 'Administracion'),
('5AV1', 'Vespertino', 'Luis Gerardo', 'Roberto Carlos', 'Administracion '),
('5AV2', 'Vespertino', 'Martin Antonio', 'Brandon Contreras', 'Administracion '),
('5CM', 'Matutino', 'Maria Sanchez', 'Angel ALmanza', 'Contabilidad'),
('5CV', 'Matutino', 'Jose Luis Silva', 'Cesar Eduardo', 'Contabilidad'),
('5EM', 'Matutino', 'Misael Horacio', 'Diego Alejandro', 'Electricidad'),
('5LV', 'Vespertino', 'Jose Cristobal', 'Xavier Avalos', 'Logistica'),
('5M', 'Matutino', 'Norma Alicia', 'Tristan Martinez', 'Mecanica Industrial'),
('5PM', 'Matutino', 'Ricardo Mendes', 'Dulce Alejandra', 'Programacion'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo', 'Programacion'),
('5SM', 'Matutino', 'Silvestre Palafox', 'Arturo Correa', 'Soporte'),
('5SV', 'Vespertino', 'Silvestre Palafox', 'Juan Arevalo', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `index_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `index_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
