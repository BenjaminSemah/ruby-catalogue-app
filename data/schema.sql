CREATE DATABASE catalogue;

CREATE TABLE genres(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE music_albums(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(150) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);