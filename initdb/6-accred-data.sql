	
	
	INSERT INTO accred.accreds (persid,unitid,statusid,classid,posid,datedeb,datefin,datereval,duree,creator,datecreat,origine,comment,author,revalman,ordre,debval,finval) VALUES ('169419','13030',1,4,814,'2018-12-25 00:40:22.0',NULL,NULL,NULL,'000000','2018-12-25 00:40:22.0','p','','000000','n',1,'2018-12-25 00:40:22.0',NULL);
	INSERT INTO accred.accreds (persid,unitid,statusid,classid,posid,datedeb,datefin,datereval,duree,creator,datecreat,origine,comment,author,revalman,ordre,debval,finval) VALUES ('243371','13030',1,4,294,'2018-10-01 00:00:00.0',NULL,'2019-09-24 00:41:33.0',NULL,'104930','2018-10-02 14:09:16.0','p','','104930','n',1,'2020-01-06 15:23:28.0',NULL);
	INSERT INTO accred.accreds (persid,unitid,statusid,classid,posid,datedeb,datefin,datereval,duree,creator,datecreat,origine,comment,author,revalman,ordre,debval,finval) VALUES ('121769','13030',1,4,113,'2018-01-25 00:40:10.0',NULL,NULL,NULL,'000000','2018-01-25 00:40:10.0','p','','000000','n',1,'2018-08-22 10:44:27.0',NULL);
	INSERT INTO accred.accreds (persid,unitid,statusid,classid,posid,datedeb,datefin,datereval,duree,creator,datecreat,origine,comment,author,revalman,ordre,debval,finval) VALUES ('316897','13030',1,1,17,'2019-08-12 00:00:00.0',NULL,'2019-08-12 10:54:19.0',NULL,'104930','2019-07-22 14:49:47.0','p','','106785','n',1,'2019-09-26 14:21:57.0',NULL);
	INSERT INTO accred.accreds (persid,unitid,statusid,classid,posid,datedeb,datefin,datereval,duree,creator,datecreat,origine,comment,author,revalman,ordre,debval,finval) VALUES ('106785','13030',1,4,114,'2015-01-01 00:00:00.0',NULL,'2015-03-26 00:40:25.0','','104929','2015-01-04 23:49:45.0','p','','104929','n',1,'2015-03-26 00:40:25.0',NULL);
	
	
	INSERT INTO accred.classes (id,name,labelfr,labelen,description,maillist,statusid,debval,finval) VALUES (1,'T','Apprenti-e','Apprentice','Apprenti-e','apprenti',1,NULL,NULL);
	INSERT INTO accred.classes (id,name,labelfr,labelen,description,maillist,statusid,debval,finval) VALUES (4,'E','Personnel technique/administratif','Technical/administrative staff','Personnel technique/administratif','employe',1,NULL,NULL);
	
	
	
	INSERT INTO accred.rights (id,name,unittype,labelfr,labelen,description,needreval,unitlevels,ordre,url,respid,emailresp,debval,finval) VALUES (11,'cartevisite','Orgs','Cartes de visites','Business cards','Commande de cartes de visites','n',NULL,0,'http://www.epfl.ch/repro/visites/','104782',NULL,'2005-09-08 17:06:47.0',NULL);
	
		 
	INSERT INTO accred.statuses (id,name,labelfr,labelen,description,maillist,debval,finval) VALUES (1,'P','Personnel','Staff','Personnel','personnel',NULL,NULL);
	
	
	INSERT INTO accred.rights_persons
	(persid, unitid, rightid, value, respid, datefin, datedel, accrdel, debval, finval) VALUES (243371, 13030, 11, 'y', 243371, NULL, NULL, '', '2005-05-30 11:10:02.0', '2222-02-02 22:22:22.0');
	INSERT INTO accred.rights_persons
	(persid, unitid, rightid, value, respid, datefin, datedel, accrdel, debval, finval) VALUES (169419, 13030, 11, 'y', 243371, NULL, NULL, '', '2005-05-30 11:10:02.0', '2222-02-02 22:22:22.0');
	INSERT INTO accred.rights_persons
	(persid, unitid, rightid, value, respid, datefin, datedel, accrdel, debval, finval) VALUES (316897, 13030, 11, 'y', 243371, NULL, NULL, '', '2005-05-30 11:10:02.0', '2222-02-02 22:22:22.0');
	
	
	INSERT INTO accred.rights_units (rightid, unitid, value, debval, finval) VALUES(11, '13030', 'y', '2000-01-01 00:00:00.0', NULL);