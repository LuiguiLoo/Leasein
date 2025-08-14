--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2025-08-14 10:14:17

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
-- TOC entry 208 (class 1259 OID 47464)
-- Name: cache; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO odoo;

--
-- TOC entry 209 (class 1259 OID 47472)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO odoo;

--
-- TOC entry 216 (class 1259 OID 47516)
-- Name: equipos; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.equipos (
    id bigint NOT NULL,
    codigo character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    cliente character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    fecha_entrega date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.equipos OWNER TO odoo;

--
-- TOC entry 215 (class 1259 OID 47514)
-- Name: equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.equipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipos_id_seq OWNER TO odoo;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.equipos_id_seq OWNED BY public.equipos.id;


--
-- TOC entry 214 (class 1259 OID 47502)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO odoo;

--
-- TOC entry 213 (class 1259 OID 47500)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO odoo;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 213
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 212 (class 1259 OID 47492)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO odoo;

--
-- TOC entry 211 (class 1259 OID 47482)
-- Name: jobs; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO odoo;

--
-- TOC entry 210 (class 1259 OID 47480)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO odoo;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 210
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 203 (class 1259 OID 47427)
-- Name: migrations; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO odoo;

--
-- TOC entry 202 (class 1259 OID 47425)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO odoo;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 206 (class 1259 OID 47446)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO odoo;

--
-- TOC entry 207 (class 1259 OID 47454)
-- Name: sessions; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO odoo;

--
-- TOC entry 205 (class 1259 OID 47435)
-- Name: users; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO odoo;

--
-- TOC entry 204 (class 1259 OID 47433)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO odoo;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2745 (class 2604 OID 47519)
-- Name: equipos id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.equipos ALTER COLUMN id SET DEFAULT nextval('public.equipos_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 47505)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 47485)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 47430)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 47438)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2907 (class 0 OID 47464)
-- Dependencies: 208
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 47472)
-- Dependencies: 209
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 47516)
-- Dependencies: 216
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.equipos (id, codigo, tipo, cliente, estado, fecha_entrega, created_at, updated_at) FROM stdin;
1	EQ001	Laptop	Cliente A	Disponible	2025-08-15	2025-08-13 22:40:31	2025-08-13 22:40:31
2	EQ002	Tablet	Cliente B	Ocupado	2025-08-20	2025-08-13 22:40:31	2025-08-13 22:40:31
\.


--
-- TOC entry 2913 (class 0 OID 47502)
-- Dependencies: 214
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 47492)
-- Dependencies: 212
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 47482)
-- Dependencies: 211
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 47427)
-- Dependencies: 203
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_08_13_214858_create_equipos_table	1
\.


--
-- TOC entry 2905 (class 0 OID 47446)
-- Dependencies: 206
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 47454)
-- Dependencies: 207
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
bGG45TMs839kGREB9i8Lt9lvtqPzGg6ChGKfqp3n	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDZaRW1oeUQyN2R3ZXV1R1FCd0ZtQks0bzFjVHVoenFUYzcwbm9kRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1755125934
lC9lPcdAYmWsDPdgTYOc0azHMGWoc3o9swBIpiVM	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicnFVcVNoQU1VUm5iTkJsSTVQbnpaTllqd09BdGtpOHA4R0l3NVl6eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1755129303
wVxSVNVyd3JyYNoUifJ5zhNkASiuLN0bftrcB06X	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiazNJUGZwT3dkdlNjaVdqSzZTMEZPcVNzQU5PdW4yc0psZDhxNDZBSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1755181117
03XdByzxHVvAjUrH1KPv5ywqUcItVwecI0YBkNA9	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1lFODZhNlRXRVRKS2ZSRGVOZHRWVmozZ2x4WWltVzhvdUxxc1hOWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1755181215
\.


--
-- TOC entry 2904 (class 0 OID 47435)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: odoo
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.equipos_id_seq', 2, true);


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 213
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 210
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 2761 (class 2606 OID 47479)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 2759 (class 2606 OID 47471)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 2772 (class 2606 OID 47526)
-- Name: equipos equipos_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_codigo_unique UNIQUE (codigo);


--
-- TOC entry 2774 (class 2606 OID 47524)
-- Name: equipos equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 47511)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 47513)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2766 (class 2606 OID 47499)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 47490)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 47432)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 47453)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 2756 (class 2606 OID 47461)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 47445)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2751 (class 2606 OID 47443)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 1259 OID 47491)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: odoo
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 2754 (class 1259 OID 47463)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: odoo
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 2757 (class 1259 OID 47462)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: odoo
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


-- Completed on 2025-08-14 10:14:17

--
-- PostgreSQL database dump complete
--

