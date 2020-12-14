-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: livraria
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

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
-- Current Database: `livraria`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `livraria` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `livraria`;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `ida` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Luis Borges Gouveia','Portugues',NULL),(2,'Joao Ranito','Portugues',NULL),(3,'Nuno Magalhães Ribeiro','Português',NULL),(4,'Paulo Rurato','Português',NULL),(5,'Sofia Gaio','Português',NULL),(6,'Rui Moreira','Português',NULL),(7,'Margarida Bairrão','Português',NULL),(8,'Judite Gonçalves de Freitas','Português',NULL),(9,'António Borges Regedor','Português',NULL),(10,'José Dias Coelho','Português',NULL),(11,'Paula Moura','Português',NULL),(12,'Luis Cunha','Português',NULL),(13,'Pereira Alfredo','Angolano',NULL);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `idl` int(11) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `data` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmp` int(11) NOT NULL,
  PRIMARY KEY (`cmp`),
  KEY `idl` (`idl`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idl`) REFERENCES `livro` (`idl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,15,'2019-09-01',1),(2,12,'2019-09-01',2),(8,8,'15',2006),(2,2,'2019-09-01',2013),(1,1,'2019-09-01',2014),(9,9,'15',2017),(10,10,'75',2018);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editora` (
  `ide` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `morada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'spi - Principal',NULL),(2,'Edicoes Universidade Fernando Pessoa',NULL),(3,'Edições GestKnowing',NULL),(4,'VDM — Verlag Dr. Muller',NULL),(5,'Sílabo',NULL),(6,'Green Lines Instituto',NULL),(7,'Lambert Academic Publishing',NULL),(8,'Kwigia editora',NULL);
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escrito`
--

DROP TABLE IF EXISTS `escrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escrito` (
  `idl` int(11) NOT NULL,
  `ida` int(11) NOT NULL,
  PRIMARY KEY (`idl`,`ida`),
  KEY `ida` (`ida`),
  CONSTRAINT `escrito_ibfk_1` FOREIGN KEY (`idl`) REFERENCES `livro` (`idl`),
  CONSTRAINT `escrito_ibfk_2` FOREIGN KEY (`ida`) REFERENCES `autor` (`ida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escrito`
--

LOCK TABLES `escrito` WRITE;
/*!40000 ALTER TABLE `escrito` DISABLE KEYS */;
INSERT INTO `escrito` VALUES (1,1),(2,1),(3,2),(4,3),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,7),(13,7),(14,7),(15,7),(16,8),(17,9),(18,9),(19,10),(20,11),(21,11),(22,11),(23,12),(24,12),(25,13),(26,13),(27,14),(28,14),(29,15);
/*!40000 ALTER TABLE `escrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `idl` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idioma` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Sistemas de Inforamacao de Apoio a Gestao','Portugues','9728830033'),(2,'Cidades e Regioes Digitais:impacte nas cidades e nas pessoas','Portugues','9728830033'),(3,'Informática e Competências Tecnológicas para a Sociedade da Informação','Português','9789728830'),(4,'Readings in Information Society','Inglês','9789728830'),(5,'Sociedade da Informação: balanço e implicações ','Português','9789728830'),(6,'O local e-government: a governação digital na autarquia','Português','9789899936'),(7,'Informática e Competências Tecnológicas para a Sociedade da Informação 2ed','Português','9789728830'),(8,'Negócio Eletrónico - conceitos e perspetivas de desenvolvimento','Português','9789899552'),(9,'Gestão da Informação na Biblioteca Escolar','Português','9789722314'),(10,'A virtual environment to share knowledge','Inglês','9781351729'),(11,'Ciência da Informação: contributos para o seu estudo','Português','9789896430'),(12,'Repensar a Sociedade da Informação e do Conhecimento no Início do Século XXI','Português','9789726186'),(13,'Gestão da Informação em Museus: uma contribuição para o seu estudo','Português','9789899901'),(14,'Web 2.0 and Higher Education. A psychological perspective','Inglês','9783659683'),(15,'Contribuições para a discussão de um modelo de Governo Eletrónico Local para Angola','Português','9789899933');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicado`
--

DROP TABLE IF EXISTS `publicado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicado` (
  `idl` int(11) NOT NULL,
  `ide` int(11) NOT NULL,
  `data` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idl`,`ide`),
  KEY `ide` (`ide`),
  CONSTRAINT `publicado_ibfk_1` FOREIGN KEY (`idl`) REFERENCES `livro` (`idl`),
  CONSTRAINT `publicado_ibfk_2` FOREIGN KEY (`ide`) REFERENCES `editora` (`ide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicado`
--

LOCK TABLES `publicado` WRITE;
/*!40000 ALTER TABLE `publicado` DISABLE KEYS */;
INSERT INTO `publicado` VALUES (1,1,NULL),(2,2,NULL),(3,2,NULL),(4,2,NULL),(5,5,NULL),(6,1,NULL),(7,2,NULL),(8,1,NULL),(9,3,NULL),(10,4,NULL),(11,2,NULL),(12,5,NULL),(13,6,NULL),(14,7,NULL),(15,8,NULL);
/*!40000 ALTER TABLE `publicado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06 17:23:22
