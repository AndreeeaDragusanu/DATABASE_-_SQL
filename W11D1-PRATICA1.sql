use chinook;

-- Esercizio 1 Cominciate facendo un’analisi esplorativa del database, ad esempio: 
-- Fate un elenco di tutte le tabelle. 
-- Visualizzate le prime 10 righe della tabella Album. 
-- Trovate il numero totale di canzoni della tabella Tracks. 
-- Trovate i diversi generi presenti nella tabella Genre. … … 
-- Effettuate tutte le query esplorative che vi servono per prendere confidenza con i dati.
show tables;
select * from album limit 10;
select count(*) from track;
select distinct track.name from track;
select genre.name from genre;
select count(*) from artist;
select distinct artist.name from artist;
select count(*) from album;
select distinct album.title from album;

-- Recuperate il nome di tutte le tracce e del genere associato.
SELECT 
    track.name nomecanzone, genre.name genere
FROM
    track
        JOIN
    genre USING (genreid);
    
-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?
SELECT 
    artist.name nomeartista, COUNT(albumid) numeroalbum
FROM
    artist
        LEFT JOIN
    album USING (artistid)
GROUP BY artistid
HAVING COUNT(albumid) >= 1;
SELECT 
    artist.name nomeartista, COUNT(albumid) numeroalbum
FROM
    artist
        LEFT JOIN
    album USING (artistid)
GROUP BY artistid
HAVING COUNT(albumid) = 0;

-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media?

SELECT 
    track.name nomecanzone,
    genre.name genere,
    mediatype.name tipmedia
FROM
    track
        JOIN
    genre USING (genreid)
        JOIN
    mediatype USING (mediatypeid);
    
-- Elencate i nomi di tutti gli artisti e dei loro album.
-- includendo artisti senza album
SELECT 
    artist.name artista, album.title album
FROM
    artist
        LEFT JOIN
    album USING (artistid);

-- solo artisti che hanno album
SELECT 
    artist.name artista, album.title album
FROM
    artist
        JOIN
    album USING (artistid);