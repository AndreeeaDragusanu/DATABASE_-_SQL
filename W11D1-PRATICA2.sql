use chinook;

-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.
SELECT 
    track.name canzone, genre.name genere
FROM
    track
        JOIN
    genre USING (genreid)
WHERE
    genre.name IN ('pop' , 'rock');
    
-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
SELECT 
    artist.name artista, album.title album
FROM
    artist
        JOIN
    album USING (artistid)
WHERE
    artist.name LIKE ('A%')
        AND album.title LIKE ('A%');
        
SELECT 
    artist.name artista, album.title album
FROM
    artist
        LEFT JOIN
    album USING (artistid)
WHERE
    artist.name LIKE ('A%')
        OR album.title LIKE ('A%');
        
-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
SELECT 
    track.name canzone,
    genre.name genere,
    track.milliseconds / 60000 durata
FROM
    track
        JOIN
    genre USING (genreid)
WHERE
    genre.name LIKE ('jazz')
        AND track.milliseconds / 60000 < 3;

-- Recuperate tutte le tracce più lunghe della durata media.
SELECT 
    track.name canzone, track.milliseconds durata
FROM
    track
WHERE
    track.milliseconds > (SELECT 
            AVG(track.milliseconds)
        FROM
            track); 

-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti

SELECT 
    genre.name genere
FROM
    genre
        JOIN
    track USING (genreid)
GROUP BY genre.name
HAVING AVG(track.milliseconds / 60000) > 4;

-- Individuate gli artisti che hanno rilasciato più di un album.

SELECT 
    artist.name artista, COUNT(albumid) nralbum
FROM
    artist
        JOIN
    album USING (artistid)
GROUP BY artist.name
HAVING COUNT(albumid) > 1;

-- Trovate la traccia più lunga in ogni album.
SELECT 
    track.name canzone, album.title album
FROM
    track
        JOIN
    album USING (albumid)
        JOIN
    (SELECT 
        albumid, MAX(track.milliseconds) duratamassima
    FROM
        track
    GROUP BY albumid) duratamax ON track.albumid = duratamax.albumid
        AND track.milliseconds = duratamax.duratamassima;

-- Individuate la durata media delle tracce per ogni album.
SELECT 
    AVG(track.milliseconds) duratamedia, album.title album
FROM
    track
        JOIN
    album USING (albumid)
GROUP BY albumid;

-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute

SELECT 
    album.title album, COUNT(trackid) nrcanzoni
FROM
    album
        JOIN
    track USING (albumid)
GROUP BY albumid
HAVING nrcanzoni > 20;