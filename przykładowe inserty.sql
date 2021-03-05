/* 
plik restore.sql tworzy tabele lecz bez wpisanych wartości przykładowych insertów

CREATE TABLE grupa(
id_grupy SERIAL NOT NULL PRIMARY KEY,
nazwa_grupy varchar(30)
);

CREATE TABLE uzytkownik(
id_osoby SERIAL NOT NULL PRIMARY KEY,
osoba varchar(50),
id_grupy integer,
CONSTRAINT FKgrupa FOREIGN KEY(id_grupy) REFERENCES grupa(id_grupy)
); */

INSERT INTO uzytkownik(osoba)
VALUES ('Jakub Kowalczyk');
INSERT INTO uzytkownik(osoba)
VALUES ('Maciej Cieślak');
INSERT INTO uzytkownik(osoba)
VALUES ('Edward Mrówka');
INSERT INTO uzytkownik(osoba)
VALUES ('Jan Poręba');
INSERT INTO uzytkownik(osoba)
VALUES ('Kamil Nowak');
INSERT INTO uzytkownik(osoba)
VALUES ('Marzena Rogalik');
INSERT INTO uzytkownik(osoba)
VALUES ('Katarzyna Cabaj');


INSERT INTO grupa(nazwa_grupy)
VALUES('informatyka');
INSERT INTO grupa(nazwa_grupy)
VALUES('informatyka i ekonometria');



/* CREATE TABLE wiadomosc(
id_wiadomosci SERIAL NOT NULL PRIMARY KEY,
tresc varchar(200),
id_grupy integer,
id_osoby integer,
CONSTRAINT FKgrupa_m FOREIGN KEY(id_grupy) REFERENCES grupa(id_grupy),
CONSTRAINT FKosoba_m FOREIGN KEY(id_osoby) REFERENCES uzytkownik(id_osoby)
); */