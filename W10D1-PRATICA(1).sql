USE VIDEOGIOCODB;

-- CREAZIONE TABELLE VIDEOGIOCODB

CREATE TABLE STORE (
    CODICESTORE INTEGER PRIMARY KEY,
    INDIRIZZOFISICO VARCHAR(50),
    NUMEROTELEFONO VARCHAR(15)
);

-- DROP TABLE STORE;

CREATE TABLE IMPIEGATO (
    CODICEFISCALE VARCHAR(16) PRIMARY KEY,
    NOME VARCHAR(50),
    TITOLOSTUDIO VARCHAR(40),
    RECAPITO VARCHAR(40)
);
-- DROP TABLE IMPIEGATO;

CREATE TABLE SERVIZIOIMPIEGATO (
    ID_SERVIZIOIMPIEGATO INTEGER PRIMARY KEY AUTO_INCREMENT,
    CODICEFISCALE VARCHAR(16),
    CODICESTORE INTEGER,
    DATAINIZIO DATE,
    DATAFINE DATE,
    CARICA VARCHAR(30),
    FOREIGN KEY (CODICEFISCALE)
        REFERENCES IMPIEGATO (CODICEFISCALE),
    FOREIGN KEY (CODICESTORE)
        REFERENCES STORE (CODICESTORE)
);

-- DRPO TABLE SERVIZIOIMPIEGATO:

CREATE TABLE VIDEOGIOCO (
    TITOLO VARCHAR(50) PRIMARY KEY,
    CODICESTORE INTEGER AUTO_INCREMENT,
    SVILUPPATORE VARCHAR(30),
    ANNODISTRIBUZIONE YEAR,
    COSTOACQUISTO REAL,
    GENERE VARCHAR(30),
    REMAKEID VARCHAR(30),
    FOREIGN KEY (CODICESTORE) 
        REFERENCES STORE (CODICESTORE)
);
-- DROP TABLE VIDEOGIOCO;


-- INSERIMENTO DATI NELLE TABELLE

INSERT INTO STORE VALUES
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma', '+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678'); 

-- SELECT * FROM STORE; 

INSERT INTO IMPIEGATO VALUES
('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi', 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@email.com');

-- SELECT * FROM IMPIEGATO;

INSERT INTO SERVIZIOIMPIEGATO (CODICEFISCALE, CODICESTORE, DATAINIZIO, DATAFINE, CARICA) VALUES
('ABC12345XYZ67890', 1, '2023-01-01', '2023-12-31', 'Cassiere'),
('DEF67890XYZ12345', 2, '2023-02-01', '2023-11-30', 'Commesso'),
('GHI12345XYZ67890', 3, '2023-03-01', '2023-10-31', 'Magazziniere'),
('JKL67890XYZ12345', 4, '2023-04-01', '2023-09-30', 'Addetto alle vendite'),
('MNO12345XYZ67890', 5, '2023-05-01', '2023-08-31', 'Addetto alle pulizie'),
('PQR67890XYZ12345', 6, '2023-06-01', '2023-07-31', 'Commesso'),
('STU12345XYZ67890', 7, '2023-07-01', '2023-06-30', 'Commesso'),
('VWX67890XYZ12345', 8, '2023-08-01', '2023-05-31', 'Cassiere'),
('YZA12345XYZ67890', 9, '2023-09-01', '2023-04-30', 'Cassiere'),
('BCD67890XYZ12345', 10, '2023-10-01', '2023-03-31', 'Cassiere');

 -- SELECT * FROM SERVIZIOIMPIEGATO;

INSERT INTO VIDEOGIOCO( TITOLO, SVILUPPATORE, ANNODISTRIBUZIONE, COSTOACQUISTO, GENERE, REMAKEID) VALUES
  ('Fifa 2023', 'EA Sports', 2023, 49.99, 'Calcio', NULL),
  ('Assassin''s Creed: Valhalla', 'Ubisoft', 2020, 59.99, 'Action', NULL),
  ('Super Mario Odyssey', 'Nintendo', 2017, 39.99, 'Platform', NULL),
  ('The Last of Us Part II', 'Naughty Dog', 2020, 69.99, 'Action', NULL),
  ('Cyberpunk 2077', 'CD Projekt Red', 2020, 49.99, 'RPG', NULL),
  ('Animal Crossing: New Horizons', 'Nintendo', 2020, 54.99, 'Simulation', NULL),
  ('Call of Duty: Warzone', 'Infinity Ward', 2020, 0.00, 'FPS', NULL),
  ('The Legend of Zelda: Breath of the Wild', 'Nintendo', 2017, 59.99, 'Action-Adventure', NULL),
  ('Fortnite', 'Epic Games', 2017, 0.00, 'Battle Royale', NULL),
  ('Red Dead Redemption 2', 'Rockstar Games', 2018, 39.99, 'Action-Adventure', NULL);
  
  -- SELECT * FROM VIDEOGIOCO;





