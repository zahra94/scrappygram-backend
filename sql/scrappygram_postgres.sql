--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.0
-- Dumped by pg_dump version 9.6.0

-- Started on 2016-11-01 23:03:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 186 (class 1259 OID 24759)
-- Name: admin_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin_groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE admin_groups OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24757)
-- Name: admin_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 185
-- Name: admin_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_groups_id_seq OWNED BY admin_groups.id;


--
-- TOC entry 188 (class 1259 OID 24771)
-- Name: admin_login_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin_login_attempts (
    id integer NOT NULL,
    ip_address character varying(15) NOT NULL,
    login character varying(100) NOT NULL,
    "time" bigint
);


ALTER TABLE admin_login_attempts OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 24769)
-- Name: admin_login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_login_attempts_id_seq OWNER TO postgres;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 187
-- Name: admin_login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_login_attempts_id_seq OWNED BY admin_login_attempts.id;


--
-- TOC entry 190 (class 1259 OID 24779)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    ip_address character varying(15) NOT NULL,
    username character varying(100),
    password character varying(255) NOT NULL,
    salt character varying(255),
    email character varying(100),
    activation_code character varying(40),
    forgotten_password_code character varying(40),
    forgotten_password_time bigint,
    remember_code character varying(40),
    created_on bigint NOT NULL,
    last_login bigint,
    active smallint,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE admin_users OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24794)
-- Name: admin_users_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin_users_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE admin_users_groups OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 24792)
-- Name: admin_users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 191
-- Name: admin_users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_users_groups_id_seq OWNED BY admin_users_groups.id;


--
-- TOC entry 189 (class 1259 OID 24777)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 189
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- TOC entry 194 (class 1259 OID 24806)
-- Name: api_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE api_access (
    id integer NOT NULL,
    key character varying(40) NOT NULL,
    controller character varying(50) NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE api_access OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 24804)
-- Name: api_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_access_id_seq OWNER TO postgres;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 193
-- Name: api_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_access_id_seq OWNED BY api_access.id;


--
-- TOC entry 196 (class 1259 OID 24815)
-- Name: api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    user_id integer NOT NULL,
    key character varying(40) NOT NULL,
    level integer NOT NULL,
    ignore_limits smallint DEFAULT 0 NOT NULL,
    is_private_key smallint DEFAULT 0 NOT NULL,
    ip_addresses text,
    date_created integer NOT NULL
);


ALTER TABLE api_keys OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 24813)
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_keys_id_seq OWNER TO postgres;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 195
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- TOC entry 198 (class 1259 OID 24829)
-- Name: api_limits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE api_limits (
    id integer NOT NULL,
    uri character varying(255) NOT NULL,
    count integer NOT NULL,
    hour_started integer NOT NULL,
    api_key character varying(40) NOT NULL
);


ALTER TABLE api_limits OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24827)
-- Name: api_limits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_limits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_limits_id_seq OWNER TO postgres;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 197
-- Name: api_limits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_limits_id_seq OWNED BY api_limits.id;


--
-- TOC entry 200 (class 1259 OID 24837)
-- Name: api_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE api_logs (
    id integer NOT NULL,
    uri character varying(255) NOT NULL,
    method character varying(6) NOT NULL,
    params text,
    api_key character varying(40) NOT NULL,
    ip_address character varying(45) NOT NULL,
    "time" integer NOT NULL,
    rtime real,
    authorized character varying(1) NOT NULL,
    response_code smallint DEFAULT 0
);


ALTER TABLE api_logs OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24835)
-- Name: api_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_logs_id_seq OWNER TO postgres;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 199
-- Name: api_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_logs_id_seq OWNED BY api_logs.id;


--
-- TOC entry 202 (class 1259 OID 24849)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customers (
    id integer NOT NULL,
    phone character varying(20) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    password character varying(255) NOT NULL,
    address character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    zipcode character varying(11),
    orders character varying(255)
);


ALTER TABLE customers OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24847)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO postgres;

--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 201
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- TOC entry 204 (class 1259 OID 24863)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE groups OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24861)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 203
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- TOC entry 206 (class 1259 OID 24872)
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE login_attempts (
    id integer NOT NULL,
    ip_address character varying(15) NOT NULL,
    login character varying(100) NOT NULL,
    "time" bigint
);


ALTER TABLE login_attempts OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24870)
-- Name: login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login_attempts_id_seq OWNER TO postgres;

--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 205
-- Name: login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE login_attempts_id_seq OWNED BY login_attempts.id;


--
-- TOC entry 208 (class 1259 OID 24880)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id integer NOT NULL,
    order_id character varying(255) NOT NULL,
    filenames character varying(255),
    amount integer DEFAULT 1,
    brain_confirm_id character varying(255)
);


ALTER TABLE orders OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24878)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO postgres;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 207
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- TOC entry 210 (class 1259 OID 24893)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    ip_address character varying(15) NOT NULL,
    username character varying(100),
    password character varying(255) NOT NULL,
    salt character varying(255),
    email character varying(100) NOT NULL,
    activation_code character varying(40),
    forgotten_password_code character varying(40),
    forgotten_password_time bigint,
    remember_code character varying(40),
    created_on bigint NOT NULL,
    last_login bigint,
    active smallint,
    first_name character varying(50),
    last_name character varying(50),
    company character varying(100),
    phone character varying(20)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24905)
-- Name: users_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_groups OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24903)
-- Name: users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_groups_id_seq OWNED BY users_groups.id;


--
-- TOC entry 209 (class 1259 OID 24891)
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
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 214 (class 1259 OID 24914)
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vendors (
    id integer NOT NULL,
    vendor_id character varying(255) NOT NULL,
    vendor_email character varying(255),
    vendor_zipcode character varying(255),
    vendor_saturday smallint DEFAULT 1,
    vendor_sunday smallint DEFAULT 0,
    vendor_cls_time time without time zone,
    vendor_timezone character varying(5),
    vendor_rating integer,
    vendor_order_count integer DEFAULT 0,
    vendor_order_limit integer
);


ALTER TABLE vendors OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24912)
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vendors_id_seq OWNER TO postgres;

--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 213
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vendors_id_seq OWNED BY vendors.id;


--
-- TOC entry 2092 (class 2604 OID 24762)
-- Name: admin_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_groups ALTER COLUMN id SET DEFAULT nextval('admin_groups_id_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 24774)
-- Name: admin_login_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_login_attempts ALTER COLUMN id SET DEFAULT nextval('admin_login_attempts_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 24782)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 24797)
-- Name: admin_users_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users_groups ALTER COLUMN id SET DEFAULT nextval('admin_users_groups_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 24809)
-- Name: api_access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_access ALTER COLUMN id SET DEFAULT nextval('api_access_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 24818)
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 24832)
-- Name: api_limits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_limits ALTER COLUMN id SET DEFAULT nextval('api_limits_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 24840)
-- Name: api_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_logs ALTER COLUMN id SET DEFAULT nextval('api_logs_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 24852)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 24866)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 24875)
-- Name: login_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login_attempts ALTER COLUMN id SET DEFAULT nextval('login_attempts_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 24883)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 24896)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 24908)
-- Name: users_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups ALTER COLUMN id SET DEFAULT nextval('users_groups_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 24917)
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendors ALTER COLUMN id SET DEFAULT nextval('vendors_id_seq'::regclass);


--
-- TOC entry 2263 (class 0 OID 24759)
-- Dependencies: 186
-- Data for Name: admin_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_groups (id, name, description) FROM stdin;
1	webmaster	Webmaster
2	admin	Administrator
3	manager	Manager
4	staff	Staff
\.


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 185
-- Name: admin_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_groups_id_seq', 1, false);


--
-- TOC entry 2265 (class 0 OID 24771)
-- Dependencies: 188
-- Data for Name: admin_login_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_login_attempts (id, ip_address, login, "time") FROM stdin;
\.


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 187
-- Name: admin_login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_login_attempts_id_seq', 1, false);


--
-- TOC entry 2267 (class 0 OID 24779)
-- Dependencies: 190
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name) FROM stdin;
1	127.0.0.1	webmaster	$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES	\N	\N	\N	\N	\N	HU04k2DZZqHjFIal8CLQYu	1451900190	1477971966	1	Webmaster	
2	127.0.0.1	admin	$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW	\N	\N	\N	\N	\N	DOaiUtSw1srj3LirP9YL1.	1451900228	1477159040	1	Admin	
3	127.0.0.1	manager	$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa	\N	\N	\N	\N	\N	\N	1451900430	\N	1	Manager	
4	127.0.0.1	staff	$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6	\N	\N	\N	\N	\N	\N	1451900439	\N	1	Staff	
\.


--
-- TOC entry 2269 (class 0 OID 24794)
-- Dependencies: 192
-- Data for Name: admin_users_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_users_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
\.


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 191
-- Name: admin_users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_users_groups_id_seq', 1, false);


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 189
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, false);


--
-- TOC entry 2271 (class 0 OID 24806)
-- Dependencies: 194
-- Data for Name: api_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY api_access (id, key, controller, date_created, date_modified) FROM stdin;
\.


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 193
-- Name: api_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_access_id_seq', 1, false);


--
-- TOC entry 2273 (class 0 OID 24815)
-- Dependencies: 196
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY api_keys (id, user_id, key, level, ignore_limits, is_private_key, ip_addresses, date_created) FROM stdin;
1	1	ixZePbqTLpCfiVvkTwLPEHb8kmekJeGJiQRAIAoQ	1	0	0	\N	1
\.


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 195
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_keys_id_seq', 1, false);


--
-- TOC entry 2275 (class 0 OID 24829)
-- Dependencies: 198
-- Data for Name: api_limits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY api_limits (id, uri, count, hour_started, api_key) FROM stdin;
\.


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 197
-- Name: api_limits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_limits_id_seq', 1, false);


--
-- TOC entry 2277 (class 0 OID 24837)
-- Dependencies: 200
-- Data for Name: api_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY api_logs (id, uri, method, params, api_key, ip_address, "time", rtime, authorized, response_code) FROM stdin;
\.


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 199
-- Name: api_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_logs_id_seq', 1, false);


--
-- TOC entry 2279 (class 0 OID 24849)
-- Dependencies: 202
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customers (id, phone, first_name, last_name, email, password, address, city, state, country, zipcode, orders) FROM stdin;
10	1232132123123	John2	Smith	johnsmith@scrappygram.com	admin123	12 sat 1232	kaiaa	CA	US	02412	\N
11	123213213123	John	Smith	johnsmith@scrappygram.com	admin123	12 sat 1232	kai	CA	US	02412	\N
12	555555555555	John	Smith	johnsmith123@scrappygram.com	admin123	12 sat 1232	kai	CA	US	02412	\N
\.


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 201
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- TOC entry 2281 (class 0 OID 24863)
-- Dependencies: 204
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, name, description) FROM stdin;
1	members	General User
\.


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 203
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- TOC entry 2283 (class 0 OID 24872)
-- Dependencies: 206
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY login_attempts (id, ip_address, login, "time") FROM stdin;
\.


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 205
-- Name: login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('login_attempts_id_seq', 1, false);


--
-- TOC entry 2285 (class 0 OID 24880)
-- Dependencies: 208
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, order_id, filenames, amount, brain_confirm_id) FROM stdin;
1	234ass	aaa	1	123213
\.


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 207
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- TOC entry 2287 (class 0 OID 24893)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name, company, phone) FROM stdin;
1	127.0.0.1	member	$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G	\N	member@member.com	\N	\N	\N	\N	1451903855	1451905011	0	Member	One	\N	\N
\.


--
-- TOC entry 2289 (class 0 OID 24905)
-- Dependencies: 212
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_groups (id, user_id, group_id) FROM stdin;
1	1	1
\.


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_groups_id_seq', 1, false);


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 24914)
-- Dependencies: 214
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vendors (id, vendor_id, vendor_email, vendor_zipcode, vendor_saturday, vendor_sunday, vendor_cls_time, vendor_timezone, vendor_rating, vendor_order_count, vendor_order_limit) FROM stdin;
1		aaa@ab.com	123123	123	0	00:00:00		123	0	123213
2		asaa@ab.com	12342	0	0	00:00:00		0	0	23123
\.


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 213
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vendors_id_seq', 1, false);


--
-- TOC entry 2116 (class 2606 OID 24764)
-- Name: admin_groups admin_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_groups
    ADD CONSTRAINT admin_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 24776)
-- Name: admin_login_attempts admin_login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_login_attempts
    ADD CONSTRAINT admin_login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 24799)
-- Name: admin_users_groups admin_users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users_groups
    ADD CONSTRAINT admin_users_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 24787)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 24812)
-- Name: api_access api_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_access
    ADD CONSTRAINT api_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2126 (class 2606 OID 24825)
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- TOC entry 2128 (class 2606 OID 24834)
-- Name: api_limits api_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_limits
    ADD CONSTRAINT api_limits_pkey PRIMARY KEY (id);


--
-- TOC entry 2130 (class 2606 OID 24846)
-- Name: api_logs api_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_logs
    ADD CONSTRAINT api_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 24857)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 2134 (class 2606 OID 24868)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 24877)
-- Name: login_attempts login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 2606 OID 24889)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 24910)
-- Name: users_groups users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 24901)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2144 (class 2606 OID 24925)
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


-- Completed on 2016-11-01 23:03:05

--
-- PostgreSQL database dump complete
--

