--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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
-- Name: app_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    email character varying(255),
    identity_card character varying(255),
    keycloak_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone_number character varying(255) NOT NULL,
    username character varying(255)
);


ALTER TABLE public.app_user OWNER TO admin;

--
-- Name: app_user_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_seq OWNER TO admin;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role character varying(255)
);


ALTER TABLE public.user_roles OWNER TO admin;

--
-- Name: vehicle_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.vehicle_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_seq OWNER TO admin;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.vehicle (
    id bigint DEFAULT nextval('public.vehicle_seq'::regclass) NOT NULL,
    user_id bigint,
    license_plate character varying(255) NOT NULL,
    vehicle_type character varying(255)
);


ALTER TABLE public.vehicle OWNER TO admin;

--
-- Name: violation; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.violation (
    is_approved boolean,
    is_purchased boolean,
    id bigint NOT NULL,
    "timestamp" timestamp(6) without time zone,
    license_plate character varying(255) NOT NULL,
    violation_type character varying(255),
    CONSTRAINT violation_violation_type_check CHECK (((violation_type)::text = ANY ((ARRAY['VUOT_DEN_DO'::character varying, 'DI_SAI_LAN'::character varying, 'KHONG_DO_MU_BAO_HIEM'::character varying])::text[])))
);


ALTER TABLE public.violation OWNER TO admin;

--
-- Name: violation_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.violation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.violation_seq OWNER TO admin;

--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_user (id, email, identity_card, keycloak_id, name, phone_number, username) FROM stdin;
52	an8112004@gmail.com	001204014306	c61b7e1f-57dc-4a83-a298-b69e5d33c044	Trần Đức An	0392225886	001204014306
53	t2@gmail.com	001204014307	def6ece6-9ecf-484d-8b2d-bf9402042dda	Long 2	0392225802	001204014307
54	t3@gmail.com	001204014308	86c52cf2-109a-4cfe-bdd3-839a0f1ba7a4	Long 3	0392225803	001204014308
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_roles (user_id, role) FROM stdin;
52	offline_access
52	default-roles-violation-system
52	uma_authorization
52	user
53	offline_access
53	default-roles-violation-system
53	uma_authorization
53	user
54	offline_access
54	default-roles-violation-system
54	uma_authorization
54	user
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.vehicle (id, user_id, license_plate, vehicle_type) FROM stdin;
901	52	29A-12345	Car
951	52	30B-67890	Motorbike
1001	53	31C-22222	Truck
1051	53	32D-33333	SUV
1101	54	33E-44444	Motorbike
1151	54	34F-55555	Car
\.


--
-- Data for Name: violation; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.violation (is_approved, is_purchased, id, "timestamp", license_plate, violation_type) FROM stdin;
\.


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_user_seq', 101, true);


--
-- Name: vehicle_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.vehicle_seq', 1151, true);


--
-- Name: violation_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.violation_seq', 1, false);


--
-- Name: app_user app_user_identity_card_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_identity_card_key UNIQUE (identity_card);


--
-- Name: app_user app_user_keycloak_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_keycloak_id_key UNIQUE (keycloak_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- Name: violation violation_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT violation_pkey PRIMARY KEY (id);


--
-- Name: vehicle fk1rmuyse7b5h3k60p0hv5grgqr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk1rmuyse7b5h3k60p0hv5grgqr FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: user_roles fk6fql8djp64yp4q9b3qeyhr82b; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk6fql8djp64yp4q9b3qeyhr82b FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- PostgreSQL database dump complete
--

