--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-05 19:54:48

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16428)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudad (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    id_estudiantes integer
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16427)
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_id_seq OWNER TO postgres;

--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
-- TOC entry 210 (class 1259 OID 16403)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id bigint NOT NULL,
    nombre character varying(60),
    apellido character varying(60),
    email character varying(150),
    batch integer
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16402)
-- Name: estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiantes_id_seq OWNER TO postgres;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 209
-- Name: estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_seq OWNED BY public.estudiantes.id;


--
-- TOC entry 3170 (class 2604 OID 16431)
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
-- TOC entry 3169 (class 2604 OID 16406)
-- Name: estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_id_seq'::regclass);


--
-- TOC entry 3320 (class 0 OID 16428)
-- Dependencies: 212
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudad (id, nombre, id_estudiantes) FROM stdin;
1	Bogota	2
2	Cali	8
3	Popayan	3
4	Medellin	9
\.


--
-- TOC entry 3318 (class 0 OID 16403)
-- Dependencies: 210
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id, nombre, apellido, email, batch) FROM stdin;
3	Estudiante3	apellido3	correo3@correo.com	1
5	Estudiante5	apellido5	correo5@correo.com	2
8	Estudiante8	apellido8	correo8@correo.com	4
9	Estudiante9	apellido9	correo9@correo.com	4
4	Estudiante4	apellido4	correo4@correo.com	4
10	Estudiante10	apellido10	correo10@correo.com	3
2	Estuden	apellido2	estudiante@correo.com	3
11	Estudiante11	apellido11	correo10correo.com	4
13	Estudiante12	apellido12	correo12@correo.com	2
15	Estudiante14	apellido14	correo14@correo.com	3
16	Estudiante15	apellido15	correo15@correo.com	3
17	Estudiante16	apellido16	correo16@correo.com	3
18	Estudiante17	apellido17	correo17@correo.com	1
19	Estudiante18	apellido18	correo18@correo.com	1
20	Estudiante19	apellido19	correo19@correo.com	1
21	Estudiante20	apellido20	correo20@correo.com	4
6	Andrea_Estudiante6	apellido6	correo6@correo.com	1
7	Antonio_Estudiante7	apellido7	correo7@correo.com	2
14	Ana_Estudiante13	apellido13	correo13@correo.com	2
\.


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 211
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 4, true);


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 209
-- Name: estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_seq', 21, true);


--
-- TOC entry 3176 (class 2606 OID 16433)
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 16417)
-- Name: estudiantes estudiantes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pk PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 16419)
-- Name: estudiantes estudiantes_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_un UNIQUE (email);


--
-- TOC entry 3177 (class 2606 OID 16434)
-- Name: ciudad fk_estudiantes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_estudiantes FOREIGN KEY (id_estudiantes) REFERENCES public.estudiantes(id) ON DELETE CASCADE;


-- Completed on 2022-09-05 19:54:48

--
-- PostgreSQL database dump complete
--

