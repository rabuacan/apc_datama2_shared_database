--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-09 09:28:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 27 (class 2615 OID 18442)
-- Name: rabuacan; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA rabuacan;


ALTER SCHEMA rabuacan OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 441 (class 1259 OID 28595)
-- Name: goods; Type: TABLE; Schema: rabuacan; Owner: datama2mi181
--

CREATE TABLE rabuacan.goods (
    id integer NOT NULL,
    goods_quantity integer NOT NULL,
    goods_type text NOT NULL,
    goods_date date NOT NULL
);


ALTER TABLE rabuacan.goods OWNER TO datama2mi181;

--
-- TOC entry 442 (class 1259 OID 28602)
-- Name: inventory; Type: TABLE; Schema: rabuacan; Owner: datama2mi181
--

CREATE TABLE rabuacan.inventory (
    "Inventory_Id" integer NOT NULL,
    inventory_utensils text NOT NULL,
    inventory_type text NOT NULL,
    inventory_stock integer NOT NULL,
    inventory_sold integer NOT NULL
);


ALTER TABLE rabuacan.inventory OWNER TO datama2mi181;

--
-- TOC entry 446 (class 1259 OID 28637)
-- Name: goods_has_inventory; Type: VIEW; Schema: rabuacan; Owner: datama2mi181
--

CREATE VIEW rabuacan.goods_has_inventory AS
 SELECT goods.id,
    goods.goods_quantity,
    inventory.inventory_utensils,
    goods.goods_type,
    inventory.inventory_type,
    inventory.inventory_stock,
    inventory.inventory_sold,
    goods.goods_date
   FROM (rabuacan.goods
     JOIN rabuacan.inventory ON ((goods.id = inventory."Inventory_Id")));


ALTER TABLE rabuacan.goods_has_inventory OWNER TO datama2mi181;

--
-- TOC entry 3579 (class 0 OID 28595)
-- Dependencies: 441
-- Data for Name: goods; Type: TABLE DATA; Schema: rabuacan; Owner: datama2mi181
--

COPY rabuacan.goods (id, goods_quantity, goods_type, goods_date) FROM stdin;
1	69	Food	2014-07-07
\.


--
-- TOC entry 3580 (class 0 OID 28602)
-- Dependencies: 442
-- Data for Name: inventory; Type: TABLE DATA; Schema: rabuacan; Owner: datama2mi181
--

COPY rabuacan.inventory ("Inventory_Id", inventory_utensils, inventory_type, inventory_stock, inventory_sold) FROM stdin;
1	Spoon	Eating	669	275
\.


--
-- TOC entry 3425 (class 2606 OID 28800)
-- Name: goods goods_pk; Type: CONSTRAINT; Schema: rabuacan; Owner: datama2mi181
--

ALTER TABLE ONLY rabuacan.goods
    ADD CONSTRAINT goods_pk PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 28802)
-- Name: inventory inventory_pk; Type: CONSTRAINT; Schema: rabuacan; Owner: datama2mi181
--

ALTER TABLE ONLY rabuacan.inventory
    ADD CONSTRAINT inventory_pk PRIMARY KEY ("Inventory_Id");


--
-- TOC entry 3428 (class 2606 OID 28803)
-- Name: goods goods_fk; Type: FK CONSTRAINT; Schema: rabuacan; Owner: datama2mi181
--

ALTER TABLE ONLY rabuacan.goods
    ADD CONSTRAINT goods_fk FOREIGN KEY (id) REFERENCES rabuacan.inventory("Inventory_Id");


-- Completed on 2019-12-09 09:28:07

--
-- PostgreSQL database dump complete
--

