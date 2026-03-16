--
-- PostgreSQL database dump
--

\restrict 4c2s6ZqW7gWlbPyH8yMIzan3VC9ikZYrke9cRt7ueaSYSX1nrQiCa4bQK6x69vk

-- Dumped from database version 15.16 (Debian 15.16-1.pgdg13+1)
-- Dumped by pg_dump version 18.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- Name: match; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.match (
    id bigint NOT NULL,
    season_year integer NOT NULL,
    match_date date,
    team1_id bigint,
    team2_id bigint,
    venue text,
    city text,
    toss_winner_id bigint,
    toss_decision character varying(20),
    winner_id bigint,
    result_type character varying(50),
    result_margin integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    winner character varying(100),
    mom_player_id bigint,
    team1_name character varying(100),
    team2_name character varying(100)
);


--
-- Name: match_player; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.match_player (
    match_id bigint NOT NULL,
    player_id bigint NOT NULL,
    team_id bigint NOT NULL
);


--
-- Name: player; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- Name: season; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.season (
    id bigint NOT NULL,
    year integer NOT NULL
);


--
-- Name: season_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.season_id_seq OWNED BY public.season.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: player id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- Name: season id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season ALTER COLUMN id SET DEFAULT nextval('public.season_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create core tables	SQL	V1__create_core_tables.sql	-1135336581	cricket_user	2026-02-26 13:09:55.331773	76	t
2	2	add winner column	SQL	V2__add_winner_column.sql	-161379297	cricket_user	2026-02-26 14:00:52.026775	23	t
\.


--
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.match (id, season_year, match_date, team1_id, team2_id, venue, city, toss_winner_id, toss_decision, winner_id, result_type, result_margin, created_at, winner, mom_player_id, team1_name, team2_name) FROM stdin;
1082597	2017	2017-04-09	37	39	Wankhede Stadium	Mumbai	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
729293	2014	2014-04-21	42	44	Sheikh Zayed Stadium	Abu Dhabi	42	bat	42	\N	93	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
729301	2014	2014-04-25	34	44	Dubai International Cricket Stadium	\N	34	bat	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	DC
729309	2014	2014-04-27	44	37	Sharjah Cricket Stadium	\N	37	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
729289	2014	2014-04-19	39	44	Dubai International Cricket Stadium	\N	39	bat	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
733985	2014	2014-05-07	44	39	Feroz Shah Kotla	Delhi	44	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
734011	2014	2014-05-15	43	44	Sardar Patel Stadium, Motera	Ahmedabad	44	field	43	\N	62	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
734031	2014	2014-05-23	37	44	Wankhede Stadium	Mumbai	44	field	37	\N	15	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
733997	2014	2014-05-11	45	39	Barabati Stadium	Cuttack	39	field	39	\N	9	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
734025	2014	2014-05-21	45	37	Punjab Cricket Association Stadium, Mohali	Chandigarh	37	field	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
419111	2010	2010-03-15	43	\N	Sardar Patel Stadium, Motera	Ahmedabad	\N	field	\N	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	RR	DD
734049	2014	2014-06-01	39	45	M Chinnaswamy Stadium	Bangalore	39	field	39	\N	3	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
729295	2014	2014-04-22	45	34	Sharjah Cricket Stadium	\N	34	field	45	\N	72	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	SRH
733987	2014	2014-05-07	45	42	Barabati Stadium	Cuttack	42	field	45	\N	44	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
734033	2014	2014-05-23	45	43	Punjab Cricket Association Stadium, Mohali	Chandigarh	43	field	45	\N	16	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
729307	2014	2014-04-26	39	45	Sheikh Zayed Stadium	Abu Dhabi	39	field	45	\N	23	2026-03-02 04:06:21.186712+00	PBKS	\N	KKR	PBKS
734047	2014	2014-05-30	42	45	Wankhede Stadium	Mumbai	42	field	45	\N	24	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
734043	2014	2014-05-27	45	39	Eden Gardens	Kolkata	45	field	39	\N	28	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
733973	2014	2014-05-03	37	45	Wankhede Stadium	Mumbai	45	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	PBKS
729291	2014	2014-04-20	43	45	Sharjah Cricket Stadium	\N	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	RR	PBKS
734007	2014	2014-05-14	34	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	SRH	PBKS
734019	2014	2014-05-19	44	45	Feroz Shah Kotla	Delhi	45	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	DC	PBKS
419120	2010	2010-03-21	49	\N	Barabati Stadium	Cuttack	49	bat	49	\N	10	2026-03-02 17:59:26.260913+00	\N	\N	DCG	DD
419110	2010	2010-03-14	42	49	MA Chidambaram Stadium, Chepauk	Chennai	49	bat	49	\N	31	2026-03-02 17:59:26.260913+00	\N	\N	CSK	DCG
419116	2010	2010-03-19	\N	42	Feroz Shah Kotla	Delhi	\N	bat	42	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	DD	CSK
419108	2010	2010-03-13	45	\N	Punjab Cricket Association Stadium, Mohali	Chandigarh	\N	field	\N	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	DD
419149	2010	2010-04-11	\N	45	Feroz Shah Kotla	Delhi	\N	bat	45	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	DD	PBKS
419125	2010	2010-03-25	42	37	Brabourne Stadium, Mumbai	Mumbai	37	field	37	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	CSK	MI
419114	2010	2010-03-17	\N	37	Feroz Shah Kotla	Delhi	\N	field	37	\N	98	2026-03-02 17:59:26.260913+00	\N	\N	DD	MI
1082593	2017	2017-04-07	38	39	Saurashtra Cricket Association Stadium	Rajkot	39	field	39	\N	10	2026-03-02 04:06:21.186712+00	KKR	\N	GL	KKR
1082596	2017	2017-04-09	34	38	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	GL
1082600	2017	2017-04-12	37	34	Wankhede Stadium	Mumbai	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
1082604	2017	2017-04-15	39	34	Eden Gardens	Kolkata	34	field	39	\N	17	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1082606	2017	2017-04-16	37	38	Wankhede Stadium	Mumbai	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	MI	GL
1082613	2017	2017-04-21	39	38	Eden Gardens	Kolkata	38	field	38	\N	4	2026-03-02 04:06:21.186712+00	GL	\N	KKR	GL
1082627	2017	2017-04-30	34	39	Rajiv Gandhi International Stadium, Uppal	Hyderabad	39	field	34	\N	48	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
1082625	2017	2017-04-29	38	37	Saurashtra Cricket Association Stadium	Rajkot	38	bat	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	GL	MI
1254069	2021	2021-04-19	42	43	Wankhede Stadium, Mumbai	Mumbai	43	field	42	\N	45	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
1254070	2021	2021-04-20	37	44	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	37	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	MI	DC
1254071	2021	2021-04-21	45	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	45	bat	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1254072	2021	2021-04-21	42	39	Wankhede Stadium, Mumbai	Mumbai	39	field	42	\N	18	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
1254074	2021	2021-04-23	37	45	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	45	field	45	\N	9	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
1254075	2021	2021-04-24	39	43	Wankhede Stadium, Mumbai	Mumbai	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	KKR	RR
1254078	2021	2021-04-26	45	39	Narendra Modi Stadium, Ahmedabad	Ahmedabad	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
1254080	2021	2021-04-28	34	42	Arun Jaitley Stadium, Delhi	Delhi	34	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
598017	2013	2013-04-16	48	44	M Chinnaswamy Stadium	Bangalore	48	field	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	RCB	DC
829813	2015	2015-05-17	48	44	M Chinnaswamy Stadium	Bangalore	48	field	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	RCB	DC
1254104	2021	2021-09-19	42	37	Dubai International Cricket Stadium	Dubai	42	bat	42	\N	20	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
1254105	2021	2021-09-22	34	44	Dubai International Cricket Stadium	Dubai	34	bat	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	SRH	DC
1254106	2021	2021-10-07	39	43	Sharjah Cricket Stadium	Sharjah	43	field	39	\N	86	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
419130	2010	2010-03-28	49	37	Dr DY Patil Sports Academy	Mumbai	49	field	37	\N	41	2026-03-02 17:59:26.260913+00	\N	\N	DCG	MI
419109	2010	2010-03-14	39	48	Eden Gardens	Kolkata	39	field	39	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	KKR	RCB
1254107	2021	2021-09-25	45	34	Sharjah Cricket Stadium	Sharjah	34	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	SRH
1254109	2021	2021-10-03	34	39	Dubai International Cricket Stadium	Dubai	34	bat	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1254110	2021	2021-10-04	42	44	Dubai International Cricket Stadium	Dubai	44	field	44	\N	3	2026-03-02 04:06:21.186712+00	DC	\N	CSK	DC
1254111	2021	2021-09-21	43	45	Dubai International Cricket Stadium	Dubai	45	field	43	\N	2	2026-03-02 04:06:21.186712+00	RR	\N	RR	PBKS
1254112	2021	2021-10-02	37	44	Sharjah Cricket Stadium	Sharjah	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	MI	DC
1254114	2021	2021-10-10	44	42	Dubai International Cricket Stadium	Dubai	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
1254116	2021	2021-10-13	44	39	Sharjah Cricket Stadium	Sharjah	39	field	39	\N	3	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
1254117	2021	2021-10-15	42	39	Dubai International Cricket Stadium	Dubai	39	field	42	\N	27	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
1304047	2022	2022-03-26	42	39	Wankhede Stadium, Mumbai	Mumbai	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
1304048	2022	2022-03-27	37	44	Brabourne Stadium, Mumbai	Mumbai	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	MI	DC
1304050	2022	2022-03-28	46	47	Wankhede Stadium, Mumbai	Mumbai	47	field	47	\N	5	2026-03-02 04:06:21.186712+00	GT	\N	LSG	GT
1304051	2022	2022-03-29	43	34	Maharashtra Cricket Association Stadium, Pune	Pune	34	field	43	\N	61	2026-03-02 04:06:21.186712+00	RR	\N	RR	SRH
1304053	2022	2022-03-31	42	46	Brabourne Stadium, Mumbai	Mumbai	46	field	46	\N	6	2026-03-02 04:06:21.186712+00	LSG	\N	CSK	LSG
1304054	2022	2022-04-01	45	39	Wankhede Stadium, Mumbai	Mumbai	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
1304055	2022	2022-04-02	43	37	Dr DY Patil Sports Academy, Mumbai	Mumbai	37	field	43	\N	23	2026-03-02 04:06:21.186712+00	RR	\N	RR	MI
1304056	2022	2022-04-02	47	44	Maharashtra Cricket Association Stadium, Pune	Pune	44	field	47	\N	14	2026-03-02 04:06:21.186712+00	GT	\N	GT	DC
1304057	2022	2022-04-03	45	42	Brabourne Stadium, Mumbai	Mumbai	42	field	45	\N	54	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
1304058	2022	2022-04-04	46	34	Dr DY Patil Sports Academy, Mumbai	Mumbai	34	field	46	\N	12	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	SRH
1304060	2022	2022-04-06	37	39	Maharashtra Cricket Association Stadium, Pune	Pune	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	MI	KKR
1082638	2017	2017-05-08	34	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	37	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
1082643	2017	2017-05-13	38	34	Green Park	Kanpur	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	GL	SRH
1082644	2017	2017-05-13	39	37	Eden Gardens	Kolkata	39	field	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
1082610	2017	2017-04-18	38	48	Saurashtra Cricket Association Stadium	Rajkot	38	field	48	\N	21	2026-03-02 04:06:21.186712+00	RCB	\N	GL	RCB
1082591	2017	2017-04-05	34	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	field	34	\N	35	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1082601	2017	2017-04-13	39	45	Eden Gardens	Kolkata	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
1304061	2022	2022-04-07	44	46	Dr DY Patil Sports Academy, Mumbai	Mumbai	46	field	46	\N	6	2026-03-02 04:06:21.186712+00	LSG	\N	DC	LSG
1304062	2022	2022-04-08	45	47	Brabourne Stadium, Mumbai	Mumbai	47	field	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	PBKS	GT
1304063	2022	2022-04-09	42	34	Dr DY Patil Sports Academy, Mumbai	Mumbai	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	CSK	SRH
1304065	2022	2022-04-10	44	39	Brabourne Stadium, Mumbai	Mumbai	39	field	44	\N	44	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
1304066	2022	2022-04-10	43	46	Wankhede Stadium, Mumbai	Mumbai	46	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	RR	LSG
1304067	2022	2022-04-11	47	34	Dr DY Patil Sports Academy, Mumbai	Mumbai	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	GT	SRH
1304069	2022	2022-04-13	45	37	Maharashtra Cricket Association Stadium, Pune	Pune	37	field	45	\N	12	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	MI
1304070	2022	2022-04-14	47	43	Dr DY Patil Sports Academy, Mumbai	Mumbai	43	field	47	\N	37	2026-03-02 04:06:21.186712+00	GT	\N	GT	RR
1304071	2022	2022-04-15	39	34	Brabourne Stadium, Mumbai	Mumbai	34	field	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	KKR	SRH
1304072	2022	2022-04-16	46	37	Brabourne Stadium, Mumbai	Mumbai	37	field	46	\N	18	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	MI
1304074	2022	2022-04-17	45	34	Dr DY Patil Sports Academy, Mumbai	Mumbai	34	field	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1304075	2022	2022-04-17	42	47	Maharashtra Cricket Association Stadium, Pune	Pune	47	field	47	\N	3	2026-03-02 04:06:21.186712+00	GT	\N	CSK	GT
1304076	2022	2022-04-18	43	39	Brabourne Stadium, Mumbai	Mumbai	39	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RR	KKR
1304078	2022	2022-04-20	45	44	Brabourne Stadium, Mumbai	Mumbai	44	field	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
1304079	2022	2022-04-21	37	42	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	42	field	42	\N	3	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
1304080	2022	2022-04-22	43	44	Wankhede Stadium, Mumbai	Mumbai	44	field	43	\N	15	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
1304081	2022	2022-04-23	47	39	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	47	bat	47	\N	8	2026-03-02 04:06:21.186712+00	GT	\N	GT	KKR
1304083	2022	2022-04-24	46	37	Wankhede Stadium, Mumbai	Mumbai	37	field	46	\N	36	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	MI
1304084	2022	2022-04-25	45	42	Wankhede Stadium, Mumbai	Mumbai	42	field	45	\N	11	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
1304068	2022	2022-04-12	42	48	Dr DY Patil Sports Academy, Mumbai	Mumbai	48	field	42	\N	23	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
1254103	2021	2021-09-29	43	48	Dubai International Cricket Stadium	Dubai	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
1304052	2022	2022-03-30	39	48	Dr DY Patil Sports Academy, Mumbai	Mumbai	48	field	48	\N	3	2026-03-02 04:06:21.186712+00	RCB	\N	KKR	RCB
1304059	2022	2022-04-05	43	48	Wankhede Stadium, Mumbai	Mumbai	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
1082617	2017	2017-04-23	39	48	Eden Gardens	Kolkata	48	field	39	\N	82	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
1304064	2022	2022-04-09	37	48	Maharashtra Cricket Association Stadium, Pune	Pune	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	MI	RCB
1304086	2022	2022-04-27	34	47	Wankhede Stadium, Mumbai	Mumbai	47	field	47	\N	5	2026-03-02 04:06:21.186712+00	GT	\N	SRH	GT
1304087	2022	2022-04-28	39	44	Wankhede Stadium, Mumbai	Mumbai	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
1304088	2022	2022-04-29	46	45	Maharashtra Cricket Association Stadium, Pune	Pune	45	field	46	\N	20	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	PBKS
1304090	2022	2022-04-30	43	37	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
1304091	2022	2022-05-01	46	44	Wankhede Stadium, Mumbai	Mumbai	46	bat	46	\N	6	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	DC
1304092	2022	2022-05-01	42	34	Maharashtra Cricket Association Stadium, Pune	Pune	34	field	42	\N	13	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	SRH
1304093	2022	2022-05-02	43	39	Wankhede Stadium, Mumbai	Mumbai	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
1304094	2022	2022-05-03	47	45	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	47	bat	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	GT	PBKS
1304096	2022	2022-05-05	44	34	Brabourne Stadium, Mumbai	Mumbai	34	field	44	\N	21	2026-03-02 04:06:21.186712+00	DC	\N	DC	SRH
1304097	2022	2022-05-06	37	47	Brabourne Stadium, Mumbai	Mumbai	47	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	GT
1304098	2022	2022-05-07	45	43	Wankhede Stadium, Mumbai	Mumbai	45	bat	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
1304099	2022	2022-05-07	46	39	Maharashtra Cricket Association Stadium, Pune	Pune	39	field	46	\N	75	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	KKR
1304101	2022	2022-05-08	42	44	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	44	field	42	\N	91	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
419127	2010	2010-03-27	45	39	Punjab Cricket Association Stadium, Mohali	Chandigarh	39	bat	39	\N	39	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	KKR
419123	2010	2010-03-23	48	42	M Chinnaswamy Stadium	Bangalore	42	field	48	\N	36	2026-03-02 17:59:26.260913+00	\N	\N	RCB	CSK
419112	2010	2010-03-16	48	45	M Chinnaswamy Stadium	Bangalore	45	bat	48	\N	8	2026-03-02 17:59:26.260913+00	\N	\N	RCB	PBKS
419115	2010	2010-03-18	48	43	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	10	2026-03-02 17:59:26.260913+00	\N	\N	RCB	RR
419134	2010	2010-03-31	\N	43	Feroz Shah Kotla	Delhi	\N	bat	\N	\N	67	2026-03-02 17:59:26.260913+00	\N	\N	DD	RR
1082603	2017	2017-04-14	38	52	Saurashtra Cricket Association Stadium	Rajkot	38	field	38	\N	7	2026-03-02 04:06:21.186712+00	GL	\N	GL	RPS
1082611	2017	2017-04-19	34	44	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	34	\N	15	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	DC
1082622	2017	2017-04-28	39	44	Eden Gardens	Kolkata	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
1082612	2017	2017-04-20	45	37	Holkar Cricket Stadium	Indore	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
1082637	2017	2017-05-07	45	38	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	38	field	38	\N	6	2026-03-02 04:06:21.186712+00	GL	\N	PBKS	GL
1082608	2017	2017-04-17	44	39	Feroz Shah Kotla	Delhi	44	bat	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
1175365	2019	2019-03-30	39	44	Arun Jaitley Stadium	Delhi	44	field	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	KKR	DC
1082635	2017	2017-05-06	44	37	Feroz Shah Kotla	Delhi	44	field	37	\N	146	2026-03-02 04:06:21.186712+00	MI	\N	DC	MI
1082614	2017	2017-04-22	37	44	Wankhede Stadium	Mumbai	44	field	37	\N	14	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
1082630	2017	2017-05-02	44	34	Feroz Shah Kotla	Delhi	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	DC	SRH
1178426	2019	2019-05-02	37	34	Wankhede Stadium	Mumbai	37	bat	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	MI	SRH
1304102	2022	2022-05-09	39	37	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	37	field	39	\N	52	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
1304103	2022	2022-05-10	47	46	Maharashtra Cricket Association Stadium, Pune	Pune	47	bat	47	\N	62	2026-03-02 04:06:21.186712+00	GT	\N	GT	LSG
1304104	2022	2022-05-11	43	44	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	RR	DC
1304105	2022	2022-05-12	42	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
1304107	2022	2022-05-14	39	34	Maharashtra Cricket Association Stadium, Pune	Pune	39	bat	39	\N	54	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1304108	2022	2022-05-15	42	47	Wankhede Stadium, Mumbai	Mumbai	42	bat	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	CSK	GT
1304109	2022	2022-05-15	43	46	Brabourne Stadium, Mumbai	Mumbai	43	bat	43	\N	24	2026-03-02 04:06:21.186712+00	RR	\N	RR	LSG
1304110	2022	2022-05-16	44	45	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	45	field	44	\N	17	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
1304111	2022	2022-05-17	34	37	Wankhede Stadium, Mumbai	Mumbai	37	field	34	\N	3	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
1304112	2022	2022-05-18	46	39	Dr DY Patil Sports Academy, Mumbai	Navi Mumbai	46	bat	46	\N	2	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	KKR
1304114	2022	2022-05-20	42	43	Brabourne Stadium, Mumbai	Mumbai	42	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	CSK	RR
1304115	2022	2022-05-21	44	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	DC	MI
1304116	2022	2022-05-22	34	45	Wankhede Stadium, Mumbai	Mumbai	34	bat	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	SRH	PBKS
1312197	2022	2022-05-24	43	47	Eden Gardens, Kolkata	Kolkata	47	field	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	RR	GT
1312200	2022	2022-05-29	43	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	43	bat	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	RR	GT
1359475	2023	2023-03-31	42	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	47	field	47	\N	5	2026-03-02 04:06:21.186712+00	GT	\N	CSK	GT
1359476	2023	2023-04-01	45	39	Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh	Chandigarh	39	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	KKR
419133	2010	2010-03-31	42	48	MA Chidambaram Stadium, Chepauk	Chennai	48	bat	42	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	CSK	RCB
419139	2010	2010-04-04	39	45	Eden Gardens	Kolkata	39	bat	45	\N	8	2026-03-02 17:59:26.260913+00	\N	\N	KKR	PBKS
1359477	2023	2023-04-01	46	44	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	44	field	46	\N	50	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	DC
1359478	2023	2023-04-02	43	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	field	43	\N	72	2026-03-02 04:06:21.186712+00	RR	\N	RR	SRH
1359480	2023	2023-04-03	42	46	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	46	field	42	\N	12	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	LSG
1359481	2023	2023-04-04	44	47	Arun Jaitley Stadium, Delhi	Delhi	47	field	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	DC	GT
1359482	2023	2023-04-05	45	43	Barsapara Cricket Stadium, Guwahati	Guwahati	43	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
1359484	2023	2023-04-07	34	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	34	bat	46	\N	5	2026-03-02 04:06:21.186712+00	LSG	\N	SRH	LSG
1359485	2023	2023-04-08	43	44	Barsapara Cricket Stadium, Guwahati	Guwahati	44	field	43	\N	57	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
1359486	2023	2023-04-08	37	42	Wankhede Stadium, Mumbai	Mumbai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
1359487	2023	2023-04-09	47	39	Narendra Modi Stadium, Ahmedabad	Ahmedabad	47	bat	39	\N	3	2026-03-02 04:06:21.186712+00	KKR	\N	GT	KKR
419151	2010	2010-04-12	49	48	Vidarbha Cricket Association Stadium, Jamtha	Nagpur	48	field	49	\N	13	2026-03-02 17:59:26.260913+00	\N	\N	DCG	RCB
419145	2010	2010-04-08	48	49	M Chinnaswamy Stadium	Bangalore	49	field	49	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	RCB	DCG
419163	2010	2010-04-22	42	49	Dr DY Patil Sports Academy	Mumbai	42	bat	42	\N	38	2026-03-02 17:59:26.260913+00	\N	\N	CSK	DCG
419159	2010	2010-04-18	45	42	Himachal Pradesh Cricket Association Stadium	Dharamsala	42	field	42	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	CSK
419153	2010	2010-04-13	42	39	MA Chidambaram Stadium, Chepauk	Chennai	39	bat	42	\N	9	2026-03-02 17:59:26.260913+00	\N	\N	CSK	KKR
419142	2010	2010-04-06	42	37	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	24	2026-03-02 17:59:26.260913+00	\N	\N	CSK	MI
419146	2010	2010-04-09	45	37	Punjab Cricket Association Stadium, Mohali	Chandigarh	37	bat	45	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	MI
419161	2010	2010-04-19	39	37	Eden Gardens	Kolkata	37	bat	39	\N	9	2026-03-02 17:59:26.260913+00	\N	\N	KKR	MI
419119	2010	2010-03-20	37	48	Brabourne Stadium	Mumbai	37	bat	48	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	MI	RCB
1082632	2017	2017-05-04	44	38	Feroz Shah Kotla	Delhi	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	GL
1082618	2017	2017-04-24	37	52	Wankhede Stadium	Mumbai	37	field	52	\N	3	2026-03-02 04:06:21.186712+00	RPS	\N	MI	RPS
1082605	2017	2017-04-15	44	45	Feroz Shah Kotla	Delhi	44	bat	44	\N	51	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
1082639	2017	2017-05-09	45	39	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	39	field	45	\N	14	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	KKR
1082598	2017	2017-04-10	45	48	Holkar Cricket Stadium	Indore	48	bat	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
1082616	2017	2017-04-23	38	45	Saurashtra Cricket Association Stadium	Rajkot	38	field	45	\N	26	2026-03-02 04:06:21.186712+00	PBKS	\N	GL	PBKS
1082641	2017	2017-05-11	37	45	Wankhede Stadium	Mumbai	37	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
1254077	2021	2021-04-25	44	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	44	bat	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	DC	SRH
1359488	2023	2023-04-09	45	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1359490	2023	2023-04-11	44	37	Arun Jaitley Stadium, Delhi	Delhi	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	DC	MI
1359491	2023	2023-04-12	43	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	RR	CSK
1304113	2022	2022-05-19	47	48	Wankhede Stadium, Mumbai	Mumbai	47	bat	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	GT	RCB
1304085	2022	2022-04-26	43	48	Maharashtra Cricket Association Stadium, Pune	Pune	48	field	43	\N	29	2026-03-02 04:06:21.186712+00	RR	\N	RR	RCB
1304106	2022	2022-05-13	45	48	Brabourne Stadium, Mumbai	Mumbai	48	field	45	\N	54	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
1359483	2023	2023-04-06	39	48	Eden Gardens, Kolkata	Kolkata	48	field	39	\N	81	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
1359479	2023	2023-04-02	37	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	MI	RCB
1359492	2023	2023-04-13	45	47	Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh	Chandigarh	47	field	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	PBKS	GT
1359493	2023	2023-04-14	34	39	Eden Gardens, Kolkata	Kolkata	39	field	34	\N	23	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
1359495	2023	2023-04-15	46	45	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	45	field	45	\N	2	2026-03-02 04:06:21.186712+00	PBKS	\N	LSG	PBKS
1359496	2023	2023-04-16	39	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
1359497	2023	2023-04-16	47	43	Narendra Modi Stadium, Ahmedabad	Ahmedabad	43	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	GT	RR
1359499	2023	2023-04-18	37	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	field	37	\N	14	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
1359500	2023	2023-04-19	46	43	Sawai Mansingh Stadium, Jaipur	Jaipur	43	field	46	\N	10	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	RR
1359502	2023	2023-04-20	39	44	Arun Jaitley Stadium, Delhi	Delhi	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
1359503	2023	2023-04-21	34	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
1359504	2023	2023-04-22	47	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	47	bat	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	GT	LSG
1359505	2023	2023-04-22	45	37	Wankhede Stadium, Mumbai	Mumbai	37	field	45	\N	13	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	MI
1359507	2023	2023-04-23	42	39	Eden Gardens, Kolkata	Kolkata	39	field	42	\N	49	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
419129	2010	2010-03-28	43	42	Sardar Patel Stadium, Motera	Ahmedabad	43	bat	43	\N	17	2026-03-02 17:59:26.260913+00	\N	\N	RR	CSK
1359508	2023	2023-04-24	44	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	44	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	SRH
1359509	2023	2023-04-25	47	37	Narendra Modi Stadium, Ahmedabad	Ahmedabad	37	field	47	\N	55	2026-03-02 04:06:21.186712+00	GT	\N	GT	MI
1359511	2023	2023-04-27	43	42	Sawai Mansingh Stadium, Jaipur	Jaipur	43	bat	43	\N	32	2026-03-02 04:06:21.186712+00	RR	\N	RR	CSK
1359512	2023	2023-04-28	46	45	Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh	Chandigarh	45	field	46	\N	56	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	PBKS
1359513	2023	2023-04-29	39	47	Eden Gardens, Kolkata	Kolkata	47	field	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	KKR	GT
1359514	2023	2023-04-29	34	44	Arun Jaitley Stadium, Delhi	Delhi	34	bat	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	DC
1359515	2023	2023-04-30	42	45	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	bat	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
1359516	2023	2023-04-30	43	37	Wankhede Stadium, Mumbai	Mumbai	43	bat	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
1359518	2023	2023-05-02	44	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	44	bat	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	DC	GT
1359520	2023	2023-05-03	45	37	Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh	Chandigarh	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
1359521	2023	2023-05-04	39	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	39	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1359522	2023	2023-05-05	43	47	Sawai Mansingh Stadium, Jaipur	Jaipur	43	bat	47	\N	9	2026-03-02 04:06:21.186712+00	GT	\N	RR	GT
1082623	2017	2017-04-28	45	34	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	45	field	34	\N	26	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1082609	2017	2017-04-17	34	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	45	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
1082626	2017	2017-04-30	45	44	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	45	field	45	\N	10	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1082620	2017	2017-04-26	52	39	Maharashtra Cricket Association Stadium	Pune	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	RPS	KKR
1082642	2017	2017-05-12	44	52	Feroz Shah Kotla	Delhi	44	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	RPS
1082594	2017	2017-04-08	45	52	Holkar Cricket Stadium	Indore	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RPS
1359523	2023	2023-05-06	37	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
1359525	2023	2023-05-07	47	46	Narendra Modi Stadium, Ahmedabad	Ahmedabad	46	field	47	\N	56	2026-03-02 04:06:21.186712+00	GT	\N	GT	LSG
1359526	2023	2023-05-07	43	34	Sawai Mansingh Stadium, Jaipur	Jaipur	43	bat	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
1359527	2023	2023-05-08	45	39	Eden Gardens, Kolkata	Kolkata	45	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
1359529	2023	2023-05-10	42	44	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	bat	42	\N	27	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
1359530	2023	2023-05-11	39	43	Eden Gardens, Kolkata	Kolkata	43	field	43	\N	9	2026-03-02 04:06:21.186712+00	RR	\N	KKR	RR
1359531	2023	2023-05-12	37	47	Wankhede Stadium, Mumbai	Mumbai	47	field	37	\N	27	2026-03-02 04:06:21.186712+00	MI	\N	MI	GT
1359532	2023	2023-05-13	34	46	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	bat	46	\N	7	2026-03-02 04:06:21.186712+00	LSG	\N	SRH	LSG
1359533	2023	2023-05-13	45	44	Arun Jaitley Stadium, Delhi	Delhi	44	field	45	\N	31	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1359535	2023	2023-05-14	42	39	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	bat	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
1359536	2023	2023-05-15	47	34	Narendra Modi Stadium, Ahmedabad	Ahmedabad	34	field	47	\N	34	2026-03-02 04:06:21.186712+00	GT	\N	GT	SRH
1359537	2023	2023-05-16	46	37	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	37	field	46	\N	5	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	MI
1359538	2023	2023-05-17	44	45	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	45	field	44	\N	15	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
1359540	2023	2023-05-19	45	43	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	43	field	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
1359541	2023	2023-05-20	42	44	Arun Jaitley Stadium, Delhi	Delhi	42	bat	42	\N	77	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
1359542	2023	2023-05-20	46	39	Eden Gardens, Kolkata	Kolkata	39	field	46	\N	1	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	KKR
1359498	2023	2023-04-17	42	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
1359510	2023	2023-04-26	39	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	39	\N	21	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
1359539	2023	2023-05-18	34	48	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	SRH	RCB
1359543	2023	2023-05-21	34	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
1370350	2023	2023-05-23	42	47	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	47	field	42	\N	15	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	GT
1370351	2023	2023-05-24	37	46	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	37	bat	37	\N	81	2026-03-02 04:06:21.186712+00	MI	\N	MI	LSG
1370352	2023	2023-05-26	47	37	Narendra Modi Stadium, Ahmedabad	Ahmedabad	37	field	47	\N	62	2026-03-02 04:06:21.186712+00	GT	\N	GT	MI
1370353	2023	2023-05-29	47	42	Narendra Modi Stadium, Ahmedabad	Ahmedabad	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	GT	CSK
1422119	2024	2024-03-22	48	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	48	bat	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
1422120	2024	2024-03-23	44	45	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	DC	PBKS
1422121	2024	2024-03-23	39	34	Eden Gardens, Kolkata	Kolkata	34	field	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1422122	2024	2024-03-24	43	46	Sawai Mansingh Stadium, Jaipur	Jaipur	43	bat	43	\N	20	2026-03-02 04:06:21.186712+00	RR	\N	RR	LSG
1422123	2024	2024-03-24	47	37	Narendra Modi Stadium, Ahmedabad	Ahmedabad	37	field	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	GT	MI
1422124	2024	2024-03-25	45	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
1422125	2024	2024-03-26	42	47	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	47	field	42	\N	63	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	GT
1426293	2024	2024-05-06	34	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
1422126	2024	2024-03-27	34	37	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	37	field	34	\N	31	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
1422127	2024	2024-03-28	43	44	Sawai Mansingh Stadium, Jaipur	Jaipur	44	field	43	\N	12	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
1422128	2024	2024-03-29	48	39	M Chinnaswamy Stadium, Bengaluru	Bengaluru	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1082624	2017	2017-04-29	52	48	Maharashtra Cricket Association Stadium	Pune	48	field	52	\N	61	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	RCB
1082634	2017	2017-05-06	34	52	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	52	\N	12	2026-03-02 04:06:21.186712+00	RPS	\N	SRH	RPS
1082592	2017	2017-04-06	52	37	Maharashtra Cricket Association Stadium	Pune	52	field	52	\N	7	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	MI
1082599	2017	2017-04-11	52	44	Maharashtra Cricket Association Stadium	Pune	52	field	44	\N	97	2026-03-02 04:06:21.186712+00	DC	\N	RPS	DC
1082615	2017	2017-04-22	52	34	Maharashtra Cricket Association Stadium	Pune	52	field	52	\N	6	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	SRH
1422129	2024	2024-03-30	46	45	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	bat	46	\N	21	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	PBKS
1422130	2024	2024-03-31	34	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	34	bat	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	SRH	GT
1422131	2024	2024-03-31	44	42	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium, Visakhapatnam	Visakhapatnam	44	bat	44	\N	20	2026-03-02 04:06:21.186712+00	DC	\N	DC	CSK
1422132	2024	2024-04-01	37	43	Wankhede Stadium, Mumbai	Mumbai	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1422133	2024	2024-04-02	46	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	46	\N	28	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	RCB
1422134	2024	2024-04-03	39	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium, Visakhapatnam	Visakhapatnam	39	bat	39	\N	106	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
1422135	2024	2024-04-04	47	45	Narendra Modi Stadium, Ahmedabad	Ahmedabad	45	field	45	\N	3	2026-03-02 04:06:21.186712+00	PBKS	\N	GT	PBKS
1422136	2024	2024-04-05	42	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	field	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	CSK	SRH
1422137	2024	2024-04-06	48	43	Sawai Mansingh Stadium, Jaipur	Jaipur	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
1422138	2024	2024-04-07	37	44	Wankhede Stadium, Mumbai	Mumbai	44	field	37	\N	29	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
1422139	2024	2024-04-07	46	47	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	bat	46	\N	33	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	GT
1426260	2024	2024-04-08	39	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
1426261	2024	2024-04-09	34	45	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	field	34	\N	2	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
1426262	2024	2024-04-10	43	47	Sawai Mansingh Stadium, Jaipur	Jaipur	47	field	47	\N	3	2026-03-02 04:06:21.186712+00	GT	\N	RR	GT
1426263	2024	2024-04-11	48	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
1426264	2024	2024-04-12	46	44	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	LSG	DC
1426265	2024	2024-04-13	45	43	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	43	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
1426266	2024	2024-04-14	46	39	Eden Gardens, Kolkata	Kolkata	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	LSG	KKR
1426267	2024	2024-04-14	42	37	Wankhede Stadium, Mumbai	Mumbai	37	field	42	\N	20	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
1426268	2024	2024-04-15	34	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	34	\N	25	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1426269	2024	2024-04-16	39	43	Eden Gardens, Kolkata	Kolkata	43	field	43	\N	2	2026-03-02 04:06:21.186712+00	RR	\N	KKR	RR
1426270	2024	2024-04-17	47	44	Narendra Modi Stadium, Ahmedabad	Ahmedabad	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	GT	DC
1426271	2024	2024-04-18	37	45	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	field	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	MI	PBKS
1426272	2024	2024-04-19	42	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	field	46	\N	8	2026-03-02 04:06:21.186712+00	LSG	\N	CSK	LSG
1426273	2024	2024-04-20	34	44	Arun Jaitley Stadium, Delhi	Delhi	44	field	34	\N	67	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	DC
1426274	2024	2024-04-21	39	48	Eden Gardens, Kolkata	Kolkata	48	field	39	\N	1	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
1426275	2024	2024-04-21	45	47	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	bat	47	\N	3	2026-03-02 04:06:21.186712+00	GT	\N	PBKS	GT
1426276	2024	2024-04-22	37	43	Sawai Mansingh Stadium, Jaipur	Jaipur	37	bat	43	\N	9	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1426277	2024	2024-04-23	42	46	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	46	field	46	\N	6	2026-03-02 04:06:21.186712+00	LSG	\N	CSK	LSG
1426278	2024	2024-04-24	44	47	Arun Jaitley Stadium, Delhi	Delhi	47	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	DC	GT
1426279	2024	2024-04-25	48	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	48	bat	48	\N	35	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
1426280	2024	2024-04-26	39	45	Eden Gardens, Kolkata	Kolkata	45	field	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	KKR	PBKS
1426281	2024	2024-04-27	44	37	Arun Jaitley Stadium, Delhi	Delhi	37	field	44	\N	10	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
1426282	2024	2024-04-27	46	43	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	LSG	RR
1426283	2024	2024-04-28	47	48	Narendra Modi Stadium, Ahmedabad	Ahmedabad	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	GT	RCB
1426284	2024	2024-04-28	42	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	34	field	42	\N	78	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	SRH
1082629	2017	2017-05-01	52	38	Maharashtra Cricket Association Stadium	Pune	52	field	52	\N	5	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	GL
1082631	2017	2017-05-03	39	52	Eden Gardens	Kolkata	52	field	52	\N	4	2026-03-02 04:06:21.186712+00	RPS	\N	KKR	RPS
1082648	2017	2017-05-17	34	39	M Chinnaswamy Stadium	Bangalore	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1082649	2017	2017-05-19	37	39	M Chinnaswamy Stadium	Bangalore	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
1136561	2018	2018-04-07	37	42	Wankhede Stadium	Mumbai	42	field	42	\N	1	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
1136564	2018	2018-04-09	43	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
1359519	2023	2023-05-03	46	42	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	42	field	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	LSG	CSK
1136565	2018	2018-04-10	39	42	MA Chidambaram Stadium	Chennai	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
1426285	2024	2024-04-29	44	39	Eden Gardens, Kolkata	Kolkata	44	bat	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
1426286	2024	2024-04-30	37	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	field	46	\N	4	2026-03-02 04:06:21.186712+00	LSG	\N	MI	LSG
1426287	2024	2024-05-01	42	45	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
1426288	2024	2024-05-02	34	43	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	bat	34	\N	1	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RR
1426289	2024	2024-05-03	39	37	Wankhede Stadium, Mumbai	Mumbai	37	field	39	\N	24	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
1426290	2024	2024-05-04	47	48	M Chinnaswamy Stadium, Bengaluru	Bengaluru	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	GT	RCB
1426291	2024	2024-05-05	42	45	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	45	field	42	\N	28	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
1426292	2024	2024-05-05	39	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	field	39	\N	98	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	LSG
1426294	2024	2024-05-07	44	43	Arun Jaitley Stadium, Delhi	Delhi	43	field	44	\N	20	2026-03-02 04:06:21.186712+00	DC	\N	DC	RR
1426295	2024	2024-05-08	46	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	46	bat	34	\N	10	2026-03-02 04:06:21.186712+00	SRH	\N	LSG	SRH
1426296	2024	2024-05-09	48	45	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	45	field	48	\N	60	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
1426297	2024	2024-05-10	47	42	Narendra Modi Stadium, Ahmedabad	Ahmedabad	42	field	47	\N	35	2026-03-02 04:06:21.186712+00	GT	\N	GT	CSK
1426298	2024	2024-05-11	39	37	Eden Gardens, Kolkata	Kolkata	37	field	39	\N	18	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
1426299	2024	2024-05-12	43	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	43	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	RR	CSK
1426300	2024	2024-05-12	48	44	M Chinnaswamy Stadium, Bengaluru	Bengaluru	44	field	48	\N	47	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
1426302	2024	2024-05-14	44	46	Arun Jaitley Stadium, Delhi	Delhi	46	field	44	\N	19	2026-03-02 04:06:21.186712+00	DC	\N	DC	LSG
1426303	2024	2024-05-15	43	45	Barsapara Cricket Stadium, Guwahati	Guwahati	43	bat	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	RR	PBKS
1426305	2024	2024-05-17	46	37	Wankhede Stadium, Mumbai	Mumbai	37	field	46	\N	18	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	MI
1426306	2024	2024-05-18	48	42	M Chinnaswamy Stadium, Bengaluru	Bengaluru	42	field	48	\N	27	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
1426307	2024	2024-05-19	45	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	45	bat	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1426309	2024	2024-05-21	34	39	Narendra Modi Stadium, Ahmedabad	Ahmedabad	34	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1426310	2024	2024-05-22	48	43	Narendra Modi Stadium, Ahmedabad	Ahmedabad	43	field	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
1426311	2024	2024-05-24	34	43	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	43	field	34	\N	36	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RR
1426312	2024	2024-05-26	34	39	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	34	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1473438	2025	2025-03-22	39	48	Eden Gardens, Kolkata	Kolkata	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	KKR	RCB
1473439	2025	2025-03-23	34	43	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	43	field	34	\N	44	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RR
1473440	2025	2025-03-23	37	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
1473441	2025	2025-03-24	46	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium, Visakhapatnam	Visakhapatnam	44	field	44	\N	1	2026-03-02 04:06:21.186712+00	DC	\N	LSG	DC
1473442	2025	2025-03-25	45	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	47	field	45	\N	11	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	GT
1473443	2025	2025-03-26	43	39	Barsapara Cricket Stadium, Guwahati	Guwahati	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
1473444	2025	2025-03-27	34	46	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	46	field	46	\N	5	2026-03-02 04:06:21.186712+00	LSG	\N	SRH	LSG
1136567	2018	2018-04-12	37	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	34	\N	1	2026-03-02 04:06:21.186712+00	SRH	\N	MI	SRH
1473445	2025	2025-03-28	48	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	42	field	48	\N	50	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
1473446	2025	2025-03-29	47	37	Narendra Modi Stadium, Ahmedabad	Ahmedabad	37	field	47	\N	36	2026-03-02 04:06:21.186712+00	GT	\N	GT	MI
1473447	2025	2025-03-30	34	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium, Visakhapatnam	Visakhapatnam	34	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	SRH	DC
1473449	2025	2025-03-31	39	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
1473450	2025	2025-04-01	46	45	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	45	field	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	LSG	PBKS
1473451	2025	2025-04-02	48	47	M Chinnaswamy Stadium, Bengaluru	Bengaluru	47	field	47	\N	8	2026-03-02 04:06:21.186712+00	GT	\N	RCB	GT
1473452	2025	2025-04-03	39	34	Eden Gardens, Kolkata	Kolkata	34	field	39	\N	80	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1473453	2025	2025-04-04	46	37	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	37	field	46	\N	12	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	MI
1473454	2025	2025-04-05	44	42	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	44	bat	44	\N	25	2026-03-02 04:06:21.186712+00	DC	\N	DC	CSK
1473455	2025	2025-04-05	43	45	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	field	43	\N	50	2026-03-02 04:06:21.186712+00	RR	\N	RR	PBKS
1473456	2025	2025-04-08	46	39	Eden Gardens, Kolkata	Kolkata	39	field	46	\N	4	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	KKR
1473457	2025	2025-04-06	34	47	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	47	field	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	SRH	GT
1473458	2025	2025-04-07	48	37	Wankhede Stadium, Mumbai	Mumbai	37	field	48	\N	12	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
1473459	2025	2025-04-08	45	42	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	bat	45	\N	18	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
1473460	2025	2025-04-09	47	43	Narendra Modi Stadium, Ahmedabad	Ahmedabad	43	field	47	\N	58	2026-03-02 04:06:21.186712+00	GT	\N	GT	RR
1473461	2025	2025-04-10	48	44	M Chinnaswamy Stadium, Bengaluru	Bengaluru	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	RCB	DC
1473462	2025	2025-04-11	42	39	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
1473463	2025	2025-04-12	47	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	46	field	46	\N	6	2026-03-02 04:06:21.186712+00	LSG	\N	GT	LSG
1473464	2025	2025-04-12	45	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	45	bat	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
1473465	2025	2025-04-13	43	48	Sawai Mansingh Stadium, Jaipur	Jaipur	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
1473466	2025	2025-04-13	37	44	Arun Jaitley Stadium, Delhi	Delhi	44	field	37	\N	12	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
1473467	2025	2025-04-14	46	42	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	LSG	CSK
1473468	2025	2025-04-15	45	39	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	45	bat	45	\N	16	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	KKR
1473470	2025	2025-04-17	34	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
1473471	2025	2025-04-18	48	45	M Chinnaswamy Stadium, Bengaluru	Bengaluru	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
1473472	2025	2025-04-19	44	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	47	field	47	\N	7	2026-03-02 04:06:21.186712+00	GT	\N	DC	GT
1473473	2025	2025-04-19	46	43	Sawai Mansingh Stadium, Jaipur	Jaipur	46	bat	46	\N	2	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	RR
1473474	2025	2025-04-20	45	48	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	Mohali	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
1473475	2025	2025-04-20	42	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
1473476	2025	2025-04-21	47	39	Eden Gardens, Kolkata	Kolkata	39	field	47	\N	39	2026-03-02 04:06:21.186712+00	GT	\N	GT	KKR
1473477	2025	2025-04-22	46	44	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	LSG	DC
1473478	2025	2025-04-23	34	37	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	37	field	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
1473479	2025	2025-04-24	48	43	M Chinnaswamy Stadium, Bengaluru	Bengaluru	43	field	48	\N	11	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
1473480	2025	2025-04-25	42	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	34	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	CSK	SRH
1473482	2025	2025-04-27	37	46	Wankhede Stadium, Mumbai	Mumbai	46	field	37	\N	54	2026-03-02 04:06:21.186712+00	MI	\N	MI	LSG
1473483	2025	2025-04-27	44	48	Arun Jaitley Stadium, Delhi	Delhi	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
1473484	2025	2025-04-28	47	43	Sawai Mansingh Stadium, Jaipur	Jaipur	43	field	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	GT	RR
1473485	2025	2025-04-29	39	44	Arun Jaitley Stadium, Delhi	Delhi	44	field	39	\N	14	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
1473486	2025	2025-04-30	42	45	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	45	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
1473487	2025	2025-05-01	37	43	Sawai Mansingh Stadium, Jaipur	Jaipur	43	field	37	\N	100	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
1473488	2025	2025-05-02	47	34	Narendra Modi Stadium, Ahmedabad	Ahmedabad	34	field	47	\N	38	2026-03-02 04:06:21.186712+00	GT	\N	GT	SRH
1473489	2025	2025-05-03	48	42	M Chinnaswamy Stadium, Bengaluru	Bengaluru	42	field	48	\N	2	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
1473490	2025	2025-05-04	39	43	Eden Gardens, Kolkata	Kolkata	39	bat	39	\N	1	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
1473491	2025	2025-05-04	45	46	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	46	field	45	\N	37	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	LSG
1473493	2025	2025-05-06	37	47	Wankhede Stadium, Mumbai	Mumbai	47	field	47	\N	3	2026-03-02 04:06:21.186712+00	GT	\N	MI	GT
1473494	2025	2025-05-07	39	42	Eden Gardens, Kolkata	Kolkata	39	bat	42	\N	2	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
1473497	2025	2025-05-18	45	43	Sawai Mansingh Stadium, Jaipur	Jaipur	45	bat	45	\N	10	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
1473498	2025	2025-05-18	44	47	Arun Jaitley Stadium, Delhi	Delhi	47	field	47	\N	10	2026-03-02 04:06:21.186712+00	GT	\N	DC	GT
1473499	2025	2025-05-19	46	34	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	34	field	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	LSG	SRH
1473500	2025	2025-05-20	42	43	Arun Jaitley Stadium, Delhi	Delhi	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	CSK	RR
1473501	2025	2025-05-21	37	44	Wankhede Stadium, Mumbai	Mumbai	44	field	37	\N	59	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
1473502	2025	2025-05-22	46	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	47	field	46	\N	33	2026-03-02 04:06:21.186712+00	LSG	\N	LSG	GT
1473503	2025	2025-05-23	34	48	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	48	field	34	\N	42	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1473504	2025	2025-05-25	42	47	Narendra Modi Stadium, Ahmedabad	Ahmedabad	42	bat	42	\N	83	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	GT
1473505	2025	2025-05-25	34	39	Arun Jaitley Stadium, Delhi	Delhi	34	bat	34	\N	110	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
1473506	2025	2025-05-26	37	45	Sawai Mansingh Stadium, Jaipur	Jaipur	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
1473507	2025	2025-05-27	46	48	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	LSG	RCB
1473508	2025	2025-05-29	45	48	Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur	New Chandigarh	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
1473509	2025	2025-05-30	37	47	Maharaja Yadavindra Singh International Cricket Stadium, New Chandigarh	New Chandigarh	37	bat	37	\N	20	2026-03-02 04:06:21.186712+00	MI	\N	MI	GT
1473510	2025	2025-06-01	37	45	Narendra Modi Stadium, Ahmedabad	Ahmedabad	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
1473511	2025	2025-06-03	48	45	Narendra Modi Stadium, Ahmedabad	Ahmedabad	45	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
1485779	2025	2025-05-24	45	44	Sawai Mansingh Stadium, Jaipur	Jaipur	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
392181	2009	2009-04-18	42	37	Newlands	Cape Town	42	field	37	\N	19	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
392184	2009	2009-04-19	49	39	Newlands	Cape Town	39	bat	49	\N	8	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	KKR
392192	2009	2009-04-25	49	37	Kingsmead	Durban	49	bat	49	\N	12	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	MI
392196	2009	2009-04-27	42	49	Kingsmead	Durban	49	field	49	\N	6	2026-03-02 04:06:21.186712+00	DCG	\N	CSK	DCG
392197	2009	2009-04-27	39	37	St George's Park	Port Elizabeth	37	bat	37	\N	92	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
392202	2009	2009-04-30	42	43	SuperSport Park	Centurion	43	field	42	\N	38	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
392203	2009	2009-05-01	39	37	Buffalo Park	East London	37	bat	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
392205	2009	2009-05-02	49	43	St George's Park	Port Elizabeth	49	bat	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	DCG	RR
392209	2009	2009-05-04	42	49	Buffalo Park	East London	42	bat	42	\N	78	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DCG
392212	2009	2009-05-06	49	37	SuperSport Park	Centurion	49	bat	49	\N	19	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	MI
392217	2009	2009-05-09	42	43	De Beers Diamond Oval	Kimberley	43	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
392220	2009	2009-05-11	49	43	De Beers Diamond Oval	Kimberley	49	bat	49	\N	53	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	RR
392225	2009	2009-05-14	37	43	Kingsmead	Durban	43	bat	43	\N	2	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
392227	2009	2009-05-16	42	37	St George's Park	Port Elizabeth	37	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
392228	2009	2009-05-16	49	39	New Wanderers Stadium	Johannesburg	49	field	49	\N	6	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	KKR
392231	2009	2009-05-18	42	39	SuperSport Park	Centurion	42	bat	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
392233	2009	2009-05-20	39	43	Kingsmead	Durban	39	field	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
501198	2011	2011-04-08	42	39	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	2	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
829705	2015	2015-04-08	39	37	Eden Gardens	Kolkata	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
392237	2009	2009-05-22	44	49	SuperSport Park	Centurion	49	field	49	\N	6	2026-03-02 04:06:21.186712+00	DCG	\N	DC	DCG
392214	2009	2009-05-07	42	45	SuperSport Park	Centurion	42	bat	42	\N	12	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
392211	2009	2009-05-05	44	39	Kingsmead	Durban	39	bat	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
392215	2009	2009-05-08	44	37	Buffalo Park	East London	37	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
392234	2009	2009-05-20	42	45	Kingsmead	Durban	42	bat	42	\N	24	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
392183	2009	2009-04-19	44	45	Newlands	Cape Town	44	field	44	\N	10	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
392223	2009	2009-05-13	49	44	Kingsmead	Durban	49	field	44	\N	12	2026-03-02 04:06:21.186712+00	DC	\N	DCG	DC
392198	2009	2009-04-28	44	43	SuperSport Park	Centurion	44	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	DC	RR
392206	2009	2009-05-02	42	44	New Wanderers Stadium	Johannesburg	44	field	42	\N	18	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
392210	2009	2009-05-05	45	43	Kingsmead	Durban	45	field	43	\N	78	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
392219	2009	2009-05-10	44	39	New Wanderers Stadium	Johannesburg	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
392230	2009	2009-05-17	44	43	OUTsurance Oval	Bloemfontein	44	bat	44	\N	14	2026-03-02 04:06:21.186712+00	DC	\N	DC	RR
1473469	2025	2025-04-16	44	43	Arun Jaitley Stadium, Delhi	Delhi	43	field	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	DC	RR
1473481	2025	2025-04-26	45	39	Eden Gardens, Kolkata	Kolkata	45	bat	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	PBKS	KKR
1473492	2025	2025-05-05	44	34	Rajiv Gandhi International Stadium, Uppal, Hyderabad	Hyderabad	34	field	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	DC	SRH
1473495	2025	2025-05-08	45	44	Himachal Pradesh Cricket Association Stadium, Dharamsala	Dharamsala	45	bat	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	PBKS	DC
392235	2009	2009-05-21	44	37	SuperSport Park	Centurion	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
392189	2009	2009-04-23	42	44	Kingsmead	Durban	44	bat	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	CSK	DC
392201	2009	2009-04-30	49	44	SuperSport Park	Centurion	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	DCG	DC
392186	2009	2009-04-21	45	39	Kingsmead	Durban	39	field	39	\N	11	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
392229	2009	2009-05-17	49	45	New Wanderers Stadium	Johannesburg	49	field	45	\N	1	2026-03-02 04:06:21.186712+00	PBKS	\N	DCG	PBKS
392207	2009	2009-05-03	45	39	St George's Park	Port Elizabeth	39	bat	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	KKR
392222	2009	2009-05-12	45	37	SuperSport Park	Centurion	45	bat	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
392216	2009	2009-05-09	49	45	De Beers Diamond Oval	Kimberley	45	field	45	\N	3	2026-03-02 04:06:21.186712+00	PBKS	\N	DCG	PBKS
392226	2009	2009-05-15	44	45	OUTsurance Oval	Bloemfontein	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	DC	PBKS
392195	2009	2009-04-26	45	43	Newlands	Cape Town	45	bat	45	\N	27	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
392200	2009	2009-04-29	45	37	Kingsmead	Durban	45	bat	45	\N	3	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	MI
501199	2011	2011-04-09	49	43	Rajiv Gandhi International Stadium, Uppal	Hyderabad	43	field	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	DCG	RR
501203	2011	2011-04-11	39	49	Eden Gardens	Kolkata	39	bat	39	\N	9	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DCG
501207	2011	2011-04-13	51	50	Dr DY Patil Sports Academy	Mumbai	50	bat	51	\N	4	2026-03-02 04:06:21.186712+00	PW	\N	PW	KTK
501209	2011	2011-04-15	43	39	Sawai Mansingh Stadium	Jaipur	39	field	39	\N	9	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
501210	2011	2011-04-15	37	50	Wankhede Stadium	Mumbai	50	field	50	\N	8	2026-03-02 04:06:21.186712+00	KTK	\N	MI	KTK
501214	2011	2011-04-17	39	43	Eden Gardens	Kolkata	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
501215	2011	2011-04-18	50	42	Nehru Stadium	Kochi	50	field	50	\N	7	2026-03-02 04:06:21.186712+00	KTK	\N	KTK	CSK
501218	2011	2011-04-20	37	51	Wankhede Stadium	Mumbai	51	bat	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	MI	PW
501219	2011	2011-04-20	39	50	Eden Gardens	Kolkata	39	field	50	\N	6	2026-03-02 04:06:21.186712+00	KTK	\N	KKR	KTK
501221	2011	2011-04-22	37	42	Wankhede Stadium	Mumbai	42	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
501224	2011	2011-04-24	49	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	49	field	37	\N	37	2026-03-02 04:06:21.186712+00	MI	\N	DCG	MI
501225	2011	2011-04-24	43	50	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	RR	KTK
501226	2011	2011-04-25	42	51	MA Chidambaram Stadium, Chepauk	Chennai	51	field	42	\N	25	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PW
501228	2011	2011-04-27	51	42	Dr DY Patil Sports Academy	Mumbai	51	bat	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	PW	CSK
501229	2011	2011-04-27	50	49	Nehru Stadium	Kochi	50	field	49	\N	55	2026-03-02 04:06:21.186712+00	DCG	\N	KTK	DCG
501231	2011	2011-04-29	43	37	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RR	MI
501235	2011	2011-05-01	43	51	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RR	PW
501236	2011	2011-05-01	42	49	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	19	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DCG
501239	2011	2011-05-03	49	39	Rajiv Gandhi International Stadium, Uppal	Hyderabad	49	field	39	\N	20	2026-03-02 04:06:21.186712+00	KKR	\N	DCG	KKR
501240	2011	2011-05-04	42	43	MA Chidambaram Stadium, Chepauk	Chennai	43	bat	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
501241	2011	2011-05-04	51	37	Dr DY Patil Sports Academy	Mumbai	51	field	37	\N	21	2026-03-02 04:06:21.186712+00	MI	\N	PW	MI
501242	2011	2011-05-05	50	39	Nehru Stadium	Kochi	39	field	50	\N	17	2026-03-02 04:06:21.186712+00	KTK	\N	KTK	KKR
501245	2011	2011-05-07	39	42	Eden Gardens	Kolkata	42	bat	39	\N	10	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	CSK
501249	2011	2011-05-09	43	42	Sawai Mansingh Stadium	Jaipur	43	field	42	\N	63	2026-03-02 04:06:21.186712+00	CSK	\N	RR	CSK
501250	2011	2011-05-10	49	51	Rajiv Gandhi International Stadium, Uppal	Hyderabad	49	bat	51	\N	6	2026-03-02 04:06:21.186712+00	PW	\N	DCG	PW
501256	2011	2011-05-14	37	49	Wankhede Stadium	Mumbai	49	bat	49	\N	10	2026-03-02 04:06:21.186712+00	DCG	\N	MI	DCG
501211	2011	2011-04-16	42	48	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	21	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
501200	2011	2011-04-09	50	48	Nehru Stadium	Kochi	50	bat	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	KTK	RCB
501216	2011	2011-04-19	44	49	Feroz Shah Kotla	Delhi	49	bat	49	\N	16	2026-03-02 04:06:21.186712+00	DCG	\N	DC	DCG
501208	2011	2011-04-14	49	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	field	49	\N	33	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	RCB
501222	2011	2011-04-22	39	48	Eden Gardens	Kolkata	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	KKR	RCB
501238	2011	2011-05-02	44	50	Feroz Shah Kotla	Delhi	50	field	50	\N	7	2026-03-02 04:06:21.186712+00	KTK	\N	DC	KTK
501227	2011	2011-04-26	44	48	Feroz Shah Kotla	Delhi	48	field	48	\N	3	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
1136570	2018	2018-04-14	39	34	Eden Gardens	Kolkata	34	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	KKR	SRH
1136575	2018	2018-04-18	43	39	Sawai Mansingh Stadium	Jaipur	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
1136577	2018	2018-04-20	42	43	Maharashtra Cricket Association Stadium	Pune	43	field	42	\N	64	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
1136580	2018	2018-04-22	42	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	SRH
1136581	2018	2018-04-22	37	43	Sawai Mansingh Stadium	Jaipur	37	bat	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1136583	2018	2018-04-24	34	37	Wankhede Stadium	Mumbai	37	field	34	\N	31	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
392190	2009	2009-04-23	39	43	Newlands	Cape Town	39	field	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	KKR	RR
1136587	2018	2018-04-28	42	37	Maharashtra Cricket Association Stadium	Pune	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
1136588	2018	2018-04-29	34	43	Sawai Mansingh Stadium	Jaipur	34	bat	34	\N	11	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RR
1136593	2018	2018-05-03	42	39	Eden Gardens	Kolkata	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
1136597	2018	2018-05-06	37	39	Wankhede Stadium	Mumbai	39	field	37	\N	13	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
1136601	2018	2018-05-09	37	39	Eden Gardens	Kolkata	39	field	37	\N	102	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
1136603	2018	2018-05-11	42	43	Sawai Mansingh Stadium	Jaipur	42	bat	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	CSK	RR
1136606	2018	2018-05-13	34	42	Maharashtra Cricket Association Stadium	Pune	42	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
501201	2011	2011-04-10	44	37	Feroz Shah Kotla	Delhi	44	bat	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	DC	MI
501204	2011	2011-04-12	43	44	Sawai Mansingh Stadium	Jaipur	44	bat	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
501230	2011	2011-04-28	44	39	Feroz Shah Kotla	Delhi	44	field	39	\N	17	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
501246	2011	2011-05-07	37	44	Wankhede Stadium	Mumbai	44	field	37	\N	32	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
501213	2011	2011-04-17	51	44	Dr DY Patil Sports Academy	Mumbai	44	field	44	\N	3	2026-03-02 04:06:21.186712+00	DC	\N	PW	DC
501233	2011	2011-04-30	50	44	Nehru Stadium	Kochi	44	bat	44	\N	38	2026-03-02 04:06:21.186712+00	DC	\N	KTK	DC
501234	2011	2011-04-30	39	45	Eden Gardens	Kolkata	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
501220	2011	2011-04-21	45	43	Punjab Cricket Association Stadium, Mohali	Chandigarh	43	field	45	\N	48	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
501251	2011	2011-05-10	45	37	Punjab Cricket Association Stadium, Mohali	Chandigarh	37	field	45	\N	76	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	MI
501206	2011	2011-04-13	45	42	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
501248	2011	2011-05-08	45	51	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	bat	51	\N	5	2026-03-02 04:06:21.186712+00	PW	\N	PBKS	PW
501202	2011	2011-04-10	51	45	Dr DY Patil Sports Academy	Mumbai	45	bat	51	\N	7	2026-03-02 04:06:21.186712+00	PW	\N	PW	PBKS
501237	2011	2011-05-02	37	45	Wankhede Stadium	Mumbai	45	field	37	\N	23	2026-03-02 04:06:21.186712+00	MI	\N	MI	PBKS
501223	2011	2011-04-23	44	45	Feroz Shah Kotla	Delhi	45	field	44	\N	29	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
501212	2011	2011-04-16	49	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	45	field	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	DCG	PBKS
501259	2011	2011-05-16	51	49	Dr DY Patil Sports Academy	Mumbai	49	field	49	\N	6	2026-03-02 04:06:21.186712+00	DCG	\N	PW	DCG
501261	2011	2011-05-18	42	50	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	11	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KTK
501262	2011	2011-05-19	51	39	Dr DY Patil Sports Academy	Mumbai	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	PW	KKR
501263	2011	2011-05-20	37	43	Wankhede Stadium	Mumbai	37	bat	43	\N	10	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
501267	2011	2011-05-22	39	37	Eden Gardens	Kolkata	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
501269	2011	2011-05-25	37	39	Wankhede Stadium	Mumbai	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
548306	2012	2012-04-04	42	37	MA Chidambaram Stadium, Chepauk	Chennai	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
548308	2012	2012-04-06	37	51	Wankhede Stadium	Mumbai	37	field	51	\N	28	2026-03-02 04:06:21.186712+00	PW	\N	MI	PW
548311	2012	2012-04-07	49	42	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	49	field	42	\N	74	2026-03-02 04:06:21.186712+00	CSK	\N	DCG	CSK
1136607	2018	2018-05-13	37	43	Wankhede Stadium	Mumbai	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1136609	2018	2018-05-15	43	39	Eden Gardens	Kolkata	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
1136614	2018	2018-05-19	34	39	Rajiv Gandhi International Stadium	Hyderabad	34	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1136571	2018	2018-04-15	43	48	M.Chinnaswamy Stadium	Bengaluru	48	field	43	\N	19	2026-03-02 04:06:21.186712+00	RR	\N	RR	RCB
1136574	2018	2018-04-17	37	48	Wankhede Stadium	Mumbai	48	field	37	\N	46	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
1136599	2018	2018-05-07	34	48	Rajiv Gandhi International Stadium	Hyderabad	48	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1136579	2018	2018-04-21	44	48	M.Chinnaswamy Stadium	Bengaluru	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
548312	2012	2012-04-08	43	39	Sawai Mansingh Stadium	Jaipur	39	field	43	\N	22	2026-03-02 04:06:21.186712+00	RR	\N	RR	KKR
548314	2012	2012-04-09	49	37	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	49	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	DCG	MI
548317	2012	2012-04-11	37	43	Wankhede Stadium	Mumbai	43	field	37	\N	27	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
548320	2012	2012-04-13	39	43	Eden Gardens	Kolkata	43	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
548322	2012	2012-04-14	51	42	Subrata Roy Sahara Stadium	Pune	42	bat	51	\N	7	2026-03-02 04:06:21.186712+00	PW	\N	PW	CSK
548326	2012	2012-04-17	43	49	Sawai Mansingh Stadium	Jaipur	49	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	RR	DCG
548330	2012	2012-04-19	42	51	MA Chidambaram Stadium, Chepauk	Chennai	51	field	42	\N	13	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PW
548332	2012	2012-04-21	42	43	MA Chidambaram Stadium, Chepauk	Chennai	43	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
548335	2012	2012-04-22	49	39	Barabati Stadium	Cuttack	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	DCG	KKR
548341	2012	2012-04-26	51	49	Subrata Roy Sahara Stadium	Pune	49	bat	49	\N	18	2026-03-02 04:06:21.186712+00	DCG	\N	PW	DCG
548346	2012	2012-04-29	37	49	Wankhede Stadium	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	DCG
548347	2012	2012-04-30	42	39	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	CSK	KKR
548348	2012	2012-05-01	49	51	Barabati Stadium	Cuttack	49	bat	49	\N	13	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	PW
501271	2011	2011-05-28	42	48	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	58	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
548344	2012	2012-04-28	39	48	Eden Gardens	Kolkata	39	bat	39	\N	47	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
548336	2012	2012-04-23	43	48	Sawai Mansingh Stadium	Jaipur	43	field	48	\N	46	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
548318	2012	2012-04-12	42	48	MA Chidambaram Stadium, Chepauk	Chennai	48	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
548321	2012	2012-04-19	44	49	Feroz Shah Kotla	Delhi	49	bat	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	DC	DCG
548342	2012	2012-04-27	44	37	Feroz Shah Kotla	Delhi	37	field	44	\N	37	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
548329	2012	2012-05-10	49	44	Rajiv Gandhi International Stadium, Uppal	Hyderabad	49	bat	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	DCG	DC
548333	2012	2012-04-21	44	51	Feroz Shah Kotla	Delhi	44	field	51	\N	20	2026-03-02 04:06:21.186712+00	PW	\N	DC	PW
548313	2012	2012-04-08	51	45	Subrata Roy Sahara Stadium	Pune	51	bat	51	\N	22	2026-03-02 04:06:21.186712+00	PW	\N	PW	PBKS
548345	2012	2012-04-29	44	43	Feroz Shah Kotla	Delhi	44	bat	44	\N	1	2026-03-02 04:06:21.186712+00	DC	\N	DC	RR
548307	2012	2012-04-05	39	44	Eden Gardens	Kolkata	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
548325	2012	2012-04-16	37	44	Wankhede Stadium	Mumbai	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	MI	DC
1136573	2018	2018-04-16	39	44	Eden Gardens	Kolkata	44	field	39	\N	71	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
548331	2012	2012-04-20	45	48	Punjab Cricket Association Stadium, Mohali	Chandigarh	48	field	48	\N	5	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
548323	2012	2012-04-15	39	45	Eden Gardens	Kolkata	39	field	45	\N	2	2026-03-02 04:06:21.186712+00	PBKS	\N	KKR	PBKS
548334	2012	2012-04-22	37	45	Wankhede Stadium	Mumbai	37	bat	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
548309	2012	2012-04-06	43	45	Sawai Mansingh Stadium	Jaipur	45	field	43	\N	31	2026-03-02 04:06:21.186712+00	RR	\N	RR	PBKS
501264	2011	2011-05-21	45	49	Himachal Pradesh Cricket Association Stadium	Dharamsala	45	field	49	\N	82	2026-03-02 04:06:21.186712+00	DCG	\N	PBKS	DCG
548328	2012	2012-04-18	45	39	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
548339	2012	2012-04-25	45	37	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	bat	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
548319	2012	2012-04-12	45	51	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	PW
501260	2011	2011-05-17	45	48	Himachal Pradesh Cricket Association Stadium	Dharamsala	45	bat	45	\N	111	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
548343	2012	2012-04-28	42	45	MA Chidambaram Stadium, Chepauk	Chennai	45	bat	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
548352	2012	2012-05-04	42	49	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	10	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DCG
548353	2012	2012-05-05	39	51	Eden Gardens	Kolkata	39	bat	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PW
1136586	2018	2018-04-27	44	39	Arun Jaitley Stadium	Delhi	39	field	44	\N	55	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
1136592	2018	2018-05-02	44	43	Arun Jaitley Stadium	Delhi	43	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	DC	RR
1136612	2018	2018-05-18	44	42	Arun Jaitley Stadium	Delhi	42	field	44	\N	34	2026-03-02 04:06:21.186712+00	DC	\N	DC	CSK
1136566	2018	2018-04-11	43	44	Sawai Mansingh Stadium	Jaipur	44	field	43	\N	10	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
1136596	2018	2018-05-05	44	34	Rajiv Gandhi International Stadium	Hyderabad	44	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
1136602	2018	2018-05-10	44	34	Arun Jaitley Stadium	Delhi	44	bat	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
501258	2011	2011-05-15	50	43	Holkar Cricket Stadium	Indore	50	field	50	\N	8	2026-03-02 04:06:21.186712+00	KTK	\N	KTK	RR
501265	2011	2011-05-21	44	51	Feroz Shah Kotla	Delhi	44	bat	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	DC	PW
548355	2012	2012-05-06	37	42	Wankhede Stadium	Mumbai	37	field	37	\N	2	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
548358	2012	2012-05-08	51	43	Subrata Roy Sahara Stadium	Pune	51	bat	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	PW	RR
548361	2012	2012-05-10	43	42	Sawai Mansingh Stadium	Jaipur	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	RR	CSK
548363	2012	2012-05-12	39	37	Eden Gardens	Kolkata	37	bat	37	\N	27	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
548365	2012	2012-05-13	43	51	Sawai Mansingh Stadium	Jaipur	43	bat	43	\N	45	2026-03-02 04:06:21.186712+00	RR	\N	RR	PW
548368	2012	2012-05-14	39	42	Eden Gardens	Kolkata	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
548370	2012	2012-05-16	37	39	Wankhede Stadium	Mumbai	37	field	39	\N	32	2026-03-02 04:06:21.186712+00	KKR	\N	MI	KKR
548373	2012	2012-05-18	49	43	Rajiv Gandhi International Stadium, Uppal	Hyderabad	43	bat	49	\N	5	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	RR
548375	2012	2012-05-19	51	39	Subrata Roy Sahara Stadium	Pune	39	bat	39	\N	34	2026-03-02 04:06:21.186712+00	KKR	\N	PW	KKR
548377	2012	2012-05-20	43	37	Sawai Mansingh Stadium	Jaipur	43	bat	37	\N	10	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
548379	2012	2012-05-23	42	37	M Chinnaswamy Stadium	Bangalore	37	field	42	\N	38	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
548381	2012	2012-05-27	39	42	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	CSK
598000	2013	2013-04-05	34	51	Rajiv Gandhi International Stadium, Uppal	Hyderabad	51	field	34	\N	22	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PW
598002	2013	2013-04-06	42	37	MA Chidambaram Stadium, Chepauk	Chennai	37	bat	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
598005	2013	2013-04-08	43	39	Sawai Mansingh Stadium	Jaipur	39	field	43	\N	19	2026-03-02 04:06:21.186712+00	RR	\N	RR	KKR
598009	2013	2013-04-11	51	43	Subrata Roy Sahara Stadium	Pune	43	bat	51	\N	7	2026-03-02 04:06:21.186712+00	PW	\N	PW	RR
598011	2013	2013-04-13	37	51	Wankhede Stadium	Mumbai	37	bat	37	\N	41	2026-03-02 04:06:21.186712+00	MI	\N	MI	PW
598013	2013	2013-04-14	39	34	Eden Gardens	Kolkata	39	bat	39	\N	48	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
598015	2013	2013-04-15	42	51	MA Chidambaram Stadium, Chepauk	Chennai	51	bat	51	\N	24	2026-03-02 04:06:21.186712+00	PW	\N	CSK	PW
598018	2013	2013-04-17	51	34	Maharashtra Cricket Association Stadium	Pune	51	field	34	\N	11	2026-03-02 04:06:21.186712+00	SRH	\N	PW	SRH
598019	2013	2013-04-17	43	37	Sawai Mansingh Stadium	Jaipur	43	bat	43	\N	87	2026-03-02 04:06:21.186712+00	RR	\N	RR	MI
981001	2016	2016-05-19	38	39	Green Park	Kanpur	38	field	38	\N	6	2026-03-02 04:06:21.186712+00	GL	\N	GL	KKR
548362	2012	2012-05-11	51	48	Subrata Roy Sahara Stadium	Pune	51	field	48	\N	35	2026-03-02 04:06:21.186712+00	RCB	\N	PW	RCB
548376	2012	2012-05-20	49	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	field	49	\N	9	2026-03-02 04:06:21.186712+00	DCG	\N	DCG	RCB
548360	2012	2012-05-09	37	48	Wankhede Stadium	Mumbai	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	MI	RCB
548378	2012	2012-05-22	44	39	Subrata Roy Sahara Stadium	Pune	39	bat	39	\N	18	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
598001	2013	2013-04-06	44	43	Feroz Shah Kotla	Delhi	43	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	DC	RR
548364	2012	2012-05-12	42	44	MA Chidambaram Stadium, Chepauk	Chennai	42	field	42	\N	9	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
597998	2013	2013-04-03	39	44	Eden Gardens	Kolkata	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
598006	2013	2013-04-09	37	44	Wankhede Stadium	Mumbai	37	bat	37	\N	44	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
548349	2012	2012-05-01	43	44	Sawai Mansingh Stadium	Jaipur	43	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	RR	DC
548359	2012	2012-05-08	49	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	49	field	45	\N	25	2026-03-02 04:06:21.186712+00	PBKS	\N	DCG	PBKS
548354	2012	2012-05-05	45	43	Punjab Cricket Association Stadium, Mohali	Chandigarh	43	bat	43	\N	43	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
1136590	2018	2018-04-30	42	44	Maharashtra Cricket Association Stadium	Pune	44	field	42	\N	13	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
1136569	2018	2018-04-14	37	44	Wankhede Stadium	Mumbai	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	MI	DC
1136594	2018	2018-05-04	45	37	Holkar Cricket Stadium	Indore	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
1136568	2018	2018-04-13	45	48	M.Chinnaswamy Stadium	Bengaluru	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
1136600	2018	2018-05-08	43	45	Sawai Mansingh Stadium	Jaipur	43	bat	43	\N	15	2026-03-02 04:06:21.186712+00	RR	\N	RR	PBKS
1082650	2017	2017-05-21	37	52	Rajiv Gandhi International Stadium, Uppal	Hyderabad	37	bat	37	\N	1	2026-03-02 04:06:21.186712+00	MI	\N	MI	RPS
548351	2012	2012-05-03	51	37	Subrata Roy Sahara Stadium	Pune	37	bat	37	\N	1	2026-03-02 04:06:21.186712+00	MI	\N	PW	MI
598004	2013	2013-04-07	34	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	bat	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	SRH	RCB
548357	2012	2012-05-07	44	39	Feroz Shah Kotla	Delhi	44	bat	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
548380	2012	2012-05-25	44	42	MA Chidambaram Stadium, Chepauk	Chennai	44	field	42	\N	86	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
598010	2013	2013-04-12	44	34	Feroz Shah Kotla	Delhi	44	bat	34	\N	3	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
598007	2013	2013-04-10	45	42	Punjab Cricket Association Stadium, Mohali	Chandigarh	42	field	42	\N	10	2026-03-02 04:06:21.186712+00	CSK	\N	PBKS	CSK
548374	2012	2012-05-19	45	44	Himachal Pradesh Cricket Association Stadium	Dharamsala	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
598014	2013	2013-04-14	43	45	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RR	PBKS
548366	2012	2012-05-13	45	49	Punjab Cricket Association Stadium, Mohali	Chandigarh	49	bat	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DCG
598016	2013	2013-04-16	45	39	Punjab Cricket Association Stadium, Mohali	Chandigarh	39	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	KKR
598003	2013	2013-04-07	51	45	Subrata Roy Sahara Stadium	Pune	51	bat	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	PW	PBKS
548369	2012	2012-05-15	44	45	Feroz Shah Kotla	Delhi	45	bat	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
548371	2012	2012-05-17	45	42	Himachal Pradesh Cricket Association Stadium	Dharamsala	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
598022	2013	2013-04-20	39	42	Eden Gardens	Kolkata	39	bat	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
598026	2013	2013-04-22	42	43	MA Chidambaram Stadium, Chepauk	Chennai	43	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
598029	2013	2013-04-24	39	37	Eden Gardens	Kolkata	39	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
598030	2013	2013-04-25	42	34	MA Chidambaram Stadium, Chepauk	Chennai	34	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	SRH
598032	2013	2013-04-27	43	34	Sawai Mansingh Stadium	Jaipur	34	bat	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	RR	SRH
598034	2013	2013-04-28	42	39	MA Chidambaram Stadium, Chepauk	Chennai	39	field	42	\N	14	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
598038	2013	2013-04-30	51	42	Subrata Roy Sahara Stadium	Pune	42	bat	42	\N	37	2026-03-02 04:06:21.186712+00	CSK	\N	PW	CSK
598039	2013	2013-05-01	34	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	37	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
598043	2013	2013-05-03	39	43	Eden Gardens	Kolkata	43	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
598046	2013	2013-05-05	37	42	Wankhede Stadium	Mumbai	37	bat	37	\N	60	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
598047	2013	2013-05-05	43	51	Sawai Mansingh Stadium	Jaipur	51	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	RR	PW
598050	2013	2013-05-07	37	39	Wankhede Stadium	Mumbai	37	bat	37	\N	65	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
598051	2013	2013-05-08	34	42	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	42	\N	77	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
598053	2013	2013-05-09	51	39	Subrata Roy Sahara Stadium	Pune	39	bat	39	\N	46	2026-03-02 04:06:21.186712+00	KKR	\N	PW	KKR
598055	2013	2013-05-11	51	37	Subrata Roy Sahara Stadium	Pune	51	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	PW	MI
598058	2013	2013-05-12	43	42	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	RR	CSK
598060	2013	2013-05-13	37	34	Wankhede Stadium	Mumbai	34	bat	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
598061	2013	2013-05-15	39	51	JSCA International Stadium Complex	Ranchi	39	field	51	\N	7	2026-03-02 04:06:21.186712+00	PW	\N	KKR	PW
598063	2013	2013-05-15	37	43	Wankhede Stadium	Mumbai	43	field	37	\N	14	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
598065	2013	2013-05-17	34	43	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	34	\N	23	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RR
598069	2013	2013-05-19	34	39	Rajiv Gandhi International Stadium, Uppal	Hyderabad	39	bat	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
598070	2013	2013-05-21	42	37	Feroz Shah Kotla	Delhi	42	bat	42	\N	48	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
598071	2013	2013-05-22	43	34	Feroz Shah Kotla	Delhi	34	bat	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	RR	SRH
1136572	2018	2018-04-15	45	42	Punjab Cricket Association IS Bindra Stadium	Chandigarh	42	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	CSK
1136582	2018	2018-04-23	45	44	Arun Jaitley Stadium	Delhi	44	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1136585	2018	2018-04-26	34	45	Rajiv Gandhi International Stadium	Hyderabad	45	field	34	\N	13	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
1136604	2018	2018-05-12	39	45	Holkar Cricket Stadium	Indore	45	field	39	\N	31	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
1136610	2018	2018-05-16	37	45	Wankhede Stadium	Mumbai	45	field	37	\N	3	2026-03-02 04:06:21.186712+00	MI	\N	MI	PBKS
733995	2014	2014-05-10	37	42	Wankhede Stadium	Mumbai	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
734001	2014	2014-05-12	34	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
734003	2014	2014-05-13	42	43	JSCA International Stadium Complex	Ranchi	43	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
734009	2014	2014-05-14	39	37	Barabati Stadium	Cuttack	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
734015	2014	2014-05-18	34	39	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1136576	2018	2018-04-19	45	34	Punjab Cricket Association IS Bindra Stadium	Chandigarh	45	bat	45	\N	15	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	SRH
1136598	2018	2018-05-06	43	45	Holkar Cricket Stadium	Indore	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	RR	PBKS
1136562	2018	2018-04-08	44	45	Punjab Cricket Association IS Bindra Stadium	Chandigarh	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	DC	PBKS
1136617	2018	2018-05-22	34	42	Wankhede Stadium	Mumbai	42	field	42	\N	2	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
1136618	2018	2018-05-23	39	43	Eden Gardens	Kolkata	43	field	39	\N	25	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RR
829711	2015	2015-04-11	42	34	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	45	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	SRH
829723	2015	2015-04-30	39	42	Eden Gardens	Kolkata	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	CSK
1136620	2018	2018-05-27	34	42	Wankhede Stadium	Mumbai	42	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
1175357	2019	2019-03-24	34	39	Eden Gardens	Kolkata	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
1136578	2018	2018-04-21	39	45	Eden Gardens	Kolkata	45	field	45	\N	9	2026-03-02 04:06:21.186712+00	PBKS	\N	KKR	PBKS
1175358	2019	2019-03-24	44	37	Wankhede Stadium	Mumbai	37	field	44	\N	37	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
1175360	2019	2019-03-26	44	42	Arun Jaitley Stadium	Delhi	44	bat	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
1175363	2019	2019-03-29	43	34	Rajiv Gandhi International Stadium	Hyderabad	43	bat	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
1175367	2019	2019-03-31	42	43	MA Chidambaram Stadium	Chennai	43	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
1175370	2019	2019-04-03	37	42	Wankhede Stadium	Mumbai	42	field	37	\N	37	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
829741	2015	2015-04-21	43	45	Sardar Patel Stadium, Motera	Ahmedabad	45	field	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	RR	PBKS
829727	2015	2015-04-16	34	43	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	SRH	RR
829729	2015	2015-04-17	37	42	Wankhede Stadium	Mumbai	37	bat	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	MI	CSK
829735	2015	2015-04-19	43	42	Sardar Patel Stadium, Motera	Ahmedabad	42	bat	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	RR	CSK
829743	2015	2015-04-22	34	39	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	39	field	34	\N	16	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
829751	2015	2015-04-25	37	34	Wankhede Stadium	Mumbai	37	bat	37	\N	20	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
829765	2015	2015-04-28	42	39	MA Chidambaram Stadium, Chepauk	Chennai	39	field	42	\N	2	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
829769	2015	2015-05-01	37	43	Wankhede Stadium	Mumbai	43	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
829773	2015	2015-05-02	34	42	Rajiv Gandhi International Stadium, Uppal	Hyderabad	42	field	34	\N	22	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	CSK
829781	2015	2015-05-04	39	34	Eden Gardens	Kolkata	34	field	39	\N	35	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
829787	2015	2015-05-07	43	34	Brabourne Stadium	Mumbai	43	field	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
829789	2015	2015-05-08	42	37	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
829797	2015	2015-05-10	42	43	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	12	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RR
829805	2015	2015-05-14	37	39	Wankhede Stadium	Mumbai	39	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
829811	2015	2015-05-16	43	39	Brabourne Stadium	Mumbai	43	bat	43	\N	9	2026-03-02 04:06:21.186712+00	RR	\N	RR	KKR
829815	2015	2015-05-17	34	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	SRH	MI
829817	2015	2015-05-19	42	37	Wankhede Stadium	Mumbai	37	bat	37	\N	25	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
829719	2015	2015-04-13	48	34	M Chinnaswamy Stadium	Bangalore	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	RCB	SRH
829779	2015	2015-05-04	42	48	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	24	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
829715	2015	2015-04-12	44	43	Feroz Shah Kotla	Delhi	43	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	DC	RR
829739	2015	2015-04-20	44	39	Feroz Shah Kotla	Delhi	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
829713	2015	2015-04-11	39	48	Eden Gardens	Kolkata	48	field	48	\N	3	2026-03-02 04:06:21.186712+00	RCB	\N	KKR	RCB
829749	2015	2015-04-24	43	48	Sardar Patel Stadium, Motera	Ahmedabad	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
829795	2015	2015-05-10	37	48	Wankhede Stadium	Mumbai	48	bat	48	\N	39	2026-03-02 04:06:21.186712+00	RCB	\N	MI	RCB
829793	2015	2015-05-09	44	34	Shaheed Veer Narayan Singh International Stadium	Raipur	34	bat	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
829757	2015	2015-04-26	44	48	Feroz Shah Kotla	Delhi	48	field	48	\N	10	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
829761	2015	2015-05-07	39	44	Eden Gardens	Kolkata	39	bat	39	\N	13	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
829747	2015	2015-04-23	44	37	Feroz Shah Kotla	Delhi	37	field	44	\N	37	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
829801	2015	2015-05-12	44	42	Shaheed Veer Narayan Singh International Stadium	Raipur	42	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	DC	CSK
829733	2015	2015-04-18	45	39	Maharashtra Cricket Association Stadium	Pune	39	field	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
829707	2015	2015-04-09	42	44	MA Chidambaram Stadium, Chepauk	Chennai	44	field	42	\N	1	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
829777	2015	2015-05-03	43	44	Brabourne Stadium	Mumbai	44	field	43	\N	14	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
829783	2015	2015-05-05	37	44	Wankhede Stadium	Mumbai	44	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
829717	2015	2015-04-12	37	45	Wankhede Stadium	Mumbai	37	field	45	\N	18	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
829731	2015	2015-04-18	34	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	44	bat	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	SRH	DC
1175371	2019	2019-04-04	44	34	Arun Jaitley Stadium	Delhi	34	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
1178394	2019	2019-04-06	37	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	37	\N	40	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
1178396	2019	2019-04-07	43	39	Sawai Mansingh Stadium	Jaipur	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	RR	KKR
1178398	2019	2019-04-09	39	42	MA Chidambaram Stadium	Chennai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
1178400	2019	2019-04-11	43	42	Sawai Mansingh Stadium	Jaipur	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	RR	CSK
1178401	2019	2019-04-12	39	44	Eden Gardens	Kolkata	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
1178402	2019	2019-04-13	37	43	Wankhede Stadium	Mumbai	43	field	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1178404	2019	2019-04-14	39	42	Eden Gardens	Kolkata	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
829775	2015	2015-05-03	45	37	Punjab Cricket Association Stadium, Mohali	Chandigarh	37	bat	37	\N	23	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
829753	2015	2015-04-25	42	45	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	97	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
829799	2015	2015-05-11	34	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
829767	2015	2015-05-01	44	45	Feroz Shah Kotla	Delhi	44	field	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
829803	2015	2015-05-13	45	48	Punjab Cricket Association Stadium, Mohali	Chandigarh	48	field	45	\N	22	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
829709	2015	2015-04-10	45	43	Maharashtra Cricket Association Stadium	Pune	45	field	43	\N	26	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
829759	2015	2015-04-27	45	34	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	34	\N	20	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
829809	2015	2015-05-16	45	42	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	PBKS	CSK
829791	2015	2015-05-09	39	45	Eden Gardens	Kolkata	45	bat	39	\N	1	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
829823	2015	2015-05-24	37	42	Eden Gardens	Kolkata	42	field	37	\N	41	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
980901	2016	2016-04-09	37	52	Wankhede Stadium	Mumbai	37	bat	52	\N	9	2026-03-02 04:06:21.186712+00	RPS	\N	MI	RPS
980909	2016	2016-04-13	39	37	Eden Gardens	Kolkata	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
980911	2016	2016-04-14	38	52	Saurashtra Cricket Association Stadium	Rajkot	52	bat	38	\N	7	2026-03-02 04:06:21.186712+00	GL	\N	GL	RPS
980915	2016	2016-04-16	34	39	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	SRH	KKR
980917	2016	2016-04-16	37	38	Wankhede Stadium	Mumbai	38	field	38	\N	3	2026-03-02 04:06:21.186712+00	GL	\N	MI	GL
980923	2016	2016-04-18	34	37	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	MI
980929	2016	2016-04-21	38	34	Saurashtra Cricket Association Stadium	Rajkot	34	field	34	\N	10	2026-03-02 04:06:21.186712+00	SRH	\N	GL	SRH
980939	2016	2016-04-24	52	39	Maharashtra Cricket Association Stadium	Pune	39	field	39	\N	2	2026-03-02 04:06:21.186712+00	KKR	\N	RPS	KKR
980943	2016	2016-04-26	34	52	Rajiv Gandhi International Stadium, Uppal	Hyderabad	52	field	52	\N	34	2026-03-02 04:06:21.186712+00	RPS	\N	SRH	RPS
980947	2016	2016-04-28	37	39	Wankhede Stadium	Mumbai	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
980949	2016	2016-04-29	52	38	Maharashtra Cricket Association Stadium	Pune	38	field	38	\N	3	2026-03-02 04:06:21.186712+00	GL	\N	RPS	GL
980957	2016	2016-05-01	52	37	Maharashtra Cricket Association Stadium	Pune	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	RPS	MI
980967	2016	2016-05-06	34	38	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	GL
980973	2016	2016-05-08	37	34	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	37	field	34	\N	85	2026-03-02 04:06:21.186712+00	SRH	\N	MI	SRH
980975	2016	2016-05-08	39	38	Eden Gardens	Kolkata	38	field	38	\N	5	2026-03-02 04:06:21.186712+00	GL	\N	KKR	GL
980979	2016	2016-05-10	52	34	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	34	bat	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	RPS	SRH
980989	2016	2016-05-14	39	52	Eden Gardens	Kolkata	52	bat	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RPS
829821	2015	2015-05-22	42	48	JSCA International Stadium Complex	Ranchi	42	field	42	\N	3	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
980927	2016	2016-04-20	37	48	Wankhede Stadium	Mumbai	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
980931	2016	2016-04-22	52	48	Maharashtra Cricket Association Stadium	Pune	52	field	48	\N	13	2026-03-02 04:06:21.186712+00	RCB	\N	RPS	RCB
980935	2016	2016-04-23	34	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	field	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
980937	2016	2016-04-24	38	48	Saurashtra Cricket Association Stadium	Rajkot	48	bat	38	\N	6	2026-03-02 04:06:21.186712+00	GL	\N	GL	RCB
980953	2016	2016-04-30	34	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	field	34	\N	15	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
980995	2016	2016-05-16	39	48	Eden Gardens	Kolkata	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	KKR	RCB
1178405	2019	2019-04-14	44	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	44	\N	39	2026-03-02 04:06:21.186712+00	DC	\N	DC	SRH
1178408	2019	2019-04-17	42	34	Rajiv Gandhi International Stadium	Hyderabad	42	bat	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	CSK	SRH
1178411	2019	2019-04-20	37	43	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	MI	RR
1178413	2019	2019-04-21	39	34	Rajiv Gandhi International Stadium	Hyderabad	34	field	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	KKR	SRH
1178415	2019	2019-04-22	43	44	Sawai Mansingh Stadium	Jaipur	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	RR	DC
1178416	2019	2019-04-23	34	42	MA Chidambaram Stadium	Chennai	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
1178418	2019	2019-04-25	39	43	Eden Gardens	Kolkata	43	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	KKR	RR
1178419	2019	2019-04-26	37	42	MA Chidambaram Stadium	Chennai	42	field	37	\N	46	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
1178420	2019	2019-04-27	34	43	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	SRH	RR
1178422	2019	2019-04-28	39	37	Eden Gardens	Kolkata	37	field	39	\N	34	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	MI
1178425	2019	2019-05-01	42	44	MA Chidambaram Stadium	Chennai	44	field	42	\N	80	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
1178424	2019	2019-04-30	48	43	M.Chinnaswamy Stadium	Bengaluru	43	field	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	RCB	RR
1178421	2019	2019-04-28	44	48	Arun Jaitley Stadium	Delhi	44	bat	44	\N	16	2026-03-02 04:06:21.186712+00	DC	\N	DC	RCB
1175362	2019	2019-03-28	37	48	M.Chinnaswamy Stadium	Bengaluru	48	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
1175366	2019	2019-03-31	34	48	Rajiv Gandhi International Stadium	Hyderabad	48	field	34	\N	118	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1136615	2018	2018-05-20	44	37	Arun Jaitley Stadium	Delhi	44	bat	44	\N	11	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
1136616	2018	2018-05-20	45	42	Maharashtra Cricket Association Stadium	Pune	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	PBKS	CSK
1178399	2019	2019-04-10	45	37	Wankhede Stadium	Mumbai	37	field	37	\N	3	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
1178393	2019	2019-04-06	42	45	MA Chidambaram Stadium	Chennai	42	bat	42	\N	22	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
1175359	2019	2019-03-25	45	43	Sawai Mansingh Stadium	Jaipur	43	field	45	\N	14	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
1175368	2019	2019-04-01	45	44	Punjab Cricket Association IS Bindra Stadium	Chandigarh	44	field	45	\N	14	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1254102	2021	2021-10-01	39	45	Dubai International Cricket Stadium	Dubai	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	KKR	PBKS
980965	2016	2016-05-05	44	52	Feroz Shah Kotla	Delhi	52	field	52	\N	7	2026-03-02 04:06:21.186712+00	RPS	\N	DC	RPS
980903	2016	2016-04-10	39	44	Eden Gardens	Kolkata	39	field	39	\N	9	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	DC
980997	2016	2016-05-17	52	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	52	field	52	\N	19	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	DC
980905	2016	2016-04-11	45	38	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	38	field	38	\N	5	2026-03-02 04:06:21.186712+00	GL	\N	PBKS	GL
980933	2016	2016-04-23	44	37	Feroz Shah Kotla	Delhi	37	field	44	\N	10	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
980951	2016	2016-04-30	44	39	Feroz Shah Kotla	Delhi	39	field	44	\N	27	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
419106	2010	2010-03-12	49	39	Dr DY Patil Sports Academy	Mumbai	49	field	39	\N	11	2026-03-02 17:59:26.260913+00	\N	\N	DCG	KKR
1178407	2019	2019-04-16	45	43	Punjab Cricket Association IS Bindra Stadium	Chandigarh	43	field	45	\N	12	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
1175361	2019	2019-03-27	39	45	Eden Gardens	Kolkata	45	field	39	\N	28	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
1178409	2019	2019-04-18	37	44	Arun Jaitley Stadium	Delhi	37	bat	37	\N	40	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
1178423	2019	2019-04-29	34	45	Rajiv Gandhi International Stadium	Hyderabad	45	field	34	\N	45	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
1175364	2019	2019-03-30	37	45	Punjab Cricket Association IS Bindra Stadium	Chandigarh	45	field	45	\N	8	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
1178397	2019	2019-04-08	34	45	Punjab Cricket Association IS Bindra Stadium	Chandigarh	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	SRH	PBKS
1178428	2019	2019-05-04	43	44	Arun Jaitley Stadium	Delhi	43	bat	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	RR	DC
1178431	2019	2019-05-05	39	37	Wankhede Stadium	Mumbai	37	field	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	KKR	MI
1181764	2019	2019-05-07	42	37	MA Chidambaram Stadium	Chennai	42	bat	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
1181766	2019	2019-05-08	34	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	44	field	44	\N	2	2026-03-02 04:06:21.186712+00	DC	\N	SRH	DC
1181767	2019	2019-05-10	44	42	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
1181768	2019	2019-05-12	37	42	Rajiv Gandhi International Stadium	Hyderabad	37	bat	37	\N	1	2026-03-02 04:06:21.186712+00	MI	\N	MI	CSK
1254059	2021	2021-04-10	42	44	Wankhede Stadium, Mumbai	Mumbai	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	CSK	DC
1254060	2021	2021-04-11	39	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	34	field	39	\N	10	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
1254061	2021	2021-04-12	45	43	Wankhede Stadium, Mumbai	Mumbai	43	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RR
1254062	2021	2021-04-13	37	39	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	39	field	37	\N	10	2026-03-02 04:06:21.186712+00	MI	\N	MI	KKR
1254064	2021	2021-04-15	44	43	Wankhede Stadium, Mumbai	Mumbai	43	field	43	\N	3	2026-03-02 04:06:21.186712+00	RR	\N	DC	RR
1254065	2021	2021-04-16	45	42	Wankhede Stadium, Mumbai	Mumbai	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	PBKS	CSK
1254066	2021	2021-04-17	37	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	37	bat	37	\N	13	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
1254068	2021	2021-04-18	45	44	Wankhede Stadium, Mumbai	Mumbai	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
419113	2010	2010-03-16	39	42	Eden Gardens	Kolkata	42	bat	42	\N	55	2026-03-02 17:59:26.260913+00	\N	\N	KKR	CSK
419124	2010	2010-03-24	45	43	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	43	\N	31	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	RR
419118	2010	2010-03-20	43	39	Sardar Patel Stadium, Motera	Ahmedabad	43	bat	43	\N	34	2026-03-02 17:59:26.260913+00	\N	\N	RR	KKR
419121	2010	2010-03-21	42	45	MA Chidambaram Stadium, Chepauk	Chennai	42	field	\N	tie	\N	2026-03-02 17:59:26.260913+00	\N	\N	CSK	PBKS
419126	2010	2010-03-26	43	49	Sardar Patel Stadium, Motera	Ahmedabad	49	bat	43	\N	8	2026-03-02 17:59:26.260913+00	\N	\N	RR	DCG
419117	2010	2010-03-19	49	45	Barabati Stadium	Cuttack	45	field	49	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	DCG	PBKS
419128	2010	2010-03-25	48	\N	M Chinnaswamy Stadium	Bangalore	48	field	\N	\N	17	2026-03-02 17:59:26.260913+00	\N	\N	RCB	DD
419131	2010	2010-03-29	\N	39	Feroz Shah Kotla	Delhi	\N	bat	\N	\N	40	2026-03-02 17:59:26.260913+00	\N	\N	DD	KKR
829763	2015	2015-04-29	48	43	M Chinnaswamy Stadium	Bangalore	43	field	\N	no result	\N	2026-03-02 04:06:21.186712+00	\N	\N	RCB	RR
1254081	2021	2021-04-29	43	37	Arun Jaitley Stadium, Delhi	Delhi	37	field	37	\N	7	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
1254082	2021	2021-04-29	39	44	Narendra Modi Stadium, Ahmedabad	Ahmedabad	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	KKR	DC
1254084	2021	2021-05-01	42	37	Arun Jaitley Stadium, Delhi	Delhi	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
1254085	2021	2021-05-02	43	34	Arun Jaitley Stadium, Delhi	Delhi	34	field	43	\N	55	2026-03-02 04:06:21.186712+00	RR	\N	RR	SRH
1254086	2021	2021-05-02	45	44	Narendra Modi Stadium, Ahmedabad	Ahmedabad	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
1254088	2021	2021-10-08	37	34	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	37	bat	37	\N	42	2026-03-02 04:06:21.186712+00	MI	\N	MI	SRH
1254089	2021	2021-10-02	42	43	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	CSK	RR
1254091	2021	2021-09-30	34	42	Sharjah Cricket Stadium	Sharjah	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
1254092	2021	2021-09-28	44	39	Sharjah Cricket Stadium	Sharjah	39	field	39	\N	3	2026-03-02 04:06:21.186712+00	KKR	\N	DC	KKR
1254093	2021	2021-10-05	43	37	Sharjah Cricket Stadium	Sharjah	37	field	37	\N	8	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
1254094	2021	2021-10-07	42	45	Dubai International Cricket Stadium	Dubai	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
1254096	2021	2021-09-23	37	39	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	MI	KKR
1254097	2021	2021-09-25	44	43	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	43	field	44	\N	33	2026-03-02 04:06:21.186712+00	DC	\N	DC	RR
1254098	2021	2021-09-26	39	42	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	39	bat	42	\N	2	2026-03-02 04:06:21.186712+00	CSK	\N	KKR	CSK
1254099	2021	2021-09-28	45	37	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
980925	2016	2016-04-19	45	39	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
980945	2016	2016-04-27	44	38	Feroz Shah Kotla	Delhi	44	field	38	\N	1	2026-03-02 04:06:21.186712+00	GL	\N	DC	GL
980993	2016	2016-05-15	37	44	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	44	field	37	\N	80	2026-03-02 04:06:21.186712+00	MI	\N	MI	DC
980919	2016	2016-04-17	45	52	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	52	bat	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RPS
980961	2016	2016-05-03	38	44	Saurashtra Cricket Association Stadium	Rajkot	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	GL	DC
980983	2016	2016-05-12	34	44	Rajiv Gandhi International Stadium, Uppal	Hyderabad	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	SRH	DC
980913	2016	2016-04-15	44	45	Feroz Shah Kotla	Delhi	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	DC	PBKS
980955	2016	2016-05-01	38	45	Saurashtra Cricket Association Stadium	Rajkot	38	field	45	\N	23	2026-03-02 04:06:21.186712+00	PBKS	\N	GL	PBKS
980985	2016	2016-05-13	37	45	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	37	bat	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	MI	PBKS
980941	2016	2016-04-25	45	37	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	45	field	37	\N	25	2026-03-02 04:06:21.186712+00	MI	\N	PBKS	MI
980991	2016	2016-05-15	45	34	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	45	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
980977	2016	2016-05-09	45	48	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	45	field	48	\N	1	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
980963	2016	2016-05-04	39	45	Eden Gardens	Kolkata	45	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
981007	2016	2016-05-21	38	37	Green Park	Kanpur	38	field	38	\N	6	2026-03-02 04:06:21.186712+00	GL	\N	GL	MI
981009	2016	2016-05-22	39	34	Eden Gardens	Kolkata	34	field	39	\N	22	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
981015	2016	2016-05-25	34	39	Feroz Shah Kotla	Delhi	39	field	34	\N	22	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
981017	2016	2016-05-27	38	34	Feroz Shah Kotla	Delhi	34	field	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	GL	SRH
1082602	2017	2017-04-14	48	37	M Chinnaswamy Stadium	Bangalore	37	field	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
1082621	2017	2017-04-27	48	38	M Chinnaswamy Stadium	Bangalore	38	field	38	\N	7	2026-03-02 04:06:21.186712+00	GL	\N	RCB	GL
419143	2010	2010-04-07	43	45	Sawai Mansingh Stadium	Jaipur	45	bat	43	\N	9	2026-03-02 17:59:26.260913+00	\N	\N	RR	PBKS
419140	2010	2010-04-04	\N	48	Feroz Shah Kotla	Delhi	\N	bat	\N	\N	37	2026-03-02 17:59:26.260913+00	\N	\N	DD	RCB
419135	2010	2010-04-01	39	49	Eden Gardens	Kolkata	39	bat	39	\N	24	2026-03-02 17:59:26.260913+00	\N	\N	KKR	DCG
419141	2010	2010-04-05	49	43	Vidarbha Cricket Association Stadium, Jamtha	Nagpur	43	bat	43	\N	2	2026-03-02 17:59:26.260913+00	\N	\N	DCG	RR
419136	2010	2010-04-02	45	48	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	bat	48	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	RCB
1254100	2021	2021-09-27	43	34	Dubai International Cricket Stadium	Dubai	43	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
1254076	2021	2021-04-25	42	48	Wankhede Stadium, Mumbai	Mumbai	42	bat	42	\N	69	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
1178427	2019	2019-05-03	45	39	Punjab Cricket Association IS Bindra Stadium	Chandigarh	39	field	39	\N	7	2026-03-02 04:06:21.186712+00	KKR	\N	PBKS	KKR
1254083	2021	2021-04-30	45	48	Narendra Modi Stadium, Ahmedabad	Ahmedabad	48	field	45	\N	34	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
1178429	2019	2019-05-04	34	48	M.Chinnaswamy Stadium	Bengaluru	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	SRH	RCB
1254058	2021	2021-04-09	37	48	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	48	field	48	\N	2	2026-03-02 04:06:21.186712+00	RCB	\N	MI	RCB
1254073	2021	2021-04-22	43	48	Wankhede Stadium, Mumbai	Mumbai	48	field	48	\N	10	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
1178430	2019	2019-05-05	42	45	Punjab Cricket Association IS Bindra Stadium	Chandigarh	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
1082636	2017	2017-05-07	48	39	M Chinnaswamy Stadium	Bangalore	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1136563	2018	2018-04-08	48	39	Eden Gardens	Kolkata	39	field	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1136584	2018	2018-04-25	48	42	M.Chinnaswamy Stadium	Bengaluru	42	field	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
1136589	2018	2018-04-29	48	39	M.Chinnaswamy Stadium	Bengaluru	39	field	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1136595	2018	2018-05-05	48	42	Maharashtra Cricket Association Stadium	Pune	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
1175356	2019	2019-03-23	48	42	MA Chidambaram Stadium	Chennai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
1175369	2019	2019-04-02	48	43	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
1175372	2019	2019-04-05	48	39	M.Chinnaswamy Stadium	Bengaluru	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1178395	2019	2019-04-07	48	44	M.Chinnaswamy Stadium	Bengaluru	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	RCB	DC
1178406	2019	2019-04-15	48	37	Wankhede Stadium	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
1254113	2021	2021-09-24	48	42	Sharjah Cricket Stadium	Sharjah	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
1304049	2022	2022-03-27	48	45	Dr DY Patil Sports Academy, Mumbai	Mumbai	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
1304082	2022	2022-04-23	48	34	Brabourne Stadium, Mumbai	Mumbai	34	field	34	\N	9	2026-03-02 04:06:21.186712+00	SRH	\N	RCB	SRH
1312199	2022	2022-05-27	48	43	Narendra Modi Stadium, Ahmedabad	Ahmedabad	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
1359489	2023	2023-04-10	48	46	M Chinnaswamy Stadium, Bengaluru	Bengaluru	46	field	46	\N	1	2026-03-02 04:06:21.186712+00	LSG	\N	RCB	LSG
1359528	2023	2023-05-09	48	37	Wankhede Stadium, Mumbai	Mumbai	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
1136591	2018	2018-05-01	48	37	M.Chinnaswamy Stadium	Bengaluru	37	field	48	\N	14	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
1254087	2021	2021-09-20	48	39	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	48	bat	39	\N	9	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1254115	2021	2021-10-11	48	39	Sharjah Cricket Stadium	Sharjah	48	bat	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
1304089	2022	2022-04-30	48	47	Brabourne Stadium, Mumbai	Mumbai	48	bat	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	RCB	GT
1359524	2023	2023-05-06	48	44	Arun Jaitley Stadium, Delhi	Delhi	48	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	RCB	DC
1082595	2017	2017-04-08	48	44	M.Chinnaswamy Stadium	Bengaluru	48	bat	48	\N	15	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
981003	2016	2016-05-20	44	34	Shaheed Veer Narayan Singh International Stadium	Raipur	44	field	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	DC	SRH
1082633	2017	2017-05-05	48	45	M Chinnaswamy Stadium	Bangalore	48	field	45	\N	19	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
981005	2016	2016-05-21	52	45	Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium	Visakhapatnam	45	bat	52	\N	4	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	PBKS
1082607	2017	2017-04-16	48	52	M Chinnaswamy Stadium	Bangalore	48	field	52	\N	27	2026-03-02 04:06:21.186712+00	RPS	\N	RCB	RPS
1359544	2023	2023-05-21	48	47	M Chinnaswamy Stadium, Bengaluru	Bengaluru	47	field	47	\N	6	2026-03-02 04:06:21.186712+00	GT	\N	RCB	GT
392185	2009	2009-04-20	48	42	St George's Park	Port Elizabeth	42	bat	42	\N	92	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
392188	2009	2009-04-22	48	49	Newlands	Cape Town	49	bat	49	\N	24	2026-03-02 04:06:21.186712+00	DCG	\N	RCB	DCG
392213	2009	2009-05-07	48	43	SuperSport Park	Centurion	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
392218	2009	2009-05-10	48	37	St George's Park	Port Elizabeth	37	bat	37	\N	16	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
501205	2011	2011-04-12	48	37	M Chinnaswamy Stadium	Bangalore	37	field	37	\N	9	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
501268	2011	2011-05-24	48	42	Wankhede Stadium	Mumbai	42	field	42	\N	6	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
548324	2012	2012-04-15	48	43	M Chinnaswamy Stadium	Bangalore	43	bat	43	\N	59	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
419148	2010	2010-04-10	48	39	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	RCB	KKR
419147	2010	2010-04-10	49	42	Vidarbha Cricket Association Stadium, Jamtha	Nagpur	42	bat	49	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	DCG	CSK
419144	2010	2010-04-07	39	\N	Eden Gardens	Kolkata	39	bat	39	\N	14	2026-03-02 17:59:26.260913+00	\N	\N	KKR	DD
548316	2012	2012-04-10	44	42	Feroz Shah Kotla	Delhi	44	field	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	DC	CSK
548367	2012	2012-05-14	48	37	M Chinnaswamy Stadium	Bangalore	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
734035	2014	2014-05-24	48	42	M Chinnaswamy Stadium	Bangalore	42	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
980959	2016	2016-05-02	48	39	M Chinnaswamy Stadium	Bangalore	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
392239	2009	2009-05-24	48	49	New Wanderers Stadium	Johannesburg	48	field	49	\N	6	2026-03-02 04:06:21.186712+00	DCG	\N	RCB	DCG
548315	2012	2012-04-10	48	39	M Chinnaswamy Stadium	Bangalore	48	field	39	\N	42	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
729299	2014	2014-04-24	48	39	Sharjah Cricket Stadium	\N	48	field	39	\N	2	2026-03-02 04:06:21.186712+00	KKR	\N	RCB	KKR
733999	2014	2014-05-11	48	43	M Chinnaswamy Stadium	Bangalore	48	bat	43	\N	5	2026-03-02 04:06:21.186712+00	RR	\N	RCB	RR
829737	2015	2015-04-19	48	37	M Chinnaswamy Stadium	Bangalore	48	field	37	\N	18	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
829745	2015	2015-04-22	48	42	M Chinnaswamy Stadium	Bangalore	48	field	42	\N	27	2026-03-02 04:06:21.186712+00	CSK	\N	RCB	CSK
392194	2009	2009-04-26	48	44	St George's Park	Port Elizabeth	48	bat	44	\N	6	2026-03-02 04:06:21.186712+00	DC	\N	RCB	DC
980921	2016	2016-04-17	48	44	M Chinnaswamy Stadium	Bangalore	44	field	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	RCB	DC
392191	2009	2009-04-24	48	45	Kingsmead	Durban	48	bat	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
733991	2014	2014-05-09	48	45	M Chinnaswamy Stadium	Bangalore	48	field	45	\N	32	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
548350	2012	2012-05-02	48	45	M Chinnaswamy Stadium	Bangalore	45	field	45	\N	4	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
598045	2013	2013-05-14	48	45	M Chinnaswamy Stadium	Bangalore	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	RCB	PBKS
980981	2016	2016-05-11	48	37	M Chinnaswamy Stadium	Bangalore	37	field	37	\N	6	2026-03-02 04:06:21.186712+00	MI	\N	RCB	MI
981019	2016	2016-05-29	48	34	M Chinnaswamy Stadium	Bangalore	34	bat	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	RCB	SRH
1136613	2018	2018-05-19	43	48	Sawai Mansingh Stadium	Jaipur	43	bat	43	\N	30	2026-03-02 04:06:21.186712+00	RR	\N	RR	RCB
598012	2013	2013-04-13	42	48	MA Chidambaram Stadium, Chepauk	Chennai	42	field	42	\N	4	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	RCB
1136611	2018	2018-05-17	48	34	M.Chinnaswamy Stadium	Bengaluru	34	field	48	\N	14	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
1178410	2019	2019-04-19	48	39	Eden Gardens	Kolkata	39	field	48	\N	10	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
1178414	2019	2019-04-21	48	42	M.Chinnaswamy Stadium	Bengaluru	42	field	48	\N	1	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
1254063	2021	2021-04-14	48	34	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	34	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
1254079	2021	2021-04-27	48	44	Narendra Modi Stadium, Ahmedabad	Ahmedabad	44	field	48	\N	1	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
1254108	2021	2021-09-26	48	37	Dubai International Cricket Stadium	Dubai	37	field	48	\N	54	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
1304073	2022	2022-04-16	48	44	Wankhede Stadium, Mumbai	Mumbai	44	field	48	\N	16	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
1304077	2022	2022-04-19	48	46	Dr DY Patil Sports Academy, Mumbai	Mumbai	46	field	48	\N	18	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	LSG
1304095	2022	2022-05-04	48	42	Maharashtra Cricket Association Stadium, Pune	Pune	42	field	48	\N	13	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
1312198	2022	2022-05-25	48	46	Eden Gardens, Kolkata	Kolkata	46	field	48	\N	14	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	LSG
1359494	2023	2023-04-15	48	44	M Chinnaswamy Stadium, Bengaluru	Bengaluru	44	field	48	\N	23	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
1359501	2023	2023-04-20	48	45	Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh	Chandigarh	45	field	48	\N	24	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
1359506	2023	2023-04-23	48	43	M Chinnaswamy Stadium, Bengaluru	Bengaluru	43	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
392199	2009	2009-04-29	48	39	Kingsmead	Durban	39	bat	48	\N	5	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
419158	2010	2010-04-17	39	43	Eden Gardens	Kolkata	43	bat	39	\N	8	2026-03-02 17:59:26.260913+00	\N	\N	KKR	RR
419154	2010	2010-04-14	43	48	Sawai Mansingh Stadium	Jaipur	43	bat	48	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	RR	RCB
419164	2010	2010-04-24	48	49	Dr DY Patil Sports Academy	Mumbai	49	bat	48	\N	9	2026-03-02 17:59:26.260913+00	\N	\N	RCB	DCG
419155	2010	2010-04-15	42	\N	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	\N	\N	6	2026-03-02 17:59:26.260913+00	\N	\N	CSK	DD
419160	2010	2010-04-18	\N	49	Feroz Shah Kotla	Delhi	49	bat	49	\N	11	2026-03-02 17:59:26.260913+00	\N	\N	DD	DCG
419156	2010	2010-04-16	45	49	Himachal Pradesh Cricket Association Stadium	Dharamsala	49	field	49	\N	5	2026-03-02 17:59:26.260913+00	\N	\N	PBKS	DCG
419157	2010	2010-04-17	48	37	M Chinnaswamy Stadium	Bangalore	48	field	37	\N	57	2026-03-02 17:59:26.260913+00	\N	\N	RCB	MI
1136619	2018	2018-05-25	34	39	Eden Gardens	Kolkata	39	field	34	\N	14	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	KKR
729315	2014	2014-04-29	39	43	Sheikh Zayed Stadium	Abu Dhabi	43	bat	\N	tie	\N	2026-03-02 04:06:21.186712+00	\N	\N	KKR	RR
734017	2014	2014-05-19	43	37	Sardar Patel Stadium, Motera	Ahmedabad	37	bat	37	\N	25	2026-03-02 04:06:21.186712+00	MI	\N	RR	MI
734023	2014	2014-05-20	39	42	Eden Gardens	Kolkata	39	field	39	\N	8	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	CSK
734029	2014	2014-05-22	42	34	JSCA International Stadium Complex	Ranchi	34	field	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	CSK	SRH
734037	2014	2014-05-24	39	34	Eden Gardens	Kolkata	39	field	39	\N	4	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	SRH
734041	2014	2014-05-25	37	43	Wankhede Stadium	Mumbai	37	field	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
734045	2014	2014-05-28	42	37	Brabourne Stadium	Mumbai	42	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
729305	2014	2014-04-26	43	48	Sheikh Zayed Stadium	Abu Dhabi	43	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RR	RCB
734013	2014	2014-05-18	42	48	JSCA International Stadium Complex	Ranchi	42	bat	48	\N	5	2026-03-02 04:06:21.186712+00	RCB	\N	CSK	RCB
733983	2014	2014-05-06	37	48	Wankhede Stadium	Mumbai	48	field	37	\N	19	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
734021	2014	2014-05-20	34	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	48	bat	34	\N	7	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
734027	2014	2014-05-22	39	48	Eden Gardens	Kolkata	48	field	39	\N	30	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
733975	2014	2014-05-03	44	43	Feroz Shah Kotla	Delhi	43	field	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	DC	RR
733981	2014	2014-05-05	44	42	Feroz Shah Kotla	Delhi	42	field	42	\N	8	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
733993	2014	2014-05-10	44	34	Feroz Shah Kotla	Delhi	34	field	34	\N	8	2026-03-02 04:06:21.186712+00	SRH	\N	DC	SRH
419107	2010	2010-03-13	37	43	Brabourne Stadium	Mumbai	37	bat	37	\N	4	2026-03-02 17:59:26.260913+00	\N	\N	MI	RR
419152	2010	2010-04-13	37	\N	Brabourne Stadium	Mumbai	37	bat	37	\N	39	2026-03-02 17:59:26.260913+00	\N	\N	MI	DD
419138	2010	2010-04-03	37	49	Brabourne Stadium	Mumbai	37	bat	37	\N	63	2026-03-02 17:59:26.260913+00	\N	\N	MI	DCG
419132	2010	2010-03-30	37	45	Brabourne Stadium	Mumbai	37	field	37	\N	4	2026-03-02 17:59:26.260913+00	\N	\N	MI	PBKS
419122	2010	2010-03-22	37	39	Brabourne Stadium	Mumbai	39	bat	37	\N	7	2026-03-02 17:59:26.260913+00	\N	\N	MI	KKR
419150	2010	2010-04-11	43	37	Sawai Mansingh Stadium	Jaipur	43	field	37	\N	37	2026-03-02 17:59:26.260913+00	\N	\N	RR	MI
419137	2010	2010-04-03	42	43	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	23	2026-03-02 17:59:26.260913+00	\N	\N	CSK	RR
419165	2010	2010-04-25	42	37	Dr DY Patil Sports Academy	Mumbai	42	bat	42	\N	22	2026-03-02 17:59:26.260913+00	\N	\N	CSK	MI
419162	2010	2010-04-21	48	37	Dr DY Patil Sports Academy	Mumbai	37	bat	37	\N	35	2026-03-02 17:59:26.260913+00	\N	\N	RCB	MI
1473448	2025	2025-03-30	43	42	Barsapara Cricket Stadium, Guwahati	Guwahati	42	field	43	\N	6	2026-03-02 04:06:21.186712+00	RR	\N	RR	CSK
598072	2013	2013-05-24	37	43	Eden Gardens	Kolkata	43	bat	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	MI	RR
598073	2013	2013-05-26	42	37	Eden Gardens	Kolkata	37	bat	37	\N	23	2026-03-02 04:06:21.186712+00	MI	\N	CSK	MI
729279	2014	2014-04-16	37	39	Sheikh Zayed Stadium	Abu Dhabi	39	bat	39	\N	41	2026-03-02 04:06:21.186712+00	KKR	\N	MI	KKR
598033	2013	2013-04-27	37	48	Wankhede Stadium	Mumbai	37	bat	37	\N	58	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
598036	2013	2013-04-29	43	48	Sawai Mansingh Stadium	Jaipur	43	field	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	RR	RCB
598057	2013	2013-05-12	39	48	JSCA International Stadium Complex	Ranchi	39	field	39	\N	5	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	RCB
598042	2013	2013-05-02	51	48	Subrata Roy Sahara Stadium	Pune	48	bat	48	\N	17	2026-03-02 04:06:21.186712+00	RCB	\N	PW	RCB
598062	2013	2013-05-14	42	44	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	33	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
598067	2013	2013-05-19	51	44	Subrata Roy Sahara Stadium	Pune	51	bat	51	\N	38	2026-03-02 04:06:21.186712+00	PW	\N	PW	DC
598024	2013	2013-04-21	44	37	Feroz Shah Kotla	Delhi	37	bat	44	\N	9	2026-03-02 04:06:21.186712+00	DC	\N	DC	MI
598035	2013	2013-04-28	44	51	Shaheed Veer Narayan Singh International Stadium	Raipur	51	field	44	\N	15	2026-03-02 04:06:21.186712+00	DC	\N	DC	PW
598040	2013	2013-05-01	44	39	Shaheed Veer Narayan Singh International Stadium	Raipur	39	bat	44	\N	7	2026-03-02 04:06:21.186712+00	DC	\N	DC	KKR
598044	2013	2013-05-04	34	44	Rajiv Gandhi International Stadium, Uppal	Hyderabad	44	bat	34	\N	6	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	DC
598054	2013	2013-05-10	44	48	Feroz Shah Kotla	Delhi	44	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
598049	2013	2013-05-07	43	44	Sawai Mansingh Stadium	Jaipur	44	bat	43	\N	9	2026-03-02 04:06:21.186712+00	RR	\N	RR	DC
598052	2013	2013-05-09	45	43	Punjab Cricket Association Stadium, Mohali	Chandigarh	43	field	43	\N	8	2026-03-02 04:06:21.186712+00	RR	\N	PBKS	RR
598037	2013	2013-04-29	37	45	Wankhede Stadium	Mumbai	37	bat	37	\N	4	2026-03-02 04:06:21.186712+00	MI	\N	MI	PBKS
598041	2013	2013-05-02	42	45	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	15	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	PBKS
392208	2009	2009-05-03	48	37	New Wanderers Stadium	Johannesburg	37	bat	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
392224	2009	2009-05-14	48	42	Kingsmead	Durban	42	bat	48	\N	2	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
501232	2011	2011-04-29	48	51	M Chinnaswamy Stadium	Bangalore	51	field	48	\N	26	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PW
501247	2011	2011-05-08	48	50	M Chinnaswamy Stadium	Bangalore	50	bat	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KTK
501270	2011	2011-05-27	48	37	MA Chidambaram Stadium, Chepauk	Chennai	37	field	48	\N	43	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
548327	2012	2012-04-17	48	51	M Chinnaswamy Stadium	Bangalore	51	bat	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PW
981011	2016	2016-05-22	44	48	Shaheed Veer Narayan Singh International Stadium	Raipur	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
1082628	2017	2017-05-01	37	48	Wankhede Stadium	Mumbai	48	bat	37	\N	5	2026-03-02 04:06:21.186712+00	MI	\N	MI	RCB
1254095	2021	2021-10-06	34	48	Zayed Cricket Stadium, Abu Dhabi	Abu Dhabi	48	field	34	\N	4	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	RCB
1254067	2021	2021-04-18	48	39	MA Chidambaram Stadium, Chepauk, Chennai	Chennai	48	bat	48	\N	38	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
1254090	2021	2021-10-03	48	45	Sharjah Cricket Stadium	Sharjah	48	bat	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
1304100	2022	2022-05-08	48	34	Wankhede Stadium, Mumbai	Mumbai	48	bat	48	\N	67	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
1359517	2023	2023-05-01	48	46	Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow	Lucknow	48	bat	48	\N	18	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	LSG
1359534	2023	2023-05-14	48	43	Sawai Mansingh Stadium, Jaipur	Jaipur	48	bat	48	\N	112	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
392182	2009	2009-04-18	48	43	Newlands	Cape Town	48	bat	48	\N	75	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
392232	2009	2009-05-19	48	44	New Wanderers Stadium	Johannesburg	44	bat	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
548310	2012	2012-04-07	48	44	M Chinnaswamy Stadium	Bangalore	44	field	48	\N	20	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
1178417	2019	2019-04-24	48	45	M.Chinnaswamy Stadium	Bengaluru	45	field	48	\N	17	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
501244	2011	2011-05-06	48	45	M Chinnaswamy Stadium	Bangalore	45	field	48	\N	85	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
598064	2013	2013-05-06	45	48	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
597999	2013	2013-04-04	48	37	M Chinnaswamy Stadium	Bangalore	37	field	48	\N	2	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
598027	2013	2013-04-23	48	51	M Chinnaswamy Stadium	Bangalore	51	field	48	\N	130	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PW
598048	2013	2013-04-09	48	34	M Chinnaswamy Stadium	Bangalore	34	bat	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
598068	2013	2013-05-18	48	42	M Chinnaswamy Stadium	Bangalore	42	field	48	\N	24	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
980907	2016	2016-04-12	48	34	M Chinnaswamy Stadium	Bangalore	34	field	48	\N	45	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
980987	2016	2016-05-14	48	38	M Chinnaswamy Stadium	Bangalore	38	field	48	\N	144	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	GL
829807	2015	2015-05-15	34	48	Rajiv Gandhi International Stadium, Uppal	Hyderabad	34	bat	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	SRH	RCB
392221	2009	2009-05-12	48	39	SuperSport Park	Centurion	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
392236	2009	2009-05-21	48	49	SuperSport Park	Centurion	48	bat	48	\N	12	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DCG
392238	2009	2009-05-23	48	42	New Wanderers Stadium	Johannesburg	48	field	48	\N	6	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
501255	2011	2011-05-14	48	39	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
501266	2011	2011-05-22	48	42	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	CSK
548356	2012	2012-05-06	48	49	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	5	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DCG
598008	2013	2013-04-11	48	39	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
598023	2013	2013-04-20	48	43	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
729287	2014	2014-04-19	48	37	Dubai International Cricket Stadium	\N	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	MI
733977	2014	2014-05-04	48	34	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	SRH
829771	2015	2015-05-02	48	39	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	KKR
829819	2015	2015-05-20	48	43	Maharashtra Cricket Association Stadium	Pune	48	bat	48	\N	71	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RR
980969	2016	2016-05-07	48	52	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	RPS
548372	2012	2012-05-17	44	48	Feroz Shah Kotla	Delhi	44	field	48	\N	21	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
829725	2015	2015-04-15	45	44	Maharashtra Cricket Association Stadium	Pune	45	bat	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
1254101	2021	2021-10-08	44	48	Dubai International Cricket Stadium	Dubai	48	field	48	\N	7	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
501252	2011	2011-05-11	43	48	Sawai Mansingh Stadium	Jaipur	48	field	48	\N	9	2026-03-02 04:06:21.186712+00	RCB	\N	RR	RCB
734005	2014	2014-05-13	48	44	M Chinnaswamy Stadium	Bangalore	44	field	48	\N	16	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	DC
981013	2016	2016-05-24	38	48	M Chinnaswamy Stadium	Bangalore	48	field	48	\N	4	2026-03-02 04:06:21.186712+00	RCB	\N	GL	RCB
598020	2013	2013-04-18	44	42	Feroz Shah Kotla	Delhi	42	bat	42	\N	86	2026-03-02 04:06:21.186712+00	CSK	\N	DC	CSK
1136605	2018	2018-05-12	44	48	Arun Jaitley Stadium	Delhi	48	field	48	\N	5	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
598066	2013	2013-05-18	45	37	Himachal Pradesh Cricket Association Stadium	Dharamsala	37	field	45	\N	50	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	MI
598028	2013	2013-05-16	45	44	Himachal Pradesh Cricket Association Stadium	Dharamsala	44	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
729283	2014	2014-04-18	42	45	Sheikh Zayed Stadium	Abu Dhabi	42	bat	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	CSK	PBKS
829721	2015	2015-04-14	43	37	Sardar Patel Stadium, Motera	Ahmedabad	37	bat	43	\N	7	2026-03-02 04:06:21.186712+00	RR	\N	RR	MI
598021	2013	2013-04-19	34	45	Rajiv Gandhi International Stadium, Uppal	Hyderabad	45	bat	34	\N	5	2026-03-02 04:06:21.186712+00	SRH	\N	SRH	PBKS
598056	2013	2013-05-11	45	34	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	34	\N	30	2026-03-02 04:06:21.186712+00	SRH	\N	PBKS	SRH
598031	2013	2013-04-26	39	45	Eden Gardens	Kolkata	45	bat	39	\N	6	2026-03-02 04:06:21.186712+00	KKR	\N	KKR	PBKS
598025	2013	2013-04-21	45	51	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	PW
598059	2013	2013-04-23	44	45	Feroz Shah Kotla	Delhi	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	DC	PBKS
729285	2014	2014-04-18	34	43	Sheikh Zayed Stadium	Abu Dhabi	43	field	43	\N	4	2026-03-02 04:06:21.186712+00	RR	\N	SRH	RR
729297	2014	2014-04-23	43	42	Dubai International Cricket Stadium	\N	43	field	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	RR	CSK
729303	2014	2014-04-25	42	37	Dubai International Cricket Stadium	\N	37	bat	42	\N	7	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	MI
729311	2014	2014-04-27	34	42	Sharjah Cricket Stadium	\N	34	bat	42	\N	5	2026-03-02 04:06:21.186712+00	CSK	\N	SRH	CSK
729317	2014	2014-04-30	37	34	Dubai International Cricket Stadium	\N	37	field	34	\N	15	2026-03-02 04:06:21.186712+00	SRH	\N	MI	SRH
733971	2014	2014-05-02	42	39	JSCA International Stadium Complex	Ranchi	42	bat	42	\N	34	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	KKR
733979	2014	2014-05-05	43	39	Sardar Patel Stadium, Motera	Ahmedabad	39	field	43	\N	10	2026-03-02 04:06:21.186712+00	RR	\N	RR	KKR
733989	2014	2014-05-08	43	34	Sardar Patel Stadium, Motera	Ahmedabad	43	field	34	\N	32	2026-03-02 04:06:21.186712+00	SRH	\N	RR	SRH
729281	2014	2014-04-17	44	48	Sharjah Cricket Stadium	\N	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
1082646	2017	2017-05-14	44	48	Feroz Shah Kotla	Delhi	48	bat	48	\N	10	2026-03-02 04:06:21.186712+00	RCB	\N	DC	RCB
501253	2011	2011-05-12	42	44	MA Chidambaram Stadium, Chepauk	Chennai	42	bat	42	\N	18	2026-03-02 04:06:21.186712+00	CSK	\N	CSK	DC
548337	2012	2012-04-24	51	44	Subrata Roy Sahara Stadium	Pune	51	bat	44	\N	8	2026-03-02 04:06:21.186712+00	DC	\N	PW	DC
1082640	2017	2017-05-10	38	44	Green Park	Kanpur	44	field	44	\N	2	2026-03-02 04:06:21.186712+00	DC	\N	GL	DC
501243	2011	2011-05-05	49	44	Rajiv Gandhi International Stadium, Uppal	Hyderabad	44	field	44	\N	4	2026-03-02 04:06:21.186712+00	DC	\N	DCG	DC
1178412	2019	2019-04-20	45	44	Arun Jaitley Stadium	Delhi	44	field	44	\N	5	2026-03-02 04:06:21.186712+00	DC	\N	PBKS	DC
1178403	2019	2019-04-13	45	48	Punjab Cricket Association IS Bindra Stadium	Chandigarh	48	field	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
1136608	2018	2018-05-14	45	48	Holkar Cricket Stadium	Indore	48	field	48	\N	10	2026-03-02 04:06:21.186712+00	RCB	\N	PBKS	RCB
392204	2009	2009-05-01	48	45	Kingsmead	Durban	48	bat	48	\N	8	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
501257	2011	2011-05-15	45	44	Himachal Pradesh Cricket Association Stadium	Dharamsala	44	field	45	\N	29	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1082645	2017	2017-05-14	52	45	Maharashtra Cricket Association Stadium	Pune	52	field	52	\N	9	2026-03-02 04:06:21.186712+00	RPS	\N	RPS	PBKS
980971	2016	2016-05-07	45	44	Punjab Cricket Association IS Bindra Stadium, Mohali	Chandigarh	44	field	45	\N	9	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
501254	2011	2011-05-13	50	45	Holkar Cricket Stadium	Indore	45	field	45	\N	6	2026-03-02 04:06:21.186712+00	PBKS	\N	KTK	PBKS
829785	2015	2015-05-06	48	45	M Chinnaswamy Stadium	Bangalore	45	field	48	\N	138	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
980999	2016	2016-05-18	48	45	M Chinnaswamy Stadium	Bangalore	45	field	48	\N	82	2026-03-02 04:06:21.186712+00	RCB	\N	RCB	PBKS
729313	2014	2014-04-28	45	48	Dubai International Cricket Stadium	\N	45	field	45	\N	5	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	RCB
734039	2014	2014-05-25	45	44	Punjab Cricket Association Stadium, Mohali	Chandigarh	45	field	45	\N	7	2026-03-02 04:06:21.186712+00	PBKS	\N	PBKS	DC
1082647	2017	2017-05-16	37	52	Wankhede Stadium	Mumbai	37	field	52	\N	20	2026-03-02 04:06:21.186712+00	RPS	\N	MI	RPS
\.


--
-- Data for Name: match_player; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.match_player (match_id, player_id, team_id) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.player (id, name, created_at) FROM stdin;
\.


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.season (id, year) FROM stdin;
1	2015
2	2023
3	2014
4	2025
5	2019
6	2011
7	2022
8	2017
9	2016
10	2012
11	2009
12	2018
13	2024
14	2013
15	2021
16	2020
17	2007
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team (id, name) FROM stdin;
34	SRH
37	MI
38	GL
39	KKR
42	CSK
43	RR
44	DC
45	PBKS
46	LSG
47	GT
48	RCB
49	DCG
50	KTK
51	PW
52	RPS
\.


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.player_id_seq', 1182, true);


--
-- Name: season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.season_id_seq', 17, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_id_seq', 66, true);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: match match_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (id);


--
-- Name: match_player match_player_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match_player
    ADD CONSTRAINT match_player_pkey PRIMARY KEY (match_id, player_id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_pkey PRIMARY KEY (id);


--
-- Name: season season_year_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_year_key UNIQUE (year);


--
-- Name: team team_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_name_key UNIQUE (name);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: player uq_player_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT uq_player_name UNIQUE (name);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_match_season_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_match_season_date ON public.match USING btree (season_year, match_date);


--
-- Name: idx_match_team1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_match_team1 ON public.match USING btree (team1_id);


--
-- Name: idx_match_team2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_match_team2 ON public.match USING btree (team2_id);


--
-- Name: match fk_match_mom_player; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT fk_match_mom_player FOREIGN KEY (mom_player_id) REFERENCES public.player(id);


--
-- Name: match_player fk_mp_match; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match_player
    ADD CONSTRAINT fk_mp_match FOREIGN KEY (match_id) REFERENCES public.match(id) ON DELETE CASCADE;


--
-- Name: match_player fk_mp_player; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match_player
    ADD CONSTRAINT fk_mp_player FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- Name: match_player fk_mp_team; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match_player
    ADD CONSTRAINT fk_mp_team FOREIGN KEY (team_id) REFERENCES public.team(id);


--
-- Name: match match_team1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_team1_id_fkey FOREIGN KEY (team1_id) REFERENCES public.team(id);


--
-- Name: match match_team2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_team2_id_fkey FOREIGN KEY (team2_id) REFERENCES public.team(id);


--
-- Name: match match_toss_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_toss_winner_id_fkey FOREIGN KEY (toss_winner_id) REFERENCES public.team(id);


--
-- Name: match match_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.team(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 4c2s6ZqW7gWlbPyH8yMIzan3VC9ikZYrke9cRt7ueaSYSX1nrQiCa4bQK6x69vk

