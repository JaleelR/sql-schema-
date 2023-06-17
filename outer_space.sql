-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
DROP TABLE IF EXISTS galaxies;
DROP TABLE IF EXISTS stars; 
DROP TABLE IF EXISTS planets;
CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE galaxies
(
id SERIAL PRIMARY KEY,
name TEXT 
);

CREATE TABLE stars
(  
id SERIAL PRIMARY KEY,
name TEXT
);

CREATE TABLE planets
(
id	SERIAL PRIMARY KEY, 
name TEXT NOT NULL,
orbital_period_in_years FLOAT NOT NULL,
galaxy_id INTEGER REFERENCES galaxies,
orbits_around INTEGER REFERENCES stars,	
moon TEXT[]
);

INSERT INTO galaxies
(name)
VALUES
('Milky Way');


INSERT INTO stars
(name)
VALUES
('sun'),
('Proxima Centauri'), 
('Gliese 876');


INSERT INTO planets
  (name, orbital_period_in_years, galaxy_id, orbits_around,  moon)
VALUES
  ('Earth', 1.00, 1 , 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 1, 2, '{}'),
  ('Gliese 876 b', 0.23, 1, 3, '{}');


SELECT p.name FROM planets p
JOIN stars s
ON p.orbits_around = s.id
WHERE s.name = 'sun';


-- SELECT * FROM stars 