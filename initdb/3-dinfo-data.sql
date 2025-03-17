/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
INSERT INTO dinfo.sciper (sciper,nom,prenom,`type`,nom_acc,prenom_acc,date_naiss,sexe,canon,nom_usuel,prenom_usuel,nom_usuel_maj,prenom_usuel_maj)
	VALUES ('106785','AUBOISDORMANT','ABEL','6','Auboisdormant','Abel','01.01.1959','M','obdorm',NULL,NULL,NULL,NULL);
INSERT INTO dinfo.sciper (sciper,nom,prenom,`type`,nom_acc,prenom_acc,date_naiss,sexe,canon,nom_usuel,prenom_usuel,nom_usuel_maj,prenom_usuel_maj)
	VALUES ('121769','ÉPAN','AHMED','6','Épan','Ahmed','01.01.1969','M','epan',NULL,NULL,NULL,NULL);
INSERT INTO dinfo.sciper (sciper,nom,prenom,`type`,nom_acc,prenom_acc,date_naiss,sexe,canon,nom_usuel,prenom_usuel,nom_usuel_maj,prenom_usuel_maj)
	VALUES ('169419','EMBETT','AKIM','6','Embëtt','Akim','01.01.1980','M','enbet',NULL,NULL,NULL,NULL);
INSERT INTO dinfo.sciper (sciper,nom,prenom,`type`,nom_acc,prenom_acc,date_naiss,sexe,canon,nom_usuel,prenom_usuel,nom_usuel_maj,prenom_usuel_maj)
	VALUES ('243371','PROVIST','ALAIN','6','Provist','Alain','01.01.1975','M','provist',NULL,'Alain',NULL,'ALAIN');
INSERT INTO dinfo.sciper (sciper,nom,prenom,`type`,nom_acc,prenom_acc,date_naiss,sexe,canon,nom_usuel,prenom_usuel,nom_usuel_maj,prenom_usuel_maj)
	VALUES ('263877','BERMAN','ALDO','6','Berman','Aldô','01.01.2000','M','berman',NULL,NULL,NULL,NULL);

INSERT INTO dinfo.allunits (id_unite, sigle, libelle, libelle_en, date_debut, date_fin, hierarchie, niveau, id_parent, `type`, resp_unite, cmpl_type, unittype, adresse_1, adresse_2, adresse_3, adresse_4, ville, pays, cf, level1, level2, level3, level4, url)
	VALUES(10000, 'EPFL', 'Ecole polytechnique fédérale de Lausanne', '', '2002-01-01 00:00:00.0', NULL, 'EPFL', 1, 0, 'E', '107537', 'FS', 6, 'EPFL PRES', 'CE 3 316 (Centre Est)', 'Station 1', 'CH-1015 Lausanne', '', NULL, '1028', 10000, NULL, NULL, NULL, 'https://www.epfl.ch/');
INSERT INTO dinfo.allunits (id_unite, sigle, libelle, libelle_en, date_debut, date_fin, hierarchie, niveau, id_parent, `type`, resp_unite, cmpl_type, unittype, adresse_1, adresse_2, adresse_3, adresse_4, ville, pays, cf, level1, level2, level3, level4, url)
	VALUES(12635, 'VPO-SI', 'Systèmes d''information', 'Information Systems', '2012-08-27 00:00:00.0', NULL, 'EPFL VPO-SI', 2, 10000, 'E', '295957', 'FS', 13, 'EPFL VPO SI', 'MA A0 388 (Bâtiment MA)', 'Station 8', 'CH-1015 Lausanne', '', NULL, '11200', 10000, 12635, NULL, NULL, 'https://www.epfl.ch/about/vice-presidencies/vice-presidency-for-operations-vpo/information-systems/');
INSERT INTO dinfo.allunits (id_unite, sigle, libelle, libelle_en, date_debut, date_fin, hierarchie, niveau, id_parent, `type`, resp_unite, cmpl_type, unittype, adresse_1, adresse_2, adresse_3, adresse_4, ville, pays, cf, level1, level2, level3, level4, url)
	VALUES(14213, 'ISAS', 'SI Services Académiques', 'IS Academic Services', '2022-01-01 00:00:00.0', NULL, 'EPFL VPO-SI ISAS', 3, 12635, 'E', '290361', 'FS', 13, 'EPFL VPO-SI ISAS', 'MA A0 388 (Bâtiment MA)', 'Station 8', 'CH-1015 Lausanne', '', NULL, '11253', 10000, 12635, 14213, NULL, '');
INSERT INTO dinfo.allunits (id_unite, sigle, libelle, libelle_en, date_debut, date_fin, hierarchie, niveau, id_parent, `type`, resp_unite, cmpl_type, unittype, adresse_1, adresse_2, adresse_3, adresse_4, ville, pays, cf, level1, level2, level3, level4, url)
	VALUES(13030, 'ISAS-FSD', 'Développement Full-Stack', 'Full-Stack Development ', '2022-01-01 00:00:00.0', NULL, 'EPFL VPO-SI ISAS ISAS-FSD', 4, 14213, 'E', '243371', 'F', 13, 'EPFL VPO-SI ISAS-FSD', 'INN 012 (Bâtiment INN)', 'Station 14', 'CH-1015 Lausanne', '', NULL, '1906', 10000, 12635, 14213, 13030, '');


INSERT INTO dinfo.adrspost (sciper, unite, ordre, adresse, pays, country)
	VALUES ('169419', '13030', 1, 'EPFL SI IDEV-FSD $ INN 013 (Bâtiment INN) $ Station 14 $ CH-1015 Lausanne', 'Suisse', 'Switzerland');

INSERT INTO dinfo.annu (sciper, unite, localid, `local`, telephone1, telephone2, `type`)
	VALUES ('169419','13030',31558,'INN 013','35455',NULL,'SOFT');


INSERT INTO dinfo.unites (sigle, libelle, abrege, date_debut, date_fin, `type`, resp_unite, cf, hierarchie, id_unite, id_parent, sigle_en, libelle_en, abrege_en, ordre)
	VALUES('ISAS-FSD', 'Développement Full-Stack', 'Développement ', '2022-01-01', '', 'Service central', '243371', '1906', 'EPFL VPO-SI ISAS ISAS-FSD', '13030', '14213', 'ISAS-FSD', 'Full-Stack Development ', 'Development', 2);


INSERT INTO dinfo.fonds (no_fond, libelle, cf, resp_nom, resp_sciper, etat, clients, motif)
	VALUES('1923-1', 'ISAS - Operate', 'F1923', 'Grand Chef', '290361', 'O', 'BA1-E', 'BA');
INSERT INTO dinfo.fonds (no_fond, libelle, cf, resp_nom, resp_sciper, etat, clients, motif)
	VALUES('1906-01', 'IDEVELOP 01', 'F1906', 'Petit chef', '268229', 'O', 'BA1-H', 'BA');
