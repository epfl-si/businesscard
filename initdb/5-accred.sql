USE accred;
	
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
	
	CREATE TABLE `classes` (
	  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
	  `name` varchar(16) DEFAULT NULL,
	  `labelfr` varchar(64) DEFAULT NULL,
	  `labelen` varchar(64) DEFAULT NULL,
	  `description` varchar(128) DEFAULT NULL,
	  `maillist` varchar(16) DEFAULT NULL,
	  `statusid` int(11) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `libelle` (`labelfr`)
	) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
	
	CREATE TABLE `positions` (
	  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
	  `oldid` mediumint(9) DEFAULT NULL,
	  `labelfr` varchar(128) DEFAULT NULL,
	  `labelxx` varchar(128) DEFAULT NULL,
	  `labelen` varchar(128) DEFAULT NULL,
	  `restricted` char(1) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  KEY `libelle` (`labelfr`),
	  KEY `unit` (`oldid`)
	) ENGINE=MyISAM AUTO_INCREMENT=1477 DEFAULT CHARSET=latin1;
	
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
	
	CREATE TABLE `rights_statuses` (
	  `rightid` int(11) DEFAULT NULL,
	  `statusid` int(11) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
	CREATE TABLE `rights_classes` (
	  `rightid` int(11) DEFAULT NULL,
	  `classid` int(11) DEFAULT NULL,
	  `allowed` char(1) DEFAULT NULL,
	  `defaults` char(1) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
	CREATE TABLE `rights_persons` (
	  `persid` char(8) DEFAULT NULL,
	  `unitid` char(12) DEFAULT NULL,
	  `rightid` int(11) DEFAULT NULL,
	  `value` char(1) DEFAULT NULL,
	  `respid` char(8) DEFAULT NULL,
	  `datefin` datetime DEFAULT NULL,
	  `datedel` datetime DEFAULT NULL,
	  `accrdel` varchar(6) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
	CREATE TABLE `rights_roles` (
	  `rightid` int(11) DEFAULT NULL,
	  `roleid` int(11) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL,
	  `hasrights` char(1) DEFAULT 'y'
	) ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
	CREATE TABLE `rights_units` (
	  `rightid` int(11) DEFAULT NULL,
	  `unitid` char(12) DEFAULT NULL,
	  `value` char(1) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL
	) ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
	CREATE TABLE `statuses` (
	  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
	  `name` varchar(16) DEFAULT NULL,
	  `labelfr` varchar(64) DEFAULT NULL,
	  `labelen` varchar(64) DEFAULT NULL,
	  `description` text,
	  `maillist` varchar(16) DEFAULT NULL,
	  `debval` datetime DEFAULT NULL,
	  `finval` datetime DEFAULT NULL,
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `libelle` (`labelfr`)
	) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
