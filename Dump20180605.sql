CREATE DATABASE  IF NOT EXISTS `easyservices` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `easyservices`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: easyservices
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idadministrador` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idadministrador`),
  KEY `fk_usuario_administrador_idx` (`idusuario`),
  CONSTRAINT `FKpakt4kik3mkhukfcnsmk09i41` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_usuario_administrador` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `iddepartamento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudad_departamento_idx` (`iddepartamento`),
  CONSTRAINT `FKgw4gea23qxv2ao7l6q4elejj6` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`),
  CONSTRAINT `fk_ciudad_departamento` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,1,'chorrillos','test'),(2,1,'surco','test');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(11) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_usuario_idx` (`idusuario`),
  CONSTRAINT `FKjh254obpcmi3ylghnyu7h4d5q` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,4,'Lima',2341,321,'jose@hotmail.com','test');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `idlista_empleado_solicitud` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_lista_empleado_idx` (`idlista_empleado_solicitud`),
  CONSTRAINT `FKrwbjj3a1t8w2605lfl23acu52` FOREIGN KEY (`idlista_empleado_solicitud`) REFERENCES `lista_empleado_solicitud` (`idlista_empleado_solicitud`),
  CONSTRAINT `fk_lista_empleado` FOREIGN KEY (`idlista_empleado_solicitud`) REFERENCES `lista_empleado_solicitud` (`idlista_empleado_solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `idpais` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`),
  KEY `fk_departamento_pais_idx` (`idpais`),
  CONSTRAINT `FK7fbkenegc7ikam5r335cl639v` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`),
  CONSTRAINT `fk_departamento_pais` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,1,'lima','test'),(2,1,'tacna','test');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_usuario_idx` (`idusuario`),
  CONSTRAINT `FK1nvk2x45abn0gdt6bwnxnu2hr` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idtipo_empresa` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `RUC` varchar(11) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion_principal` varchar(100) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `hora_inicio` int(11) NOT NULL,
  `hora_fin` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `fk_usuario_idx` (`idusuario`),
  KEY `fk_tipo_empresa_idx` (`idtipo_empresa`),
  CONSTRAINT `FKmpldeixvbo6ivf6ecmuh6nkb5` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `FKorvgwb8obnx93730elsbywq1h` FOREIGN KEY (`idtipo_empresa`) REFERENCES `tipo_empresa` (`idtipo_empresa`),
  CONSTRAINT `fk_tipo_empresa` FOREIGN KEY (`idtipo_empresa`) REFERENCES `tipo_empresa` (`idtipo_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_empresa` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,4,1,'LabService','12311',124123,123213,'Lima',3,7,22,'lab@hotmail.com','test'),(2,4,2,'GrassService','3243232',12314,324412,'Lima',3,8,20,'grass@hotmail.com','test');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidad` (
  `idespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idespecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'medicina','test'),(2,'electricista','test');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_proceso`
--

DROP TABLE IF EXISTS `estado_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_proceso` (
  `idestado_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idestado_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_proceso`
--

LOCK TABLES `estado_proceso` WRITE;
/*!40000 ALTER TABLE `estado_proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_validar`
--

DROP TABLE IF EXISTS `estado_validar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_validar` (
  `idestado_validar` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idestado_validar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_validar`
--

LOCK TABLES `estado_validar` WRITE;
/*!40000 ALTER TABLE `estado_validar` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_validar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_empleado_solicitud`
--

DROP TABLE IF EXISTS `lista_empleado_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_empleado_solicitud` (
  `idlista_empleado_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `idsolicitud` int(11) NOT NULL,
  `idplantilla` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlista_empleado_solicitud`),
  KEY `id_solicitud_lista_empleado_solicitud_idx` (`idsolicitud`),
  KEY `fk_plantilla_lista_empleado_solicitud_idx` (`idplantilla`),
  CONSTRAINT `FKkr3nfba3wqslnqnkt43buibvs` FOREIGN KEY (`idsolicitud`) REFERENCES `solicitud` (`idsolicitud`),
  CONSTRAINT `FKp13a20q5v578xpb8hlbhl881c` FOREIGN KEY (`idplantilla`) REFERENCES `plantilla` (`idplantilla`),
  CONSTRAINT `fk_plantilla_lista_empleado_solicitud` FOREIGN KEY (`idplantilla`) REFERENCES `plantilla` (`idplantilla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_lista_empleado_solicitud` FOREIGN KEY (`idsolicitud`) REFERENCES `solicitud` (`idsolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_empleado_solicitud`
--

LOCK TABLES `lista_empleado_solicitud` WRITE;
/*!40000 ALTER TABLE `lista_empleado_solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_empleado_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_sucursal`
--

DROP TABLE IF EXISTS `lista_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_sucursal` (
  `idlista_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `idciudad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idpais` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlista_sucursal`),
  KEY `fk_empresa_sucursal_idx` (`idempresa`),
  KEY `FKq5a8ub3e4tju8bkhlu9k3hfn0_idx` (`idciudad`),
  CONSTRAINT `FK2hxrfxfpnqq16w2st511agk2e` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`),
  CONSTRAINT `FK2mqa2pccvecemxypjlf8rhltk` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`),
  CONSTRAINT `FKq5a8ub3e4tju8bkhlu9k3hfn0` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`),
  CONSTRAINT `fk_ciudad_sucursal` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_sucursal` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_sucursal`
--

LOCK TABLES `lista_sucursal` WRITE;
/*!40000 ALTER TABLE `lista_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'peru','test');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantilla`
--

DROP TABLE IF EXISTS `plantilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantilla` (
  `idplantilla` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `idlista_sucursal` int(11) NOT NULL,
  `idestado_validar` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idsolicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`idplantilla`),
  KEY `fk_empresa_plantilla_idx` (`idempresa`),
  KEY `fk_estado_validar_plantilla_idx` (`idestado_validar`),
  KEY `fk_servicio_plantilla_idx` (`idservicio`),
  KEY `fk_lista_sucursal_plantilla_idx` (`idlista_sucursal`),
  KEY `FKnckiw0xhfr1sdkt7e1py2oge` (`idsolicitud`),
  CONSTRAINT `FK7l9b1rb3yqqg2txgoo0xa342x` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`),
  CONSTRAINT `FKeeiyyyv7w4d79sxu9bu6jugsg` FOREIGN KEY (`idlista_sucursal`) REFERENCES `lista_sucursal` (`idlista_sucursal`),
  CONSTRAINT `FKhxy8b4jkhsys38uw6wm5vnafv` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`),
  CONSTRAINT `FKnckiw0xhfr1sdkt7e1py2oge` FOREIGN KEY (`idsolicitud`) REFERENCES `estado_validar` (`idestado_validar`),
  CONSTRAINT `fk_empresa_plantilla` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_validar_plantilla` FOREIGN KEY (`idestado_validar`) REFERENCES `estado_validar` (`idestado_validar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_sucursal_plantilla` FOREIGN KEY (`idlista_sucursal`) REFERENCES `lista_sucursal` (`idlista_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_plantilla` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla`
--

LOCK TABLES `plantilla` WRITE;
/*!40000 ALTER TABLE `plantilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `respuesta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_pregunta_usuario_idx` (`idusuario`),
  CONSTRAINT `FKbesf49khiik6ox76ax0idai75` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fk_pregunta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `extra` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuesta_pregunta_idx` (`idpregunta`),
  CONSTRAINT `FKb511v9x4vgdof1xta8f5hur2x` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`),
  CONSTRAINT `fk_respuesta_pregunta` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idespecialidad` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `fk_especialidad_servicio_idx` (`idespecialidad`),
  KEY `fk_empleado_servicio_idx` (`idempleado`),
  CONSTRAINT `FKhdui7pgpdlav9u8jrh9j2ghal` FOREIGN KEY (`idespecialidad`) REFERENCES `especialidad` (`idespecialidad`),
  CONSTRAINT `FKsa8426rdqs5h433ynql0w04n5` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`),
  CONSTRAINT `fk_empleado_servicio` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_especialidad_servicio_tabla` FOREIGN KEY (`idespecialidad`) REFERENCES `especialidad` (`idespecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `idsolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idestadovalidar_cliente` int(11) NOT NULL,
  `idestadovalidar_empresa` int(11) NOT NULL,
  `idestado_proceso` int(11) NOT NULL,
  `fecha_solicitado` date NOT NULL,
  `fecha_aprobado` date DEFAULT NULL,
  `fecha_atencion` date DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsolicitud`),
  KEY `fk_cliente_solicitud_idx` (`idcliente`),
  KEY `fk_estado_validar_cliente_idx` (`idestadovalidar_cliente`),
  KEY `fk_estado_validar_empresa_idx` (`idestadovalidar_empresa`),
  KEY `fk_estado_proceso_solicitud_idx` (`idestado_proceso`),
  CONSTRAINT `FK6tft8o6u7emfof0x1w8j6uji2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `FK8gtifmqc2g9q5xp47xlkcdw4v` FOREIGN KEY (`idestado_proceso`) REFERENCES `estado_proceso` (`idestado_proceso`),
  CONSTRAINT `FKdsqyeffed2uw05k5jg4nqxblf` FOREIGN KEY (`idestadovalidar_cliente`) REFERENCES `estado_validar` (`idestado_validar`),
  CONSTRAINT `FKrf496iusr7lfd2vlab3oem331` FOREIGN KEY (`idestadovalidar_empresa`) REFERENCES `estado_validar` (`idestado_validar`),
  CONSTRAINT `fk_cliente_solicitud` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_proceso_solicitud` FOREIGN KEY (`idestado_proceso`) REFERENCES `estado_proceso` (`idestado_proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_validar_solicitud_cliente` FOREIGN KEY (`idestadovalidar_cliente`) REFERENCES `estado_validar` (`idestado_validar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_validar_solicitud_empresa` FOREIGN KEY (`idestadovalidar_empresa`) REFERENCES `estado_validar` (`idestado_validar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empresa`
--

DROP TABLE IF EXISTS `tipo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_empresa` (
  `idtipo_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empresa`
--

LOCK TABLES `tipo_empresa` WRITE;
/*!40000 ALTER TABLE `tipo_empresa` DISABLE KEYS */;
INSERT INTO `tipo_empresa` VALUES (1,'compania','test'),(2,'independiente','test');
/*!40000 ALTER TABLE `tipo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idciudad` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `DNI` int(11) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_ciudad_idx` (`idciudad`),
  CONSTRAINT `FK7c5lvmdjhc7ty54qwbjamnfg9` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`),
  CONSTRAINT `fk_usuario_ciudad` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,1,'pctest','123','Jose Ramon',1212314,'1995-05-02 00:00:00','masculino','test');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'easyservices'
--

--
-- Dumping routines for database 'easyservices'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-05 10:28:05
