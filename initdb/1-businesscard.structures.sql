USE businesscard;
CREATE TABLE `cmds` (
  `nocmd` varchar(20) NOT NULL,
  `card_type` varchar(10) DEFAULT 'adresse',
  `date` datetime NOT NULL,
  `resp` varchar(10) DEFAULT NULL,
  `etat` varchar(10) DEFAULT NULL,
  `quantite` varchar(10) DEFAULT NULL,
  `scipertodo` varchar(10) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `cf` varchar(10) NOT NULL,
  `fond` varchar(20) NOT NULL,
  `path1` varchar(60) DEFAULT NULL,
  `path1_hide` char(1) DEFAULT NULL,
  `path2` varchar(60) DEFAULT NULL,
  `path2_hide` char(1) DEFAULT NULL,
  `path3` varchar(60) DEFAULT NULL,
  `path3_hide` char(1) DEFAULT NULL,
  `path4` varchar(60) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `fonction1` varchar(60) DEFAULT NULL,
  `fonction2` varchar(60) DEFAULT NULL,
  `adresse` varchar(80) DEFAULT NULL,
  `phone1` varchar(60) DEFAULT NULL,
  `phone2` varchar(60) DEFAULT NULL,
  `web` varchar(60) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `done_by` varchar(10) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nocmd`),
  UNIQUE KEY `nocmd_UNIQUE` (`nocmd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `logs` (
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sciper` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `scipertodo` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `nocmd` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `msg` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;