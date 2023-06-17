-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;
DROP TABLE IF EXISTS albums; 
DROP TABLE IF EXISTS artists; 
DROP TABLE IF EXISTS producers;
DROP TABLE IF EXISTS songs;
CREATE DATABASE music;

\c music;


CREATE TABLE albums 
(
id SERIAL PRIMARY KEY, 
title TEXT DEFAULT NULL
);


CREATE TABLE artists 
(
id SERIAL PRIMARY KEY,
name TEXT[] NOT NULL
);


create table producers 
(
id SERIAL PRIMARY KEY,
name TEXT[] NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL, 
  producer_id INTEGER REFERENCES producers,
  artist_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums
);



INSERT INTO albums
(title)
VALUES
('harrys House'),
('Freudian'),
('Pink Friday'),
('Miseducation Of lauryn  Hill'),
('Nothing Was The Same');


INSERT INTO artists 
(name)
VALUES
('{Daniel Ceasar}'),
('{Drake}'),
('{Nicki Minaj}'),
('{Harry Styles}'),
('{Lauren Hill}');


INSERT INTO producers
(name)
VALUES 
('{me}'), 
('{old guy}'), 
('{swiss beatz}'), 
('{old woman}');




INSERT INTO songs 
(
title, duration_in_seconds, release_date, producer_id, artist_id, album_id
)
VALUES
('That thing', 400, '04-15-1997', 1, 5, 4), 
('As it was', 355, '10-31-2022', 1, 4, 1),
('To ZION', 282, '11-14-1997', 2, 5, 4),
('Romans revenge', 340, '11-07-2010', 4, 3, 3),
('get you', 316, '09-27-2018', 4, 1, 2),
('we"re going home', 244, '05-14-2013', 3, 2, 5),
('blessed', 223, '08-21-2018', 2, 1, 2),
('Poundcake', 215, '12-17-2013', 4, 2, 5 ),
('Last chance', 301, '06-21-2011', 3, 3, 3),
('4pm in Calabasas', 276, '10-20-2016', 1, 2, NULL);





-- SELECT * FROM artists ;
--  SELECT * FROM albums;
--SELECT * FROM songs;


 SELECT a.title as album_title, s.title as song_name FROM songs s
 JOIN albums a
ON s.album_id = a.id 
JOIN artists ar 
 ON s.artist_id = ar.id 
 WHERE ar.name = '{Drake}' OR ar.name = '{Nicki Minaj}'
 Group BY a.title, s.title;


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   , '{"Hanson"}', 'Middle of Nowhere',),
  
  
  
  
  

  
