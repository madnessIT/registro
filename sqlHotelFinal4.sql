CREATE DATABASE  IF NOT EXISTS `aljhav5_hostaldb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aljhav5_hostaldb`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hostaldb
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clase_habitacion`
--

DROP TABLE IF EXISTS `clase_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase_habitacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_habitacion`
--

LOCK TABLES `clase_habitacion` WRITE;
/*!40000 ALTER TABLE `clase_habitacion` DISABLE KEYS */;
INSERT INTO `clase_habitacion` VALUES (1,'Simple'),(2,'Familiar'),(3,'Doble'),(4,'Triple');
/*!40000 ALTER TABLE `clase_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'luis','321','ffda@mail.com',NULL,NULL,NULL,NULL),(2,'luis','3211','ffda@mail.com',NULL,NULL,NULL,NULL),(3,'luis','3211','ffda@mail.com',NULL,NULL,NULL,NULL),(4,'AAA','WQR','qerasdf',NULL,NULL,NULL,NULL),(5,'juan perez','3141232','jj@gmai.com',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `cli_cuenta_idx` (`cliente_resp`),
  CONSTRAINT `cli_cuenta` FOREIGN KEY (`cliente_resp`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (29,NULL,'2015-11-11','2015-11-18','2015-11-20',2,'231231','2015-11-27','juan','perez','2321','','boa','a78','00:00:00','Germany',NULL,NULL,'juan perez','jj@gmai.com','3141232','2015-11-15',2,5,'OCUPADO','',520,1988,0);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadia`
--

DROP TABLE IF EXISTS `estadia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `estadia_cuenta_fk_idx` (`idReserva`),
  CONSTRAINT `estadia_cuenta_fk` FOREIGN KEY (`idReserva`) REFERENCES `cuenta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hab_reserva` FOREIGN KEY (`habitacion`) REFERENCES `habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadia`
--

LOCK TABLES `estadia` WRITE;
/*!40000 ALTER TABLE `estadia` DISABLE KEYS */;
INSERT INTO `estadia` VALUES (18,4,'OCUPADO','2015-11-18','',29,'2015-11-18','2015/11/15',NULL,NULL,NULL),(19,6,'OCUPADO','2015-11-18','',29,'2015-11-18','2015/11/15',NULL,NULL,NULL);
/*!40000 ALTER TABLE `estadia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
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
  KEY `tipo_habFK_idx` (`tipo_habitacion`),
  CONSTRAINT `clase_habFK` FOREIGN KEY (`tipo_habitacion`) REFERENCES `clase_habitacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` (`id`, `codigo`, `tipo`, `tipo_banio`, `frigobar`, `sofa_cama`, `cama_Extra`, `nr_simples`, `nro_matrimniales`, `tipo_habitacion`, `tarifa`) VALUES
(0, '203', 'TRIPLE', 'COMPARTIDO', b'0', b'0', b'0', 3, 0, 4, '250'),
(1, '102', 'DOBLE', 'COMPARTIDO', b'1', b'0', b'0', 2, 0, 3, '180'),
(2, '103', 'TRIPLE', 'COMPARTIDO', b'0', b'0', b'0', 3, 0, 4, '140'),
(3, '104', 'DOBLE', 'PRIVADO', b'0', b'1', b'0', 0, 1, 3, '120'),
(4, '105', 'TRIPLE', 'PRIVADO', b'1', b'0', b'1', 1, 1, 4, '160'),
(5, '201', 'SIMPLE', 'COMPARTIDO', b'0', b'0', b'0', 1, 0, 1, '90'),
(6, '202', 'DOBLE', 'COMPARTIDO', b'0', b'0', b'0', 2, 0, 3, '100'),
(7, '204', 'FAMILIAR', 'COMPARTIDO', b'0', b'0', b'0', 4, 0, 2, '320'),
(8, '205', 'DOBLE', 'PRIVADO', b'0', b'0', b'0', 2, 0, 3, '280'),
(9, '206', 'TRIPLE', 'PRIVADO', b'0', b'0', b'0', 1, 1, 4, '320'),
(10, '207', 'TRIPLE', 'PRIVADO', b'0', b'0', b'0', 1, 1, 4, '320'),
(11, '208', 'DOBLE', 'COMPARTIDO', b'0', b'0', b'0', 0, 1, 3, '180'),
(12, '209', 'FAMILIAR', 'COMPARTIDO', b'0', b'0', b'0', 5, 0, 2, '600'),
(13, '210', 'FAMILIAR', 'COMPARTIDO', b'0', b'0', b'0', 5, 0, 2, '600');
UNLOCK TABLES;

--
-- Table structure for table `ocupantes`
--

DROP TABLE IF EXISTS `ocupantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `ocu_estadia_idx` (`id_estadia`),
  CONSTRAINT `ocu_estadia` FOREIGN KEY (`id_estadia`) REFERENCES `estadia` (`id_estadia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupantes`
--

LOCK TABLES `ocupantes` WRITE;
/*!40000 ALTER TABLE `ocupantes` DISABLE KEYS */;
INSERT INTO `ocupantes` VALUES (40,'juan','perez','','2015-11-15',18,'9281',NULL),(41,'maria','perez','','2015-11-15',18,'02831',NULL),(42,'marcia','lopez','','2015-11-15',19,'8913',NULL),(43,'sergio','doynel','','2015-11-15',19,'1131',NULL);
/*!40000 ALTER TABLE `ocupantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `reserva_pedido_idx` (`idReserva`),
  CONSTRAINT `prod_pedido` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reserva_pedido` FOREIGN KEY (`idReserva`) REFERENCES `estadia` (`id_estadia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (10,18,1,1,'2015-11-15 00:00:00',2,2),(11,19,2,2,'2015-11-15 00:00:00',3,6),(12,19,4,2,'2015-11-15 00:00:00',990,1980);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `servicio` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'test','test','test','1','ADMINISTRADOR'),(2,'admin','admin','admin','1','ADMINISTRADOR');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 22:49:44
