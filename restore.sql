--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

DROP DATABASE projekt;
--
-- Name: projekt; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE projekt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Polish_Poland.1250';


ALTER DATABASE projekt OWNER TO postgres;

\connect projekt

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
-- Name: grupa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupa (
    id_grupy integer NOT NULL,
    nazwa_grupy character varying(30)
);


ALTER TABLE public.grupa OWNER TO postgres;

--
-- Name: grupa_id_grupy_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupa_id_grupy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupa_id_grupy_seq OWNER TO postgres;

--
-- Name: grupa_id_grupy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupa_id_grupy_seq OWNED BY public.grupa.id_grupy;


--
-- Name: uzytkownik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uzytkownik (
    id_osoby integer NOT NULL,
    osoba character varying(50),
    id_grupy integer
);


ALTER TABLE public.uzytkownik OWNER TO postgres;

--
-- Name: uzytkownik_id_osoby_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uzytkownik_id_osoby_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzytkownik_id_osoby_seq OWNER TO postgres;

--
-- Name: uzytkownik_id_osoby_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uzytkownik_id_osoby_seq OWNED BY public.uzytkownik.id_osoby;


--
-- Name: wiadomosc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiadomosc (
    id_wiadomosci integer NOT NULL,
    tresc character varying(200),
    id_grupy integer,
    id_osoby integer
);


ALTER TABLE public.wiadomosc OWNER TO postgres;

--
-- Name: wiadomosc_id_wiadomosci_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiadomosc_id_wiadomosci_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiadomosc_id_wiadomosci_seq OWNER TO postgres;

--
-- Name: wiadomosc_id_wiadomosci_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiadomosc_id_wiadomosci_seq OWNED BY public.wiadomosc.id_wiadomosci;


--
-- Name: grupa id_grupy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupa ALTER COLUMN id_grupy SET DEFAULT nextval('public.grupa_id_grupy_seq'::regclass);


--
-- Name: uzytkownik id_osoby; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzytkownik ALTER COLUMN id_osoby SET DEFAULT nextval('public.uzytkownik_id_osoby_seq'::regclass);


--
-- Name: wiadomosc id_wiadomosci; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc ALTER COLUMN id_wiadomosci SET DEFAULT nextval('public.wiadomosc_id_wiadomosci_seq'::regclass);


--
-- Data for Name: grupa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupa (id_grupy, nazwa_grupy) FROM stdin;
\.
COPY public.grupa (id_grupy, nazwa_grupy) FROM '$$PATH$$/3005.dat';

--
-- Data for Name: uzytkownik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uzytkownik (id_osoby, osoba, id_grupy) FROM stdin;
\.
COPY public.uzytkownik (id_osoby, osoba, id_grupy) FROM '$$PATH$$/3007.dat';

--
-- Data for Name: wiadomosc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiadomosc (id_wiadomosci, tresc, id_grupy, id_osoby) FROM stdin;
\.
COPY public.wiadomosc (id_wiadomosci, tresc, id_grupy, id_osoby) FROM '$$PATH$$/3009.dat';

--
-- Name: grupa_id_grupy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupa_id_grupy_seq', 3, true);


--
-- Name: uzytkownik_id_osoby_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uzytkownik_id_osoby_seq', 6, true);


--
-- Name: wiadomosc_id_wiadomosci_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiadomosc_id_wiadomosci_seq', 18, true);


--
-- Name: grupa grupa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupa
    ADD CONSTRAINT grupa_pkey PRIMARY KEY (id_grupy);


--
-- Name: uzytkownik uzytkownik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT uzytkownik_pkey PRIMARY KEY (id_osoby);


--
-- Name: wiadomosc wiadomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT wiadomosc_pkey PRIMARY KEY (id_wiadomosci);


--
-- Name: uzytkownik fkgrupa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT fkgrupa FOREIGN KEY (id_grupy) REFERENCES public.grupa(id_grupy);


--
-- Name: wiadomosc fkgrupa_m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT fkgrupa_m FOREIGN KEY (id_grupy) REFERENCES public.grupa(id_grupy);


--
-- Name: wiadomosc fkosoba_m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT fkosoba_m FOREIGN KEY (id_osoby) REFERENCES public.uzytkownik(id_osoby);


--
-- PostgreSQL database dump complete
--

