DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  artist_id INT8 REFERENCES artists(id),
  genre VARCHAR(255)
); 
