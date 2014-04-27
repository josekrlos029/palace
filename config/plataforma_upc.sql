-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2014 a las 06:11:02
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `plataforma_upc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(45) DEFAULT NULL,
  `idPersona` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idPersona_fk_comentario_idx` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `cap_presencial` int(11) DEFAULT NULL,
  `cap_virtual` int(11) DEFAULT NULL,
  `id_lugar` varchar(10) DEFAULT NULL,
  `idtipo_evento` varchar(5) NOT NULL,
  `id_persona` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `descripcion` text NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_lugar_eve_idx` (`id_lugar`),
  KEY `idtipo_evento_eve_idx` (`idtipo_evento`),
  KEY `id_persona_idx` (`id_persona`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `nombre`, `fecha_inicio`, `fecha_fin`, `cap_presencial`, `cap_virtual`, `id_lugar`, `idtipo_evento`, `id_persona`, `estado`, `descripcion`, `hora_inicio`, `hora_fin`) VALUES
(2, 'Primera Prueba de Evento', '2014-02-19', '0000-00-00', NULL, NULL, 'IPS', 'CON', '1065657930', 'agendado', 'FDSFSDFSDDFSF', '00:00:00', '00:00:00'),
(5, 'proyecyo de grado', '2014-03-12', '0000-00-00', 2323, 2121, 'IPS', 'CON', '1065657930', 'pendiente', 'sadasdasdasd', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
  `id_facultad` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id_facultad`, `nombre`) VALUES
('ING', 'FACULTAD DE INGENIERÍAS Y TECNOLÓGICAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante_semillero`
--

CREATE TABLE IF NOT EXISTS `integrante_semillero` (
  `id_persona` varchar(15) NOT NULL,
  `id_integrante` int(11) NOT NULL,
  `id_rolUnidad` varchar(5) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  PRIMARY KEY (`id_integrante`),
  KEY `id_persona_int_idx` (`id_persona`),
  KEY `id_rolUnidad_int_idx` (`id_rolUnidad`),
  KEY `id_unidad_int_idx` (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE IF NOT EXISTS `lugar` (
  `id_lugar` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`id_lugar`, `nombre`) VALUES
('IPS', 'AUDITORIO IPS'),
('JUVIBA', 'AUDITORIO JUVIBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE IF NOT EXISTS `noticia` (
  `id_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `contenido` longtext NOT NULL,
  `id_persona` varchar(15) NOT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_noticia`),
  KEY `idpersona_fk_noticia_idx` (`id_persona`),
  KEY `idunidad_fk_noticia_idx` (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

CREATE TABLE IF NOT EXISTS `participante` (
  `id_evento` int(11) NOT NULL,
  `id_persona` varchar(15) NOT NULL,
  KEY `id_evento_par_idx` (`id_evento`),
  KEY `id_persona_paar_idx` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` varchar(15) NOT NULL,
  `p_nombre` varchar(45) NOT NULL,
  `s_nombre` varchar(45) DEFAULT NULL,
  `p_apellido` varchar(45) NOT NULL,
  `s_apllido` varchar(45) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_programa` varchar(10) NOT NULL,
  `idrol_usuario` varchar(5) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `id_programa_per_idx` (`id_programa`),
  KEY `idrol_usuario_idx` (`idrol_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `p_nombre`, `s_nombre`, `p_apellido`, `s_apllido`, `sexo`, `telefono`, `direccion`, `fecha_nacimiento`, `id_programa`, `idrol_usuario`) VALUES
('1065657930', 'JOSE', 'CARLOS', 'JIMENEZ', 'MONTENEGRO', 'M', '3017693991', 'CRA 5C # 20C1 BIS 26 - SICARARE', '1993-10-24', 'SIS', 'EST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `id_programa` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `id_facultad` varchar(10) NOT NULL,
  PRIMARY KEY (`id_programa`),
  KEY `id_facultad_pro_idx` (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id_programa`, `nombre`, `id_facultad`) VALUES
('SIS', 'INGENIERÍA DE SISTEMAS', 'ING');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `archivo` blob,
  `tipoUnidad` varchar(15) NOT NULL,
  PRIMARY KEY (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_persona`
--

CREATE TABLE IF NOT EXISTS `proyecto_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_persona` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto_pp_idx` (`id_proyecto`),
  KEY `id_persona_pp_idx` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_unidad`
--

CREATE TABLE IF NOT EXISTS `rol_unidad` (
  `idrol_unidad` varchar(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `idrol_usuario` varchar(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`idrol_usuario`, `nombre`) VALUES
('EST', 'ESTUDIANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--

CREATE TABLE IF NOT EXISTS `tipo_evento` (
  `idtipo_evento` varchar(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipo_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_evento`
--

INSERT INTO `tipo_evento` (`idtipo_evento`, `nombre`) VALUES
('CON', 'CONGRESO'),
('SEM', 'SEMINARIO'),
('TDG', 'TESIS DE GRADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_unidad`
--

CREATE TABLE IF NOT EXISTS `tipo_unidad` (
  `id_tipoUnidad` varchar(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadinvestigacion`
--

CREATE TABLE IF NOT EXISTS `unidadinvestigacion` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` mediumtext,
  `id_programa` varchar(10) NOT NULL,
  `tipoUnidad` varchar(5) NOT NULL,
  PRIMARY KEY (`id_unidad`),
  KEY `id_programa_sem_idx` (`id_programa`),
  KEY `idTipoUnidad_fk_unidad_idx` (`tipoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(15) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idPersona_UNIQUE` (`idPersona`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `idPersona_fk_comentario` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `idtipo_evento_eve` FOREIGN KEY (`idtipo_evento`) REFERENCES `tipo_evento` (`idtipo_evento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_lugar_eve` FOREIGN KEY (`id_lugar`) REFERENCES `lugar` (`id_lugar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `integrante_semillero`
--
ALTER TABLE `integrante_semillero`
  ADD CONSTRAINT `id_persona_int` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_rolUnidad_int` FOREIGN KEY (`id_rolUnidad`) REFERENCES `rol_unidad` (`idrol_unidad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_unidad_int` FOREIGN KEY (`id_unidad`) REFERENCES `unidadinvestigacion` (`id_unidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `idpersona_fk_noticia` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idunidad_fk_noticia` FOREIGN KEY (`id_unidad`) REFERENCES `unidadinvestigacion` (`id_unidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `id_evento_par` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_persona_paar` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `idrol_usuario` FOREIGN KEY (`idrol_usuario`) REFERENCES `rol_usuario` (`idrol_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_programa_per` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id_programa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `id_facultad_pro` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto_persona`
--
ALTER TABLE `proyecto_persona`
  ADD CONSTRAINT `id_persona_pp` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_proyecto_pp` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `unidadinvestigacion`
--
ALTER TABLE `unidadinvestigacion`
  ADD CONSTRAINT `idTipoUnidad_fk_unidad` FOREIGN KEY (`tipoUnidad`) REFERENCES `tipo_unidad` (`id_tipoUnidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_idPersona_usuario` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
