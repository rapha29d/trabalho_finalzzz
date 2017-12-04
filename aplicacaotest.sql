-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aplicacaotest
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB

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
-- Table structure for table `Prova`
--

DROP TABLE IF EXISTS `Prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prova` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  `data_cri` text,
  `nmq` int(11) DEFAULT NULL,
  `categorias` text,
  PRIMARY KEY (`codigo`),
  KEY `fk_Prova_usuario_idx` (`codigo_usuario`),
  CONSTRAINT `fk_Prova_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prova`
--

LOCK TABLES `Prova` WRITE;
/*!40000 ALTER TABLE `Prova` DISABLE KEYS */;
INSERT INTO `Prova` VALUES (1,1,'10/12/2017',4,'Categoria_Grosbilda');
/*!40000 ALTER TABLE `Prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativa`
--

DROP TABLE IF EXISTS `alternativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativa` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alternativa` text,
  `codigo_questao` bigint(20) unsigned DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_questao` (`codigo_questao`),
  CONSTRAINT `fk_alternativa_questao` FOREIGN KEY (`codigo_questao`) REFERENCES `questao` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativa`
--

LOCK TABLES `alternativa` WRITE;
/*!40000 ALTER TABLE `alternativa` DISABLE KEYS */;
INSERT INTO `alternativa` VALUES (1,'teadkajjsdd',1,0),(2,'fghfghfghfh',1,0),(3,'rtgdfdbcvbvb',1,0),(4,'dfgdfnfnisdfs',1,1),(5,'teadkajjsdd',2,0),(6,'fghfghfghfh',2,1),(7,'rtgdfdbcvbvb',2,0),(8,'dfgdfnfnisdfs',2,0),(9,'teadkajjsdd',3,0),(10,'fghfghfghfh',3,0),(11,'rtgdfdbcvbvb',3,1),(12,'dfgdfnfnisdfs',3,0);
/*!40000 ALTER TABLE `alternativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Joao Roberto'),(2,'Ana Maria'),(3,'Jose carlos'),(4,'Antonio silva'),(5,'Carlos Mendez'),(6,'Maria Aparecida'),(7,'Gaspar Alves'),(8,'Balthazar Pereira'),(9,'Belchior Ferreira'),(10,'Madalena Romanoel'),(11,'Fernanda Oliveira'),(12,'Milton Santos'),(13,'Pierre Dulaine'),(14,'Elaine Silva'),(15,'Pedro Antonio'),(16,'Lucas Henrique'),(17,'Aline Monique'),(18,'Erick Humberto'),(19,'Isabela Rodrigues '),(20,'Carlos Leandro'),(21,'teste123');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_disciplina` (
  `codigo_aluno` bigint(20) unsigned NOT NULL,
  `codigo_disciplina` bigint(20) unsigned NOT NULL,
  `matricula` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo_aluno`,`codigo_disciplina`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `codigo_aluno` (`codigo_aluno`,`codigo_disciplina`),
  KEY `fk_disciplina_aluno` (`codigo_disciplina`),
  CONSTRAINT `fk_aluno_disciplina` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `fk_disciplina_aluno` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `descricao` text,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Categoria_Grosbilda','Seilah',1),(2,'Categoria_Estrobilobaldo','Seilah2',2),(3,'Categoria_Zirgonisvaldo','Seilah3',3);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` text,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  `qtdaulas` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  CONSTRAINT `Fk_disciplina_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencia` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qdaulas` int(11) DEFAULT NULL,
  `dataAula` date DEFAULT NULL,
  `matricula` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matricula` (`matricula`),
  CONSTRAINT `fk_fr_ad` FOREIGN KEY (`matricula`) REFERENCES `aluno_disciplina` (`matricula`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencia`
--

LOCK TABLES `frequencia` WRITE;
/*!40000 ALTER TABLE `frequencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel`
--

DROP TABLE IF EXISTS `papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papel` (
  `idPapel` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPapel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel`
--

LOCK TABLES `papel` WRITE;
/*!40000 ALTER TABLE `papel` DISABLE KEYS */;
INSERT INTO `papel` VALUES (1,'admin','Administrador do sistema'),(2,'guest','Visitante do sistema');
/*!40000 ALTER TABLE `papel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel_tem_permissao`
--

DROP TABLE IF EXISTS `papel_tem_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papel_tem_permissao` (
  `papel_idPapel` bigint(20) NOT NULL,
  `permissao_idPermissao` bigint(20) NOT NULL,
  PRIMARY KEY (`papel_idPapel`,`permissao_idPermissao`),
  KEY `fk_papel_has_permissao_permissao1_idx` (`permissao_idPermissao`),
  KEY `fk_papel_has_permissao_papel1_idx` (`papel_idPapel`),
  CONSTRAINT `fk_papel_has_permissao_papel1` FOREIGN KEY (`papel_idPapel`) REFERENCES `papel` (`idPapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_papel_has_permissao_permissao1` FOREIGN KEY (`permissao_idPermissao`) REFERENCES `permissao` (`idPermissao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel_tem_permissao`
--

LOCK TABLES `papel_tem_permissao` WRITE;
/*!40000 ALTER TABLE `papel_tem_permissao` DISABLE KEYS */;
INSERT INTO `papel_tem_permissao` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `papel_tem_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao` (
  `idPermissao` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1,'*','pode fazer o que quiser'),(2,'visitante:*','pode fazer tudo que um visitante pode');
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova_questao`
--

DROP TABLE IF EXISTS `prova_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova_questao` (
  `codigo_prova` bigint(20) unsigned NOT NULL,
  `codigo_questao` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`codigo_prova`,`codigo_questao`),
  KEY `fk_prova_questao_Q_idx` (`codigo_questao`),
  CONSTRAINT `fk_prova_questao_P` FOREIGN KEY (`codigo_prova`) REFERENCES `Prova` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prova_questao_Q` FOREIGN KEY (`codigo_questao`) REFERENCES `questao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova_questao`
--

LOCK TABLES `prova_questao` WRITE;
/*!40000 ALTER TABLE `prova_questao` DISABLE KEYS */;
INSERT INTO `prova_questao` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `prova_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questao`
--

DROP TABLE IF EXISTS `questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questao` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pergunta` text,
  `descricao` text,
  `codigo_categoria` bigint(20) unsigned DEFAULT NULL,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  KEY `codigo_categoria` (`codigo_categoria`),
  CONSTRAINT `fk_questao_categoria` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `fk_questao_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questao`
--

LOCK TABLES `questao` WRITE;
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` VALUES (1,'teadkajjsd','sdfjskdjfio',1,1),(2,'fghfghfghfh','sdjfsodsdf',1,1),(3,'rtgdfdbcvbvb','krwewefssfd',1,1),(4,'dfgdfnfnisdfs','cvbedfert',1,1);
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `login` varchar(40) DEFAULT NULL,
  `senha` text,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Grosbilda','Seilah',' 222','grosbilda@seilah.com'),(2,'Estrobilobaldo','Seilah2','333','estrobilobaldo@seilah.com'),(3,'Zirgonisvaldo','Seilah3','444','zirgonisvaldo@seilah.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tem_papel`
--

DROP TABLE IF EXISTS `usuario_tem_papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_tem_papel` (
  `usuario_codigo` bigint(20) unsigned NOT NULL,
  `papel_idPapel` bigint(20) NOT NULL,
  PRIMARY KEY (`usuario_codigo`,`papel_idPapel`),
  KEY `fk_usuario_has_papel_papel1_idx` (`papel_idPapel`),
  CONSTRAINT `fk_usuario_has_papel_papel1` FOREIGN KEY (`papel_idPapel`) REFERENCES `papel` (`idPapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_tem_papel_1_usuario` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tem_papel`
--

LOCK TABLES `usuario_tem_papel` WRITE;
/*!40000 ALTER TABLE `usuario_tem_papel` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tem_papel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03 16:32:40
