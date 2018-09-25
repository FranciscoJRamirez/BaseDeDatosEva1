-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: evaluacion_1
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `creditos` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `area` varchar(50) NOT NULL DEFAULT '',
  `cve_carrera` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cve_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `no_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellio` varchar(50) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Perez',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `nombre_cliente` varchar(50) NOT NULL DEFAULT '',
  `fecha` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES ('juanito banana','2018-09-11 00:00:00',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `no_control` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(50) DEFAULT NULL,
  `pais_nacimiento` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `no_telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_control`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES ('16550558','antonia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalles`
--

DROP TABLE IF EXISTS `factura_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_detalles` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `no_factura` int(11) DEFAULT NULL,
  `no_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `no_factura` (`no_factura`),
  KEY `no_producto` (`no_producto`),
  CONSTRAINT `factura_detalles_ibfk_2` FOREIGN KEY (`no_producto`) REFERENCES `productos` (`no_productos`) ON UPDATE CASCADE,
  CONSTRAINT `factura_detalles_ibfk_1` FOREIGN KEY (`no_factura`) REFERENCES `facturas` (`no_factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalles`
--

LOCK TABLES `factura_detalles` WRITE;
/*!40000 ALTER TABLE `factura_detalles` DISABLE KEYS */;
INSERT INTO `factura_detalles` VALUES (3,3,10,5,NULL,32.2);
/*!40000 ALTER TABLE `factura_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `no_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` datetime DEFAULT NULL,
  `no_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_factura`),
  KEY `no_cliente` (`no_cliente`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`no_cliente`) REFERENCES `clientes` (`no_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (3,'2018-09-12 00:00:00',1);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `materia` varchar(50) DEFAULT NULL,
  `salon` varchar(10) DEFAULT NULL,
  `profesor` varchar(50) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `no_control` varchar(20) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre_actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario2`
--

DROP TABLE IF EXISTS `horario2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario2` (
  `cve_horario` int(11) NOT NULL AUTO_INCREMENT,
  `cve_materia` int(11) DEFAULT NULL,
  `cve_carrera` int(11) DEFAULT NULL,
  `no_control` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cve_horario`),
  KEY `cve_materia` (`cve_materia`),
  KEY `cve_carrera` (`cve_carrera`),
  KEY `no_control` (`no_control`),
  CONSTRAINT `horario2_ibfk_3` FOREIGN KEY (`no_control`) REFERENCES `estudiantes` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `horario2_ibfk_1` FOREIGN KEY (`cve_materia`) REFERENCES `materias` (`cve_materia`) ON UPDATE CASCADE,
  CONSTRAINT `horario2_ibfk_2` FOREIGN KEY (`cve_carrera`) REFERENCES `carrera` (`cve_carrera`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario2`
--

LOCK TABLES `horario2` WRITE;
/*!40000 ALTER TABLE `horario2` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(50) DEFAULT ' ',
  `min_salary` int(11) DEFAULT '8000',
  `max_salary` int(11) DEFAULT '20000',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `creditos` int(11) DEFAULT NULL,
  `horas_teorias` int(11) DEFAULT NULL,
  `horas_practicas` int(11) DEFAULT NULL,
  `carrera` varchar(3) DEFAULT NULL,
  `semestre` int(11) NOT NULL DEFAULT '0',
  `cve_materia` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cve_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES ('matematicas',NULL,NULL,NULL,NULL,1,1),('matematicas',NULL,NULL,NULL,NULL,2,2);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nueva_carrera`
--

DROP TABLE IF EXISTS `nueva_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nueva_carrera` (
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nueva_carrera`
--

LOCK TABLES `nueva_carrera` WRITE;
/*!40000 ALTER TABLE `nueva_carrera` DISABLE KEYS */;
INSERT INTO `nueva_carrera` VALUES ('Sistemas',500,9,'Sistemas y computacion'),('Sistemas',500,9,'Sistemas y computacion'),('Sistemas',500,9,'Sistemas y computacion');
/*!40000 ALTER TABLE `nueva_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nueva_carrerita`
--

DROP TABLE IF EXISTS `nueva_carrerita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nueva_carrerita` (
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nueva_carrerita`
--

LOCK TABLES `nueva_carrerita` WRITE;
/*!40000 ALTER TABLE `nueva_carrerita` DISABLE KEYS */;
/*!40000 ALTER TABLE `nueva_carrerita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `clave` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `poblacion` int(11) DEFAULT '1',
  `continente` enum('Africa','America','Asia','Oceania','Europa') NOT NULL DEFAULT 'Africa',
  PRIMARY KEY (`nombre`,`continente`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paisesnew`
--

DROP TABLE IF EXISTS `paisesnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paisesnew` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `poblacion` int(11) DEFAULT '1',
  `continente` enum('AFRICA','AMERICA','ASIA','OCEANIA','EUROPA') DEFAULT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paisesnew`
--

LOCK TABLES `paisesnew` WRITE;
/*!40000 ALTER TABLE `paisesnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `paisesnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `clave` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('Jonh','jonhson','sistemas',5000,1),('jose',NULL,NULL,NULL,2),('juan',NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal2`
--

DROP TABLE IF EXISTS `personal2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal2` (
  `clave` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `departamento` enum('SISTEMAS','CONTA','INHUMANOS','PRODUCCION') DEFAULT NULL,
  `salario` float DEFAULT '15000',
  `RFC` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`,`apellido`),
  UNIQUE KEY `RFC` (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal2`
--

LOCK TABLES `personal2` WRITE;
/*!40000 ALTER TABLE `personal2` DISABLE KEYS */;
INSERT INTO `personal2` VALUES (7,'francisco','ramirez','SISTEMAS',15000,'ralf9710242alm');
/*!40000 ALTER TABLE `personal2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `no_productos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`no_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (10,'lamo',105.32);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-13 13:21:19
