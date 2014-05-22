-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2014 a las 00:57:59
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `palace`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` varchar(15) NOT NULL,
  `idCliente` varchar(15) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `idPersona_fk_cita_idx` (`idPersona`),
  KEY `idServicio_fk_cita_idx` (`idServicio`),
  KEY `idCliente_fk_cita_idx` (`idCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`idCita`, `idPersona`, `idCliente`, `idServicio`, `fecha`, `hora`, `estado`) VALUES
(2, '111', '777', 569, '2014-05-22', '08:00:00', 'reservado'),
(3, '111', '777', 569, '2014-05-22', '16:20:00', 'reservado'),
(4, '111', '777', 569, '2014-05-22', '10:00:00', 'reservado'),
(5, '111', '777', 569, '2014-05-22', '23:30:00', 'reservado'),
(6, '111', '777', 569, '2014-05-22', '11:00:00', 'reservado'),
(7, '111', '777', 569, '2014-05-22', '00:00:00', 'reservado'),
(8, '111', '777', 569, '2014-05-22', '14:00:00', 'reservado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_producto`
--

CREATE TABLE IF NOT EXISTS `detalles_producto` (
  `idFactura` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioVenta` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`idProducto`),
  KEY `idProducto_fk_dp_idx` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles_producto`
--

INSERT INTO `detalles_producto` (`idFactura`, `idProducto`, `cantidad`, `precioVenta`) VALUES
(16, 100, 2, 500),
(16, 503, 1, 500),
(17, 100, 2, 500),
(17, 503, 1, 500),
(18, 100, 2, 500),
(18, 400, 1, 1500),
(18, 502, 4, 500),
(19, 100, 1, 500),
(19, 500, 2, 1000),
(19, 506, 2, 500),
(20, 100, 5, 500),
(21, 100, 5, 500),
(22, 100, 3, 500),
(23, 100, 3, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_servicio`
--

CREATE TABLE IF NOT EXISTS `detalles_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFactura` int(11) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `idPersona` varchar(15) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idServicio_fk_ds_idx` (`idServicio`),
  KEY `idPersona_fk_ds_idx` (`idPersona`),
  KEY `idFactura_fk_ds_idx` (`idFactura`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `detalles_servicio`
--

INSERT INTO `detalles_servicio` (`id`, `idFactura`, `idServicio`, `idPersona`, `precio`) VALUES
(1, 16, 123, '111', 800),
(2, 16, 123, '111', 800),
(3, 18, 234, '222', 900),
(4, 19, 123, '111', 800),
(5, 22, 234, '222', 1500),
(6, 23, 234, '222', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idPersona_fk_factura_idx` (`idPersona`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `idPersona`, `fecha`, `hora`) VALUES
(16, '123', '2014-05-17', '09:53:40'),
(17, '123', '2014-05-17', '09:53:57'),
(18, '111', '2014-05-17', '10:49:56'),
(19, '222', '2014-05-17', '10:50:22'),
(20, '123456', '2014-05-18', '15:01:58'),
(21, '123456', '2014-05-18', '15:02:41'),
(22, '111', '2014-05-21', '16:24:28'),
(23, '111', '2014-05-21', '16:24:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_producto`
--

CREATE TABLE IF NOT EXISTS `ingreso_producto` (
  `idIngreso` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `precioFabrica` int(11) NOT NULL,
  PRIMARY KEY (`idIngreso`),
  KEY `idProducto_fk_ip_idx` (`idProducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `ingreso_producto`
--

INSERT INTO `ingreso_producto` (`idIngreso`, `idProducto`, `cantidad`, `fechaIngreso`, `precioFabrica`) VALUES
(1, 100, 500, '2014-04-15', 300),
(2, 200, 300, '2014-04-05', 200),
(3, 300, 400, '2014-04-05', 400),
(4, 400, 100, '2014-04-05', 100),
(5, 500, 450, '2014-04-05', 450),
(6, 507, 500, '2014-05-11', 200),
(7, 100, 500, '2014-05-18', 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` varchar(15) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `pApellido` varchar(45) NOT NULL,
  `sApellido` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `fNacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `nombres`, `pApellido`, `sApellido`, `sexo`, `fNacimiento`, `telefono`, `celular`, `direccion`, `correo`) VALUES
('1065657930', 'Carlos', 'Jimenez', 'Montenegro', 'M', '0000-00-00', '123123', '213', 'dsad', 'sda@ds.com'),
('111', 'Pedro', 'Perez', 'Paramo', 'M', '2014-04-01', '3464567', '678934', 'calle 111', 'laksdfh'),
('123', 'kju', 'uiulu', 'liulu', 'M', '0000-00-00', '21321', '123', 'dasdj', 'kdsaj@dsadl.com'),
('1234', 'kju', 'uiulu', 'liulu', 'M', '2014-12-31', '21321', '123', 'dasdj', 'kdsaj@dsadll.com'),
('123456', '', 'Martinez', 'Montenegro', 'M', '1005-02-12', '234234343', '11212339204', 'sadsakjlew', 'sdlksjaldksa@live.com'),
('12345678', 'dalksdjl', 'jlsdajdl', 'jldsjaldj', 'M', '2014-12-31', '1233', '313', 'ldsajl', 'askljd@hotmail.com'),
('123456789', 'jose', 'dakdj', 'kjdaskdj', 'M', '2014-12-31', '323', '3213', 'sdasd', 'dsakjdq@jakdasd.cm'),
('1343241', 'ajsdasdj', 'dsajdjj', 'jsakjd', 'M', '2014-12-31', '123123', '12313', 'sadad', 'dasd@ad.com'),
('21334', 'jdsa', 'dsad', 'dasdas', 'M', '2014-12-31', '23123', '3213', 'dsakldk', 'dlasdklk@asdasd.com'),
('222', 'Andy', 'Bolaños', 'Castilla', 'M', '2014-04-08', '6578981234', '0987676', 'calle 222', 'sdkjfhsdf'),
('234234', 'kdjalkdj', 'lkdjsaldkjl', 'kjdlaksjd', 'M', '2014-12-31', '123123', '3132', 'dsad', 'dadjqa@jdaskd.com'),
('3123', 'sjadkjkj', 'kdsajdkj', 'kdjsakdj', 'M', '2014-12-31', '312313', '1233', 'kdsajkdj', 'dkajd@aldk.com'),
('3124324', 'jaskdjkjdask', 'jdkdjkasjd', 'kjsakjd', 'M', '2014-12-31', '132123', '3123', 'dasd', 'dajkd@hotmail.com'),
('321', 'ssdjkaj', 'kasdkajds', 'dkjkdajd', 'M', '2014-12-31', '21313', '123', 'lkdasldk', 'dasd@dsaldj.com'),
('3213123', 'sadasdd', 'dsad', 'kdsada', 'M', '2014-12-31', '213123', '3213', 'dad', 'ddasd@dasl.com'),
('324', 'dksadjk', 'jkdsajkjk', 'kdjksjdk', 'M', '2014-12-31', '313', '12313', 'sajdkjads', 'aksdjqd@dsakjd.com'),
('333', 'Jose ', 'Jimenez', 'Montenegro', 'M', '2014-04-06', '2309867', '8237456', 'calle 333', 'laskdfhkjads'),
('34324', 'ldkad', 'lkdjalkdj', 'ldkjlj', 'M', '2014-12-31', '213123', '2131', 'asdasdkj', 'kadjkaqq@jksad.com'),
('3871283', 'isaukdjkj', 'kjkdajkdj', 'kjdsakjd', 'M', '2014-01-01', '3213', '3213', 'kjdaskdj', 'kjdas@hotmail.com'),
('39460556', 'Auris ', 'Parody', 'aaron', 'F', '1991-07-18', '320320320', '343456', 'calle 45 # 23 - 77', 'amparody@hotmail.com'),
('4234234234', 'dasdkj', 'kajd', 'kjdaskdj', 'M', '2014-12-31', '12312', '3123', 'djkajd', 'kdjaskj@hotmail.com'),
('4321', 'dad', 'dsad', 'dsad', 'M', '2014-12-31', '231', '1233', 'dasd', 'dsdad@asd.com'),
('43211', 'jose', 'carrillo', 'lopez', 'M', '2014-12-31', '1234', '323', 'dsad', 'asd@das.com'),
('432421', 'kjdsakdj', 'kdjksajdk', 'jkdsajdk', 'M', '2014-12-31', '21312', '213', 'dasd', 'dasd@dakd.com'),
('444', 'Juan', 'Martinez', 'Oñate', 'M', '2014-04-04', '09328745', '4688797', 'Calle 444', 'wkegfihdfs'),
('543231', 'dkjdkasjk', 'djskadjk', 'jdksjadkj', 'M', '2014-12-31', '3123', '1231', 'kajdk', 'jdaskdjq@jdadj.com'),
('555', 'Maria', 'Oñate', 'Fernandez', 'F', '2014-04-07', '346875', '67891234', 'calle 555', 'lasdhfkljdsaf'),
('777', 'jdahskdhj', 'kjdhsakdjh', 'kjhdaskdjh', 'M', '0000-00-00', '3123', '231', 'dkjd', 'dsa@kadk.com'),
('823', 'jdkadj', 'kjdsakdj', 'kjdkasjd', 'M', '2014-12-31', '12312', '3213', 'ldakdl', 'jdado@dkad.com'),
('831283', 'adhasjkdh', 'kjdhsakdhk', 'hdksajdkh', 'M', '2014-12-31', '3213', '3123', 'alsdkl', 'asldk@hotm.com'),
('87878978', 'ghjghjhj', 'ghjgjgjh', 'gjhjgjh', 'M', '2006-05-04', '678678687', '8979879', 'dfgdgf', 'dfdgfdg@ddd.com'),
('888', 'slkajdl', 'kjdslakjd', 'lkdjsald', 'M', '0000-00-00', '123123', '3213', 'dasd', 'dasd@dad.com'),
('999', 'kju', 'uiulu', 'liulu', 'M', '0000-00-00', '21321', '123', 'dasdj', 'kdsaj@dsad.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `precioVenta` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=509 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `precioVenta`, `unidades`) VALUES
(100, 'Shampoo HyS', 500, 389),
(200, 'Acondicionador Loreal', 600, 0),
(300, 'Crema Pantene', 800, 0),
(400, 'Ampolla Loreal', 1500, 0),
(500, 'Gel Rolda', 1000, 0),
(501, 'Ampolla Sol', 500, 0),
(502, 'Ampolla X', 500, 0),
(503, 'ampolla x', 500, 0),
(504, 'ampolla Y', 500, 0),
(505, 'ampolla z', 600, 0),
(506, 'juan', 500, 0),
(507, 'dasd', 213, 0),
(508, 'salpicon', 123, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` varchar(5) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombre`) VALUES
('001', 'Administrador'),
('002', 'Empleado'),
('003', 'Medico'),
('004', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_persona`
--

CREATE TABLE IF NOT EXISTS `rol_persona` (
  `idPersona` varchar(15) NOT NULL,
  `idRol` varchar(5) NOT NULL,
  PRIMARY KEY (`idPersona`,`idRol`),
  KEY `idRol_fk_rp_idx` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_persona`
--

INSERT INTO `rol_persona` (`idPersona`, `idRol`) VALUES
('444', '001'),
('111', '002'),
('123456789', '002'),
('222', '002'),
('234234', '002'),
('321', '002'),
('324', '002'),
('333', '002'),
('3871283', '002'),
('43211', '002'),
('432421', '002'),
('543231', '002'),
('831283', '002'),
('12345678', '003'),
('1343241', '003'),
('3123', '003'),
('3213123', '003'),
('555', '003'),
('1065657930', '004'),
('1234', '004'),
('123456', '004'),
('21334', '004'),
('39460556', '004'),
('777', '004'),
('87878978', '004'),
('888', '004'),
('999', '004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tiempo` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=570 ;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `nombre`, `tiempo`, `precio`) VALUES
(123, 'Cepillado', 50, 800),
(234, 'Corte de Cabello', 30, 900),
(345, 'Masaje Relajante', 60, 1500),
(456, 'Manicure', 30, 900),
(567, 'Pedicure', 40, 1000),
(568, 'tratamiento capilar', 60, 70000),
(569, 'tt', 80, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_cita`
--

CREATE TABLE IF NOT EXISTS `servicios_cita` (
  `idCita` int(11) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `idPersona` varchar(15) NOT NULL,
  PRIMARY KEY (`idCita`,`idServicio`,`idPersona`),
  KEY `idServicio_fk_sc_idx` (`idServicio`),
  KEY `idPersona_fk_sc_idx` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_empleado`
--

CREATE TABLE IF NOT EXISTS `servicio_empleado` (
  `idPersona` varchar(15) NOT NULL,
  `idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idPersona`,`idServicio`),
  KEY `idServicio_fk_se_idx` (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicio_empleado`
--

INSERT INTO `servicio_empleado` (`idPersona`, `idServicio`) VALUES
('3871283', 123),
('831283', 123),
('222', 234),
('3871283', 234),
('43211', 234),
('333', 345),
('3871283', 345),
('43211', 345),
('831283', 345),
('43211', 456),
('222', 567),
('111', 569);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idPersona` varchar(15) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idPersona`, `usuario`, `clave`) VALUES
('111', 'admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `idCliente_fk_cita` FOREIGN KEY (`idCliente`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idPersona_fk_cita` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idServicio_fk_cita` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_producto`
--
ALTER TABLE `detalles_producto`
  ADD CONSTRAINT `idFactura_fk_dp` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idProducto_fk_dp` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_servicio`
--
ALTER TABLE `detalles_servicio`
  ADD CONSTRAINT `idFactura_fk_ds` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idPersona_fk_ds` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idServicio_fk_ds` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `idPersona_fk_factura` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingreso_producto`
--
ALTER TABLE `ingreso_producto`
  ADD CONSTRAINT `idProducto_fk_ip` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol_persona`
--
ALTER TABLE `rol_persona`
  ADD CONSTRAINT `idPersona_fk_rp` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idRol_fk_rp` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_cita`
--
ALTER TABLE `servicios_cita`
  ADD CONSTRAINT `idCita_fk_sc` FOREIGN KEY (`idCita`) REFERENCES `cita` (`idCita`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idPersona_fk_sc` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idServicio_fk_sc` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio_empleado`
--
ALTER TABLE `servicio_empleado`
  ADD CONSTRAINT `idPersona_fk_se` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `idServicio_fk_se` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `idPersona_fk_usario` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
