--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(10,3) NOT NULL,
    radius_in_kilometers integer,
    distance_from_earth_in_kilometers integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(10,3) NOT NULL,
    size_in_light_years integer,
    distance_from_earth_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(10,3) NOT NULL,
    radius_in_kilometers integer,
    distance_from_earth_in_kilometers integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(10,3) NOT NULL,
    radius_in_kilometers integer,
    distance_from_earth_in_light_years integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_billions_of_years numeric(10,3) NOT NULL,
    radius_in_kilometers integer,
    distance_from_earth_in_light_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Ceres is a dwarf planet in the main asteroid belt between the orbits of Mars and Jupiter.', false, 4.600, 470, 413000000);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Pallas is the third-largest asteroid in the Solar System by volume and mass.', false, 4.500, 256, 628000000);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'Vesta is one of the largest objects in the asteroid belt, with a mean diameter of 525 kilometres.', false, 4.560, 263, 480000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 'As of 2024, it has the second-largest extent of radio structure of any radio galaxy identified, with lobed structures spanning 5 megaparsecs across, described by its discoverers at the time as the largest known structure of galactic origin.', false, 3.500, 242700, 350);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224.', false, 10.010, 110000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', true, 13.610, 87400, 0);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, 13.280, 53800, 17300000);
INSERT INTO public.galaxy VALUES (5, 'Circinus', 'Named after the constellation it is located in (Circinus).', false, 12.300, 48430, 13050000);
INSERT INTO public.galaxy VALUES (6, 'Eye of God', 'A prototype for multi-arm spiral galaxies', false, 10.000, 145300, 50330000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'The Moon is the only natural satellite of Earth.', false, 4.530, 1737, 384399, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is the innermost and larger of the two natural satellites of Mars.', false, 4.500, 11, 77795689, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the smaller and outer of the two natural satellites of Mars.', false, 4.600, 6, 77795689, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 'also known as Jupiter XVI', false, 4.500, 22, 588000000, 5);
INSERT INTO public.moon VALUES (5, 'Adrastea', 'also known as Jupiter XV', false, 4.500, 8, 588000000, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'It has the third-closest orbit around Jupiter among known moons', false, 4.500, 84, 588000000, 5);
INSERT INTO public.moon VALUES (7, 'Thebe', 'also known as Jupiter XIV', false, 4.500, 49, 588000000, 5);
INSERT INTO public.moon VALUES (8, 'Io', 'Io is the innermost and second-smallest of the four Galilean moons of Jupiter.', false, 4.500, 1822, 588000000, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 'Europa is the smallest and least massive of Jupiter''s four Galilean moons.', false, 4.500, 1561, 588000000, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Ganymede is a natural satellite of Jupiter and is the largest and most massive moon in the Solar System.', false, 4.500, 2634, 588000000, 5);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede.', false, 4.500, 2410, 588000000, 5);
INSERT INTO public.moon VALUES (12, 'Themisto', 'also known as Jupiter XVIII', false, 4.500, 5, 588000000, 5);
INSERT INTO public.moon VALUES (13, 'Leda', 'also known as Jupiter XIII', false, 4.500, 11, 588000000, 5);
INSERT INTO public.moon VALUES (14, 'Ersa', 'also designated Jupiter LXXI', false, 4.500, 2, 588000000, 5);
INSERT INTO public.moon VALUES (15, 'S/2018 J 2', 'S/2018 J 2 is a small outer natural satellite of Jupiter discovered by Scott S. Sheppard on 12 May 2018, using the 4.0-meter Víctor M. Blanco Telescope at Cerro Tololo Observatory, Chile.', false, 4.500, 2, 588000000, 5);
INSERT INTO public.moon VALUES (16, 'Himalia', 'also known as Jupiter VI', false, 4.500, 70, 588000000, 5);
INSERT INTO public.moon VALUES (17, 'Pandia', 'also designated Jupiter LXV', false, 4.500, 2, 588000000, 5);
INSERT INTO public.moon VALUES (18, 'Lysithea', 'also known as Jupiter X', false, 4.500, 21, 588000000, 5);
INSERT INTO public.moon VALUES (19, 'Elara', 'also known as Jupiter VII', false, 4.500, 40, 588000000, 5);
INSERT INTO public.moon VALUES (20, 'S/2011 J 3', 'S/2011 J 3 is a small outer natural satellite of Jupiter discovered by Scott S. Sheppard on 27 September 2011, using the 6.5-meter Magellan-Baade Telescope at Las Campanas Observatory, Chile.', false, 4.500, 2, 588000000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury is the first planet from the Sun.', false, 4.503, 2439, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the second planet from the Sun.', false, 4.503, 6051, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the third planet from the Sun.', true, 4.543, 6371, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun.', false, 4.603, 3390, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun.', false, 4.603, 69886, 0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun.', false, 4.503, 58232, 0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun.', false, 4.503, 25362, 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth and farthest known planet orbiting the Sun.', false, 4.503, 24622, 0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri in the constellation Centaurus.', false, 4.850, 653958, 4, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Proxima Centauri c is a disputed exoplanet candidate.', false, 4.850, 11800, 4, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'Proxima Centauri d is a confirmed exoplanet orbiting the red dwarf star Proxima Centauri.', false, 4.850, 563517, 4, 2);
INSERT INTO public.planet VALUES (12, 'Barnard''s Star b', 'Barnard''s Star b is a sub-Earth-mass exoplanet closely orbiting Barnard''s Star.', false, 10.000, 8703, 6, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'The Sun is the star at the center of the Solar System.', false, 4.600, 695700, 0, 3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'flare star, two confirmed planets and a candidate planet', false, 4.850, 107277, 4, 3);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 'flare star, largest-known proper motion, four confirmed planets', false, 10.000, 130096, 6, 3);
INSERT INTO public.star VALUES (4, 'Luhman 16', 'nearest brown dwarfs', false, 0.510, 70961, 7, 3);
INSERT INTO public.star VALUES (5, 'WISE 0855−0714', 'sub-brown dwarf', false, 10.000, 69570, 7, 3);
INSERT INTO public.star VALUES (6, 'Wolf 359', 'flare star, has 1 candidate & 1 refuted planet', false, 1.500, 100181, 8, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

