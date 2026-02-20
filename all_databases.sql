--
-- PostgreSQL database cluster dump
--

\restrict fhdr45jP0uPjBnWHnNgrU0GgQA6cKm26y6S9yyzmA9RJdheN3aaRbeKScAbRtGz

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE gameuser;
ALTER ROLE gameuser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:twwwzuHWs2fUCx5bey7rmg==$h90gIbE+/qPUmeeKn+0SW9IgczNSACYyNnE5U6PDMao=:pjK3h6eJxv/wUsq9iyQj6rA9qsV2hIONpSlXRJaHV4Y=';

--
-- User Configurations
--








\unrestrict fhdr45jP0uPjBnWHnNgrU0GgQA6cKm26y6S9yyzmA9RJdheN3aaRbeKScAbRtGz

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict IrOEvflBeOtVl35fW8ARQNd77VWfPGfMqV1ndak6cuWda4Pvcmqaj17N9MbQR3M

-- Dumped from database version 15.16
-- Dumped by pg_dump version 15.16

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

--
-- PostgreSQL database dump complete
--

\unrestrict IrOEvflBeOtVl35fW8ARQNd77VWfPGfMqV1ndak6cuWda4Pvcmqaj17N9MbQR3M

--
-- Database "humor_memory_game" dump
--

--
-- PostgreSQL database dump
--

\restrict be7SSyY8qhAp7fmzAgLr8oyMGap3WGNeRKSppsjd8ajtbVqP9HInf8rnPmD3jAS

-- Dumped from database version 15.16
-- Dumped by pg_dump version 15.16

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

--
-- Name: humor_memory_game; Type: DATABASE; Schema: -; Owner: gameuser
--

CREATE DATABASE humor_memory_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE humor_memory_game OWNER TO gameuser;

\unrestrict be7SSyY8qhAp7fmzAgLr8oyMGap3WGNeRKSppsjd8ajtbVqP9HInf8rnPmD3jAS
\connect humor_memory_game
\restrict be7SSyY8qhAp7fmzAgLr8oyMGap3WGNeRKSppsjd8ajtbVqP9HInf8rnPmD3jAS

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: update_user_stats(); Type: FUNCTION; Schema: public; Owner: gameuser
--

CREATE FUNCTION public.update_user_stats() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Only update if game is being marked as completed
    IF NEW.game_completed = true AND (OLD.game_completed = false OR OLD.game_completed IS NULL) THEN
        UPDATE users 
        SET 
            total_games = total_games + 1,
            total_score = total_score + NEW.score,
            best_score = GREATEST(best_score, NEW.score),
            best_time = CASE 
                WHEN best_time IS NULL OR NEW.time_elapsed < best_time 
                THEN NEW.time_elapsed 
                ELSE best_time 
            END,
            last_played = NEW.completed_at,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = NEW.user_id;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_user_stats() OWNER TO gameuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: game_matches; Type: TABLE; Schema: public; Owner: gameuser
--

CREATE TABLE public.game_matches (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    game_id uuid,
    card1_id character varying(50) NOT NULL,
    card2_id character varying(50) NOT NULL,
    match_time integer NOT NULL,
    points_earned integer DEFAULT 10,
    bonus_points integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.game_matches OWNER TO gameuser;

--
-- Name: games; Type: TABLE; Schema: public; Owner: gameuser
--

CREATE TABLE public.games (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    username character varying(50) NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    moves integer DEFAULT 0 NOT NULL,
    time_elapsed integer DEFAULT 0 NOT NULL,
    cards_matched integer DEFAULT 0 NOT NULL,
    difficulty_level character varying(20) DEFAULT 'easy'::character varying,
    game_completed boolean DEFAULT false,
    started_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    completed_at timestamp with time zone,
    game_data jsonb
);


ALTER TABLE public.games OWNER TO gameuser;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gameuser
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100),
    display_name character varying(100),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    last_played timestamp with time zone,
    total_games integer DEFAULT 0,
    total_score integer DEFAULT 0,
    best_score integer DEFAULT 0,
    best_time integer,
    is_active boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO gameuser;

--
-- Name: leaderboard; Type: VIEW; Schema: public; Owner: gameuser
--

CREATE VIEW public.leaderboard AS
 SELECT u.username,
    u.display_name,
    u.total_games,
    u.total_score,
    u.best_score,
    u.best_time,
    u.last_played,
        CASE
            WHEN (u.total_games > 0) THEN round(((u.total_score)::numeric / (u.total_games)::numeric), 2)
            ELSE (0)::numeric
        END AS avg_score,
    row_number() OVER (ORDER BY u.best_score DESC, u.best_time) AS rank
   FROM public.users u
  WHERE ((u.is_active = true) AND (u.total_games > 0))
  ORDER BY u.best_score DESC, u.best_time;


ALTER TABLE public.leaderboard OWNER TO gameuser;

--
-- Data for Name: game_matches; Type: TABLE DATA; Schema: public; Owner: gameuser
--

COPY public.game_matches (id, game_id, card1_id, card2_id, match_time, points_earned, bonus_points, created_at) FROM stdin;
0dd4e5e1-c9ee-4367-a68e-b6c0e097bc4d	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	zany_2	zany_1	22499	10	0	2026-02-14 12:25:09.76702+00
6cdea9f2-415a-49f3-982d-d054ce2bb1e5	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	alien_1	alien_2	43114	10	0	2026-02-14 12:25:30.385173+00
c1e7fc4a-e53d-4d36-89eb-0b8050c77b7a	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	robot_1	robot_2	52157	10	0	2026-02-14 12:25:39.423907+00
ae4ee8b6-27cd-4ab0-b009-859dd295f87a	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	rainbow_2	rainbow_1	57461	10	0	2026-02-14 12:25:44.732505+00
8a264276-c20d-49ef-a5e3-a9b969060b6a	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	diamond_2	diamond_1	61484	10	0	2026-02-14 12:25:48.753054+00
502f0634-ce03-4342-9005-ba0c20c22e4e	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	trophy_1	trophy_2	70119	10	0	2026-02-14 12:25:57.38907+00
84615069-66de-4914-985c-59b47edccc2d	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	thinking_2	thinking_1	73596	10	0	2026-02-14 12:26:00.86353+00
1ac05aac-086b-4cf6-8c5c-38dfe48acf3b	68cfc09c-ff6a-4ab0-a603-33190e88ddbb	wink_1	wink_2	76561	10	0	2026-02-14 12:26:03.829549+00
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: gameuser
--

COPY public.games (id, user_id, username, score, moves, time_elapsed, cards_matched, difficulty_level, game_completed, started_at, completed_at, game_data) FROM stdin;
68cfc09c-ff6a-4ab0-a603-33190e88ddbb	f118eed5-95c9-4ef9-8675-3be16543dc51	easypeezy	212	16	77583	8	easy	t	2026-02-14 12:24:47.245719+00	2026-02-14 12:26:04.854565+00	{"started": "2026-02-14T12:24:47.245Z", "difficulty": "easy"}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gameuser
--

COPY public.users (id, username, email, display_name, created_at, updated_at, last_played, total_games, total_score, best_score, best_time, is_active) FROM stdin;
97860a81-edc4-4961-94f1-c5858ac92137	memorymaster42	master@example.com	🧠 Memory Master	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 09:58:24.911903+00	15	2340	200	45000	t
baed03cc-d4d7-4da8-9048-1022d2286afd	cardshark_jenny	jenny@example.com	🦈 Card Shark Jenny	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-13 11:58:24.911903+00	12	1890	180	52000	t
8b53e1f2-3678-4951-86a5-d0ef2901e38e	emoji_ninja	ninja@example.com	🥷 Emoji Ninja	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 08:58:24.911903+00	8	1440	190	48000	t
13889ac8-279c-44d1-b5d4-2e0f414a1e9a	laugh_machine	laugh@example.com	😂 Laugh Machine	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 11:28:24.911903+00	20	2800	175	55000	t
0b80e867-82a4-4b97-b930-383ac98b1137	puzzle_pirate	pirate@example.com	🏴‍☠️ Puzzle Pirate	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-12 11:58:24.911903+00	6	780	150	62000	t
ad329420-2846-4613-bfb1-ec79bf2ba46e	memory_mango	mango@example.com	🥭 Memory Mango	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 06:58:24.911903+00	10	1500	165	58000	t
db7e54ec-2b58-461e-9f1e-e16116cb2d55	giggle_guru	guru@example.com	🤓 Giggle Guru	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 10:58:24.911903+00	18	2520	185	47000	t
64225bd6-1bb7-48f6-94db-dd44b25bb6a3	chuckle_champ	champ@example.com	🏆 Chuckle Champ	2026-02-14 11:58:24.911903+00	2026-02-14 11:58:24.911903+00	2026-02-14 07:58:24.911903+00	14	2100	170	51000	t
f118eed5-95c9-4ef9-8675-3be16543dc51	easypeezy	\N	easypeezy	2026-02-14 12:24:47.238207+00	2026-02-14 12:26:04.854565+00	2026-02-14 12:26:04.854565+00	1	212	212	77583	t
\.


--
-- Name: game_matches game_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.game_matches
    ADD CONSTRAINT game_matches_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_game_matches_game_id; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_game_matches_game_id ON public.game_matches USING btree (game_id);


--
-- Name: idx_games_completed_at; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_games_completed_at ON public.games USING btree (completed_at);


--
-- Name: idx_games_score; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_games_score ON public.games USING btree (score DESC);


--
-- Name: idx_games_user_id; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_games_user_id ON public.games USING btree (user_id);


--
-- Name: idx_users_best_score; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_users_best_score ON public.users USING btree (best_score DESC);


--
-- Name: idx_users_last_played; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_users_last_played ON public.users USING btree (last_played);


--
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: gameuser
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- Name: games trigger_update_user_stats; Type: TRIGGER; Schema: public; Owner: gameuser
--

CREATE TRIGGER trigger_update_user_stats AFTER UPDATE ON public.games FOR EACH ROW EXECUTE FUNCTION public.update_user_stats();


--
-- Name: game_matches game_matches_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.game_matches
    ADD CONSTRAINT game_matches_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gameuser
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict be7SSyY8qhAp7fmzAgLr8oyMGap3WGNeRKSppsjd8ajtbVqP9HInf8rnPmD3jAS

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict HcXC4QorrKGbHBoFTiFt2xIvcRCIfnmlKDeW0Iq5mXIwxDtZZ6YGAlDGY4MScdQ

-- Dumped from database version 15.16
-- Dumped by pg_dump version 15.16

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

--
-- PostgreSQL database dump complete
--

\unrestrict HcXC4QorrKGbHBoFTiFt2xIvcRCIfnmlKDeW0Iq5mXIwxDtZZ6YGAlDGY4MScdQ

--
-- PostgreSQL database cluster dump complete
--

