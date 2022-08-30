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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2),
    has_life boolean,
    galaxy_type_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2)
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth numeric(6,2),
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
    name character varying(20) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(6,2),
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy one', 'description of galaxy one', true, 15000, 9.88, true, 1);
INSERT INTO public.galaxy VALUES (2, 'galaxy two', 'description of galaxy two', false, 30000, 120.45, false, 1);
INSERT INTO public.galaxy VALUES (3, 'galaxy three', 'description of galaxy three', false, 35000, 130.45, false, 2);
INSERT INTO public.galaxy VALUES (4, 'galaxy four', 'description of galaxy four', false, 40000, 140.45, false, 3);
INSERT INTO public.galaxy VALUES (5, 'galaxy five', 'description of galaxy five', true, 45000, 150.45, true, 4);
INSERT INTO public.galaxy VALUES (6, 'galaxy six', 'description of galaxy six', true, 46000, 160.45, true, 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'galaxy type one', 'description of galaxy type one');
INSERT INTO public.galaxy_types VALUES (2, 'galaxy type two', 'description of galaxy type two');
INSERT INTO public.galaxy_types VALUES (3, 'galaxy type three', 'description of galaxy type three');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, 'our moon', false, true, 30000, 0.01);
INSERT INTO public.moon VALUES (2, 'moon two', 4, 'description of moon two', false, true, 30000, 0.02);
INSERT INTO public.moon VALUES (3, 'moon three', 4, 'description of moon three', false, true, 31000, 0.03);
INSERT INTO public.moon VALUES (4, 'moon four', 4, 'description of moon four', false, true, 32000, 0.04);
INSERT INTO public.moon VALUES (5, 'moon five', 4, 'description of moon five', false, true, 33000, 0.05);
INSERT INTO public.moon VALUES (6, 'moon six', 4, 'description of moon six', false, true, 34000, 0.06);
INSERT INTO public.moon VALUES (7, 'moon seven', 4, 'description of moon seven', false, true, 35000, 0.07);
INSERT INTO public.moon VALUES (8, 'moon eight', 4, 'description of moon eight', false, true, 38000, 0.08);
INSERT INTO public.moon VALUES (9, 'moon nine', 5, 'description of moon nine', false, true, 39000, 0.09);
INSERT INTO public.moon VALUES (10, 'moon ten', 5, 'description of moon ten', false, false, 40000, 0.10);
INSERT INTO public.moon VALUES (11, 'moon eleven', 5, 'description of moon eleven', false, true, 41000, 0.11);
INSERT INTO public.moon VALUES (12, 'moon twelve', 5, 'description of moon twelve', false, true, 42000, 0.12);
INSERT INTO public.moon VALUES (13, 'moon thirteen', 6, 'description of moon thirteen', false, true, 43000, 0.13);
INSERT INTO public.moon VALUES (14, 'moon fourteen', 6, 'description of moon fourteen', false, true, 44000, 0.14);
INSERT INTO public.moon VALUES (15, 'moon fifteen', 6, 'description of moon fifteen', false, true, 45000, 0.15);
INSERT INTO public.moon VALUES (16, 'moon sixteen', 7, 'description of moon sixteen', false, true, 46000, 0.16);
INSERT INTO public.moon VALUES (17, 'moon seventeen', 7, 'description of moon seventeen', false, true, 47000, 0.17);
INSERT INTO public.moon VALUES (18, 'moon eighteen', 8, 'description of moon eighteen', false, true, 48000, 0.18);
INSERT INTO public.moon VALUES (19, 'moon nineteen', 9, 'description of moon nineteen', false, true, 49000, 0.19);
INSERT INTO public.moon VALUES (20, 'moon twenty', 10, 'description of moon twenty', false, true, 50000, 0.20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'our planet', true, true, 30000, 'planet type one', 0.00, 1);
INSERT INTO public.planet VALUES (2, 'planet two', 'description of  planet two', false, true, 30000, 'planet type one', 100.00, 1);
INSERT INTO public.planet VALUES (3, 'planet three', 'description of  planet three', false, true, 31000, 'planet type one', 1.00, 1);
INSERT INTO public.planet VALUES (4, 'planet four', 'description of  planet four', false, true, 32000, 'planet type one', 1.10, 1);
INSERT INTO public.planet VALUES (5, 'planet five', 'description of  planet five', false, true, 33000, 'planet type two', 1.20, 1);
INSERT INTO public.planet VALUES (6, 'planet six', 'description of  planet six', false, true, 34000, 'planet type one', 1.30, 1);
INSERT INTO public.planet VALUES (7, 'planet seven', 'description of  planet seven', false, true, 35000, 'planet type one', 1.40, 1);
INSERT INTO public.planet VALUES (8, 'planet eight', 'description of planet eight', false, true, 36000, 'planet type three', 1.50, 1);
INSERT INTO public.planet VALUES (9, 'planet nine', 'description of planet nine', false, true, 37000, 'planet type one', 1.60, 1);
INSERT INTO public.planet VALUES (10, 'planet ten', 'description of planet ten', false, true, 7000, 'planet type one', 45.60, 2);
INSERT INTO public.planet VALUES (11, 'planet eleven', 'description of planet eleven', false, true, 8000, 'planet type four', 45.70, 2);
INSERT INTO public.planet VALUES (12, 'planet twelve', 'description of planet twelve', false, true, 9000, 'planet type one', 45.80, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'description of sun', true, 39000, 0.01, 1);
INSERT INTO public.star VALUES (2, 'star two', 'description of star two', true, 40000, 4.00, 1);
INSERT INTO public.star VALUES (3, 'star three', 'description of star three', true, 50000, 18.00, 2);
INSERT INTO public.star VALUES (4, 'star four', 'description of star four', true, 60000, 28.00, 3);
INSERT INTO public.star VALUES (5, 'star five', 'description of star five', true, 70000, 38.00, 4);
INSERT INTO public.star VALUES (6, 'star six', 'description of star six', true, 80000, 48.00, 4);


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
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

