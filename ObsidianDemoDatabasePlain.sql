--
-- PostgreSQL database dump
--

-- Dumped from database version 11.18 (Ubuntu 11.18-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-04-11 12:05:51 PDT

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
-- TOC entry 27 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 15 (class 3079 OID 17135)
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- TOC entry 19 (class 3079 OID 17680)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 19
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- TOC entry 8 (class 3079 OID 16661)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- TOC entry 17 (class 3079 OID 17577)
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 17
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- TOC entry 14 (class 3079 OID 17130)
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- TOC entry 20 (class 3079 OID 18303)
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 20
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- TOC entry 18 (class 3079 OID 17664)
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 18
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- TOC entry 7 (class 3079 OID 16650)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 13 (class 3079 OID 17007)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- TOC entry 12 (class 3079 OID 16889)
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- TOC entry 4 (class 3079 OID 16444)
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- TOC entry 22 (class 3079 OID 18315)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 22
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- TOC entry 11 (class 3079 OID 16812)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- TOC entry 10 (class 3079 OID 16775)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 16 (class 3079 OID 17571)
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 16
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- TOC entry 5 (class 3079 OID 16619)
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- TOC entry 6 (class 3079 OID 16629)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- TOC entry 21 (class 3079 OID 18308)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 21
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 9 (class 3079 OID 16764)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 3 (class 3079 OID 16430)
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

--
-- TOC entry 225 (class 1259 OID 9185416)
-- Name: films; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.films (
    _id integer NOT NULL,
    title character varying NOT NULL,
    episode_id integer NOT NULL,
    opening_crawl character varying NOT NULL,
    director character varying NOT NULL,
    producer character varying NOT NULL,
    release_date date NOT NULL
);


ALTER TABLE public.films OWNER TO bopoqipu;

--
-- TOC entry 224 (class 1259 OID 9185414)
-- Name: films__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.films__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 224
-- Name: films__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.films__id_seq OWNED BY public.films._id;


--
-- TOC entry 223 (class 1259 OID 9185405)
-- Name: people; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.people (
    _id integer NOT NULL,
    name character varying NOT NULL,
    mass character varying,
    hair_color character varying,
    skin_color character varying,
    eye_color character varying,
    birth_year character varying,
    gender character varying,
    species_id bigint,
    homeworld_id bigint,
    height integer
);


ALTER TABLE public.people OWNER TO bopoqipu;

--
-- TOC entry 222 (class 1259 OID 9185403)
-- Name: people__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.people__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 222
-- Name: people__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.people__id_seq OWNED BY public.people._id;


--
-- TOC entry 227 (class 1259 OID 9185427)
-- Name: people_in_films; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.people_in_films (
    _id integer NOT NULL,
    person_id bigint NOT NULL,
    film_id bigint NOT NULL
);


ALTER TABLE public.people_in_films OWNER TO bopoqipu;

--
-- TOC entry 226 (class 1259 OID 9185425)
-- Name: people_in_films__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.people_in_films__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_in_films__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 226
-- Name: people_in_films__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.people_in_films__id_seq OWNED BY public.people_in_films._id;


--
-- TOC entry 239 (class 1259 OID 9185484)
-- Name: pilots; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.pilots (
    _id integer NOT NULL,
    person_id bigint NOT NULL,
    vessel_id bigint NOT NULL
);


ALTER TABLE public.pilots OWNER TO bopoqipu;

--
-- TOC entry 238 (class 1259 OID 9185482)
-- Name: pilots__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.pilots__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pilots__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 238
-- Name: pilots__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.pilots__id_seq OWNED BY public.pilots._id;


--
-- TOC entry 229 (class 1259 OID 9185435)
-- Name: planets; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.planets (
    _id integer NOT NULL,
    name character varying,
    rotation_period integer,
    orbital_period integer,
    diameter integer,
    climate character varying,
    gravity character varying,
    terrain character varying,
    surface_water character varying,
    population bigint
);


ALTER TABLE public.planets OWNER TO bopoqipu;

--
-- TOC entry 228 (class 1259 OID 9185433)
-- Name: planets__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.planets__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 228
-- Name: planets__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.planets__id_seq OWNED BY public.planets._id;


--
-- TOC entry 237 (class 1259 OID 9185476)
-- Name: planets_in_films; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.planets_in_films (
    _id integer NOT NULL,
    film_id bigint NOT NULL,
    planet_id bigint NOT NULL
);


ALTER TABLE public.planets_in_films OWNER TO bopoqipu;

--
-- TOC entry 236 (class 1259 OID 9185474)
-- Name: planets_in_films__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.planets_in_films__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_in_films__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 236
-- Name: planets_in_films__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.planets_in_films__id_seq OWNED BY public.planets_in_films._id;


--
-- TOC entry 231 (class 1259 OID 9185446)
-- Name: species; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.species (
    _id integer NOT NULL,
    name character varying NOT NULL,
    classification character varying,
    average_height character varying,
    average_lifespan character varying,
    hair_colors character varying,
    skin_colors character varying,
    eye_colors character varying,
    language character varying,
    homeworld_id bigint
);


ALTER TABLE public.species OWNER TO bopoqipu;

--
-- TOC entry 230 (class 1259 OID 9185444)
-- Name: species__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.species__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 230
-- Name: species__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.species__id_seq OWNED BY public.species._id;


--
-- TOC entry 235 (class 1259 OID 9185468)
-- Name: species_in_films; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.species_in_films (
    _id integer NOT NULL,
    film_id bigint NOT NULL,
    species_id bigint NOT NULL
);


ALTER TABLE public.species_in_films OWNER TO bopoqipu;

--
-- TOC entry 234 (class 1259 OID 9185466)
-- Name: species_in_films__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.species_in_films__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_in_films__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 234
-- Name: species_in_films__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.species_in_films__id_seq OWNED BY public.species_in_films._id;


--
-- TOC entry 243 (class 1259 OID 9185500)
-- Name: starship_specs; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.starship_specs (
    _id integer NOT NULL,
    hyperdrive_rating character varying,
    "MGLT" character varying,
    vessel_id bigint NOT NULL
);


ALTER TABLE public.starship_specs OWNER TO bopoqipu;

--
-- TOC entry 242 (class 1259 OID 9185498)
-- Name: starship_specs__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.starship_specs__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starship_specs__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 242
-- Name: starship_specs__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.starship_specs__id_seq OWNED BY public.starship_specs._id;


--
-- TOC entry 233 (class 1259 OID 9185457)
-- Name: vessels; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.vessels (
    _id integer NOT NULL,
    name character varying NOT NULL,
    manufacturer character varying,
    model character varying,
    vessel_type character varying NOT NULL,
    vessel_class character varying NOT NULL,
    cost_in_credits bigint,
    length character varying,
    max_atmosphering_speed character varying,
    crew integer,
    passengers integer,
    cargo_capacity character varying,
    consumables character varying
);


ALTER TABLE public.vessels OWNER TO bopoqipu;

--
-- TOC entry 232 (class 1259 OID 9185455)
-- Name: vessels__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.vessels__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessels__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 232
-- Name: vessels__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.vessels__id_seq OWNED BY public.vessels._id;


--
-- TOC entry 241 (class 1259 OID 9185492)
-- Name: vessels_in_films; Type: TABLE; Schema: public; Owner: bopoqipu
--

CREATE TABLE public.vessels_in_films (
    _id integer NOT NULL,
    vessel_id bigint NOT NULL,
    film_id bigint NOT NULL
);


ALTER TABLE public.vessels_in_films OWNER TO bopoqipu;

--
-- TOC entry 240 (class 1259 OID 9185490)
-- Name: vessels_in_films__id_seq; Type: SEQUENCE; Schema: public; Owner: bopoqipu
--

CREATE SEQUENCE public.vessels_in_films__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessels_in_films__id_seq OWNER TO bopoqipu;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 240
-- Name: vessels_in_films__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bopoqipu
--

ALTER SEQUENCE public.vessels_in_films__id_seq OWNED BY public.vessels_in_films._id;


--
-- TOC entry 3974 (class 2604 OID 9185419)
-- Name: films _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.films ALTER COLUMN _id SET DEFAULT nextval('public.films__id_seq'::regclass);


--
-- TOC entry 3973 (class 2604 OID 9185408)
-- Name: people _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people ALTER COLUMN _id SET DEFAULT nextval('public.people__id_seq'::regclass);


--
-- TOC entry 3975 (class 2604 OID 9185430)
-- Name: people_in_films _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people_in_films ALTER COLUMN _id SET DEFAULT nextval('public.people_in_films__id_seq'::regclass);


--
-- TOC entry 3981 (class 2604 OID 9185487)
-- Name: pilots _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.pilots ALTER COLUMN _id SET DEFAULT nextval('public.pilots__id_seq'::regclass);


--
-- TOC entry 3976 (class 2604 OID 9185438)
-- Name: planets _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets ALTER COLUMN _id SET DEFAULT nextval('public.planets__id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 9185479)
-- Name: planets_in_films _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets_in_films ALTER COLUMN _id SET DEFAULT nextval('public.planets_in_films__id_seq'::regclass);


--
-- TOC entry 3977 (class 2604 OID 9185449)
-- Name: species _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species ALTER COLUMN _id SET DEFAULT nextval('public.species__id_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 9185471)
-- Name: species_in_films _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species_in_films ALTER COLUMN _id SET DEFAULT nextval('public.species_in_films__id_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 9185503)
-- Name: starship_specs _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.starship_specs ALTER COLUMN _id SET DEFAULT nextval('public.starship_specs__id_seq'::regclass);


--
-- TOC entry 3978 (class 2604 OID 9185460)
-- Name: vessels _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels ALTER COLUMN _id SET DEFAULT nextval('public.vessels__id_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 9185495)
-- Name: vessels_in_films _id; Type: DEFAULT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels_in_films ALTER COLUMN _id SET DEFAULT nextval('public.vessels_in_films__id_seq'::regclass);


--
-- TOC entry 4145 (class 0 OID 9185416)
-- Dependencies: 225
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.films (_id, title, episode_id, opening_crawl, director, producer, release_date) FROM stdin;
1	A New Hope	4	It is a period of civil war.\nRebel spaceships, striking\nfrom a hidden base, have won\ntheir first victory against\nthe evil Galactic Empire.\n\nDuring the battle, Rebel\nspies managed to steal secret\nplans to the Empire's\nultimate weapon, the DEATH\nSTAR, an armored space\nstation with enough power\nto destroy an entire planet.\n\nPursued by the Empire's\nsinister agents, Princess\nLeia races home aboard her\nstarship, custodian of the\nstolen plans that can save her\npeople and restore\nfreedom to the galaxy....	George Lucas	Gary Kurtz, Rick McCallum	1977-05-25
5	Attack of the Clones	2	There is unrest in the Galactic\nSenate. Several thousand solar\nsystems have declared their\nintentions to leave the Republic.\n\nThis separatist movement,\nunder the leadership of the\nmysterious Count Dooku, has\nmade it difficult for the limited\nnumber of Jedi Knights to maintain \npeace and order in the galaxy.\n\nSenator Amidala, the former\nQueen of Naboo, is returning\nto the Galactic Senate to vote\non the critical issue of creating\nan ARMY OF THE REPUBLIC\nto assist the overwhelmed\nJedi....	George Lucas	Rick McCallum	2002-05-16
4	The Phantom Menace	1	Turmoil has engulfed the\nGalactic Republic. The taxation\nof trade routes to outlying star\nsystems is in dispute.\n\nHoping to resolve the matter\nwith a blockade of deadly\nbattleships, the greedy Trade\nFederation has stopped all\nshipping to the small planet\nof Naboo.\n\nWhile the Congress of the\nRepublic endlessly debates\nthis alarming chain of events,\nthe Supreme Chancellor has\nsecretly dispatched two Jedi\nKnights, the guardians of\npeace and justice in the\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19
6	Revenge of the Sith	3	War! The Republic is crumbling\nunder attacks by the ruthless\nSith Lord, Count Dooku.\nThere are heroes on both sides.\nEvil is everywhere.\n\nIn a stunning move, the\nfiendish droid leader, General\nGrievous, has swept into the\nRepublic capital and kidnapped\nChancellor Palpatine, leader of\nthe Galactic Senate.\n\nAs the Separatist Droid Army\nattempts to flee the besieged\ncapital with their valuable\nhostage, two Jedi Knights lead a\ndesperate mission to rescue the\ncaptive Chancellor....	George Lucas	Rick McCallum	2005-05-19
3	Return of the Jedi	6	Luke Skywalker has returned to\nhis home planet of Tatooine in\nan attempt to rescue his\nfriend Han Solo from the\nclutches of the vile gangster\nJabba the Hutt.\n\nLittle does Luke know that the\nGALACTIC EMPIRE has secretly\nbegun construction on a new\narmored space station even\nmore powerful than the first\ndreaded Death Star.\n\nWhen completed, this ultimate\nweapon will spell certain doom\nfor the small band of rebels\nstruggling to restore freedom\nto the galaxy...	Richard Marquand	Howard G. Kazanjian, George Lucas, Rick McCallum	1983-05-25
2	The Empire Strikes Back	5	It is a dark time for the\nRebellion. Although the Death\nStar has been destroyed,\nImperial troops have driven the\nRebel forces from their hidden\nbase and pursued them across\nthe galaxy.\n\nEvading the dreaded Imperial\nStarfleet, a group of freedom\nfighters led by Luke Skywalker\nhas established a new secret\nbase on the remote ice world\nof Hoth.\n\nThe evil lord Darth Vader,\nobsessed with finding young\nSkywalker, has dispatched\nthousands of remote probes into\nthe far reaches of space....	Irvin Kershner	Gary Kurtz, Rick McCallum	1980-05-17
7	The Force Awakens	7	Luke Skywalker has vanished.\nIn his absence, the sinister\nFIRST ORDER has risen from\nthe ashes of the Empire\nand will not rest until\nSkywalker, the last Jedi,\nhas been destroyed.\n \nWith the support of the\nREPUBLIC, General Leia Organa\nleads a brave RESISTANCE.\nShe is desperate to find her\nbrother Luke and gain his\nhelp in restoring peace and\njustice to the galaxy.\n \nLeia has sent her most daring\npilot on a secret mission\nto Jakku, where an old ally\nhas discovered a clue to\nLuke's whereabouts....	J. J. Abrams	Kathleen Kennedy, J. J. Abrams, Bryan Burk	2015-12-11
\.


--
-- TOC entry 4143 (class 0 OID 9185405)
-- Dependencies: 223
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.people (_id, name, mass, hair_color, skin_color, eye_color, birth_year, gender, species_id, homeworld_id, height) FROM stdin;
1	Luke Skywalker	77	blond	fair	blue	19BBY	male	1	1	172
2	C-3PO	75	n/a	gold	yellow	112BBY	n/a	2	1	167
3	R2-D2	32	n/a	white, blue	red	33BBY	n/a	2	8	96
4	Darth Vader	136	none	white	yellow	41.9BBY	male	1	1	202
5	Leia Organa	49	brown	light	brown	19BBY	female	1	2	150
6	Owen Lars	120	brown, grey	light	blue	52BBY	male	1	1	178
7	Beru Whitesun lars	75	brown	light	blue	47BBY	female	1	1	165
8	R5-D4	32	n/a	white, red	red	\N	n/a	2	1	97
9	Biggs Darklighter	84	black	light	brown	24BBY	male	1	1	183
10	Obi-Wan Kenobi	77	auburn, white	fair	blue-gray	57BBY	male	1	20	182
11	Anakin Skywalker	84	blond	fair	blue	41.9BBY	male	1	1	188
12	Wilhuff Tarkin	\N	auburn, grey	fair	blue	64BBY	male	1	21	180
13	Chewbacca	112	brown	\N	blue	200BBY	male	3	14	228
14	Han Solo	80	brown	fair	brown	29BBY	male	1	22	180
15	Greedo	74	n/a	green	black	44BBY	male	4	23	173
16	Jabba Desilijic Tiure	1,358	n/a	green-tan, brown	orange	600BBY	hermaphrodite	5	24	175
18	Wedge Antilles	77	brown	fair	hazel	21BBY	male	1	22	170
19	Jek Tono Porkins	110	brown	fair	blue	\N	male	1	26	180
20	Yoda	17	white	green	brown	896BBY	male	6	28	66
21	Palpatine	75	grey	pale	yellow	82BBY	male	1	8	170
22	Boba Fett	78.2	black	fair	brown	31.5BBY	male	1	10	183
23	IG-88	140	none	metal	red	15BBY	none	2	28	200
24	Bossk	113	none	green	red	53BBY	male	7	29	190
25	Lando Calrissian	79	black	dark	brown	31BBY	male	1	30	177
26	Lobot	79	none	light	blue	37BBY	male	1	6	175
27	Ackbar	83	none	brown mottle	orange	41BBY	male	8	31	180
28	Mon Mothma	\N	auburn	fair	blue	48BBY	female	1	32	150
29	Arvel Crynyd	\N	brown	fair	brown	\N	male	1	28	\N
30	Wicket Systri Warrick	20	brown	brown	brown	8BBY	male	9	7	88
31	Nien Nunb	68	none	grey	black	\N	male	10	33	160
32	Qui-Gon Jinn	89	brown	fair	blue	92BBY	male	1	28	193
33	Nute Gunray	90	none	mottled green	red	\N	male	11	18	191
34	Finis Valorum	\N	blond	fair	blue	91BBY	male	1	9	170
36	Jar Jar Binks	66	none	orange	orange	52BBY	male	12	8	196
37	Roos Tarpals	82	none	grey	orange	\N	male	12	8	224
38	Rugor Nass	\N	none	green	orange	\N	male	12	8	206
39	Ric Olié	\N	brown	fair	blue	\N	male	\N	8	183
40	Watto	\N	black	blue, grey	yellow	\N	male	13	34	137
41	Sebulba	40	none	grey, red	orange	\N	male	14	35	112
42	Quarsh Panaka	\N	black	dark	brown	62BBY	male	\N	8	183
43	Shmi Skywalker	\N	black	fair	brown	72BBY	female	1	1	163
44	Darth Maul	80	none	red	yellow	54BBY	male	22	36	175
45	Bib Fortuna	\N	none	pale	pink	\N	male	15	37	180
46	Ayla Secura	55	none	blue	hazel	48BBY	female	15	37	178
48	Dud Bolt	45	none	blue, grey	yellow	\N	male	17	39	94
49	Gasgano	\N	none	white, blue	black	\N	male	18	40	122
50	Ben Quadinaros	65	none	grey, green, yellow	orange	\N	male	19	41	163
51	Mace Windu	84	none	dark	brown	72BBY	male	1	42	188
52	Ki-Adi-Mundi	82	white	pale	yellow	92BBY	male	20	43	198
53	Kit Fisto	87	none	green	black	\N	male	21	44	196
54	Eeth Koth	\N	black	brown	brown	\N	male	22	45	171
55	Adi Gallia	50	none	dark	blue	\N	female	23	9	184
56	Saesee Tiin	\N	none	pale	orange	\N	male	24	47	188
57	Yarael Poof	\N	none	white	yellow	\N	male	25	48	264
58	Plo Koon	80	none	orange	black	22BBY	male	26	49	188
59	Mas Amedda	\N	none	blue	blue	\N	male	27	50	196
60	Gregar Typho	85	black	dark	brown	\N	male	1	8	185
61	Cordé	\N	brown	light	brown	\N	female	1	8	157
62	Cliegg Lars	\N	brown	fair	blue	82BBY	male	1	1	183
63	Poggle the Lesser	80	none	green	yellow	\N	male	28	11	183
64	Luminara Unduli	56.2	black	yellow	blue	58BBY	female	29	51	170
65	Barriss Offee	50	black	yellow	blue	40BBY	female	29	51	166
66	Dormé	\N	brown	light	brown	\N	female	1	8	165
67	Dooku	80	white	fair	brown	102BBY	male	1	52	193
68	Bail Prestor Organa	\N	black	tan	brown	67BBY	male	1	2	191
69	Jango Fett	79	black	tan	brown	66BBY	male	1	53	183
70	Zam Wesell	55	blonde	fair, green, yellow	yellow	\N	female	30	54	168
71	Dexter Jettster	102	none	brown	yellow	\N	male	31	55	198
72	Lama Su	88	none	grey	black	\N	male	32	10	229
73	Taun We	\N	none	grey	black	\N	female	32	10	213
74	Jocasta Nu	\N	white	fair	blue	\N	female	1	9	167
47	Ratts Tyerell	15	none	grey, blue	\N	\N	male	16	38	79
75	R4-P17	\N	none	silver, red	red, blue	\N	female	\N	28	96
76	Wat Tambor	48	none	green, grey	\N	\N	male	33	56	193
77	San Hill	\N	none	grey	gold	\N	male	34	57	191
78	Shaak Ti	57	none	red, blue, white	black	\N	female	35	58	178
79	Grievous	159	none	brown, white	green, yellow	\N	male	36	59	216
80	Tarfful	136	brown	brown	blue	\N	male	3	14	234
81	Raymus Antilles	79	brown	light	brown	\N	male	1	2	188
82	Sly Moore	48	none	pale	white	\N	female	\N	60	178
83	Tion Medon	80	none	grey	black	\N	male	37	12	206
84	Finn	\N	black	dark	dark	\N	male	1	28	\N
85	Rey	\N	brown	light	hazel	\N	female	1	28	\N
86	Poe Dameron	\N	brown	light	brown	\N	male	1	28	\N
87	BB8	\N	none	none	black	\N	none	2	28	\N
88	Captain Phasma	\N	\N	\N	\N	\N	female	1	28	\N
35	Padmé Amidala	45	brown	light	brown	46BBY	female	1	8	165
\.


--
-- TOC entry 4147 (class 0 OID 9185427)
-- Dependencies: 227
-- Data for Name: people_in_films; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.people_in_films (_id, person_id, film_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	12	1
12	13	1
13	14	1
14	15	1
15	16	1
16	18	1
17	19	1
18	81	1
19	2	5
20	3	5
21	6	5
22	7	5
23	10	5
24	11	5
25	20	5
26	21	5
27	22	5
28	33	5
29	36	5
30	40	5
31	43	5
32	46	5
33	51	5
34	52	5
35	53	5
36	58	5
37	59	5
38	60	5
39	61	5
40	62	5
41	63	5
42	64	5
43	65	5
44	66	5
45	67	5
46	68	5
47	69	5
48	70	5
49	71	5
50	72	5
51	73	5
52	74	5
53	75	5
54	76	5
55	77	5
56	78	5
57	82	5
58	35	5
59	2	4
60	3	4
61	10	4
62	11	4
63	16	4
64	20	4
65	21	4
66	32	4
67	33	4
68	34	4
69	36	4
70	37	4
71	38	4
72	39	4
73	40	4
74	41	4
75	42	4
76	43	4
77	44	4
78	46	4
79	48	4
80	49	4
81	50	4
82	51	4
83	52	4
84	53	4
85	54	4
86	55	4
87	56	4
88	57	4
89	58	4
90	59	4
91	47	4
92	35	4
93	1	6
94	2	6
95	3	6
96	4	6
97	5	6
98	6	6
99	7	6
100	10	6
101	11	6
102	12	6
103	13	6
104	20	6
105	21	6
106	33	6
107	46	6
108	51	6
109	52	6
110	53	6
111	54	6
112	55	6
113	56	6
114	58	6
115	63	6
116	64	6
117	67	6
118	68	6
119	75	6
120	78	6
121	79	6
122	80	6
123	81	6
124	82	6
125	83	6
126	35	6
127	1	3
128	2	3
129	3	3
130	4	3
131	5	3
132	10	3
133	13	3
134	14	3
135	16	3
136	18	3
137	20	3
138	21	3
139	22	3
140	25	3
141	27	3
142	28	3
143	29	3
144	30	3
145	31	3
146	45	3
147	1	2
148	2	2
149	3	2
150	4	2
151	5	2
152	10	2
153	13	2
154	14	2
155	18	2
156	20	2
157	21	2
158	22	2
159	23	2
160	24	2
161	25	2
162	26	2
163	1	7
164	3	7
165	5	7
166	13	7
167	14	7
168	27	7
169	84	7
170	85	7
171	86	7
172	87	7
173	88	7
\.


--
-- TOC entry 4159 (class 0 OID 9185484)
-- Dependencies: 239
-- Data for Name: pilots; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.pilots (_id, person_id, vessel_id) FROM stdin;
1	1	14
2	18	14
3	13	19
4	1	30
5	5	30
6	10	38
7	32	38
8	44	42
9	11	44
10	70	45
11	11	46
12	79	60
13	67	55
14	13	10
15	14	10
16	25	10
17	31	10
18	1	12
19	9	12
20	18	12
21	19	12
22	4	13
23	22	21
24	1	22
25	13	22
26	14	22
27	29	28
28	11	39
29	60	39
30	35	39
31	39	40
32	44	41
33	10	48
34	58	48
35	35	49
36	10	59
37	11	59
38	86	77
39	10	64
40	35	64
41	10	65
42	11	65
43	10	74
44	79	74
\.


--
-- TOC entry 4149 (class 0 OID 9185435)
-- Dependencies: 229
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.planets (_id, name, rotation_period, orbital_period, diameter, climate, gravity, terrain, surface_water, population) FROM stdin;
2	Alderaan	24	364	12500	temperate	1 standard	grasslands, mountains	40	2000000000
3	Yavin IV	24	4818	10200	temperate, tropical	1 standard	jungle, rainforests	8	1000
4	Hoth	23	549	7200	frozen	1.1 standard	tundra, ice caves, mountain ranges	100	\N
5	Dagobah	23	341	8900	murky	N/A	swamp, jungles	8	\N
6	Bespin	12	5110	118000	temperate	1.5 (surface), 1 standard (Cloud City)	gas giant	0	6000000
7	Endor	18	402	4900	temperate	0.85 standard	forests, mountains, lakes	8	30000000
8	Naboo	26	312	12120	temperate	1 standard	grassy hills, swamps, forests, mountains	12	4500000000
9	Coruscant	24	368	12240	temperate	1 standard	cityscape, mountains	\N	1000000000000
10	Kamino	27	463	19720	temperate	1 standard	ocean	100	1000000000
11	Geonosis	30	256	11370	temperate, arid	0.9 standard	rock, desert, mountain, barren	5	100000000000
12	Utapau	27	351	12900	temperate, arid, windy	1 standard	scrublands, savanna, canyons, sinkholes	0.9	95000000
13	Mustafar	36	412	4200	hot	1 standard	volcanoes, lava rivers, mountains, caves	0	20000
14	Kashyyyk	26	381	12765	tropical	1 standard	jungle, forests, lakes, rivers	60	45000000
15	Polis Massa	24	590	0	artificial temperate 	0.56 standard	airless asteroid	0	1000000
16	Mygeeto	12	167	10088	frigid	1 standard	glaciers, mountains, ice canyons	\N	19000000
17	Felucia	34	231	9100	hot, humid	0.75 standard	fungus forests	\N	8500000
18	Cato Neimoidia	25	278	0	temperate, moist	1 standard	mountains, fields, forests, rock arches	\N	10000000
19	Saleucami	26	392	14920	hot	\N	caves, desert, mountains, volcanoes	\N	1400000000
20	Stewjon	\N	\N	0	temperate	1 standard	grass	\N	\N
21	Eriadu	24	360	13490	polluted	1 standard	cityscape	\N	22000000000
22	Corellia	25	329	11000	temperate	1 standard	plains, urban, hills, forests	70	3000000000
23	Rodia	29	305	7549	hot	1 standard	jungles, oceans, urban, swamps	60	1300000000
24	Nal Hutta	87	413	12150	temperate	1 standard	urban, oceans, swamps, bogs	\N	7000000000
25	Dantooine	25	378	9830	temperate	1 standard	oceans, savannas, mountains, grasslands	\N	1000
26	Bestine IV	26	680	6400	temperate	\N	rocky islands, oceans	98	62000000
27	Ord Mantell	26	334	14050	temperate	1 standard	plains, seas, mesas	10	4000000000
28	Hosnian Prime	0	0	0	\N	\N	\N	\N	\N
29	Trandosha	25	371	0	arid	0.62 standard	mountains, seas, grasslands, deserts	\N	42000000
30	Socorro	20	326	0	arid	1 standard	deserts, mountains	\N	300000000
31	Mon Cala	21	398	11030	temperate	1	oceans, reefs, islands	100	27000000000
32	Chandrila	20	368	13500	temperate	1	plains, forests	40	1200000000
33	Sullust	20	263	12780	superheated	1	mountains, volcanoes, rocky deserts	5	18500000000
34	Toydaria	21	184	7900	temperate	1	swamps, lakes	\N	11000000
35	Malastare	26	201	18880	arid, temperate, tropical	1.56	swamps, deserts, jungles, mountains	\N	2000000000
36	Dathomir	24	491	10480	temperate	0.9	forests, deserts, savannas	\N	5200
37	Ryloth	30	305	10600	temperate, arid, subartic	1	mountains, valleys, deserts, tundra	5	1500000000
38	Aleen Minor	\N	\N	\N	\N	\N	\N	\N	\N
39	Vulpter	22	391	14900	temperate, artic	1	urban, barren	\N	421000000
40	Troiken	\N	\N	\N	\N	\N	desert, tundra, rainforests, mountains	\N	\N
41	Tund	48	1770	12190	\N	\N	barren, ash	\N	0
42	Haruun Kal	25	383	10120	temperate	0.98	toxic cloudsea, plateaus, volcanoes	\N	705300
43	Cerea	27	386	\N	temperate	1	verdant	20	450000000
44	Glee Anselm	33	206	15600	tropical, temperate	1	lakes, islands, swamps, seas	80	500000000
45	Iridonia	29	413	\N	\N	\N	rocky canyons, acid pools	\N	\N
46	Tholoth	\N	\N	\N	\N	\N	\N	\N	\N
47	Iktotch	22	481	\N	arid, rocky, windy	1	rocky	\N	\N
48	Quermia	\N	\N	\N	\N	\N	\N	\N	\N
49	Dorin	22	409	13400	temperate	1	\N	\N	\N
50	Champala	27	318	\N	temperate	1	oceans, rainforests, plateaus	\N	3500000000
51	Mirial	\N	\N	\N	\N	\N	deserts	\N	\N
52	Serenno	\N	\N	\N	\N	\N	rainforests, rivers, mountains	\N	\N
53	Concord Dawn	\N	\N	\N	\N	\N	jungles, forests, deserts	\N	\N
54	Zolan	\N	\N	\N	\N	\N	\N	\N	\N
55	Ojom	\N	\N	\N	frigid	\N	oceans, glaciers	100	500000000
56	Skako	27	384	\N	temperate	1	urban, vines	\N	500000000000
57	Muunilinst	28	412	13800	temperate	1	plains, forests, hills, mountains	25	5000000000
58	Shili	\N	\N	\N	temperate	1	cities, savannahs, seas, plains	\N	\N
59	Kalee	23	378	13850	arid, temperate, tropical	1	rainforests, cliffs, canyons, seas	\N	4000000000
60	Umbara	\N	\N	\N	\N	\N	\N	\N	\N
1	Tatooine	23	304	10465	arid	1 standard	desert	1	200000
61	Jakku	\N	\N	\N	\N	\N	deserts	\N	\N
\.


--
-- TOC entry 4157 (class 0 OID 9185476)
-- Dependencies: 237
-- Data for Name: planets_in_films; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.planets_in_films (_id, film_id, planet_id) FROM stdin;
1	1	2
2	1	3
3	1	1
4	5	8
5	5	9
6	5	10
7	5	11
8	5	1
9	4	8
10	4	9
11	4	1
12	6	2
13	6	5
14	6	8
15	6	9
16	6	12
17	6	13
18	6	14
19	6	15
20	6	16
21	6	17
22	6	18
23	6	19
24	6	1
25	3	5
26	3	7
27	3	8
28	3	9
29	3	1
30	2	4
31	2	5
32	2	6
33	2	27
34	7	61
\.


--
-- TOC entry 4151 (class 0 OID 9185446)
-- Dependencies: 231
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.species (_id, name, classification, average_height, average_lifespan, hair_colors, skin_colors, eye_colors, language, homeworld_id) FROM stdin;
5	Hutt	gastropod	300	1000	n/a	green, brown, tan	yellow, red	Huttese	24
6	Yoda's species	mammal	66	900	brown, white	green, yellow	brown, green, yellow	Galactic basic	28
7	Trandoshan	reptile	200	unknown	none	brown, green	yellow, orange	Dosh	29
8	Mon Calamari	amphibian	160	unknown	none	red, blue, brown, magenta	yellow	Mon Calamarian	31
9	Ewok	mammal	100	unknown	white, brown, black	brown	orange, brown	Ewokese	7
10	Sullustan	mammal	180	unknown	none	pale	black	Sullutese	33
11	Neimodian	unknown	180	unknown	none	grey, green	red, pink	Neimoidia	18
12	Gungan	amphibian	190	unknown	none	brown, green	orange	Gungan basic	8
13	Toydarian	mammal	120	91	none	blue, green, grey	yellow	Toydarian	34
14	Dug	mammal	100	unknown	none	brown, purple, grey, red	yellow, blue	Dugese	35
15	Twi'lek	mammals	200	unknown	none	orange, yellow, blue, green, pink, purple, tan	blue, brown, orange, pink	Twi'leki	37
16	Aleena	reptile	80	79	none	blue, gray	unknown	Aleena	38
17	Vulptereen	unknown	100	unknown	none	grey	yellow	vulpterish	39
18	Xexto	unknown	125	unknown	none	grey, yellow, purple	black	Xextese	40
19	Toong	unknown	200	unknown	none	grey, green, yellow	orange	Tundan	41
20	Cerean	mammal	200	unknown	red, blond, black, white	pale pink	hazel	Cerean	43
21	Nautolan	amphibian	180	70	none	green, blue, brown, red	black	Nautila	44
22	Zabrak	mammal	180	unknown	black	pale, brown, red, orange, yellow	brown, orange	Zabraki	45
23	Tholothian	mammal	unknown	unknown	unknown	dark	blue, indigo	unknown	46
24	Iktotchi	unknown	180	unknown	none	pink	orange	Iktotchese	47
25	Quermian	mammal	240	86	none	white	yellow	Quermian	48
26	Kel Dor	unknown	180	70	none	peach, orange, red	black, silver	Kel Dor	49
27	Chagrian	amphibian	190	unknown	none	blue	blue	Chagria	50
28	Geonosian	insectoid	178	unknown	none	green, brown	green, hazel	Geonosian	11
29	Mirialan	mammal	180	unknown	black, brown	yellow, green	blue, green, red, yellow, brown, orange	Mirialan	51
30	Clawdite	reptilian	180	70	none	green, yellow	yellow	Clawdite	54
31	Besalisk	amphibian	178	75	none	brown	yellow	besalisk	55
32	Kaminoan	amphibian	220	80	none	grey, blue	black	Kaminoan	10
33	Skakoan	mammal	unknown	unknown	none	grey, green	unknown	Skakoan	56
34	Muun	mammal	190	100	none	grey, white	black	Muun	57
35	Togruta	mammal	180	94	none	red, white, orange, yellow, green, blue	red, orange, yellow, green, blue, black	Togruti	58
36	Kaleesh	reptile	170	80	none	brown, orange, tan	yellow	Kaleesh	59
37	Pau'an	mammal	190	700	none	grey	black	Utapese	12
3	Wookiee	mammal	210	400	black, brown	gray	blue, green, yellow, brown, golden, red	Shyriiwook	14
2	Droid	artificial	n/a	indefinite	n/a	n/a	n/a	n/a	\N
1	Human	mammal	180	120	blonde, brown, black, red	caucasian, black, asian, hispanic	brown, blue, green, hazel, grey, amber	Galactic Basic	9
4	Rodian	sentient	170	unknown	n/a	green, blue	black	Galactic Basic	23
\.


--
-- TOC entry 4155 (class 0 OID 9185468)
-- Dependencies: 235
-- Data for Name: species_in_films; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.species_in_films (_id, film_id, species_id) FROM stdin;
1	1	5
2	1	3
3	1	2
4	1	1
5	1	4
6	5	32
7	5	33
8	5	2
9	5	35
10	5	6
11	5	1
12	5	12
13	5	34
14	5	13
15	5	15
16	5	28
17	5	29
18	5	30
19	5	31
20	4	1
21	4	2
22	4	6
23	4	11
24	4	12
25	4	13
26	4	14
27	4	15
28	4	16
29	4	17
30	4	18
31	4	19
32	4	20
33	4	21
34	4	22
35	4	23
36	4	24
37	4	25
38	4	26
39	4	27
40	6	19
41	6	33
42	6	2
43	6	3
44	6	36
45	6	37
46	6	6
47	6	1
48	6	34
49	6	15
50	6	35
51	6	20
52	6	23
53	6	24
54	6	25
55	6	26
56	6	27
57	6	28
58	6	29
59	6	30
60	3	1
61	3	2
62	3	3
63	3	5
64	3	6
65	3	8
66	3	9
67	3	10
68	3	15
69	2	6
70	2	7
71	2	3
72	2	2
73	2	1
74	7	3
75	7	2
76	7	1
\.


--
-- TOC entry 4163 (class 0 OID 9185500)
-- Dependencies: 243
-- Data for Name: starship_specs; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.starship_specs (_id, hyperdrive_rating, "MGLT", vessel_id) FROM stdin;
1	2.0	40	15
2	1.0	70	5
3	4.0	10	9
4	0.5	75	10
5	1.0	80	11
6	1.0	100	12
7	1.0	105	13
8	3.0	70	21
9	1.0	50	22
10	2.0	40	23
11	1.0	60	27
12	1.0	120	28
13	2.0	91	29
14	2.0	\N	31
15	1.0	\N	39
16	1.8	\N	40
17	1.5	\N	41
18	0.7	\N	43
19	\N	\N	47
20	1.0	\N	48
21	0.9	\N	49
22	2.0	60	3
23	1.5	\N	59
24	1.0	\N	61
25	\N	\N	77
26	4.0	20	17
27	2.0	\N	32
28	0.6	\N	52
29	1.5	\N	58
30	1.0	\N	63
31	0.5	\N	64
32	1.0	\N	65
33	1.0	100	66
34	6	\N	74
35	1.0	\N	75
36	2.0	60	2
37	1.0	\N	68
\.


--
-- TOC entry 4153 (class 0 OID 9185457)
-- Dependencies: 233
-- Data for Name: vessels; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.vessels (_id, name, manufacturer, model, vessel_type, vessel_class, cost_in_credits, length, max_atmosphering_speed, crew, passengers, cargo_capacity, consumables) FROM stdin;
4	Sand Crawler	Corellia Mining Corporation	Digger Crawler	vehicle	wheeled	150000	36.8	30	46	30	50000	2 months
6	T-16 skyhopper	Incom Corporation	T-16 skyhopper	vehicle	repulsorcraft	14500	10.4	1200	1	1	50	0
7	X-34 landspeeder	SoroSuub Corporation	X-34 landspeeder	vehicle	repulsorcraft	10550	3.4	250	1	1	5	\N
8	TIE/LN starfighter	Sienar Fleet Systems	Twin Ion Engine/Ln Starfighter	vehicle	starfighter	\N	6.4	1200	1	0	65	2 days
14	Snowspeeder	Incom corporation	t-47 airspeeder	vehicle	airspeeder	\N	4.5	650	2	0	10	none
16	TIE bomber	Sienar Fleet Systems	TIE/sa bomber	vehicle	space/planetary bomber	\N	7.8	850	1	0	none	2 days
18	AT-AT	Kuat Drive Yards, Imperial Department of Military Research	All Terrain Armored Transport	vehicle	assault walker	\N	20	60	5	40	1000	\N
19	AT-ST	Kuat Drive Yards, Imperial Department of Military Research	All Terrain Scout Transport	vehicle	walker	\N	2	90	2	0	200	none
20	Storm IV Twin-Pod cloud car	Bespin Motors	Storm IV Twin-Pod	vehicle	repulsorcraft	75000	7	1500	2	0	10	1 day
24	Sail barge	Ubrikkian Industries Custom Vehicle Division	Modified Luxury Sail Barge	vehicle	sail barge	285000	30	100	26	500	2000000	Live food tanks
25	Bantha-II cargo skiff	Ubrikkian Industries	Bantha-II	vehicle	repulsorcraft cargo skiff	8000	9.5	250	5	16	135000	1 day
26	TIE/IN interceptor	Sienar Fleet Systems	Twin Ion Engine Interceptor	vehicle	starfighter	\N	9.6	1250	1	0	75	2 days
30	Imperial Speeder Bike	Aratech Repulsor Company	74-Z speeder bike	vehicle	speeder	8000	3	360	1	1	4	1 day
33	Vulture Droid	Haor Chall Engineering, Baktoid Armor Workshop	Vulture-class droid starfighter	vehicle	starfighter	\N	3.5	1200	0	0	0	none
34	Multi-Troop Transport	Baktoid Armor Workshop	Multi-Troop Transport	vehicle	repulsorcraft	138000	31	35	4	112	12000	\N
35	Armored Assault Tank	Baktoid Armor Workshop	Armoured Assault Tank	vehicle	repulsorcraft	\N	9.75	55	4	6	\N	\N
36	Single Trooper Aerial Platform	Baktoid Armor Workshop	Single Trooper Aerial Platform	vehicle	repulsorcraft	2500	2	400	1	0	none	none
37	C-9979 landing craft	Haor Chall Engineering	C-9979 landing craft	vehicle	landing craft	200000	210	587	140	284	1800000	1 day
38	Tribubble bongo	Otoh Gunga Bongameken Cooperative	Tribubble bongo	vehicle	submarine	\N	15	85	1	2	1600	\N
42	Sith speeder	Razalon	FC-20 speeder bike	vehicle	speeder	4000	1.5	180	1	0	2	\N
44	Zephyr-G swoop bike	Mobquet Swoops and Speeders	Zephyr-G swoop bike	vehicle	repulsorcraft	5750	3.68	350	1	1	200	none
45	Koro-2 Exodrive airspeeder	Desler Gizh Outworld Mobility Corporation	Koro-2 Exodrive airspeeder	vehicle	airspeeder	\N	6.6	800	1	1	80	\N
46	XJ-6 airspeeder	Narglatch AirTech prefabricated kit	XJ-6 airspeeder	vehicle	airspeeder	\N	6.23	720	1	1	\N	\N
50	LAAT/i	Rothana Heavy Engineering	Low Altitude Assault Transport/infrantry	vehicle	gunship	\N	17.4	620	6	30	170	\N
51	LAAT/c	Rothana Heavy Engineering	Low Altitude Assault Transport/carrier	vehicle	gunship	\N	28.82	620	1	0	40000	\N
60	Tsmeu-6 personal wheel bike	Z-Gomot Ternbuell Guppat Corporation	Tsmeu-6 personal wheel bike	vehicle	wheeled walker	15000	3.5	330	1	1	10	none
62	Emergency Firespeeder	\N	Fire suppression speeder	vehicle	fire suppression ship	\N	\N	\N	2	\N	\N	\N
67	Droid tri-fighter	Colla Designs, Phlac-Arphocc Automata Industries	tri-fighter	vehicle	droid starfighter	20000	5.4	1180	1	0	0	none
69	Oevvaor jet catamaran	Appazanna Engineering Works	Oevvaor jet catamaran	vehicle	airspeeder	12125	15.1	420	2	2	50	3 days
70	Raddaugh Gnasp fluttercraft	Appazanna Engineering Works	Raddaugh Gnasp fluttercraft	vehicle	air speeder	14750	7	310	2	0	20	none
71	Clone turbo tank	Kuat Drive Yards	HAVw A6 Juggernaut	vehicle	wheeled walker	350000	49.4	160	20	300	30000	20 days
72	Corporate Alliance tank droid	Techno Union	NR-N99 Persuader-class droid enforcer	vehicle	droid tank	49000	10.96	100	0	4	none	none
73	Droid gunship	Baktoid Fleet Ordnance, Haor Chall Engineering	HMP droid gunship	vehicle	airspeeder	60000	12.3	820	0	0	0	none
76	AT-RT	Kuat Drive Yards	All Terrain Recon Transport	vehicle	walker	40000	3.2	90	1	0	20	1 day
53	AT-TE	Rothana Heavy Engineering, Kuat Drive Yards	All Terrain Tactical Enforcer	vehicle	walker	\N	13.2	60	6	36	10000	21 days
54	SPHA	Rothana Heavy Engineering	Self-Propelled Heavy Artillery	vehicle	walker	\N	140	35	25	30	500	7 days
55	Flitknot speeder	Huppla Pasa Tisc Shipwrights Collective	Flitknot speeder	vehicle	speeder	8000	2	634	1	0	\N	\N
56	Neimoidian shuttle	Haor Chall Engineering	Sheathipede-class transport shuttle	vehicle	transport	\N	20	880	2	6	1000	7 days
57	Geonosian starfighter	Huppla Pasa Tisc Shipwrights Collective	Nantex-class territorial defense	vehicle	starfighter	\N	9.8	20000	1	0	\N	\N
15	Executor	Kuat Drive Yards, Fondor Shipyards	Executor-class star dreadnought	starship	Star dreadnought	1143350000	19000	n/a	279144	38000	250000000	6 years
5	Sentinel-class landing craft	Sienar Fleet Systems, Cyngus Spaceworks	Sentinel-class landing craft	starship	landing craft	240000	38	1000	5	75	180000	1 month
9	Death Star	Imperial Department of Military Research, Sienar Fleet Systems	DS-1 Orbital Battle Station	starship	Deep Space Mobile Battlestation	1000000000000	120000	n/a	342953	843342	1000000000000	3 years
10	Millennium Falcon	Corellian Engineering Corporation	YT-1300 light freighter	starship	Light freighter	100000	34.37	1050	4	6	100000	2 months
11	Y-wing	Koensayr Manufacturing	BTL Y-wing	starship	assault starfighter	134999	14	1000km	2	0	110	1 week
12	X-wing	Incom Corporation	T-65 X-wing	starship	Starfighter	149999	12.5	1050	1	0	110	1 week
13	TIE Advanced x1	Sienar Fleet Systems	Twin Ion Engine Advanced x1	starship	Starfighter	\N	9.2	1200	1	0	150	5 days
21	Slave 1	Kuat Systems Engineering	Firespray-31-class patrol and attack	starship	Patrol craft	\N	21.5	1000	1	6	70000	1 month
22	Imperial shuttle	Sienar Fleet Systems	Lambda-class T-4a shuttle	starship	Armed government transport	240000	20	850	6	20	80000	2 months
23	EF76 Nebulon-B escort frigate	Kuat Drive Yards	EF76 Nebulon-B escort frigate	starship	Escort ship	8500000	300	800	854	75	6000000	2 years
27	Calamari Cruiser	Mon Calamari shipyards	MC80 Liberty type Star Cruiser	starship	Star Cruiser	104000000	1200	n/a	5400	1200	\N	2 years
28	A-wing	Alliance Underground Engineering, Incom Corporation	RZ-1 A-wing Interceptor	starship	Starfighter	175000	9.6	1300	1	0	40	1 week
29	B-wing	Slayn & Korpil	A/SF-01 B-wing starfighter	starship	Assault Starfighter	220000	16.9	950	1	0	45	1 week
31	Republic Cruiser	Corellian Engineering Corporation	Consular-class cruiser	starship	Space cruiser	\N	115	900	9	16	\N	\N
39	Naboo fighter	Theed Palace Space Vessel Engineering Corps	N-1 starfighter	starship	Starfighter	200000	11	1100	1	0	65	7 days
40	Naboo Royal Starship	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	J-type 327 Nubian royal starship	starship	yacht	\N	76	920	8	\N	\N	\N
41	Scimitar	Republic Sienar Systems	Star Courier	starship	Space Transport	55000000	26.5	1180	1	6	2500000	30 days
43	J-type diplomatic barge	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	J-type diplomatic barge	starship	Diplomatic barge	2000000	39	2000	5	10	\N	1 year
47	AA-9 Coruscant freighter	Botajef Shipyards	Botajef AA-9 Freighter-Liner	starship	freighter	\N	390	\N	\N	30000	\N	\N
48	Jedi starfighter	Kuat Systems Engineering	Delta-7 Aethersprite-class interceptor	starship	Starfighter	180000	8	1150	1	0	60	7 days
49	H-type Nubian yacht	Theed Palace Space Vessel Engineering Corps	H-type Nubian yacht	starship	yacht	\N	47.9	8000	4	\N	\N	\N
3	Star Destroyer	Kuat Drive Yards	Imperial I-class Star Destroyer	starship	Star Destroyer	150000000	1,600	975	47060	0	36000000	2 years
59	Trade Federation cruiser	Rendili StarDrive, Free Dac Volunteers Engineering corps.	Providence-class carrier/destroyer	starship	capital ship	125000000	1088	1050	600	48247	50000000	4 years
61	Theta-class T-2c shuttle	Cygnus Spaceworks	Theta-class T-2c shuttle	starship	transport	1000000	18.5	2000	5	16	50000	56 days
77	T-70 X-wing fighter	Incom	T-70 X-wing fighter	starship	fighter	\N	\N	\N	1	\N	\N	\N
17	Rebel transport	Gallofree Yards, Inc.	GR-75 medium transport	starship	Medium transport	\N	90	650	6	90	19000000	6 months
32	Droid control ship	Hoersch-Kessel Drive, Inc.	Lucrehulk-class Droid Control Ship	starship	Droid control ship	\N	3170	n/a	175	139000	4000000000	500 days
52	Republic Assault ship	Rothana Heavy Engineering	Acclamator I-class assault ship	starship	assault ship	\N	752	\N	700	16000	11250000	2 years
58	Solar Sailer	Huppla Pasa Tisc Shipwrights Collective	Punworcca 116-class interstellar sloop	starship	yacht	35700	15.2	1600	3	11	240	7 days
63	Republic attack cruiser	Kuat Drive Yards, Allanteen Six shipyards	Senator-class Star Destroyer	starship	star destroyer	59000000	1137	975	7400	2000	20000000	2 years
64	Naboo star skiff	Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated	J-type star skiff	starship	yacht	\N	29.2	1050	3	3	\N	\N
65	Jedi Interceptor	Kuat Systems Engineering	Eta-2 Actis-class light interceptor	starship	starfighter	320000	5.47	1500	1	0	60	2 days
66	arc-170	Incom Corporation, Subpro Corporation	Aggressive Reconnaissance-170 starfighte	starship	starfighter	155000	14.5	1000	3	0	110	5 days
74	Belbullab-22 starfighter	Feethan Ottraw Scalable Assemblies	Belbullab-22 starfighter	starship	starfighter	168000	6.71	1100	1	0	140	7 days
75	V-wing	Kuat Systems Engineering	Alpha-3 Nimbus-class V-wing starfighter	starship	starfighter	102500	7.9	1050	1	0	60	15 hours
2	CR90 corvette	Corellian Engineering Corporation	CR90 corvette	starship	corvette	3500000	150	950	165	600	3000000	1 year
68	Banking clan frigate	Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries	Munificent-class star frigate	starship	cruiser	57000000	825	\N	200	\N	40000000	2 years
\.


--
-- TOC entry 4161 (class 0 OID 9185492)
-- Dependencies: 241
-- Data for Name: vessels_in_films; Type: TABLE DATA; Schema: public; Owner: bopoqipu
--

COPY public.vessels_in_films (_id, vessel_id, film_id) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 224
-- Name: films__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.films__id_seq', 8, false);


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 222
-- Name: people__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.people__id_seq', 93, true);


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 226
-- Name: people_in_films__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.people_in_films__id_seq', 174, false);


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 238
-- Name: pilots__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.pilots__id_seq', 45, false);


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 228
-- Name: planets__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.planets__id_seq', 62, false);


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 236
-- Name: planets_in_films__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.planets_in_films__id_seq', 35, false);


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 230
-- Name: species__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.species__id_seq', 38, false);


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 234
-- Name: species_in_films__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.species_in_films__id_seq', 77, false);


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 242
-- Name: starship_specs__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.starship_specs__id_seq', 39, false);


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 232
-- Name: vessels__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.vessels__id_seq', 78, false);


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 240
-- Name: vessels_in_films__id_seq; Type: SEQUENCE SET; Schema: public; Owner: bopoqipu
--

SELECT pg_catalog.setval('public.vessels_in_films__id_seq', 1, false);


--
-- TOC entry 3987 (class 2606 OID 9185424)
-- Name: films films_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pk PRIMARY KEY (_id);


--
-- TOC entry 3989 (class 2606 OID 9185432)
-- Name: people_in_films people_in_films_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people_in_films
    ADD CONSTRAINT people_in_films_pk PRIMARY KEY (_id);


--
-- TOC entry 3985 (class 2606 OID 9185413)
-- Name: people people_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pk PRIMARY KEY (_id);


--
-- TOC entry 4001 (class 2606 OID 9185489)
-- Name: pilots pilots_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.pilots
    ADD CONSTRAINT pilots_pk PRIMARY KEY (_id);


--
-- TOC entry 3999 (class 2606 OID 9185481)
-- Name: planets_in_films planets_in_films_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets_in_films
    ADD CONSTRAINT planets_in_films_pk PRIMARY KEY (_id);


--
-- TOC entry 3991 (class 2606 OID 9185443)
-- Name: planets planets_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pk PRIMARY KEY (_id);


--
-- TOC entry 3997 (class 2606 OID 9185473)
-- Name: species_in_films species_in_films_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species_in_films
    ADD CONSTRAINT species_in_films_pk PRIMARY KEY (_id);


--
-- TOC entry 3993 (class 2606 OID 9185454)
-- Name: species species_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pk PRIMARY KEY (_id);


--
-- TOC entry 4005 (class 2606 OID 9185508)
-- Name: starship_specs starship_specs_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.starship_specs
    ADD CONSTRAINT starship_specs_pk PRIMARY KEY (_id);


--
-- TOC entry 4003 (class 2606 OID 9185497)
-- Name: vessels_in_films vessels_in_films_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels_in_films
    ADD CONSTRAINT vessels_in_films_pk PRIMARY KEY (_id);


--
-- TOC entry 3995 (class 2606 OID 9185465)
-- Name: vessels vessels_pk; Type: CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels
    ADD CONSTRAINT vessels_pk PRIMARY KEY (_id);


--
-- TOC entry 4006 (class 2606 OID 9185509)
-- Name: people people_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_fk0 FOREIGN KEY (species_id) REFERENCES public.species(_id);


--
-- TOC entry 4007 (class 2606 OID 9185514)
-- Name: people people_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_fk1 FOREIGN KEY (homeworld_id) REFERENCES public.planets(_id);


--
-- TOC entry 4008 (class 2606 OID 9185519)
-- Name: people_in_films people_in_films_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people_in_films
    ADD CONSTRAINT people_in_films_fk0 FOREIGN KEY (person_id) REFERENCES public.people(_id);


--
-- TOC entry 4009 (class 2606 OID 9185524)
-- Name: people_in_films people_in_films_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.people_in_films
    ADD CONSTRAINT people_in_films_fk1 FOREIGN KEY (film_id) REFERENCES public.films(_id);


--
-- TOC entry 4015 (class 2606 OID 9185554)
-- Name: pilots pilots_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.pilots
    ADD CONSTRAINT pilots_fk0 FOREIGN KEY (person_id) REFERENCES public.people(_id);


--
-- TOC entry 4016 (class 2606 OID 9185559)
-- Name: pilots pilots_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.pilots
    ADD CONSTRAINT pilots_fk1 FOREIGN KEY (vessel_id) REFERENCES public.vessels(_id);


--
-- TOC entry 4013 (class 2606 OID 9185544)
-- Name: planets_in_films planets_in_films_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets_in_films
    ADD CONSTRAINT planets_in_films_fk0 FOREIGN KEY (film_id) REFERENCES public.films(_id);


--
-- TOC entry 4014 (class 2606 OID 9185549)
-- Name: planets_in_films planets_in_films_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.planets_in_films
    ADD CONSTRAINT planets_in_films_fk1 FOREIGN KEY (planet_id) REFERENCES public.planets(_id);


--
-- TOC entry 4010 (class 2606 OID 9185529)
-- Name: species species_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_fk0 FOREIGN KEY (homeworld_id) REFERENCES public.planets(_id);


--
-- TOC entry 4011 (class 2606 OID 9185534)
-- Name: species_in_films species_in_films_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species_in_films
    ADD CONSTRAINT species_in_films_fk0 FOREIGN KEY (film_id) REFERENCES public.films(_id);


--
-- TOC entry 4012 (class 2606 OID 9185539)
-- Name: species_in_films species_in_films_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.species_in_films
    ADD CONSTRAINT species_in_films_fk1 FOREIGN KEY (species_id) REFERENCES public.species(_id);


--
-- TOC entry 4019 (class 2606 OID 9185575)
-- Name: starship_specs starship_specs_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.starship_specs
    ADD CONSTRAINT starship_specs_fk0 FOREIGN KEY (vessel_id) REFERENCES public.vessels(_id);


--
-- TOC entry 4017 (class 2606 OID 9185565)
-- Name: vessels_in_films vessels_in_films_fk0; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels_in_films
    ADD CONSTRAINT vessels_in_films_fk0 FOREIGN KEY (vessel_id) REFERENCES public.vessels(_id);


--
-- TOC entry 4018 (class 2606 OID 9185570)
-- Name: vessels_in_films vessels_in_films_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bopoqipu
--

ALTER TABLE ONLY public.vessels_in_films
    ADD CONSTRAINT vessels_in_films_fk1 FOREIGN KEY (film_id) REFERENCES public.films(_id);


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 27
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-04-11 12:05:54 PDT

--
-- PostgreSQL database dump complete
--

