DROP DATABASE inter_base;
CREATE DATABASE inter_base;
USE inter_base;

CREATE TABLE persons(
  code int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name varchar(50) NULL,
  surname varchar(50) NULL,
  id_number varchar(50) not NULL
);

CREATE TABLE accounts(
  code int not null PRIMARY KEY AUTO_INCREMENT,
  person_code int not null,
  account_number varchar(50) not null,
  outstanding_balance DECIMAL(13,2) not null,
  status BIT(1) NOT NULL DEFAULT b'1'
);
ALTER TABLE accounts
ADD CONSTRAINT FK_Account_Person
FOREIGN KEY (person_code) REFERENCES persons(code);



CREATE TABLE transactions(
  code int not null PRIMARY KEY AUTO_INCREMENT,
  account_code int not null,
  transaction_date datetime not null,
  capture_date datetime not null,
  amount DECIMAL(13,2) not null,
  description varchar(100) not null
);
ALTER TABLE transactions
ADD CONSTRAINT FK_Transaction_Account
FOREIGN KEY (account_code) REFERENCES accounts(code);




INSERT INTO persons (id_number,name,surname) VALUES ('63XX2907910XX','REJOCE','MAJOLA');
INSERT INTO persons (id_number,name,surname) VALUES ('70XX2403660XX','','MOKOMELE');
INSERT INTO persons (id_number,name,surname) VALUES ('42XX1002420XX','NTOMBIKHONA','MLAMBO');
INSERT INTO persons (id_number,name,surname) VALUES ('39XX1400850XX','KLAAS','OCKHUIS');
INSERT INTO persons (id_number,name,surname) VALUES ('59XX0110380XX','FERDI','LUUS');
INSERT INTO persons (id_number,name,surname) VALUES ('67XX1807700XX','SHAUN','LOVELOT');
INSERT INTO persons (id_number,name,surname) VALUES ('74XX2301550XX','','MOSOOANE');
INSERT INTO persons (id_number,name,surname) VALUES ('59XX1901940XX','','MOTENO');
INSERT INTO persons (id_number,name,surname) VALUES ('66XX0354900XX','','ZWANE');
INSERT INTO persons (id_number,name,surname) VALUES ('72XX1806150XX','JOSEPH','MOSWEU');
INSERT INTO persons (id_number,name,surname) VALUES ('78XX0650010XX','','ZULU');
INSERT INTO persons (id_number,name,surname) VALUES ('72XX2205500XX','','SKINI');
INSERT INTO persons (id_number,name,surname) VALUES ('60XX0707320XX','','MASOPA');
INSERT INTO persons (id_number,name,surname) VALUES ('56XX2351400XX','','COETZEE');
INSERT INTO persons (id_number,name,surname) VALUES ('65XX1003960XX','','BEN');
INSERT INTO persons (id_number,name,surname) VALUES ('68XX1612540XX','SOPHIE','SIHLANGU');
INSERT INTO persons (id_number,name,surname) VALUES ('71XX2451300XX','BUYISELWA','KEPATA');
INSERT INTO persons (id_number,name,surname) VALUES ('72XX2702550XX','ZANELE','NDLOVU');
INSERT INTO persons (id_number,name,surname) VALUES ('62XX2207640XX','','BARNABAS');
INSERT INTO persons (id_number,name,surname) VALUES ('75XX2302470XX','','ABRAHAMS');
INSERT INTO persons (id_number,name,surname) VALUES ('73XX1104570XX','','GOVENDER');
INSERT INTO persons (id_number,name,surname) VALUES ('65XX0106100XX','','ABDUL');
INSERT INTO persons (id_number,name,surname) VALUES ('47XX2706770XX','','MBIXANE');
INSERT INTO persons (id_number,name,surname) VALUES ('59XX1002010XX','MAVIS','MBOMBO');
INSERT INTO persons (id_number,name,surname) VALUES ('44XX0801450XX','','RAMALEPE');
INSERT INTO persons (id_number,name,surname) VALUES ('70XX3105540XX','','MRSHALOI');
INSERT INTO persons (id_number,name,surname) VALUES ('69XX2604250XX','','DE MEYER');
INSERT INTO persons (id_number,name,surname) VALUES ('73XX0311610XX','MICHAELINE','SITUMA');
INSERT INTO persons (id_number,name,surname) VALUES ('66XX2705830XX','','NDWANE');
INSERT INTO persons (id_number,name,surname) VALUES ('76XX2904740XX','','WEAVER');
INSERT INTO persons (id_number,name,surname) VALUES ('70XX2251240XX','REBECCA','JOOSTE');
INSERT INTO persons (id_number,name,surname) VALUES ('67XX2750210XX','','MOKETSI');
INSERT INTO persons (id_number,name,surname) VALUES ('77XX0952460XX','BUSISIWE','MTHANTI');
INSERT INTO persons (id_number,name,surname) VALUES ('67XX1256390XX','MICHEAL','TRUTER');
INSERT INTO persons (id_number,name,surname) VALUES ('70XX0355620XX','GLORY','SITHOLE');
INSERT INTO persons (id_number,name,surname) VALUES ('57XX1907550XX','ANNA','KOBE');
INSERT INTO persons (id_number,name,surname) VALUES ('69XX2459930XX','','PARTAB');
INSERT INTO persons (id_number,name,surname) VALUES ('70XX1507650XX','STORY','MAIPATO');
INSERT INTO persons (id_number,name,surname) VALUES ('69XX2005003XX','','SOTYATO');
INSERT INTO persons (id_number,name,surname) VALUES ('73XX1306320XX','FRANS','TOSKEY');
INSERT INTO persons (id_number,name,surname) VALUES ('58XX3100790XX','LILLIAN','DANIELS');
INSERT INTO persons (id_number,name,surname) VALUES ('72XX0401610XX','THEMBILE','MLUMBI');
INSERT INTO persons (id_number,name,surname) VALUES ('67XX1105810XX','BERENICE','MEINTJIES');
INSERT INTO persons (id_number,name,surname) VALUES ('73XX1807580XX','','NOMAVUKA');
INSERT INTO persons (id_number,name,surname) VALUES ('68XX1211490XX','NONHLANHLA','NGWENYA');
INSERT INTO persons (id_number,name,surname) VALUES ('77XX2304150XX','ELIZABETH','MOSES');
INSERT INTO persons (id_number,name,surname) VALUES ('76XX2902020XX','','JACOBS');
INSERT INTO persons (id_number,name,surname) VALUES ('58XX1802150XX','','GERTENBACH');
INSERT INTO persons (id_number,name,surname) VALUES ('78XX1701830XX','','MAMORARE');
INSERT INTO persons (id_number,name,surname) VALUES ('45XX2605080XX','','KHUMALO');



UPDATE `inter_base`.`persons` SET `name`='KHALAS' WHERE `code`='2';
UPDATE `inter_base`.`persons` SET `name`='FERDI' WHERE `code`='7';
UPDATE `inter_base`.`persons` SET `name`='SHAUN' WHERE `code`='8';
UPDATE `inter_base`.`persons` SET `name`='KEPATA' WHERE `code`='9';
UPDATE `inter_base`.`persons` SET `name`='SHONGWE' WHERE `code`='11';
UPDATE `inter_base`.`persons` SET `name`='MAVUSO' WHERE `code`='12';
UPDATE `inter_base`.`persons` SET `name`='CALVIN' WHERE `code`='13';
UPDATE `inter_base`.`persons` SET `name`='KRISTENE' WHERE `code`='14';
UPDATE `inter_base`.`persons` SET `name`='CARSON' WHERE `code`='15';
UPDATE `inter_base`.`persons` SET `name`='TSHEPO' WHERE `code`='19';
UPDATE `inter_base`.`persons` SET `name`='MIKE' WHERE `code`='20';
UPDATE `inter_base`.`persons` SET `name`='PRAVIN' WHERE `code`='21';
UPDATE `inter_base`.`persons` SET `name`='MOHAMMED' WHERE `code`='22';
UPDATE `inter_base`.`persons` SET `name`='PRINCE' WHERE `code`='23';
UPDATE `inter_base`.`persons` SET `name`='RAMPELE' WHERE `code`='25';
UPDATE `inter_base`.`persons` SET `name`='MHLONISHWA' WHERE `code`='26';
UPDATE `inter_base`.`persons` SET `name`='MOLOI' WHERE `code`='27';
UPDATE `inter_base`.`persons` SET `name`='PRINCE' WHERE `code`='29';
UPDATE `inter_base`.`persons` SET `name`='ERICA' WHERE `code`='30';
UPDATE `inter_base`.`persons` SET `name`='SIHLE' WHERE `code`='32';
UPDATE `inter_base`.`persons` SET `name`='PATRICK' WHERE `code`='37';
UPDATE `inter_base`.`persons` SET `name`='SAM' WHERE `code`='39';
UPDATE `inter_base`.`persons` SET `name`='NOMVULA' WHERE `code`='44';
UPDATE `inter_base`.`persons` SET `name`='PENAR' WHERE `code`='47';
UPDATE `inter_base`.`persons` SET `name`='GLEN' WHERE `code`='48';
UPDATE `inter_base`.`persons` SET `name`='AUSTIN' WHERE `code`='49';
UPDATE `inter_base`.`persons` SET `name`='SIMPHIWE' WHERE `code`='50';




INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '63XX2907910XX'),'10000577',234.99);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '70XX2403660XX'),'10001085',267.61);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '42XX1002420XX'),'1000373',520.67);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '39XX1400850XX'),'10007792',328.7);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '59XX0110380XX'),'10011773',641.7);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '67XX1807700XX'),'10012044',157.6);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '74XX2301550XX'),'100137',936.41);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '59XX1901940XX'),'10014357',440.87);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '66XX0354900XX'),'10015256',170.68);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '72XX1806150XX'),'10016473',663.77);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '78XX0650010XX'),'10017712',1471.27);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '72XX2205500XX'),'10019324',269.82);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '60XX0707320XX'),'10019766',485.78);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '56XX2351400XX'),'10020241',715.83);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '65XX1003960XX'),'10020918',81.35);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '68XX1612540XX'),'10021663',627.13);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '71XX2451300XX'),'10021698',426.43);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '72XX2702550XX'),'10022821',557.3);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '62XX2207640XX'),'10022996',299.2);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '75XX2302470XX'),'10024492',767.25);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '73XX1104570XX'),'10027262',483.55);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '65XX0106100XX'),'10027602',724.26);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '47XX2706770XX'),'10028579',1008.99);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '59XX1002010XX'),'1002864',1059.43);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '44XX0801450XX'),'10032223',719.65);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '70XX3105540XX'),'10032274',0);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '69XX2604250XX'),'1003267',843.59);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '73XX0311610XX'),'10036466',1186.85);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '66XX2705830XX'),'10036474',0);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '76XX2904740XX'),'10036679',226.79);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '70XX2251240XX'),'10037489',117.52);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '67XX2750210XX'),'10039015',542.08);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '77XX0952460XX'),'10039384',0);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '67XX1256390XX'),'10040919',612.1);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '70XX0355620XX'),'10041745',191.7);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '57XX1907550XX'),'10044361',807.6);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '69XX2459930XX'),'10045473',806.45);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '70XX1507650XX'),'10045856',310.03);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '69XX2005003XX'),'100460892',0);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '73XX1306320XX'),'10048022',0);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '58XX3100790XX'),'10048812',648.35);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '72XX0401610XX'),'1005022',260.85);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '67XX1105810XX'),'10050523',532.63);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '73XX1807580XX'),'10052623',302.85);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '68XX1211490XX'),'10052712',633.43);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '77XX2304150XX'),'10053581',281.77);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '76XX2902020XX'),'10053794',268.46);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '58XX1802150XX'),'10054855',1803.28);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '78XX1701830XX'),'10056262',789.74);
INSERT INTO accounts (person_code,account_number,outstanding_balance) VALUES ((SELECT  code FROM persons WHERE id_number = '45XX2605080XX'),'10057269',359.6);


INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10000577'),NOW(),NOW(),234.99,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10001085'),NOW(),NOW(),267.61,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '1000373'),NOW(),NOW(),520.67,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10007792'),NOW(),NOW(),328.7,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10011773'),NOW(),NOW(),641.7,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10012044'),NOW(),NOW(),157.6,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '100137'),NOW(),NOW(),936.41,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10014357'),NOW(),NOW(),440.87,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10015256'),NOW(),NOW(),170.68,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10016473'),NOW(),NOW(),663.77,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10017712'),NOW(),NOW(),1471.27,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10019324'),NOW(),NOW(),269.82,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10019766'),NOW(),NOW(),485.78,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10020241'),NOW(),NOW(),715.83,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10020918'),NOW(),NOW(),81.35,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10021663'),NOW(),NOW(),627.13,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10021698'),NOW(),NOW(),426.43,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10022821'),NOW(),NOW(),557.3,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10022996'),NOW(),NOW(),299.2,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10024492'),NOW(),NOW(),767.25,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10027262'),NOW(),NOW(),483.55,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10027602'),NOW(),NOW(),724.26,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10028579'),NOW(),NOW(),1008.99,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '1002864'),NOW(),NOW(),1059.43,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10032223'),NOW(),NOW(),719.65,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '1003267'),NOW(),NOW(),843.59,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10036466'),NOW(),NOW(),1186.85,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10036679'),NOW(),NOW(),226.79,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10037489'),NOW(),NOW(),117.52,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10039015'),NOW(),NOW(),542.08,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10040919'),NOW(),NOW(),612.1,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10041745'),NOW(),NOW(),191.7,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10044361'),NOW(),NOW(),807.6,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10045473'),NOW(),NOW(),806.45,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10045856'),NOW(),NOW(),310.03,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10048812'),NOW(),NOW(),648.35,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '1005022'),NOW(),NOW(),260.85,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10050523'),NOW(),NOW(),532.63,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10052623'),NOW(),NOW(),302.85,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10052712'),NOW(),NOW(),633.43,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10053581'),NOW(),NOW(),281.77,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10053794'),NOW(),NOW(),268.46,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10054855'),NOW(),NOW(),1803.28,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10056262'),NOW(),NOW(),789.74,'Charge Off Amount');
INSERT INTO transactions (account_code,transaction_date,capture_date,amount,description) VALUES ((SELECT  code FROM accounts WHERE account_number = '10057269'),NOW(),NOW(),359.6,'Charge Off Amount');
