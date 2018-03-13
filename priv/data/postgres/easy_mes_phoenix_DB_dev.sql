--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2018-03-12 19:34:06 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 16670)
-- Name: actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE actions (
    id integer NOT NULL,
    action_name character varying(255),
    action_description text,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE actions OWNER TO postgres;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN actions.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN actions.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN actions.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN actions.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 192 (class 1259 OID 16668)
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions_id_seq OWNER TO postgres;

--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 192
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actions_id_seq OWNED BY actions.id;


--
-- TOC entry 195 (class 1259 OID 16682)
-- Name: modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE modules (
    id integer NOT NULL,
    module_name character varying(255),
    module_description text,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE modules OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN modules.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN modules.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN modules.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN modules.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 194 (class 1259 OID 16680)
-- Name: modules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modules_id_seq OWNER TO postgres;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 194
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modules_id_seq OWNED BY modules.id;


--
-- TOC entry 189 (class 1259 OID 16643)
-- Name: rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rights (
    id integer NOT NULL,
    module_name character varying(255),
    action_name character varying(255),
    right_string character varying(255),
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    module_id integer,
    action_id integer
);


ALTER TABLE rights OWNER TO postgres;

--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN rights.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rights.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN rights.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rights.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 188 (class 1259 OID 16641)
-- Name: rights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rights_id_seq OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 188
-- Name: rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rights_id_seq OWNED BY rights.id;


--
-- TOC entry 187 (class 1259 OID 16631)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    key_role character varying(255),
    description text,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN roles.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN roles.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 186 (class 1259 OID 16629)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 186
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 197 (class 1259 OID 20140)
-- Name: roles_rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles_rights (
    right_id integer NOT NULL,
    role_id integer NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    inserted_at timestamp without time zone DEFAULT now()
);


ALTER TABLE roles_rights OWNER TO postgres;

--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN roles_rights.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles_rights.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN roles_rights.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles_rights.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 198 (class 1259 OID 20193)
-- Name: roles_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE roles_rights_id_seq OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16624)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16655)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying(25),
    first_name character varying(25),
    last_name character varying(25),
    email character varying(250) NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    encrypted_password character varying(250),
    confirmed boolean DEFAULT false,
    cell_phone character varying(25),
    phone character varying(25),
    mobil_phone character varying(25),
    street_fieldress character varying(255),
    birth_day date,
    home_phone character varying(25),
    work_phone character varying(25),
    personal_titule character varying(10),
    job_title character varying(25),
    employee_num character varying(25),
    work_type character varying(25),
    work_category character varying(25),
    work_sub_category character varying(25),
    work_vendor character varying(25),
    department character varying(25),
    sub_department character varying(25),
    division character varying(25),
    assistant character varying(25),
    manager character varying(25),
    cost_center character varying(25),
    location character varying(25),
    building character varying(25),
    floor character varying(25),
    seat_numbers character varying(25),
    street_address character varying(25),
    city character varying(25),
    postal_code character varying(25),
    state character varying(25),
    country character varying(25),
    region character varying(25),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.user_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.user_name IS 'User name ';


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.cell_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.cell_phone IS 'User cell phone';


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.phone IS 'User cell phone';


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.mobil_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.mobil_phone IS 'User mobil cell phone';


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.birth_day; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.birth_day IS 'User birth day';


--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.home_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.home_phone IS 'User Home phone';


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.work_phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.work_phone IS 'User Work phone';


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.personal_titule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.personal_titule IS 'User Personal title';


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.job_title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.job_title IS 'User Job title';


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.employee_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.employee_num IS 'User employee number';


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.work_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.work_type IS 'User Work type';


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.work_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.work_category IS 'User Category';


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.work_sub_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.work_sub_category IS 'User Sub Category';


--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.work_vendor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.work_vendor IS 'User Vendor';


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.department IS 'User Department';


--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.sub_department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.sub_department IS 'User Sub department';


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.division; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.division IS 'User Division';


--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.assistant; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.assistant IS 'User assistant';


--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.manager; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.manager IS 'User Manager';


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.cost_center; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.cost_center IS 'User Cost Center';


--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.location IS 'User Location';


--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.building; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.building IS 'User Building';


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.floor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.floor IS 'User Floor';


--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.seat_numbers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.seat_numbers IS 'Seat number';


--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.street_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.street_address IS 'User street address';


--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.city; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.city IS 'User City';


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.postal_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.postal_code IS 'User post code';


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.state IS 'User State';


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.country; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.country IS 'User Country';


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.region IS 'User Region';


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.created_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN users.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 190 (class 1259 OID 16653)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 190
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 196 (class 1259 OID 16694)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_roles (
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE users_roles OWNER TO postgres;

--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN users_roles.inserted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users_roles.inserted_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN users_roles.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users_roles.updated_at IS 'This field is updated automaticaly ';


--
-- TOC entry 2321 (class 2604 OID 16673)
-- Name: actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actions ALTER COLUMN id SET DEFAULT nextval('actions_id_seq'::regclass);


--
-- TOC entry 2324 (class 2604 OID 16685)
-- Name: modules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modules ALTER COLUMN id SET DEFAULT nextval('modules_id_seq'::regclass);


--
-- TOC entry 2313 (class 2604 OID 16646)
-- Name: rights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rights ALTER COLUMN id SET DEFAULT nextval('rights_id_seq'::regclass);


--
-- TOC entry 2310 (class 2604 OID 16634)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2316 (class 2604 OID 16658)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2483 (class 0 OID 16670)
-- Dependencies: 193
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY actions (id, action_name, action_description, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 192
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actions_id_seq', 20, true);


--
-- TOC entry 2485 (class 0 OID 16682)
-- Dependencies: 195
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modules (id, module_name, module_description, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 194
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modules_id_seq', 9, true);


--
-- TOC entry 2479 (class 0 OID 16643)
-- Dependencies: 189
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rights (id, module_name, action_name, right_string, inserted_at, updated_at, module_id, action_id) FROM stdin;
\.


--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 188
-- Name: rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rights_id_seq', 33, true);


--
-- TOC entry 2477 (class 0 OID 16631)
-- Dependencies: 187
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, key_role, description, inserted_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 186
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 17, true);


--
-- TOC entry 2487 (class 0 OID 20140)
-- Dependencies: 197
-- Data for Name: roles_rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles_rights (right_id, role_id, updated_at, inserted_at) FROM stdin;
\.


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 198
-- Name: roles_rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_rights_id_seq', 1, false);


--
-- TOC entry 2475 (class 0 OID 16624)
-- Dependencies: 185
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version, inserted_at) FROM stdin;
20170909220834	2017-10-09 00:36:27.964709
20170921231502	2017-10-09 00:36:28.006177
20170922160000	2017-10-09 00:36:28.060359
20170922221833	2017-10-09 00:36:28.088436
20171008213218	2017-10-09 00:36:28.118672
20171022195640	2017-10-22 21:14:20.479987
20171022222249	2017-10-22 22:29:25.832249
20180113213902	2018-01-13 21:47:59.342191
20180113215311	2018-01-13 21:57:24.151062
20180113220218	2018-01-13 22:03:10.252648
20180113220845	2018-01-13 22:18:55.694131
20180115000819	2018-01-15 00:32:43.128757
20180115005025	2018-01-15 01:05:21.438105
20180309175851	2018-03-09 19:33:50.182538
20180311181133	2018-03-11 18:26:34.772194
\.


--
-- TOC entry 2481 (class 0 OID 16655)
-- Dependencies: 191
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, user_name, first_name, last_name, email, is_admin, encrypted_password, confirmed, cell_phone, phone, mobil_phone, street_fieldress, birth_day, home_phone, work_phone, personal_titule, job_title, employee_num, work_type, work_category, work_sub_category, work_vendor, department, sub_department, division, assistant, manager, cost_center, location, building, floor, seat_numbers, street_address, city, postal_code, state, country, region, created_at, updated_at) FROM stdin;
1	Admin	Administrator	Administrator	admin@admin.com	t	$2b$12$iGX.v0zSn6UvMjwfasBoAebM9UevrViUyCN20xK2SzC3qzk3QCFNi	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-08 19:42:56.702146	\N
59	UserAdmin	User Administrator	\N	useradmin@admin.com	f	$2b$12$X9I7JWZyqzXN1nKr8Nu8i.yNPSYDYQs8x8lxX62WOnlge8..IteXC	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-03-11 15:00:07.787927	2018-03-11 15:00:07.787927
61	RoleAdmin	Role administrator	\N	roleadmin@admin.com	f	$2b$12$vAKPRAyRVqMZSWqTegD5cuP.9cKfB5ENZIFiHudBSUpOu6UmDnrhW	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-03-11 15:12:26.654284	2018-03-11 15:12:26.654284
\.


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 190
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 61, true);


--
-- TOC entry 2486 (class 0 OID 16694)
-- Dependencies: 196
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_roles (inserted_at, updated_at, user_id, role_id) FROM stdin;
\.


--
-- TOC entry 2344 (class 2606 OID 16678)
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 20219)
-- Name: modules module_name_UK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT "module_name_UK" UNIQUE (module_name) DEFERRABLE;


--
-- TOC entry 2349 (class 2606 OID 16690)
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 16651)
-- Name: rights rights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 16639)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 16628)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2341 (class 2606 OID 16666)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 1259 OID 16679)
-- Name: actions_action_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX actions_action_name_index ON actions USING btree (action_name);


--
-- TOC entry 2347 (class 1259 OID 16691)
-- Name: modules_module_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX modules_module_name_index ON modules USING btree (module_name);


--
-- TOC entry 2338 (class 1259 OID 16652)
-- Name: rights_right_string_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rights_right_string_index ON rights USING btree (right_string);


--
-- TOC entry 2333 (class 1259 OID 16640)
-- Name: roles_key_role_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_key_role_index ON roles USING btree (key_role);


--
-- TOC entry 2351 (class 1259 OID 20155)
-- Name: roles_rights_role_right_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_rights_role_right_index ON roles_rights USING btree (right_id, role_id);


--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 2351
-- Name: INDEX roles_rights_role_right_index; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON INDEX roles_rights_role_right_index IS 'Complex Index to Role Id and Right Id';


--
-- TOC entry 2339 (class 1259 OID 16693)
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_index ON users USING btree (email);


--
-- TOC entry 2350 (class 1259 OID 20246)
-- Name: users_roles_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_roles_index ON users_roles USING btree (user_id, role_id);


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 2350
-- Name: INDEX users_roles_index; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON INDEX users_roles_index IS 'Complex Index to Role Id and User Id';


--
-- TOC entry 2353 (class 2606 OID 20231)
-- Name: rights rights_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rights
    ADD CONSTRAINT rights_action_id_fkey FOREIGN KEY (action_id) REFERENCES actions(id);


--
-- TOC entry 2352 (class 2606 OID 20226)
-- Name: rights rights_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rights
    ADD CONSTRAINT rights_module_id_fkey FOREIGN KEY (module_id) REFERENCES modules(id);


--
-- TOC entry 2356 (class 2606 OID 20145)
-- Name: roles_rights roles_rights_right_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_rights
    ADD CONSTRAINT roles_rights_right_id_fkey FOREIGN KEY (right_id) REFERENCES rights(id);


--
-- TOC entry 2357 (class 2606 OID 20150)
-- Name: roles_rights roles_rights_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_rights
    ADD CONSTRAINT roles_rights_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- TOC entry 2355 (class 2606 OID 20241)
-- Name: users_roles users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- TOC entry 2354 (class 2606 OID 20236)
-- Name: users_roles users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


-- Completed on 2018-03-12 19:34:07 CST

--
-- PostgreSQL database dump complete
--

