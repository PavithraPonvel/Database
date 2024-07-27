--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    diameter integer,
    mass integer,
    is_hazardous boolean NOT NULL,
    orbit_description text
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
    diameter numeric(10,2),
    age integer,
    has_black_hole boolean NOT NULL,
    description text
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
    planet_id integer NOT NULL,
    diameter integer,
    orbital_period numeric(10,2),
    is_captured boolean NOT NULL
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
    star_id integer NOT NULL,
    mass integer,
    radius integer,
    has_atmosphere boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    mass integer,
    luminosity numeric(10,2),
    is_red_giant boolean NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, 0, false, 'Orbits between Mars and Jupiter');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 530, 0, false, 'Orbits between Mars and Jupiter');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 560, 0, false, 'Orbits between Mars and Jupiter');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 400, 0, false, 'Orbits between Mars and Jupiter');
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 330, 0, false, 'Orbits between Mars and Jupiter');
INSERT INTO public.asteroid VALUES (6, 'Apohele', 2, 0, true, 'Orbits close to Earth');
INSERT INTO public.asteroid VALUES (7, 'Hermes', 1, 0, true, 'Orbits close to Earth');
INSERT INTO public.asteroid VALUES (8, 'Nemesis', 10, 0, true, 'Orbits close to Earth');
INSERT INTO public.asteroid VALUES (9, 'Toutatis', 5, 0, true, 'Orbits close to Earth');
INSERT INTO public.asteroid VALUES (10, 'Itokawa', 1, 0, false, 'Orbits between Mars and Jupiter');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000.00, 14, true, 'Spiral galaxy containing our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000.00, 9, false, 'Largest nearby galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 100000.00, 11, true, 'Spiral galaxy with a bright central core');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 70000.00, 13, true, 'Unbarred spiral galaxy with a large central bulge');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 170000.00, 11, false, 'Face-on spiral galaxy with a bright central core');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 37000.00, 12, true, 'Irregular galaxy with a bright central core');
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 55000.00, 12, false, 'Spiral galaxy with a dark dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475, 27.30, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0.30, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1.30, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, 4260, 42.50, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4879, 85.20, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262, 151.90, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 183.60, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 16.00, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 33.20, false);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 1123, 66.00, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1528, 108.50, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1060, 45.30, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 486, 22.60, false);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 270, 21.30, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 1471, 79.30, false);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, 213, 550.50, true);
INSERT INTO public.moon VALUES (17, 'Janus', 6, 178, 16.70, false);
INSERT INTO public.moon VALUES (18, 'Epimetheus', 6, 119, 16.70, false);
INSERT INTO public.moon VALUES (19, 'Prometheus', 6, 136, 14.70, false);
INSERT INTO public.moon VALUES (20, 'Pandora', 6, 104, 15.10, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0, 3389, true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 1, 6051, true);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0, 2439, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 318, 69911, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95, 58232, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 15, 25362, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17, 24622, true);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 4, 5, 6300, false);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 5, 1, 5780, true);
INSERT INTO public.planet VALUES (11, 'Proxima b', 6, 0, 3000, false);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 7, 8, 16000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 1.00, false);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 20, 100000.00, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2, 25.00, false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, 1, 1.50, false);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 21, 66000.00, false);
INSERT INTO public.star VALUES (6, 'Deneb', 3, 20, 200000.00, false);
INSERT INTO public.star VALUES (7, 'Antares', 4, 15, 10000.00, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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

