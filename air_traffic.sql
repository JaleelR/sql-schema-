-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;


Create TABLE passengers
(
id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);


Create TABLE airplane_info
(
id SERIAL PRIMARY KEY, 
 seat TEXT NOT NULL,
  airline TEXT NOT NULL
);

Create TABLE ride_info
(
id SERIAL PRIMARY KEY, 
departure TIMESTAMP NOT NULL,
from_city TEXT NOT NULL,
from_country TEXT NOT NULL,
arrival TIMESTAMP NOT NULL,
to_city TEXT NOT NULL,
to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
 airplane_id INTEGER REFERENCES airplane_info,
ride_id INTEGER REFERENCES ride_info
);



INSERT INTO passengers
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley');

INSERT INTO airplane_info
(seat, airline)
VALUES
('33B', 'United'),
('8A','British Airways' ),
('12F', 'Delta')

INSERT INTO ride_id
()
VALUES
('2018-04-08 09:00:00', '2018-04-08 12:00:00','Washington DC', 'United States', 'Seattle', 'United States' ),
( '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States');




INSERT INTO tickets
  (  passenger_id, airplane_id, ride_id)
VALUES
  (1, 3, 2  ),
  (2, 1, 3),
  (3,1, 2 ),
