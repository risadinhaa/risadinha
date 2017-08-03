-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: risadinha
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `comentar`
--

DROP TABLE IF EXISTS `comentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentar` (
  `cod_usuario` varchar(100) DEFAULT NULL,
  `cod_comentario` varchar(100) NOT NULL,
  `cod_publicacao` varchar(100) DEFAULT NULL,
  `data_hora` time DEFAULT NULL,
  PRIMARY KEY (`cod_comentario`),
  KEY `fk_comentar` (`cod_publicacao`),
  KEY `fk_usuario_coment` (`cod_usuario`),
  CONSTRAINT `fk_comentar` FOREIGN KEY (`cod_publicacao`) REFERENCES `publicacao` (`cod_publicacao`),
  CONSTRAINT `fk_usuario_coment` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentar`
--

LOCK TABLES `comentar` WRITE;
/*!40000 ALTER TABLE `comentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartilhar`
--

DROP TABLE IF EXISTS `compartilhar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compartilhar` (
  `cod_publicacao` varchar(100) DEFAULT NULL,
  `cod_usuario` varchar(100) DEFAULT NULL,
  `data_hora` time DEFAULT NULL,
  KEY `fk_publicacao_comp` (`cod_publicacao`),
  KEY `fk_usuario_compartilhar` (`cod_usuario`),
  CONSTRAINT `fk_publicacao_comp` FOREIGN KEY (`cod_publicacao`) REFERENCES `publicacao` (`cod_publicacao`),
  CONSTRAINT `fk_usuario_compartilhar` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartilhar`
--

LOCK TABLES `compartilhar` WRITE;
/*!40000 ALTER TABLE `compartilhar` DISABLE KEYS */;
/*!40000 ALTER TABLE `compartilhar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtir`
--

DROP TABLE IF EXISTS `curtir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curtir` (
  `cod_publicacao` varchar(100) NOT NULL,
  `cod_usuario` varchar(100) NOT NULL,
  `data_hora` time DEFAULT NULL,
  PRIMARY KEY (`cod_publicacao`,`cod_usuario`),
  KEY `fk_usuario_curtir` (`cod_usuario`),
  CONSTRAINT `fk_publicacao` FOREIGN KEY (`cod_publicacao`) REFERENCES `publicacao` (`cod_publicacao`),
  CONSTRAINT `fk_publicacao_like` FOREIGN KEY (`cod_publicacao`) REFERENCES `publicacao` (`cod_publicacao`),
  CONSTRAINT `fk_usuario_curtir` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtir`
--

LOCK TABLES `curtir` WRITE;
/*!40000 ALTER TABLE `curtir` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao`
--

DROP TABLE IF EXISTS `publicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacao` (
  `cod_publicacao` varchar(100) NOT NULL,
  `cod_usuario` varchar(100) DEFAULT NULL,
  `data_hora` time DEFAULT NULL,
  PRIMARY KEY (`cod_publicacao`),
  KEY `fk_usuario_pub` (`cod_usuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`),
  CONSTRAINT `fk_usuario_pub` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao`
--

LOCK TABLES `publicacao` WRITE;
/*!40000 ALTER TABLE `publicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` varchar(100) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_nascimento` decimal(10,0) DEFAULT NULL,
  `apelido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
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

-- Dump completed on 2017-08-03 10:15:37
