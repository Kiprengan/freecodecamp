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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(8,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(8,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(8,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 'The galaxy that contains our Solar System.', 13600, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, true, 'The nearest spiral galaxy to the Milky Way.', 10000, 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, true, 'The third largest galaxy in the Local Group.', 12000, 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', false, true, 'A classic spiral galaxy in the constellation Canes Venatici.', 6000, 23000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', false, true, 'A galaxy in the constellation Virgo, known for its bright nucleus and large central bulge.', 10000, 31200000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', false, true, 'A face-on spiral galaxy in the constellation Ursa Major.', 9000, 21000000.00);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', false, true, 'A galaxy in the constellation Centaurus, known for its peculiar shape.', 11000, 13000000.00);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', false, true, 'A supergiant elliptical galaxy in the constellation Virgo.', 13000, 53800000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (25, 'Luna', false, true, 'The Earths natural satellite.', 4500, 0.38, 18);
INSERT INTO public.moon VALUES (26, 'Phobos', false, true, 'Moon of Mars.', 4500, 0.02, 19);
INSERT INTO public.moon VALUES (27, 'Deimos', false, true, 'Moon of Mars.', 4500, 0.02, 19);
INSERT INTO public.moon VALUES (28, 'Europa', true, true, 'Moon of Jupiter, potentially habitable.', 4500, 670.90, 20);
INSERT INTO public.moon VALUES (29, 'Ganymede', true, true, 'Moon of Jupiter, largest moon in the Solar System.', 4500, 1070.40, 20);
INSERT INTO public.moon VALUES (30, 'Callisto', false, true, 'Moon of Jupiter, heavily cratered.', 4500, 1882.70, 20);
INSERT INTO public.moon VALUES (31, 'Io', false, true, 'Moon of Jupiter, volcanic activity.', 4500, 421.70, 20);
INSERT INTO public.moon VALUES (32, 'Titan', true, true, 'Moon of Saturn, with an atmosphere.', 4500, 1221.90, 21);
INSERT INTO public.moon VALUES (33, 'Enceladus', true, true, 'Moon of Saturn, icy surface with geysers.', 4500, 238.00, 21);
INSERT INTO public.moon VALUES (34, 'Mimas', false, true, 'Moon of Saturn, known for its large crater.', 4500, 185.50, 21);
INSERT INTO public.moon VALUES (35, 'Rhea', false, true, 'Moon of Saturn, with a wispy atmosphere.', 4500, 527.10, 21);
INSERT INTO public.moon VALUES (36, 'Dione', false, true, 'Moon of Saturn, icy surface.', 4500, 377.40, 21);
INSERT INTO public.moon VALUES (37, 'Triton', false, true, 'Moon of Neptune, with cryovolcanism.', 4500, 354.80, 22);
INSERT INTO public.moon VALUES (38, 'Proteus', false, true, 'Moon of Neptune, irregular shape.', 4500, 1176.70, 22);
INSERT INTO public.moon VALUES (39, 'Charon', false, true, 'Moon of Pluto, almost half the size of Pluto.', 4500, 19.60, 23);
INSERT INTO public.moon VALUES (40, 'Nereid', false, true, 'Moon of Neptune, irregular orbit.', 4500, 5513.70, 22);
INSERT INTO public.moon VALUES (41, 'Oberon', false, true, 'Moon of Uranus, heavily cratered.', 4500, 583.50, 24);
INSERT INTO public.moon VALUES (42, 'Titania', false, true, 'Moon of Uranus, dense atmosphere.', 4500, 435.90, 24);
INSERT INTO public.moon VALUES (43, 'Umbriel', false, true, 'Moon of Uranus, dark surface.', 4500, 266.00, 24);
INSERT INTO public.moon VALUES (44, 'Ariel', false, true, 'Moon of Uranus, smooth surface.', 4500, 191.00, 24);
INSERT INTO public.moon VALUES (45, 'Miranda', false, true, 'Moon of Uranus, chaotic terrain.', 4500, 129.80, 24);
INSERT INTO public.moon VALUES (46, 'Io II', false, true, 'A moon of Jupiter, torn apart by tidal forces.', 4500, 400.10, 20);
INSERT INTO public.moon VALUES (47, 'Carme', false, true, 'An irregular retrograde moon of Jupiter.', 4500, 226.30, 20);
INSERT INTO public.moon VALUES (48, 'Himalia', false, true, 'A prograde irregular moon of Jupiter.', 4500, 1149.60, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 'Mercury', false, true, 'Closest planet to the Sun.', 4500, 57.91, 1);
INSERT INTO public.planet VALUES (17, 'Venus', false, true, 'Second planet from the Sun.', 4500, 108.20, 1);
INSERT INTO public.planet VALUES (18, 'Earth', true, true, 'Third planet from the Sun, our home planet.', 4500, 149.60, 1);
INSERT INTO public.planet VALUES (19, 'Mars', false, true, 'Fourth planet from the Sun, the Red Planet.', 4500, 227.90, 1);
INSERT INTO public.planet VALUES (20, 'Jupiter', false, true, 'Fifth planet from the Sun, largest in our Solar System.', 4500, 778.50, 2);
INSERT INTO public.planet VALUES (21, 'Saturn', false, true, 'Sixth planet from the Sun, known for its rings.', 4500, 1433.50, 2);
INSERT INTO public.planet VALUES (22, 'Uranus', false, true, 'Seventh planet from the Sun, tilted axis.', 4500, 2872.50, 2);
INSERT INTO public.planet VALUES (23, 'Neptune', false, true, 'Eighth planet from the Sun, furthest known.', 4500, 4495.10, 2);
INSERT INTO public.planet VALUES (24, 'Proxima b', true, true, 'Exoplanet orbiting Proxima Centauri.', 4500, 4.24, 3);
INSERT INTO public.planet VALUES (25, 'Barnard b', false, true, 'Potential super-Earth orbiting Barnards Star.', 4500, 5.96, 3);
INSERT INTO public.planet VALUES (26, 'Luyten b', false, true, 'Exoplanet orbiting Luytens Star.', 4500, 12.37, 3);
INSERT INTO public.planet VALUES (27, 'Kapteyn b', true, true, 'Exoplanet orbiting Kapteyns Star.', 11000, 12.78, 4);
INSERT INTO public.planet VALUES (28, 'Wolf 1061c', false, true, 'Exoplanet orbiting Wolf 1061.', 14000, 13.80, 4);
INSERT INTO public.planet VALUES (29, 'GJ 1214 b', false, true, 'Potential water world orbiting GJ 1214.', 3000, 40.00, 4);
INSERT INTO public.planet VALUES (30, 'TRAPPIST-1d', true, true, 'Exoplanet in the TRAPPIST-1 system.', 1000, 39.00, 5);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (8, 'Sputnik 1', 25);
INSERT INTO public.satellite VALUES (9, 'Hubble Space Telescope', 26);
INSERT INTO public.satellite VALUES (10, 'International Space Station', 27);
INSERT INTO public.satellite VALUES (11, 'Landsat 7', 28);
INSERT INTO public.satellite VALUES (12, 'GPS Satellite', 29);
INSERT INTO public.satellite VALUES (13, 'Communications Satellite', 30);
INSERT INTO public.satellite VALUES (14, 'Weather Satellite', 31);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', false, true, 'The brightest star in the night sky.', 300, 8.60, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, true, 'A red supergiant star in the constellation Orion.', 800, 642.50, 2);
INSERT INTO public.star VALUES (3, 'Rigel', false, true, 'The brightest star in the constellation Orion.', 860, 863.00, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', true, true, 'The closest known star to the Sun.', 4500, 4.24, 4);
INSERT INTO public.star VALUES (5, 'Vega', false, true, 'The fifth-brightest star in the night sky.', 455, 25.00, 5);
INSERT INTO public.star VALUES (6, 'Antares', false, true, 'The fifteenth-brightest star in the night sky.', 1200, 554.00, 6);
INSERT INTO public.star VALUES (7, 'Aldebaran', false, true, 'The brightest star in the constellation Taurus.', 650, 65.30, 7);
INSERT INTO public.star VALUES (8, 'Polaris', false, true, 'The current North Star.', 700, 323.00, 8);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 48, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 30, true);


--
-- Name: satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: satellite unique_name_satellite; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_name_satellite UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: satellite fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


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

