/*
Created: 24.11.2020
Modified: 28.11.2020
Model: Model Logiczny
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE pracaseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE firmyseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE pojazdyseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE administracjeseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE pracownicyseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE blokiseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE mieszkaniaseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE lokatorzyseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE rachunkiseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE adresyseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE stanowiskaseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE wynagordzenia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE uprawnieniaseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE szkoleniaseq
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Spoldzielnie

CREATE TABLE Spoldzielnie(
  ID_Spoldzielni Integer NOT NULL,
  Nazwa Varchar2(50 ) NOT NULL,
  Data_zalozenia Date NOT NULL,
  Bud¿et Number(10,2),
  ID_Adresu Integer NOT NULL
)
/

-- Create indexes for table Spoldzielnie

CREATE INDEX Spoldzielnia_ma_adres ON Spoldzielnie (ID_Adresu)
/

-- Add keys for table Spoldzielnie

ALTER TABLE Spoldzielnie ADD CONSTRAINT Spoldzienia_PK PRIMARY KEY (ID_Spoldzielni)
/

-- Table and Columns comments section

COMMENT ON COLUMN Spoldzielnie.Bud¿et IS 'Bud¿et na prace'
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  ID_Pracownika Integer NOT NULL,
  Imie Varchar2(30 ) NOT NULL,
  Nazwisko Varchar2(40 ) NOT NULL,
  Plec Char(1 ) NOT NULL
        CHECK (Plec IN ('M','K')),
  Data_urodzenia Date NOT NULL,
  PESEL Char(11 ),
  Nr_telefonu Varchar2(12 ),
  Email Varchar2(50 ),
  Data_rozpoczenia_pracy Date NOT NULL,
  Ubezpieczenie Char(1 ) NOT NULL
        CONSTRAINT CheckConstraintA1 CHECK (Ubezpieczenie IN ('T','N'))
        CHECK (Ubezpieczenie IN ('T','N')),
  Data_ostatniego_badania Date NOT NULL,
  Nr_konta Char(26 ),
  ID_Spoldzielni Integer NOT NULL,
  ID_Stanowiska Integer NOT NULL,
  ID_Adresu Integer NOT NULL
)
/

-- Create indexes for table Pracownicy

CREATE INDEX IX_Zatrudnia ON Pracownicy (ID_Spoldzielni)
/

CREATE INDEX IX_Relationship5 ON Pracownicy (ID_Stanowiska)
/

CREATE INDEX IX_Relationship1 ON Pracownicy (ID_Adresu)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_PK PRIMARY KEY (ID_Pracownika)
/

-- Table Administracje

CREATE TABLE Administracje(
  ID_Administracji Integer NOT NULL,
  Nazwa Varchar2(100 ) NOT NULL,
  ID_Spoldzielni Integer NOT NULL,
  ID_Adresu Integer NOT NULL
)
/

-- Create indexes for table Administracje

CREATE INDEX IX_Sprawuje_kontrole_nad ON Administracje (ID_Spoldzielni)
/

CREATE INDEX IX_Relationship3 ON Administracje (ID_Adresu)
/

-- Add keys for table Administracje

ALTER TABLE Administracje ADD CONSTRAINT Administracja_PK PRIMARY KEY (ID_Administracji)
/

-- Table Bloki

CREATE TABLE Bloki(
  ID_Bloku Integer NOT NULL,
  Ilosc_mieszkan Integer NOT NULL,
  Winda Char(1 ) NOT NULL
        CHECK (Winda IN ('T','N')),
  ID_Administracji Integer NOT NULL,
  ID_Adresu Integer NOT NULL,
  ID_Spoldzielni Integer NOT NULL
)
/

-- Create indexes for table Bloki

CREATE INDEX IX_Nadzoruje ON Bloki (ID_Administracji)
/

CREATE INDEX IX_Relationship4 ON Bloki (ID_Adresu)
/

CREATE INDEX IX_Relationship11 ON Bloki (ID_Spoldzielni)
/

-- Add keys for table Bloki

ALTER TABLE Bloki ADD CONSTRAINT Blok_PK PRIMARY KEY (ID_Bloku)
/

-- Table Mieszkania

CREATE TABLE Mieszkania(
  ID_Mieszkania Integer NOT NULL,
  Powierzchnia Float(1) NOT NULL,
  Nr_konta Char(26 ),
  ID_Bloku Integer NOT NULL
)
/

-- Create indexes for table Mieszkania

CREATE INDEX IX_Zawiera ON Mieszkania (ID_Bloku)
/

-- Add keys for table Mieszkania

ALTER TABLE Mieszkania ADD CONSTRAINT Mieszkanie_PK PRIMARY KEY (ID_Mieszkania)
/

-- Table Rachunki

CREATE TABLE Rachunki(
  ID_Rachunku Integer NOT NULL,
  Prad Number(6,2) NOT NULL,
  Gaz Number(6,2) NOT NULL,
  Woda Number(6,2) NOT NULL,
  Smieci Number(6,2) NOT NULL,
  Eksploatacja Number(6,2) NOT NULL,
  Ogrzewanie Number(6,2) NOT NULL,
  Fundusz_remontowy Number(6,2) NOT NULL,
  Winda Number(6,2),
  Oplacony Char(1 ) NOT NULL
        CONSTRAINT CheckConstraintOplacony CHECK (Oplacony IN ('T','N'))
        CHECK (Oplacony IN ('T','N')),
  ID_Mieszkania Integer NOT NULL,
  ID_Spoldzielni Integer NOT NULL
)
/

-- Create indexes for table Rachunki

CREATE INDEX IX_Placi ON Rachunki (ID_Mieszkania)
/

CREATE INDEX IX_Otrzymuje ON Rachunki (ID_Spoldzielni)
/

-- Add keys for table Rachunki

ALTER TABLE Rachunki ADD CONSTRAINT Rachunek_PK PRIMARY KEY (ID_Rachunku)
/

-- Table Firmy_zewnetrzne

CREATE TABLE Firmy_zewnetrzne(
  ID_Firmy Integer NOT NULL,
  Nazwa Varchar2(40 ) NOT NULL,
  nr_telefonu Varchar2(12 ),
  Email Varchar2(50 ),
  Usluga Varchar2(100 ) NOT NULL,
  Nr_konta Char(26 ) NOT NULL,
  ID_Spoldzielni Integer NOT NULL,
  ID_Adresu Integer NOT NULL
)
/

-- Create indexes for table Firmy_zewnetrzne

CREATE INDEX IX_Oplaca ON Firmy_zewnetrzne (ID_Spoldzielni)
/

CREATE INDEX Firma_ma_adres ON Firmy_zewnetrzne (ID_Adresu)
/

-- Add keys for table Firmy_zewnetrzne

ALTER TABLE Firmy_zewnetrzne ADD CONSTRAINT Frimy_PK PRIMARY KEY (ID_Firmy)
/

-- Table Prace

CREATE TABLE Prace(
  ID_Pracy Integer NOT NULL,
  Nazwa_pracy Varchar2(30 ) NOT NULL,
  Koszt Float(2) NOT NULL,
  Miesiac_realizacji Varchar2(10 )
        CONSTRAINT CheckConstraintR CHECK (Miesiac_realizacji IN ('Styczen','Luty','Marzec','Kwiecien','Maj','Czerwiec','Lipiec','Sierpien','Wrzesien','Pazdziernik','Listopad','Grudzien'))
        CHECK (Miesiac_realizacji IN ('Styczen','Luty','Marzec','Kwiecien','Maj','Czerwiec','Lipiec','Sierpien','Wrzesien','Pazdziernik','Listopad','Grudzien')),
  Opis Varchar2(500 ) NOT NULL,
  ID_Spoldzielni Integer NOT NULL,
  ID_Administracji Integer NOT NULL
)
/

-- Create indexes for table Prace

CREATE INDEX IX_Ma_do_wykonania ON Prace (ID_Spoldzielni)
/

CREATE INDEX Pracownik_ma_adres ON Prace (ID_Administracji)
/

-- Add keys for table Prace

ALTER TABLE Prace ADD CONSTRAINT Budzet_PK PRIMARY KEY (ID_Pracy)
/

-- Table Pojazdy

CREATE TABLE Pojazdy(
  ID_Pojazdu Integer NOT NULL,
  Typ_pojazdu Varchar2(10 ) NOT NULL
        CONSTRAINT CheckConstraintTypR CHECK (Typ_pojazdu IN ('Przyczepka','Koparka','Bus','Traktor')),
  nr_rejestracyjny Varchar2(8 ) NOT NULL,
  nr_VIN Char(17 ) NOT NULL,
  Marka Varchar2(20 ) NOT NULL,
  Przeglad Date NOT NULL,
  Ubezpieczenie Date NOT NULL,
  ID_Spoldzielni Integer NOT NULL
)
/

-- Create indexes for table Pojazdy

CREATE INDEX IX_Jest_w_posiadaniu ON Pojazdy (ID_Spoldzielni)
/

-- Add keys for table Pojazdy

ALTER TABLE Pojazdy ADD CONSTRAINT Pojazd_PK PRIMARY KEY (ID_Pojazdu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Pojazdy.Ubezpieczenie IS 'Termin koñca ubezpieczenia'
/

-- Table Szkolenia

CREATE TABLE Szkolenia(
  ID_Szkolenia Integer NOT NULL,
  Nazwa_szkolenia Varchar2(50 ) NOT NULL,
  Data_szkolenia Date NOT NULL,
  Wolne_miejsca Integer NOT NULL,
  Data_zakonczenia Date
)
/

-- Add keys for table Szkolenia

ALTER TABLE Szkolenia ADD CONSTRAINT Unique_Identifier1 PRIMARY KEY (ID_Szkolenia)
/

-- Table and Columns comments section

COMMENT ON TABLE Szkolenia IS 'Listra dostêpnych szkoleñ. Spó³dzielnia nie organizuje szkoleñ'
/

-- Table Wykorzystywany_pojazd

CREATE TABLE Wykorzystywany_pojazd(
  ID_Administracji Integer NOT NULL,
  ID_Pojazdu Integer NOT NULL
)
/

-- Table Pracownicy_Administracji

CREATE TABLE Pracownicy_Administracji(
  ID_Pracownika Integer NOT NULL,
  ID_Administracji Integer NOT NULL
)
/

-- Table Zapisani_na_szkolenia

CREATE TABLE Zapisani_na_szkolenia(
  ID_Pracownika Integer NOT NULL,
  ID_Szkolenia Integer NOT NULL
)
/

-- Table and Columns comments section

COMMENT ON TABLE Zapisani_na_szkolenia IS 'Lista aktualnie zapisanych pracowników na szkolenia'
/

-- Table Adresy

CREATE TABLE Adresy(
  ID_Adresu Integer NOT NULL,
  Miasto Varchar2(30 ) NOT NULL,
  Ulica Varchar2(30 ),
  Nr_budynku Varchar2(5 ) NOT NULL,
  Nr_lokalu Varchar2(5 ),
  Kod_pocztowy Char(6 ) NOT NULL
)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (ID_Adresu)
/

-- Table and Columns comments section

COMMENT ON TABLE Adresy IS 'Zbiór wszystkich adresów'
/
COMMENT ON COLUMN Adresy.ID_Adresu IS 'Unikatowy identyfikator adresu'
/
COMMENT ON COLUMN Adresy.Miasto IS 'Nazwa miasta'
/
COMMENT ON COLUMN Adresy.Ulica IS 'Nazwa ulicy'
/
COMMENT ON COLUMN Adresy.Nr_budynku IS 'Numer budynku'
/
COMMENT ON COLUMN Adresy.Nr_lokalu IS 'Numer lokalu'
/
COMMENT ON COLUMN Adresy.Kod_pocztowy IS 'Kod pocztowy'
/

-- Table Stanowiska

CREATE TABLE Stanowiska(
  ID_Stanowiska Integer NOT NULL,
  Nazwa Varchar2(30 ) NOT NULL,
  Opis Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (ID_Stanowiska)
/

ALTER TABLE Stanowiska ADD CONSTRAINT Nazwa UNIQUE (Nazwa)
/

-- Table and Columns comments section

COMMENT ON TABLE Stanowiska IS 'Zbiór wszystkich stanowisk w spó³dzielni mieszkaniowej'
/
COMMENT ON COLUMN Stanowiska.ID_Stanowiska IS 'Unikatowy identyfikator stanowiska'
/
COMMENT ON COLUMN Stanowiska.Nazwa IS 'Nazwa stanowiska'
/
COMMENT ON COLUMN Stanowiska.Opis IS 'Opis stanowiska'
/

-- Table Uprawnienia

CREATE TABLE Uprawnienia(
  ID_Uprawnienia Char(20 ) NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL,
  Opis Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Uprawnienia

ALTER TABLE Uprawnienia ADD CONSTRAINT PK_Uprawnienia PRIMARY KEY (ID_Uprawnienia)
/

-- Table and Columns comments section

COMMENT ON COLUMN Uprawnienia.ID_Uprawnienia IS 'Unikalny identyfikator uprawnienia'
/
COMMENT ON COLUMN Uprawnienia.Nazwa IS 'Nazwa uprawnienia'
/
COMMENT ON COLUMN Uprawnienia.Opis IS 'Opis uprawnienia'
/

-- Table Posiadane_uprawnienia

CREATE TABLE Posiadane_uprawnienia(
  ID_Pracownika Integer NOT NULL,
  Attribute1 Char(20 ) NOT NULL
)
/

-- Add keys for table Posiadane_uprawnienia

ALTER TABLE Posiadane_uprawnienia ADD CONSTRAINT PK_Posiadane_uprawnienia PRIMARY KEY (ID_Pracownika,Attribute1)
/

-- Table Wynagrodzenia

CREATE TABLE Wynagrodzenia(
  ID_Wynagrodzenia Integer NOT NULL,
  Data Date NOT NULL,
  Kwota_podstawowa Number(8,2) NOT NULL,
  Premia Number(8,2),
  ID_Pracownika Integer NOT NULL
)
/

-- Create indexes for table Wynagrodzenia

CREATE INDEX Mieszkanie_ma_lokatorów ON Wynagrodzenia (ID_Pracownika)
/

-- Add keys for table Wynagrodzenia

ALTER TABLE Wynagrodzenia ADD CONSTRAINT PK_Wynagrodzenia PRIMARY KEY (ID_Wynagrodzenia)
/

-- Table and Columns comments section

COMMENT ON TABLE Wynagrodzenia IS 'Zawiera informacje o wynagrodzeniach'
/
COMMENT ON COLUMN Wynagrodzenia.ID_Wynagrodzenia IS 'Unikatowy identyfikator klucza'
/
COMMENT ON COLUMN Wynagrodzenia.Data IS 'Data wyp³aty wynagrodzenia'
/
COMMENT ON COLUMN Wynagrodzenia.Kwota_podstawowa IS 'Podstawowe wynagrodzenie'
/
COMMENT ON COLUMN Wynagrodzenia.Premia IS 'Premia do podstawowego wynagrodzenia'
/

-- Table Lokatorzy

CREATE TABLE Lokatorzy(
  ID_Lokatora Integer NOT NULL,
  Imie Varchar2(30 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  PESEL_lokatora Char(11 ),
  ID_Mieszkania Integer NOT NULL
)
/

-- Create indexes for table Lokatorzy

CREATE INDEX IX_Relationship2 ON Lokatorzy (ID_Mieszkania)
/

-- Add keys for table Lokatorzy

ALTER TABLE Lokatorzy ADD CONSTRAINT PK_Lokatorzy PRIMARY KEY (ID_Lokatora)
/

-- Table and Columns comments section

COMMENT ON COLUMN Lokatorzy.ID_Lokatora IS 'Uniakotowy identyfikator lokatora'
/
COMMENT ON COLUMN Lokatorzy.Imie IS 'Imie lokatora'
/
COMMENT ON COLUMN Lokatorzy.Nazwisko IS 'Nazwisko lokatora'
/
COMMENT ON COLUMN Lokatorzy.PESEL_lokatora IS 'Pesel lokatora'
/

-- Trigger for sequence pracownicyseq for column ID_Pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_pracownicyseq BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.ID_Pracownika := pracownicyseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_pracownicyseq AFTER UPDATE OF ID_Pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Pracownika in table Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence administracjeseq for column ID_Administracji in table Administracje ---------
CREATE OR REPLACE TRIGGER ts_Administracje_administracjeseq BEFORE INSERT
ON Administracje FOR EACH ROW
BEGIN
  :new.ID_Administracji := administracjeseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Administracje_administracjeseq AFTER UPDATE OF ID_Administracji
ON Administracje FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Administracji in table Administracje as it uses sequence.');
END;
/

-- Trigger for sequence blokiseq for column ID_Bloku in table Bloki ---------
CREATE OR REPLACE TRIGGER ts_Bloki_blokiseq BEFORE INSERT
ON Bloki FOR EACH ROW
BEGIN
  :new.ID_Bloku := blokiseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Bloki_blokiseq AFTER UPDATE OF ID_Bloku
ON Bloki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Bloku in table Bloki as it uses sequence.');
END;
/

-- Trigger for sequence mieszkaniaseq for column ID_Mieszkania in table Mieszkania ---------
CREATE OR REPLACE TRIGGER ts_Mieszkania_mieszkaniaseq BEFORE INSERT
ON Mieszkania FOR EACH ROW
BEGIN
  :new.ID_Mieszkania := mieszkaniaseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Mieszkania_mieszkaniaseq AFTER UPDATE OF ID_Mieszkania
ON Mieszkania FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Mieszkania in table Mieszkania as it uses sequence.');
END;
/

-- Trigger for sequence rachunkiseq for column ID_Rachunku in table Rachunki ---------
CREATE OR REPLACE TRIGGER ts_Rachunki_rachunkiseq BEFORE INSERT
ON Rachunki FOR EACH ROW
BEGIN
  :new.ID_Rachunku := rachunkiseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Rachunki_rachunkiseq AFTER UPDATE OF ID_Rachunku
ON Rachunki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Rachunku in table Rachunki as it uses sequence.');
END;
/

-- Trigger for sequence firmyseq for column ID_Firmy in table Firmy_zewnetrzne ---------
CREATE OR REPLACE TRIGGER ts_Firmy_zewnetrzne_firmyseq BEFORE INSERT
ON Firmy_zewnetrzne FOR EACH ROW
BEGIN
  :new.ID_Firmy := firmyseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Firmy_zewnetrzne_firmyseq AFTER UPDATE OF ID_Firmy
ON Firmy_zewnetrzne FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Firmy in table Firmy_zewnetrzne as it uses sequence.');
END;
/

-- Trigger for sequence pracaseq for column ID_Pracy in table Prace ---------
CREATE OR REPLACE TRIGGER ts_Prace_pracaseq BEFORE INSERT
ON Prace FOR EACH ROW
BEGIN
  :new.ID_Pracy := pracaseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Prace_pracaseq AFTER UPDATE OF ID_Pracy
ON Prace FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Pracy in table Prace as it uses sequence.');
END;
/

-- Trigger for sequence pojazdyseq for column ID_Pojazdu in table Pojazdy ---------
CREATE OR REPLACE TRIGGER ts_Pojazdy_pojazdyseq BEFORE INSERT
ON Pojazdy FOR EACH ROW
BEGIN
  :new.ID_Pojazdu := pojazdyseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pojazdy_pojazdyseq AFTER UPDATE OF ID_Pojazdu
ON Pojazdy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Pojazdu in table Pojazdy as it uses sequence.');
END;
/

-- Trigger for sequence szkoleniaseq for column ID_Szkolenia in table Szkolenia ---------
CREATE OR REPLACE TRIGGER ts_Szkolenia_szkoleniaseq BEFORE INSERT
ON Szkolenia FOR EACH ROW
BEGIN
  :new.ID_Szkolenia := szkoleniaseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Szkolenia_szkoleniaseq AFTER UPDATE OF ID_Szkolenia
ON Szkolenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Szkolenia in table Szkolenia as it uses sequence.');
END;
/

-- Trigger for sequence adresyseq for column ID_Adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_adresyseq BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.ID_Adresu := adresyseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_adresyseq AFTER UPDATE OF ID_Adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Adresu in table Adresy as it uses sequence.');
END;
/

-- Trigger for sequence stanowiskaseq for column ID_Stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_stanowiskaseq BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.ID_Stanowiska := stanowiskaseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_stanowiskaseq AFTER UPDATE OF ID_Stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Stanowiska in table Stanowiska as it uses sequence.');
END;
/

-- Trigger for sequence uprawnieniaseq for column ID_Uprawnienia in table Uprawnienia ---------
CREATE OR REPLACE TRIGGER ts_Uprawnienia_uprawnieniaseq BEFORE INSERT
ON Uprawnienia FOR EACH ROW
BEGIN
  :new.ID_Uprawnienia := uprawnieniaseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Uprawnienia_uprawnieniaseq AFTER UPDATE OF ID_Uprawnienia
ON Uprawnienia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Uprawnienia in table Uprawnienia as it uses sequence.');
END;
/

-- Trigger for sequence wynagordzenia for column ID_Wynagrodzenia in table Wynagrodzenia ---------
CREATE OR REPLACE TRIGGER ts_Wynagrodzenia_wynagordzenia BEFORE INSERT
ON Wynagrodzenia FOR EACH ROW
BEGIN
  :new.ID_Wynagrodzenia := wynagordzenia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wynagrodzenia_wynagordzenia AFTER UPDATE OF ID_Wynagrodzenia
ON Wynagrodzenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Wynagrodzenia in table Wynagrodzenia as it uses sequence.');
END;
/

-- Trigger for sequence lokatorzyseq for column ID_Lokatora in table Lokatorzy ---------
CREATE OR REPLACE TRIGGER ts_Lokatorzy_lokatorzyseq BEFORE INSERT
ON Lokatorzy FOR EACH ROW
BEGIN
  :new.ID_Lokatora := lokatorzyseq.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Lokatorzy_lokatorzyseq AFTER UPDATE OF ID_Lokatora
ON Lokatorzy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ID_Lokatora in table Lokatorzy as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Pracownicy ADD CONSTRAINT Zatrudnia FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Administracje ADD CONSTRAINT Sprawuje_kontrole_nad FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Bloki ADD CONSTRAINT Nadzoruje FOREIGN KEY (ID_Administracji) REFERENCES Administracje (ID_Administracji)
/



ALTER TABLE Mieszkania ADD CONSTRAINT Zawiera FOREIGN KEY (ID_Bloku) REFERENCES Bloki (ID_Bloku)
/



ALTER TABLE Rachunki ADD CONSTRAINT Placi FOREIGN KEY (ID_Mieszkania) REFERENCES Mieszkania (ID_Mieszkania)
/



ALTER TABLE Pojazdy ADD CONSTRAINT Jest_w_posiadaniu FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Prace ADD CONSTRAINT Zatwierdza FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Firmy_zewnetrzne ADD CONSTRAINT Oplaca FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Rachunki ADD CONSTRAINT Otrzymuje FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Spoldzielnie ADD CONSTRAINT Spoldzielnia_ma_adres FOREIGN KEY (ID_Adresu) REFERENCES Adresy (ID_Adresu)
/



ALTER TABLE Firmy_zewnetrzne ADD CONSTRAINT Firma_ma_adres FOREIGN KEY (ID_Adresu) REFERENCES Adresy (ID_Adresu)
/



ALTER TABLE Administracje ADD CONSTRAINT Administracja_ma_adres FOREIGN KEY (ID_Adresu) REFERENCES Adresy (ID_Adresu)
/



ALTER TABLE Bloki ADD CONSTRAINT Blok_ma_adres FOREIGN KEY (ID_Adresu) REFERENCES Adresy (ID_Adresu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_ma_stanowisko FOREIGN KEY (ID_Stanowiska) REFERENCES Stanowiska (ID_Stanowiska)
/



ALTER TABLE Posiadane_uprawnienia ADD CONSTRAINT Pracownik_posiada FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy (ID_Pracownika)
/



ALTER TABLE Posiadane_uprawnienia ADD CONSTRAINT Jest_posiadane FOREIGN KEY (Attribute1) REFERENCES Uprawnienia (ID_Uprawnienia)
/



ALTER TABLE Bloki ADD CONSTRAINT Administruje FOREIGN KEY (ID_Spoldzielni) REFERENCES Spoldzielnie (ID_Spoldzielni)
/



ALTER TABLE Prace ADD CONSTRAINT Wykonuje FOREIGN KEY (ID_Administracji) REFERENCES Administracje (ID_Administracji)
/



ALTER TABLE Wynagrodzenia ADD CONSTRAINT Otrzymuje_wynagrodzenie FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy (ID_Pracownika)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_ma_adres FOREIGN KEY (ID_Adresu) REFERENCES Adresy (ID_Adresu)
/



ALTER TABLE Lokatorzy ADD CONSTRAINT Mieszkanie_ma_lokatorów FOREIGN KEY (ID_Mieszkania) REFERENCES Mieszkania (ID_Mieszkania)
/





