-- MySQL dump 10.13  Distrib 5.6.21, for osx10.8 (x86_64)
--
-- Host: localhost    Database: casadocodigo
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `pages` int(11) NOT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `summaryPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (2,'best book about scala',100,'2015-02-18 00:00:00','Scala',NULL),(6,'fjdlkgfhdjkhfdkghfdjk',50,'2015-02-18 00:00:00','Ruby',NULL),(8,'fjdlkgfhdjkhfdkghfdjk',50,'2015-02-18 00:00:00','Ruby',NULL),(9,'fjdlkgfhdjkhfdkghfdjk',50,'2015-02-18 00:00:00','Ruby','uploaded-images/nodebeginner.pdf'),(10,'esse livro vai ser top',100,'2015-02-13 00:00:00','Jogos em unity','uploaded-images/21-Usando Mtodos geis para ensinar Mtodos geis.pdf'),(11,'descricao top...',100,'2015-02-11 00:00:00','Novo livro','uploaded-images/anexo_5_pessoal_valores_referencia_aanalise_projetos.doc'),(12,'klfjdkfhksfkds fdhsfk jdskfhdsjk fhjkdshf jkdskjfdskjfdhskjfhdsjk fsd',100,'2015-02-12 00:00:00','testet','uploaded-images/playframeworknapratica.pdf'),(13,'klfjdkfhksfkds fdhsfk jdskfhdsjk fhjkdshf jkdskjfdskjfdhskjfhdsjk fsd',100,'2015-02-12 00:00:00','testet','uploaded-images/playframeworknapratica.pdf'),(14,'klfjdkfhksfkds fdhsfk jdskfhdsjk fhjkdshf jkdskjfdskjfdhskjfhdsjk fsd',100,'2015-02-12 00:00:00','testet','uploaded-images/playframeworknapratica.pdf'),(115,'fhdsjkfhdsjkfsd\r\nf\r\ndsf\r\nsd\r\nfds\r\nfds\r\nfds\r\nf\r\ndsfdfg',100,'2015-03-19 00:00:00','Livro caro','uploaded-images/pagina_erro.png');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_prices`
--

DROP TABLE IF EXISTS `Product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product_prices` (
  `Product_id` int(11) NOT NULL,
  `bookType` int(11) DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  KEY `FK_5jnvxg5oub4f8rwl0jbby11vc` (`Product_id`),
  CONSTRAINT `FK_5jnvxg5oub4f8rwl0jbby11vc` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_prices`
--

LOCK TABLES `Product_prices` WRITE;
/*!40000 ALTER TABLE `Product_prices` DISABLE KEYS */;
INSERT INTO `Product_prices` VALUES (2,0,20.00),(2,1,30.00),(2,2,40.00),(6,0,50.00),(6,1,60.00),(6,2,90.00),(8,0,50.00),(8,1,60.00),(8,2,90.00),(9,0,50.00),(9,1,60.00),(9,2,90.00),(10,0,50.00),(10,1,60.00),(10,2,100.00),(11,0,50.00),(11,1,60.00),(11,2,100.00),(12,0,60.00),(12,1,50.00),(12,2,100.00),(13,0,60.00),(13,1,50.00),(13,2,100.00),(14,0,60.00),(14,1,50.00),(14,2,100.00),(115,0,600.00),(115,1,1000.00),(115,2,900.00);
/*!40000 ALTER TABLE `Product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES ('ROLE_ADMIN'),('ROLE_COMPRADOR');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemUser`
--

DROP TABLE IF EXISTS `SystemUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemUser` (
  `login` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemUser`
--

LOCK TABLES `SystemUser` WRITE;
/*!40000 ALTER TABLE `SystemUser` DISABLE KEYS */;
INSERT INTO `SystemUser` VALUES ('admin@casadocodigo.com.br','Administrador','$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu'),('comprador@gmail.com','Alberto','$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu');
/*!40000 ALTER TABLE `SystemUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemUser_Role`
--

DROP TABLE IF EXISTS `SystemUser_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemUser_Role` (
  `SystemUser_login` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  KEY `FK_myxcf03cqjm4dog5wf62pftll` (`roles_name`),
  KEY `FK_curn0vop0relbva9glsndjlrw` (`SystemUser_login`),
  CONSTRAINT `FK_curn0vop0relbva9glsndjlrw` FOREIGN KEY (`SystemUser_login`) REFERENCES `SystemUser` (`login`),
  CONSTRAINT `FK_myxcf03cqjm4dog5wf62pftll` FOREIGN KEY (`roles_name`) REFERENCES `Role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemUser_Role`
--

LOCK TABLES `SystemUser_Role` WRITE;
/*!40000 ALTER TABLE `SystemUser_Role` DISABLE KEYS */;
INSERT INTO `SystemUser_Role` VALUES ('comprador@gmail.com','ROLE_COMPRADOR'),('admin@casadocodigo.com.br','ROLE_ADMIN');
/*!40000 ALTER TABLE `SystemUser_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `login` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('admin@casadocodigo.com.br','Administrador','$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu'),('comprador@gmail.com','Alberto','$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Role`
--

DROP TABLE IF EXISTS `User_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Role` (
  `User_login` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  KEY `FK_kj5hi20v94v3qegbsqh36eqet` (`roles_name`),
  KEY `FK_besatukaomklekcnfr4w6ti9y` (`User_login`),
  CONSTRAINT `FK_besatukaomklekcnfr4w6ti9y` FOREIGN KEY (`User_login`) REFERENCES `User` (`login`),
  CONSTRAINT `FK_kj5hi20v94v3qegbsqh36eqet` FOREIGN KEY (`roles_name`) REFERENCES `Role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Role`
--

LOCK TABLES `User_Role` WRITE;
/*!40000 ALTER TABLE `User_Role` DISABLE KEYS */;
INSERT INTO `User_Role` VALUES ('comprador@gmail.com','ROLE_COMPRADOR'),('admin@casadocodigo.com.br','ROLE_ADMIN');
/*!40000 ALTER TABLE `User_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `login` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_Role`
--

DROP TABLE IF EXISTS `Users_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_Role` (
  `Users_login` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  KEY `FK_nwbkbdskcjfxtedsypmt9jbe2` (`roles_name`),
  KEY `FK_752xtnih47a1kc3pdjwbg4qij` (`Users_login`),
  CONSTRAINT `FK_752xtnih47a1kc3pdjwbg4qij` FOREIGN KEY (`Users_login`) REFERENCES `Users` (`login`),
  CONSTRAINT `FK_nwbkbdskcjfxtedsypmt9jbe2` FOREIGN KEY (`roles_name`) REFERENCES `Role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_Role`
--

LOCK TABLES `Users_Role` WRITE;
/*!40000 ALTER TABLE `Users_Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_Role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-09 16:52:24
