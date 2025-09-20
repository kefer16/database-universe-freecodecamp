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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    description character varying(100) NOT NULL,
    distance_light_years numeric,
    discovered_year integer
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
    name character varying(45) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(45) NOT NULL,
    description character varying(100) NOT NULL,
    radius_km numeric,
    orbital_period_days numeric,
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
    name character varying(45) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(15,2) NOT NULL,
    number_moons integer NOT NULL,
    population bigint NOT NULL,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45) NOT NULL,
    description character varying(100) NOT NULL,
    mass_solar numeric,
    radius_solar numeric,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, irregular in shape.', 163000, 1519);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Nearest spiral galaxy to the Milky Way, on a collision course.', 2500000, 964);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Galaxy', 'A small elliptical galaxy interacting with the Milky Way.', 70000, 1994);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf Galaxy', 'The closest known galaxy to the Milky Way.', 25000, 2003);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'A spiral galaxy in the Local Group, smaller than the Milky Way.', 3000000, 1654);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'A galaxy with a flat, rotating disk containing stars, gas, and dust, and a central concentration of stars known as the bulge. Example: Milky Way.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'A galaxy with an ellipsoidal shape and a smooth, nearly featureless brightness profile, containing older stars and little gas or dust.');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'A galaxy with no distinct regular shape, often chaotic in appearance, usually rich in gas and dust, forming many new stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth.', 1737, 27.3, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger and closer moon of Mars.', 11.3, 0.3, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller outer moon of Mars.', 6.2, 1.3, 2);
INSERT INTO public.moon VALUES (4, 'Bebos I', 'Gas giant moon with icy surface.', 1500, 12.5, 3);
INSERT INTO public.moon VALUES (5, 'Bebos II', 'Rocky moon orbiting Betelgeuse b.', 800, 20.2, 3);
INSERT INTO public.moon VALUES (6, 'Becos I', 'Small rocky satellite.', 400, 7.8, 4);
INSERT INTO public.moon VALUES (7, 'Rigel I', 'Large icy moon orbiting Rigel b.', 2000, 30.5, 5);
INSERT INTO public.moon VALUES (8, 'Rigel II', 'Volcanic moon with active surface.', 1000, 15.7, 5);
INSERT INTO public.moon VALUES (9, 'Rigel III', 'Dusty barren moon.', 700, 10.4, 5);
INSERT INTO public.moon VALUES (10, 'Rigel IV', 'Icy moon with subsurface ocean.', 1200, 22.9, 6);
INSERT INTO public.moon VALUES (11, 'UY I', 'Massive gas moon orbiting UY Scuti b.', 2500, 40.0, 7);
INSERT INTO public.moon VALUES (12, 'UY II', 'Rocky captured moon.', 600, 18.5, 7);
INSERT INTO public.moon VALUES (13, 'UY III', 'Icy outer moon.', 1100, 28.1, 7);
INSERT INTO public.moon VALUES (14, 'UYc I', 'Super-Earth moon with rocky terrain.', 700, 14.6, 8);
INSERT INTO public.moon VALUES (15, 'Sir I', 'Small rocky moon.', 300, 6.2, 9);
INSERT INTO public.moon VALUES (16, 'Sir II', 'Large icy satellite.', 1800, 32.4, 10);
INSERT INTO public.moon VALUES (17, 'Sir III', 'Moon with thin atmosphere.', 900, 19.1, 10);
INSERT INTO public.moon VALUES (18, 'Veg I', 'Moon with ice geysers.', 500, 12.0, 11);
INSERT INTO public.moon VALUES (19, 'Veg II', 'Barren rocky moon.', 400, 9.8, 12);
INSERT INTO public.moon VALUES (20, 'Veg III', 'Moon with underground oceans.', 1000, 17.2, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet with life, third planet from the Sun.', true, true, 0.00, 1, 8000000000, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet, potential candidate for colonization.', false, true, 225.00, 2, 0, 1);
INSERT INTO public.planet VALUES (3, 'Betelgeuse b', 'A gas giant orbiting Betelgeuse.', false, true, 640000.00, 10, 0, 2);
INSERT INTO public.planet VALUES (4, 'Betelgeuse c', 'A rocky planet in the Betelgeuse system.', false, true, 640000.00, 0, 0, 2);
INSERT INTO public.planet VALUES (5, 'Rigel b', 'Massive exoplanet orbiting the blue supergiant Rigel.', false, true, 860000.00, 4, 0, 3);
INSERT INTO public.planet VALUES (6, 'Rigel c', 'Ice giant with a thick atmosphere.', false, true, 860000.00, 8, 0, 3);
INSERT INTO public.planet VALUES (7, 'UY Scuti b', 'Gas giant orbiting one of the largest known stars.', false, true, 950000.00, 12, 0, 4);
INSERT INTO public.planet VALUES (8, 'UY Scuti c', 'Super-Earth in the UY Scuti system.', false, true, 950000.00, 1, 0, 4);
INSERT INTO public.planet VALUES (9, 'Sirius b I', 'Hypothetical terrestrial planet in the Sirius system.', false, true, 860000.00, 0, 0, 5);
INSERT INTO public.planet VALUES (10, 'Sirius b II', 'Gas giant orbiting Sirius A.', false, true, 860000.00, 6, 0, 5);
INSERT INTO public.planet VALUES (11, 'Vega b', 'A well-known exoplanet candidate orbiting Vega.', false, true, 2500000.00, 0, 0, 6);
INSERT INTO public.planet VALUES (12, 'Vega c', 'Another possible exoplanet around Vega.', false, true, 2500000.00, 2, 0, 6);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Gas Giant', 'Large planet composed mainly of hydrogen and helium, with no well-defined solid surface. Examples: Jupiter, Saturn.');
INSERT INTO public.planet_types VALUES (2, 'Terrestrial', 'Rocky planet with a solid surface, typically smaller and denser. Examples: Earth, Mars.');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planet with a large proportion of water, ammonia, and methane ice, with a thick atmosphere. Examples: Uranus, Neptune.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A G-type main-sequence star, center of the Solar System.', 1.0, 1.0, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant star in the constellation Orion.', 11.6, 887, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue supergiant star, very luminous and massive.', 21.0, 78.9, 3);
INSERT INTO public.star VALUES (4, 'UY Scuti', 'One of the largest known stars, a red supergiant.', 30.0, 1708, 4);
INSERT INTO public.star VALUES (5, 'Sirius A', 'The brightest star in the night sky, white main-sequence.', 2.1, 1.71, 5);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the Lyra constellation, A-type main-sequence.', 2.2, 2.3, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_types unique_galaxy_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unique_galaxy_type_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: planet_types unique_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_type_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star constaint_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constaint_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon constraint_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT constraint_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet constraint_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraint_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

