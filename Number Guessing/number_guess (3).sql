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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    player_id integer,
    games_played integer DEFAULT 1,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22),
    player_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 1, 633);
INSERT INTO public.games VALUES (3, 1, 752);
INSERT INTO public.games VALUES (4, 1, 771);
INSERT INTO public.games VALUES (4, 1, 729);
INSERT INTO public.games VALUES (3, 1, 474);
INSERT INTO public.games VALUES (3, 1, 232);
INSERT INTO public.games VALUES (3, 1, 846);
INSERT INTO public.games VALUES (5, 1, 783);
INSERT INTO public.games VALUES (5, 1, 397);
INSERT INTO public.games VALUES (6, 1, 776);
INSERT INTO public.games VALUES (6, 1, 509);
INSERT INTO public.games VALUES (5, 1, 336);
INSERT INTO public.games VALUES (5, 1, 992);
INSERT INTO public.games VALUES (5, 1, 839);
INSERT INTO public.games VALUES (7, 1, 1);
INSERT INTO public.games VALUES (8, 1, 1);
INSERT INTO public.games VALUES (9, 1, 532);
INSERT INTO public.games VALUES (10, 1, 797);
INSERT INTO public.games VALUES (11, 1, 723);
INSERT INTO public.games VALUES (12, 1, 350);
INSERT INTO public.games VALUES (13, 1, 792);
INSERT INTO public.games VALUES (14, 1, 759);
INSERT INTO public.games VALUES (15, 1, 339);
INSERT INTO public.games VALUES (16, 1, 937);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1724244348716', 1);
INSERT INTO public.players VALUES ('user_1724244348715', 2);
INSERT INTO public.players VALUES ('user_1724247176814', 3);
INSERT INTO public.players VALUES ('user_1724247176813', 4);
INSERT INTO public.players VALUES ('user_1724247247623', 5);
INSERT INTO public.players VALUES ('user_1724247247622', 6);
INSERT INTO public.players VALUES ('user_1724247941310', 7);
INSERT INTO public.players VALUES ('user_1724247941309', 8);
INSERT INTO public.players VALUES ('user_1724248531326', 9);
INSERT INTO public.players VALUES ('user_1724248531325', 10);
INSERT INTO public.players VALUES ('user_1724248572889', 11);
INSERT INTO public.players VALUES ('user_1724248572888', 12);
INSERT INTO public.players VALUES ('user_1724248658291', 13);
INSERT INTO public.players VALUES ('user_1724248658290', 14);
INSERT INTO public.players VALUES ('user_1724248713325', 15);
INSERT INTO public.players VALUES ('user_1724248713324', 16);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 16, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

