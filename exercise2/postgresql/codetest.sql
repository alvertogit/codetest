--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO codetest;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO codetest;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO codetest;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO codetest;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO codetest;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO codetest;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO codetest;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO codetest;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO codetest;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO codetest;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO codetest;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO codetest;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO codetest;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO codetest;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO codetest;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO codetest;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO codetest;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO codetest;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO codetest;

--
-- Name: products_product; Type: TABLE; Schema: public; Owner: codetest
--

CREATE TABLE public.products_product (
    id integer NOT NULL,
    product_id character varying(10) NOT NULL,
    title character varying(100) NOT NULL,
    product_type character varying(100) NOT NULL,
    price numeric(6,2) NOT NULL,
    custom_label_0 numeric(6,2) NOT NULL
);


ALTER TABLE public.products_product OWNER TO codetest;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: codetest
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO codetest;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codetest
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add product	7	add_product
20	Can change product	7	change_product
21	Can delete product	7	delete_product
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 21, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	products	product
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 7, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-04-08 13:09:11.160461-07
2	auth	0001_initial	2018-04-08 13:09:11.384383-07
3	admin	0001_initial	2018-04-08 13:09:11.440347-07
4	admin	0002_logentry_remove_auto_add	2018-04-08 13:09:11.454987-07
5	contenttypes	0002_remove_content_type_name	2018-04-08 13:09:11.481913-07
6	auth	0002_alter_permission_name_max_length	2018-04-08 13:09:11.491312-07
7	auth	0003_alter_user_email_max_length	2018-04-08 13:09:11.504961-07
8	auth	0004_alter_user_username_opts	2018-04-08 13:09:11.516888-07
9	auth	0005_alter_user_last_login_null	2018-04-08 13:09:11.531532-07
10	auth	0006_require_contenttypes_0002	2018-04-08 13:09:11.533703-07
11	auth	0007_alter_validators_add_error_messages	2018-04-08 13:09:11.545127-07
12	auth	0008_alter_user_username_max_length	2018-04-08 13:09:11.57828-07
13	products	0001_initial	2018-04-08 13:09:11.596647-07
14	sessions	0001_initial	2018-04-08 13:09:11.643291-07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: codetest
--

COPY public.products_product (id, product_id, title, product_type, price, custom_label_0) FROM stdin;
1	AK628C	Men in Black 3 (3D Blu-Ray)	Movies > 3D Blu-Ray > Standard > Comedy > Will Smith	109.00	79.00
2	AC39B4	Men in Black 3 (4K Blu-Ray)	Movies > 4K Blu-Ray > Standard > Comedy > Will Smith	269.00	229.00
3	AG5T6M	Roommate - House Box - Grå	Textiles > Interior and Decor > Baskets and Boxes	129.00	89.00
4	AH95FE	Roommate - House Box - Rosa	Textiles > Interior and Decor > Baskets and Boxes	129.00	89.00
5	AE89R2	Roommate - House Box - Hvid	Textiles > Interior and Decor > Baskets and Boxes	129.00	89.00
6	AJ9T2B	IsaDora - Eye Shadow Quartet - Coffee & Cream	Makeup > Eyes > Eye Shadow	139.00	99.00
7	AN6HK9	IsaDora - Eye Shadow Quartet - Peach Avenue	Makeup > Eyes > Eye Shadow	139.00	99.00
8	AG59MY	Diego Dalla Palma - Round Blush Børste	Accessories > Brushes	119.00	99.00
9	AJ79SB	Escentric Molecules - Escentric 04 EDT 100 ml	Perfume > Eau de Toilette	679.00	612.00
10	AM2KD4	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
11	AJ59VM	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
12	AF38ZB	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
13	AJ59PK	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
14	AG89FB	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
15	AC6DZ4	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
16	AE7423	Mikk-line - Comfort Drenge Vinterjakke	Apparel & Accessories > Clothing	399.95	359.95
17	AJ43CN	Grusomme mig 2 - DVD	Movies > DVD > Standard > Adventure > 7	69.00	29.00
18	AB249C	Grusomme mig 2 (3D Blu-Ray)	Movies > 3D Blu-Ray > Standard > Adventure > 7	99.00	69.00
19	AH63UF	Cirkusrevyen 2017 - DVD	Movies > DVD > Standard > Comedy > Ulf Pilgaard > A	159.00	119.00
20	AF38CT	Breaking Bad: Season 5 - DVD	TV Series > DVD > Complete Edition > Crime > Bryan Cranston > 15	119.00	79.00
21	AF5RN7	Breaking Bad: Season 5 (Blu-Ray)	TV Series > Blu-Ray > Complete Edition > Crime > Bryan Cranston > 15	119.00	79.00
22	AF3PE8	Hjørdis - Miniserie - DVD	TV Series > DVD > Standard > Family > Ellen Hillingsø > A	69.00	39.00
23	AN26GX	Mor bag rattet - DVD	Movies > DVD > Standard > Family > Helle Virkner > A	69.00	39.00
24	AJ63QM	Morsø - Pizza- og Urteskærer	Kitchen > Kitchen tools > Pizza Cutters	199.00	159.00
25	AK2D4N	PAPFAR - Slub Sweat Børne Buks	Apparel & Accessories > Clothing	115.00	95.00
26	AJ2W4B	PAPFAR - Slub Sweat Børne Buks	Apparel & Accessories > Clothing	115.00	95.00
27	AF579S	Clinique - Pep-Start Eye Cream 15 ml	Skincare > Eyes > Eye Cream	175.00	135.00
28	AJ2HZ4	Mikk-line - Thinsulate Handsker m. Lynlås	Apparel & Accessories > Clothing Accessories	99.00	79.00
29	AK5Z7G	Funktion - Limepresser	Kitchen > Kitchen Tools	89.00	49.00
30	AF3V6S	Funktion - Purepresser Kartoffelmoser	Kitchen > Kitchen Tools	149.00	109.00
31	AN7Z3F	Funktion - Appelsinpresser	Kitchen > Kitchen Tools	99.00	79.00
32	AB95WJ	Funktion - Citruspresser	Kitchen > Kitchen Tools	99.00	59.00
33	AB8V7F	Funktion - Baking Sheet 50 x 35 cm (225028)	Kitchen > Bakeware > Baking Mats & Liners	119.00	79.00
34	AC7B8T	Chuck Norris Collection (3-disc) - DVD	Movies > DVD > Action > Chuck Norris > 15	119.00	89.00
35	AG7V9H	Kähler - Hammershøi Serveringskande 1,25 L - Hvid	Kitchen > Jugs	499.00	459.00
36	AH4X9J	Auschwitz - DVD	Movies > DVD > Documentary > 15	89.00	59.00
37	AD3875	Kähler - Hammershøi Ovenfast Fad - Large	Kitchen > Pots and pans	499.00	499.00
38	AD2T85	Kähler - Hammershøi Ovenfast fad - Small	Kitchen > Pots and pans	449.00	449.00
39	AK95BP	Kähler - Urania Light House Smejde - Hvid	Living room > Candle Holders	149.00	149.00
40	AB498F	Kähler - Fiora Krukke - Pink/Gul	Living room > Vases	899.00	899.00
41	AH3XV9	Kähler - Hammershøi Tekande - Indigo	Kitchen > Coffee Makers > Tea Pots	699.00	699.00
42	AK9HJ4	Kähler - Fiora Vægvase- Midnatsblå	Living room > Vases	499.00	499.00
43	AJ9EX2	Kähler - Hammershøi Karaffel - Small	Kitchen > Glasses	299.00	299.00
44	AE749V	Kähler - Hammershøi Karaffel - Large	Kitchen > Glasses	349.00	349.00
45	AH3S4U	Versace - Bright Crystal EDT 90ml + Bodylotion 100ml + Taske Vedhæng - Gavesæt	Perfume > Sets	489.00	449.00
46	AE7UC6	Joico - K-Pak Shampoo 300ml + Intense Hydrator 250ml Set	Haircare > Shampoo > Sets	199.00	159.00
47	AG45PZ	Journey 2: Mysterious Island (3D Blu-Ray)	Movies > 3D Blu-Ray > Standard > Action > Dwayne Johnson > 7	119.00	79.00
48	AD86CX	Calvin Klein - Obsessed Woman EDP - 50 ml	Perfume > Eau de Parfum	479.00	439.00
49	AB568Q	Calvin Klein - Obsessed Woman EDP - 100 ml	Perfume > Eau de Parfum	619.00	576.00
50	AG59C3	Calvin Klein - Obsessed Woman EDP - 30 ml	Perfume > Eau de Parfum	349.00	309.00
51	AK765S	Elodie Details - Velvet Tæppe - Forest Flora Pearl	Textiles > Interior and Decor > Rugs and Runners	319.95	279.95
52	AG7FU5	Science4you - Sæbe Fabrik (1100607)	Educational toys > Creative Kits	249.00	249.00
53	AB5K4S	Dodgeball	Games and puzzles > Active games	199.00	159.00
54	AF5VQ4	Loving (Blu-Ray)	Movies > Blu-Ray > Standard > Biography > Ruth Negga > Jeff Nichols > 7	69.00	39.00
55	AN6XP2	Loving - DVD	Movies > DVD > Standard > Biography > Ruth Negga > Jeff Nichols > 7	69.00	49.00
56	AB8EH2	Pingvinmarchen 2 (Blu-Ray)	Movies > Blu-Ray > Standard > Documentary > Luc Jacquet > 7	75.00	49.00
57	AC2FE5	Pingvinmarchen 2 - DVD	Movies > DVD > Standard > Documentary > Luc Jacquet > 7	75.00	45.00
58	AB3Q6F	Dogfights - Sæson 1 - DVD	TV Series > DVD > Documentary > 15	119.00	89.00
59	AH97CY	Versailles - Sæson 2 - DVD	TV Series > DVD > Complete Edition > Biography > George Blagden > David Wolstencroft S > 15	175.00	135.00
60	AB8EZ5	Versailles - Sæson 2 (Blu-Ray)	TV Series > Blu-Ray > Complete Edition > Biography > George Blagden > David Wolstencroft S > 15	175.00	135.00
61	AF95PX	Familien Jul - DVD	Movies > DVD > Standard > Christmas > Søren Pilmark > A	69.00	39.00
62	AK6E4S	Melton - Numbers 5-pak Pige Strømper	Apparel & Accessories > Clothing	100.00	60.00
63	AE46FW	Melton - Numbers 5-pak Pige Strømper	Apparel & Accessories > Clothing	100.00	60.00
64	AC4V87	Melton - Numbers 5-pak Pige Strømper	Apparel & Accessories > Clothing	100.00	60.00
65	AM47F6	Melton - Numbers 5-pak Pige Strømper	Apparel & Accessories > Clothing	100.00	60.00
66	AB39JR	Melton - Numbers 5-pak Pige Strømper	Apparel & Accessories > Clothing	100.00	60.00
67	AK6MB2	Knight of Cups - DVD	Movies > DVD > Standard > Drama > Christian Bale > 11	69.00	39.00
68	AH28M6	Knight of Cups (Blu-Ray)	Movies > Blu-Ray > Standard > Drama > Christian Bale > 11	69.00	39.00
69	AD3PV5	Mooer - PC-Z - "Z" Formet Guitar Effekt Pedal Tilslutnings Stik	General Music-Making Accessories > Jack Cables > Instrument Jack Cables	65.00	59.00
70	AF65YM	Wanted (Blu-Ray)	Movies > Blu-Ray > Standard > Action > Angelina Jolie > 15	69.00	29.00
71	AH6V5B	Maxi-Cosi - Family Fix Base	Car Seats > Accessories > Car Seat Bases	1429.00	1358.00
72	AC7E25	Staedtler - Noris colour trekantede Miljøfarblyanter, 36 stk	Creative Toys > Color Pencils	149.00	109.00
73	AN37KY	La Mer - The Hand Treatment 100 ml	Skincare > Hands > Hand Cream	599.00	569.00
74	AE63XU	Independence day 1-2 Boxset (Blu-Ray)	Movies > Blu-Ray > Standard > Action > Will Smith > 15	249.00	209.00
75	AC3NK4	Independence day 1-2 Boxset - DVD	Movies > DVD > Standard > Action > Will Smith > 15	79.00	49.00
76	AJ45N3	Zou - Sæson 1 - Vol: 1 - Zou The Detective	TV Series > DVD > Standard > Animation > A	69.00	39.00
77	AB52EW	The Hills Have Eyes 1 og 2 Boks - DVD	Movies > DVD > Standard > Horror > Dan Byrd > 15	89.00	49.00
78	AD84US	The Hills Have Eyes 1 og 2 Boks (Blu-Ray)	Movies > Blu-Ray > Standard > Horror > Dan Byrd > 15	79.00	49.00
79	AE58DS	Diplomati - DVD	Movies > DVD > Standard > Drama > André Dussollier > Volker Schlöndorff > 11	59.00	29.00
80	AF7TC8	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
81	AF6D7R	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
82	AK9XU4	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
83	AG8DE2	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
84	AD2SH7	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
85	AE6YF2	LEGO Wear - TEC Vinterjakke - Jazz 776	Apparel & Accessories > Clothing	599.00	559.00
86	AK76NC	Stiga - Junior Basketball System	Outdoor Toys > Basketball	499.00	475.00
87	AF75JP	Marley & Me - DVD	Movies > DVD > Standard > Comedy > Owen Wilson > 7	69.00	29.00
88	AF2KM9	Mama (Jessica Chastain) (Blu-ray)	Movies > Blu-Ray > Standard > Horror > Nikolaj Coster-Waldau > 15	69.00	39.00
89	AK4U8V	Race	Movies > Blu-Ray > Standard > Biography > 7	65.00	35.00
90	AF7CR9	Vilac - Træperler i Metalæske	Creative Toys > Beads	199.00	159.00
91	AE3SH9	PAPFAR - Printed Sweat Kids Dress	Apparel & Accessories > Clothing	135.00	115.00
92	AF3J8V	PAPFAR - Printed Sweat Kids Dress	Apparel & Accessories > Clothing	135.00	115.00
93	AJ73XU	PAPFAR - Printed Sweat Kids Dress	Apparel & Accessories > Clothing	135.00	115.00
94	AJ7N65	PAPFAR - Printed Sweat Kids Dress	Apparel & Accessories > Clothing	135.00	115.00
95	AF5NK4	Hotellet: Hele serien (14-disc) - DVD	TV Series > DVD > Complete Edition > Drama > Paw Henriksen > 15	219.00	179.00
96	AC34NV	Sommer Og Solstik - DVD	Movies > DVD > Collectors Edition > Comedy > Dirch Passer > A	119.00	79.00
97	AD2N36	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
98	AN6B2U	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
99	AJ2GQ4	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
100	AC8M7R	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
101	AF69R4	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
102	AG73TK	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
103	AF2G3Y	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
104	AN284U	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
105	AB936Y	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
106	AH34CP	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
107	AH7S8P	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
108	AM54ZC	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
109	AK5N9R	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
110	AG6B3D	Södahl - Minimal Sengetøj 140 x 200 cm - Nude	Bedroom > Bedding sets	499.00	459.00
111	AK342W	Södahl - Minimal Sengetøj 140 x 200 cm - China Blå	Bedroom > Bedding sets	499.00	459.00
112	AB5E3K	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
113	AD27QK	Melton - Numbers Rib Drenge Boxershorts 2 pk	Apparel & Accessories > Clothing	99.00	59.00
114	AB295Z	Julefrokosten (Jørgen Ryg) - DVD	Movies > DVD > Standard > Comedy > Preben Kaas > A	69.00	39.00
115	AE9TZ6	Södahl - Minimal Sengetøj 140 x 220 cm - Natur	Bedroom > Bedding sets	549.00	509.00
116	AE62DF	Södahl - Minimal Sengetøj 140 x 220 cm - China Blå	Bedroom > Bedding sets	549.00	509.00
117	AC43SQ	Södahl - Minimal Sengetøj 140 x 220 cm - Nude	Bedroom > Bedding sets	549.00	509.00
118	AF938J	Toilet Trouble	Games and puzzles > Active games	199.00	159.00
119	AC8NG4	Leifheit - Care & Protect Protect Liquid​ Til Olierede Gulve	Kitchen > Cleaning > Floor Cleaners	99.00	59.00
120	AD698X	HAY - Japanese Glas Krukke - XL​	Kitchen > Storage > Jars	149.00	109.00
121	AF52KX	Glee: Hele Sæson 5 (6-disc) - DVD	TV Series > DVD > Complete Edition > Comedy > Lea Michele > 15	109.00	69.00
122	AN5Y6B	Kähler - Mors Dags Omaggio Vase Mellem - Blomme (Limited Edition)	Living room > Vases	299.00	299.00
123	AC6D9W	Hoppekids - Forhæng til halvhøj seng 70x190 cm	Furniture > Junior Bed > Bed Accessories	599.95	559.95
124	AM3PC2	Free Fire - DVD	Movies > DVD > Standard > Action > Sharlto Copley > Ben Wheatley > 15	109.00	79.00
125	AG8TQ2	Free Fire (Blu-Ray)	Movies > Blu-Ray > Standard > Action > Sharlto Copley > Ben Wheatley > 15	109.00	79.00
126	AB8N6H	Zone - Silva Skærebræt Medium 50 x 26 cm - Eg	Kitchen > Cutting Boards	399.00	359.00
127	AJ5DG4	Zone - Silva Skærebræt Lille 35 x 24 cm - Eg	Kitchen > Cutting Boards	239.00	199.00
128	AM6CE5	Zone - Silva Skærebræt Large 59 x 15 cm - Eg	Kitchen > Cutting Boards	319.00	279.00
129	AH6G9K	House Doctor - Strågris Large	Christmas > Christmas Decor and Accent	105.00	65.00
130	AF74UT	House Doctor - Strågris Small	Christmas > Christmas Decor and Accent	85.00	45.00
131	AD78T2	Roommate - Baby Sengetøj Gots - Kite Hvid	Textiles > Bedding > Baby Bedding > Child benefit	279.00	239.00
132	AF74TS	Roommate - Baby Sengetøj Gots - Kite Grå	Textiles > Bedding > Baby Bedding > Child benefit	279.00	239.00
133	AE5J23	Depot - No. 201 Refreshing Conditioner 1000 ml	Haircare > Conditioners > All Hair Types	249.00	209.00
134	AE6R42	Sisley - Floral Spray Mist 125 ml	Makeup > Face > Make-up finishers	449.00	405.00
135	AE639Z	HoMedics - Nail Polish Machine	Makeup > Nails > Accessories	259.00	219.00
136	AC4R2T	ZARKOPERFUME - OUD-COUTURE Perfume Serum 30 ml	Perfume > Perfume oils	700.00	675.00
137	AB8EH3	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
138	AF6R2B	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
139	AF94GE	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
140	AE3PF6	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
141	AH64B2	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
142	AN546H	Maxi-Cosi - Tobi Autostol(9-18 kg)	Car Seats > Child car seats > Child benefit	1749.00	1662.00
143	AB9GY6	Maxi-Cosi - Citi Autostol (0-13 kg)	Car Seats > Child car seats > Child benefit	890.00	846.00
144	AE3Q9T	Maxi-Cosi - Citi Autostol (0-13 kg)	Car Seats > Child car seats > Child benefit	890.00	846.00
145	AG286U	Maxi-Cosi - Citi Autostol (0-13 kg)	Car Seats > Child car seats > Child benefit	890.00	846.00
146	AH783G	Olsen-Bandens første kup (2-disc) - DVD	TV Series > DVD > Complete Edition > Christmas > Jens Sætter-Lassen > A	69.00	39.00
147	AN3WT9	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
148	AF5TW2	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
149	AN35SZ	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
150	AE47BP	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
151	AD529V	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
152	AG4K57	Maxi-Cosi - AxissFix Autostol (61-105 cm)	Car Seats > Child car seats > Child benefit	3299.00	3135.00
153	AB965X	Ilse Jacobsen - Sun Body Treatment Body Sol Lotion 150 ml - SPF 15	Sun Care > Sun protection > Body	99.00	79.00
154	AB8ZC7	Ilse Jacobsen - Sun Body Treatment Body Sol Lotion 150 ml - SPF 30	Sun Care > Sun protection > Body	99.00	75.00
155	AN5DE3	Biotherm - Sun Spray Lacté SPF50 200 ml	Sun Care > Sun protection > Body	145.00	105.00
156	AJ482K	NARS - Eyeshadow - Gabon	Makeup > Eyes > Eye Shadow	129.00	109.95
157	AK7JX3	La Mer - The Oil Absorbing Tonic 200 ml	Skincare > Face > Toners & Astringents	559.00	529.00
158	AE4YV7	La Mer - The Body Creme Tube 200 ml	Skincare > Moisturizers > Creams	1059.00	1029.00
159	AH4CT9	La Mer - The Lifting Intensifier Solo 15 ml	Skincare > Face > Oils & Serums	1069.00	1029.00
160	AG2XR9	La Mer - The Eye Balm Intense 15 ml	Skincare > Eyes > Eye Cream	1169.00	1129.00
161	AH6M8Y	Tom Ford - White Patchouli EDP 50 ml	Perfume > Eau de Parfum	709.00	639.00
162	AH6PF2	Tom Ford - White Patchouli EDP 100 ml	Perfume > Eau de Parfum	799.00	720.00
163	AD72ST	Maxi-Cosi - Citi Autostol (0-13 kg)	Car Seats > Child car seats > Child benefit	890.00	846.00
164	AE8P6Q	Maxi-Cosi - Citi Autostol (0-13 kg)	Car Seats > Child car seats > Child benefit	890.00	846.00
165	AH2CD8	Sisley - Pressed Powder - 3 Transparante Sable	Makeup > Face > Compact powder	449.00	405.00
166	AM2K8G	Sisley - Pressed Powder - 2 Transparante Irisée	Makeup > Face > Compact powder	449.00	405.00
167	AM8PK6	Sisley - Pressed Powder - 1 Transparante Mat	Makeup > Face > Compact powder	449.00	405.00
168	AF84CU	Sisley - Daily Line Reducer 30 ml	Skincare > Face > Oils & Serums	2399.00	2199.00
169	AB2NP9	Thierry Mugler - A*Men Rubber Spray 50ml + Hair and Body shampoo 50ml - Gavesæt	Perfume > Sets	365.00	325.00
170	AK3H4Z	Sisley - Deeply Purifying Mask with Tropical Resins 60 ml	Skincare > Face > Treatments & Masks > Combination Skin	549.00	495.00
171	AC69RD	Sisley - Intensive Dark Spot Corrector 7 ml	Skincare > Face > Oils & Serums	629.00	567.00
172	AG7XV8	Estée Lauder - Re-Nutritiv Intensive Age Renewal Cream 50 ml	Skincare > Face > Creams & Moisturizers	1349.00	1255.00
173	AD4283	Bvlgari - Man Extreme EDT Vapo 100 ml + Aftershave Balm 75 ml + Showergel 75 ml + Taske - Gavesæt	Perfume > Sets	459.00	419.00
174	AC69XW	Thierry Mugler - Angel EDP 25ml R Flat Star + Body Lotion 50ml + Shower Gel 50ml - Gavesæt	Perfume > Sets	465.00	425.00
175	AK38H4	Sebra - Hæklet Kanin Tumling	Baby Toys > Activity Toys	199.00	159.00
176	AG8239	Sebra - Hæklet Kanin Tumling	Baby Toys > Activity Toys	199.00	159.00
177	AF43Q9	Estée Lauder - New Dimension Firm and Fill Eye System 10 ml	Skincare > Eyes > Eye Cream	539.00	499.00
178	AD27ZN	Stelton - Tangle Hjerte Ornament	Christmas > Christmas Tree Ornament	199.00	159.00
179	AK59S4	Sisley - Super Soin Solaire Tinted Sun Care 40 ml SPF 30 - 1 Natural	Sun Care > Sun protection > Face	679.00	612.00
180	AF46VJ	Sisley - Sisleÿa Essential Skin Care Lotion 150 ml	Skincare > Moisturizers > Lotions	749.00	675.00
181	AK5BQ2	Hoptimist - Danmark Julekugler Sæt á 3​ - Rød	Christmas > Christmas Tree Ornament	149.00	109.00
182	AC96YB	Gardenlife - Rome Fuglehus	Outdoor Decor > Bird Houses	499.00	459.00
183	AM35XK	Michael Kors - Extreme Blue Edt 70 ml + Shower gel 150 ml - Gavesæt	Perfume > Eau de Toilette	449.00	409.00
184	AH8XZ4	HAY Container Krukke L - Klar	Bathroom > Holders & Dispensers > Jars	129.00	89.00
\.


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codetest
--

SELECT pg_catalog.setval('public.products_product_id_seq', 184, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: codetest
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: codetest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

