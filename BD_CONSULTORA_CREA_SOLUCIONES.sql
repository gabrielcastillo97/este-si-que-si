DROP TABLE asesoria CASCADE CONSTRAINTS;
DROP TABLE empresa CASCADE CONSTRAINTS;
DROP TABLE profesional CASCADE CONSTRAINTS;
DROP TABLE sector CASCADE CONSTRAINTS;
DROP TABLE comuna CASCADE CONSTRAINTS;
DROP TABLE profesion CASCADE CONSTRAINTS;
DROP TABLE estado_civil CASCADE CONSTRAINTS;
DROP TABLE afp CASCADE CONSTRAINTS;
DROP TABLE isapre CASCADE CONSTRAINTS;
DROP TABLE rangos_sueldos CASCADE CONSTRAINTS;
DROP TABLE tipo_contrato CASCADE CONSTRAINTS;
DROP TABLE contador_auditor CASCADE CONSTRAINTS;
DROP TABLE contador_general CASCADE CONSTRAINTS;
DROP TABLE informatico CASCADE CONSTRAINTS;
DROP TABLE prevencionista CASCADE CONSTRAINTS;
DROP TABLE otros_profesionales CASCADE CONSTRAINTS;
DROP TABLE haberes_mes CASCADE CONSTRAINTS;
DROP TABLE descuentos_mes CASCADE CONSTRAINTS;
DROP TABLE liquido_mes CASCADE CONSTRAINTS;

CREATE TABLE afp (
  cod_afp NUMBER(1) NOT NULL,
  nombre_afp VARCHAR2(20) NOT NULL,
  porc NUMBER(5,2) NOT NULL,
  CONSTRAINT pk_afp PRIMARY KEY (cod_afp)
);

CREATE TABLE asesoria (
  numrun_prof NUMBER(10) NOT NULL,
  cod_empresa NUMBER NOT NULL, 
  honorario NUMBER NOT NULL
    CONSTRAINT ckc_sueldo_asesoria CHECK (honorario IS NULL OR (honorario <= 1000000)),  
  inicio_asesoria DATE NOT NULL, 
  fin_asesoria DATE NOT NULL,
  CONSTRAINT pk_asesoria PRIMARY KEY (numrun_prof, cod_empresa, inicio_asesoria)
);

CREATE TABLE comuna (
  cod_comuna NUMBER(5) NOT NULL, 
  nom_comuna VARCHAR2(20) NOT NULL,
  CONSTRAINT pk_comuna PRIMARY KEY (cod_comuna)
);

CREATE TABLE empresa (
  cod_empresa NUMBER(5) NOT NULL, 
  cod_comuna NUMBER(5) NOT NULL, 
  cod_sector NUMBER(5) NOT NULL, 
  nombre_empresa VARCHAR2(40) NOT NULL,
  CONSTRAINT pk_empresa PRIMARY KEY (cod_empresa)
);

CREATE TABLE isapre (
  cod_isapre NUMBER(1) NOT NULL, 
  nombre_isapre VARCHAR2(20) NOT NULL,
  CONSTRAINT pk_isapre PRIMARY KEY (cod_isapre)
);

CREATE TABLE profesion (
  cod_profesion NUMBER(5) NOT NULL, 
  nombre_profesion VARCHAR2(25) NOT NULL, 
  asignacion NUMBER(5,2) NOT NULL,
  CONSTRAINT pk_profesion PRIMARY KEY (cod_profesion)
);


CREATE TABLE estado_civil(
  cod_estcivil NUMBER(1) NOT NULL, 
  desc_estcivil VARCHAR2(25) NOT NULL, 
  CONSTRAINT pk_estado_civil PRIMARY KEY (cod_estcivil)
);


CREATE TABLE profesional (
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_profesional PRIMARY KEY (numrun_prof)
);


CREATE TABLE contador_general(
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_contador_general PRIMARY KEY (numrun_prof)
);


CREATE TABLE contador_auditor(
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_contador_auditor PRIMARY KEY (numrun_prof)
);


CREATE TABLE informatico(
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_informatico PRIMARY KEY (numrun_prof)
);


CREATE TABLE prevencionista(
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_prevencionista PRIMARY KEY (numrun_prof)
);


CREATE TABLE otros_profesionales(
  numrun_prof NUMBER(10) NOT NULL, 
  dvrun_prof VARCHAR2(1) NOT NULL,
  cod_comuna NUMBER NOT NULL, 
  cod_profesion NUMBER NOT NULL, 
  appaterno VARCHAR2(15) NOT NULL, 
  apmaterno VARCHAR2(15) NOT NULL, 
  nombre VARCHAR2(20) NOT NULL, 
  cod_estcivil NUMBER(1) NOT NULL,     
  sueldo NUMBER(8) NOT NULL, 
  cod_afp NUMBER(1) NOT NULL, 
  cod_isapre NUMBER(1) NOT NULL,
  cod_tpcontrato NUMBER(1),
  CONSTRAINT pk_otros_profesionales PRIMARY KEY (numrun_prof)
);



CREATE TABLE sector (
  cod_sector NUMBER(5) NOT NULL, 
  nombre_sector VARCHAR2(20) NOT NULL,
  CONSTRAINT pk_sector PRIMARY KEY (cod_sector)
);

CREATE TABLE rangos_sueldos (
  cod_rango NUMBER(2) NOT NULL,
  sueldo_min NUMBER(8) NOT NULL,
  sueldo_max NUMBER(8) NOT NULL, 
  porc_honorario NUMBER(4,2) NOT NULL, 
  CONSTRAINT pk_rangos PRIMARY KEY (cod_rango)
);  

CREATE TABLE tipo_contrato (
   cod_tpcontrato NUMBER(1) NOT NULL,
   nombre_tpcontrato VARCHAR2(30) NOT NULL,
   incentivo NUMBER(2) NOT NULL,
  CONSTRAINT pk_tipocontrato PRIMARY KEY (cod_tpcontrato)   
);

CREATE TABLE haberes_mes(
numrun_prof NUMBER(10) NOT NULL, 
dvrun_prof VARCHAR2(1) NOT NULL,
anno_mes  NUMBER(6) NOT NULL,
sueldo NUMBER(8) NOT NULL,
honorario NUMBER(8)  NOT NULL,
asignacion NUMBER(8) NOT NULL,
bono NUMBER(8) NOT NULL,
haberes NUMBER(8) NOT NULL,
CONSTRAINT pk_haberes_mes PRIMARY KEY(numrun_prof)
);

CREATE TABLE descuentos_mes(
numrun_prof NUMBER(10) NOT NULL, 
dvrun_prof VARCHAR2(1) NOT NULL,
anno_mes  NUMBER(6) NOT NULL,
desc_afp NUMBER(8)  NOT NULL,
desc_salud NUMBER(8) NOT NULL,
total_descuentos NUMBER(8) NOT NULL,
CONSTRAINT pk_descuentos_mes PRIMARY KEY(numrun_prof)
);

CREATE TABLE liquido_mes(
numrun_prof NUMBER(10) NOT NULL,
dvrun_prof VARCHAR2(1) NOT NULL,
anno_mes  NUMBER(6) NOT NULL,
total_haberes NUMBER(8)  NOT NULL,
total_descuentos NUMBER(8) NOT NULL,
liquido_a_pagar NUMBER(8) NOT NULL,
CONSTRAINT pk_liquido_mes PRIMARY KEY(numrun_prof)
);
  
ALTER TABLE empresa
   ADD CONSTRAINT fk_empresa_pertenece_sector FOREIGN KEY (cod_sector)
      REFERENCES sector (cod_sector);
      
ALTER TABLE empresa
   ADD CONSTRAINT fk_empresa_ubica_comuna FOREIGN KEY (cod_comuna)
      REFERENCES comuna (cod_comuna);

ALTER TABLE profesional
   ADD CONSTRAINT fk_profesional_vive_comuna FOREIGN KEY (cod_comuna)
      REFERENCES comuna (cod_comuna);

ALTER TABLE profesional
   ADD CONSTRAINT fk_profesional_profesion FOREIGN KEY (cod_profesion)
      REFERENCES profesion (cod_profesion);

ALTER TABLE profesional
   ADD CONSTRAINT fk_afp_profesional FOREIGN KEY (cod_afp)
      REFERENCES afp (cod_afp);

ALTER TABLE profesional
   ADD CONSTRAINT fk_isapre_profesional FOREIGN KEY (cod_isapre)
      REFERENCES isapre (cod_isapre);

ALTER TABLE profesional
   ADD CONSTRAINT fk_tcontrato_profesional FOREIGN KEY (cod_tpcontrato)
      REFERENCES tipo_contrato (cod_tpcontrato);

ALTER TABLE profesional
   ADD CONSTRAINT fk_estcivil_profesional FOREIGN KEY (cod_estcivil)
      REFERENCES estado_civil (cod_estcivil);

ALTER TABLE contador_general
   ADD CONSTRAINT fk_prof_contador_general FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE contador_auditor
   ADD CONSTRAINT fk_prof_contador_auditor FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE informatico
   ADD CONSTRAINT fk_prof_informatico FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE prevencionista
   ADD CONSTRAINT fk_prof_prevencionista FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE otros_profesionales
   ADD CONSTRAINT fk_prof_oprofesionales FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE asesoria
   ADD CONSTRAINT fk_asesoria_profesional FOREIGN KEY (numrun_prof)
      REFERENCES profesional (numrun_prof);

ALTER TABLE asesoria
   ADD CONSTRAINT fk_asesoria_empresa FOREIGN KEY (cod_empresa)
      REFERENCES empresa (cod_empresa);

ALTER TABLE haberes_mes
   ADD CONSTRAINT fk_haberes_mes_prof FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE descuentos_mes
   ADD CONSTRAINT fk_descuentos_mes_prof FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

ALTER TABLE liquido_mes
   ADD CONSTRAINT fk_liquido_mes_prof FOREIGN KEY (numrun_prof)
      REFERENCES profesional(numrun_prof);

INSERT INTO rangos_sueldos VALUES (1, 150000, 300000, .4);
INSERT INTO rangos_sueldos VALUES (2, 300001, 500000, .38);
INSERT INTO rangos_sueldos VALUES (3, 500001, 800000, .36);
INSERT INTO rangos_sueldos VALUES (4, 800001, 1200000, .34);
INSERT INTO rangos_sueldos VALUES (5, 1200001,1500000, .3);
INSERT INTO rangos_sueldos VALUES (6, 1500001,2000000, .28);
INSERT INTO rangos_sueldos VALUES (7, 2000001,3000000, .26);
INSERT INTO rangos_sueldos VALUES (8, 3000001,5000000, .24);

INSERT INTO tipo_contrato VALUES (1, 'Indefinido Jornada Completa', 15); 
INSERT INTO tipo_contrato VALUES (2, 'Indefinido Jornada Parcial', 10); 
INSERT INTO tipo_contrato VALUES (3, 'Plazo fijo', 5); 
INSERT INTO tipo_contrato VALUES (4, 'Honorarios', 5); 

INSERT INTO afp VALUES (1, 'CAPITAL',11.44);
INSERT INTO afp VALUES (2, 'CUPRUM',11.48);   
INSERT INTO afp VALUES (3, 'HABITAT',11.27); 
INSERT INTO afp VALUES (4, 'MODELO',10.77); 
INSERT INTO afp VALUES (5, 'PLANVITAL',12.36);
INSERT INTO afp VALUES (6, 'PROVIDA',11.54); 

INSERT INTO sector VALUES (1,'Comunicaciones');
INSERT INTO sector VALUES (2,'Servicios');
INSERT INTO sector VALUES (3,'Banca');
INSERT INTO sector VALUES (4,'Retail');

INSERT INTO estado_civil VALUES(1,'Soltero');
INSERT INTO estado_civil VALUES(2,'Casado');
INSERT INTO estado_civil VALUES(3,'Divorciado');
INSERT INTO estado_civil VALUES(4,'Viudo');


INSERT INTO comuna VALUES (80,'Las Condes');
INSERT INTO comuna VALUES (81,'Providencia');
INSERT INTO comuna VALUES (82,'Santiago');
INSERT INTO comuna VALUES (83,'Ñuñoa');
INSERT INTO comuna VALUES (84,'Vitacura');
INSERT INTO comuna VALUES (85,'La Reina');
INSERT INTO comuna VALUES (86,'La Florida');
INSERT INTO comuna VALUES (87,'Maipú');
INSERT INTO comuna VALUES (88,'Lo Barnechea');
INSERT INTO comuna VALUES (89,'Macul');
INSERT INTO comuna VALUES (90,'San Miguel');
INSERT INTO comuna VALUES (91,'Peñalolén');

INSERT INTO empresa VALUES (1,81,4,'Falabella');
INSERT INTO empresa VALUES (2,81,4,'Almacenes Paris');
INSERT INTO empresa VALUES (3,82,3,'Banco Santander');
INSERT INTO empresa VALUES (4,81,3,'Banco Estado');
INSERT INTO empresa VALUES (5,82,2,'Chilectra');
INSERT INTO empresa VALUES (6,82,2,'Aguas Andinas');
INSERT INTO empresa VALUES (7,81,2,'CGE');
INSERT INTO empresa VALUES (8,81,1,'Entel');
INSERT INTO empresa VALUES (9,81,1,'MaleStar');
INSERT INTO empresa VALUES (10,81,1,'Claro');
INSERT INTO empresa VALUES (11,81,2,'Enel');
INSERT INTO empresa VALUES (12,81,3,'Banco de Chile');

INSERT INTO isapre VALUES (1,'Masvida');
INSERT INTO isapre VALUES (2,'Vida Tres');
INSERT INTO isapre VALUES (3,'Banmédica');
INSERT INTO isapre VALUES (4,'Ferrosalud');
INSERT INTO isapre VALUES (5,'Colmena');
INSERT INTO isapre VALUES (6,'Consalud');
INSERT INTO isapre VALUES (7,'Cruz Blanca');

INSERT INTO profesion VALUES (1, 'Contador Auditor', 12.3);
INSERT INTO profesion VALUES (2, 'Contador General', 8.0);
INSERT INTO profesion VALUES (3, 'Ingeniero Informático', 14.36);
INSERT INTO profesion VALUES (4, 'Ingeniero Prevencionista', 21.34);
INSERT INTO profesion VALUES (5, 'Ingeniero Comercial', 14.32);
INSERT INTO profesion VALUES (6, 'Ingeniero Industrial', 22.44);


INSERT INTO profesional VALUES ('20624895','4',80,1,'Lester','Moran','Kisha',2,200000,5,3,3);
INSERT INTO profesional VALUES ('20652299','9',81,2,'Bolton','Choi','Bradford',3,400000,4,6,3);
INSERT INTO profesional VALUES ('20718476','8',82,3,'Sweeney','Landry','Stephanie',2,600000,4,3,3);
INSERT INTO profesional VALUES ('20823138','6',83,4,'Morrow','Daniels','Noel',3,800000,4,4,3);
INSERT INTO profesional VALUES ('20823222','0',84,5,'Morris','Ware','Devon',4,900000,4,2,3);
INSERT INTO profesional VALUES ('20899316','4',85,6,'Randall','Bolton','Wanda',1,500000,5,2,3);
INSERT INTO profesional VALUES ('20930084','4',86,1,'Joyce','Townsend','Hilary',2,300000,4,2,3);
INSERT INTO profesional VALUES ('21043583','2',87,2,'Thornton','Pugh','Shane',3,2600000,1,2,3);
INSERT INTO profesional VALUES ('21047530','8',88,3,'Bates','Villegas','Regina',1,1100000,3,5,3);
INSERT INTO profesional VALUES ('6057969','6',89,4,'Parsons','Marquez','Rachael',1,550000,4,6,3);
INSERT INTO profesional VALUES ('6275202','0',80,5,'Frost','Pineda','Marci',3,700000,2,5,2);
INSERT INTO profesional VALUES ('6502066','1',81,6,'Wilcox','Key','Leonard',1,600000,1,1,3);
INSERT INTO profesional VALUES ('6694138','K',82,1,'Phelps','Shepherd','Marcie',3,300000,2,2,3);
INSERT INTO profesional VALUES ('6946767','8',83,2,'Walton','Marquez','Melissa',1,1000000,5,1,2);
INSERT INTO profesional VALUES ('7034898','2',84,3,'Gamble','Roman','Travis',3,1200000,5,5,2);
INSERT INTO profesional VALUES ('7168526','9',85,4,'Gordon','Livingston','Latasha',2,400000,5,2,3);
INSERT INTO profesional VALUES ('7284220','2',86,5,'Mc Intyre','Chung','Marla',3,300000,3,4,3);
INSERT INTO profesional VALUES ('7503210','4',87,6,'Rubio','Sawyer','Dewayne',3,350000,3,5,3);
INSERT INTO profesional VALUES ('7744083','0',88,1,'Pittman','Frost','Chris',1,1900000,4,1,1);
INSERT INTO profesional VALUES ('7873889','0',89,2,'Harris','Wilcox','Teri',3,760000,2,4,2);
INSERT INTO profesional VALUES ('16612359','8',81,3,'Booth','Parsons','Ronda',1,450000,3,6,3);
INSERT INTO profesional VALUES ('18280709','7',82,4,'Tucker','Hurst','Mark',3,280000,5,4,3);
INSERT INTO profesional VALUES ('18336158','9',82,5,'Fletcher','Montgomery','Kendrick',1,490000,3,5,2);
INSERT INTO profesional VALUES ('18352172','6',81,6,'Wells','Hanna','Malcolm',1,940000,3,6,2);
INSERT INTO profesional VALUES ('18390208','3',83,1,'Bowers','Jordan','Juan',2,960000,2,4,1);
INSERT INTO profesional VALUES ('18421225','7',84,2,'Fisher','Gross','Martin',3,980000,1,5,1);
INSERT INTO profesional VALUES ('18505021','0',85,3,'Mc Millan','Schultz','Lynette',1,1000000,3,6,1);
INSERT INTO profesional VALUES ('18550492','7',86,4,'Cordova','Dean','Bryon',2,1020000,3,4,1);
INSERT INTO profesional VALUES ('18659997','1',87,5,'Shepherd','Herman','Jimmie',3,1040000,2,4,1);
INSERT INTO profesional VALUES ('18699786','7',87,6,'Grant','Murray','Cassandra',1,1060000,3,4,1);
INSERT INTO profesional VALUES ('18804511','9',87,1,'Burke','Howell','Jacob',2,1080000,1,6,1);
INSERT INTO profesional VALUES ('18829466','0',88,2,'Kline','Mc Bride','Olivia',3,1100000,2,6,2);
INSERT INTO profesional VALUES ('18835559','4',89,3,'Hardin','Wallace','Dora',1,1120000,3,5,2);
INSERT INTO profesional VALUES ('18839556','1',81,4,'Beard','Mc Gee','Karla',2,1140000,2,2,2);
INSERT INTO profesional VALUES ('18934168','8',81,5,'Ruiz','Hodges','Sylvia',3,1160000,3,4,2);
INSERT INTO profesional VALUES ('19100598','0',80,6,'Solomon','Bowen','Rick',4,1180000,4,4,2);
INSERT INTO profesional VALUES ('19120175','K',80,1,'Robles','Stafford','Helen',1,1200000,1,5,3);
INSERT INTO profesional VALUES ('19303268','2',80,2,'Reeves','Mack','Gabrielle',2,1220000,4,2,3);
INSERT INTO profesional VALUES ('19567994','2',82,3,'Choi','Keller','Rachel',1,1280000,2,5,3);
INSERT INTO profesional VALUES ('19607698','K',82,4,'Landry','Alvarado','Loretta',2,1300000,4,4,3);
INSERT INTO profesional VALUES ('19633374','3',82,5,'Daniels','Larsen','Nicolas',3,1320000,1,4,3);
INSERT INTO profesional VALUES ('19639001','0',89,6,'Ware','Cunningham','Clarence',1,1340000,2,6,3);
INSERT INTO profesional VALUES ('19664729','4',89,1,'Bolton','Tucker','Derek',2,1360000,1,1,3);
INSERT INTO profesional VALUES ('19743237','9',89,2,'Townsend','Fletcher','Moses',3,1380000,4,4,3);
INSERT INTO profesional VALUES ('19435555','8',89,3,'Reyes','Roth','Wendi',3,1240000,1,3,3);
INSERT INTO profesional VALUES ('16641880','0',84,4,'Hendricks','Richards','Jonathan',2,220000,4,4, NULL);
INSERT INTO profesional VALUES ('16690718','3',84,5,'Christian','Frost','Billie',3,240000,4,5, NULL);
INSERT INTO profesional VALUES ('16723459','7',84,6,'Solis','Petty','Devin',4,260000,2,5, NULL);
INSERT INTO profesional VALUES ('16764496','8',85,1,'Mccoy','Wilcox','Sylvia',1,280000,4,3,3);
INSERT INTO profesional VALUES ('16874219','K',85,2,'Huang','Phelps','Christy',3,320000,4,2,3);
INSERT INTO profesional VALUES ('17067642','7',85,3,'Shepard','Carney','Herman',4,340000,5,3, NULL);
INSERT INTO profesional VALUES ('17204426','5',86,4,'Trujillo','Friedman','Aaron',2,380000,1,5,3);
INSERT INTO profesional VALUES ('17237023','3',86,5,'Lang','Villanueva','Jody',1,420000,3,5,4);
INSERT INTO profesional VALUES ('17264208','K',86,6,'Montgomery','Mc Intyre','Randy',3,460000,5,2,2);
INSERT INTO profesional VALUES ('17393265','9',87,1,'Hanna','Cruz','Kristen',2,480000,2,3,2);
INSERT INTO profesional VALUES ('17467536','3',87,2,'Jordan','Rubio','Justin',3,500000,1,4,3);
INSERT INTO profesional VALUES ('17511566','6',87,3,'Gross','Marquez','Trisha',4,520000,3,3,3);
INSERT INTO profesional VALUES ('17567043','0',88,4,'Schultz','Pittman','Randall',1,540000,2,5,3);
INSERT INTO profesional VALUES ('17598097','8',88,5,'Dean','Pineda','Christie',2,560000,2,4,2);
INSERT INTO profesional VALUES ('17604208','9',88,6,'Herman','Harris','Iris',3,580000,3,2,2);
INSERT INTO profesional VALUES ('17723898','5',81,1,'Wallace','Booth','Enrique',1,660000,3,3,2);
INSERT INTO profesional VALUES ('17814206','2',82,2,'Mc Gee','Hendricks','Bridget',2,680000,4,4,2);
INSERT INTO profesional VALUES ('17817690','7',80,3,'Hodges','Christian','Felix',3,700000,4,2,1);
INSERT INTO profesional VALUES ('17862825','8',80,4,'Bowen','Solis','Yvonne',1,720000,4,4,1);
INSERT INTO profesional VALUES ('17248479','4',80,5,'Hurst','Gordon','Wanda',2,440000,2,4,2);
INSERT INTO profesional VALUES ('17889317','3',80,6,'Stafford','Mccoy','Alvin',1,740000,1,2,2);
INSERT INTO profesional VALUES ('17896457','9',82,1,'Mack','Yoder','Bridgett',2,760000,1,2,2);
INSERT INTO profesional VALUES ('17909864','1',82,2,'Roth','Huang','Penny',3,780000,2,5,1);
INSERT INTO profesional VALUES ('17934688','0',81,3,'Gaines','Shepard','Rick',1,800000,4,6,1);
INSERT INTO profesional VALUES ('17950830','7',81,4,'Keller','Fowler','Roberto',2,820000,3,6,1);
INSERT INTO profesional VALUES ('18014045','K',82,5,'Alvarado','Trujillo','Rhonda',3,840000,5,2,1);
INSERT INTO profesional VALUES ('18156650','6',83,6,'Larsen','Velasquez','Darlene',1,860000,4,3,1);
INSERT INTO profesional VALUES ('18184240','0',83,1,'Cunningham','Lang','Courtney',2,880000,1,4,1);
INSERT INTO profesional VALUES ('19435837','5',83,2,'Moran','Gaines','Kirsten',4,1260000,4,4,1);
INSERT INTO profesional VALUES ('19770211','9',84,3,'Pugh','Wells','Autumn',2,1400000,3,3,1);
INSERT INTO profesional VALUES ('19796164','2',85,4,'Villegas','Bowers','Bridget',3,1420000,5,4,1);
INSERT INTO profesional VALUES ('19816444','4',85,5,'Ballard','Fisher','Oscar',4,1440000,4,3,1);
INSERT INTO profesional VALUES ('19833967','5',86,6,'Trevino','Mc Millan','Kendra',1,1460000,4,5,1);
INSERT INTO profesional VALUES ('19921273','6',86,1,'White','Cordova','Tyler',1,1480000,2,2,1);
INSERT INTO profesional VALUES ('19952110','7',87,2,'Meyers','Shepherd','Teresa',2,1500000,2,2,1);
INSERT INTO profesional VALUES ('19987871','2',88,3,'Meyer','Grant','Victoria',3,1520000,4,2,1);
INSERT INTO profesional VALUES ('20007856','3',88,4,'Briggs','Burke','Natalie',4,800000,5,3,2);
INSERT INTO profesional VALUES ('20269498','9',88,5,'Hines','Kline','Bonnie',1,500000,3,4,2);
INSERT INTO profesional VALUES ('20318058','K',89,6,'Ortiz','Hardin','Audrey',2,300000,3,3,3);
INSERT INTO profesional VALUES ('20377241','9',90,1,'Burke','Beard','Roger',3,500000,4,4,3);
INSERT INTO profesional VALUES ('20451244','6',91,2,'Khan','Ruiz','Bret',4,300000,3,3,3);
INSERT INTO profesional VALUES ('20451888','6',82,3,'Ward','Solomon','Erica',1,400000,3,5,3);
INSERT INTO profesional VALUES ('20528928','1',91,4,'Benitez','Robles','Kelvin',2,150000,2,5,3);
INSERT INTO profesional VALUES ('20559425','9',91,1,'Bean','Reeves','Jeannette',3,400000,3,4,2);
INSERT INTO profesional VALUES ('20608226','K',91,2,'Dillon','Reyes','Ricardo',1,400000,2,3,2);
INSERT INTO profesional VALUES ('6269943','8',91,3,'Richards','Pittman','Sheryl',2,300000,3,2,2);
INSERT INTO profesional VALUES ('6419034','9',91,4,'Petty','Harris','Timothy',4,500000,5,5,2);
INSERT INTO profesional VALUES ('6506702','K',82,5,'Chambers','Osborne','Leonard',2,700000,5,4,2);
INSERT INTO profesional VALUES ('6756480','2',81,6,'Carney','Snow','Seth',4,900000,4,2,2);
INSERT INTO profesional VALUES ('7005434','0',81,1,'Friedman','Rios','Carmen',2,1100000,4,1,1);
INSERT INTO profesional VALUES ('7150191','9',82,2,'Villanueva','Acevedo','Lewis',1,3300000,3,5,1);
INSERT INTO profesional VALUES ('7380283','5',80,3,'Cruz','Boyle','Alisa',2,1600000,4,5,1);
INSERT INTO profesional VALUES ('7560327','1',80,4,'Marquez','Richards','Rochelle',4,400000,4,1,2);
INSERT INTO profesional VALUES ('7860078','9',80,5,'Pineda','Petty','Darius',2,2000000,1,4,1);
INSERT INTO profesional VALUES ('16809546','5',80,6,'Yoder','Chambers','Irene',2,300000,1,2,2);
INSERT INTO profesional VALUES ('17186610','4',83,1,'Fowler','Walton','Yesenia',1,360000,2,5,2);
INSERT INTO profesional VALUES ('17233467','7',83,2,'Velasquez','Gamble','Josh',3,400000,4,6,2);

INSERT INTO contador_auditor 
SELECT * FROM profesional
WHERE cod_profesion IN (1,2)
AND sueldo  <  350000;

INSERT INTO contador_general
SELECT * FROM profesional
WHERE cod_profesion = 2;

INSERT INTO informatico
SELECT * FROM profesional
WHERE cod_profesion = 3;

INSERT INTO prevencionista
SELECT * FROM profesional
WHERE cod_profesion = 4;

INSERT INTO otros_profesionales
SELECT * FROM profesional
WHERE cod_profesion IN (4,6)
AND sueldo  <  350000;

INSERT INTO asesoria VALUES ('6057969','3','103415','02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','5','872093','04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','1','687846','06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','4','552461','08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','2','167721','10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','3','231098','12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','7','749303','14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','8','165717','16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','3','443924','18/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','4','268353','20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','3','278976','22/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','6','493630','24/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','6','227649','26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','3','787352','28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','10','563981','30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','1','830208','01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','5','410779','03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','8','452048','05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','9','162683','07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','10','252769','09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','3','802218','11/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','4','520941','13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','8','892695','15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','8','566837','17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','10','818652','19/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','4','588785','21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','5','488016','23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','5','329921','25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','5','716795','27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','8','292641','01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','7','274213','03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','2','667328','05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','1','208428','07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','1','846791','09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','9','694903','11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','10','185648','13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','9','869715','15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','1','482895','17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','1','662892','19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','9','263783','21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','9','899843','23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','7','105093','25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','3','169723','27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','4','583967','29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','4','802802','31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','6','681449','02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','4','574091','04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','6','634586','06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','8','582235','08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','9','545965','10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','8','434737','12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','5','823368','14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','4','717910','16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','4','773399','18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','2','141019','20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','5','729312','22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','5','512564','24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','6','698144','26/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','2','609593','28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','6','173257','30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','8','219174','02/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','3','328525','04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','2','848944','06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','3','568402','08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','4','193975','10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','7','412947','12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','10','628602','14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','8','501630','16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','6','302145','18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','9','472355','20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','5','735915','22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','9','754667','24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','1','518677','26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','1','602036','28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','6','622979','30/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','9','374193','01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','5','593154','03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','10','376461','05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','7','133469','07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','116315','09/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','1','204126','11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','10','528744','13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','1','553838','15/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','6','708351','17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','5','592882','19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','10','577121','21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','8','290136','23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','884373','25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','8','224188','27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','4','140121','29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','5','229606','01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','10','337529','03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','1','354700','05/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','7','462317','07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','6','444617','09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','10','784503','11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','7','241869','13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','4','394675','15/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','8','374097','17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','9','888845','19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','9','572339','21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','6','579942','23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','1','820672','25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','8','253271','27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','9','436228','29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','8','622160','31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','8','485830','02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','5','802348','04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','9','411350','06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','10','590054','08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','1','453536','10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','8','830324','12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','6','214721','14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','3','126638','16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','8','547319','18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','1','620927','20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','10','143356','22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','4','821874','24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','2','142263','26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','6','263626','28/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','6','229361','30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','2','330668','01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','6','525135','03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','4','404012','05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','9','623905','07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','5','698085','09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','8','207450','11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','8','843346','13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','3','198990','15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','5','884293','17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','7','565376','19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','3','757344','21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','1','384432','23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','5','702970','25/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','5','864825','27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','6','592913','29/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','9','879723','01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','9','483589','03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','7','638428','05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','8','835217','07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','7','504599','09/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','3','727140','11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','4','802055','13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','8','243015','15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','7','152055','17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','8','894222','19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','4','511118','21/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','8','585145','23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','630034','25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','7','139031','27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','10','677186','29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','4','647470','31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','6','176993','02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','10','889681','04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','1','777717','06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','4','414956','08/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','4','754970','10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','7','712683','12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','10','591593','14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','9','246825','16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','1','881782','18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','9','201396','20/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','8','243737','22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','2','895245','24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','558030','26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','1','200434','28/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','10','554901','30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','7','779139','02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','1','473269','04/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','5','640331','06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','3','536266','08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','3','342517','10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','2','504249','12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','10','367123','14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','1','731588','16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','3','420477','18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','4','718451','20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','649412','22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','6','802594','24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','8','333034','26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','1','239225','28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','6','247308','30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','9','212455','03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','6','167244','05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','6','364952','07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','1','871051','09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','9','727390','11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','9','743868','13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','4','382059','15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','8','733931','17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','10','885763','19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','9','668873','21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','5','175737','23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','9','485410','25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','10','424348','27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','6','838643','29/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','2','318878','31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','1','230329','02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','2','230511','04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','8','617764','06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','9','266758','08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','10','496801','10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','8','602920','12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','9','715009','14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','1','485532','16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','10','186827','18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','7','511667','20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','9','542752','22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','8','121865','24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','2','198091','26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','7','333864','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','1','591151','02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','5','617740','04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','10','146483','06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','3','202941','08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','8','722591','10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','10','894638','12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','5','739031','14/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','1','167964','16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','339131','18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','1','130483','20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','9','878739','22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','9','714337','24/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','1','544210','26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','7','801898','28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','3','767840','30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','9','579473','01/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','3','327023','03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','5','351739','05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','10','205052','07/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','2','525782','09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','6','515677','11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','7','477987','13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','4','814770','15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','8','144238','17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','8','288303','19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','5','668566','21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','7','193234','23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','2','359536','25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','9','708757','27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','1','553094','29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','4','645081','01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','6','428713','03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','3','698636','05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','2','265960','07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','3','534441','09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','2','110385','11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','1','470703','13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','3','116601','15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','6','861320','17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','5','670694','19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','3','355371','21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','6','138755','23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','10','408184','25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','4','858744','27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','7','331715','29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','7','330518','31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','9','600764','02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','8','250373','04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','3','417632','06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','10','566387','08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','7','293637','10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','7','696556','12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','6','717756','14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','10','511779','16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','1','629971','18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','10','796736','20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','3','207618','22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','5','265387','24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','4','105393','26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','5','499282','28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','9','239680','30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','9','413439','02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','3','146611','04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','8','747119','06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','6','823479','08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','7','102646','10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','6','839643','12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','3','783640','14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','9','262348','16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','3','228929','18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','8','258438','20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','10','345755','22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','6','562385','24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','5','593104','26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','2','788832','28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','3','171552','30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','5','531157','01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','1','685773','03/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','2','280410','05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','2','170132','07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','5','397843','09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','10','892739','11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','420060','13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','8','703448','15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','10','446422','17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','2','676642','19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','9','146523','21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','10','681168','23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','7','291291','25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','5','892313','27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','6','426786','29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','6','420535','31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','6','833084','02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','3','255801','04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','1','564534','06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','5','632044','08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','3','598159','10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','8','172231','12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','2','563837','14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','5','581411','16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','8','269686','18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','7','877572','20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','10','831664','22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','2','859088','24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','8','566855','26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','3','449988','28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','8','805809','30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','7','683179','02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','8','204863','04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','5','119854','06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','10','602509','08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','3','823005','10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','1','763815','12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','5','532448','14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','10','627069','16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','6','240133','18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','7','452269','20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','2','497021','22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','2','589025','24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','1','332274','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','8','426913','28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','3','814658','30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','9','705281','01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','9','247801','03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','3','666844','05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','1','670251','07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','8','346309','09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','3','173971','11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','5','130561','13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','7','775607','15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','8','325365','17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','3','552939','19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','4','353233','21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','1','489300','23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','10','399977','25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','3','570409','27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','1','756572','29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','3','289458','01/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','3','666562','03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','8','429303','05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','9','525074','07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','4','850746','09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','5','161766','11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','7','274746','13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','2','240918','15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','2','400131','17/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','7','291734','19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','2','480463','21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','6','119343','23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','1','165746','25/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','6','683032','27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','5','806064','29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','5','895029','31/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','4','738477','02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','5','833784','04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','7','208145','06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','4','895878','08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','8','449304','10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','10','503882','12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','690568','14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','7','693859','16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','2','196708','18/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','2','418891','20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','9','696108','22/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','1','417714','24/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','10','122780','26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','7','559709','28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','838376','30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','3','396268','01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','10','197666','03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','6','692801','05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','10','885154','07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','1','343147','09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','7','305247','11/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','5','457324','13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','9','676999','15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','3','681822','17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','5','570282','19/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','5','796420','21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','6','475414','23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','10','633998','25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','8','321906','27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','7','654102','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','432520','02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','6','203342','04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','1','735579','06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','5','130731','08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','1','712966','10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','7','334804','12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','6','865066','14/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','3','788216','16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','7','445069','18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','7','706733','20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','9','164829','22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','5','401737','24/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','7','343766','26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','4','221935','28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','1','863254','30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','5','160616','01/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','10','847914','03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','5','156542','05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','3','716956','07/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','7','602707','09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','1','893474','11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','1','642340','13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','3','718841','15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','9','414859','17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','7','499194','19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','1','268614','21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','9','338703','23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','8','719074','25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','6','816224','27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','9','220677','29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','6','298872','01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','7','879927','03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','8','608004','05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','9','632461','07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','9','586931','09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','3','397091','11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','6','546948','13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','9','369969','15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','8','506984','17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','2','205312','19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','6','466301','21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','4','413349','23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','371793','25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','10','810427','27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','10','210503','29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','8','227858','31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','9','518405','02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','8','206454','04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','4','835817','06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','2','823279','08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','548284','10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','2','498774','12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','2','532152','14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','4','362497','16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','5','495252','18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','10','752327','20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','7','213439','22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','1','543268','24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','4','601971','26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','1','269593','28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','6','355113','30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','3','665745','02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','2','654827','04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','10','443406','06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','9','321795','08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','4','549042','10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','335232','12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','4','691152','14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','3','279352','16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','10','243333','18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','7','390529','20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','9','309582','22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','9','263393','24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','2','288924','26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','544089','28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','8','779605','30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','7','704512','01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','10','450277','03/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','9','324249','05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','5','108535','07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','10','586520','09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','7','414623','11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','9','117325','13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','1','595174','15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','5','199396','17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','9','819386','19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','4','714436','21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','2','262508','23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','3','536141','25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','2','308297','27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','2','467768','29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','9','168181','31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','3','253456','02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','7','878802','04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','10','739894','06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','5','618064','08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','10','828460','10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','9','233105','12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','10','179586','14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','7','845795','16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','5','587423','18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','5','804347','20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','10','178452','22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','4','313738','24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','9','280697','26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','7','723621','28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','10','311508','30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','10','246706','02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','10','899218','04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','10','603209','06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','2','470879','08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','3','617237','10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','5','360064','12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','8','221271','14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','3','757122','16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','4','710116','18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','3','198617','20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','7','619284','22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','4','610606','24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','1','764365','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','1','435511','28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','5','833217','30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','851301','01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','3','420033','03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','733478','05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','5','721469','07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','5','854008','09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','5','327941','11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','3','287065','13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','7','559528','15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','10','672416','17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','6','155782','19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','9','199183','21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','5','803254','23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','1','164173','25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','4','812736','27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','5','379067','29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','817262','01/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','10','847994','03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','9','217995','07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','7','598548','09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','9','115629','11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','6','742284','13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','2','248790','15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','10','529268','17/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','9','764320','19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','8','493077','21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','1','306798','23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','9','348129','25/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','3','701405','27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','9','109061','29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','2','775165','03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','680943','05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','9','152341','07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','3','838771','09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','10','695081','11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','5','524760','13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','10','769424','15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','8','204033','17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','1','445233','19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','7','433104','21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','3','218433','23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','1','582372','25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','5','387762','27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','4','517784','29/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','3','192925','31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','10','462246','02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','1','652906','04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','7','649532','06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','5','879592','08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','7','801581','10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','5','674297','12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','5','340685','14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','10','376665','16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','5','363666','18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','2','647388','20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','8','896039','22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','1','421369','24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','2','460500','26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','1','871918','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','7','526792','01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','1','791837','03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','9','288685','05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','7','471117','07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','4','718842','09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','9','708295','11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','1','311021','13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','10','396843','15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','6','218337','17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','9','162774','19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','4','184059','21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','2','101346','23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','9','511252','25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','9','535961','27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','5','532895','29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','8','263296','31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','1','755583','02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','4','328611','04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','5','661163','06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','2','255095','08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','6','132659','10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','3','544370','12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','5','899177','14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','5','655112','16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','8','185781','18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','206902','20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','3','423340','22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','7','397840','24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','4','520326','26/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','9','455332','28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','244028','30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','9','188151','02/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','1','340053','04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','248866','06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','4','719069','08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','7','300777','10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','9','569678','12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','9','899823','14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','2','256317','16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','2','471941','18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','9','556085','20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','1','308266','22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','9','678526','24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','6','281533','26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','9','406199','28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','6','168214','30/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','9','846343','01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','6','561661','03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','10','715440','05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','1','719326','07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','1','433907','09/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','1','347231','11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','6','604463','13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','6','102018','15/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','6','556884','17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','10','641178','19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','4','110817','21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','1','682506','23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','9','364220','25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','5','838120','27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','7','762415','29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','4','899720','01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','9','608048','03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','7','833699','05/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','3','749055','07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','3','128180','09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','5','268285','11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','1','735314','13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','8','448003','15/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','8','599361','17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','6','488924','19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','2','760980','21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','2','203949','23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','5','863022','25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','5','537213','27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','2','328423','29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','6','294221','31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','10','490964','02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','6','560886','04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','5','602056','06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','4','327940','08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','7','659044','10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','1','349532','12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','741469','14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','10','565076','16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','9','603428','18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','10','841262','20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','2','112034','22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','2','485476','24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','4','253866','26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','5','753995','28/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','511517','30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','5','729399','01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','4','790462','03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','7','797312','05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','7','213938','07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','7','184195','09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','5','813133','11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','6','654382','13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','485190','15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','4','294369','17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','8','852162','19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','1','560238','21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','7','664377','23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','9','672473','25/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','2','418273','27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','2','618619','29/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','782997','01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','9','739812','03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','7','301289','05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','1','166877','07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','1','238019','09/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','9','354358','11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','8','562813','13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','8','401940','15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','1','435055','17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','7','231782','19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','9','788284','21/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','7','160041','23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','2','779844','25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','544337','27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','1','650452','29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','7','598173','31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','2','642584','02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','5','571854','04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','4','344017','06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','9','785907','08/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','6','235996','10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','2','149412','12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','4','655022','14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','4','338979','16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','6','192764','18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','5','203609','20/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','7','570177','22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','8','605734','24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','10','373554','26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','2','317444','28/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','9','153447','30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','9','430475','02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','5','831789','04/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','10','744869','06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','7','313770','08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','3','279669','10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','8','593293','12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','6','517527','14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','9','443577','16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','1','436623','18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','7','510690','20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','8','355751','22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','7','644570','24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','9','527586','26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','6','134754','28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','2','145963','30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/03/'||TO_CHAR(SYSDATE,'yyyy'));

INSERT INTO asesoria VALUES ('16690718','7','132806','17/07/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','9','115804','12/07/'||TO_CHAR(SYSDATE,'yyyy'),'31/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','10','690117','15/07/'||TO_CHAR(SYSDATE,'yyyy'),'14/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','10','528445','26/06/'||TO_CHAR(SYSDATE,'yyyy'),'03/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','6','283465','07/07/'||TO_CHAR(SYSDATE,'yyyy'),'31/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','194808','30/06/'||TO_CHAR(SYSDATE,'yyyy'),'25/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','10','855167','28/06/'||TO_CHAR(SYSDATE,'yyyy'),'25/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','7','826896','10/07/'||TO_CHAR(SYSDATE,'yyyy'),'20/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','1','151753','19/07/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','2','682970','19/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','7','486988','04/07/'||TO_CHAR(SYSDATE,'yyyy'),'04/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','1','420349','13/07/'||TO_CHAR(SYSDATE,'yyyy'),'22/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','7','178292','23/07/'||TO_CHAR(SYSDATE,'yyyy'),'25/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','7','441800','03/07/'||TO_CHAR(SYSDATE,'yyyy'),'15/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','5','118532','12/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','10','803426','03/07/'||TO_CHAR(SYSDATE,'yyyy'),'23/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','3','874340','22/07/'||TO_CHAR(SYSDATE,'yyyy'),'24/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','9','123152','27/07/'||TO_CHAR(SYSDATE,'yyyy'),'02/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','3','506167','28/07/'||TO_CHAR(SYSDATE,'yyyy'),'20/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','10','138705','02/07/'||TO_CHAR(SYSDATE,'yyyy'),'25/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','5','210397','14/07/'||TO_CHAR(SYSDATE,'yyyy'),'29/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','5','153403','02/07/'||TO_CHAR(SYSDATE,'yyyy'),'14/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','10','627033','14/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','5','524511','31/07/'||TO_CHAR(SYSDATE,'yyyy'),'28/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','4','380325','07/07/'||TO_CHAR(SYSDATE,'yyyy'),'02/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','5','404939','25/07/'||TO_CHAR(SYSDATE,'yyyy'),'29/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','8','628346','18/07/'||TO_CHAR(SYSDATE,'yyyy'),'05/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','5','149562','24/07/'||TO_CHAR(SYSDATE,'yyyy'),'23/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','6','415607','28/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','5','157314','15/07/'||TO_CHAR(SYSDATE,'yyyy'),'06/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','1','836907','21/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','10','287712','02/08/'||TO_CHAR(SYSDATE,'yyyy'),'01/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','10','308215','10/07/'||TO_CHAR(SYSDATE,'yyyy'),'02/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','586575','06/07/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','5','344996','01/08/'||TO_CHAR(SYSDATE,'yyyy'),'10/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','262119','18/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','5','727264','21/07/'||TO_CHAR(SYSDATE,'yyyy'),'15/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','1','134312','16/07/'||TO_CHAR(SYSDATE,'yyyy'),'03/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','6','604528','31/07/'||TO_CHAR(SYSDATE,'yyyy'),'30/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','2','689406','04/08/'||TO_CHAR(SYSDATE,'yyyy'),'25/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','10','565417','20/07/'||TO_CHAR(SYSDATE,'yyyy'),'06/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','6','471818','30/07/'||TO_CHAR(SYSDATE,'yyyy'),'30/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','6','667788','07/08/'||TO_CHAR(SYSDATE,'yyyy'),'24/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','3','138333','02/08/'||TO_CHAR(SYSDATE,'yyyy'),'22/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','3','777169','22/07/'||TO_CHAR(SYSDATE,'yyyy'),'21/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','10','574919','26/07/'||TO_CHAR(SYSDATE,'yyyy'),'16/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','6','868149','17/07/'||TO_CHAR(SYSDATE,'yyyy'),'30/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','3','798988','08/08/'||TO_CHAR(SYSDATE,'yyyy'),'25/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','5','861126','13/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','6','411834','23/07/'||TO_CHAR(SYSDATE,'yyyy'),'15/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','10','712586','03/08/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','10','826026','12/08/'||TO_CHAR(SYSDATE,'yyyy'),'11/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','7','824200','04/08/'||TO_CHAR(SYSDATE,'yyyy'),'22/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','2','301678','20/07/'||TO_CHAR(SYSDATE,'yyyy'),'21/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','2','620624','07/08/'||TO_CHAR(SYSDATE,'yyyy'),'14/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','10','616164','05/08/'||TO_CHAR(SYSDATE,'yyyy'),'20/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','3','293579','26/07/'||TO_CHAR(SYSDATE,'yyyy'),'15/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','7','600815','11/08/'||TO_CHAR(SYSDATE,'yyyy'),'19/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','8','800133','16/08/'||TO_CHAR(SYSDATE,'yyyy'),'30/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','1','517439','24/07/'||TO_CHAR(SYSDATE,'yyyy'),'08/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','5','214915','25/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','8','123301','06/08/'||TO_CHAR(SYSDATE,'yyyy'),'02/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','9','450534','14/08/'||TO_CHAR(SYSDATE,'yyyy'),'01/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','6','880729','30/07/'||TO_CHAR(SYSDATE,'yyyy'),'12/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','7','121837','29/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','8','365876','14/08/'||TO_CHAR(SYSDATE,'yyyy'),'04/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','7','204949','09/08/'||TO_CHAR(SYSDATE,'yyyy'),'30/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','3','690358','10/08/'||TO_CHAR(SYSDATE,'yyyy'),'22/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','2','235531','27/07/'||TO_CHAR(SYSDATE,'yyyy'),'31/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','1','885287','18/08/'||TO_CHAR(SYSDATE,'yyyy'),'22/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','10','241079','17/08/'||TO_CHAR(SYSDATE,'yyyy'),'07/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','9','578398','01/08/'||TO_CHAR(SYSDATE,'yyyy'),'06/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','10','122754','09/08/'||TO_CHAR(SYSDATE,'yyyy'),'08/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','3','541640','15/08/'||TO_CHAR(SYSDATE,'yyyy'),'11/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','6','158597','10/08/'||TO_CHAR(SYSDATE,'yyyy'),'19/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','10','195404','05/08/'||TO_CHAR(SYSDATE,'yyyy'),'15/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','1','172607','29/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','8','241832','22/08/'||TO_CHAR(SYSDATE,'yyyy'),'27/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','4','383641','26/08/'||TO_CHAR(SYSDATE,'yyyy'),'28/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','2','646747','18/08/'||TO_CHAR(SYSDATE,'yyyy'),'07/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','9','575300','13/08/'||TO_CHAR(SYSDATE,'yyyy'),'16/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','10','297059','03/08/'||TO_CHAR(SYSDATE,'yyyy'),'26/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','3','365285','13/08/'||TO_CHAR(SYSDATE,'yyyy'),'12/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','3','895835','25/08/'||TO_CHAR(SYSDATE,'yyyy'),'15/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','3','172128','11/08/'||TO_CHAR(SYSDATE,'yyyy'),'02/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','7','672879','19/08/'||TO_CHAR(SYSDATE,'yyyy'),'08/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','3','261116','15/08/'||TO_CHAR(SYSDATE,'yyyy'),'24/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','8','373106','23/08/'||TO_CHAR(SYSDATE,'yyyy'),'06/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','6','497259','24/08/'||TO_CHAR(SYSDATE,'yyyy'),'23/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','2','535719','25/08/'||TO_CHAR(SYSDATE,'yyyy'),'17/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','4','679189','23/08/'||TO_CHAR(SYSDATE,'yyyy'),'03/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','7','846728','06/08/'||TO_CHAR(SYSDATE,'yyyy'),'18/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','723202','26/08/'||TO_CHAR(SYSDATE,'yyyy'),'12/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','10','441746','08/08/'||TO_CHAR(SYSDATE,'yyyy'),'23/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','3','667741','02/09/'||TO_CHAR(SYSDATE,'yyyy'),'09/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','9','428706','28/08/'||TO_CHAR(SYSDATE,'yyyy'),'28/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','6','834580','04/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','4','320690','01/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','533608','06/09/'||TO_CHAR(SYSDATE,'yyyy'),'14/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','7','221338','12/08/'||TO_CHAR(SYSDATE,'yyyy'),'04/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','2','526348','20/08/'||TO_CHAR(SYSDATE,'yyyy'),'21/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','5','541412','09/09/'||TO_CHAR(SYSDATE,'yyyy'),'20/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','8','242499','22/08/'||TO_CHAR(SYSDATE,'yyyy'),'13/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','4','837046','05/09/'||TO_CHAR(SYSDATE,'yyyy'),'12/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','6','591809','21/08/'||TO_CHAR(SYSDATE,'yyyy'),'24/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','1','896174','24/08/'||TO_CHAR(SYSDATE,'yyyy'),'14/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','1','271026','17/08/'||TO_CHAR(SYSDATE,'yyyy'),'24/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','758093','19/08/'||TO_CHAR(SYSDATE,'yyyy'),'19/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','8','603439','30/08/'||TO_CHAR(SYSDATE,'yyyy'),'10/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','10','419843','16/08/'||TO_CHAR(SYSDATE,'yyyy'),'04/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','9','772426','30/08/'||TO_CHAR(SYSDATE,'yyyy'),'11/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','7','465701','29/08/'||TO_CHAR(SYSDATE,'yyyy'),'07/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','5','627144','20/08/'||TO_CHAR(SYSDATE,'yyyy'),'01/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','10','656242','29/08/'||TO_CHAR(SYSDATE,'yyyy'),'10/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','10','191822','21/08/'||TO_CHAR(SYSDATE,'yyyy'),'25/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','10','853418','31/08/'||TO_CHAR(SYSDATE,'yyyy'),'15/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','4','560242','19/09/'||TO_CHAR(SYSDATE,'yyyy'),'24/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','7','561343','10/09/'||TO_CHAR(SYSDATE,'yyyy'),'01/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','9','514565','15/09/'||TO_CHAR(SYSDATE,'yyyy'),'22/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','4','751758','27/08/'||TO_CHAR(SYSDATE,'yyyy'),'10/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','8','179534','27/08/'||TO_CHAR(SYSDATE,'yyyy'),'07/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','507848','11/09/'||TO_CHAR(SYSDATE,'yyyy'),'08/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','3','746182','03/09/'||TO_CHAR(SYSDATE,'yyyy'),'11/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','8','227835','08/09/'||TO_CHAR(SYSDATE,'yyyy'),'31/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','577275','21/09/'||TO_CHAR(SYSDATE,'yyyy'),'22/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','10','640213','01/09/'||TO_CHAR(SYSDATE,'yyyy'),'15/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','738559','12/09/'||TO_CHAR(SYSDATE,'yyyy'),'12/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','9','427592','05/09/'||TO_CHAR(SYSDATE,'yyyy'),'25/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','5','357070','31/08/'||TO_CHAR(SYSDATE,'yyyy'),'09/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','5','567659','25/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','317818','20/09/'||TO_CHAR(SYSDATE,'yyyy'),'27/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','6','397653','28/08/'||TO_CHAR(SYSDATE,'yyyy'),'28/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','5','158174','08/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','2','256946','03/09/'||TO_CHAR(SYSDATE,'yyyy'),'29/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','10','663231','21/09/'||TO_CHAR(SYSDATE,'yyyy'),'08/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','9','101589','23/09/'||TO_CHAR(SYSDATE,'yyyy'),'26/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','2','455918','04/09/'||TO_CHAR(SYSDATE,'yyyy'),'24/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','540502','07/09/'||TO_CHAR(SYSDATE,'yyyy'),'02/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','4','546482','25/09/'||TO_CHAR(SYSDATE,'yyyy'),'15/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','4','112325','26/09/'||TO_CHAR(SYSDATE,'yyyy'),'03/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','5','292789','02/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','4','538747','28/09/'||TO_CHAR(SYSDATE,'yyyy'),'26/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','8','626424','23/09/'||TO_CHAR(SYSDATE,'yyyy'),'22/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','4','753757','14/09/'||TO_CHAR(SYSDATE,'yyyy'),'09/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','1','421913','28/09/'||TO_CHAR(SYSDATE,'yyyy'),'02/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','5','276237','10/09/'||TO_CHAR(SYSDATE,'yyyy'),'15/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','7','314359','20/09/'||TO_CHAR(SYSDATE,'yyyy'),'21/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','10','411138','26/09/'||TO_CHAR(SYSDATE,'yyyy'),'16/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','3','315772','13/09/'||TO_CHAR(SYSDATE,'yyyy'),'20/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','4','358892','17/09/'||TO_CHAR(SYSDATE,'yyyy'),'01/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','3','186142','06/09/'||TO_CHAR(SYSDATE,'yyyy'),'16/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','7','358668','12/09/'||TO_CHAR(SYSDATE,'yyyy'),'05/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','1','331436','09/09/'||TO_CHAR(SYSDATE,'yyyy'),'08/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','4','574809','14/09/'||TO_CHAR(SYSDATE,'yyyy'),'21/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','2','812541','07/09/'||TO_CHAR(SYSDATE,'yyyy'),'05/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','8','370277','11/09/'||TO_CHAR(SYSDATE,'yyyy'),'10/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','811376','27/09/'||TO_CHAR(SYSDATE,'yyyy'),'31/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','4','879010','29/09/'||TO_CHAR(SYSDATE,'yyyy'),'04/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','3','759216','02/10/'||TO_CHAR(SYSDATE,'yyyy'),'11/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','8','269376','18/09/'||TO_CHAR(SYSDATE,'yyyy'),'02/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','7','889380','04/10/'||TO_CHAR(SYSDATE,'yyyy'),'26/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','10','655191','02/10/'||TO_CHAR(SYSDATE,'yyyy'),'28/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','3','150474','24/09/'||TO_CHAR(SYSDATE,'yyyy'),'17/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','6','536770','03/10/'||TO_CHAR(SYSDATE,'yyyy'),'23/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','4','163488','24/09/'||TO_CHAR(SYSDATE,'yyyy'),'16/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','5','396442','10/10/'||TO_CHAR(SYSDATE,'yyyy'),'10/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','7','228532','01/10/'||TO_CHAR(SYSDATE,'yyyy'),'16/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','9','842254','13/09/'||TO_CHAR(SYSDATE,'yyyy'),'15/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','712560','08/10/'||TO_CHAR(SYSDATE,'yyyy'),'20/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','3','782340','16/09/'||TO_CHAR(SYSDATE,'yyyy'),'22/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','10','146342','17/09/'||TO_CHAR(SYSDATE,'yyyy'),'20/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','9','432595','15/09/'||TO_CHAR(SYSDATE,'yyyy'),'05/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','2','145248','03/10/'||TO_CHAR(SYSDATE,'yyyy'),'05/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','10','355940','05/10/'||TO_CHAR(SYSDATE,'yyyy'),'25/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','6','118534','18/09/'||TO_CHAR(SYSDATE,'yyyy'),'30/10/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','7','848948','06/10/'||TO_CHAR(SYSDATE,'yyyy'),'30/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','3','876479','27/09/'||TO_CHAR(SYSDATE,'yyyy'),'23/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','8','827988','19/09/'||TO_CHAR(SYSDATE,'yyyy'),'04/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','10','357670','16/09/'||TO_CHAR(SYSDATE,'yyyy'),'04/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','1','114252','30/09/'||TO_CHAR(SYSDATE,'yyyy'),'25/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','2','686345','09/10/'||TO_CHAR(SYSDATE,'yyyy'),'08/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','604222','22/09/'||TO_CHAR(SYSDATE,'yyyy'),'01/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','10','598845','29/09/'||TO_CHAR(SYSDATE,'yyyy'),'25/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','5','378636','18/10/'||TO_CHAR(SYSDATE,'yyyy'),'03/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','1','787883','08/10/'||TO_CHAR(SYSDATE,'yyyy'),'17/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','9','683501','05/10/'||TO_CHAR(SYSDATE,'yyyy'),'29/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','847420','30/09/'||TO_CHAR(SYSDATE,'yyyy'),'23/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','9','391200','11/10/'||TO_CHAR(SYSDATE,'yyyy'),'28/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','2','671717','15/03/'||TO_CHAR(SYSDATE,'yyyy'),'07/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','10','383435','30/03/'||TO_CHAR(SYSDATE,'yyyy'),'08/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','677862','11/04/'||TO_CHAR(SYSDATE,'yyyy'),'13/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','7','438411','25/03/'||TO_CHAR(SYSDATE,'yyyy'),'28/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','9','181659','12/04/'||TO_CHAR(SYSDATE,'yyyy'),'23/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','3','337590','02/04/'||TO_CHAR(SYSDATE,'yyyy'),'19/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','7','567180','23/03/'||TO_CHAR(SYSDATE,'yyyy'),'12/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','8','708196','23/03/'||TO_CHAR(SYSDATE,'yyyy'),'25/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','9','181158','04/04/'||TO_CHAR(SYSDATE,'yyyy'),'31/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','4','236090','28/03/'||TO_CHAR(SYSDATE,'yyyy'),'09/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','8','210122','17/03/'||TO_CHAR(SYSDATE,'yyyy'),'19/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','4','481305','27/03/'||TO_CHAR(SYSDATE,'yyyy'),'05/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','10','815338','29/03/'||TO_CHAR(SYSDATE,'yyyy'),'06/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','7','707302','26/03/'||TO_CHAR(SYSDATE,'yyyy'),'04/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','1','579040','22/03/'||TO_CHAR(SYSDATE,'yyyy'),'29/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','10','407399','05/04/'||TO_CHAR(SYSDATE,'yyyy'),'21/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','890133','21/03/'||TO_CHAR(SYSDATE,'yyyy'),'02/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','6','683050','16/04/'||TO_CHAR(SYSDATE,'yyyy'),'11/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','5','520236','30/03/'||TO_CHAR(SYSDATE,'yyyy'),'05/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','2','400400','12/04/'||TO_CHAR(SYSDATE,'yyyy'),'08/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','1','606863','24/03/'||TO_CHAR(SYSDATE,'yyyy'),'19/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','9','300791','03/04/'||TO_CHAR(SYSDATE,'yyyy'),'29/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','309659','19/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','2','600906','14/04/'||TO_CHAR(SYSDATE,'yyyy'),'24/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','3','124229','26/03/'||TO_CHAR(SYSDATE,'yyyy'),'06/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','7','659407','24/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','9','638735','28/03/'||TO_CHAR(SYSDATE,'yyyy'),'03/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','2','309249','01/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','9','283008','08/04/'||TO_CHAR(SYSDATE,'yyyy'),'24/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','1','844092','21/04/'||TO_CHAR(SYSDATE,'yyyy'),'08/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','1','738823','22/04/'||TO_CHAR(SYSDATE,'yyyy'),'29/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','3','781045','24/04/'||TO_CHAR(SYSDATE,'yyyy'),'15/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','8','790515','17/04/'||TO_CHAR(SYSDATE,'yyyy'),'01/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','6','399081','25/04/'||TO_CHAR(SYSDATE,'yyyy'),'11/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','4','194072','14/04/'||TO_CHAR(SYSDATE,'yyyy'),'14/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','5','807840','19/04/'||TO_CHAR(SYSDATE,'yyyy'),'03/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','10','504259','07/04/'||TO_CHAR(SYSDATE,'yyyy'),'06/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','9','499147','27/04/'||TO_CHAR(SYSDATE,'yyyy'),'19/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','5','509296','13/04/'||TO_CHAR(SYSDATE,'yyyy'),'23/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','2','469896','10/04/'||TO_CHAR(SYSDATE,'yyyy'),'30/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','5','206351','26/04/'||TO_CHAR(SYSDATE,'yyyy'),'29/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','8','683591','15/04/'||TO_CHAR(SYSDATE,'yyyy'),'16/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','5','369731','11/04/'||TO_CHAR(SYSDATE,'yyyy'),'02/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','635959','27/04/'||TO_CHAR(SYSDATE,'yyyy'),'10/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','8','798458','05/05/'||TO_CHAR(SYSDATE,'yyyy'),'27/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','8','583282','04/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','4','224574','23/04/'||TO_CHAR(SYSDATE,'yyyy'),'27/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','2','136543','09/05/'||TO_CHAR(SYSDATE,'yyyy'),'28/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','3','833890','15/04/'||TO_CHAR(SYSDATE,'yyyy'),'14/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','5','269506','11/05/'||TO_CHAR(SYSDATE,'yyyy'),'17/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','2','162936','20/04/'||TO_CHAR(SYSDATE,'yyyy'),'17/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','3','584103','28/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','4','632835','21/04/'||TO_CHAR(SYSDATE,'yyyy'),'18/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','5','779737','30/04/'||TO_CHAR(SYSDATE,'yyyy'),'22/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','3','310562','17/04/'||TO_CHAR(SYSDATE,'yyyy'),'22/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','3','323904','23/04/'||TO_CHAR(SYSDATE,'yyyy'),'14/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','9','571318','03/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','4','850291','15/05/'||TO_CHAR(SYSDATE,'yyyy'),'17/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','6','237697','11/05/'||TO_CHAR(SYSDATE,'yyyy'),'01/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','10','223132','10/05/'||TO_CHAR(SYSDATE,'yyyy'),'26/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','8','164912','26/04/'||TO_CHAR(SYSDATE,'yyyy'),'06/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','10','202366','16/05/'||TO_CHAR(SYSDATE,'yyyy'),'09/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','7','532865','03/05/'||TO_CHAR(SYSDATE,'yyyy'),'02/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','5','102925','21/05/'||TO_CHAR(SYSDATE,'yyyy'),'20/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','10','761862','25/04/'||TO_CHAR(SYSDATE,'yyyy'),'23/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','9','462347','05/05/'||TO_CHAR(SYSDATE,'yyyy'),'19/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','8','356445','01/05/'||TO_CHAR(SYSDATE,'yyyy'),'07/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','3','324238','02/05/'||TO_CHAR(SYSDATE,'yyyy'),'05/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','2','636411','07/05/'||TO_CHAR(SYSDATE,'yyyy'),'14/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','4','731558','08/05/'||TO_CHAR(SYSDATE,'yyyy'),'18/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','1','513304','15/05/'||TO_CHAR(SYSDATE,'yyyy'),'21/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','9','163610','06/05/'||TO_CHAR(SYSDATE,'yyyy'),'20/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','10','723139','30/04/'||TO_CHAR(SYSDATE,'yyyy'),'25/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','3','524024','13/05/'||TO_CHAR(SYSDATE,'yyyy'),'27/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','1','648344','08/05/'||TO_CHAR(SYSDATE,'yyyy'),'01/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','1','442947','18/05/'||TO_CHAR(SYSDATE,'yyyy'),'22/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','1','639295','29/04/'||TO_CHAR(SYSDATE,'yyyy'),'06/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','5','180880','17/05/'||TO_CHAR(SYSDATE,'yyyy'),'09/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','3','276050','06/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','3','766960','14/05/'||TO_CHAR(SYSDATE,'yyyy'),'22/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','10','448653','24/05/'||TO_CHAR(SYSDATE,'yyyy'),'14/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','1','537801','12/05/'||TO_CHAR(SYSDATE,'yyyy'),'29/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','632663','18/05/'||TO_CHAR(SYSDATE,'yyyy'),'09/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','2','806142','22/05/'||TO_CHAR(SYSDATE,'yyyy'),'04/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','9','334334','29/04/'||TO_CHAR(SYSDATE,'yyyy'),'26/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','8','639350','14/05/'||TO_CHAR(SYSDATE,'yyyy'),'14/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','4','326562','16/05/'||TO_CHAR(SYSDATE,'yyyy'),'02/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','4','453981','28/05/'||TO_CHAR(SYSDATE,'yyyy'),'28/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','4','421311','30/05/'||TO_CHAR(SYSDATE,'yyyy'),'10/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','7','824742','10/05/'||TO_CHAR(SYSDATE,'yyyy'),'24/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','5','450707','19/05/'||TO_CHAR(SYSDATE,'yyyy'),'30/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','7','870991','02/05/'||TO_CHAR(SYSDATE,'yyyy'),'10/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','2','794518','25/05/'||TO_CHAR(SYSDATE,'yyyy'),'04/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','5','810260','20/05/'||TO_CHAR(SYSDATE,'yyyy'),'30/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','6','142513','31/05/'||TO_CHAR(SYSDATE,'yyyy'),'10/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','3','723779','29/05/'||TO_CHAR(SYSDATE,'yyyy'),'26/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','5','892923','02/06/'||TO_CHAR(SYSDATE,'yyyy'),'21/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','9','555539','09/05/'||TO_CHAR(SYSDATE,'yyyy'),'29/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','1','600952','07/05/'||TO_CHAR(SYSDATE,'yyyy'),'27/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','7','780723','22/05/'||TO_CHAR(SYSDATE,'yyyy'),'16/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','1','314494','12/05/'||TO_CHAR(SYSDATE,'yyyy'),'11/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','4','246036','21/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','8','448352','07/06/'||TO_CHAR(SYSDATE,'yyyy'),'21/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','1','672433','01/06/'||TO_CHAR(SYSDATE,'yyyy'),'01/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','1','694754','27/05/'||TO_CHAR(SYSDATE,'yyyy'),'01/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','4','411768','29/05/'||TO_CHAR(SYSDATE,'yyyy'),'20/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','4','747461','17/05/'||TO_CHAR(SYSDATE,'yyyy'),'11/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','4','163623','13/05/'||TO_CHAR(SYSDATE,'yyyy'),'05/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','3','439940','27/05/'||TO_CHAR(SYSDATE,'yyyy'),'06/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','3','333807','09/06/'||TO_CHAR(SYSDATE,'yyyy'),'15/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','10','332198','23/05/'||TO_CHAR(SYSDATE,'yyyy'),'14/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','6','456164','06/06/'||TO_CHAR(SYSDATE,'yyyy'),'18/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','1','417941','05/06/'||TO_CHAR(SYSDATE,'yyyy'),'22/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','5','668450','23/05/'||TO_CHAR(SYSDATE,'yyyy'),'14/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','7','652510','30/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','1','202081','31/05/'||TO_CHAR(SYSDATE,'yyyy'),'06/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','1','198469','08/06/'||TO_CHAR(SYSDATE,'yyyy'),'15/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','4','376731','24/05/'||TO_CHAR(SYSDATE,'yyyy'),'05/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','6','723459','04/06/'||TO_CHAR(SYSDATE,'yyyy'),'12/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','6','184475','11/06/'||TO_CHAR(SYSDATE,'yyyy'),'17/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','8','524926','25/05/'||TO_CHAR(SYSDATE,'yyyy'),'20/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','4','794790','12/06/'||TO_CHAR(SYSDATE,'yyyy'),'28/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','3','581635','14/06/'||TO_CHAR(SYSDATE,'yyyy'),'21/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','2','206310','26/05/'||TO_CHAR(SYSDATE,'yyyy'),'23/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','5','813008','19/05/'||TO_CHAR(SYSDATE,'yyyy'),'18/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','10','246231','13/06/'||TO_CHAR(SYSDATE,'yyyy'),'08/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','9','162612','11/06/'||TO_CHAR(SYSDATE,'yyyy'),'14/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','8','757433','20/05/'||TO_CHAR(SYSDATE,'yyyy'),'27/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','7','881210','02/06/'||TO_CHAR(SYSDATE,'yyyy'),'31/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','7','544028','04/06/'||TO_CHAR(SYSDATE,'yyyy'),'29/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','1','588483','09/06/'||TO_CHAR(SYSDATE,'yyyy'),'26/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','1','813253','07/06/'||TO_CHAR(SYSDATE,'yyyy'),'19/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','4','679250','10/06/'||TO_CHAR(SYSDATE,'yyyy'),'08/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','3','839273','10/06/'||TO_CHAR(SYSDATE,'yyyy'),'18/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','5','649763','26/05/'||TO_CHAR(SYSDATE,'yyyy'),'20/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','3','857320','28/05/'||TO_CHAR(SYSDATE,'yyyy'),'25/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','9','315483','18/06/'||TO_CHAR(SYSDATE,'yyyy'),'12/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','563623','21/06/'||TO_CHAR(SYSDATE,'yyyy'),'23/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','382376','03/06/'||TO_CHAR(SYSDATE,'yyyy'),'22/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','7','391567','15/06/'||TO_CHAR(SYSDATE,'yyyy'),'02/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','1','157139','22/06/'||TO_CHAR(SYSDATE,'yyyy'),'16/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','5','131357','12/06/'||TO_CHAR(SYSDATE,'yyyy'),'14/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','5','101108','19/06/'||TO_CHAR(SYSDATE,'yyyy'),'05/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','509925','03/06/'||TO_CHAR(SYSDATE,'yyyy'),'17/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','9','719915','19/06/'||TO_CHAR(SYSDATE,'yyyy'),'30/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','1','378580','05/06/'||TO_CHAR(SYSDATE,'yyyy'),'11/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','4','706794','08/06/'||TO_CHAR(SYSDATE,'yyyy'),'22/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','4','309444','30/06/'||TO_CHAR(SYSDATE,'yyyy'),'21/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','7','772056','01/06/'||TO_CHAR(SYSDATE,'yyyy'),'15/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','4','252010','29/06/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','6','536281','06/06/'||TO_CHAR(SYSDATE,'yyyy'),'04/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','6','334259','13/06/'||TO_CHAR(SYSDATE,'yyyy'),'28/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','10','490381','27/06/'||TO_CHAR(SYSDATE,'yyyy'),'30/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','1','469045','23/06/'||TO_CHAR(SYSDATE,'yyyy'),'08/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','1','308881','24/06/'||TO_CHAR(SYSDATE,'yyyy'),'19/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','7','342306','27/06/'||TO_CHAR(SYSDATE,'yyyy'),'11/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','7','527004','16/06/'||TO_CHAR(SYSDATE,'yyyy'),'10/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','4','445222','23/06/'||TO_CHAR(SYSDATE,'yyyy'),'18/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','9','460439','15/06/'||TO_CHAR(SYSDATE,'yyyy'),'26/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','2','165671','14/06/'||TO_CHAR(SYSDATE,'yyyy'),'12/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','352629','24/06/'||TO_CHAR(SYSDATE,'yyyy'),'27/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','6','100247','25/06/'||TO_CHAR(SYSDATE,'yyyy'),'22/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','10','444969','05/07/'||TO_CHAR(SYSDATE,'yyyy'),'03/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','3','890710','06/07/'||TO_CHAR(SYSDATE,'yyyy'),'03/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','4','259927','28/06/'||TO_CHAR(SYSDATE,'yyyy'),'11/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','7','242906','08/07/'||TO_CHAR(SYSDATE,'yyyy'),'24/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','10','651741','25/06/'||TO_CHAR(SYSDATE,'yyyy'),'19/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','5','481478','29/06/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','4','124437','08/07/'||TO_CHAR(SYSDATE,'yyyy'),'25/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','8','811677','16/06/'||TO_CHAR(SYSDATE,'yyyy'),'30/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','9','794347','17/06/'||TO_CHAR(SYSDATE,'yyyy'),'02/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','3','655349','17/06/'||TO_CHAR(SYSDATE,'yyyy'),'01/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','8','163378','05/07/'||TO_CHAR(SYSDATE,'yyyy'),'13/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','9','619219','09/07/'||TO_CHAR(SYSDATE,'yyyy'),'19/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','1','337320','26/06/'||TO_CHAR(SYSDATE,'yyyy'),'15/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','9','475901','22/06/'||TO_CHAR(SYSDATE,'yyyy'),'30/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','6','282337','01/07/'||TO_CHAR(SYSDATE,'yyyy'),'28/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','7','582159','21/06/'||TO_CHAR(SYSDATE,'yyyy'),'21/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','2','177083','11/07/'||TO_CHAR(SYSDATE,'yyyy'),'15/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','6','566899','04/07/'||TO_CHAR(SYSDATE,'yyyy'),'18/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','10','525265','11/07/'||TO_CHAR(SYSDATE,'yyyy'),'03/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','657137','09/07/'||TO_CHAR(SYSDATE,'yyyy'),'31/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','9','374988','20/06/'||TO_CHAR(SYSDATE,'yyyy'),'22/07/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','8','450737','18/06/'||TO_CHAR(SYSDATE,'yyyy'),'02/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','10','513491','16/07/'||TO_CHAR(SYSDATE,'yyyy'),'02/09/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','7','163624','20/06/'||TO_CHAR(SYSDATE,'yyyy'),'14/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','1','211018','01/07/'||TO_CHAR(SYSDATE,'yyyy'),'23/08/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','6','762144','18/01/'||TO_CHAR(SYSDATE,'yyyy'),'18/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','8','357081','13/01/'||TO_CHAR(SYSDATE,'yyyy'),'07/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','5','541412','15/01/'||TO_CHAR(SYSDATE,'yyyy'),'21/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','4','753757','25/01/'||TO_CHAR(SYSDATE,'yyyy'),'05/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','7','854734','10/01/'||TO_CHAR(SYSDATE,'yyyy'),'03/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','2','373655','06/01/'||TO_CHAR(SYSDATE,'yyyy'),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','9','842254','23/01/'||TO_CHAR(SYSDATE,'yyyy'),'14/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','10','553521','07/01/'||TO_CHAR(SYSDATE,'yyyy'),'02/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','10','596888','24/01/'||TO_CHAR(SYSDATE,'yyyy'),'03/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','1','804165','03/01/'||TO_CHAR(SYSDATE,'yyyy'),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','9','259663','08/01/'||TO_CHAR(SYSDATE,'yyyy'),'09/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','4','241926','25/01/'||TO_CHAR(SYSDATE,'yyyy'),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','6','614724','05/01/'||TO_CHAR(SYSDATE,'yyyy'),'12/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','10','204095','23/01/'||TO_CHAR(SYSDATE,'yyyy'),'02/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','3','127845','04/01/'||TO_CHAR(SYSDATE,'yyyy'),'08/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','9','676347','28/01/'||TO_CHAR(SYSDATE,'yyyy'),'10/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','9','719801','01/02/'||TO_CHAR(SYSDATE,'yyyy'),'28/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','6','834580','05/01/'||TO_CHAR(SYSDATE,'yyyy'),'26/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','5','151445','01/02/'||TO_CHAR(SYSDATE,'yyyy'),'20/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','100244','24/01/'||TO_CHAR(SYSDATE,'yyyy'),'18/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','2','837695','14/01/'||TO_CHAR(SYSDATE,'yyyy'),'20/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','4','560242','04/02/'||TO_CHAR(SYSDATE,'yyyy'),'27/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','4','424580','08/01/'||TO_CHAR(SYSDATE,'yyyy'),'09/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','9','238337','22/01/'||TO_CHAR(SYSDATE,'yyyy'),'05/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','8','269376','02/02/'||TO_CHAR(SYSDATE,'yyyy'),'23/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','3','751505','18/01/'||TO_CHAR(SYSDATE,'yyyy'),'18/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','3','474488','16/01/'||TO_CHAR(SYSDATE,'yyyy'),'07/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','3','819817','26/01/'||TO_CHAR(SYSDATE,'yyyy'),'28/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','10','473839','12/01/'||TO_CHAR(SYSDATE,'yyyy'),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','2','669056','21/01/'||TO_CHAR(SYSDATE,'yyyy'),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','3','490602','27/01/'||TO_CHAR(SYSDATE,'yyyy'),'16/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','9','587268','28/01/'||TO_CHAR(SYSDATE,'yyyy'),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','577275','08/02/'||TO_CHAR(SYSDATE,'yyyy'),'18/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','9','418129','20/01/'||TO_CHAR(SYSDATE,'yyyy'),'19/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','6','212292','05/02/'||TO_CHAR(SYSDATE,'yyyy'),'06/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','532065','10/02/'||TO_CHAR(SYSDATE,'yyyy'),'28/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','10','878506','30/01/'||TO_CHAR(SYSDATE,'yyyy'),'04/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','8','612144','30/01/'||TO_CHAR(SYSDATE,'yyyy'),'14/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','2','754594','08/02/'||TO_CHAR(SYSDATE,'yyyy'),'01/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','9','432595','27/01/'||TO_CHAR(SYSDATE,'yyyy'),'27/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','5','214643','09/02/'||TO_CHAR(SYSDATE,'yyyy'),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','8','872666','17/01/'||TO_CHAR(SYSDATE,'yyyy'),'21/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','6','522973','20/01/'||TO_CHAR(SYSDATE,'yyyy'),'01/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','2','743522','06/02/'||TO_CHAR(SYSDATE,'yyyy'),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','4','358892','31/01/'||TO_CHAR(SYSDATE,'yyyy'),'02/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','9','101589','12/02/'||TO_CHAR(SYSDATE,'yyyy'),'30/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','2','240825','13/02/'||TO_CHAR(SYSDATE,'yyyy'),'01/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','4','109912','05/02/'||TO_CHAR(SYSDATE,'yyyy'),'28/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','1','379984','11/02/'||TO_CHAR(SYSDATE,'yyyy'),'23/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','6','841072','22/01/'||TO_CHAR(SYSDATE,'yyyy'),'24/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','10','839112','02/02/'||TO_CHAR(SYSDATE,'yyyy'),'13/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','1','154628','19/02/'||TO_CHAR(SYSDATE,'yyyy'),'28/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','10','352026','23/02/'||TO_CHAR(SYSDATE,'yyyy'),'23/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','1','188570','12/02/'||TO_CHAR(SYSDATE,'yyyy'),'15/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','604222','10/02/'||TO_CHAR(SYSDATE,'yyyy'),'11/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','7','602983','26/01/'||TO_CHAR(SYSDATE,'yyyy'),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','6','220118','31/01/'||TO_CHAR(SYSDATE,'yyyy'),'03/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','1','575736','15/02/'||TO_CHAR(SYSDATE,'yyyy'),'14/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','10','357670','29/01/'||TO_CHAR(SYSDATE,'yyyy'),'18/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','7','314359','06/02/'||TO_CHAR(SYSDATE,'yyyy'),'02/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','2','232982','15/02/'||TO_CHAR(SYSDATE,'yyyy'),'09/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','8','349088','29/01/'||TO_CHAR(SYSDATE,'yyyy'),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','4','675222','07/02/'||TO_CHAR(SYSDATE,'yyyy'),'27/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','5','569015','21/02/'||TO_CHAR(SYSDATE,'yyyy'),'02/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','6','386909','07/02/'||TO_CHAR(SYSDATE,'yyyy'),'22/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','811376','20/02/'||TO_CHAR(SYSDATE,'yyyy'),'24/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','10','605823','22/02/'||TO_CHAR(SYSDATE,'yyyy'),'13/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','2','574687','01/03/'||TO_CHAR(SYSDATE,'yyyy'),'19/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','4','519477','04/02/'||TO_CHAR(SYSDATE,'yyyy'),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','4','748130','01/03/'||TO_CHAR(SYSDATE,'yyyy'),'08/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','10','735648','03/02/'||TO_CHAR(SYSDATE,'yyyy'),'10/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','10','108125','16/02/'||TO_CHAR(SYSDATE,'yyyy'),'03/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','214841','20/02/'||TO_CHAR(SYSDATE,'yyyy'),'21/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','5','842476','13/02/'||TO_CHAR(SYSDATE,'yyyy'),'01/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','347765','11/02/'||TO_CHAR(SYSDATE,'yyyy'),'12/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','6','213097','03/02/'||TO_CHAR(SYSDATE,'yyyy'),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','6','128434','28/02/'||TO_CHAR(SYSDATE,'yyyy'),'03/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','8','569238','25/02/'||TO_CHAR(SYSDATE,'yyyy'),'12/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','6','593197','17/02/'||TO_CHAR(SYSDATE,'yyyy'),'15/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','4','163488','14/02/'||TO_CHAR(SYSDATE,'yyyy'),'20/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','2','426970','05/03/'||TO_CHAR(SYSDATE,'yyyy'),'19/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','6','308650','09/02/'||TO_CHAR(SYSDATE,'yyyy'),'29/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','5','302171','24/02/'||TO_CHAR(SYSDATE,'yyyy'),'17/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','5','546783','18/02/'||TO_CHAR(SYSDATE,'yyyy'),'31/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','3','321738','06/03/'||TO_CHAR(SYSDATE,'yyyy'),'05/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','10','191736','23/02/'||TO_CHAR(SYSDATE,'yyyy'),'12/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','2','597761','27/02/'||TO_CHAR(SYSDATE,'yyyy'),'26/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','861706','05/03/'||TO_CHAR(SYSDATE,'yyyy'),'16/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','5','270968','03/03/'||TO_CHAR(SYSDATE,'yyyy'),'21/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','3','804914','11/03/'||TO_CHAR(SYSDATE,'yyyy'),'14/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','6','235495','10/03/'||TO_CHAR(SYSDATE,'yyyy'),'16/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','5','224512','14/02/'||TO_CHAR(SYSDATE,'yyyy'),'23/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','3','304586','21/02/'||TO_CHAR(SYSDATE,'yyyy'),'06/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','5','559822','27/02/'||TO_CHAR(SYSDATE,'yyyy'),'20/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','7','750250','07/03/'||TO_CHAR(SYSDATE,'yyyy'),'28/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','5','567659','16/02/'||TO_CHAR(SYSDATE,'yyyy'),'19/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','4','614746','16/03/'||TO_CHAR(SYSDATE,'yyyy'),'06/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','9','228588','26/02/'||TO_CHAR(SYSDATE,'yyyy'),'01/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','1','653032','16/03/'||TO_CHAR(SYSDATE,'yyyy'),'12/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','5','396442','18/03/'||TO_CHAR(SYSDATE,'yyyy'),'25/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','1','701925','17/02/'||TO_CHAR(SYSDATE,'yyyy'),'20/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','5','704759','19/02/'||TO_CHAR(SYSDATE,'yyyy'),'31/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','5','124218','02/03/'||TO_CHAR(SYSDATE,'yyyy'),'19/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','4','112325','18/02/'||TO_CHAR(SYSDATE,'yyyy'),'11/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','4','538747','22/02/'||TO_CHAR(SYSDATE,'yyyy'),'26/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','2','712560','14/03/'||TO_CHAR(SYSDATE,'yyyy'),'03/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','2','849318','20/03/'||TO_CHAR(SYSDATE,'yyyy'),'29/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','6','785394','13/03/'||TO_CHAR(SYSDATE,'yyyy'),'05/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','3','127144','19/03/'||TO_CHAR(SYSDATE,'yyyy'),'18/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','6','635180','10/03/'||TO_CHAR(SYSDATE,'yyyy'),'11/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','4','713705','04/03/'||TO_CHAR(SYSDATE,'yyyy'),'28/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','8','729764','22/03/'||TO_CHAR(SYSDATE,'yyyy'),'01/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','10','598845','24/02/'||TO_CHAR(SYSDATE,'yyyy'),'20/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','5','720550','12/03/'||TO_CHAR(SYSDATE,'yyyy'),'23/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','5','699913','03/03/'||TO_CHAR(SYSDATE,'yyyy'),'14/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','4','642594','07/03/'||TO_CHAR(SYSDATE,'yyyy'),'06/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','179702','14/03/'||TO_CHAR(SYSDATE,'yyyy'),'12/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','6','417240','24/03/'||TO_CHAR(SYSDATE,'yyyy'),'04/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','847420','26/02/'||TO_CHAR(SYSDATE,'yyyy'),'17/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','3','759216','02/03/'||TO_CHAR(SYSDATE,'yyyy'),'26/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','9','391200','20/03/'||TO_CHAR(SYSDATE,'yyyy'),'04/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','6','560953','25/02/'||TO_CHAR(SYSDATE,'yyyy'),'05/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','4','825465','11/03/'||TO_CHAR(SYSDATE,'yyyy'),'01/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','2','769625','25/03/'||TO_CHAR(SYSDATE,'yyyy'),'02/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','8','737744','21/03/'||TO_CHAR(SYSDATE,'yyyy'),'04/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','6','405125','12/03/'||TO_CHAR(SYSDATE,'yyyy'),'21/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','10','217709','27/03/'||TO_CHAR(SYSDATE,'yyyy'),'29/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19100598','1','162303','29/03/'||TO_CHAR(SYSDATE,'yyyy'),'29/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','7','140776','28/02/'||TO_CHAR(SYSDATE,'yyyy'),'18/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','2','145248','04/03/'||TO_CHAR(SYSDATE,'yyyy'),'01/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','10','290565','02/04/'||TO_CHAR(SYSDATE,'yyyy'),'17/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','6','812269','17/03/'||TO_CHAR(SYSDATE,'yyyy'),'24/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','7','889380','06/03/'||TO_CHAR(SYSDATE,'yyyy'),'16/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','10','355940','08/03/'||TO_CHAR(SYSDATE,'yyyy'),'26/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','3','104237','15/03/'||TO_CHAR(SYSDATE,'yyyy'),'25/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','7','337917','31/03/'||TO_CHAR(SYSDATE,'yyyy'),'28/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17817690','5','378636','03/04/'||TO_CHAR(SYSDATE,'yyyy'),'02/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','4','655853','18/03/'||TO_CHAR(SYSDATE,'yyyy'),'21/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','5','513237','05/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','1','285863','09/03/'||TO_CHAR(SYSDATE,'yyyy'),'08/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','4','878717','19/03/'||TO_CHAR(SYSDATE,'yyyy'),'03/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','3','310979','08/03/'||TO_CHAR(SYSDATE,'yyyy'),'26/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','436865','09/03/'||TO_CHAR(SYSDATE,'yyyy'),'16/04/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','6','437353','13/03/'||TO_CHAR(SYSDATE,'yyyy'),'10/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','1','897488','04/04/'||TO_CHAR(SYSDATE,'yyyy'),'07/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','1','658822','06/04/'||TO_CHAR(SYSDATE,'yyyy'),'19/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','1','697968','31/03/'||TO_CHAR(SYSDATE,'yyyy'),'14/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','2','822028','01/04/'||TO_CHAR(SYSDATE,'yyyy'),'22/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','803917','07/04/'||TO_CHAR(SYSDATE,'yyyy'),'01/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','10','547600','08/04/'||TO_CHAR(SYSDATE,'yyyy'),'21/05/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','10','186652','10/04/'||TO_CHAR(SYSDATE,'yyyy'),'09/06/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','1','378580','07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','5','131357','21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','3','655349','31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','9','436173','20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','2','241544','10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','2','165671','25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','6','435874','01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','9','872977','30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','4','679250','17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','7','245030','18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','9','689359','26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','2','696580','28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','8','666193','11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','6','184475','19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','4','445222','12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','6','100247','16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','6','334259','23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','8','450737','02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','3','488689','03/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','2','554616','07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','7','391567','27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','10','600789','19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','8','264616','21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','1','491435','05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','10','539354','17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','1','211018','28/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','3','389188','09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','7','288615','25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','1','157139','10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','5','481478','24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','9','719915','04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','4','259927','22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','9','617883','15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','5','352629','14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','1','804165','02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','10','490381','20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','7','163624','06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','10','444969','05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','7','582159','08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','1','337320','18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','1','194808','26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','3','890710','07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','8','894697','30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','10','543913','29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','8','627918','13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','2','373655','08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','7','352719','27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','8','270391','23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','7','301220','18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','9','642486','04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','10','803426','01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','10','553521','10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','10','473839','20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','10','525265','17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','6','614724','06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','7','657137','13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','138705','30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','2','837695','24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','9','832116','16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','6','468336','14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','5','861126','21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','10','690117','25/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','6','566899','03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','4','124437','11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','9','115804','19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','4','380325','09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','9','259663','12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','8','262119','01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','308215','15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','6','762144','02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','6','841072','10/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','5','210397','23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','10','513491','27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','8','872666','30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','8','357081','22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','3','644176','04/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','10','204095','12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','3','474488','28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','5','404939','15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','2','669056','08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','5','727264','07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','3','874340','09/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','3','567136','26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','9','587268','22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','6','471818','25/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','293579','17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','604528','27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','7','132806','29/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','2','301678','05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','10','596888','14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','9','418129','06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','6','220118','28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','2','682970','03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','3','506167','21/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','5','149562','13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','4','241926','16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','10','735648','03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','9','123152','19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','7','178292','11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','8','612144','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','3','490602','20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','9','719801','30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','7','602983','18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','8','123301','08/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','6','667788','10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','10','839112','01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','6','386909','11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','2','743522','09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','10','441746','12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','1','172607','23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','8','349088','24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','2','754594','13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','10','712586','02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','10','122754','14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','1','532065','17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','9','578398','29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','4','519477','05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','3','690358','16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','6','212292','07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','2','689406','04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','8','365876','24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','5','224512','25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','3','138333','31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','10','616164','06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','7','221338','20/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','9','575300','22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7744083','1','575736','27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','10','419843','28/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','6','593197','01/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','3','172128','18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','5','214643','15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7284220','2','240825','23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18699786','1','885287','02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6269943','10','108125','29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','7','347765','19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','1','188570','21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','1','271026','30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','7','672879','04/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','5','704759','05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','10','605823','11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','5','302171','15/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','3','541640','26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','3','304586','09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','2','526348','06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','214841','07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','10','191736','13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16641880','5','546783','03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','2','535719','16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','7','140776','23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','4','751758','20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','6','560953','17/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','6','497259','14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','10','191822','08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','3','667741','01/01/'||TO_CHAR(SYSDATE,'yyyy'),'17/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','9','228588','19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','8','241832','10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','8','373106','12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'15/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','2','597761','21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','9','772426','26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','5','124218','27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','10','656242','24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','9','832116','10/01/'||TO_CHAR(SYSDATE,'yyyy'),'10/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','5','699913','29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','1','141189','06/01/'||TO_CHAR(SYSDATE,'yyyy'),'21/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','6','468336','09/01/'||TO_CHAR(SYSDATE,'yyyy'),'16/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18352172','9','894697','02/01/'||TO_CHAR(SYSDATE,'yyyy'),'09/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','4','383641','18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/01/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','5','357070','28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17467536','10','255229','12/01/'||TO_CHAR(SYSDATE,'yyyy'),'12/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','3','567136','15/01/'||TO_CHAR(SYSDATE,'yyyy'),'24/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','9','427592','07/01/'||TO_CHAR(SYSDATE,'yyyy'),'26/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','2','812541','11/01/'||TO_CHAR(SYSDATE,'yyyy'),'10/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','8','467425','16/01/'||TO_CHAR(SYSDATE,'yyyy'),'02/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','6','397653','22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','2','533608','09/01/'||TO_CHAR(SYSDATE,'yyyy'),'08/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','5','594247','02/01/'||TO_CHAR(SYSDATE,'yyyy'),'02/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','3','746182','03/01/'||TO_CHAR(SYSDATE,'yyyy'),'04/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','2','574687','25/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','4','320690','30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','5','320016','14/01/'||TO_CHAR(SYSDATE,'yyyy'),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','3','644176','19/01/'||TO_CHAR(SYSDATE,'yyyy'),'14/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','8','227835','13/01/'||TO_CHAR(SYSDATE,'yyyy'),'15/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','9','642486','04/01/'||TO_CHAR(SYSDATE,'yyyy'),'05/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','8','370277','19/01/'||TO_CHAR(SYSDATE,'yyyy'),'09/03/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','5','276237','17/01/'||TO_CHAR(SYSDATE,'yyyy'),'28/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','1','738559','21/01/'||TO_CHAR(SYSDATE,'yyyy'),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','7','301220','11/01/'||TO_CHAR(SYSDATE,'yyyy'),'25/02/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','436865','13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','200135','29/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','6','267026','31/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','7','179702','23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','9','661170','16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','2','671717','25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','5','706407','12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','6','437353','21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','1','653032','27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','2','436675','10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','8','429530','01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','9','688273','06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','2','849318','04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','10','403433','26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','7','674295','20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','7','627341','22/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','2','584588','03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','5','766785','28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','5','381767','18/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','7','707302','16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','6','812269','29/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','368883','24/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','334189','30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','7','109199','17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','1','172429','21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','4','655853','31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','10','383435','24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','4','707499','11/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','8','359140','05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','3','127144','02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','690682','09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','2','769625','14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','8','708196','10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','10','720636','13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','10','534542','19/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','1','606863','12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','8','729764','08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','3','890133','06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','2','309249','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','9','181158','05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','5','109758','07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','3','359482','15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','10','217709','18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','7','863886','25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','3','757163','23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','5','209474','27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','9','638735','20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','1','162303','22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','5','513237','07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','10','504259','11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','2','532338','10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','4','130170','14/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','4','560727','18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','8','456302','02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','3','337590','01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','3','301780','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','3','551335','06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','9','283008','13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','2','304246','22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','1','697968','26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','9','300791','03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','6','743938','16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','2','501222','04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','2','677862','19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','6','610136','28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','7','147241','20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','10','373927','09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','1','706020','12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','7','341075','23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','9','181659','21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','2','469896','17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','4','194072','25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','3','103052','08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','9','673323','26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','4','687028','15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','2','567228','11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','6','683050','29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','8','683591','27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','6','435720','05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','6','270992','03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','10','761862','16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','781045','14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','1','452217','15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','7','374927','02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','5','309659','04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','1','844092','08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','3','323904','12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','2','395188','24/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','3','451936','01/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','3','584103','22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','6','772492','09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','1','164912','18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','1','639295','24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','3','310562','31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','3','692490','30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','1','738823','10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','4','346915','01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18699786','3','633319','17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','3','571318','02/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','2','191191','19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','4','302163','27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','9','499147','20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','6','836101','06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','5','806764','28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','7','871208','07/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','3','649963','29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','10','654559','13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','9','462347','06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','7','638273','11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','4','516077','13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','4','520241','17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','5','779737','26/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','7','824742','16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','7','870991','30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','6','555539','14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','10','405282','07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','6','327824','22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','2','323413','21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','7','700295','25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','5','143904','15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','3','755799','09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','9','745010','23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16874219','4','731558','12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','8','583282','04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','10','147190','05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','2','636411','10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','6','849711','03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','5','170049','27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','4','712467','31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','9','163610','08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','5','180880','30/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','4','282022','29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','1','537801','20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','5','450707','03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','1','341040','19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','3','766960','24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','6','237697','18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','1','130384','21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','3','524024','22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','5','668450','11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','1','513304','26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','2','604431','02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','5','722279','06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','10','202366','28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6275202','6','439265','12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6756480','9','522436','18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','8','524926','15/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','287367','25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','3','160555','14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','5','632663','01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','4','246036','07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','8','288841','24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18390208','6','142513','27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','2','806142','09/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','8','845766','20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','3','857320','21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7168526','8','411738','08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18184240','3','439940','19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','7','881210','01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','4','833502','10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','8','757433','05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','7','449434','04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','6','723459','05/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7744083','9','281161','02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','10','448653','13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18336158','4','411768','23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','3','517379','08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','7','477601','26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','4','421311','25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','3','198469','13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','3','637438','16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','1','761008','22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','6','246867','16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17889317','5','649763','17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18839556','3','333807','15/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7284220','7','506292','28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','1','672433','29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','1','813253','11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','3','278895','30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6269943','10','436431','04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','6','506771','24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18804511','6','536281','09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','8','451037','14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','5','128772','22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','1','529045','06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','854595','12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','7','527004','29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18550492','3','382376','03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','3','109878','23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','3','247121','27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','2','416566','26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','7','647385','31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','1','466289','08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','6','885871','20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','1','587167','19/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','8','278677','22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','5','476640','11/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','2','244554','21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','7','492271','10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','10','216437','03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','9','719263','04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','10','895349','27/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','9','480273','18/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','2','284944','25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','3','103753','06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','3','317328','05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','10','472852','28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','6','340696','24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','9','684876','09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','1','236610','14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','6','393311','03/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','3','485748','02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','9','231408','14/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','1','645714','17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','5','834607','15/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','5','489730','26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','6','148590','01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','3','585322','05/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','6','141224','16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','3','134360','07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','5','462449','11/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','6','741460','23/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','9','855486','12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','10','442863','19/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','10','386546','04/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','6','480355','09/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','9','882987','18/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','2','573084','28/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','1','467388','21/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','8','455327','29/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','374400','08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','10','156720','10/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','9','269639','06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','6','136269','16/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','3','206786','23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','6','365133','25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','10','720063','24/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','10','534798','02/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','9','264920','13/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','7','641415','17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','8','658441','22/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','2','433353','10/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','6','617724','13/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','6','697325','27/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','5','576880','04/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','9','676590','20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','8','498794','30/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','3','628401','31/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','3','484636','15/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','2','848901','03/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','8','469385','06/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','4','728906','07/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','2','561970','08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','7','486435','01/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','1','875484','05/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','4','356526','11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','10','266770','14/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','4','418149','26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','1','679199','09/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','1','454648','28/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','10','542876','16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','9','645906','12/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','8','857928','22/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','6','631015','17/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','9','552949','19/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','7','815183','20/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','7','737943','30/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','4','173142','02/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','3','184016','21/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','4','543518','27/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','8','842170','08/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','9','397550','26/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','4','735379','07/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','8','538838','23/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','4','410330','04/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','2','834103','29/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','2','590455','18/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','3','660899','24/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','2','142091','17/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','8','856746','05/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','6','350822','11/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','3','832365','14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','5','297175','25/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','9','548303','01/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','9','701047','10/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','10','816892','19/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','2','468046','22/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','4','115292','03/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','2','310207','25/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','816109','30/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','4','694749','09/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','1','773341','02/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','1','670337','23/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','4','113269','06/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','2','556940','16/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','8','847501','29/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','10','597704','24/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','5','899473','26/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','4','664179','15/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','3','191101','12/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','5','721790','10/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','9','394853','18/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','10','698378','28/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','461967','14/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','7','314921','14/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','6','391407','05/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','336686','21/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','10','368519','20/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','3','253229','12/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','1','276947','07/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','4','557340','31/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','9','840073','06/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','8','163991','17/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','9','722704','03/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','5','354889','04/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','9','839713','27/05/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','10','813430','18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','1','279466','08/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','5','840583','22/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','7','819848','11/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','2','724525','23/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','4','481728','01/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','2','501056','19/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','9','404420','09/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','744453','01/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','10','219567','02/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','1','504484','13/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','10','837868','07/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','9','657780','24/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','10','773493','10/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','2','354238','29/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','1','525330','20/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','6','473237','26/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','9','422933','15/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','5','159159','18/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','1','704849','28/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','8','813520','16/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','2','158867','21/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','2','263498','05/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','2','628545','27/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','4','732010','30/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','2','143532','08/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','2','899556','09/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','3','652672','05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','1','252001','04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','8','333619','02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','10','152872','07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','7','487661','11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','6','751179','19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','9','564085','18/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','9','231760','15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','1','186399','30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','8','567673','04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','5','895507','06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','10','194767','16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','9','390112','24/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','4','398022','25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','9','106590','09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','9','483142','08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','1','562426','22/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','5','506388','10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','2','812053','21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','2','552691','02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','8','634887','12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','8','177412','01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','5','336882','17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','2','256675','14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','5','215984','13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','6','630883','07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','7','602330','29/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','9','221471','15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','8','636562','20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','10','290520','13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/04/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','5','875929','28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','6','659130','12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','5','137847','04/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','3','598771','17/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','2','626772','25/06/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','4','267123','12/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','4','729255','06/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','6','208769','21/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','8','770313','14/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','7','730954','22/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','9','772749','03/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','5','410868','13/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','3','786645','20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','3','138308','25/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','9','884725','03/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','3','768622','24/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','7','676142','30/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','10','462177','18/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','7','832603','11/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','4','893062','02/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','5','793524','27/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','8','150379','15/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','1','434535','04/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','5','723245','20/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','8','851483','28/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','3','785370','12/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','2','264748','29/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','7','454494','26/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','3','502984','23/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','10','750087','09/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','1','860345','05/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18280709','2','455003','16/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','3','365384','18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','10','233684','07/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','9','117331','10/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','9','226910','15/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','6','225522','31/07/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','7','232172','23/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18421225','8','259086','24/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','6','251135','13/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','10','795945','01/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','9','461423','14/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','8','393959','06/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','8','468245','11/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','8','821800','18/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','3','826026','22/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','7','303525','02/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18829466','7','787934','05/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','1','611059','21/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18505021','4','393538','26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7503210','8','466598','08/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18352172','6','859626','20/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','9','448871','09/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','4','763986','17/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','3','413686','19/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','10','591480','14/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','9','846015','25/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','6','849877','26/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','2','130409','30/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18835559','7','548080','07/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','5','399455','31/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','9','700958','28/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','2','232082','03/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','8','240267','29/08/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16641880','4','236327','16/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','6','798083','01/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16764496','2','138780','22/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','2','495057','06/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18934168','1','669779','11/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19100598','2','139832','13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','4','564560','04/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19435555','1','500105','19/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19567994','7','573215','21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19743237','2','705397','29/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16809546','7','562082','24/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17204426','3','880944','30/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','1','109970','12/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','9','344408','10/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19303268','4','840430','15/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19796164','4','253635','03/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19120175','2','107193','13/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','6','147508','08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19639001','2','511832','25/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','10','118612','20/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17067642','6','687989','28/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19987871','2','871455','07/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16690718','2','544639','18/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19664729','1','876238','27/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','3','681990','26/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19633374','2','686772','21/09/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17264208','1','274986','08/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17233467','8','400901','02/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17604208','2','543946','20/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19816444','2','696413','05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6506702','4','630440','15/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17467536','8','235099','12/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','7','268357','13/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17723898','9','427359','22/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'01/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','2','370275','06/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17393265','5','451917','11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17511566','3','823837','14/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17862825','9','201002','23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('19770211','3','237760','01/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','2','760278','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7034898','9','442844','21/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','9','394177','11/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17237023','7','892339','05/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17817690','9','119758','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','4','485520','24/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6694138','6','675267','17/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','273611','06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17889317','2','751260','01/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','1','120079','19/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','2','269203','03/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7168526','2','320309','23/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18184240','5','497484','08/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6502066','4','693103','29/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','2','814262','16/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17598097','2','688938','18/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6275202','6','719563','26/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'06/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('17814206','8','485883','30/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7744083','3','223849','16/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18336158','4','264523','07/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('7284220','9','661657','12/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6756480','4','108887','02/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18699786','6','600305','21/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6694138','2','493921','31/10/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6269943','9','854935','18/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18390208','6','686963','11/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7503210','9','732932','14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6946767','7','395128','20/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18280709','5','644706','05/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('6057969','5','170314','26/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18505021','9','556518','15/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('7034898','10','334720','06/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18839556','4','897303','29/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18934168','4','207618','02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','10','253585','10/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17067642','2','519029','05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16764496','3','295585','28/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18352172','6','283436','09/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('16874219','4','400374','02/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19303268','8','104099','07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18421225','6','516901','14/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','10','344143','17/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','7','150934','12/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18829466','2','732382','24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16690718','1','443619','24/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16809546','1','409983','30/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19664729','3','489464','17/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('16641880','7','133504','22/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18550492','5','844836','19/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2));
INSERT INTO asesoria VALUES ('18804511','10','478544','23/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19639001','3','667455','16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','6','322591','21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('18835559','4','298398','25/11/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17204426','6','531050','07/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19100598','10','218225','03/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17467536','1','175436','18/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17233467','1','620415','08/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17393265','8','159343','16/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','2','655039','26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19567994','4','126483','10/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17237023','5','623516','11/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','3','634266','24/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','6','634668','28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19120175','2','800703','05/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19435555','10','745766','09/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6506702','3','756332','04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','5','769237','30/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19770211','9','894542','21/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17264208','3','692191','14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6946767','6','812599','09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','3','321738','07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19633374','8','643408','14/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6502066','7','897872','02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19743237','3','830290','19/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19816444','2','436973','26/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','8','744865','14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'26/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19987871','7','394311','28/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17511566','4','713705','03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'06/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17723898','3','310979','11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'07/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17817690','6','235495','15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17862825','4','825465','17/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'12/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17814206','6','405125','19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'28/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('19796164','10','489288','23/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'09/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','6','885516','22/12/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-2),'15/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('6057969','2','861706','05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'19/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17604208','4','642594','09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1),'01/03/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')-1));
INSERT INTO asesoria VALUES ('17598097','3','124229','14/10/'||TO_CHAR(SYSDATE,'yyyy'),'13/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','547270','22/09/'||TO_CHAR(SYSDATE,'yyyy'),'08/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6946767','9','751525','07/10/'||TO_CHAR(SYSDATE,'yyyy'),'28/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','5','720550','07/10/'||TO_CHAR(SYSDATE,'yyyy'),'02/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','1','579040','12/10/'||TO_CHAR(SYSDATE,'yyyy'),'03/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16690718','7','345134','11/10/'||TO_CHAR(SYSDATE,'yyyy'),'15/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','4','614746','09/10/'||TO_CHAR(SYSDATE,'yyyy'),'09/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','9','722901','10/10/'||TO_CHAR(SYSDATE,'yyyy'),'09/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19743237','10','725170','22/10/'||TO_CHAR(SYSDATE,'yyyy'),'02/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','5','437529','13/10/'||TO_CHAR(SYSDATE,'yyyy'),'28/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16874219','1','197966','19/10/'||TO_CHAR(SYSDATE,'yyyy'),'23/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','6','635180','06/10/'||TO_CHAR(SYSDATE,'yyyy'),'24/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17233467','10','276011','25/10/'||TO_CHAR(SYSDATE,'yyyy'),'13/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','4','236090','15/10/'||TO_CHAR(SYSDATE,'yyyy'),'03/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','10','407399','19/10/'||TO_CHAR(SYSDATE,'yyyy'),'07/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','9','583475','04/10/'||TO_CHAR(SYSDATE,'yyyy'),'16/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','6','128434','01/10/'||TO_CHAR(SYSDATE,'yyyy'),'19/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','9','803917','20/10/'||TO_CHAR(SYSDATE,'yyyy'),'18/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17889317','2','259921','21/10/'||TO_CHAR(SYSDATE,'yyyy'),'27/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19796164','9','167257','26/10/'||TO_CHAR(SYSDATE,'yyyy'),'07/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','4','236899','01/11/'||TO_CHAR(SYSDATE,'yyyy'),'07/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','2','822028','17/10/'||TO_CHAR(SYSDATE,'yyyy'),'10/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','4','224574','28/10/'||TO_CHAR(SYSDATE,'yyyy'),'20/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','4','720225','12/10/'||TO_CHAR(SYSDATE,'yyyy'),'11/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','6','399081','29/10/'||TO_CHAR(SYSDATE,'yyyy'),'18/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','2','665856','18/10/'||TO_CHAR(SYSDATE,'yyyy'),'02/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17723898','5','520236','16/10/'||TO_CHAR(SYSDATE,'yyyy'),'19/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19664729','2','841966','20/10/'||TO_CHAR(SYSDATE,'yyyy'),'11/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','6','417240','13/10/'||TO_CHAR(SYSDATE,'yyyy'),'12/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19987871','9','670413','30/10/'||TO_CHAR(SYSDATE,'yyyy'),'03/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','7','307798','14/10/'||TO_CHAR(SYSDATE,'yyyy'),'15/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16764496','9','364880','15/10/'||TO_CHAR(SYSDATE,'yyyy'),'12/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18829466','7','532865','02/11/'||TO_CHAR(SYSDATE,'yyyy'),'25/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18839556','1','600952','04/11/'||TO_CHAR(SYSDATE,'yyyy'),'25/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17204426','5','550553','23/10/'||TO_CHAR(SYSDATE,'yyyy'),'24/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18804511','8','356445','01/11/'||TO_CHAR(SYSDATE,'yyyy'),'05/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','10','394610','16/10/'||TO_CHAR(SYSDATE,'yyyy'),'05/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','10','676992','28/10/'||TO_CHAR(SYSDATE,'yyyy'),'01/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('16809546','2','518265','17/10/'||TO_CHAR(SYSDATE,'yyyy'),'20/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17067642','7','399849','21/10/'||TO_CHAR(SYSDATE,'yyyy'),'19/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17393265','3','246878','02/11/'||TO_CHAR(SYSDATE,'yyyy'),'20/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19633374','5','102925','11/11/'||TO_CHAR(SYSDATE,'yyyy'),'27/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18550492','3','635959','30/10/'||TO_CHAR(SYSDATE,'yyyy'),'01/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18835559','8','798458','03/11/'||TO_CHAR(SYSDATE,'yyyy'),'02/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','3','337932','11/11/'||TO_CHAR(SYSDATE,'yyyy'),'30/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17264208','6','610225','31/10/'||TO_CHAR(SYSDATE,'yyyy'),'09/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18184240','5','369731','22/10/'||TO_CHAR(SYSDATE,'yyyy'),'27/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18280709','5','509296','23/10/'||TO_CHAR(SYSDATE,'yyyy'),'28/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19567994','5','813008','10/11/'||TO_CHAR(SYSDATE,'yyyy'),'23/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','6','573091','24/10/'||TO_CHAR(SYSDATE,'yyyy'),'10/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17511566','2','682752','06/11/'||TO_CHAR(SYSDATE,'yyyy'),'01/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19796164','1','202081','16/11/'||TO_CHAR(SYSDATE,'yyyy'),'22/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','7','430093','05/11/'||TO_CHAR(SYSDATE,'yyyy'),'19/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17237023','8','707125','27/10/'||TO_CHAR(SYSDATE,'yyyy'),'30/11/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17604208','9','305223','12/11/'||TO_CHAR(SYSDATE,'yyyy'),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19100598','5','269506','06/11/'||TO_CHAR(SYSDATE,'yyyy'),'10/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6506702','3','768493','07/11/'||TO_CHAR(SYSDATE,'yyyy'),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17467536','4','826563','04/11/'||TO_CHAR(SYSDATE,'yyyy'),'10/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19120175','4','163623','07/11/'||TO_CHAR(SYSDATE,'yyyy'),'31/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','7','318437','03/11/'||TO_CHAR(SYSDATE,'yyyy'),'21/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18336158','3','833890','24/10/'||TO_CHAR(SYSDATE,'yyyy'),'02/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6057969','7','591927','17/11/'||TO_CHAR(SYSDATE,'yyyy'),'27/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19816444','5','892923','17/11/'||TO_CHAR(SYSDATE,'yyyy'),'20/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','7','723077','16/11/'||TO_CHAR(SYSDATE,'yyyy'),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18352172','8','790515','25/10/'||TO_CHAR(SYSDATE,'yyyy'),'10/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18390208','5','807840','26/10/'||TO_CHAR(SYSDATE,'yyyy'),'23/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18421225','4','632835','27/10/'||TO_CHAR(SYSDATE,'yyyy'),'18/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17598097','1','610178','10/11/'||TO_CHAR(SYSDATE,'yyyy'),'12/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19770211','3','723779','15/11/'||TO_CHAR(SYSDATE,'yyyy'),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','6','456164','19/11/'||TO_CHAR(SYSDATE,'yyyy'),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18699786','9','334334','31/10/'||TO_CHAR(SYSDATE,'yyyy'),'26/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','4','706794','20/11/'||TO_CHAR(SYSDATE,'yyyy'),'15/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19743237','1','694754','14/11/'||TO_CHAR(SYSDATE,'yyyy'),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7168526','9','374988','26/11/'||TO_CHAR(SYSDATE,'yyyy'),'09/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','6','550690','29/10/'||TO_CHAR(SYSDATE,'yyyy'),'12/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17862825','7','272672','20/11/'||TO_CHAR(SYSDATE,'yyyy'),'31/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7168526','9','636658','15/11/'||TO_CHAR(SYSDATE,'yyyy'),'03/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6275202','1','101064','19/11/'||TO_CHAR(SYSDATE,'yyyy'),'19/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6756480','3','591577','25/11/'||TO_CHAR(SYSDATE,'yyyy'),'08/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17817690','6','152947','18/11/'||TO_CHAR(SYSDATE,'yyyy'),'18/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18934168','2','136543','05/11/'||TO_CHAR(SYSDATE,'yyyy'),'04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6502066','3','839273','21/11/'||TO_CHAR(SYSDATE,'yyyy'),'05/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','9','475901','27/11/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7034898','2','595476','13/11/'||TO_CHAR(SYSDATE,'yyyy'),'26/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('17814206','3','374859','22/11/'||TO_CHAR(SYSDATE,'yyyy'),'28/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19303268','4','850291','08/11/'||TO_CHAR(SYSDATE,'yyyy'),'12/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19639001','10','332198','12/11/'||TO_CHAR(SYSDATE,'yyyy'),'23/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6502066','2','153052','21/11/'||TO_CHAR(SYSDATE,'yyyy'),'25/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','4','720049','09/11/'||TO_CHAR(SYSDATE,'yyyy'),'30/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('19435555','4','747461','09/11/'||TO_CHAR(SYSDATE,'yyyy'),'30/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6275202','1','308881','28/11/'||TO_CHAR(SYSDATE,'yyyy'),'31/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7034898','7','486988','03/12/'||TO_CHAR(SYSDATE,'yyyy'),'26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18184240','7','586575','04/12/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18336158','9','342602','30/11/'||TO_CHAR(SYSDATE,'yyyy'),'14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7034898','9','315483','25/11/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18184240','10','313399','01/12/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','4','727183','08/11/'||TO_CHAR(SYSDATE,'yyyy'),'19/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('7503210','5','118532','07/12/'||TO_CHAR(SYSDATE,'yyyy'),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17723898','9','416150','14/11/'||TO_CHAR(SYSDATE,'yyyy'),'28/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('6694138','10','855167','30/11/'||TO_CHAR(SYSDATE,'yyyy'),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6694138','3','243608','23/11/'||TO_CHAR(SYSDATE,'yyyy'),'11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7503210','3','787834','07/12/'||TO_CHAR(SYSDATE,'yyyy'),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19664729','2','794518','13/11/'||TO_CHAR(SYSDATE,'yyyy'),'26/12/'||TO_CHAR(SYSDATE,'yyyy'));
INSERT INTO asesoria VALUES ('18505021','6','685067','08/12/'||TO_CHAR(SYSDATE,'yyyy'),'27/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7284220','7','826896','06/12/'||TO_CHAR(SYSDATE,'yyyy'),'07/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6269943','5','750988','11/12/'||TO_CHAR(SYSDATE,'yyyy'),'14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','1','517439','13/12/'||TO_CHAR(SYSDATE,'yyyy'),'31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','5','728883','03/12/'||TO_CHAR(SYSDATE,'yyyy'),'23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','7','242906','05/12/'||TO_CHAR(SYSDATE,'yyyy'),'12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6756480','4','309444','01/12/'||TO_CHAR(SYSDATE,'yyyy'),'28/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18421225','3','148858','06/12/'||TO_CHAR(SYSDATE,'yyyy'),'26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18835559','7','560436','20/12/'||TO_CHAR(SYSDATE,'yyyy'),'03/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','8','811677','24/11/'||TO_CHAR(SYSDATE,'yyyy'),'10/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','5','153403','02/12/'||TO_CHAR(SYSDATE,'yyyy'),'14/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17889317','2','115246','24/11/'||TO_CHAR(SYSDATE,'yyyy'),'06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','7','847317','19/12/'||TO_CHAR(SYSDATE,'yyyy'),'10/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18280709','8','387378','28/11/'||TO_CHAR(SYSDATE,'yyyy'),'12/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18390208','10','251505','04/12/'||TO_CHAR(SYSDATE,'yyyy'),'06/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6502066','10','528445','29/11/'||TO_CHAR(SYSDATE,'yyyy'),'23/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7284220','8','854400','05/12/'||TO_CHAR(SYSDATE,'yyyy'),'30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7034898','9','398562','29/11/'||TO_CHAR(SYSDATE,'yyyy'),'04/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7744083','8','840866','09/12/'||TO_CHAR(SYSDATE,'yyyy'),'02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18184240','4','682762','26/11/'||TO_CHAR(SYSDATE,'yyyy'),'11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('7744083','10','627033','08/12/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17233467','10','195404','19/12/'||TO_CHAR(SYSDATE,'yyyy'),'08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18352172','10','184546','02/12/'||TO_CHAR(SYSDATE,'yyyy'),'16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17604208','4','679189','28/12/'||TO_CHAR(SYSDATE,'yyyy'),'07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18550492','5','882063','12/12/'||TO_CHAR(SYSDATE,'yyyy'),'11/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18699786','4','358314','14/12/'||TO_CHAR(SYSDATE,'yyyy'),'31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17067642','5','344996','17/12/'||TO_CHAR(SYSDATE,'yyyy'),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17204426','10','297059','18/12/'||TO_CHAR(SYSDATE,'yyyy'),'14/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17237023','2','620624','20/12/'||TO_CHAR(SYSDATE,'yyyy'),'26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','7','204949','21/12/'||TO_CHAR(SYSDATE,'yyyy'),'16/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6057969','2','758093','26/12/'||TO_CHAR(SYSDATE,'yyyy'),'31/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16809546','8','336541','23/12/'||TO_CHAR(SYSDATE,'yyyy'),'20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16641880','10','580135','15/12/'||TO_CHAR(SYSDATE,'yyyy'),'19/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','8','628346','10/12/'||TO_CHAR(SYSDATE,'yyyy'),'07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16874219','6','880729','16/12/'||TO_CHAR(SYSDATE,'yyyy'),'20/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17723898','3','895835','29/12/'||TO_CHAR(SYSDATE,'yyyy'),'04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16764496','2','341133','21/12/'||TO_CHAR(SYSDATE,'yyyy'),'07/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16690718','3','777169','12/12/'||TO_CHAR(SYSDATE,'yyyy'),'30/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18550492','1','725588','10/12/'||TO_CHAR(SYSDATE,'yyyy'),'22/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('6946767','7','549773','13/12/'||TO_CHAR(SYSDATE,'yyyy'),'16/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18804511','9','611766','16/12/'||TO_CHAR(SYSDATE,'yyyy'),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18934168','2','460783','24/12/'||TO_CHAR(SYSDATE,'yyyy'),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16809546','6','415607','15/12/'||TO_CHAR(SYSDATE,'yyyy'),'26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17393265','3','365285','23/12/'||TO_CHAR(SYSDATE,'yyyy'),'02/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16641880','10','565417','11/12/'||TO_CHAR(SYSDATE,'yyyy'),'13/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17467536','3','261116','24/12/'||TO_CHAR(SYSDATE,'yyyy'),'05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17264208','7','600815','22/12/'||TO_CHAR(SYSDATE,'yyyy'),'20/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16690718','6','113842','17/12/'||TO_CHAR(SYSDATE,'yyyy'),'25/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16764496','10','574919','14/12/'||TO_CHAR(SYSDATE,'yyyy'),'01/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17814206','8','179534','30/12/'||TO_CHAR(SYSDATE,'yyyy'),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17817690','7','465701','31/12/'||TO_CHAR(SYSDATE,'yyyy'),'21/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18839556','10','352036','22/12/'||TO_CHAR(SYSDATE,'yyyy'),'21/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('18829466','7','399835','18/12/'||TO_CHAR(SYSDATE,'yyyy'),'08/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17511566','10','241079','25/12/'||TO_CHAR(SYSDATE,'yyyy'),'05/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19100598','5','426621','26/12/'||TO_CHAR(SYSDATE,'yyyy'),'13/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19120175','7','797682','28/12/'||TO_CHAR(SYSDATE,'yyyy'),'12/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17067642','9','104634','27/12/'||TO_CHAR(SYSDATE,'yyyy'),'04/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('16874219','1','243244','25/12/'||TO_CHAR(SYSDATE,'yyyy'),'17/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('19303268','6','848417','30/12/'||TO_CHAR(SYSDATE,'yyyy'),'24/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17204426','9','276391','29/12/'||TO_CHAR(SYSDATE,'yyyy'),'25/02/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
INSERT INTO asesoria VALUES ('17598097','6','591809','27/12/'||TO_CHAR(SYSDATE,'yyyy'),'26/01/'||TO_CHAR(TO_CHAR(SYSDATE,'yyyy')+1));
COMMIT;