-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_shop_shoe
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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Adidas'),(2,'Nike');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Men'),(2,'Women'),(3,'Kid');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discount` float DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `orderid` bigint DEFAULT NULL,
  `productid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1lhfawvk8mj1gbupoppgs5jo2` (`orderid`),
  KEY `FKa2m96xa8edv7vwaqs9aowm0fb` (`productid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,0,NULL,3600000,2,1,144),(2,0,NULL,1900000,1,1,155),(3,0,NULL,3800000,2,2,148),(4,0,NULL,1900000,1,2,123),(5,0,NULL,1900000,1,2,157);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deliveryaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `totalprice` double DEFAULT NULL,
  `totalquantity` int DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK563po51s67jrf7ehy6l9y0k40` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'hcm','2023-02-08 11:58:44','Pending',5500000,3,2),(2,'hn','2023-02-08 17:24:59','Pending',7600000,4,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoryid` bigint DEFAULT NULL,
  `brandid` bigint DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcnms1ob44hrcxbdg5wd58n1q5` (`brandid`),
  KEY `FKfbeednc30u291t4we3dxdt86v` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (24,1,1,'ALPHABOOST',2900000,10,0,'nam-adidas-alphaboost.jpg',NULL,NULL,NULL),(25,1,1,'CLIMACOOL VENT WHITE',2600000,10,0,'nam-adidas-climacool-vent-white.jpg',NULL,NULL,NULL),(26,1,1,'DAY JOGGER BLACK',2800000,10,0,'nam-adidas-day-jogger-black.jpeg',NULL,NULL,NULL),(27,1,1,'EQ21',2600000,10,0,'nam-adidas-eq21.jpg',NULL,NULL,NULL),(28,1,1,'EQ21 RUN',2600000,10,0,'nam-adidas-eq21-run.jpg',NULL,NULL,NULL),(29,1,1,'FALCON RUN',2200000,10,0,'nam-adidas-falcon-run.jpg',NULL,NULL,NULL),(30,1,1,'FORUM LOW BLUE',2900000,10,0,'nam-adidas-forum-low-blue.jpg',NULL,NULL,NULL),(31,1,1,'FORUM LOW GREEN',2900000,10,0,'nam-adidas-forum-low-green.jpg',NULL,NULL,NULL),(32,1,1,'GUCCI RHYTON WORLDWIDE WHITE',21000000,10,0,'nam-adidas-gucci-rhyton-workldwide-white.jpeg',NULL,NULL,NULL),(33,1,1,'HUMAN NMD',5800000,10,0,'nam-adidas-human-nmd.jpg',NULL,NULL,NULL),(34,1,1,'NEW BALANCE',3300000,10,0,'nam-adidas-new-balance.jpg',NULL,NULL,NULL),(35,1,1,'NEW BALANCE 550 BLACK RED',4800000,10,0,'nam-adidas-new-balance-550-black-red.jpeg',NULL,NULL,NULL),(36,1,1,'NEW BALANCE 550 WHITE RED BLACK',4800000,10,0,'nam-adidas-new-balance-550-white-red-black.jpeg',NULL,NULL,NULL),(37,1,1,'NMD R1 SPECTOO',2000000,10,0,'nam-adidas-nmd-r1-spectoo.jpg',NULL,NULL,NULL),(38,1,1,'NMD R1 V2 SILVER GOLD',2800000,10,0,'nam-adidas-nmd-r1-v2-silver-gold.jpeg',NULL,NULL,NULL),(39,1,1,'OZELIA',2600000,10,0,'nam-adidas-ozelia.jpg',NULL,NULL,NULL),(40,1,1,'OZELIA BOBA FETT',2600000,10,0,'nam-adidas-ozelia-boba-fett.jpg',NULL,NULL,NULL),(41,1,1,'PUMA COURT RIDER',2900000,10,0,'nam-adidas-puma-court-rider.jpeg',NULL,NULL,NULL),(42,1,1,'PUMA IVORY GLOW',2900000,10,0,'nam-adidas-puma-ivory-glow.jpg',NULL,NULL,NULL),(43,1,1,'ROD LAVER',2200000,10,0,'nam-adidas-rod-laver.jpg',NULL,NULL,NULL),(44,1,1,'SOLAR HU GLIDE WHITE',4900000,10,0,'nam-adidas-solar-hu-glide-white.jpg',NULL,NULL,NULL),(45,1,1,'STAN SMITH GREEN',1900000,10,0,'nam-adidas-stan-smith-green.jpg',NULL,NULL,NULL),(46,1,1,'SUPERNOVA',2500000,10,0,'nam-adidas-supernova.jpg',NULL,NULL,NULL),(47,1,1,'SUPERSTAR',2200000,10,0,'nam-adidas-superstar.jpeg',NULL,NULL,NULL),(48,1,1,'SUPERSTAR DISNEY MICKEY MOUSE',2200000,10,0,'nam-adidas-superstar-disney-mickey-mouse.jpg',NULL,NULL,NULL),(49,1,1,'ULTRA 4D',5800000,10,0,'nam-adidas-ultra-4d.jpg',NULL,NULL,NULL),(50,1,1,'ULTRA 4D 5',5800000,10,0,'nam-adidas-ultra-4d-5.jpg',NULL,NULL,NULL),(51,1,1,'ULTRA 4D HURRICANES',5800000,10,0,'nam-adidas-ultra4d-hurricanes.jpg',NULL,NULL,NULL),(52,1,1,'ULTRABOOST 4 DNA',4200000,10,0,'nam-adidas-ultraboost-4-dna.jpg',NULL,NULL,NULL),(53,1,1,'ULTRABOOST 5 DNA',4200000,10,0,'nam-adidas-ultraboost-5-dna.jpg',NULL,NULL,NULL),(54,1,1,'ULTRABOOST 20 BLACK SILVER',4200000,10,0,'nam-adidas-ultraboost-20-black-silver.jpeg',NULL,NULL,NULL),(55,1,1,'ULTRABOOST 20 BLUE BOOST',4200000,10,0,'nam-adidas-ultraboost-20-blue-boost.jpeg',NULL,NULL,NULL),(56,1,1,'ULTRABOOST 20 METALLIC GOLD',4200000,10,0,'nam-adidas-ultraboost-20-metallic-gold.jpeg',NULL,NULL,NULL),(57,1,1,'ULTRABOOST 20 PRIMEBLUE',4200000,10,0,'nam-adidas-ultraboost-20-primeblue.jpg',NULL,NULL,NULL),(58,1,1,'ULTRABOOST DNA BLACK',4200000,10,0,'nam-adidas-ultraboost-dna-black.jpg',NULL,NULL,NULL),(59,1,1,'ULTRABOOST TRIPLE WHITE',4200000,10,0,'nam-adidas-ultraboost-triple-white.jpg',NULL,NULL,NULL),(60,1,1,'ULTRABOOST WEB DNA',4200000,10,0,'nam-adidas-ultraboost-web-dna.jpg',NULL,NULL,NULL),(61,1,1,'X9000L4 ADIDAS',2900000,10,0,'nam-adidas-x9000l4-adidas.jpg',NULL,NULL,NULL),(62,1,1,'ZX 2K BOOST',3200000,10,0,'nam-adidas-zx-2k-boost.jpg',NULL,NULL,NULL),(63,1,1,'ZX 2K BOOST 2',2900000,10,0,'nam-adidas-zx-2k-boost-2.jpg',NULL,NULL,NULL),(64,1,2,'AIR FORCE 1',2900000,10,0,'nam-nike-air-force-1.jpg',NULL,NULL,NULL),(65,1,2,'AIR FORCE 1 FONTANKA',2900000,10,0,'nam-nike-air-force-1-fontanka.jpeg',NULL,NULL,NULL),(66,1,2,'AIR FORCE 1 LV8',3600000,10,0,'nam-nike-air-force-1-lv8.jpeg',NULL,NULL,NULL),(67,1,2,'AIR FORCE 1 LV8 UTILITY GS',3900000,10,0,'nam-nike-air-force-1-lv8-utility-gs.jpeg',NULL,NULL,NULL),(68,1,2,'AIR FORCE 1 WHITE METALIC',3600000,10,0,'nam-nike-air-force-1-white-metalic.jpeg',NULL,NULL,NULL),(69,1,2,'AIR MAX 1 SP',6800000,10,0,'nam-nike-air-max-1-sp.jpeg',NULL,NULL,NULL),(70,1,2,'AIR MAX 95 RUNNING CLUB',3900000,10,0,'nam-nike-air-max-95-running-club.jpeg',NULL,NULL,NULL),(71,1,2,'AIR MAX 96 ll BATMAN',3900000,10,0,'nam-nike-air-max-96-ll-batman.jpeg',NULL,NULL,NULL),(72,1,2,'AIR MAX 97 RUNNING CLUB',4200000,10,0,'nam-nike-air-max-97-running-club.jpeg',NULL,NULL,NULL),(73,1,2,'AIR MAX 2017',4300000,10,0,'nam-nike-air-max-2017.jpeg',NULL,NULL,NULL),(74,1,2,'AIR MAX AP',3200000,10,0,'nam-nike-air-max-ap.jpeg',NULL,NULL,NULL),(75,1,2,'AIR MAX AP MARATHON',3200000,10,0,'nam-nike-air-max-ap-marathon.jpeg',NULL,NULL,NULL),(76,1,2,'AIR MAX EXCEE',2900000,10,0,'nam-nike-air-max-excee.jpeg',NULL,NULL,NULL),(77,1,2,'AIR MAX PLUS',3900000,10,0,'nam-nike-air-max-plus.jpg',NULL,NULL,NULL),(78,1,2,'AIR MAX PRE DAY',3600000,10,0,'nam-nike-air-max-pre-day.jpeg',NULL,NULL,NULL),(79,1,2,'AIR MAX TERRASCAPE',3700000,10,0,'nam-nike-air-max-terrascape-90.jpeg',NULL,NULL,NULL),(80,1,2,'AIR MORE UPTEMPO 96',4200000,10,0,'nam-nike-air-more-uptempo-96.jpeg',NULL,NULL,NULL),(81,1,2,'AIR MORE UPTEMPO WHEAT',4800000,10,0,'nam-nike-air-more-uptempo-wheat.jpeg',NULL,NULL,NULL),(82,1,2,'AIR TUNED MAX',3900000,10,0,'nam-nike-air-tuned-max.jpeg',NULL,NULL,NULL),(83,1,2,'AIR VAPORMAX FLYKNIT 2',4200000,10,0,'nam-nike-air-vapormax-flyknit-2.jpg',NULL,NULL,NULL),(84,1,2,'AIR ZM PEGASUS 37 SHIELD',3600000,10,0,'nam-nike-air-zm-pegasus-37-shield.jpeg',NULL,NULL,NULL),(85,1,2,'AIR ZOOM PEGASUS 38',3400000,10,0,'nam-nike-air-zoom-pegasus-38.jpeg',NULL,NULL,NULL),(86,1,2,'AIR ZOOM TERRA KIGER 8',3600000,10,0,'nam-nike-air-zoom-terra-kiger-8.jpeg',NULL,NULL,NULL),(87,1,2,'GTS 97 DENIM',2900000,10,0,'nam-nike-gts-97-denim.jpeg',NULL,NULL,NULL),(88,1,2,'JORDAN POINT LANE',4200000,10,0,'nam-nike-jordan-point-lane.jpeg',NULL,NULL,NULL),(89,1,2,'JORDAN SERIES ES PHANTOM',3200000,10,0,'nam-nike-jordan-series-es-phantom.jpeg',NULL,NULL,NULL),(90,1,2,'LEBRON 18 LOW ACG TERRA',3900000,10,0,'nam-nike-lebron-18-low-acg-terra.jpeg',NULL,NULL,NULL),(91,1,2,'NEW BALANCE 550 BLACK RED',4800000,10,0,'nam-nike-new-balance-550-black-red.jpeg',NULL,NULL,NULL),(92,1,2,'NIKECOURT AIR ZOOM GP TURBO',4200000,10,0,'nam-nike-nikecourt-air-zoom-gp-turbo.jpeg',NULL,NULL,NULL),(93,1,2,'NIKECOURT REACT VAPOR NXT',4500000,10,0,'nam-nike-nikecourt-react-vapor-nxt.jpeg',NULL,NULL,NULL),(94,1,2,'NIKECOURT VAPOR LITE HC',2800000,10,0,'nam-nike-nikecourt-vapor-lite-hc.jpeg',NULL,NULL,NULL),(95,1,2,'PEGASUS 38 OREGON',3600000,10,0,'nam-nike-pegasus-38-oregon.jpeg',NULL,NULL,NULL),(96,1,2,'PEGASUS TRAIL 3',3600000,10,0,'nam-nike-pegasus-trail-3.jpeg',NULL,NULL,NULL),(97,1,2,'PEGASUS TRAIL 3 GTX',3600000,10,0,'nam-nike-pegasus-trail-3-gtx.jpeg',NULL,NULL,NULL),(98,1,2,'REACT INFINITY RUN FK2 KA',3600000,10,0,'nam-nike-react-infinity-run-fk2-ka.jpeg',NULL,NULL,NULL),(99,1,2,'REACT LIVE',2800000,10,0,'nam-nike-react-live.jpeg',NULL,NULL,NULL),(100,1,2,'REACT PHANTOM RUN FK2',3600000,10,0,'nam-nike-react-phantom-run-fk2.jpeg',NULL,NULL,NULL),(101,1,2,'RENEW RIDE 2',2200000,10,0,'nam-nike-renew-ride-2.jpeg',NULL,NULL,NULL),(102,1,2,'VAPORMAX FK 3',4200000,10,0,'nam-nike-vapormax-fk-3.jpg',NULL,NULL,NULL),(103,1,2,'VICTORY G LITE NN',2800000,10,0,'nam-nike-victory-g-lite-nn.jpeg',NULL,NULL,NULL),(104,2,2,'AIR FORCE 1 07 SKELETON QS',6800000,10,0,'nu-nike-air-force-1-07-skeleton-qs.png',NULL,NULL,NULL),(105,2,2,'AIR FORCE 1 BARLEY PAISLEY',4200000,10,0,'nu-nike-air-force-1-barley-paisley.jpeg',NULL,NULL,NULL),(106,2,2,'AIR DORCE 1 FONTANKA',2000000,10,0,'nu-nike-air-force-1-fontanka.jpeg',NULL,NULL,NULL),(107,2,2,'AIR FORCE 1 LIGHT OREWOOD BROWN',4200000,10,0,'nu-nike-air-force-1-light-orewood-brown.jpeg',NULL,NULL,NULL),(108,2,2,'AIR FORCE 1 LOW CATECHU',3600000,10,0,'nu-nike-air-force-1-low-catechu.jpeg',NULL,NULL,NULL),(109,2,2,'AIR FORCE 1 LV8',3300000,10,0,'nu-nike-air-force-1-lv8.jpeg',NULL,NULL,NULL),(110,2,2,'AIR FORCE 1 LV8 UTILITY GS',3900000,10,0,'nu-nike-air-force-1-lv8-utility-gs.jpeg',NULL,NULL,NULL),(111,2,2,'AIR FORCE 1 SE',3600000,10,0,'nu-nike-air-force-1-se.jpeg',NULL,NULL,NULL),(112,2,2,'AIR FORCE 1 WHITE METALIC',3600000,10,0,'nu-nike-air-force-1-white-metalic.jpeg',NULL,NULL,NULL),(113,2,2,'AIR HUARACHE',3200000,10,0,'nu-nike-air-huarache.jpg',NULL,NULL,NULL),(114,2,2,'AIR MAX 95 GS',3500000,10,0,'nu-nike-air-max-95-gs.jpeg',NULL,NULL,NULL),(115,2,2,'AIR MAX 97',4200000,10,0,'nu-nike-air-max-97.jpg',NULL,NULL,NULL),(116,2,2,'AIR MAX 97 TRIPLE WHITE',4200000,10,0,'nu-nike-air-max-97-triple-white.png',NULL,NULL,NULL),(117,2,2,'AIR MAX 2021',3900000,10,0,'nu-nike-air-max-2021.jpeg',NULL,NULL,NULL),(118,2,2,'AIR MAX 2021 ROSE',3900000,10,0,'nu-nike-air-max-2021-rose.jpeg',NULL,NULL,NULL),(119,2,2,'AIR MAX AP',3200000,10,0,'nu-nike-air-max-ap.jpeg',NULL,NULL,NULL),(120,2,2,'AIR MAX BOLT',2800000,10,0,'nu-nike-air-max-bolt.jpeg',NULL,NULL,NULL),(121,2,2,'AIR MAX DAWN SE',3600000,10,0,'nu-nike-air-max-dawn-se.jpeg',NULL,NULL,NULL),(122,2,2,'AIR MAX DIA',3000000,10,0,'nu-nike-air-max-dia.jpeg',NULL,NULL,NULL),(123,2,2,'AIR MAX EXCEE',1900000,10,0,'nu-nike-air-max-excee.jpeg',NULL,NULL,NULL),(124,2,2,'AIR MAX SC',2900000,10,0,'nu-nike-air-max-sc.jpeg',NULL,NULL,NULL),(125,2,2,'AIR MAX TERRASCAPE 90',3700000,10,0,'nu-nike-air-max-terrascape-90.jpeg',NULL,NULL,NULL),(126,2,2,'AIR MORE UPTEMPO WHEAT',4800000,10,0,'nu-nike-air-more-uptempo-wheat.jpeg',NULL,NULL,NULL),(127,2,2,'AIR ZOOM PEGASUS 38 PATRIOTS',3200000,10,0,'nu-nike-air-zoom-pegasus-38-patriots.jpeg',NULL,NULL,NULL),(128,2,2,'AIR ZOOM PEGASUS 38 RAWDACIOUS',3200000,10,0,'nu-nike-air-zoom-pegasus-38-rawdacious.jpeg',NULL,NULL,NULL),(129,2,2,'CORTEZ CLASSIC',2900000,10,0,'nu-nike-cortez-classic.jpeg',NULL,NULL,NULL),(130,2,2,'COURT LEGACY',2200000,10,0,'nu-nike-court-legacy.jpeg',NULL,NULL,NULL),(131,2,2,'FREE RUN 2',2900000,10,0,'nu-nike-free-run-2.jpeg',NULL,NULL,NULL),(132,2,2,'GTS 97',2800000,10,0,'nu-nike-gts-97.jpeg',NULL,NULL,NULL),(133,2,2,'HUARACHE GTES',2800000,10,0,'nu-nike-huarache-gtes.jpeg',NULL,NULL,NULL),(134,2,2,'PEGASUS 38 OREGON',3600000,10,0,'nu-nike-pegasus-38-oregon.jpeg',NULL,NULL,NULL),(135,2,2,'PEGASUS 38 WHITE METALLIC',3200000,10,0,'nu-nike-pegasus-38-white-metallic.jpeg',NULL,NULL,NULL),(136,2,2,'REACT INFINITY RUN FK 2',3800000,10,0,'nu-nike-react-infinity-run-fk-2.jpeg',NULL,NULL,NULL),(137,2,2,'REACT INFINITY RUN FK 3',3800000,10,0,'nu-nike-react-infinity-run-fk-3.jpeg',NULL,NULL,NULL),(138,2,2,'REACT INFINITY RUN FLYKNIT 2',3800000,10,0,'nu-nike-react-infinity-run-flyknit-2.jpeg',NULL,NULL,NULL),(139,2,2,'REACT PHANTOM RUN FK 2',3600000,10,0,'nu-nike-react-phantom-run-fk-2.jpeg',NULL,NULL,NULL),(140,2,2,'ZOOM COURT LITE 3',2800000,10,0,'nu-nike-zoom-court-lite-3.jpeg',NULL,NULL,NULL),(141,2,2,'ZOOM FLY 4',3600000,10,0,'nu-nike-zoom-fly-4.jpeg',NULL,NULL,NULL),(142,2,2,'ZOOM PEGASUS FLYEASE',3800000,10,0,'nu-nike-zoom-pegasus-flyease.jpeg',NULL,NULL,NULL),(143,2,2,'ZOOM X INVICIBLE',3900000,10,0,'nu-nike-zoom-x-invicible.jpeg',NULL,NULL,NULL),(144,2,1,'ADIDAS QTFLEX',1800000,10,0,'nu-adidas-adidas-qtflex.jpeg',NULL,NULL,NULL),(145,2,1,'CLIMACOOL VENT WHITE',2600000,10,0,'nu-adidas-climacool-vent-white.jpg',NULL,NULL,NULL),(146,2,1,'CONTINENTAL 80',2600000,10,0,'nu-adidas-continental-80.jpg',NULL,NULL,NULL),(147,2,1,'DAY JOGGER DASH GREEN LINEN',2700000,10,0,'nu-adidas-day-jogger-dash-green-linen.jpg',NULL,NULL,NULL),(148,2,1,'EGDE LUX 4',1900000,10,0,'nu-adidas-egde-lux-4.jpeg',NULL,NULL,NULL),(149,2,1,'FALCON PINK PURPLE',2600000,10,0,'nu-adidas-falcon-pink-purple.jpeg',NULL,NULL,NULL),(150,2,1,'FORUM LOW BLUE',2900000,10,0,'nu-adidas-forum-low-blue.jpg',NULL,NULL,NULL),(151,2,1,'NMD R1 GLORY GREEN',2300000,10,0,'nu-adidas-nmd-r1-glory-green.jpeg',NULL,NULL,NULL),(152,2,1,'NMD R1 GREY',2400000,10,0,'nu-adidas-nmd-r1-grey.jpg',NULL,NULL,NULL),(153,2,1,'NMD R1 LIGHT GRANITE',2500000,10,0,'nu-adidas-nmd-r1-light-granite.jpeg',NULL,NULL,NULL),(154,2,1,'NMD R1 METALLIC GOLD',2800000,10,0,'nu-adidas-nmd-r1-metallic-gold.jpeg',NULL,NULL,NULL),(155,2,1,'NMD R1 SPECTOO',1900000,10,0,'nu-adidas-nmd-r1-spectoo.jpg',NULL,NULL,NULL),(156,2,1,'SN1997 X MARIMEKKO',2800000,10,0,'nu-adidas-sn1997-x-marimekko.jpg',NULL,NULL,NULL),(157,2,1,'STAN SMITH GREEN',1900000,10,0,'nu-adidas-stan-smith-green.jpg',NULL,NULL,NULL),(158,2,1,'SUPERGRIP',2600000,10,0,'nu-adidas-supergrip.jpg',NULL,NULL,NULL),(159,2,1,'SUPERSTAR',2200000,10,0,'nu-adidas-superstar.jpeg',NULL,NULL,NULL),(160,2,1,'SWIFT RUN X',1900000,10,0,'nu-adidas-swift-run-x.jpeg',NULL,NULL,NULL),(161,2,1,'ULTRABOOST 2 ALL BLACK',3700000,10,0,'nu-adidas-ultraboost-2-all-black.jpeg',NULL,NULL,NULL),(162,2,1,'ULTRABOOST 20 BLUE BOOST',4000000,10,0,'nu-adidas-ultraboost-20-blue-boost.jpeg',NULL,NULL,NULL),(163,2,1,'ULTRABOOST 20 CLOUD WHITE',3700000,10,0,'nu-adidas-ultraboost-20-cloud-white.jpeg',NULL,NULL,NULL),(164,2,1,'ULTRABOOST 20 METALLIC GOLD',4000000,10,0,'nu-adidas-ultraboost-20-metallic-gold.jpeg',NULL,NULL,NULL),(165,2,1,'ULTRABOOST 20 TECH PURPLE',3700000,10,0,'nu-adidas-ultraboost-20-tech-purple.jpeg',NULL,NULL,NULL),(166,2,1,'ULTRABOOST 21',4000000,10,0,'nu-adidas-ultraboost-21.jpeg',NULL,NULL,NULL),(167,2,1,'XPLR',2300000,10,0,'nu-adidas-xplr.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slides` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,'Black Friday\'s','Let\'s do some shopping','hero-1.jpg'),(2,'Black Friday\'s','Let\'s do some shopping','hero-2.jpg'),(3,'Black Friday\'s','Let\'s do some shopping','hero-3.jpg');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsatk0uuyupnf604tkgxxiy6jt` (`email`,`phone`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin123','$2a$12$xhxO.fh2WHse3u8V86K6De/R9g3n9CSa4vjpHTh4nckvsA0CdFFSW','admin','admin@gmail.com','0123456789','hcm','banner-2.jpg',NULL,'2023-02-04 12:37:14','ROLE_ADMIN','InActivated'),(2,'user123','$2a$12$xhxO.fh2WHse3u8V86K6De/R9g3n9CSa4vjpHTh4nckvsA0CdFFSW','user','user@gmail.com','0123456789','hcm','banner-2.jpg',NULL,'2023-02-10 16:52:08','ROLE_USER','InActivated'),(3,'staff123','$2a$12$xhxO.fh2WHse3u8V86K6De/R9g3n9CSa4vjpHTh4nckvsA0CdFFSW','staff','staff@gmail.com','0123456789','hcm',NULL,NULL,'2023-02-10 16:52:19','ROLE_STAFF','Activated'),(4,'shipper123','$2a$12$xhxO.fh2WHse3u8V86K6De/R9g3n9CSa4vjpHTh4nckvsA0CdFFSW','shipper','shipper@gmail.com','0123456789','hcm',NULL,NULL,'2023-02-10 16:52:17','ROLE_SHIPPER','Activated');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-13 16:42:56
