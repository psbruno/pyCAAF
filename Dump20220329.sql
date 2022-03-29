-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: caaf
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa` (
  `idcaixa` int NOT NULL,
  `seq_limpeza` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cod_caixa` varchar(50) NOT NULL,
  `fk_limpeza` int DEFAULT NULL,
  `avaliacao_preservacao_ossos` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idcaixa`),
  KEY `fk_limpeza_idx` (`fk_limpeza`),
  KEY `cod_caixa_idx` (`cod_caixa`),
  KEY `cod_caixa` (`cod_caixa`),
  CONSTRAINT `caixa_ibfk_1` FOREIGN KEY (`fk_limpeza`) REFERENCES `limpeza` (`cod_limpeza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (-2,NULL,NULL,'1aa',1,NULL),(-1,NULL,NULL,'1',1,NULL),(0,9,'2000-09-01','9999',1,'Regular'),(1,999,'2000-09-01','1111',1,'Regular'),(2,999,'2000-09-01','999aaa',1,'Regular');
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa-pessoa-abre`
--

DROP TABLE IF EXISTS `caixa-pessoa-abre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa-pessoa-abre` (
  `caixa_id_caixa` int NOT NULL,
  `input` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caixa_id_caixa`),
  KEY `caixa_id_caixa` (`caixa_id_caixa`),
  CONSTRAINT `fk_caixa_id` FOREIGN KEY (`caixa_id_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa-pessoa-abre`
--

LOCK TABLES `caixa-pessoa-abre` WRITE;
/*!40000 ALTER TABLE `caixa-pessoa-abre` DISABLE KEYS */;
INSERT INTO `caixa-pessoa-abre` VALUES (0,'99'),(1,'99'),(2,'e1');
/*!40000 ALTER TABLE `caixa-pessoa-abre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa-pessoa-limpa`
--

DROP TABLE IF EXISTS `caixa-pessoa-limpa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa-pessoa-limpa` (
  `caixa_id_caixa` int NOT NULL,
  `input` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caixa_id_caixa`),
  KEY `fk_caixa_has_pessoa_caixa1_idx` (`caixa_id_caixa`),
  KEY `caixa_id_caixa` (`caixa_id_caixa`),
  CONSTRAINT `fk_idcaixa` FOREIGN KEY (`caixa_id_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa-pessoa-limpa`
--

LOCK TABLES `caixa-pessoa-limpa` WRITE;
/*!40000 ALTER TABLE `caixa-pessoa-limpa` DISABLE KEYS */;
INSERT INTO `caixa-pessoa-limpa` VALUES (0,'9'),(1,'9'),(2,'e2');
/*!40000 ALTER TABLE `caixa-pessoa-limpa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_est_preserv`
--

DROP TABLE IF EXISTS `caixa_est_preserv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa_est_preserv` (
  `id_caixa` int NOT NULL,
  `codigo_estado` int DEFAULT NULL,
  `Ossos_prev_limpos` varchar(50) NOT NULL,
  `fungos` varchar(255) DEFAULT NULL,
  `pupas` varchar(255) DEFAULT NULL,
  `umidade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_caixa`),
  CONSTRAINT `fk_id_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_est_preserv`
--

LOCK TABLES `caixa_est_preserv` WRITE;
/*!40000 ALTER TABLE `caixa_est_preserv` DISABLE KEYS */;
INSERT INTO `caixa_est_preserv` VALUES (0,NULL,'7','77','77','77'),(1,NULL,'99','9','9','118'),(2,NULL,'xxxx','oooo','pppp','aaa');
/*!40000 ALTER TABLE `caixa_est_preserv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_material_acondicionamento`
--

DROP TABLE IF EXISTS `caixa_material_acondicionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa_material_acondicionamento` (
  `idcaixa` int NOT NULL,
  `cod_material` int NOT NULL,
  `qtde` int DEFAULT NULL,
  `cod_caixa` varchar(50) DEFAULT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idcaixa`,`cod_material`),
  KEY `cod_material` (`cod_material`),
  CONSTRAINT `caixa_material_acondicionamento_ibfk_3` FOREIGN KEY (`idcaixa`) REFERENCES `caixa` (`idcaixa`),
  CONSTRAINT `material_id_1` FOREIGN KEY (`cod_material`) REFERENCES `material_generico` (`cod_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_material_acondicionamento`
--

LOCK TABLES `caixa_material_acondicionamento` WRITE;
/*!40000 ALTER TABLE `caixa_material_acondicionamento` DISABLE KEYS */;
INSERT INTO `caixa_material_acondicionamento` VALUES (0,1,878787,'9999','78','78'),(0,2,8787,'9999','78','78'),(0,3,878,'9999','78','78'),(0,4,78,'9999','78','78'),(0,5,78,'9999','78','78'),(0,6,878,'9999','78','78'),(0,12,78,'9999','78','78'),(0,13,787,'9999','78','78'),(0,14,87,'9999','78','78'),(1,1,9,'1111','67','77'),(1,2,77,'1111','67','77'),(1,3,99,'1111','67','77'),(1,4,444,'1111','67','77'),(1,5,444,'1111','67','77'),(1,6,999,'1111','67','77'),(1,12,9,'1111','67','77'),(1,13,9,'1111','67','77'),(1,14,9,'1111','67','77'),(2,1,0,'999aaa','nao','nao'),(2,2,0,'999aaa','nao','nao'),(2,3,0,'999aaa','nao','nao'),(2,4,0,'999aaa','nao','nao'),(2,5,0,'999aaa','nao','nao'),(2,6,0,'999aaa','nao','nao'),(2,12,0,'999aaa','nao','nao'),(2,13,0,'999aaa','nao','nao'),(2,14,0,'999aaa','nao','nao');
/*!40000 ALTER TABLE `caixa_material_acondicionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_material_ident`
--

DROP TABLE IF EXISTS `caixa_material_ident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa_material_ident` (
  `codcaixa` varchar(50) NOT NULL,
  `idcaixa` int DEFAULT NULL,
  `cod_material_id` int NOT NULL,
  `qtde` int DEFAULT NULL,
  `localizacao` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `codigo` int DEFAULT NULL,
  `NRD` varchar(200) DEFAULT NULL,
  `outros` varchar(200) DEFAULT NULL,
  `NRD2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codcaixa`,`cod_material_id`),
  KEY `idcaixa` (`idcaixa`),
  KEY `cod_material_id` (`cod_material_id`),
  CONSTRAINT `caixa_material_ident_ibfk_1` FOREIGN KEY (`idcaixa`) REFERENCES `caixa` (`idcaixa`),
  CONSTRAINT `material_id` FOREIGN KEY (`cod_material_id`) REFERENCES `material_generico` (`cod_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_material_ident`
--

LOCK TABLES `caixa_material_ident` WRITE;
/*!40000 ALTER TABLE `caixa_material_ident` DISABLE KEYS */;
INSERT INTO `caixa_material_ident` VALUES ('1111',1,7,77,'44','4',4,'4','4','4'),('1111',1,8,4,'4','4',4,'4','4','4'),('1111',1,9,4,'4','4',4,'4','4','4'),('1111',1,10,4,'4','4',4,'4','4','4'),('1111',1,11,4,'4','4',4,'4','4','4'),('9999',0,7,878,'87','878',787,'67','76','76'),('9999',0,8,787,'87','878',878,'67','76','76'),('9999',0,9,878,'8','87',787,'67','76','76'),('9999',0,10,87,'7','78',78,'67','76','76'),('9999',0,11,67,'6','767',7666,'67','76','76'),('999aaa',2,7,9,'9','9',9,'none','none','nnn'),('999aaa',2,8,9,'9','9',9,'none','none','nnn'),('999aaa',2,9,9,'9','9',9,'none','none','nnn'),('999aaa',2,10,9,'9','9',9,'none','none','nnn'),('999aaa',2,11,9,'9','9',9,'none','none','nnn');
/*!40000 ALTER TABLE `caixa_material_ident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_tipomaterial`
--

DROP TABLE IF EXISTS `caixa_tipomaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa_tipomaterial` (
  `cod_pk_caixa_TM` int NOT NULL AUTO_INCREMENT,
  `cod_caixa` varchar(50) DEFAULT NULL,
  `cabelo_comprimento` float DEFAULT NULL,
  `cabelo_cor` varchar(50) DEFAULT NULL,
  `outros` varchar(200) DEFAULT NULL,
  `roupa` varchar(30) DEFAULT NULL,
  `idcaixa` int DEFAULT NULL,
  `ossos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_pk_caixa_TM`),
  KEY `cod_caixa` (`cod_caixa`),
  KEY `idcaixa` (`idcaixa`),
  CONSTRAINT `caixa_tipomaterial_ibfk_3` FOREIGN KEY (`idcaixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_tipomaterial`
--

LOCK TABLES `caixa_tipomaterial` WRITE;
/*!40000 ALTER TABLE `caixa_tipomaterial` DISABLE KEYS */;
INSERT INTO `caixa_tipomaterial` VALUES (30,'9999',9,'9','9','99',0,NULL),(31,'1111',9,'9','9','9',1,NULL),(35,'999aaa',9,'nn','nao','nao',2,'nn');
/*!40000 ALTER TABLE `caixa_tipomaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto`
--

DROP TABLE IF EXISTS `conjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjunto` (
  `idconjunto` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idconjunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto`
--

LOCK TABLES `conjunto` WRITE;
/*!40000 ALTER TABLE `conjunto` DISABLE KEYS */;
INSERT INTO `conjunto` VALUES (0,'Conteúdo Ósseo'),(1,'Crânio: Ossos e articulações'),(2,'Vertebras (individuais)'),(3,'Vertebras (agrupadas)'),(4,'Arcos Neurais'),(5,'Outros'),(6,'Ossos Pós Cranianos'),(7,'Ossos Longos'),(8,'Costelas (individuais)'),(9,'Ossos da mão (Nº Presentes)'),(10,'Ossos da mão (Nº Completos)'),(11,'Ossos do pé (Nº Presentes)'),(12,'Ossos do pé (Nº Completos)'),(13,'Sexo'),(14,'Estimativa de idade 1'),(15,'Estimativa de idade 2'),(16,'Estatura'),(17,'Medições Complementares'),(18,'Código');
/*!40000 ALTER TABLE `conjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto_dados`
--

DROP TABLE IF EXISTS `conjunto_dados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjunto_dados` (
  `id_conjunto` int NOT NULL,
  `id_caixa` int NOT NULL,
  `input` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `id_conjunto` (`id_conjunto`),
  KEY `id_caixa` (`id_caixa`),
  CONSTRAINT `conjunto_dados_ibfk_1` FOREIGN KEY (`id_conjunto`) REFERENCES `conjunto` (`idconjunto`),
  CONSTRAINT `conjunto_dados_ibfk_2` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto_dados`
--

LOCK TABLES `conjunto_dados` WRITE;
/*!40000 ALTER TABLE `conjunto_dados` DISABLE KEYS */;
INSERT INTO `conjunto_dados` VALUES (0,0,'{\"NMI\": \"6\", \"Elementos Repetidos\": \"7676\", \"Crânio Íntegro\": \"76\", \"Crânio Fragmentado\": \"6767\", \"Crânio Ausente\": \"\", \"Mandíbula Íntegro\": \"67\", \"Mandíbula Fragmentado\": \"76\", \"Mandíbula Ausente\": \"\", \"Hióide Íntegro\": \"66\", \"Hióide Fragmentado\": \"667\", \"Hióide Ausente\": \"\", \"Esterno Íntegro\": \"5544\", \"Esterno Fragmentado\": \"5\", \"Esterno Ausente\": \"\", \"Sacro Íntegro\": \"45\", \"Sacro Fragmentado\": \"55\", \"Sacro Ausente\": \"\", \"Escápula Direito\": \"54\", \"Escápula Esquerdo\": \"55\", \"Escápula ?\": \"545\", \"Clavícula Direito\": \"545\", \"Clavícula Esquerdo\": \"5454\", \"Clavícula ?\": \"45\", \"Úmero Direito\": \"45\", \"Úmero Esquerdo\": \"45\", \"Úmero ?\": \"45\", \"Rádio Direito\": \"43\", \"Rádio Esquerdo\": \"43\", \"Rádio ?\": \"43\", \"Fêmur Direito\": \"4\", \"Fêmur Esquerdo\": \"45\", \"Fêmur ?\": \"545\", \"Ulna Direito\": \"545\", \"Ulna Esquerdo\": \"54\", \"Ulna ?\": \"45\", \"Tíbia Direito\": \"45\", \"Tíbia Esquerdo\": \"45\", \"Tíbia ?\": \"4545\", \"Fíbula Direito\": \"3344\", \"Fíbula Esquerdo\": \"4534\", \"Fíbula ?\": \"434\", \"Coxal Direito\": \"43\", \"Coxal Esquerdo\": \"43\", \"Coxal ?\": \"43\", \"Patela Direito\": \"434\", \"Patela Esquerdo\": \"43\", \"Patela ?\": \"343\"}',11),(0,1,'{\"NMI\": \"4\", \"Elementos Repetidos\": \"4\", \"Crânio Íntegro\": \"4\", \"Crânio Fragmentado\": \"4\", \"Crânio Ausente\": \"\", \"Mandíbula Íntegro\": \"4\", \"Mandíbula Fragmentado\": \"4\", \"Mandíbula Ausente\": \"\", \"Hióide Íntegro\": \"4\", \"Hióide Fragmentado\": \"4\", \"Hióide Ausente\": \"\", \"Esterno Íntegro\": \"4\", \"Esterno Fragmentado\": \"4\", \"Esterno Ausente\": \"\", \"Sacro Íntegro\": \"4\", \"Sacro Fragmentado\": \"4\", \"Sacro Ausente\": \"\", \"Escápula Direito\": \"4\", \"Escápula Esquerdo\": \"4\", \"Escápula ?\": \"4\", \"Clavícula Direito\": \"4\", \"Clavícula Esquerdo\": \"4\", \"Clavícula ?\": \"4\", \"Úmero Direito\": \"4\", \"Úmero Esquerdo\": \"4\", \"Úmero ?\": \"4\", \"Rádio Direito\": \"4\", \"Rádio Esquerdo\": \"4\", \"Rádio ?\": \"4\", \"Fêmur Direito\": \"4\", \"Fêmur Esquerdo\": \"4\", \"Fêmur ?\": \"4\", \"Ulna Direito\": \"4\", \"Ulna Esquerdo\": \"4\", \"Ulna ?\": \"4\", \"Tíbia Direito\": \"4\", \"Tíbia Esquerdo\": \"4\", \"Tíbia ?\": \"4\", \"Fíbula Direito\": \"4\", \"Fíbula Esquerdo\": \"4\", \"Fíbula ?\": \"4\", \"Coxal Direito\": \"4\", \"Coxal Esquerdo\": \"4\", \"Coxal ?\": \"4\", \"Patela Direito\": \"4\", \"Patela Esquerdo\": \"4\", \"Patela ?\": \"4\"}',12),(0,2,'{\"NMI\": \"9\", \"Elementos Repetidos\": \"99\", \"Crânio Íntegro\": \"9\", \"Crânio Fragmentado\": \"9\", \"Crânio Ausente\": \"\", \"Mandíbula Íntegro\": \"9\", \"Mandíbula Fragmentado\": \"9\", \"Mandíbula Ausente\": \"\", \"Hióide Íntegro\": \"9\", \"Hióide Fragmentado\": \"9\", \"Hióide Ausente\": \"\", \"Esterno Íntegro\": \"9\", \"Esterno Fragmentado\": \"9\", \"Esterno Ausente\": \"\", \"Sacro Íntegro\": \"9\", \"Sacro Fragmentado\": \"9\", \"Sacro Ausente\": \"\", \"Escápula Direito\": \"9\", \"Escápula Esquerdo\": \"9\", \"Escápula ?\": \"0\", \"Clavícula Direito\": \"0\", \"Clavícula Esquerdo\": \"0\", \"Clavícula ?\": \"0\", \"Úmero Direito\": \"0\", \"Úmero Esquerdo\": \"0\", \"Úmero ?\": \"9\", \"Rádio Direito\": \"9\", \"Rádio Esquerdo\": \"90\", \"Rádio ?\": \"0\", \"Fêmur Direito\": \"8\", \"Fêmur Esquerdo\": \"08\", \"Fêmur ?\": \"8\", \"Ulna Direito\": \"9\", \"Ulna Esquerdo\": \"0\", \"Ulna ?\": \"9\", \"Tíbia Direito\": \"8\", \"Tíbia Esquerdo\": \"8\", \"Tíbia ?\": \"7\", \"Fíbula Direito\": \"7\", \"Fíbula Esquerdo\": \"8\", \"Fíbula ?\": \"87\", \"Pelve Direito\": \"7\", \"Pelve Esquerdo\": \"7\", \"Pelve ?\": \"8\", \"Patela Direito\": \"8\", \"Patela Esquerdo\": \"7\", \"Patela ?\": \"7\"}',13);
/*!40000 ALTER TABLE `conjunto_dados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo_osso_info`
--

DROP TABLE IF EXISTS `conteudo_osso_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudo_osso_info` (
  `num_vertebras_frag` int DEFAULT NULL,
  `osso_mao` int DEFAULT NULL,
  `osso_pe` int DEFAULT NULL,
  `num_dentes_mandibula` int DEFAULT NULL,
  `num_dentes_soltos` int DEFAULT NULL,
  `num_dentes_maxila` int DEFAULT NULL,
  `cod_conteudo_osso_info` int NOT NULL AUTO_INCREMENT,
  `caixa_cod_caixa` varchar(50) NOT NULL,
  `caixa_pessoa_cod_pessoa` int NOT NULL,
  `idcaixa` int DEFAULT NULL,
  `ossic_ouvido` int DEFAULT NULL,
  `num_costelas_frag` int DEFAULT NULL,
  `obsGerais` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_conteudo_osso_info`),
  KEY `fk_conteudo_osso_info_caixa1_idx` (`idcaixa`),
  KEY `caixa_cod_caixa` (`caixa_cod_caixa`),
  CONSTRAINT `conteudo_osso_info` FOREIGN KEY (`idcaixa`) REFERENCES `caixa` (`idcaixa`),
  CONSTRAINT `fk_cod_caixa_coi` FOREIGN KEY (`caixa_cod_caixa`) REFERENCES `caixa` (`cod_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo_osso_info`
--

LOCK TABLES `conteudo_osso_info` WRITE;
/*!40000 ALTER TABLE `conteudo_osso_info` DISABLE KEYS */;
INSERT INTO `conteudo_osso_info` VALUES (434,34,343,43,43,43,23,'9999',0,0,43,4334,'43	444'),(4,4,4,4,4,4,24,'1111',1,1,4,4,'44444'),(5,53,2,6,6,8,25,'999aaa',2,2,5,5,'111	');
/*!40000 ALTER TABLE `conteudo_osso_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificacao`
--

DROP TABLE IF EXISTS `identificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificacao` (
  `id_perito` int NOT NULL AUTO_INCREMENT,
  `nome_perito` varchar(45) DEFAULT NULL,
  `registrado` varchar(45) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `caixa_idcaixa` int NOT NULL,
  PRIMARY KEY (`id_perito`),
  KEY `fk_identificacao_caixa` (`caixa_idcaixa`),
  CONSTRAINT `fk_identificacao_caixa` FOREIGN KEY (`caixa_idcaixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificacao`
--

LOCK TABLES `identificacao` WRITE;
/*!40000 ALTER TABLE `identificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `identificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limpeza`
--

DROP TABLE IF EXISTS `limpeza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limpeza` (
  `cod_limpeza` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_limpeza`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limpeza`
--

LOCK TABLES `limpeza` WRITE;
/*!40000 ALTER TABLE `limpeza` DISABLE KEYS */;
INSERT INTO `limpeza` VALUES (1,'Com água'),(2,'À seco');
/*!40000 ALTER TABLE `limpeza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_generico`
--

DROP TABLE IF EXISTS `material_generico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_generico` (
  `cod_material` int NOT NULL,
  `descric_material` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`cod_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_generico`
--

LOCK TABLES `material_generico` WRITE;
/*!40000 ALTER TABLE `material_generico` DISABLE KEYS */;
INSERT INTO `material_generico` VALUES (1,' Saco plástico para lixo hospitalar'),(2,'Saco de algodão'),(3,'Saco de TNT'),(4,'Saco azul do SFM'),(5,'Saco plástico de lixo'),(6,'Saco transparente pequeno'),(7,'Argolas de metal\r\n'),(8,'Etiquetas do SFM'),(9,'Etiquetas da Unicamp'),(10,'Lacres'),(11,'Etiqueta'),(12,' Envelope de papel'),(13,'Saco de instituição de perícia anterior'),(14,'Saco Plástico Transparente');
/*!40000 ALTER TABLE `material_generico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossos_da_mao`
--

DROP TABLE IF EXISTS `ossos_da_mao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ossos_da_mao` (
  `idossos_da_mao` int NOT NULL AUTO_INCREMENT,
  `E` int DEFAULT NULL,
  `D` int DEFAULT NULL,
  `caixa_cod_caixa` varchar(50) NOT NULL,
  `nome_osso` varchar(50) NOT NULL,
  `?` int DEFAULT NULL,
  PRIMARY KEY (`idossos_da_mao`),
  KEY `fk_cod_caixa` (`caixa_cod_caixa`),
  KEY `fk_status_cod_coluna` (`nome_osso`),
  CONSTRAINT `fk_cod_caixa` FOREIGN KEY (`caixa_cod_caixa`) REFERENCES `caixa` (`cod_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossos_da_mao`
--

LOCK TABLES `ossos_da_mao` WRITE;
/*!40000 ALTER TABLE `ossos_da_mao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ossos_da_mao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossos_longos`
--

DROP TABLE IF EXISTS `ossos_longos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ossos_longos` (
  `idossos_longos` int NOT NULL AUTO_INCREMENT,
  `epifise_proximal` int DEFAULT NULL,
  `terco_proximal` int DEFAULT NULL,
  `terco_medio` int DEFAULT NULL,
  `terco_distal` int DEFAULT NULL,
  `epifise_distal` int DEFAULT NULL,
  `caixa_cod_caixa` varchar(50) NOT NULL,
  `nome_osso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idossos_longos`),
  KEY `cod_caixafk` (`caixa_cod_caixa`),
  CONSTRAINT `cod_caixafk` FOREIGN KEY (`caixa_cod_caixa`) REFERENCES `caixa` (`cod_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossos_longos`
--

LOCK TABLES `ossos_longos` WRITE;
/*!40000 ALTER TABLE `ossos_longos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ossos_longos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ossos_pe`
--

DROP TABLE IF EXISTS `ossos_pe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ossos_pe` (
  `idossos_pe` int NOT NULL AUTO_INCREMENT,
  `E` int DEFAULT NULL,
  `D` int DEFAULT NULL,
  `caixa_cod_caixa` int NOT NULL,
  `nome_osso` varchar(50) NOT NULL,
  `?` int DEFAULT NULL,
  PRIMARY KEY (`idossos_pe`),
  KEY `caixa_cod_caixa` (`caixa_cod_caixa`),
  KEY `status_cod_integro_fragmentado_ausente_dir_esq_indeter` (`nome_osso`),
  CONSTRAINT `ossos_pe_ibfk_1` FOREIGN KEY (`caixa_cod_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ossos_pe`
--

LOCK TABLES `ossos_pe` WRITE;
/*!40000 ALTER TABLE `ossos_pe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ossos_pe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outros`
--

DROP TABLE IF EXISTS `outros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outros` (
  `idoutros` int NOT NULL AUTO_INCREMENT,
  `estado_conservacao` varchar(200) DEFAULT NULL,
  `efeitos_tafonomicos` varchar(200) DEFAULT NULL,
  `cabelo` varchar(200) DEFAULT NULL,
  `tecido_mole` varchar(200) DEFAULT NULL,
  `insetos` varchar(200) DEFAULT NULL,
  `reconstrucao_craniana` varchar(200) DEFAULT NULL,
  `outras_construcoes` varchar(200) DEFAULT NULL,
  `amostras` varchar(200) DEFAULT NULL,
  `restos` varchar(200) DEFAULT NULL,
  `elementos` varchar(200) DEFAULT NULL,
  `idcaixa` int NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idoutros`),
  KEY `fk_outros_caixa2_idx` (`idcaixa`),
  CONSTRAINT `outros_ibfk_1` FOREIGN KEY (`idcaixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outros`
--

LOCK TABLES `outros` WRITE;
/*!40000 ALTER TABLE `outros` DISABLE KEYS */;
/*!40000 ALTER TABLE `outros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cod_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome_pessoa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resp_caso`
--

DROP TABLE IF EXISTS `resp_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resp_caso` (
  `caixa_id_caixa` int NOT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caixa_id_caixa`),
  CONSTRAINT `fk_caixa_id_caixa` FOREIGN KEY (`caixa_id_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resp_caso`
--

LOCK TABLES `resp_caso` WRITE;
/*!40000 ALTER TABLE `resp_caso` DISABLE KEYS */;
INSERT INTO `resp_caso` VALUES (0,'9'),(1,'9'),(2,'pedro');
/*!40000 ALTER TABLE `resp_caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int NOT NULL,
  `nome_osso` varchar(45) DEFAULT NULL,
  `especificacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertebras_individuais`
--

DROP TABLE IF EXISTS `vertebras_individuais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertebras_individuais` (
  `idvertebras_individuais` int NOT NULL AUTO_INCREMENT,
  `corpo` int DEFAULT NULL,
  `arco_neural` int DEFAULT NULL,
  `caixa_cod_caixa` int NOT NULL,
  `nome_osso` varchar(50) NOT NULL,
  PRIMARY KEY (`idvertebras_individuais`),
  KEY `caixa_cod_caixa` (`caixa_cod_caixa`),
  KEY `status_cod_integro_fragmentado_ausente_dir_esq_indeter` (`nome_osso`),
  CONSTRAINT `vertebras_individuais_ibfk_1` FOREIGN KEY (`caixa_cod_caixa`) REFERENCES `caixa` (`idcaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertebras_individuais`
--

LOCK TABLES `vertebras_individuais` WRITE;
/*!40000 ALTER TABLE `vertebras_individuais` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertebras_individuais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-29 10:02:11
