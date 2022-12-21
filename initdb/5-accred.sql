USE accred;

DROP TABLE IF EXISTS `accreds`;
CREATE TABLE `accreds` (
  `persid` char(8) DEFAULT NULL,
  `unitid` char(12) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `posid` int(11) DEFAULT NULL,
  `datedeb` datetime DEFAULT NULL,
  `datefin` datetime DEFAULT NULL,
  `datereval` datetime DEFAULT NULL,
  `duree` char(2) DEFAULT NULL,
  `creator` char(8) DEFAULT NULL,
  `datecreat` datetime DEFAULT NULL,
  `origine` char(1) DEFAULT NULL,
  `comment` text,
  `author` char(8) DEFAULT NULL,
  `revalman` char(1) DEFAULT NULL,
  `ordre` tinyint(4) DEFAULT NULL,
  `debval` datetime DEFAULT NULL,
  `finval` datetime DEFAULT NULL,
  KEY `sciper` (`persid`),
  KEY `unite` (`unitid`),
  KEY `debval` (`debval`),
  KEY `finval` (`finval`),
  KEY `datedeb` (`datedeb`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `unittype` varchar(16) DEFAULT 'Orgs',
  `labelfr` varchar(200) DEFAULT NULL,
  `labelen` varchar(200) DEFAULT NULL,
  `description` text,
  `needreval` char(1) DEFAULT NULL,
  `unitlevels` varchar(16) DEFAULT NULL,
  `ordre` mediumint(9) DEFAULT '0',
  `url` varchar(128) DEFAULT NULL,
  `respid` varchar(8) DEFAULT NULL,
  `emailresp` varchar(128) DEFAULT NULL,
  `debval` datetime DEFAULT NULL,
  `finval` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;
