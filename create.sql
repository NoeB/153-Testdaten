Create TABLE Typ (
    ID serial PRIMARY KEY,
    typ VARCHAR(50) NOT NULL
);

CREATE TABLE Marke(
    ID serial PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Zustand(
    ID serial PRIMARY KEY,
    zustand VARCHAR(50)
);


CREATE TABLE Fahrrad(
    ID serial PRIMARY KEY,
    typid integer NOT NULL,
    markeid integer NOT NULL,
    zustandid integer NOT NULL,
    FOREIGN KEY (typid) REFERENCES Typ (ID),
    FOREIGN KEY (markeid) REFERENCES Marke (ID),
    FOREIGN KEY (zustandid) REFERENCES Zustand (ID)
);

CREATE TABLE Adresse (
    ID serial PRIMARY KEY,
    PLZ integer NOT NULL,
    Ort varchar(50) NOT NULL ,
    Strasse varchar(50) NOT NULL,
    Nummer varchar(50) NOT NULL,
    Land varchar(50) NOT NULL
);

CREATE TABLE Mieter(
    ID serial PRIMARY KEY,
    adressid integer NOT NULL,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    telefonnummer VARCHAR(50) NOT NULL,
    FOREIGN KEY (adressid) REFERENCES Adresse (ID)
);


CREATE TABLE Vermietung(
    ID serial PRIMARY KEY,
    mieterid integer NOT NULL,
    startdatum timestamp,
    enddatum timestamp,
    preis float,
    FOREIGN KEY (mieterid) REFERENCES Mieter (ID)
);

CREATE TABLE Fahrrad_Vermietung(
  fahrradid serial NOT NULL,
  vermietungid serial NOT NULL,
  PRIMARY KEY (fahrradid, vermietungid),
  CONSTRAINT Fahrrad_fahrradid  FOREIGN KEY (fahrradid)
        REFERENCES Fahrrad (ID) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT Vermietung_vermietungid  FOREIGN KEY (vermietungid)
        REFERENCES Vermietung (ID) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);
