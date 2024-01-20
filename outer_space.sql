DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years NUMERIC NOT NULL CHECK (orbital_period_in_years >= 0),
  galaxy_id INT REFERENCES galaxies(id),
  moons TEXT[]
);

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, '{}'),
  ('Neptune', 164.8, 1, '{"Naiad", "Thalassa", ...}'),
  ('Proxima Centauri b', 0.03, 2, '{}'),
  ('Gliese 876 b', 0.23, 3, '{}');
