--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2018-12-15 22:40:47 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE warehouse;
--
-- TOC entry 2921 (class 1262 OID 16385)
-- Name: warehouse; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE warehouse WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE warehouse OWNER TO admin;

\connect warehouse

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13041)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: notes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.notes (
    id character varying(30) NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(300)
);


ALTER TABLE public.notes OWNER TO admin;

--
-- TOC entry 197 (class 1259 OID 16393)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id character varying(50) NOT NULL,
    product_name character varying(50),
    manufacturer character varying(50),
    stock_quantity integer,
    price numeric(5,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN products.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.id IS '			';


--
-- TOC entry 2914 (class 0 OID 16386)
-- Dependencies: 196
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.notes (id, title, description) FROM stdin;
123123123	test title	test description
\.


--
-- TOC entry 2915 (class 0 OID 16393)
-- Dependencies: 197
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_name, manufacturer, stock_quantity, price) FROM stdin;
2977a437-8581-43b3-bf9f-a2a9ddcb23a0	Puree - Mango	Kovacek, Pollich and Muller	721	60.21
16b30ef0-2172-4a3d-af13-07ba330f6b40	Country Roll	Abbott Inc	312	77.25
8670a0cf-53e9-4fb6-9ecf-daced8e14f37	Tea - Earl Grey	Gleason-Hansen	915	56.07
65d16a65-9bfd-410a-9630-b9f8683a2127	Parsley - Dried	Brekke, Abernathy and Walsh	243	50.73
6d5f8b9d-ca2c-4070-87f7-d51bbc11f0c9	Flour Dark Rye	McLaughlin Inc	235	95.45
378ccfef-04a4-436b-b57a-b02a0aeb502d	Couscous	Schuster-Effertz	104	50.25
10d090de-2614-4fcc-94eb-1f04ab5075b7	Beer - Corona	Lakin, Dickinson and Breitenberg	363	36.65
dfbdd35d-5f50-4757-aecb-1282e952b064	Syrup - Kahlua Chocolate	Harris-Bashirian	438	34.25
ea117bca-7314-4089-945b-6c0b66fe000e	Beef - Top Butt Aaa	Feil, Jakubowski and Beer	221	99.78
b5930525-5335-4b8c-99ef-70267ba73e3b	Wine - Cotes Du Rhone	Mraz LLC	645	50.48
49665573-aeeb-4638-b0f4-3395393bb485	Pork - Loin, Boneless	Schmitt-Schinner	893	21.49
20745bf5-b051-4c9e-8226-433074b30f23	Rice - Long Grain	Veum Group	126	13.42
82e5b669-386a-42ce-b69d-90ad84e3eb02	Sage - Rubbed	Jerde and Sons	855	43.89
eff2d47f-f532-4778-8924-42ca4e8af149	Wine - White, Pinot Grigio	Rohan-King	690	64.78
ecab9e83-b965-43a9-8723-1bd71d68fc92	Pastry - Banana Tea Loaf	Bailey, Schiller and Purdy	210	56.37
23f078ea-5274-4b22-8173-cd4ff8bf8b8d	Bread - Olive Dinner Roll	Lesch, Orn and Davis	756	72.12
5d0f20a7-5dff-423f-b345-9319cc349cfb	Lamb - Pieces, Diced	Hilll LLC	42	93.94
1c818ba3-3001-4c77-87f0-20b1bdce74ae	Calypso - Pineapple Passion	Tillman-D'Amore	72	72.71
e0edab2b-c91b-4d59-8bc1-f0cc2e581c94	Wine - Marlbourough Sauv Blanc	Upton Group	734	23.34
0e2e83a8-5a7b-4293-b002-8f7db009f3e4	Ketchup - Tomato	Mohr LLC	585	31.45
04356fbd-c867-4f51-858f-9be3830d6146	Beer - True North Lager	Macejkovic, Kunde and Marquardt	325	24.83
5cf0266f-d7cc-4d11-a1b6-32382134c6e5	Salt - Seasoned	Harris and Sons	684	2.16
28f03b7b-c6d9-4351-af50-2efca265b3d5	Table Cloth 81x81 White	Kuhic LLC	499	63.95
d2650513-0229-44f8-a971-437cfdb25738	Coffee - Decafenated	Thompson-Will	570	1.16
b4f3c05d-395b-4d00-9b7e-2499d91db944	Cauliflower	Schiller-Smitham	76	47.79
a8af5d7f-5827-44bf-bcf2-03721cfe85e3	Ice Cream - Strawberry	Stark, Johns and Emmerich	343	26.53
9c5a876e-ee52-4eeb-ac24-0e88b2629bda	Beer - Paulaner Hefeweisse	Haag LLC	995	46.21
4d0c85a3-628a-415b-8bef-32a2330a0505	Coffee - Decafenated	Gutkowski Group	488	5.06
83af01cb-945e-48ec-9ec4-d917e2a9632b	Chicken - Livers	Gutkowski-Kunze	493	73.26
bed1b43b-55ab-491e-8900-f70a5c730175	Corn - Cream, Canned	Emard, Beier and Howe	844	15.67
17f2b0f9-6255-4dd8-85e7-e27c2548cd87	Cheese - Gouda	Boyle, Okuneva and Luettgen	899	64.11
59545ce2-9995-4c48-bbec-2ed576e71332	Wanton Wrap	Hyatt, Haley and Flatley	600	36.47
6337887f-41fe-4c55-a082-95f54dc80f76	Mushroom - King Eryingii	Wunsch, Nitzsche and Rice	593	20.56
1c6d3e43-7b45-4e8c-b6a1-edb1767dcd8f	Bread - Frozen Basket Variety	Satterfield, Denesik and Weissnat	73	44.10
98f58e87-0430-46ed-9c97-7b67ed116fe4	Vaccum Bag 10x13	Lockman, Cruickshank and Beahan	605	27.84
f16ff5d8-ec52-4928-86d7-3c06ee3c255e	Cheese - Mozzarella	Murray, Ratke and Goldner	315	51.48
c2cc5e74-4a29-4d4d-a489-67e48df40978	Wine - Mas Chicet Rose, Vintage	Kuhic-Schaefer	907	47.05
323c83d9-51dc-4631-947a-c8c43935c311	Chef Hat 25cm	Rowe-Vandervort	327	83.48
370f8888-4349-42f7-9990-2be1f7f6cbce	Truffle Paste	Schamberger LLC	505	5.38
a1897d3b-168e-4240-b506-bc3e18d7d7b2	Garlic - Elephant	Stark LLC	228	78.80
ac5bcbbd-6af4-4fa1-912e-2aa8e348c9d6	Tomatoes	Feeney, Roob and Stamm	480	2.87
a6850c75-a6b8-4f30-92fa-d1c74d9ffaa2	Foil Wrap	Heidenreich Group	648	43.00
88f3918c-bc69-45d6-b12c-b70499a764ce	Lettuce - Arugula	Pollich-Lowe	616	63.18
be0a4928-dbef-4264-9136-9d554b816199	Lamb - Loin Chops	Gulgowski, Larson and Kilback	95	75.58
75661895-3c65-4fda-8ca3-a10812f202e4	Juice - Apple 284ml	Wiza-Purdy	838	42.60
bcf1ed9d-6c54-4e21-988f-cceab772aef6	Beer - Labatt Blue	Lindgren-Lakin	369	93.10
8117ea6a-6576-450d-ab8a-6b69ea5c01fa	Flower - Leather Leaf Fern	Hudson, Dickens and Pfannerstill	65	23.39
6680f001-57fd-4876-b144-42f0c98394a5	Tea - Black Currant	Johns, Koelpin and Wiegand	55	61.67
72a1bd4f-940b-418a-a771-69434298a635	Sultanas	Connelly, Blanda and Fritsch	767	10.97
01f240ce-cd72-464e-95f8-819433b5360e	Beef - Montreal Smoked Brisket	Rowe-Lebsack	741	58.55
6c716117-8916-4092-90b5-462a530536e9	Wheat - Soft Kernal Of Wheat	Koss LLC	839	31.85
62b27e0c-60b7-4d6a-bf7e-b7ddbb48fec6	Pastry - Key Limepoppy Seed Tea	Feeney-Braun	810	46.33
6acae443-3ccf-4e7b-a33d-a463142c61fb	Sauce - Soya, Light	Rath-Lowe	537	41.70
bd48def9-e7c3-4f2c-84fd-165c200563f7	Oil - Canola	Aufderhar LLC	810	16.16
2737b105-5c8c-4fcd-9a24-4de6afce2421	Dip - Tapenade	Stanton, Bruen and Blanda	87	64.96
fbb1e199-a8a4-473d-9d90-ad1dc34da47a	Appetizer - Shrimp Puff	Wyman-Rosenbaum	548	49.03
01bcfa34-6ca2-4bd9-aee7-51543bba1dfc	Crab Meat Claw Pasteurise	Friesen Group	876	58.80
cfd6d91b-ab26-4197-b283-e48e8f85f34f	Sour Puss - Tangerine	Klein LLC	289	19.54
85c1a46a-a62c-42c6-8079-7b83a365c05c	Doilies - 12, Paper	Douglas, Okuneva and Greenfelder	820	53.94
4768400b-8b33-4f2b-aa5e-b57ebc2c280d	Strawberries - California	Auer-Becker	952	96.26
1bfdf126-cdf6-45d8-a895-16f8b3908483	Muffin - Carrot Individual Wrap	Bernhard-McClure	466	81.73
6a794f51-887c-4038-80bb-e055a4bf64d6	Wine - Semi Dry Riesling Vineland	Smith, Trantow and Raynor	325	53.18
2a24d500-af64-49ac-8156-e278736530c0	Galliano	Douglas-Ziemann	374	5.92
86335deb-5ccb-43e2-a780-a521a268cb84	Steamers White	Grady, Donnelly and Jones	209	45.21
05fdec88-ab81-422e-81a3-aab33571fc0a	Blackberries	Waelchi-Halvorson	918	93.21
3110fd4a-4075-4799-8ac5-d6b169370ce3	Chips Potato Reg 43g	Schultz, Davis and Rosenbaum	93	72.62
ec07c0e9-cb92-474b-8cf4-d67c86380fc1	Wine - Red, Metus Rose	O'Connell, Bode and Schulist	900	47.90
99c080fc-87e4-422b-b00d-547244b82e1e	Thyme - Dried	Armstrong-Swaniawski	455	89.64
63878a1f-c052-4229-beca-f04e7870b21f	Pate - Peppercorn	Sporer, Glover and Mraz	318	3.50
bf2ff81d-2eaa-4109-8a79-6cef29616881	Nut - Peanut, Roasted	Wilderman, Considine and Leffler	559	76.90
3500ff49-2fc0-4d62-9fcc-0debcd3855ea	Soup - Campbells, Butternut	Mante LLC	33	94.96
ea5a5944-62a1-406c-8209-2de80ef3df15	Wine - Zinfandel Rosenblum	Hintz, Gleason and Nicolas	788	20.37
376d0a55-8756-48cb-b072-3c42cfa3f30e	Muffin Hinge Container 6	Brown and Sons	458	6.18
38694a57-3749-441c-8d3c-d67b40caff27	Cheese - Brick With Pepper	Champlin, Zboncak and Lowe	936	18.34
e2f6918b-1b14-4065-bc0b-e14c5e69866b	Capon - Whole	Denesik and Sons	815	12.80
27293807-d801-4974-9433-ae421187e3b9	Filling - Mince Meat	Mills and Sons	128	4.47
0a707a89-1dfe-4154-8a38-3c95c57fe0d6	Juice - Orangina	Labadie, Turcotte and Rempel	533	47.53
b0a224aa-fff7-4e1a-b412-8bdc87c956a3	Beer - Pilsner Urquell	Bailey, Rosenbaum and Beatty	375	85.56
2ac2601d-ccbc-47c5-9bfb-6e7b526927e1	Zucchini - Mini, Green	Stroman and Sons	171	50.39
640b628c-9493-4596-8239-a41982a11e9f	Sword Pick Asst	Schamberger and Sons	739	61.78
9cd87193-42a0-41f9-a04a-2a2a253dc3a9	Island Oasis - Strawberry	Fadel-Schmeler	469	82.58
be8de884-434c-473a-9773-92e2938889ab	Bread - Raisin	Aufderhar, Mitchell and Beier	769	46.69
4faa1264-ec67-42ef-912c-dcc022c5eda9	Wine - Barolo Fontanafredda	Vandervort-Ferry	446	92.44
fada4f10-2402-4dce-887b-b26a1886f011	Fish - Soup Base, Bouillon	Windler, Lind and Brakus	958	87.89
935c31f7-a4b7-4611-ab2b-724400f216e3	Lid - 10,12,16 Oz	Purdy-Hegmann	98	80.56
151ef019-fa2f-4c6a-b53a-179f88048425	Food Colouring - Red	Harris Inc	277	15.44
921cde4b-d37f-40fe-87f5-687fedd38984	Nantucket - Kiwi Berry Cktl.	Mayer-Labadie	464	86.50
c251708e-9d6c-4f6d-b395-eea2eefaeb15	Lettuce - Frisee	Reynolds Inc	120	80.33
bef151e0-d43d-4475-9a25-c041aa015567	Brandy - Orange, Mc Guiness	Hettinger Inc	998	67.52
7f4e2fb9-be18-4389-aa88-dfca510334d3	Wine - Red, Mosaic Zweigelt	Hickle, Tromp and Koch	223	4.09
12f43f24-53ba-4cc2-a5bc-19f320111ae4	Soup Campbells - Italian Wedding	Pfannerstill, Sipes and Legros	100	45.87
6f9e275a-957e-4b66-9421-14f23a28b7b8	Arctic Char - Fillets	Stehr, Beahan and Nikolaus	697	20.93
be1dd93c-be2d-4864-a790-1cbae82de7ac	Tomatoes - Orange	Cormier Inc	157	81.11
119956fc-8a5c-4ff5-b190-eac1c9fcf879	Soup - Campbells, Butternut	Koelpin, Baumbach and Mante	490	61.27
be5ddb75-3caf-42eb-9f4c-f998513ae5a0	Bread Ww Cluster	Koch, Weber and Simonis	482	2.11
328c343e-cd62-4df6-a55a-87c367304b2f	Juice - V8 Splash	Kihn-Streich	3	16.55
1ed15ce9-e95e-477b-a8bc-c0d1ddafa3ce	Muffin Orange Individual	O'Connell Group	375	18.38
f5da317b-6c63-4903-bff0-666aef6097cc	Potatoes - Mini Red	Hills, Mertz and Rowe	580	32.48
d0c6af11-5085-4b5d-9a35-de7738ba935d	Bagelers - Cinn / Brown Sugar	Dare Inc	817	68.01
e73011bf-5893-457e-b7e2-a114a55ed6ff	product test	manufacturer test	20	10.50
\.


--
-- TOC entry 2792 (class 2606 OID 16400)
-- Name: products id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT id_pk PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16390)
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-15 22:40:48 -03

--
-- PostgreSQL database dump complete
--

