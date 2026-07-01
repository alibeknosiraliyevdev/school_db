--
-- PostgreSQL database dump
--

\restrict kQmH6JgI4IKEUDkp9jx6h4WGTmac7VFeMwEOnhHOsU7G8a5pbgLI4uXtIQn6Ba5

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: bıgınt; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public."bıgınt" AS bigint;


ALTER DOMAIN public."bıgınt" OWNER TO postgres;

--
-- Name: mpaa_rating; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mpaa_rating AS ENUM (
    'G',
    'PG',
    'PG-13',
    'R',
    'NC-17'
);


ALTER TYPE public.mpaa_rating OWNER TO postgres;

--
-- Name: year; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.year AS integer
	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));


ALTER DOMAIN public.year OWNER TO postgres;

--
-- Name: _group_concat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public._group_concat(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT CASE
  WHEN $2 IS NULL THEN $1
  WHEN $1 IS NULL THEN $2
  ELSE $1 || ', ' || $2
END
$_$;


ALTER FUNCTION public._group_concat(text, text) OWNER TO postgres;

--
-- Name: group_concat(text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.group_concat(text) (
    SFUNC = public._group_concat,
    STYPE = text
);


ALTER AGGREGATE public.group_concat(text) OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_address_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer,
    title character varying(100),
    author character varying(100),
    price numeric(10,2),
    category character varying(50),
    description text
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_city_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_country_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_film_id_seq OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.language_language_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_rental_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_store_id_seq OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer,
    first_name character varying(50),
    last_name character varying(50),
    age integer,
    city character varying(50),
    scholarship numeric(10,2)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer,
    first_name character varying(50),
    last_name character varying(50),
    subject character varying(50),
    salary numeric(10,2)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: COLUMN teachers.first_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.teachers.first_name IS 'comment';


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, author, price, category, description) FROM stdin;
1	Python Asoslari	Anvar Karimov	120000.00	Programming	Python dasturlash bo‘yicha boshlang‘ich qo‘llanma
2	C++ Dasturlash	Bekzod Aliyev	150000.00	Programming	C++ tilini o‘rganish uchun kitob
3	SQL Fundamentals	John Smith	180000.00	Database	SQL asoslari va amaliy mashqlar
4	Web Development	Sarah Johnson	200000.00	Programming	HTML, CSS va JavaScript
5	Data Structures	Mark Allen	175000.00	Computer Science	Ma'lumotlar tuzilmalari haqida
6	Algorithms	Thomas Cormen	250000.00	Computer Science	Algoritmlar nazariyasi
7	Clean Code	Robert Martin	230000.00	Programming	Toza kod yozish usullari
8	Machine Learning	Andrew Ng	300000.00	Artificial Intelligence	Sun'iy intellekt asoslari
9	Operating Systems	Abraham Silberschatz	270000.00	Computer Science	Operatsion tizimlar
10	Database Systems	Elmasri	290000.00	Database	\N
11	Java Dasturlash	Aziza Tursunova	160000.00	Programming	Java dasturlash bo‘yicha qo‘llanma
12	Data Science	Shahzoda Yuldasheva	280000.00	Data Analysis	Ma'lumotlarni tahlil qilish asoslari
13	Artificial Intelligence	Jasur Qodirov	320000.00	Artificial Intelligence	Sun'iy intellekt va mashina o‘rganish
14	Cybersecurity Basics	Malika Ismoilova	190000.00	Security	Kiberxavfsizlik asoslari
15	Cloud Computing	Bekzod Nazarov	210000.00	Cloud Technology	Bulutli hisoblash texnologiyalari
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name, age, city, scholarship) FROM stdin;
1	Ali	Karimov	19	Toshkent	500000.00
2	Vali	Rahimov	20	Samarqand	650000.00
3	Aziza	Tursunova	18	Buxoro	450000.00
4	Dilshod	Ergashev	21	Andijon	700000.00
5	Malika	Ismoilova	22	Namangan	800000.00
6	Jasur	Qodirov	19	Farg‘ona	550000.00
7	Madina	Sobirova	20	Xiva	600000.00
8	Bekzod	Nazarov	23	Nukus	900000.00
9	Shahzoda	Yuldasheva	18	Jizzax	400000.00
10	Akmal	Saidov	21	Qarshi	750000.00
11	Sardor	Karimov	20	Toshkent	600000.00
12	Nilufar	Rahimova	19	Samarqand	550000.00
13	Jasur	Tursunov	21	Buxoro	700000.00
14	Malika	Ergasheva	22	Andijon	800000.00
15	Aziza	Ismoilova	18	Namangan	450000.00
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, first_name, last_name, subject, salary) FROM stdin;
1	Olim	Karimov	Matematika	8500000.00
2	Nigora	Rahimova	Fizika	9000000.00
3	Bekzod	Aliyev	Informatika	10000000.00
4	Shahnoza	Qodirova	Kimyo	8700000.00
5	Dilshod	Ergashev	Biologiya	8200000.00
6	Malika	Ismoilova	Ingliz tili	9500000.00
7	Aziz	Tursunov	Tarix	7800000.00
8	Madina	Sobirova	Geografiya	8100000.00
9	Jasur	Nazarov	Ona tili	8400000.00
10	Sardor	Yuldashev	Adabiyot	8600000.00
\.


--
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 1, false);


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 1, false);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 1, false);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);


--
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 1, false);


--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 1, false);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 1, false);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 1, false);


--
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 1, false);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict kQmH6JgI4IKEUDkp9jx6h4WGTmac7VFeMwEOnhHOsU7G8a5pbgLI4uXtIQn6Ba5

