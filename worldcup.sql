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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (28, 2018, 'Final', 46, 47, 4, 2);
INSERT INTO public.games VALUES (29, 2018, 'Third Place', 48, 49, 2, 0);
INSERT INTO public.games VALUES (30, 2018, 'Semi-Final', 47, 49, 2, 1);
INSERT INTO public.games VALUES (31, 2018, 'Semi-Final', 46, 48, 1, 0);
INSERT INTO public.games VALUES (32, 2018, 'Quarter-Final', 47, 50, 3, 2);
INSERT INTO public.games VALUES (33, 2018, 'Quarter-Final', 49, 51, 2, 0);
INSERT INTO public.games VALUES (34, 2018, 'Quarter-Final', 48, 52, 2, 1);
INSERT INTO public.games VALUES (35, 2018, 'Quarter-Final', 46, 53, 2, 0);
INSERT INTO public.games VALUES (36, 2018, 'Eighth-Final', 49, 54, 2, 1);
INSERT INTO public.games VALUES (37, 2018, 'Eighth-Final', 51, 55, 1, 0);
INSERT INTO public.games VALUES (38, 2018, 'Eighth-Final', 48, 56, 3, 2);
INSERT INTO public.games VALUES (39, 2018, 'Eighth-Final', 52, 57, 2, 0);
INSERT INTO public.games VALUES (40, 2018, 'Eighth-Final', 47, 58, 2, 1);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 50, 59, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 53, 60, 2, 1);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 46, 61, 4, 3);
INSERT INTO public.games VALUES (44, 2014, 'Final', 62, 61, 1, 0);
INSERT INTO public.games VALUES (45, 2014, 'Third Place', 63, 52, 3, 0);
INSERT INTO public.games VALUES (46, 2014, 'Semi-Final', 61, 63, 1, 0);
INSERT INTO public.games VALUES (47, 2014, 'Semi-Final', 62, 52, 7, 1);
INSERT INTO public.games VALUES (48, 2014, 'Quarter-Final', 63, 64, 1, 0);
INSERT INTO public.games VALUES (49, 2014, 'Quarter-Final', 61, 48, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Quarter-Final', 52, 54, 2, 1);
INSERT INTO public.games VALUES (51, 2014, 'Quarter-Final', 62, 46, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Eighth-Final', 52, 65, 2, 1);
INSERT INTO public.games VALUES (53, 2014, 'Eighth-Final', 54, 53, 2, 0);
INSERT INTO public.games VALUES (54, 2014, 'Eighth-Final', 46, 66, 2, 0);
INSERT INTO public.games VALUES (55, 2014, 'Eighth-Final', 62, 67, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Eighth-Final', 63, 57, 2, 1);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 64, 68, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 61, 55, 1, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 48, 69, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (46, 'France');
INSERT INTO public.teams VALUES (47, 'Croatia');
INSERT INTO public.teams VALUES (48, 'Belgium');
INSERT INTO public.teams VALUES (49, 'England');
INSERT INTO public.teams VALUES (50, 'Russia');
INSERT INTO public.teams VALUES (51, 'Sweden');
INSERT INTO public.teams VALUES (52, 'Brazil');
INSERT INTO public.teams VALUES (53, 'Uruguay');
INSERT INTO public.teams VALUES (54, 'Colombia');
INSERT INTO public.teams VALUES (55, 'Switzerland');
INSERT INTO public.teams VALUES (56, 'Japan');
INSERT INTO public.teams VALUES (57, 'Mexico');
INSERT INTO public.teams VALUES (58, 'Denmark');
INSERT INTO public.teams VALUES (59, 'Spain');
INSERT INTO public.teams VALUES (60, 'Portugal');
INSERT INTO public.teams VALUES (61, 'Argentina');
INSERT INTO public.teams VALUES (62, 'Germany');
INSERT INTO public.teams VALUES (63, 'Netherlands');
INSERT INTO public.teams VALUES (64, 'Costa Rica');
INSERT INTO public.teams VALUES (65, 'Chile');
INSERT INTO public.teams VALUES (66, 'Nigeria');
INSERT INTO public.teams VALUES (67, 'Algeria');
INSERT INTO public.teams VALUES (68, 'Greece');
INSERT INTO public.teams VALUES (69, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 59, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 69, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

