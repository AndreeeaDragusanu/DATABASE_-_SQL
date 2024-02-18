use chinook;

-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.
SELECT 
    COUNT(track.name) tottrack, genre.name genere
FROM
    track
        JOIN
    genre ON track.genreid = genre.genreid
GROUP BY genre.name
HAVING (genre.name , COUNT(track.name)) <> (SELECT 
        genre.name, COUNT(track.name)
    FROM
        track
            JOIN
        genre ON genre.genreid = track.genreid
    GROUP BY genre.name
    HAVING COUNT(track.name) < 10)
    order by tottrack desc;
    
-- Trovate le tre canzoni più costose
SELECT 
    track.name namet, track.unitprice maxprice
FROM
    track
ORDER BY maxprice DESC
LIMIT 3;
    

-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
SELECT 
    distinct ( artist.name) 
FROM
    artist
        LEFT JOIN
    album USING (artistid)
        RIGHT JOIN
    track USING (albumid ) 
  where track.milliseconds / 60000 > 6;
    
    -- Individuate la durata media delle tracce per ogni genere.

SELECT 
    AVG(track.milliseconds) duratamedia, genre.name genere
FROM
    track
        JOIN
    genre ON track.genreid = genre.genreid
GROUP BY genre.name;

-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome 
SELECT 
    track.name nometrack, genre.name genere
FROM
    track
        JOIN
    genre ON track.genreid = genre.genreid
WHERE
    track.name LIKE ('% love %')
ORDER BY genere , nometrack;
 
-- costo medio per ogni tipologia di media

SELECT 
    mediatype.name nomemt, AVG(track.unitprice) costomedio
FROM
    mediatype
        JOIN
    track ON mediatype.mediatypeid = track.mediatypeid
GROUP BY nomemt;

-- Individuate il genere con più tracce.
SELECT 
    genre.name nomegenere, COUNT(track.name) numero
FROM
    genre
        JOIN
    track ON track.genreid = genre.genreid
GROUP BY nomegenere
ORDER BY numero DESC
LIMIT 1;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.
SELECT 
    artist.name nome, COUNT(album.artistid) nalbum
FROM
    album
        JOIN
    artist ON artist.artistid = album.artistid
GROUP BY nome
HAVING COUNT(album.artistid) = (SELECT 
        COUNT(album.artistid)
    FROM
        album
            JOIN
        artist ON artist.artistid = album.artistid
    WHERE
        artist.name LIKE 'the rolling stones') and artist.name not like 'the rolling stones';
        
-- Trovate l’artista con l’album più costoso

SELECT 
    artist.name,
    SUM(track.unitprice) prezzo,
    album.title,
    album.albumid
FROM
    album
        LEFT JOIN
    track ON album.albumid = track.albumid
        JOIN
    artist ON artist.artistid = album.artistid
GROUP BY album.albumid
ORDER BY prezzo DESC
LIMIT 1;
 
