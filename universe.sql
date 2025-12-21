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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer NOT NULL,
    visibility_latitude_range character varying(50),
    best_viewing_season character varying(50) NOT NULL,
    contains_bright_star boolean NOT NULL,
    mythological_significance text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_stars integer,
    distance_from_earth_in_light_years numeric(15,2),
    is_visible_to_naked_eye boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    distance_from_planet_in_km numeric(15,2),
    orbital_period_in_earth_days numeric(10,4),
    has_atmosphere boolean NOT NULL,
    is_geologically_active boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type_of_planet character varying(50) NOT NULL,
    distance_from_star_in_million_km numeric(15,2),
    orbital_period_in_earth_days integer,
    has_atmosphere boolean NOT NULL,
    is_habitable boolean NOT NULL,
    number_of_moons integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    distance_from_earth_in_light_years numeric(15,2),
    is_binary boolean NOT NULL,
    is_main_sequence boolean NOT NULL,
    mass_in_solar_masses numeric(10,2)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 7, 'Both Hemispheres', 'Winter', true, 'Hunter from Greek mythology');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 7, 'Northern Hemisphere', 'Spring', true, 'Great Bear in Greek mythology');
INSERT INTO public.constellation VALUES (3, 'Centaurus', 11, 'Southern Hemisphere', 'Spring', true, 'Centaur from ancient mythology');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 1000, 0.00, true, true, 'Our home galaxy, a barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1000, 2537000.00, true, true, 'Nearest large galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 8000, 4000, 3000000.00, false, false, 'Small spiral galaxy in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 12000, 3000, 160000.00, true, false, 'Satellite galaxy of Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 13000, 300, 197000.00, true, false, 'Smaller satellite galaxy of Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 9000, 1000, 31000000.00, false, true, 'Classic spiral galaxy with dust lanes');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 3474, 384400.00, 27.3220, false, false);
INSERT INTO public.moon VALUES (2, 'Io', 5, 3643, 421700.00, 1.7691, false, true);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 3122, 671100.00, 3.5512, false, false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 5268, 1070400.00, 7.1552, false, false);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 4821, 1882600.00, 16.6890, false, false);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 5150, 1222000.00, 15.9450, true, true);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, 504, 238000.00, 1.3700, true, true);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, 185500.00, 0.9424, false, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1527, 527108.00, 4.5175, false, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469, 3560820.00, 79.3202, false, false);
INSERT INTO public.moon VALUES (11, 'Phobos', 4, 23, 9376.00, 0.3189, false, false);
INSERT INTO public.moon VALUES (12, 'Deimos', 4, 13, 23463.00, 1.2624, false, false);
INSERT INTO public.moon VALUES (13, 'Luna Alpha', 7, 2800, 120000.00, 15.0000, false, false);
INSERT INTO public.moon VALUES (14, 'Luna Beta', 7, 1500, 250000.00, 45.0000, false, false);
INSERT INTO public.moon VALUES (15, 'Centauri Moon 1', 8, 800, 50000.00, 10.0000, false, false);
INSERT INTO public.moon VALUES (16, 'Sirius Moon', 9, 500, 20000.00, 5.0000, false, false);
INSERT INTO public.moon VALUES (17, 'Betelgeuse Moon 1', 10, 5000, 500000.00, 100.0000, false, true);
INSERT INTO public.moon VALUES (18, 'Betelgeuse Moon 2', 10, 3000, 800000.00, 150.0000, false, false);
INSERT INTO public.moon VALUES (19, 'Aldebaran Moon 1', 11, 2000, 100000.00, 50.0000, false, false);
INSERT INTO public.moon VALUES (20, 'Rigel Moon', 12, 1000, 75000.00, 25.0000, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 57.91, 88, false, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 108.20, 225, true, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 149.60, 365, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 227.92, 687, true, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 778.50, 4333, true, false, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 1434.00, 10759, true, false, 83);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 2, 'Terrestrial', 7.50, 11, true, true, 0);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri d', 2, 'Super-Earth', 0.40, 5, false, false, 0);
INSERT INTO public.planet VALUES (9, 'Sirius Ab', 3, 'Terrestrial', 1.00, 100, false, false, 0);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 4, 'Gas Giant', 10.00, 500, true, false, 5);
INSERT INTO public.planet VALUES (11, 'Aldebaran b', 5, 'Gas Giant', 1.46, 629, true, false, 3);
INSERT INTO public.planet VALUES (12, 'Rigel I', 6, 'Terrestrial', 50.00, 800, false, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5778, 0.00, false, true, 1.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 4.24, true, true, 0.12);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 8.60, true, true, 2.02);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 640.00, false, false, 16.50);
INSERT INTO public.star VALUES (5, 'Aldebaran', 1, 3900, 65.10, false, false, 1.16);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 11000, 860.00, false, false, 17.00);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

