-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2015 a las 20:13:33
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `aljhav5_hostaldb`
--
CREATE DATABASE IF NOT EXISTS `aljhav5_hostaldb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aljhav5_hostaldb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_habitacion`
--

DROP TABLE IF EXISTS `clase_habitacion`;
CREATE TABLE `clase_habitacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clase_habitacion`
--

INSERT INTO `clase_habitacion` (`id`, `descripcion`) VALUES
(1, 'SIMPLE'),
(2, 'FAMILIAR'),
(3, 'DOBLE'),
(4, 'TRIPLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `procedencia` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `doc_identidad` varchar(45) DEFAULT NULL,
  `profesion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `telefono`, `email`, `procedencia`, `nacionalidad`, `doc_identidad`, `profesion`) VALUES
(1, 'luis', '321', 'ffda@mail.com', NULL, NULL, NULL, NULL),
(2, 'luis', '3211', 'ffda@mail.com', NULL, NULL, NULL, NULL),
(3, 'luis', '3211', 'ffda@mail.com', NULL, NULL, NULL, NULL),
(4, 'AAA', 'WQR', 'qerasdf', NULL, NULL, NULL, NULL),
(5, 'juan perez', '3141232', 'jj@gmai.com', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tpo_contacto` varchar(45) DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `noches` int(11) DEFAULT NULL,
  `numero_tarjeta` varchar(45) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `firstname_tarjeta` varchar(45) DEFAULT NULL,
  `lastname_tarjeta` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `servicio_recojo` bit(1) DEFAULT b'0',
  `aerolinea` varchar(45) DEFAULT NULL,
  `vuelo` varchar(45) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `desde` varchar(45) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `responsable` varchar(45) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `numero_personas` int(11) DEFAULT '0',
  `cliente_resp` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `pago_tarjeta` bit(1) DEFAULT b'0',
  `costo_estadia` int(11) DEFAULT '0',
  `costo_serviciosExtra` int(11) DEFAULT '0',
  `total_pagado` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cli_cuenta_idx` (`cliente_resp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `tpo_contacto`, `fecha_llegada`, `fecha_ingreso`, `fecha_salida`, `noches`, `numero_tarjeta`, `exp_date`, `firstname_tarjeta`, `lastname_tarjeta`, `codigo`, `servicio_recojo`, `aerolinea`, `vuelo`, `hora`, `desde`, `observacion`, `responsable`, `nombre`, `email`, `telefono`, `fecha_reserva`, `numero_personas`, `cliente_resp`, `estado`, `pago_tarjeta`, `costo_estadia`, `costo_serviciosExtra`, `total_pagado`) VALUES
(29, NULL, '2015-11-11', '2015-11-18', '2015-11-20', 2, '231231', '2015-11-27', 'juan', 'perez', '2321', b'1', 'boa', 'a78', '00:00:00', 'Germany', NULL, NULL, 'juan perez', 'jj@gmai.com', '3141232', '2015-11-15', 2, 5, 'OCUPADO', b'1', 520, 1988, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadia`
--

DROP TABLE IF EXISTS `estadia`;
CREATE TABLE `estadia` (
  `id_estadia` int(11) NOT NULL AUTO_INCREMENT,
  `habitacion` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `con_reserva` bit(1) DEFAULT NULL,
  `idReserva` int(11) DEFAULT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `fecha_registro` varchar(45) DEFAULT NULL,
  `nombre_ocupante` varchar(50) DEFAULT NULL,
  `apellido_ocupante` varchar(50) DEFAULT NULL,
  `doc_identificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estadia`),
  KEY `hab_reserva_idx` (`habitacion`),
  KEY `estadia_cuenta_fk_idx` (`idReserva`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadia`
--

INSERT INTO `estadia` (`id_estadia`, `habitacion`, `estado`, `fecha_ingreso`, `con_reserva`, `idReserva`, `fecha_egreso`, `fecha_registro`, `nombre_ocupante`, `apellido_ocupante`, `doc_identificacion`) VALUES
(18, 4, 'OCUPADO', '2015-11-18', b'1', 29, '2015-11-18', '2015/11/15', NULL, NULL, NULL),
(19, 6, 'OCUPADO', '2015-11-18', b'1', 29, '2015-11-18', '2015/11/15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `tipo_banio` varchar(45) DEFAULT NULL,
  `frigobar` bit(1) DEFAULT b'0',
  `sofa_cama` bit(1) DEFAULT b'0',
  `cama_Extra` bit(1) DEFAULT b'0',
  `nr_simples` int(11) DEFAULT '0',
  `nro_matrimniales` int(11) DEFAULT '0',
  `tipo_habitacion` int(11) DEFAULT '1',
  `tarifa` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tipoHabitacion_idx` (`tipo_banio`),
  KEY `tipo_habFK_idx` (`tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `codigo`, `tipo_banio`, `frigobar`, `sofa_cama`, `cama_Extra`, `nr_simples`, `nro_matrimniales`, `tipo_habitacion`, `tarifa`) VALUES
(0, '203', 'COMPARTIDO', b'0', b'0', b'0', 3, 0, 4, '250'),
(2, '103', 'COMPARTIDO', b'0', b'0', b'0', 3, 0, 4, '140'),
(3, '104', 'PRIVADO', b'0', b'1', b'0', 0, 1, 3, '120'),
(4, '105', 'PRIVADO', b'1', b'0', b'1', 1, 1, 4, '160'),
(5, '201', 'COMPARTIDO', b'0', b'0', b'0', 1, 0, 1, '90'),
(6, '202', 'COMPARTIDO', b'0', b'0', b'0', 2, 0, 3, '100'),
(7, '204', 'COMPARTIDO', b'0', b'0', b'0', 4, 0, 2, '320'),
(8, '205', 'PRIVADO', b'0', b'0', b'0', 2, 0, 3, '280'),
(9, '206', 'PRIVADO', b'0', b'0', b'0', 1, 1, 4, '320'),
(10, '207', 'PRIVADO', b'0', b'0', b'0', 1, 1, 4, '320'),
(11, '208', 'COMPARTIDO', b'0', b'0', b'0', 0, 1, 3, '180'),
(12, '209', 'COMPARTIDO', b'0', b'0', b'0', 5, 0, 2, '600'),
(13, '210', 'COMPARTIDO', b'0', b'0', b'0', 5, 0, 2, '600'),
(102, '102', 'COMPARTIDO', b'1', b'1', b'1', 2, 0, 1, '180');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `habitacion_detalle`
--
DROP VIEW IF EXISTS `habitacion_detalle`;
CREATE TABLE `habitacion_detalle` (
`id` int(11)
,`codigo` varchar(45)
,`tipo_banio` varchar(45)
,`frigobar` bit(1)
,`sofa_cama` bit(1)
,`cama_Extra` bit(1)
,`nr_simples` int(11)
,`nro_matrimniales` int(11)
,`tipo_habitacion` int(11)
,`tarifa` decimal(10,0)
,`tipo` varchar(45)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupantes`
--

DROP TABLE IF EXISTS `ocupantes`;
CREATE TABLE `ocupantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_estadia` int(11) DEFAULT NULL,
  `doc_identidad` varchar(45) DEFAULT NULL,
  `foto` longblob,
  PRIMARY KEY (`id`),
  KEY `ocu_estadia_idx` (`id_estadia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ocupantes`
--

INSERT INTO `ocupantes` (`id`, `nombre`, `apellido`, `estado`, `fecha_registro`, `id_estadia`, `doc_identidad`, `foto`) VALUES
(40, 'juan', 'perez', b'1', '2015-11-15', 18, '9281', NULL),
(41, 'maria', 'perez', b'1', '2015-11-15', 18, '02831', NULL),
(42, 'marcia', 'lopez', b'1', '2015-11-15', 19, '8913', NULL),
(43, 'sergio', 'doynel', b'1', '2015-11-15', 19, '1131', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idReserva` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `precioU` float DEFAULT '0',
  `total` float DEFAULT '0',
  PRIMARY KEY (`idPedido`),
  KEY `prod_pedido_idx` (`idProducto`),
  KEY `reserva_pedido_idx` (`idReserva`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idReserva`, `idProducto`, `cantidad`, `fecha`, `precioU`, `total`) VALUES
(10, 18, 1, 1, '2015-11-15 00:00:00', 2, 2),
(11, 19, 2, 2, '2015-11-15 00:00:00', 3, 6),
(12, 19, 4, 2, '2015-11-15 00:00:00', 990, 1980);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `servicio` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `tipo`, `precio`, `unidad`, `servicio`) VALUES
(0, 'Helado', 'Frigobar', '5', 'Bolsa', b'0'),
(1, 'Almuerzo Ejectivo', 'Restaurante', '2', 'Personal', NULL),
(2, 'Coca Cola mini ', 'Snack', '3', 'Botella', NULL),
(3, 'Sandwinch de pollo', 'Snack', '87', 'Sandwich', NULL),
(4, 'Desayuno continental', 'Restaurante', '990', 'Personal', NULL),
(5, 'Agua', 'Snack', '2', 'Botella', b'1'),
(6, 'Vino Oporto', 'Frigobar', '21', 'Botella', b'1'),
(7, 'Pinnaple Juice', 'Restarurante', '15', 'vaso', NULL),
(8, 'Kiwi Juice', 'Restarurante', '15', 'vaso', NULL),
(9, 'Lemonada', 'Restarurante', '15', 'vaso', NULL),
(10, 'Coffe/tea', 'Restarurante', '10', 'taza', NULL),
(11, 'Cappuchino', 'Restarurante', '20', 'taza', NULL),
(12, 'Corn Soup', 'Restarurante', '15', 'Tazon', NULL),
(13, 'Chicken Soup', 'Restarurante', '25', 'tazon', NULL),
(14, 'Mushroom Soup', 'Restarurante', '15', 'tazon', NULL),
(15, 'Ham & cheese sandwich', 'Restarurante', '25', 'sandwich', NULL),
(16, 'Tuna salad sandwich', 'Restarurante', '30', 'sandwich', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `nombre`, `estado`, `rol`) VALUES
(1, 'test', 'test', 'test', '1', 'ADMINISTRADOR'),
(2, 'admin', 'admin', 'admin', '1', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura para la vista `habitacion_detalle`
--
DROP TABLE IF EXISTS `habitacion_detalle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `habitacion_detalle` AS select `habitacion`.`id` AS `id`,`habitacion`.`codigo` AS `codigo`,`habitacion`.`tipo_banio` AS `tipo_banio`,`habitacion`.`frigobar` AS `frigobar`,`habitacion`.`sofa_cama` AS `sofa_cama`,`habitacion`.`cama_Extra` AS `cama_Extra`,`habitacion`.`nr_simples` AS `nr_simples`,`habitacion`.`nro_matrimniales` AS `nro_matrimniales`,`habitacion`.`tipo_habitacion` AS `tipo_habitacion`,`habitacion`.`tarifa` AS `tarifa`,`clase_habitacion`.`descripcion` AS `tipo` from (`habitacion` join `clase_habitacion` on((`habitacion`.`tipo_habitacion` = `clase_habitacion`.`id`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cli_cuenta` FOREIGN KEY (`cliente_resp`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estadia`
--
ALTER TABLE `estadia`
  ADD CONSTRAINT `estadia_cuenta_fk` FOREIGN KEY (`idReserva`) REFERENCES `cuenta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hab_reserva` FOREIGN KEY (`habitacion`) REFERENCES `habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `clase_habFK` FOREIGN KEY (`tipo_habitacion`) REFERENCES `clase_habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ocupantes`
--
ALTER TABLE `ocupantes`
  ADD CONSTRAINT `ocu_estadia` FOREIGN KEY (`id_estadia`) REFERENCES `estadia` (`id_estadia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `prod_pedido` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reserva_pedido` FOREIGN KEY (`idReserva`) REFERENCES `estadia` (`id_estadia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
