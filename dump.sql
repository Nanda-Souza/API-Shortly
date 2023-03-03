--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg20.04+1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token character varying(100) NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    "shortUrl" character varying(100) NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now(),
    "visitCount" integer DEFAULT 0
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(200) NOT NULL,
    createdat timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '4820e453-2dec-4665-afd9-2c1fdc8d8c2a', 1, '2023-03-02 17:07:32.208052-03');
INSERT INTO public.sessions VALUES (2, '32ec24a3-7d11-4eec-8f9f-1c0cf0d6badf', 1, '2023-03-02 17:49:36.166776-03');
INSERT INTO public.sessions VALUES (3, '6bddf3c8-036a-4c43-a7ea-a435cd48cbc8', 1, '2023-03-02 18:11:12.447276-03');
INSERT INTO public.sessions VALUES (4, 'c75daa63-147d-4576-b044-1295786f8f8f', 2, '2023-03-03 00:16:49.474308-03');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (7, 'https://ninja.com', 'xlvLaY1O_L9YYG6Jb8jza', 1, '2023-03-02 22:10:56.150624-03', 1);
INSERT INTO public.urls VALUES (8, 'https://g1.com', 'Id-810Li8kGFGK215gL2J', 2, '2023-03-03 00:17:43.801575-03', 2);
INSERT INTO public.urls VALUES (10, 'https://google.com', 'jRBXuogSQcB293oeEwhM1', 2, '2023-03-03 01:15:54.8151-03', 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Lavitz Slambert', 'l@l.com', '$2b$10$GYEZTl2qojr41SQ20vOGteCzDnG.wj5UZuyBuWfxUbsuBZNy8vnee', '2023-03-02 00:00:00-03');
INSERT INTO public.users VALUES (2, 'Machine-Kun', 'm@k.com', '$2b$10$G7S8kkiPli86hSR.y1PN/OjU4BMXi4beFMTZgxNvBtGx1FFu4AHsq', '2023-03-03 00:15:34.563675-03');
INSERT INTO public.users VALUES (3, 'rasta', 'r@r.com', '$2b$10$CQAcq6xnxPeZEEu9nr4Uyua//P58jIVaz7VUNoeHtxy7yByIhONda', '2023-03-03 09:27:13.097975-03');
INSERT INTO public.users VALUES (4, 'guin', 'big@g.com', '$2b$10$cPkkcKaIg0kk3rEbsTBV4eMGkEuacnwKODfn2P.SiqXftoeu2a3xm', '2023-03-03 09:27:35.691075-03');
INSERT INTO public.users VALUES (5, 'turco', 't@g.com', '$2b$10$oFHNVcJdTSCYGJ.Hijd7Fe9zkpNxPZl5P8PWovAqm.TGAUOuNDnXq', '2023-03-03 09:27:44.43376-03');
INSERT INTO public.users VALUES (6, 'pink', 'p@k.com', '$2b$10$sUKwdvateyPfaCB4XO05Ee/MP0KVG1u013btKRFc8NJR37fg6G/PK', '2023-03-03 09:27:54.57537-03');
INSERT INTO public.users VALUES (7, 'neko', 'n@k.com', '$2b$10$vu00LXo2iFalhd.HQA64JOXmIp/3wlmpihgGtokrO8ZGP4tJdNLhq', '2023-03-03 09:28:01.924081-03');
INSERT INTO public.users VALUES (8, 'henry', 'h@y.com', '$2b$10$sJwE80EIOYCwTHR13mI.sePfeP/IIx/3LNO.RYhT8kF5f2t2S/0Aq', '2023-03-03 09:28:11.534059-03');
INSERT INTO public.users VALUES (9, 'tibuzio', 't@b.com', '$2b$10$GZaKdK32TULsa/Nd8bSxbemWeW7mQe6asI1V/mOGc.cUY1fPeN85.', '2023-03-03 09:28:22.068139-03');
INSERT INTO public.users VALUES (10, 'planta', 'p@t.com', '$2b$10$j/.rli3TJQ6U8S8xd.fFjew4t6cWlgdZ.9.Ovol6vOtlKhlsgbvQ6', '2023-03-03 09:28:31.18618-03');
INSERT INTO public.users VALUES (11, 'gordo', 'g@d.com', '$2b$10$kZJJjzKteb2/Ccm1l0XwUO8X5j.Qjcf1wAbkYbM7LSk6Siren8wby', '2023-03-03 09:28:39.424429-03');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

