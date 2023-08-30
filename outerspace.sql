CREATE DATABASE outerspace;

CREATE TABLE stars (
    star_name VARCHAR(50) PRIMARY KEY,
    temperature_k INT,

);

CREATE TABLE planets (
    planet_name VARCHAR(50) PRIMARY KEY,
    orbital_period FLOAT,
    parent_star VARCHAR(50) NOT NULL REFERENCES stars

);

CREATE TABLE moons (
    moon_name VARCHAR(50) PRIMARY KEY,
    parent_planet VARCHAR(50) NOT NULL REFERENCES planets
);

INSERT INTO stars (star_name, temperature_k)
    VALUES
        ('The Sun', 5800),
        ('Proxima Centauri', 3042),
        ('Gliese 876', 3192);

INSERT INTO planets (planet_name, orbital_period, parent_star)
    VALUES
        ('Earth', 1.00, 'The Sun'),
        ('Mars', 1.882, 'The Sun'),
        ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
        ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (moon_name, parent_planet)
    VALUES
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');

SELECT planet_name, parent_star, COUNT(moon_name) AS moon_count
FROM planets
    LEFT OUTER JOIN moons
        ON planets.planet_name = moons.parent_planet
        GROUP BY planet_name
        ORDER BY planet_name;