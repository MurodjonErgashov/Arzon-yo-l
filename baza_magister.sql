-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: magister_ay
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `excellant` int DEFAULT '0',
  `verygood` int DEFAULT '0',
  `good` int DEFAULT '0',
  `bad` int DEFAULT '0',
  `awfull` int DEFAULT '0',
  `user_id` int NOT NULL,
  `own_user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'ajoyib',1,0,0,0,0,1,1),(2,'zo\'r',0,1,0,0,0,1,1),(3,'yaxshi mas chota',0,0,0,0,1,1,1),(4,'umuman bo\'lmaydi',0,0,0,1,0,1,1),(5,'fefewfdcdsvewv',0,0,1,0,0,1,1),(6,'eferfrefrefre',0,0,1,0,0,1,1),(7,'weweew',0,0,1,0,0,16,16),(8,'Salom, ajjoyib',0,1,0,0,0,1,1),(9,'Ajoyib dastur',0,0,0,1,0,1,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_profile`
--

DROP TABLE IF EXISTS `driver_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ismi` varchar(45) DEFAULT NULL,
  `raqami` varchar(45) DEFAULT NULL,
  `jinsi` double DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `qayerdan` varchar(255) DEFAULT NULL,
  `mashina_rusumi` varchar(45) DEFAULT NULL,
  `mashina_raqam` varchar(45) DEFAULT NULL,
  `chair_number` int DEFAULT NULL,
  `smoke` double DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '1',
  `role_id` int NOT NULL DEFAULT '1',
  `picture_url` varchar(255) DEFAULT NULL,
  `kasbi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_profile`
--

LOCK TABLES `driver_profile` WRITE;
/*!40000 ALTER TABLE `driver_profile` DISABLE KEYS */;
INSERT INTO `driver_profile` VALUES (1,'Murodjon','+998994206864',1,'murodjon.ergashov.99@gmail.com','17.09.1999','Jondor tuman','Spark','80 A 121 BA',4,1,1,1,'/images/green card.jpg','Shifokor'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `driver_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_route`
--

DROP TABLE IF EXISTS `driver_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qayerdan` int NOT NULL,
  `qayerga` int NOT NULL,
  `kun` date NOT NULL,
  `vaqt_from` varchar(55) NOT NULL DEFAULT '12:00',
  `y_soni` int NOT NULL,
  `m_turi` int NOT NULL,
  `has_chekish` int DEFAULT NULL,
  `has_uy_hayvoni` int DEFAULT '0',
  `has_snakes` int DEFAULT '0',
  `yuk_bn` int DEFAULT '0',
  `yuk_x` decimal(16,2) DEFAULT NULL,
  `yuk_y` decimal(16,2) DEFAULT NULL,
  `yuk_z` decimal(16,2) DEFAULT NULL,
  `yuk_kg` decimal(16,2) DEFAULT NULL,
  `user_id` int NOT NULL,
  `vaqt_to` varchar(55) NOT NULL DEFAULT '12:00',
  `narxi` decimal(16,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_route`
--

LOCK TABLES `driver_route` WRITE;
/*!40000 ALTER TABLE `driver_route` DISABLE KEYS */;
INSERT INTO `driver_route` VALUES (1,16,17,'2024-04-25','12:45',3,1,1,1,1,1,0.30,0.10,0.30,6.50,1,'16:00',120.00),(2,23,21,'2024-04-25','16:30',2,0,1,0,1,1,13.00,15.00,12.00,15.00,1,'18:10',145.00),(3,3,45,'2024-04-25','17:50',3,0,1,0,1,1,15.00,20.00,10.00,30.00,1,'23:30',200.00),(4,3,45,'2024-04-25','19:15',3,0,1,0,1,1,15.00,20.00,10.00,30.00,1,'21:45',500.00),(5,16,17,'2024-04-12','14:00',1,0,1,1,0,0,NULL,NULL,NULL,NULL,1,'17:00',12000.00),(6,16,17,'2024-04-12','11:01',1,0,0,0,0,0,NULL,NULL,NULL,NULL,1,'14:01',100000.00),(7,16,18,'2024-06-19','22:00',3,1,1,0,1,1,10.00,20.00,30.00,20.00,11,'25:00',100000.00),(8,16,17,'2024-06-20','23:00',1,1,1,0,0,1,10.00,20.00,30.00,20.00,1,'26:00',100000.00),(9,16,17,'2024-06-20','23:00',1,1,1,0,0,1,10.00,20.00,30.00,20.00,1,'26:00',100000.00),(10,18,19,'2024-06-19','01:40',2,1,0,1,0,0,NULL,NULL,NULL,NULL,1,'4:40',100000.00);
/*!40000 ALTER TABLE `driver_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_route`
--

DROP TABLE IF EXISTS `order_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_id` int NOT NULL,
  `number_people` int NOT NULL,
  `total_cost` decimal(18,2) DEFAULT NULL,
  `user_id` int NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_route`
--

LOCK TABLES `order_route` WRITE;
/*!40000 ALTER TABLE `order_route` DISABLE KEYS */;
INSERT INTO `order_route` VALUES (1,1,2,240.00,2,'2024-06-17 11:56:20'),(2,1,1,120.00,2,'2024-06-17 11:56:20'),(3,1,1,120.00,2,'2024-06-17 11:56:20'),(4,9,2,200000.00,2,'2024-06-17 11:56:20'),(5,1,3,360.00,2,'2024-06-17 13:04:32'),(6,1,3,360.00,2,'2024-06-18 13:08:46'),(7,10,1,100000.00,2,'2024-06-18 13:10:35');
/*!40000 ALTER TABLE `order_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` int NOT NULL,
  `adres_name` varchar(255) DEFAULT NULL,
  `sub` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'O`zbekiston',0),(2,'Andijon viloyati',1),(3,'Buxoro viloyati',1),(4,'Farg`ona viloyati',1),(5,'Namangan viloyati',1),(6,'Navoiy viloyati',1),(7,'Qashqadaryo viloyati',1),(8,'Qoraqalpog`iston Respublikasi',1),(9,'Samarqand viloyati',1),(10,'Sirdaryo viloyati',1),(11,'Surxondaryo viloyati',1),(12,'Toshkent viloyati',1),(13,'Toshkent shahri',1),(14,'Xorazm viloyati',1),(15,'Jizzax viloyati',1),(16,'Andijon (tuman)',2),(17,'Asaka tumani',2),(18,'Baliqchi tumani',2),(19,'Bo`z (tuman)',2),(20,'Buloqboshi tumani',2),(21,'Izboskan (tuman)',2),(22,'Jalaquduq (tuman)',2),(23,'Xo`jaobod tumani',2),(24,'Qo`rg`ontepa tumani',2),(25,'Marhamat tumani',2),(26,'Oltinko`l (tuman)',2),(27,'Paxtaobod tumani',2),(28,'Shahrixon (tuman)',2),(29,'Ulug`nor (tuman)',2),(45,'Oltiariq tumani',4),(46,'Bag`dod tumani',4),(47,'Beshariq tumani',4),(48,'Buvayda tumani',4),(49,'Dang`ara tumani',4),(50,'Farg`ona tumani',4),(51,'Furqat tumani',4),(52,'Qo`shtepa tumani',4),(53,'Quva tumani',4),(54,'Rishton tumani',4),(55,'So`x tumani',4),(56,'Toshloq tumani',4),(57,'Uchko`prik tumani',4),(58,'O`zbekiston tumani',4),(59,'Yozyovon tumani',4),(60,'Chortoq tumani',5),(61,'Chust tumani',5),(62,'Kosonsoy tumani',5),(63,'Mingbuloq tumani',5),(64,'Namangan tumani',5),(65,'Norin tumani (O`zbekiston)',5),(66,'Pop tumani',5),(67,'To`raqo`rg`on tumani',5),(68,'Uchqo`rg`on tumani',5),(69,'Uychi tumani',5),(70,'Yangiqo`rg`on tumani',5),(71,'Konimex tumani',6),(72,'Karmana tumani',6),(73,'Qiziltepa (tuman, Navoiy viloyati)',6),(74,'Xatirchi tumani',6),(75,'Navbahor tumani',6),(76,'Nurota tumani',6),(77,'Tomdi tumani',6),(78,'Uchquduq tumani',6),(79,'Bayot MFY',7),(80,'Ko`l chovdur MFY',7),(81,'Qirlishon MFY',7),(82,'Chiroqchi tumani',7),(83,'Dehqonobod tumani',7),(84,'G`uzor tumani',7),(85,'Qamashi tumani',7),(86,'Qarshi tumani',7),(87,'Koson tumani',7),(88,'Kasbi tumani',7),(89,'Kitob tumani',7),(90,'Mirishkor tumani',7),(91,'Muborak tumani',7),(92,'Nishon tumani',7),(93,'Shahrisabz tumani',7),(94,'Yakkabog` tumani',7),(95,'Amudaryo tumani',8),(96,'Beruniy tumani',8),(97,'Chimboy tumani',8),(98,'Ellikqal?a tumani',8),(99,'Kegeyli tumani',8),(100,'Mo`ynoq tumani',8),(101,'Nukus tumani',8),(102,'Qanliko`l tumani',8),(103,'Qo`ng`irot tumani',8),(104,'Qorao`zak tumani',8),(105,'Shumanay tumani',8),(106,'Taxtako`pir tumani',8),(107,'To`rtko`l tumani',8),(108,'Xo`jayli tumani',8),(109,'Bulung`ur tumani',9),(110,'Ishtixon tumani',9),(111,'Jomboy tumani',9),(112,'Kattaqo`rg`on tumani',9),(113,'Qo`shrabot tumani',9),(114,'Narpay tumani',9),(115,'Nurobod tumani',9),(116,'Oqdaryo tumani',9),(117,'Paxtachi tumani',9),(118,'Payariq tumani',9),(119,'Pastdarg`om tumani',9),(120,'Samarqand tumani',9),(121,'Toyloq tumani',9),(122,'Urgut tumani',9),(123,'Oqoltin tumani',10),(124,'Boyovut tumani',10),(125,'Guliston tumani',10),(126,'Xovos tumani',10),(127,'Mirzaobod tumani',10),(128,'Sayxunobod tumani',10),(129,'Sardoba tumani',10),(130,'Sirdaryo tumani',10),(131,'Angor tumani',11),(132,'Boysun tumani',11),(133,'Denov tumani',11),(134,'Jarqo`rg`on tumani',11),(135,'Qiziriq tumani',11),(136,'Qumqo`rg`on tumani',11),(137,'Muzrabot tumani',11),(138,'Oltinsoy tumani',11),(139,'Sariosiyo tumani',11),(140,'Sherobod tumani',11),(141,'Sho`rchi tumani',11),(142,'Termiz tumani',11),(143,'Uzun tumani',11),(144,'Bekobod tumani',12),(145,'Bo`stonliq tumani',12),(146,'Bo`ka tumani',12),(147,'Chinoz tumani',12),(148,'Qibray tumani',12),(149,'Ohangaron tumani',12),(150,'Oqqo`rg`on tumani',12),(151,'Parkent tumani',12),(152,'Piskent tumani',12),(153,'Quyi chirchiq tumani',12),(154,'O`rta Chirchiq tumani',12),(155,'Yangiyo`l tumani',12),(156,'Yuqori Chirchiq tumani',12),(157,'Zangiota tumani',12),(158,'Bektemir tumani',13),(159,'Chilonzor tumani',13),(160,'Hamza tumani',13),(161,'Mirobod tumani',13),(162,'Mirzo Ulug`bek tumani',13),(163,'Sergeli tumani',13),(164,'Shayxontohur tumani',13),(165,'Olmazor tumani',13),(166,'Uchtepa (Toshkent)',13),(167,'Yakkasaroy tumani',13),(168,'Yunusobod tumani',13),(169,'Bog`ot tumani',14),(170,'Gurlan tumani',14),(171,'Xonqa tumani',14),(172,'Hazorasp tumani',14),(173,'Xiva tumani',14),(174,'Qo`shko`pir tumani',14),(175,'Shovot tumani',14),(176,'Urganch tumani',14),(177,'Yangiariq tumani',14),(178,'Yangibozor tumani',14),(179,'Tuproqqal?a tumani',14),(180,'Arnasoy tumani',15),(181,'Baxmal tumani',15),(182,'Do`stlik tumani',15),(183,'Forish tumani',15),(184,'G`allaorol tumani',15),(185,'Sharof Rashidov tumani',15),(186,'Mirzacho`l tumani',15),(187,'Paxtakor tumani',15),(188,'Yangiobod tumani',15),(189,'Zomin tumani',15),(190,'Zafarobod tumani',15),(191,'Zarbdor tumani',15),(192,'Buxoro shahar',3),(193,'Kogon shahri',3),(194,'Buxoro tuman',3),(195,'Vobkent tuman',3),(196,'Jondor tuman',3),(197,'Kogon tuman',3),(198,'Olot tuman',3),(199,'Peshku tuman',3),(200,'Romitan tuman',3),(201,'Shofirkon tuman',3),(202,'Qorako`l tuman',3),(203,'Qorovulbozor tuman',3),(204,'G`ijduvon tuman',3),(205,'Avshormaxalla',192),(206,'M.Tarobiy',192),(207,'Losha',192),(208,'B.Nakshband',192),(209,'Sifatmuniy',192),(210,'Namozgox',192),(211,'Oybek',192),(212,'Navbaxor',192),(213,'Yoshlik',192),(214,'Bogidasht',192),(215,'Foshun',192),(216,'Tukimachi',192),(217,'Dustlik',192),(218,'Istiklol',192),(219,'Xujamushkin',192),(220,'S.Ayniy',192),(221,'M.Narshaxiy',192),(222,'Kukaldosh',192),(223,'A.Navoiy',192),(224,'J.Ikromiy',192),(225,'Nizomiy ',192),(226,'Navruz ',192),(227,'Bunyodkor ',192),(228,'Zarafshon ',192),(229,'A.Temur',192),(230,'I.Buxoriy',192),(231,'X.Olimjon',192),(232,'A.Fitrat ',192),(233,'M.Ulugbek ',192),(234,'Turki-jandi ',192),(235,'Bexishtiyon ',192),(236,'Jubor ',192),(237,'Xavzi-nav ',192),(238,'Piridastgir ',192),(239,'Shodlik ',192),(240,'Toshmachit ',192),(241,'X.Gunjoriy ',192),(242,'Shergiron ',192),(243,'R.Xamroev ',192),(244,'Gulshan ',192),(245,'Varaxsha ',192),(246,'O.Xujaev ',192),(247,'G.Gulom ',192),(248,'M.Ashrafiy ',192),(249,'F.Xujaev ',192),(250,'Chorbaxossa ',192),(251,'Yangiobod ',192),(252,'A.Donish ',192),(253,'Ibn-Sino ',192),(254,'Kuksaroy',192),(255,'Shayxul-olam',192),(256,'Moxi-xossa',192),(257,'Shark-yulduzi',192),(258,'M.Burxonov ',192),(259,'Shirbudin',192),(260,'S.Sheroziy ',192),(261,'S.Raximov ',192),(262,'Dilkusho ',192),(263,'Guliston',192),(264,'S.Boxarsiy',192),(265,'Furkat ',192),(266,'Gulchorbog ',192),(267,'A.Gijduvoniy ',192),(268,'Sheyxon ',192),(269,'Otbozor',192),(270,'A.Navoiy MFY',193),(271,'Amir Temur MFY',193),(272,'Bobur MFY',193),(273,'Bunyodkor MFY',193),(274,'Istiqlol MFY',193),(275,'Mirzo Ulug`bek MFY',193),(276,'A.Qodiriy MFY',193),(277,'Beruniy MFY',193),(278,'Buxoroi Sharif MFY',193),(279,'Vatanparvar MFY',193),(280,'Furqat MFY',193),(281,'Turkiston MFY',193),(282,'Adolat MFY',193),(283,'Arabxona MFY',193),(284,'Do`stlik MFY',193),(285,'Ziyokor MFY',193),(286,'Temiryo`lchi MFY',193),(287,'Mustaqillik MFY',193),(288,'Zirabod MFY',193),(289,'Mahtumquli MFY',193),(290,'Xo`jabargi MFY',193),(291,'Navzirabod Mfy',193),(292,'Kavola Mahmud MFY',194),(293,'Ko`chko`mar MFY',194),(294,'Bog`ikalon KFY',194),(295,'Qo`shxodim MFY',194),(296,'So`fikorgar QFY',194),(297,'Gala Osiyo MFY',194),(298,'Navro`z MFY',194),(299,'Oybek MFY',194),(300,'Do`stlik MFY',194),(301,'Mustaqillik MFY',194),(302,'Rabotak MFY',194),(303,'Rabotiqalmoq KFY',194),(304,'Madaniyat Rabot MFY',194),(305,'Podshoxi MFY',194),(306,'Arabxona MFY',194),(307,'Dehcha MFY',194),(308,'Shergiron MFY',194),(309,'Xonobod MFY',194),(310,'Rabotipoyon MFY',194),(311,'Amirobod Guliston MFY',194),(312,'Shexoncha KFY',194),(313,'Kunji qal’a KFY',194),(314,'Novmetan MFY',194),(315,'Zarmanoq MFI',194),(316,'Yangiobod MFY',194),(317,'Kulonxona MFY',194),(318,'Talaliyon MFY',194),(319,'Gulshanobod MFY',194),(320,'Bog`dasht MFY',194),(321,'Dilobod-Zafarobod MFY',194),(322,'Xumin MFI',194),(323,'Istiqbol KFY',194),(324,'Yangi turmush QFY',194),(325,'Turkom MFY',194),(326,'Sohibkor KFY',194),(327,'Saxovat MFY',194),(328,'Rozmoz MFY',195),(329,'Halvogaron',195),(330,'saraosiyo',195),(331,'xo`jarabot',195),(332,'Cho`rikalon',195),(333,'Ko`lxatib',195),(334,'Mirvoshi',195),(335,'Changaron',195),(336,'Teraklik',195),(337,'Istiqlol',195),(338,'So`fidexqon MFY',195),(339,'G`aribshox',195),(340,'Charmgaron MFY',195),(341,'Xajuvon ',195),(342,'Muminobod',195),(343,'Arabxona',195),(344,'Guliston',195),(345,'Shoxnigor',195),(346,'do`stlik',195),(347,'Beshrabot',195),(348,'Qo`qin',195),(349,'Chorbog`kent',195),(350,'Rabotoxun',195),(351,'Kosari',195),(352,'Shirin',195),(353,'katagan',195),(354,'diyor',195),(355,'shifokor',195),(356,'paxtakor',195),(357,'Kulolchi',195),(358,'Ponob',195),(359,'Shanba',195),(360,'O`zbakon MFY',195),(361,'Xalach',195),(362,'Nayman',195),(363,'Pushmon',195),(364,'Anjirbog`',195),(365,'Bozorjoyi',195),(366,'ko`lodina',195),(367,'Vobkent',195),(368,'Latifsobungar',195),(369,'Niyozxo`ja',195),(370,'Shakarkent',195),(371,'Quruvchi',195),(372,'Romish MFY',196),(373,'Oqtepa MFY',196),(374,'Oydin MFY',196),(375,'Mirzayon MFY',196),(376,'Yosh kuch MFY',196),(377,'Dalmunobod MFY',196),(378,'Jamiyat MFY',196),(379,'Luqmon MFY',196),(380,'Qazoqon MFY',196),(381,'Ibn-sino MFY',196),(382,'Samonchuq MFY',196),(383,'Murg`ak MFY',196),(384,'Xumdonak MFY',196),(385,'Ko`liyon MFY',196),(386,'Ushot MFY',196),(387,'Istiqlol MFY',196),(388,'Po`loti MFY',196),(389,'Sho`robod  MFY',196),(390,'Demun MFY',196),(391,'Qalmoq MFY',196),(392,'Zangi MFY',196),(393,'Denov MFY',196),(394,'Xazorman MFY',196),(395,'Qozikenti MFY',196),(396,'Xumin MFY',196),(397,'Boliob mfy',196),(398,'Chorzona MFY',196),(399,'Eronshox MFY',196),(400,'Darveshi MFY',196),(401,'Oytug`di MFY',196),(402,'Pochchoyi MFY',196),(403,'Baxoriston MFY',196),(404,'Paxlavon MFY',196),(405,'Qaroli MFY',196),(406,'Tobagar mfy',196),(407,'Nurafshon MFY',196),(408,'Xo`jaxayron MFY',196),(409,'Karavul MFY',196),(410,'Yangiobod MFY',196),(411,'Mustaqillik MFY',196),(412,'Dovut MFY',196),(413,'Aleli MFY',196),(414,'Obod MFY',196),(415,'Rabot MFY',196),(416,'Namgoni MFY',196),(417,'Tinchlik mfy',196),(418,'Navgadi MFY',196),(419,'Oxshix MFY',196),(420,' Paxtakor MFY',196),(421,'Qovchin MFY',196),(422,'Jondor MFY',196),(423,'Zarafshon MFY',196),(424,'B.Nakshband ',197),(425,'Niyoz Xoji ',197),(426,'Choloki',197),(427,'Suxor',197),(428,'Mustakillik',197),(429,'Yangi Xayot ',197),(430,'Beklar',197),(431,'Istikbol',197),(432,'Tutkunda',197),(433,'Nurafshon',197),(434,'Urta Chul',197),(435,'Taraqqiyot',197),(436,'Kogon ',197),(437,'Sorgun',197),(438,'Siyoz Poen',197),(439,'Navruz',197),(440,'Xuja Yakshaba',197),(441,'Tun irok',197),(442,'Sarayon',197),(443,'Geofizika',197),(444,'Uzbekiston',197),(445,'Xukumatobod',197),(446,'Uba Chuli',197),(447,'Qirtay MFY',198),(448,'Qumkashon MFY',198),(449,'Muxtor MFY',198),(450,'Xalыobod MFY',198),(451,'Paxtakor MFY',198),(452,'O`zbekiston MFY',198),(453,'Chovdur MFY',198),(454,'Asajam MFY',198),(455,'Baland machit MFY',198),(456,'Davlatboy MFY',198),(457,'Denov MFY',198),(458,'Yosh Botir MFY',198),(459,'Nurobod MFY',198),(460,'Navro`z MFY',198),(461,'Pichoqchi MFY',198),(462,'Usmonshayx MFY',198),(463,'Eski Olot MFY',198),(464,'Ma’rifat MFY',198),(465,'Arabxona MFY',198),(466,'Bo`ribek -Chandir MFY',198),(467,'Bo`ston MFY',198),(468,'G`anchi -Chandir MFY',198),(469,'Ok-Oltin MFY',198),(470,'Soyinqarovul MFY',198),(471,'Xidreyli MFY',198),(472,'Opshok MFY',198),(473,'Shayxlar MFY',198),(474,'Bunyodkor MFY',198),(475,'Xalifa MFY',198),(476,'Xosa bo`yi MFY',198),(477,'Salokaravul MFY',198),(478,'Kesakli MFY',198),(479,'Burjok MFY',198),(480,'Jayxunobod MFY',198),(481,'Dilkor MFY',198),(482,'Varaxsho',199),(483,'Kiyovxo`ja',199),(484,'Qa’la',199),(485,'Navgvhon',199),(486,'Navoiy',199),(487,'Obidxo`ja',199),(488,'Turkiston',199),(489,'O`g`lon',199),(490,'O`zbek',199),(491,'Xurram',199),(492,'Shavgon',199),(493,'Quchoq',199),(494,'Chibog`oni',199),(495,'Ibn Sino',199),(496,'Sadir',199),(497,'Deycha',199),(498,'Peshko`',199),(499,'Guliston',199),(500,'Kamolot',199),(501,'So`sana',199),(502,'Talisobun',199),(503,'Do`stlik',199),(504,'Zandane',199),(505,'Qaraqalpoq',199),(506,'M-Mirishkor',199),(507,'Xorkash',199),(508,'Xo`lbor',199),(509,'Yangiobod',199),(510,'Boboxoji',199),(511,'Jongeldi',199),(512,'Yangibozor',199),(513,'Mustaqillik',199),(514,'Chiqirchi',199),(515,'Malishoyak',199),(516,'Navbaxor',199),(517,'Bog`imuso',199),(518,'Valfajir',199),(519,'Azizon MFY',200),(520,'O`zbekiston MFY',200),(521,'Qo`rg`on MFY',200),(522,'Samosiy MFY',200),(523,'Baxtiyorchi MFY',200),(524,'Mug`oncha MFY',200),(525,'Qalaychorbog` MFY',200),(526,'Qizilravot MFY',200),(527,'Xosa',200),(528,'Decha',200),(529,'G`azberon',200),(530,'Chelong`u',200),(531,'Toshrabot',200),(532,'Chandir',200),(533,'Urganjiyon',200),(534,'Qahramon',200),(535,'Gazli',200),(536,'Baynalminal',200),(537,'Mirishkor',200),(538,'Tarnaut ',200),(539,'Attaron',200),(540,'O`ba',200),(541,'Romitan',200),(542,'Bog`cha',200),(543,'Zarafshon',200),(544,'Ibn-Sino ',200),(545,'Bobir',200),(546,'A.Navoiy',200),(547,'Guliston',200),(548,'Afrosiyob',200),(549,'Bog`iturkon',200),(550,'Bog`isaydon',200),(551,'Qumrabot',200),(552,'Xo`jaubbon',200),(553,'Marziya',200),(554,'Hazortut',200),(555,'Hofizrabot',200),(556,'Qoqishtuvon',200),(557,'Poyjo`y',200),(558,'Iftixor',200),(559,'Sho`rcha ',200),(560,'Istiqlol',200),(561,'Navbahor',200),(562,'Sho`robod',200),(563,'O`tabek',200),(564,'Qalmaqon MFY',201),(565,'Jo`ynav MFY',201),(566,'Iskogare  MFY',201),(567,'Sh.Rashidov MFY ',201),(568,'Talisafed MFY',201),(569,'G`ulomte  MFY ',201),(570,'Chuqurak MFY',201),(571,'Quyi Chuqurak MFY',201),(572,'Q.Vardonze MFY ',201),(573,'Yangiqishloq MFY ',201),(574,'Boboato MFY',201),(575,'Jo`sho`ra MFY',201),(576,'Jilvon MFY',201),(577,'Bobur MFY',201),(578,'Pashmon MFY',201),(579,'Chandir MFY',201),(580,'Shodlik MFY',201),(581,'Bog`iafzal MFY ',201),(582,'Mirzoqul MFY',201),(583,'Arabxona MFY',201),(584,'Chitkaron MFY ',201),(585,'Qayrag`och MFY',201),(586,'Zarchabek MFY',201),(587,'Temirchi MFY',201),(588,'Sultonobod MFY ',201),(589,'Shibirg`on  MFY ',201),(590,'Xorin MFY ',201),(591,'Ko`rishkent MFY ',201),(592,'Kalon MFY',201),(593,'Navbahor  MFY   ',201),(594,'Pattaxon MFY ',201),(595,'Mingchinor MFY',201),(596,'Nekkishi MFY',201),(597,'Maxallaqozi MFY',201),(598,'Do`rmon MFY',201),(599,'Denav MFY ',201),(600,'Jo`yrabod MFY ',201),(601,'Dorigar MFY ',201),(602,'Xorkash MFY',201),(603,'X.Orif MFY',201),(604,'Boboxaydar MFY',201),(605,'Kotiyon MFY',201),(606,'A.Navoiy MFY',201),(607,'Guliston MFY',201),(608,'Tezguzar MFY',201),(609,'Tinchlik  MFY',201),(610,'Paxtaobod MFY',201),(611,'Savrak MFY',201),(612,'Nurafshon MFY',201),(613,'Talsangobod MFY',201),(614,'Xo`jakon mfy',202),(615,'Mallaishayx mfy',202),(616,'Polvonlar mfy',202),(617,'Zarafshon mfy',202),(618,'Mirob MFY',202),(619,'Oq Oltin MFY',202),(620,'Eski Qal’a MFY',202),(621,'Qorahoji mfy',202),(622,'Kamolot mfy',202),(623,'Mustaqillik mfy',202),(624,'Chovli mfy',202),(625,'Mirzaqalьa MFY',202),(626,'Yangizamon MFY',202),(627,'Dexqonobod mfy',202),(628,'Arabxona mfy',202),(629,'Paxtakor MFY',202),(630,'Ziyorat mfy',202),(631,'Regihaydar mfy',202),(632,'Solur mfy',202),(633,'Chekirchi MFY',202),(634,'Bandboshi MFY',202),(635,'Tojikent mfy',202),(636,'Sho`robod MFY',202),(637,'Alika Xo`ja MFY',202),(638,'Sayyot mfy',202),(639,'Poykent MFY',202),(640,'Qulonchi mfy',202),(641,'Qorako`l mfy',202),(642,'Do`rman MFY',202),(643,'Qoraqulonchi mfy',202),(644,'Tinchlik mfy',202),(645,'Tayqir mfy',202),(646,'Osiyo MFY',202),(647,'Arna mfy',202),(648,'Yangi qa’la mfy',202),(649,'Chandirobod Mfy',202),(650,'Vaxim mfy',202),(651,'Jig`achi mfy',202),(652,'Yangibozor mfy',202),(653,'Quvvacha mfy',202),(654,'Ketmondugdi MFY',202),(655,'Darg`abog`i mfy',202),(656,'Xo`jalar mfy',202),(657,'Tashabbus mfy',202),(658,'Darg`ali MFY',202),(659,'Yangi turmush mfy',202),(660,'Qozon mfy',202),(661,'Istiqlol mfy',202),(662,'Shakarbek  mfy',202),(663,'Do`stlik mfy',202),(664,'Tinchlik MFY',203),(665,'Navbaxor MFY',203),(666,'Bo`zachi MFY',203),(667,'Bo`ston MFY',203),(668,'Jarqoq MFY',203),(669,'Imom Buxoriy MFY',203),(670,'Cho`lquvar MFY',203),(671,'Sarmijon m f y',204),(672,'Buktaroy m f y',204),(673,'Taxtaxon m f y',204),(674,'Chag`dari m f y',204),(675,'Vazirshox m f y',204),(676,'Ko`shk m f y',204),(677,'Obod m f y',204),(678,'Zarafshon m f y',204),(679,'Zargaron m f y',204),(680,'Soxibiyon m f y',204),(681,'Kassabon m f y',204),(682,'Shurcha m f y',204),(683,'Yangiobod m f y',204),(684,'Okgul m f y',204),(685,'Ko`lijabbor m f y',204),(686,'Labro`d m f y',204),(687,'Gajdumak m f y',204),(688,'Jovgari m f y',204),(689,'Gulistonobod m f y',204),(690,'Xavzak m f y',204),(691,'Armechan m f y',204),(692,'Denov m f y',204),(693,'Todon m f y',204),(694,'Cho`galon m f y',204),(695,'Soktari m f y',204),(696,'Tarxanon m f y',204),(697,'Mirakon m f y',204),(698,'Saidkent m f y',204),(699,'G`ovshun m f y',204),(700,'Xaticha m f y',204),(701,'Uzanon m f y',204),(702,'Mazragan m f y',204),(703,'Maxallamirzayon m f y',204),(704,'Biyosin m f y',204),(705,'Pozagari m f y',204),(706,'Karna m f y',204),(707,'Kumok m f y',204),(708,'Dodarak m f y',204),(709,'Ulfatbibi m f y',204),(710,'Baqqollar m f y',204),(711,'G`ishti m f y',204),(712,'Okrabot m f y',204),(713,'Beshtuvo m f y',204),(714,'Rostguy m f y',204),(715,'Baraka m f y',204),(716,'Ko`kcha m f y',204),(717,'Paxtaobod k f y',204),(718,'Ayrtom m f y',204),(719,'Toshloq mf y',204),(720,'Xalqobod m f y',204),(721,'Korabog` m f y',204),(722,'Ko`riq m f y',204),(723,'Olmazor m f y',204),(724,'Amirobod m f y',204),(725,'Degrezon m f y',204),(726,'Qurg`on m f y',204),(727,'Shark m f y',204),(728,'Guliston m f y',204),(729,'A.Qaxxor m f y',204),(730,'Zarangari m f y',204),(731,'Maxalla m f y',204),(732,'Bulakiyon m f y',204),(733,'Mustaqillik m f y',204),(734,'Sarvari m f y',204),(735,'Kallon m f y',204),(736,'Tavariyon m f y',204),(737,'A.Fijduvoniy m f y',204),(738,'Chorsu m f y',204),(739,'Sardor m f y',204),(740,'F.Yunusov m f y',204),(741,'Nodirabegim m f y',204),(742,'Bobur m f y',204),(743,'Pamuza m f y',204),(744,'F.Xujaev m f y',204),(745,'Dilkusho m f y',204),(746,'Samarqand shahar',9),(747,'Qarshi shahar',7),(748,'Andijon shahar',2),(749,'Farg`ona shahar',4),(750,'Namangan shahar',5),(751,'Nukus shahar',8),(752,'Guliston shahar',10),(753,'Chirchiq shahri',12),(754,'Zarafshon shahri',6),(755,'Navoiy shahri',6),(756,'Navoiy tumani',6),(757,'Turkmaniston',0),(758,'Tojikiston',0),(759,'Rossiya federatsiyasi',0),(760,'Qirg`iziston',0),(761,'Qozog`iston',0),(762,'Afg`oniston',0),(763,'Indonezia',0);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_DRIVER',1,'2023-11-07 11:53:40','2023-11-07 11:53:40'),(2,'ROLE_CLIENT',1,'2023-11-07 11:53:40','2023-11-07 11:53:40');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `role_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'murodjon','994206864','12345',1,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(2,'Shaxzodjon','995087623','123',2,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(3,'oybekjon','934502701','321',2,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(4,'anvarjonv','564554754','2345',1,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(5,'user','+998994206864435','234rt5y',2,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(6,'shaka','+998994206863','123',2,1,'2023-11-07 11:55:59','2023-11-07 11:55:59'),(7,'murodjon','997357847','12345',2,1,'2023-11-24 09:16:42','2023-11-24 09:16:42'),(10,'murodjon','994206865','12345',1,1,'2023-11-24 09:18:29','2023-11-24 09:18:29'),(11,'murodjon','881234567','12345',1,1,'2023-11-24 10:09:04','2023-11-24 10:09:04'),(12,NULL,'56455475','1234',1,1,'2024-01-23 07:57:04','2024-01-23 07:57:04'),(13,NULL,'881823553','12345',2,1,'2024-04-14 02:53:21','2024-04-14 02:53:21'),(14,'misha','2222222','123',1,1,'2024-04-14 03:20:49','2024-04-14 03:20:49'),(15,'shak','3333333','123',1,1,'2024-04-14 03:21:51','2024-04-14 03:21:51'),(16,'murodjon','991234567','123',2,1,'2024-06-16 16:12:40','2024-06-16 16:12:40'),(17,'user','991234576','123',2,1,'2024-06-16 16:29:57','2024-06-16 16:29:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'magister_ay'
--
/*!50003 DROP PROCEDURE IF EXISTS `login_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check`(
IN pphone VARCHAR(20), 
IN ppassword VARCHAR(64)
)
BEGIN
  DECLARE nat NUMERIC;
  DECLARE userphon_check NUMERIC;
  DECLARE rrole_id NUMERIC;
  DECLARE rrole_name VARCHAR(55);

SELECT id INTO userphon_check  FROM users WHERE phone=pphone and password = ppassword LIMIT 1;

IF(userphon_check IS NOT NULL) THEN
	#update  users set actived_on=CURRENT_TIMESTAMP() where id=user_id ; 
	SET nat=userphon_check;
	SELECT role_id into rrole_id FROM users WHERE id=userphon_check;
    SELECT role_name into rrole_name from roles where id=rrole_id;
ELSE
    SET nat=0;
END IF;

SELECT nat as natija, rrole_id as role_id, rrole_name as role_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_driver_create_route` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_driver_create_route`(
IN _id INT,
IN user_id INT,

IN number_people INT,
IN cost_person DECIMAL(18,2),
IN type_car INT, #2-COMFORT, 1-STANDARD, 3-LUKS 
IN full_salon BOOL,

IN with_loan BOOL,
IN sizeX DECIMAL(18,2),
IN sizeY DECIMAL(18,2),
IN sizeZ DECIMAL(18,2),
IN kg_loan DECIMAL(18,2),

IN order_count INT,

IN from_region INT,
IN from_district INT,
IN from_mfy INT,
IN to_region INT,
IN to_district INT,
IN to_mfy INT,
IN is_active BIT
)
BEGIN

DECLARE r_id INT;
SELECT id INTO r_id  FROM `magister_ay`.`tbl_routes` WHERE id = _id;
 
IF(r_id IS NULL) THEN
	INSERT INTO `magister_ay`.`tbl_routes`
	(`number_people`,`cost_person`,`type_car`,`full_salon`,`with_loan`,`size_x`,`size_y`,`size_z`,`user_id`,`kg_loan`
    ,`from_region`,`from_district`,`from_mfy`,`to_region`,`to_district`,`to_mfy`)
	VALUES
	(number_people,cost_person,type_car,full_salon,with_loan,sizeX,sizeY,sizeZ,user_id,kg_loan,from_region,from_district,from_mfy,to_region,to_district,to_mfy);
ELSE IF(r_id IS NOT NULL AND order_count > 0) THEN
	UPDATE `magister_ay`.`tbl_routes`
    SET order_count = order_count + (select order_count FROM `magister_ay`.`tbl_routes` WHERE id=r_id);
ELSE IF(r_id IS NOT NULL) THEN
	UPDATE `magister_ay`.`tbl_routes`
	SET number_people = number_people,
		cost_person = cost_person,
        type_car = type_car,
        full_salon = full_salon,
		with_loan = with_loan,
        size_x = sizeX,
        size_y = sizeY,
        size_z =sizeZ,
        kg_loan = kg_loan,
        order_count = order_count
	WHERE id = r_id;
ELSE IF(r_id IS NOT NULL AND is_active = 0) THEN
	UPDATE `magister_ay`.`tbl_routes`
    SET route_status = 'EXPIRED'
    WHERE id = r_id;
END IF;
END IF;
END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_profile`(
IN action_type VARCHAR(20),
IN r_id INT,
IN first_name VARCHAR(55),
IN last_name VARCHAR(55),
IN photo VARCHAR(255),
IN user_id INT
)
BEGIN

IF(action_type = 'POST') THEN 
INSERT INTO `magister_ay`.`tbl_profile`
(`id`,`user_id`,`first_name`,`last_name`,`photo`,`updated_on`,`created_on`)
VALUES
(user_id,first_name,last_name,photo,current_timestamp(),current_timestamp());
ELSE IF(action_type = 'UPDATE') THEN
UPDATE `magister_ay`.`tbl_profile`
SET user_id = user_id,
	first_name = first_name,
    last_name = last_name,
    photo = photo,
    updated_on = current_timestamp();
END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_status`(
IN action_type VARCHAR(50),
IN _rank DECIMAL(18,2),
IN _comment VARCHAR(1000),
IN user_id INT,
IN id INT
)
BEGIN

IF(action_type = 'POST') THEN
INSERT INTO `magister_ay`.`user_status`
(`user_id`,`rank`,`comment`,`create_on`,`updated_on`)
VALUES
(user_id,_rank,_comment,current_timestamp(),current_timestamp());
ELSE IF(action_type = 'UPDATE') THEN 
UPDATE `magister_ay`.`user_status`
SET `rank` = _rank,
	`comment` = _comment,
    updated_on = current_timestamp()
WHERE id = id;
END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_edit_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_edit_insert`(
IN uusername varchar(100),
IN pphone VARCHAR(100),
IN rrole VARCHAR(15),
IN ppassword VARCHAR(255))
BEGIN
DECLARE check_phone NUMERIC;
DECLARE check_usename NUMERIC;
DECLARE nat NUMERIC;
SET nat=0;

SELECT id INTO check_phone FROM users WHERE phone=pphone limit 1 ;  
SELECT id INTO check_usename FROM users WHERE username=uusername limit 1 ; 
 
  IF(check_phone is null or check_usename is null) THEN  
	  INSERT INTO users(username, phone,role_id,password,is_active) VALUES(uusername,pphone,rrole,ppassword,1);
	  SET nat=1;  
  /*ELSEIF(check_update IS NOT NULL) THEN 
	  UPDATE users 
      SET phone=pphone,
          role=rrole,
          password=ppassword
      where id=check_update; 
	  SET nat=2; */
  ELSEIF(check_phone IS NOT NULL) THEN  								#PHONE ALREADY EXISTS
	  SET nat=2;
  ELSEIF(check_usename IS NOT NULL) THEN
	  SET nat=3;
  END IF;
  
SELECT nat AS natija;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19  1:41:38
