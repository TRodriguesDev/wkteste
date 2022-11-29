CREATE DATABASE  IF NOT EXISTS `db_wkteste` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_wkteste`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db_wkteste
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IDCLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOME_CLI` varchar(60) NOT NULL,
  `CIDADE_CLI` varchar(40) NOT NULL,
  `UF_CLI` char(2) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `IDCLIENTE_UNIQUE` (`IDCLIENTE`),
  KEY `IDXCLINOME` (`IDCLIENTE`,`NOME_CLI`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ELVIS DA COSTA','CURITIBA','PR'),(2,'MARTA DA PENHA','CURITIBA','PR'),(3,'LETICIA PIRES','CURITIBA','PR'),(4,'JESUS LUZ SANTOS','RIO DE JANEIRO','RJ'),(5,'NEUZA SCHULER','FOZ DO IGUACU','PR'),(6,'LETICIA MARINHO','CAMPINAS','SP'),(7,'SILVIO SANTOS','SANTOS','SP'),(8,'LORENZO TOBIAS FRIOS','CAMPINAS','SP'),(9,'CHICO MENDES SARRO','CAMPINAS','SP'),(10,'ZECA CAMARGO GOLIAS','SAO PAULO','SP'),(11,'JOAO MARIA PIA','LIMEIRA','SP'),(12,'DANTE DE LIMA','LIMEIRA','SP'),(13,'JEREMIAS LIMA','AMERICANA','SP'),(14,'JESSE ZE MARIA','AMERICANA','SP'),(15,'NETO SANTOS','PAULINIA','SP'),(16,'MARCOS KINUTZ','ANTONIO CARLOS','SC'),(17,'RENATA DA COSTA','ANTONIO CARLOS','SC'),(18,'LUIZA SANCHES','COLIDER','MT'),(19,'JESSICA PINEZES','COLIDER','MT'),(20,'LARA SANTOS JHUNZ','CUIBA','MT'),(21,'LENINHA NATOS GUZ','SORRISO','MT');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenspedido`
--

DROP TABLE IF EXISTS `itenspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenspedido` (
  `IDITEM` int NOT NULL AUTO_INCREMENT,
  `NUMPED_ITEM` int NOT NULL,
  `CODPROD_ITEM` int NOT NULL,
  `QTD_ITEM` decimal(8,2) NOT NULL DEFAULT '0.00',
  `VLUNIT_ITEM` decimal(12,2) NOT NULL DEFAULT '0.00',
  `VLTOT_ITEM` decimal(14,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`IDITEM`),
  UNIQUE KEY `IDITEM_UNIQUE` (`IDITEM`),
  KEY `FITEMXPED_idx` (`NUMPED_ITEM`),
  KEY `FITEMXPROD_idx` (`CODPROD_ITEM`),
  CONSTRAINT `FITEMXPED` FOREIGN KEY (`NUMPED_ITEM`) REFERENCES `pedidos` (`IDPEDIDO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FITEMXPROD` FOREIGN KEY (`CODPROD_ITEM`) REFERENCES `produtos` (`IDPRODUTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenspedido`
--

LOCK TABLES `itenspedido` WRITE;
/*!40000 ALTER TABLE `itenspedido` DISABLE KEYS */;
INSERT INTO `itenspedido` VALUES (2,2,2,6.75,2.25,0.00),(3,2,2,6.75,2.25,0.00),(4,2,2,2.00,2.25,4.50),(5,2,2,6.75,2.25,0.00),(6,2,2,5.00,2.25,11.25),(15,7,2,3.00,7.00,21.00),(16,7,3,4.00,10.00,40.00),(17,2,2,6.75,2.25,0.00),(18,2,2,6.75,2.25,0.00),(19,2,2,6.75,2.25,0.00),(20,2,2,6.75,2.25,0.00),(21,2,2,6.75,2.25,0.00),(22,2,2,6.75,2.25,0.00),(23,2,2,2.00,2.25,4.50),(24,2,2,6.75,2.25,0.00),(25,2,2,6.75,2.25,0.00),(26,2,2,6.75,2.25,0.00),(27,2,2,6.75,2.25,0.00),(28,2,2,6.75,2.25,0.00),(29,2,2,6.75,2.25,0.00),(30,2,2,12.00,2.25,27.00),(33,8,5,5.00,3.50,17.50),(34,8,6,3.00,4.00,12.00),(35,8,8,5.00,2.00,10.00),(36,9,5,5.00,3.50,17.50),(37,9,6,5.00,4.00,20.00),(38,9,8,6.00,2.00,12.00),(39,9,6,5.00,4.00,20.00),(40,10,2,5.00,7.00,35.00),(41,10,6,2.00,4.00,8.00),(42,10,9,5.00,1.00,5.00);
/*!40000 ALTER TABLE `itenspedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `IDPEDIDO` int NOT NULL AUTO_INCREMENT,
  `DTE_PED` timestamp NOT NULL,
  `CLI_PED` int NOT NULL,
  `VLTOT_PED` decimal(14,2) NOT NULL,
  PRIMARY KEY (`IDPEDIDO`),
  UNIQUE KEY `IDPEDIDO_UNIQUE` (`IDPEDIDO`),
  KEY `FPEDXCLI_idx` (`CLI_PED`) /*!80000 INVISIBLE */,
  KEY `IDXPEDCLI` (`CLI_PED`,`IDPEDIDO`),
  CONSTRAINT `FPEDXCLI` FOREIGN KEY (`CLI_PED`) REFERENCES `clientes` (`IDCLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,'2022-11-11 17:32:09',3,47.25),(4,'2022-11-11 23:25:06',8,0.00),(6,'2022-11-12 00:34:05',12,0.00),(7,'2022-11-12 00:39:05',12,61.00),(8,'2022-11-12 02:46:30',10,39.50),(9,'2022-11-12 02:48:46',9,69.50),(10,'2022-11-12 02:51:05',3,48.00);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `IDPRODUTO` int NOT NULL AUTO_INCREMENT,
  `DESCR_PROD` varchar(60) NOT NULL,
  `PVENDA_PROD` decimal(12,2) NOT NULL,
  PRIMARY KEY (`IDPRODUTO`),
  UNIQUE KEY `IDPRODUTO_UNIQUE` (`IDPRODUTO`),
  KEY `IDXPRODDESCR` (`IDPRODUTO`,`DESCR_PROD`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'PAO DE FORMA',4.00),(2,'PAO DE BATATA',7.00),(3,'PANETONE',10.00),(4,'CHOCOTONE',15.00),(5,'SUCO DE LARANJA',3.50),(6,'SUCO DE UVA',4.00),(7,'CHA MATE',8.00),(8,'CAFE COM LEITE',2.00),(9,'CAFE',1.00),(10,'MISTO QUENTE',4.50),(11,'SALADA',5.50),(12,'PAO DE QUEIJO',3.75),(13,'SALGADINHO DORITOS',7.80),(14,'QUEIJO TRUFADO',35.92),(15,'CAPA CELULAR 4.7',20.00),(16,'ISQUEIRO',4.60),(17,'CAIXA DE FOSFORO',1.70),(18,'BUCHA BANHO',2.25),(19,'DOCE DE LEITE',2.35),(20,'BANANA PRATA KG',10.00),(21,'FEIJAO PRETO',7.00),(22,'OLEO SOJA',9.50),(23,'SKOL LATAO',4.65);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_itenspedidos`
--

DROP TABLE IF EXISTS `vw_itenspedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_itenspedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_itenspedidos` AS SELECT 
 1 AS `IDITEM`,
 1 AS `NUMPED_ITEM`,
 1 AS `CODPROD_ITEM`,
 1 AS `DESCR_PROD`,
 1 AS `QTD_ITEM`,
 1 AS `VLUNIT_ITEM`,
 1 AS `VLTOT_ITEM`,
 1 AS `SIT_ITEM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_regpedidos`
--

DROP TABLE IF EXISTS `vw_regpedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_regpedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_regpedidos` AS SELECT 
 1 AS `IDPEDIDO`,
 1 AS `DTE_PED`,
 1 AS `CLI_PED`,
 1 AS `NOME_CLI`,
 1 AS `VLTOT_PED`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_itenspedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_itenspedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_itenspedidos` AS select `i`.`IDITEM` AS `IDITEM`,`i`.`NUMPED_ITEM` AS `NUMPED_ITEM`,`i`.`CODPROD_ITEM` AS `CODPROD_ITEM`,`p`.`DESCR_PROD` AS `DESCR_PROD`,`i`.`QTD_ITEM` AS `QTD_ITEM`,`i`.`VLUNIT_ITEM` AS `VLUNIT_ITEM`,`i`.`VLTOT_ITEM` AS `VLTOT_ITEM`,cast('A' as char(1) charset utf8mb4) AS `SIT_ITEM` from (`itenspedido` `i` join `produtos` `p` on((`i`.`CODPROD_ITEM` = `p`.`IDPRODUTO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_regpedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_regpedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_regpedidos` AS select `p`.`IDPEDIDO` AS `IDPEDIDO`,`p`.`DTE_PED` AS `DTE_PED`,`p`.`CLI_PED` AS `CLI_PED`,`c`.`NOME_CLI` AS `NOME_CLI`,`p`.`VLTOT_PED` AS `VLTOT_PED` from (`pedidos` `p` join `clientes` `c` on((`p`.`CLI_PED` = `c`.`IDCLIENTE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-29 15:23:55
