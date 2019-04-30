-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Temporary table structure for view `DeathRate`
--

DROP TABLE IF EXISTS `DeathRate`;
/*!50001 DROP VIEW IF EXISTS `DeathRate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DeathRate` (
  `StateID` tinyint NOT NULL,
  `DeathRate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `EnrollmentRate`
--

DROP TABLE IF EXISTS `EnrollmentRate`;
/*!50001 DROP VIEW IF EXISTS `EnrollmentRate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `EnrollmentRate` (
  `StateID` tinyint NOT NULL,
  `EnrollmentRate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `HeartDeaths`
--

DROP TABLE IF EXISTS `HeartDeaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HeartDeaths` (
  `StateID` int(11) NOT NULL,
  `DeathRate` float DEFAULT NULL,
  `Deaths` float DEFAULT NULL,
  KEY `FK_StatesHeartDeaths` (`StateID`),
  CONSTRAINT `FK_StatesHeartDeaths` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HeartDeaths`
--

LOCK TABLES `HeartDeaths` WRITE;
/*!40000 ALTER TABLE `HeartDeaths` DISABLE KEYS */;
INSERT INTO `HeartDeaths` VALUES (1,223.2,13110),(2,135,814),(3,141.9,12398),(4,223.8,8270),(5,142.9,62797),(6,122.7,7060),(7,141.6,7138),(8,158.4,1990),(9,145.8,46440),(10,175.8,18389),(11,129.8,2575),(12,162.4,3084),(13,163.3,25394),(14,183.2,14445),(15,167.4,7180),(16,157.9,5723),(17,195.9,10343),(18,214.4,11260),(19,143.5,2844),(20,164.5,11653),(21,134.6,12140),(22,196.1,25187),(23,119.1,8230),(24,231.6,7944),(25,191.1,14820),(26,155,2164),(27,149.3,3581),(28,199.3,6417),(29,149.7,2721),(30,162.3,18840),(31,151.4,3896),(32,171.2,44092),(33,156.5,18808),(34,137.8,1326),(35,186.2,28008),(36,237.2,10772),(37,134,6942),(38,176,32312),(39,155.7,2339),(40,172,10418),(41,150.1,1710),(42,202.2,16019),(43,169.2,45346),(44,150.2,3749),(45,152.5,1332),(46,154.5,14861),(47,138.8,11582),(48,192,4849),(49,157.6,11860),(50,148.9,1001);
/*!40000 ALTER TABLE `HeartDeaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `LowestMedEnrollment`
--

DROP TABLE IF EXISTS `LowestMedEnrollment`;
/*!50001 DROP VIEW IF EXISTS `LowestMedEnrollment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LowestMedEnrollment` (
  `StateID` tinyint NOT NULL,
  `EnrollmentRate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LowestMedianIncome`
--

DROP TABLE IF EXISTS `LowestMedianIncome`;
/*!50001 DROP VIEW IF EXISTS `LowestMedianIncome`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LowestMedianIncome` (
  `StateID` tinyint NOT NULL,
  `MedianIncome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MedianIncome`
--

DROP TABLE IF EXISTS `MedianIncome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedianIncome` (
  `StateID` int(11) NOT NULL,
  `MedianIncome` float DEFAULT NULL,
  KEY `FK_StatesMedianIncome` (`StateID`),
  CONSTRAINT `FK_StatesMedianIncome` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateId`),
  CONSTRAINT `FK_StateHeart` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateId`),
  CONSTRAINT `STID` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedianIncome`
--

LOCK TABLES `MedianIncome` WRITE;
/*!40000 ALTER TABLE `MedianIncome` DISABLE KEYS */;
INSERT INTO `MedianIncome` VALUES (1,51113),(2,72231),(3,61125),(4,48829),(5,69759),(6,74172),(7,72780),(8,83382),(9,53681),(10,57016),(11,73575),(12,60208),(13,64609),(14,58873),(15,63481),(16,57872),(17,51348),(18,43903),(19,51664),(20,81084),(21,73227),(22,57700),(23,71920),(24,43441),(25,56885),(26,59087),(27,59619),(28,56550),(29,74801),(30,72997),(31,47855),(32,62447),(33,50343),(34,59886),(35,59768),(36,55006),(37,64610),(38,63173),(39,66390),(40,54971),(41,56894),(42,55240),(43,59295),(44,71319),(45,63805),(46,71293),(47,75418),(48,45392),(49,63451),(50,57837);
/*!40000 ALTER TABLE `MedianIncome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `MedianIncomeView`
--

DROP TABLE IF EXISTS `MedianIncomeView`;
/*!50001 DROP VIEW IF EXISTS `MedianIncomeView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MedianIncomeView` (
  `StateID` tinyint NOT NULL,
  `MedianIncome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Medicare`
--

DROP TABLE IF EXISTS `Medicare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicare` (
  `StateID` int(11) NOT NULL,
  `Population` int(11) NOT NULL,
  `MedicareEnrollment` int(11) DEFAULT NULL,
  `OriginalMedicare` int(11) DEFAULT NULL,
  `OriginalMedicareRate` float DEFAULT NULL,
  `MedAdvantage` int(11) DEFAULT NULL,
  `MedAdvantageRate` float DEFAULT NULL,
  `TotalEnrollMetro` int(11) DEFAULT NULL,
  `TotalEnrollMicro` int(11) DEFAULT NULL,
  `TotalEnrollmentNCBSA` int(11) DEFAULT NULL,
  `EnrollmentRate` float DEFAULT NULL,
  KEY `FK_StatesMedicare` (`StateID`),
  CONSTRAINT `FK_StatesMedicare` FOREIGN KEY (`StateID`) REFERENCES `States` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicare`
--

LOCK TABLES `Medicare` WRITE;
/*!40000 ALTER TABLE `Medicare` DISABLE KEYS */;
INSERT INTO `Medicare` VALUES (1,4860545,988043,726139,73.49,261904,26.51,719606,158387,110051,20.3),(2,741522,87878,87151,74.49,727,27.51,56666,6679,24533,11.9),(3,6908642,1180422,730023,75.49,450399,28.51,1111426,50889,18107,17.1),(4,2988231,606142,480306,76.49,125836,29.51,334440,135030,136672,20.3),(5,39296476,5814275,3420954,77.49,2393321,30.51,5614040,132373,67862,14.8),(6,5530105,815871,515310,78.49,300561,31.51,686767,62736,66368,14.8),(7,3587685,641887,472113,79.49,169775,32.51,602485,39403,0,17.9),(8,952698,186822,169186,80.49,17636,33.51,186821,0,0,19.6),(9,20656589,4163699,2466777,81.49,1696922,34.51,4014663,73521,75516,20.2),(10,10313620,1573277,1049087,82.49,524190,35.51,1214521,186634,172122,15.3),(11,1428683,251978,137629,83.49,114349,36.51,198705,53273,0,17.6),(12,1680026,293980,200017,84.49,93962,37.51,189429,69576,34975,17.5),(13,12835726,2108645,1645577,85.49,463068,38.51,1782629,188996,137021,16.4),(14,6634007,1178106,887252,86.49,290854,39.51,877159,205091,95856,17.8),(15,3130869,584906,482852,87.49,102054,40.51,303340,117701,163865,18.7),(16,2907731,498471,426275,88.49,72196,41.51,312665,97100,88706,17.1),(17,4436113,879560,639581,89.49,239979,42.51,455809,197286,226465,19.8),(18,4686157,809714,554588,90.49,255126,43.51,661410,81993,66310,17.3),(19,1330232,314300,235681,91.49,78619,44.51,172434,29959,111907,23.6),(20,6024752,957992,864190,92.49,93802,45.51,920961,18246,18785,15.9),(21,6823721,1245919,981747,93.49,264172,46.51,1223003,21141,1774,18.3),(22,9933445,1938307,1270636,94.49,667672,47.51,1508692,241974,187642,19.5),(23,5525050,940548,418501,95.49,522046,48.51,662920,158849,118779,17),(24,2985415,569150,479783,96.49,89367,49.51,235587,193709,139854,19.1),(25,6091176,1160093,812974,97.49,347119,50.51,810073,149114,200906,19.1),(26,1038656,208306,167088,98.49,41218,51.51,68342,58295,81669,20.1),(27,1907603,321951,281922,99.49,40029,52.51,182996,63511,75443,16.9),(28,2939254,472085,311900,100.49,160186,53.51,410931,55078,6076,16.1),(29,1335015,272375,249623,101.49,22752,54.51,154815,103412,14148,20.4),(30,8978416,1523299,1269434,102.49,253865,55.51,1523295,0,0,17),(31,2085432,384392,260681,103.49,123711,56.51,251123,113357,19911,18.4),(32,19836286,3410034,2139045,104.49,1270989,57.51,3107025,215031,87978,17.2),(33,10156689,1823035,1262678,105.49,560358,58.51,1329477,342955,150603,18),(34,755548,120873,97461,106.49,23412,59.51,53206,26179,41488,16),(35,11622554,2202060,1378970,107.49,823090,60.51,1711683,400090,90286,19),(36,3921207,692871,572942,108.49,119929,61.51,431074,142386,119412,17.7),(37,4085989,782260,436561,109.49,345699,62.51,613933,141493,26834,19.1),(38,12787085,2581572,1548833,110.49,1032738,63.51,2235464,255388,90720,20.2),(39,1057566,207345,132571,111.49,74774,64.51,207345,0,0,19.6),(40,4959822,974034,737612,112.49,236421,65.51,799419,104966,69649,19.6),(41,861542,160698,126561,113.49,34137,66.51,73547,42261,44890,18.7),(42,6649404,1265781,816458,114.49,449322,67.51,906078,206410,153293,19),(43,27904862,3757335,2512097,115.49,1245237,68.51,3147096,305124,305115,13.5),(44,3044321,358777,235447,116.49,123331,69.51,311155,23270,24353,11.8),(45,623354,135288,124848,117.49,10441,70.51,37676,60568,37044,21.7),(46,8414380,1389142,1133636,118.49,255506,71.51,1115691,73507,199944,16.5),(47,7280934,1235086,864272,119.49,370814,72.51,1059941,128564,46582,17),(48,1828637,421908,310597,120.49,111312,73.51,246070,72320,103519,23.1),(49,5772917,1079832,660728,121.49,419104,74.51,739352,159779,180701,18.7),(50,584910,98262,94816,122.49,3445,75.51,30082,35162,33018,16.8);
/*!40000 ALTER TABLE `Medicare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `StateId` int(11) NOT NULL,
  `StateName` varchar(50) NOT NULL,
  PRIMARY KEY (`StateId`),
  KEY `StateInd` (`StateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
INSERT INTO `States` VALUES (1,'ALABAMA'),(2,'ALASKA'),(3,'ARIZONA'),(4,'ARKANSAS'),(5,'CALIFORNIA'),(6,'COLORADO'),(7,'CONNECTICUT'),(8,'DELAWARE'),(9,'FLORIDA'),(10,'GEORGIA'),(11,'HAWAII'),(12,'IDAHO'),(13,'ILLINOIS'),(14,'INDIANA'),(15,'IOWA'),(16,'KANSAS'),(17,'KENTUCKY'),(18,'LOUISIANA'),(19,'MAINE'),(20,'MARYLAND'),(21,'MASSACHUSETTS'),(22,'MICHIGAN'),(23,'MINNESOTA'),(24,'MISSISSIPPI'),(25,'MISSOURI'),(26,'MONTANA'),(27,'NEBRASKA'),(28,'NEVADA'),(29,'NEW HAMPSHIRE'),(30,'NEW JERSEY'),(31,'NEW MEXICO'),(32,'NEW YORK'),(33,'NORTH CAROLINA'),(34,'NORTH DAKOTA'),(35,'OHIO'),(36,'OKLAHOMA'),(37,'OREGON'),(38,'PENNSYLVANIA'),(39,'RHODE ISLAND'),(40,'SOUTH CAROLINA'),(41,'SOUTH DAKOTA'),(42,'TENNESSEE'),(43,'TEXAS'),(44,'UTAH'),(45,'VERMONT'),(46,'VIRGINIA'),(47,'WASHINGTON'),(48,'WEST VIRGINIA'),(49,'WISCONSIN'),(50,'WYOMING');
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `TopDeathRates`
--

DROP TABLE IF EXISTS `TopDeathRates`;
/*!50001 DROP VIEW IF EXISTS `TopDeathRates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TopDeathRates` (
  `StateID` tinyint NOT NULL,
  `DeathRate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TopMedEnrollment`
--

DROP TABLE IF EXISTS `TopMedEnrollment`;
/*!50001 DROP VIEW IF EXISTS `TopMedEnrollment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TopMedEnrollment` (
  `StateID` tinyint NOT NULL,
  `EnrollmentRate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `DeathRate`
--

/*!50001 DROP TABLE IF EXISTS `DeathRate`*/;
/*!50001 DROP VIEW IF EXISTS `DeathRate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DeathRate` AS select `HeartDeaths`.`StateID` AS `StateID`,`HeartDeaths`.`DeathRate` AS `DeathRate` from `HeartDeaths` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `EnrollmentRate`
--

/*!50001 DROP TABLE IF EXISTS `EnrollmentRate`*/;
/*!50001 DROP VIEW IF EXISTS `EnrollmentRate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `EnrollmentRate` AS select `Medicare`.`StateID` AS `StateID`,`Medicare`.`EnrollmentRate` AS `EnrollmentRate` from `Medicare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LowestMedEnrollment`
--

/*!50001 DROP TABLE IF EXISTS `LowestMedEnrollment`*/;
/*!50001 DROP VIEW IF EXISTS `LowestMedEnrollment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LowestMedEnrollment` AS select `Medicare`.`StateID` AS `StateID`,`Medicare`.`EnrollmentRate` AS `EnrollmentRate` from `Medicare` order by `Medicare`.`EnrollmentRate` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LowestMedianIncome`
--

/*!50001 DROP TABLE IF EXISTS `LowestMedianIncome`*/;
/*!50001 DROP VIEW IF EXISTS `LowestMedianIncome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LowestMedianIncome` AS select `MedianIncome`.`StateID` AS `StateID`,`MedianIncome`.`MedianIncome` AS `MedianIncome` from `MedianIncome` order by `MedianIncome`.`MedianIncome` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MedianIncomeView`
--

/*!50001 DROP TABLE IF EXISTS `MedianIncomeView`*/;
/*!50001 DROP VIEW IF EXISTS `MedianIncomeView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MedianIncomeView` AS select `MedianIncome`.`StateID` AS `StateID`,`MedianIncome`.`MedianIncome` AS `MedianIncome` from `MedianIncome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TopDeathRates`
--

/*!50001 DROP TABLE IF EXISTS `TopDeathRates`*/;
/*!50001 DROP VIEW IF EXISTS `TopDeathRates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TopDeathRates` AS select `HeartDeaths`.`StateID` AS `StateID`,`HeartDeaths`.`DeathRate` AS `DeathRate` from `HeartDeaths` order by `HeartDeaths`.`DeathRate` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TopMedEnrollment`
--

/*!50001 DROP TABLE IF EXISTS `TopMedEnrollment`*/;
/*!50001 DROP VIEW IF EXISTS `TopMedEnrollment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flamgoni`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TopMedEnrollment` AS select `Medicare`.`StateID` AS `StateID`,`Medicare`.`EnrollmentRate` AS `EnrollmentRate` from `Medicare` order by `Medicare`.`EnrollmentRate` desc limit 10 */;
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

-- Dump completed on 2019-04-28  0:52:23
