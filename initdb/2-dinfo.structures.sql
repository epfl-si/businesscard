USE dinfo;
-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: cadidb.epfl.ch    Database: dinfo
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `sciper`
--

DROP TABLE IF EXISTS `sciper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sciper` (
  `sciper` varchar(6) NOT NULL,
  `nom` varchar(64) DEFAULT NULL,
  `prenom` varchar(64) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `nom_acc` varchar(64) DEFAULT NULL,
  `prenom_acc` varchar(64) DEFAULT NULL,
  `date_naiss` varchar(12) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  `canon` varchar(32) DEFAULT NULL,
  `nom_usuel` varchar(64) DEFAULT NULL,
  `prenom_usuel` varchar(64) DEFAULT NULL,
  `nom_usuel_maj` varchar(64) DEFAULT NULL,
  `prenom_usuel_maj` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sciper`),
  KEY `nom` (`nom`),
  KEY `prenom` (`prenom`),
  KEY `nom_acc` (`nom_acc`),
  KEY `prenom_acc` (`prenom_acc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allunits`
--

DROP TABLE IF EXISTS `allunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allunits` (
  `id_unite` int(11) NOT NULL AUTO_INCREMENT,
  `sigle` varchar(24) DEFAULT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `libelle_en` varchar(128) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `hierarchie` varchar(64) DEFAULT NULL,
  `niveau` smallint(6) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `resp_unite` varchar(6) DEFAULT NULL,
  `cmpl_type` char(1) DEFAULT NULL,
  `unittype` int(11) DEFAULT NULL,
  `adresse_1` varchar(64) DEFAULT NULL,
  `adresse_2` varchar(64) DEFAULT NULL,
  `adresse_3` varchar(64) DEFAULT NULL,
  `adresse_4` varchar(64) DEFAULT NULL,
  `ville` varchar(64) DEFAULT NULL,
  `pays` varchar(6) DEFAULT NULL,
  `cf` varchar(6) DEFAULT NULL,
  `level1` int(11) DEFAULT NULL,
  `level2` int(11) DEFAULT NULL,
  `level3` int(11) DEFAULT NULL,
  `level4` int(11) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_unite`),
  KEY `sigle` (`sigle`),
  KEY `libelle` (`libelle`),
  KEY `level1` (`level1`),
  KEY `level2` (`level2`),
  KEY `level3` (`level3`),
  KEY `level4` (`level4`)
) ENGINE=MyISAM AUTO_INCREMENT=71114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adrspost`
--

DROP TABLE IF EXISTS `adrspost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adrspost` (
  `sciper` char(6) NOT NULL,
  `unite` varchar(6) DEFAULT NULL,
  `ordre` mediumint(9) DEFAULT NULL,
  `adresse` text,
  `pays` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  KEY `sciper` (`sciper`),
  KEY `unite` (`unite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unites`
--

DROP TABLE IF EXISTS `unites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unites` (
  `sigle` varchar(24) DEFAULT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `abrege` varchar(64) DEFAULT NULL,
  `date_debut` varchar(16) DEFAULT NULL,
  `date_fin` varchar(16) DEFAULT NULL,
  `type` varchar(24) DEFAULT NULL,
  `resp_unite` varchar(6) DEFAULT NULL,
  `cf` varchar(6) DEFAULT NULL,
  `hierarchie` varchar(64) DEFAULT NULL,
  `id_unite` varchar(6) NOT NULL,
  `id_parent` varchar(6) DEFAULT NULL,
  `sigle_en` varchar(24) DEFAULT NULL,
  `libelle_en` varchar(128) DEFAULT NULL,
  `abrege_en` varchar(64) DEFAULT NULL,
  `ordre` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_unite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fonds`
--

DROP TABLE IF EXISTS `fonds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonds` (
  `no_fond` varchar(20) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `cf` varchar(10) DEFAULT NULL,
  `resp_nom` varchar(100) DEFAULT NULL,
  `resp_sciper` varchar(8) DEFAULT NULL,
  `etat` char(1) DEFAULT NULL,
  `clients` varchar(20) DEFAULT NULL,
  `motif` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no_fond`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` mediumint(9) NOT NULL DEFAULT '0',
  `libelle` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `user` varchar(32) NOT NULL,
  `sciper` varchar(6) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `gecos` varchar(64) DEFAULT NULL,
  `home` varchar(32) DEFAULT NULL,
  `shell` varchar(16) DEFAULT NULL,
  KEY `user` (`user`),
  KEY `sciper` (`sciper`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `sciper` char(6) NOT NULL,
  `addrlog` varchar(64) DEFAULT NULL,
  `addrphy` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sciper`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `annu`
--

DROP TABLE IF EXISTS `annu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annu` (
  `sciper` char(6) NOT NULL,
  `unite` varchar(6) DEFAULT NULL,
  `localid` int(11) DEFAULT NULL,
  `local` varchar(25) DEFAULT NULL,
  `telephone1` varchar(16) DEFAULT NULL,
  `telephone2` varchar(25) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  KEY `sciper` (`sciper`),
  KEY `unite` (`unite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-20  9:58:29
