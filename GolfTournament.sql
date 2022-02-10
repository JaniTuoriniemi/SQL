drop database if exists GolfTournament;
create database Golftournament;
use GolfTournament;
create table Spelare
(PrsnNr char(11),
Namn varchar(255),
Ålder Int,
Tävling varchar(255),
Nr varchar(255),
initialer varchar(255),
primary key(PrsnNr))engine InnoDB;

create table Jacka
(PrsnNr char(11),
 initialer varchar(255),
Storlek varchar(255),
Material varchar(255),
primary key(initialer),

Foreign key (PrsnNr) REFERENCES Spelare (PrsnNr))engine InnoDB;

create table Konstruktion
(SerieNr varchar(255),
Hårdhet varchar(255),
primary key(SerieNr))engine InnoDB;

create table Klubba
(PrsnNr char(11),
SerieNr varchar(255),
Material varchar(255),
Nr varchar(255),
primary key(Nr),
Foreign key (PrsnNr) REFERENCES Spelare (PrsnNr),
Foreign key (SerieNr) REFERENCES Konstruktion (SerieNr)
)engine InnoDB;

create table Tävling
( PrsnNr char(11),
Datum Date,
Tävlingsnamn varchar(255),
Foreign key (PrsnNr) REFERENCES Spelare (PrsnNr),
primary key(Tävlingsnamn))engine InnoDB;

create table Regn
(Typ varchar(255),
Vindstyrka varchar(255),
primary key(Typ))engine InnoDB;

create table Delta
(PrsnNr char(11),
Tävlingsnamn varchar(255),
Foreign key (Tävlingsnamn) REFERENCES Tävling (Tävlingsnamn),
Foreign key (PrsnNr) REFERENCES Spelare (PrsnNr),
Id int,
primary key(Id))engine InnoDB;

create table Har
(Typ varchar(255),
Tävlingsnamn varchar(255),
Foreign key (Tävlingsnamn) REFERENCES Tävling (Tävlingsnamn),
Foreign key (Typ) REFERENCES Regn (Typ),
Tidpunkt  Time,
primary key(Tidpunkt))engine InnoDB;

INSERT INTO Spelare (Namn, PrsnNr, Ålder, Tävling, initialer)
VALUES ('Johan Andersson', '970125-1234', '25', 'Big Golf Cup Skövde', ('GT''FT') );

INSERT INTO Jacka( Material,initialer,PrsnNr) 
VALUES ('Gore Tex','GT','970125-1234');
 
INSERT INTO Jacka( Material,initialer,PrsnNr) 
VALUES ('Fleece','FL','970125-1234');

INSERT INTO Spelare (Namn, PrsnNr, Ålder, Tävling, Nr)
VALUES ('Niclas Jansson', '900101-4321', '32', 'Big Golf Cup Skövde', '1');

INSERT INTO Spelare (Namn, PrsnNr, Ålder, Tävling, Nr)
VALUES ('Annika Persson', '200102-1423', '22', 'Big Golf Cup Skövde', '2');

INSERT INTO Konstruktion (Hårdhet, SerieNr)
VALUES ('10','1');  

INSERT INTO Klubba (Material, SerieNr,Nr,PrsnNr)
VALUES ( 'Trä','1','1','900101-4321' );

INSERT INTO Konstruktion (Hårdhet, SerieNr)
VALUES ('5','2');  

INSERT INTO Klubba (Material, SerieNr,Nr,PrsnNr)
VALUES ( 'Trä','2','2','200102-1423' );

INSERT INTO Tävling (TävlingsNamn, Datum)
VALUES ('Big Golf Cup Skövde', '2021-06-10');

INSERT INTO Regn (typ, vindstyrka)
VALUES ('Hagel',  '10');

INSERT INTO Delta (TävlingsNamn, PrsnNr, Id)
VALUES ('Big Golf Cup Skövde', '970125-1234', '1');

INSERT INTO Delta (TävlingsNamn, PrsnNr, Id)
VALUES ('Big Golf Cup Skövde', '900101-4321', '2');

INSERT INTO Delta (TävlingsNamn, PrsnNr, Id)
VALUES ('Big Golf Cup Skövde', '200102-1423', '3');

INSERT INTO Har (TävlingsNamn, Typ, Tidpunkt)
VALUES ('Big Golf Cup Skövde', 'Hagel', '12:00:00');

SELECT Ålder
FROM Spelare
WHERE Namn= 'Johan Andersson';

SELECT Datum
FROM Tävling
WHERE Tävlingsnamn= 'Big Golf Cup Skövde';

SELECT Material
FROM Klubba
WHERE PrsnNr=(SELECT PrsnNr FROM Spelare WHERE Namn='Johan Andersson');


SELECT initialer
FROM Jacka
WHERE PrsnNr= (SELECT PrsnNr FROM Spelare WHERE Namn='Johan Andersson');

SELECT PrsnNr
FROM Delta
WHERE Tävlingsnamn= 'Big Golf Cup Skövde';

SELECT Vindstyrka
FROM Regn
where (select Tidpunkt from Har where Tävlingsnamn= 'Big Golf Cup Skövde');

SELECT PrsnNr
FROM Spelare
WHERE Ålder<30;

DELETE FROM Jacka
WHERE PrsnNr=(select PrsnNr FROM Spelare Where Namn= 'Johan Andersson');

SET SQL_SAFE_UPDATES=0;
 UPDATE Spelare
SET initialer = null
WHERE Namn= 'Johan Andersson';  

DELETE FROM Spelare
WHERE  Namn= 'Nicklas Jansson';

SET SQL_SAFE_UPDATES=1;

SELECT AVG(Ålder)
FROM Spelare;



