--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: earth_population; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth_population (
    earth_population_id integer NOT NULL,
    year integer NOT NULL,
    population_millions integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.earth_population OWNER TO freecodecamp;

--
-- Name: earth_population_population_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_population_population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_population_population_id_seq OWNER TO freecodecamp;

--
-- Name: earth_population_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_population_population_id_seq OWNED BY public.earth_population.earth_population_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    galaxy_type character varying(30),
    age_in_millions_of_years character varying(30)
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
    name character varying(50),
    age_in_millions_of_years numeric(3,1),
    has_life boolean,
    planet_id integer NOT NULL
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
    name character varying(50),
    planet_type text,
    distance_from_earth_in_light_years integer,
    star_id integer NOT NULL
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
    name character varying(50),
    description text,
    distance_from_earth_in_light_years integer,
    galaxy_id integer NOT NULL
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
-- Name: earth_population earth_population_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_population ALTER COLUMN earth_population_id SET DEFAULT nextval('public.earth_population_population_id_seq'::regclass);


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
-- Data for Name: earth_population; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth_population VALUES (1, 600, 200, NULL);
INSERT INTO public.earth_population VALUES (2, 1000, 275, NULL);
INSERT INTO public.earth_population VALUES (3, 2000, 6500, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda is the cloest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 years from now', false, 'Spiral', '5000-10000');
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'The name is like this because the apprearance is similar to an insect antennae. Two colliding galaxies.', false, 'Spiral', '400-800');
INSERT INTO public.galaxy VALUES (3, 'Backward', 'It appears to rotate backwards as the tips of the spiral arms point in the dirextion of rotation.', false, 'Spiral', '800-1200');
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', 'It resembles the appearance of a bears claw', false, 'Elliptical', '1300-1400');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames', false, 'Spiral', '900-1100');
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'The galaxy we live in', true, 'Spiral', '136000');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Kepler-80g I', 10.0, false, 1);
INSERT INTO public.moon VALUES (2, 'Kepler-80g II', 2.5, false, 1);
INSERT INTO public.moon VALUES (3, 'Kepler-80g III', 5.0, false, 1);
INSERT INTO public.moon VALUES (4, 'Kepler-80g IV', 7.5, false, 1);
INSERT INTO public.moon VALUES (5, 'Kepler-452b I', 2.0, false, 2);
INSERT INTO public.moon VALUES (6, 'Kepler-452b II', 4.5, false, 2);
INSERT INTO public.moon VALUES (7, 'Kepler-452b III', 7.0, false, 2);
INSERT INTO public.moon VALUES (8, 'Kepler-452b IV', 9.5, false, 2);
INSERT INTO public.moon VALUES (9, 'HD 214612 b I', 5.0, false, 3);
INSERT INTO public.moon VALUES (10, 'HD 214612 b II', 10.5, false, 3);
INSERT INTO public.moon VALUES (11, 'HD 214612 b III', 14.0, false, 3);
INSERT INTO public.moon VALUES (12, 'HD 214612 b IV', 18.5, false, 3);
INSERT INTO public.moon VALUES (13, 'HD 221287 b I', 3.0, false, 4);
INSERT INTO public.moon VALUES (14, 'HD 221287 b II', 6.5, false, 4);
INSERT INTO public.moon VALUES (15, 'HD 221287 b III', 10.0, false, 4);
INSERT INTO public.moon VALUES (16, 'HD 221287 b IV', 13.5, false, 4);
INSERT INTO public.moon VALUES (17, 'WASP-17b I', 6.0, false, 5);
INSERT INTO public.moon VALUES (18, 'WASP-17b II', 9.5, false, 5);
INSERT INTO public.moon VALUES (19, 'WASP-17b III', 13.0, false, 5);
INSERT INTO public.moon VALUES (20, 'WASP-17b IV', 16.5, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-80g', 'Rocky exoplanet', 1164, 1);
INSERT INTO public.planet VALUES (2, 'Kepler-452b', 'Super-Earth exoplanet', 1400, 1);
INSERT INTO public.planet VALUES (4, 'HD 221287', 'Hot Jupiter exoplanet', 10000, 2);
INSERT INTO public.planet VALUES (5, 'WASP-17b', 'Hot Jupiter exoplanet', 2300, 3);
INSERT INTO public.planet VALUES (6, 'HD 21749', 'Hot Neptune exoplanet', 750, 3);
INSERT INTO public.planet VALUES (7, '55 Cancri e', 'Hot Neptune exoplanet', 42, 4);
INSERT INTO public.planet VALUES (8, 'Giliese 581 d', 'Super-Earth exoplanet', 21, 4);
INSERT INTO public.planet VALUES (9, 'Kepler-42 b', 'Hot Jupiter exoplanet', 1140, 5);
INSERT INTO public.planet VALUES (10, 'HD 215406 b', 'Hot Jupiter exoplanet', 520, 5);
INSERT INTO public.planet VALUES (11, 'Kepler-10c', 'Rocky exoplanet', 5100, 6);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Super-Earth exoplanet', 620, 6);
INSERT INTO public.planet VALUES (3, 'HD 214612 b', 'Hot Jupiter exoplanet', 9900, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Rigel Kentaurus', 'It is a blue supergiant star located in the constellation Centaurus', 168000, 1);
INSERT INTO public.star VALUES (2, 'Eta Carrinae', 'It is a blue variable star located in the constellation Carina', 7700, 2);
INSERT INTO public.star VALUES (3, 'V392 Persei', 'It is a binary star, known for its short-period outbursts', 6500, 3);
INSERT INTO public.star VALUES (4, 'RCW 103', 'Young open cluster located in the constellation Ursa Major', 6500, 4);
INSERT INTO public.star VALUES (5, 'S Doradus', 'It is a red supergiant star. One of the most luminous stars known.', 180000, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'It is a red darf star. Nearest star to the Sun', 4, 6);


--
-- Name: earth_population_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_population_population_id_seq', 3, true);


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
-- Name: earth_population earth_population_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_population
    ADD CONSTRAINT earth_population_name_key UNIQUE (name);


--
-- Name: earth_population earth_population_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_population
    ADD CONSTRAINT earth_population_pkey PRIMARY KEY (earth_population_id);


--
-- Name: earth_population earth_population_population_millions_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_population
    ADD CONSTRAINT earth_population_population_millions_key UNIQUE (population_millions);


--
-- Name: earth_population earth_population_year_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_population
    ADD CONSTRAINT earth_population_year_key UNIQUE (year);


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
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

