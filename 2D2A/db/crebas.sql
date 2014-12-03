CREATE TABLE `civilite_en` (
  `CIVID` int(11) NOT NULL,
  `TITRE` varchar(20) default NULL,
  PRIMARY KEY  (`CIVID`),
  CONSTRAINT `FK_HERITAGE_12` FOREIGN KEY (`CIVID`) REFERENCES `civilite` (`CIVID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `accueil` (
  `ACCID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`ACCID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `accueil_en` (
  `ACCID` int(11) NOT NULL,
  `TITREACCUEIL` varchar(250) default NULL,
  `LOGOACCUEIL` varchar(250) default NULL,
  `IMAGEACCUEIL` varchar(250) default NULL,
  `TEXTEACCUEIL` text,
  PRIMARY KEY  (`ACCID`),
  CONSTRAINT `FK_HERITAGE_15` FOREIGN KEY (`ACCID`) REFERENCES `accueil` (`ACCID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `accueil_fr` (
  `ACCID` int(11) NOT NULL,
  `TITREACCUEIL` varchar(250) default NULL,
  `LOGOACCUEIL` varchar(250) default NULL,
  `IMAGEACCUEIL` varchar(250) default NULL,
  `TEXTEACCUEIL` text,
  PRIMARY KEY  (`ACCID`),
  CONSTRAINT `FK_HERITAGE_15b` FOREIGN KEY (`ACCID`) REFERENCES `accueil` (`ACCID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `admin` (
  `LOGIN` varchar(50) NOT NULL,
  `PASS` varchar(50) NOT NULL,
  PRIMARY KEY  (`LOGIN`,`PASS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `adresse` (
  `ADRCOMID` int(11) NOT NULL auto_increment,
  `PAYID` int(11) NOT NULL,
  `CIVID` int(11) NOT NULL,
  `MEMID` int(11) default NULL,
  `NOMADRESSE` varchar(50) default NULL,
  `PRENOM` varchar(100) default NULL,
  `NOM` varchar(100) default NULL,
  `SOCIETE` varchar(50) default NULL,
  `ADRESSE` varchar(100) NOT NULL,
  `COMPLEMENT_ADRESSE` varchar(100) default NULL,
  `CODEPOSTAL` varchar(15) NOT NULL,
  `VILLE` varchar(50) NOT NULL,
  `TELPRIVE` varchar(20) default NULL,
  `TELBUREAU` varchar(20) default NULL,
  `FAX` varchar(20) default NULL,
  PRIMARY KEY  (`ADRCOMID`),
  KEY `RELATION_16_FK` (`CIVID`),
  KEY `RELATION_17_FK` (`PAYID`),
  KEY `RELATION_18_FK` (`MEMID`),
  CONSTRAINT `FK_RELATION_16` FOREIGN KEY (`CIVID`) REFERENCES `civilite` (`CIVID`),
  CONSTRAINT `FK_RELATION_17` FOREIGN KEY (`PAYID`) REFERENCES `pays` (`PAYID`),
  CONSTRAINT `FK_RELATION_18` FOREIGN KEY (`MEMID`) REFERENCES `membre` (`MEMID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `civilite` (
  `CIVID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`CIVID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `civilite_fr` (
  `CIVID` int(11) NOT NULL,
  `TITRE` varchar(20) default NULL,
  PRIMARY KEY  (`CIVID`),
  CONSTRAINT `FK_HERITAGE_12b` FOREIGN KEY (`CIVID`) REFERENCES `civilite` (`CIVID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `coloris` (
  `COLID` int(11) NOT NULL auto_increment,
  `PICTO` varchar(100) default NULL,
  PRIMARY KEY  (`COLID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `coloris_en` (
  `COLID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  PRIMARY KEY  (`COLID`),
  CONSTRAINT `FK_HERITAGE_5` FOREIGN KEY (`COLID`) REFERENCES `coloris` (`COLID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `coloris_fr` (
  `COLID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  PRIMARY KEY  (`COLID`),
  CONSTRAINT `FK_HERITAGE_5b` FOREIGN KEY (`COLID`) REFERENCES `coloris` (`COLID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `commande` (
  `COMID` int(11) NOT NULL auto_increment,
  `MEMID` int(11) NOT NULL,
  `ADRCOMID` int(11) default NULL,
  `ADR_ADRCOMID` int(11) default NULL,
  `DATE` date NOT NULL,
  `ETAT` int(11) NOT NULL,
  `LIVRAISON_WEEK` int(11) default NULL,
  `LIVRAISON_HEURE` int(11) default NULL,
  `PRIX` decimal(8,0) default NULL,
  `MODE_PAIEMENT` int(11) default NULL,
  PRIMARY KEY  (`COMID`),
  KEY `RELATION_24_FK` (`MEMID`),
  KEY `ADRESSE_FACTURATION_FK` (`ADR_ADRCOMID`),
  KEY `ADRESSE_LIVRAISON_FK` (`ADRCOMID`),
  CONSTRAINT `FK_ADRESSE_FACTURATION` FOREIGN KEY (`ADR_ADRCOMID`) REFERENCES `adresse` (`ADRCOMID`),
  CONSTRAINT `FK_ADRESSE_LIVRAISON` FOREIGN KEY (`ADRCOMID`) REFERENCES `adresse` (`ADRCOMID`),
  CONSTRAINT `FK_RELATION_24` FOREIGN KEY (`MEMID`) REFERENCES `membre` (`MEMID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `commande_produit` (
  `COMPROID` int(11) NOT NULL auto_increment,
  `PROID` int(11) NOT NULL,
  `COLID` int(11) default NULL,
  `COMID` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `PRIX_UNITAIRE` decimal(8,0) NOT NULL,
  PRIMARY KEY  (`COMPROID`),
  KEY `RELATION_25_FK` (`COMID`),
  KEY `RELATION_26_FK` (`PROID`),
  CONSTRAINT `FK_RELATION_25` FOREIGN KEY (`COMID`) REFERENCES `commande` (`COMID`),
  CONSTRAINT `FK_RELATION_26` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `commande_ouvrage` (
  `COMOUVID` int(11) NOT NULL auto_increment,
  `OUVID` int(11) NOT NULL,
  `COMID` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `PRIX_UNITAIRE` decimal(8,0) NOT NULL,
  PRIMARY KEY  (`COMOUVID`),
  KEY `RELATION_25b_FK` (`COMID`),
  KEY `RELATION_26b_FK` (`OUVID`),
  CONSTRAINT `FK_RELATION_25b` FOREIGN KEY (`COMID`) REFERENCES `commande` (`COMID`),
  CONSTRAINT `FK_RELATION_26b` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conditions_generales_en` (
  `CONID` int(11) NOT NULL,
  `CONTENU` text,
  PRIMARY KEY  (`CONID`),
  CONSTRAINT `FK_HERITAGE_18` FOREIGN KEY (`CONID`) REFERENCES `contidions_generales` (`CONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conditions_generales_fr` (
  `CONID` int(11) NOT NULL,
  `CONTENU` text,
  PRIMARY KEY  (`CONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `contidions_generales` (
  `CONID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`CONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `designer` (
  `ID` int(11) NOT NULL auto_increment,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `designer_en` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  `DATENAISSANCE` varchar(10) default NULL,
  `LIEUNAISSANCE` varchar(50) default NULL,
  `BIOGRAPHIE` text,
  `INFORMATION` text,
  `BIBLIOGRAPHIE` text,
  `COLLABORATION` text,
  `SITEINTERNET` varchar(255) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  PRIMARY KEY  (`ID`),
  CONSTRAINT `FK_HERITAGE_8` FOREIGN KEY (`ID`) REFERENCES `designer` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `designer_fr` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  `DATENAISSANCE` varchar(10) default NULL,
  `LIEUNAISSANCE` varchar(50) default NULL,
  `BIOGRAPHIE` text,
  `INFORMATION` text,
  `BIBLIOGRAPHIE` text,
  `COLLABORATION` text,
  `SITEINTERNET` varchar(255) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  PRIMARY KEY  (`ID`),
  CONSTRAINT `FK_HERITAGE_8b` FOREIGN KEY (`ID`) REFERENCES `designer` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `designer_ouvrage` (
  `OUVID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY  (`OUVID`,`ID`),
  KEY `RELATION_11_FK` (`OUVID`),
  KEY `RELATION_11_FK2` (`ID`),
  CONSTRAINT `FK_DESIGNER_OUVRAGE` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`) ON DELETE CASCADE,
  CONSTRAINT `FK_DESIGNER_OUVRAGEb` FOREIGN KEY (`ID`) REFERENCES `designer` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `editeur` (
  `EDIID` int(11) NOT NULL auto_increment,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  PRIMARY KEY  (`EDIID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `editeur_en` (
  `EDIID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  `DATENAISSANCE` varchar(10) default NULL,
  `LIEUNAISSANCE` varchar(50) default NULL,
  `BIOGRAPHIE` text,
  `INFORMATION` text,
  `BIBLIOGRAPHIE` text,
  `COLLABORATION` text,
  `SITEINTERNET` varchar(255) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  PRIMARY KEY  (`EDIID`),
  CONSTRAINT `FK_HERITAGE_10` FOREIGN KEY (`EDIID`) REFERENCES `editeur` (`EDIID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `editeur_fr` (
  `EDIID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `PRENOM` varchar(50) default NULL,
  `DATENAISSANCE` varchar(10) default NULL,
  `LIEUNAISSANCE` varchar(50) default NULL,
  `BIOGRAPHIE` text,
  `INFORMATION` text,
  `BIBLIOGRAPHIE` text,
  `COLLABORATION` text,
  `SITEINTERNET` varchar(255) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  PRIMARY KEY  (`EDIID`),
  CONSTRAINT `FK_HERITAGE_10b` FOREIGN KEY (`EDIID`) REFERENCES `editeur` (`EDIID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `editeur_ouvrage` (
  `EDIID` int(11) NOT NULL,
  `OUVID` int(11) NOT NULL,
  PRIMARY KEY  (`EDIID`,`OUVID`),
  KEY `RELATION_10_FK` (`EDIID`),
  KEY `RELATION_10_FK2` (`OUVID`),
  CONSTRAINT `FK_EDITEUR_OUVRAGE` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`) ON DELETE CASCADE,
  CONSTRAINT `FK_EDITEUR_OUVRAGEb` FOREIGN KEY (`EDIID`) REFERENCES `editeur` (`EDIID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `evenement` (
  `EVEID` int(11) NOT NULL auto_increment,
  `RUBID` int(11) default NULL,
  PRIMARY KEY  (`EVEID`),
  KEY `RELATION_21_FK` (`RUBID`),
  CONSTRAINT `FK_RELATION_21` FOREIGN KEY (`RUBID`) REFERENCES `rubrique` (`RUBID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `evenement_en` (
  `EVEID` int(11) NOT NULL,
  `DATEDEBUT` date default NULL,
  `DATEFIN` date default NULL,
  `HORAIRE` varchar(15) default NULL,
  `DEPARTEMENT` text,
  `VILLE` varchar(50) default NULL,
  `LIEU` varchar(50) default NULL,
  `ADRESSE` varchar(100) default NULL,
  `DESIGNATIONINFO` text,
  `THEME` varchar(100) default NULL,
  `NBEXPOSANT` int(11) default NULL,
  `NBVISITEUR` int(11) default NULL,
  `TEL` varchar(20) default NULL,
  `FAX` varchar(20) default NULL,
  `SITEINTERNET` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  `PRIX` decimal(10,0) default NULL,
  `TITRE` varchar(50) default NULL,
  `TYPE` int(11) default NULL,
  `VISIBLE` tinyint(1) default NULL,
  PRIMARY KEY  (`EVEID`),
  CONSTRAINT `FK_HERITAGE_20` FOREIGN KEY (`EVEID`) REFERENCES `evenement` (`EVEID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `evenement_fr` (
  `EVEID` int(11) NOT NULL,
  `DATEDEBUT` date default NULL,
  `DATEFIN` date default NULL,
  `HORAIRE` varchar(15) default NULL,
  `DEPARTEMENT` text,
  `VILLE` varchar(50) default NULL,
  `LIEU` varchar(50) default NULL,
  `ADRESSE` varchar(100) default NULL,
  `DESIGNATIONINFO` text,
  `THEME` varchar(100) default NULL,
  `NBEXPOSANT` int(11) default NULL,
  `NBVISITEUR` int(11) default NULL,
  `TEL` varchar(20) default NULL,
  `FAX` varchar(20) default NULL,
  `SITEINTERNET` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  `PRIX` decimal(10,0) default NULL,
  `TITRE` varchar(50) default NULL,
  `TYPE` int(11) default NULL,
  `VISIBLE` tinyint(1) default NULL,
  PRIMARY KEY  (`EVEID`),
  CONSTRAINT `FK_HERITAGE_14b` FOREIGN KEY (`EVEID`) REFERENCES `evenement` (`EVEID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_evenement` (
  `IMGID` int(11) NOT NULL auto_increment,
  `EVEID` int(11) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  `POSITION` int(11) default NULL,
  PRIMARY KEY  (`IMGID`),
  KEY `RELATION_28_FK` (`EVEID`),
  CONSTRAINT `FK_RELATION_28` FOREIGN KEY (`EVEID`) REFERENCES `evenement` (`EVEID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `image_evenement_en` (
  `IMGID` int(11) NOT NULL,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`IMGID`),
  CONSTRAINT `FK_HERITAGE_19` FOREIGN KEY (`IMGID`) REFERENCES `image_evenement` (`IMGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_evenement_fr` (
  `IMGID` int(11) NOT NULL,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`IMGID`),
  CONSTRAINT `FK_HERITAGE_19B` FOREIGN KEY (`IMGID`) REFERENCES `image_evenement` (`IMGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_ouvrage` (
  `IMGID` int(11) NOT NULL auto_increment,
  `OUVID` int(11) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  `POSITION` int(11) default NULL,
  PRIMARY KEY  (`IMGID`),
  KEY `RELATION_12_FK` (`OUVID`),
  CONSTRAINT `FK_RELATION_12` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `image_ouvrage_en` (
  `IMGID` int(11) NOT NULL,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`IMGID`),
  CONSTRAINT `FK_HERITAGE_7` FOREIGN KEY (`IMGID`) REFERENCES `image_ouvrage` (`IMGID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_ouvrage_fr` (
  `IMGID` int(11) NOT NULL,
  `DESCRIPTION` varchar(50) default NULL,
  PRIMARY KEY  (`IMGID`),
  CONSTRAINT `FK_HERITAGE_7b` FOREIGN KEY (`IMGID`) REFERENCES `image_ouvrage` (`IMGID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_produit` (
  `IMGID` int(11) NOT NULL auto_increment,
  `PROID` int(11) default NULL,
  `PATHPHOTO` varchar(100) default NULL,
  `PATHVIGNETTE` varchar(100) default NULL,
  PRIMARY KEY  (`IMGID`),
  KEY `RELATION_3_FK` (`PROID`),
  CONSTRAINT `FK_RELATION_3` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

CREATE TABLE `mail` (
  `MAIID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`MAIID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `mail_en` (
  `MAIID` int(11) NOT NULL,
  `NOM` varchar(100) default NULL,
  `SUJET` varchar(255) default NULL,
  `CONTENU` text,
  `EXPEDITEUR` varchar(255) default NULL,
  `REPONSE` varchar(255) default NULL,
  `ACTIVATION` smallint(6) default NULL,
  PRIMARY KEY  (`MAIID`),
  CONSTRAINT `FK_HERITAGE_17` FOREIGN KEY (`MAIID`) REFERENCES `mail` (`MAIID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mail_fr` (
  `MAIID` int(11) NOT NULL,
  `NOM` varchar(100) default NULL,
  `SUJET` varchar(255) default NULL,
  `CONTENU` text,
  `EXPEDITEUR` varchar(255) default NULL,
  `REPONSE` varchar(255) default NULL,
  `ACTIVATION` smallint(6) default NULL,
  PRIMARY KEY  (`MAIID`),
  CONSTRAINT `FK_HERITAGE_17B` FOREIGN KEY (`MAIID`) REFERENCES `mail` (`MAIID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `membre` (
  `MEMID` int(11) NOT NULL auto_increment,
  `PROFID` int(11) NOT NULL default '1',
  `CIVID` int(11) NOT NULL default '1',
  `LOGIN` varchar(255) NOT NULL default '',
  `PASS` varchar(50) NOT NULL default '',
  `PRENOM` varchar(100) default NULL,
  `NOM` varchar(100) default NULL,
  `JOURNAISS` int(11) default NULL,
  `MOISNAISS` int(11) default NULL,
  `ANNEENAISS` int(11) default NULL,
  `CENTREINTERET` varchar(100) default NULL,
  `NEWSLETTER` tinyint(1) default NULL,
  `TYPEACTIVATION` smallint(6) default NULL,
  `DATEINSCRIPTION` bigint(20) default NULL,
  PRIMARY KEY  (`MEMID`),
  KEY `RELATION_14_FK` (`CIVID`),
  KEY `RELATION_15_FK` (`PROFID`),
  CONSTRAINT `FK_RELATION_14` FOREIGN KEY (`CIVID`) REFERENCES `civilite` (`CIVID`),
  CONSTRAINT `FK_RELATION_15` FOREIGN KEY (`PROFID`) REFERENCES `profession` (`PROFID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `ouvrage` (
  `OUVID` int(11) NOT NULL auto_increment,
  `TYPE` int(11) NOT NULL,
  `QUANTITE` int(11) default NULL,
  PRIMARY KEY  (`OUVID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `ouvrage_en` (
  `OUVID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `REFERENCE` varchar(20) default NULL,
  `TITRE` varchar(50) default NULL,
  `AUTEUR` varchar(50) default NULL,
  `LANGUE` varchar(50) default NULL,
  `ANNEE` int(11) default NULL,
  `RELIURE` tinyint(1) default NULL,
  `FORMAT` varchar(20) default NULL,
  `NBPAGES` int(11) default NULL,
  `NBPHOTOS` int(11) default NULL,
  `THEME` text,
  `SOMMAIRE` text,
  `INFORMATION` text,
  `PRIX` decimal(10,2) default NULL,
  PRIMARY KEY  (`OUVID`),
  CONSTRAINT `FK_HERITAGE_6` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ouvrage_fr` (
  `OUVID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `REFERENCE` varchar(20) default NULL,
  `TITRE` varchar(50) default NULL,
  `AUTEUR` varchar(50) default NULL,
  `LANGUE` varchar(50) default NULL,
  `ANNEE` int(11) default NULL,
  `RELIURE` tinyint(1) default NULL,
  `FORMAT` varchar(20) default NULL,
  `NBPAGES` int(11) default NULL,
  `NBPHOTOS` int(11) default NULL,
  `THEME` text,
  `SOMMAIRE` text,
  `INFORMATION` text,
  `PRIX` decimal(10,2) default NULL,
  PRIMARY KEY  (`OUVID`),
  CONSTRAINT `FK_HERITAGE_6b` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `pays` (
  `PAYID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`PAYID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `pays_en` (
  `PAYID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  PRIMARY KEY  (`PAYID`),
  CONSTRAINT `FK_HERITAGE_11` FOREIGN KEY (`PAYID`) REFERENCES `pays` (`PAYID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `pays_fr` (
  `PAYID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  PRIMARY KEY  (`PAYID`),
  CONSTRAINT `FK_HERITAGE_11b` FOREIGN KEY (`PAYID`) REFERENCES `pays` (`PAYID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit` (
  `PROID` int(11) NOT NULL auto_increment,
  `PAYID` int(11) default NULL,
  `DESID` int(11) default NULL,
  `REFERENCE` varchar(50) NOT NULL,
  `VISU_LANG` smallint(6) default NULL,
  `QUANTITE` int(11) default NULL,
  `ACHATDEPOT` tinyint(1) default NULL,
  `DATEENTREE` date default NULL,
  `PRIX` decimal(10,0) default NULL,
  `EDIID` int(11) default NULL,
  PRIMARY KEY  (`PROID`),
  KEY `RELATION_5_FK` (`DESID`),
  KEY `RELATION_9_FK` (`PAYID`),
  KEY `RELATION_26_FK` (`PROID`),
  KEY `FK_RELATION_30` (`EDIID`),
  CONSTRAINT `FK_RELATION_30` FOREIGN KEY (`EDIID`) REFERENCES `editeur` (`EDIID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

CREATE TABLE `produit_coloris` (
  `PRO_ID` int(11) NOT NULL,
  `COLID` int(11) NOT NULL,
  PRIMARY KEY  (`PRO_ID`,`COLID`),
  KEY `A_POUR_COLORIS_FK` (`PRO_ID`),
  KEY `A_POUR_COLORIS_FK2` (`COLID`),
  CONSTRAINT `FK_PRODUIT_COLORIS` FOREIGN KEY (`COLID`) REFERENCES `coloris` (`COLID`) ON DELETE CASCADE,
  CONSTRAINT `FK_PRODUIT_COLORISb` FOREIGN KEY (`PRO_ID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit_en` (
  `PROID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `INFORMATION` text,
  `DESCRIPTION` varchar(50) default NULL,
  `MATERIAUX` varchar(100) default NULL,
  `POIDS` varchar(50) default NULL,
  `HAUTEUR` varchar(20) default NULL,
  `LARGEUR` varchar(20) default NULL,
  `PROFONDEUR` varchar(20) default NULL,
  `DIAMETRE` varchar(20) default NULL,
  `DESC_ANNEE` varchar(100) default NULL,
  `SIGNE_APPARENT` text,
  `DISPO_LOC` tinyint(1) default NULL,
  `KEYWORD` varchar(100) default NULL,
  `PRIXACHAT` decimal(10,0) default NULL,
  `prix_loc` decimal(8,2) default '0.00',
  `FRIENDLY_NAME` longtext,
  `PETITPLUS` text,
  PRIMARY KEY  (`PROID`),
  CONSTRAINT `FK_HERITAGE_3` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit_fr` (
  `PROID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `INFORMATION` text,
  `DESCRIPTION` text,
  `MATERIAUX` varchar(100) default NULL,
  `POIDS` varchar(50) default NULL,
  `HAUTEUR` varchar(20) default NULL,
  `LARGEUR` varchar(20) default NULL,
  `PROFONDEUR` varchar(20) default NULL,
  `DIAMETRE` varchar(20) default NULL,
  `DESC_ANNEE` varchar(100) default NULL,
  `SIGNE_APPARENT` text,
  `DISPO_LOC` tinyint(1) default NULL,
  `KEYWORD` varchar(100) default NULL,
  `PRIXACHAT` decimal(10,0) default NULL,
  `prix_loc` decimal(8,2) default '0.00',
  `FRIENDLY_NAME` longtext,
  `PETITPLUS` text,
  PRIMARY KEY  (`PROID`),
  CONSTRAINT `FK_HERITAGE_3b` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit_ouvrage` (
  `PROID` int(11) NOT NULL,
  `OUVID` int(11) NOT NULL,
  PRIMARY KEY  (`PROID`,`OUVID`),
  KEY `RELATION_13_FK` (`PROID`),
  KEY `RELATION_13_FK2` (`OUVID`),
  CONSTRAINT `FK_PRODUIT_OUVRAGE` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE,
  CONSTRAINT `FK_PRODUIT_OUVRAGEb` FOREIGN KEY (`OUVID`) REFERENCES `ouvrage` (`OUVID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit_produit` (
  `PROID` int(11) NOT NULL,
  `PRO_PROID` int(11) NOT NULL,
  PRIMARY KEY  (`PROID`,`PRO_PROID`),
  KEY `EST_EN_RELATION_FK` (`PROID`),
  KEY `EST_EN_RELATION2_FK` (`PRO_PROID`),
  CONSTRAINT `FK_PRODUIT_PRODUIT` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`),
  CONSTRAINT `FK_PRODUIT_PRODUIT2` FOREIGN KEY (`PRO_PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produit_specificite` (
  `SPEID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  PRIMARY KEY  (`SPEID`,`PROID`),
  KEY `PRODUIT_SPECIFICITE_FK` (`SPEID`),
  KEY `PRODUIT_SPECIFICITE_FK2` (`PROID`),
  CONSTRAINT `FK_PRODUIT_SPECIFICITE` FOREIGN KEY (`SPEID`) REFERENCES `specificite_produit` (`SPEID`) ON DELETE CASCADE,
  CONSTRAINT `FK_PRODUIT_SPECIFICITEb` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `profession` (
  `PROFID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`PROFID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `profession_en` (
  `PROFID` int(11) NOT NULL,
  `TITRE` varchar(50) default NULL,
  PRIMARY KEY  (`PROFID`),
  CONSTRAINT `FK_HERITAGE_13` FOREIGN KEY (`PROFID`) REFERENCES `profession` (`PROFID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `profession_fr` (
  `PROFID` int(11) NOT NULL,
  `TITRE` varchar(50) default NULL,
  PRIMARY KEY  (`PROFID`),
  CONSTRAINT `FK_HERITAGE_13b` FOREIGN KEY (`PROFID`) REFERENCES `profession` (`PROFID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rubrique` (
  `RUBID` int(11) NOT NULL auto_increment,
  `RUB_RUBID` int(11) default NULL,
  `ORDRE` int(11) default NULL,
  `VISIBLE` tinyint(1) default NULL,
  PRIMARY KEY  (`RUBID`),
  KEY `EST_FILS_DE_FK` (`RUB_RUBID`),
  CONSTRAINT `FK_EST_FILS_DE` FOREIGN KEY (`RUB_RUBID`) REFERENCES `rubrique` (`RUBID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

CREATE TABLE `rubrique_en` (
  `RUBID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `DESCRIPTION` text,
  `PICTO` varchar(100) default NULL,
  `CSS` varchar(100) default NULL,
  `FRIENDLY_NAME` varchar(50) default NULL,
  `KEYWORD` longtext,
  PRIMARY KEY  (`RUBID`),
  CONSTRAINT `FK_HERITAGE_1` FOREIGN KEY (`RUBID`) REFERENCES `rubrique` (`RUBID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rubrique_fr` (
  `RUBID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `DESCRIPTION` text,
  `PICTO` varchar(100) default NULL,
  `CSS` varchar(100) default NULL,
  `FRIENDLY_NAME` varchar(50) default NULL,
  `KEYWORD` longtext,
  PRIMARY KEY  (`RUBID`),
  CONSTRAINT `FK_HERITAGE_1b` FOREIGN KEY (`RUBID`) REFERENCES `rubrique` (`RUBID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rubrique_produit` (
  `RUBID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  PRIMARY KEY  (`RUBID`,`PROID`),
  KEY `RELATION_4_FK` (`RUBID`),
  KEY `RELATION_4_FK2` (`PROID`),
  CONSTRAINT `FK_RUBRIQUE_PRODUIT` FOREIGN KEY (`PROID`) REFERENCES `produit` (`PROID`) ON DELETE CASCADE,
  CONSTRAINT `FK_RUBRIQUE_PRODUITb` FOREIGN KEY (`RUBID`) REFERENCES `rubrique` (`RUBID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `specificite_produit` (
  `SPEID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`SPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `specificite_produit_en` (
  `SPEID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `ABBR` longtext,
  PRIMARY KEY  (`SPEID`),
  CONSTRAINT `FK_HERITAGE_9` FOREIGN KEY (`SPEID`) REFERENCES `specificite_produit` (`SPEID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `specificite_produit_fr` (
  `SPEID` int(11) NOT NULL,
  `NOM` varchar(50) default NULL,
  `ABBR` longtext,
  PRIMARY KEY  (`SPEID`),
  CONSTRAINT `FK_HERITAGE_9b` FOREIGN KEY (`SPEID`) REFERENCES `specificite_produit` (`SPEID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


