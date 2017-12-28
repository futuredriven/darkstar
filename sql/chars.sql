-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `chars`
--

DROP TABLE IF EXISTS `chars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chars` (
  `charid` int(10) unsigned NOT NULL,
  `accid` int(10) unsigned NOT NULL,
  `charname` varchar(15) NOT NULL,
  `nation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pos_zone` smallint(3) unsigned NOT NULL,
  `pos_prevzone` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pos_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `moghouse` int(10) unsigned NOT NULL DEFAULT '0',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `home_zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_x` float(7,3) NOT NULL DEFAULT '0.000',
  `home_y` float(7,3) NOT NULL DEFAULT '0.000',
  `home_z` float(7,3) NOT NULL DEFAULT '0.000',
  `missions` blob,
  `assault` blob,
  `campaign` blob,
  `quests` blob,
  `keyitems` blob,
  `set_blue_spells` blob,
  `abilities` blob,
  `weaponskills` blob,
  `titles` blob,
  `zones` blob,
  `playtime` int(10) unsigned NOT NULL DEFAULT '0',
  `unlocked_weapons` blob,
  `gmlevel` smallint(3) unsigned NOT NULL DEFAULT '0',
  `isnewplayer` smallint(3) NOT NULL DEFAULT '1',
  `mentor` smallint(3) NOT NULL DEFAULT '0',
  `campaign_allegiance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isstylelocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`),
  FULLTEXT KEY `charname` (`charname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chars`
--

LOCK TABLES `chars` WRITE;
/*!40000 ALTER TABLE `chars` DISABLE KEYS */;
/*!40000 ALTER TABLE `chars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`FFXIAdmin`@`localhost`*/ /*!50003 TRIGGER char_insert
	BEFORE INSERT ON chars
	FOR EACH ROW
BEGIN
	INSERT INTO `char_equip`     SET `charid` = NEW.charid;
	INSERT INTO `char_exp`       SET `charid` = NEW.charid;
	INSERT INTO `char_jobs`      SET `charid` = NEW.charid;
	INSERT INTO `char_pet`       SET `charid` = NEW.charid;
	INSERT INTO `char_points`    SET `charid` = NEW.charid;
	INSERT INTO `char_profile`   SET `charid` = NEW.charid;
	INSERT INTO `char_storage`   SET `charid` = NEW.charid;
	INSERT INTO `char_inventory` SET `charid` = NEW.charid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`FFXIAdmin`@`localhost`*/ /*!50003 TRIGGER char_delete
	BEFORE DELETE ON chars
	FOR EACH ROW
BEGIN
	DELETE FROM `char_effects`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_equip`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_exp`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_inventory` WHERE `charid` = OLD.charid;
	DELETE FROM `char_jobs`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_look`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_merit`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_pet`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_pet_name`  WHERE `charid` = OLD.charid;
	DELETE FROM `char_points`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_profile`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_recast`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_skills`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_spells`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_stats`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_storage`   WHERE `charid` = OLD.charid;
	DELETE FROM `char_style`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_vars`      WHERE `charid` = OLD.charid;
	DELETE FROM `auction_house`  WHERE `seller` = OLD.charid;
	DELETE FROM `delivery_box`   WHERE `charid` = OLD.charid;
	UPDATE `delivery_box` SET sent = 0 WHERE box = 2 AND received = 0 AND sent = 1 AND senderid = OLD.charid;
END */;;
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

-- Dump completed on 2017-12-28  7:16:03
