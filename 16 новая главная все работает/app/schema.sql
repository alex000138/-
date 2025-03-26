--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: diseaseresistance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diseaseresistance (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    disease_id integer NOT NULL,
    resistance_level character varying(50)
);


ALTER TABLE public.diseaseresistance OWNER TO postgres;

--
-- Name: diseaseresistance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diseaseresistance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diseaseresistance_id_seq OWNER TO postgres;

--
-- Name: diseaseresistance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diseaseresistance_id_seq OWNED BY public.diseaseresistance.id;


--
-- Name: diseases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diseases (
    id integer NOT NULL,
    name_dis character varying(100) NOT NULL
);


ALTER TABLE public.diseases OWNER TO postgres;

--
-- Name: diseases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diseases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diseases_id_seq OWNER TO postgres;

--
-- Name: diseases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diseases_id_seq OWNED BY public.diseases.id;


--
-- Name: eardensity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eardensity (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    density character varying(50)
);


ALTER TABLE public.eardensity OWNER TO postgres;

--
-- Name: eardensity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eardensity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eardensity_id_seq OWNER TO postgres;

--
-- Name: eardensity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eardensity_id_seq OWNED BY public.eardensity.id;


--
-- Name: economicparameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.economicparameters (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    yield_stability character varying(50),
    adaptability character varying(50),
    market_value numeric(10,2),
    production_cost numeric(10,2)
);


ALTER TABLE public.economicparameters OWNER TO postgres;

--
-- Name: economicparameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.economicparameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.economicparameters_id_seq OWNER TO postgres;

--
-- Name: economicparameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.economicparameters_id_seq OWNED BY public.economicparameters.id;


--
-- Name: environmentalresistance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.environmentalresistance (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    drought_resistance character varying(50),
    rain_resistance character varying(50),
    cold_resistance character varying(50),
    lodging_resistance character varying(50),
    shattering_resistance character varying(50)
);


ALTER TABLE public.environmentalresistance OWNER TO postgres;

--
-- Name: environmentalresistance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.environmentalresistance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.environmentalresistance_id_seq OWNER TO postgres;

--
-- Name: environmentalresistance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.environmentalresistance_id_seq OWNED BY public.environmentalresistance.id;


--
-- Name: grainquality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grainquality (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    protein_content numeric(5,2),
    gluten_content numeric(5,2),
    baking_quality character varying(100)
);


ALTER TABLE public.grainquality OWNER TO postgres;

--
-- Name: grainquality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grainquality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grainquality_id_seq OWNER TO postgres;

--
-- Name: grainquality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grainquality_id_seq OWNED BY public.grainquality.id;


--
-- Name: growingregions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.growingregions (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.growingregions OWNER TO postgres;

--
-- Name: growingregions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.growingregions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.growingregions_id_seq OWNER TO postgres;

--
-- Name: growingregions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.growingregions_id_seq OWNED BY public.growingregions.id;


--
-- Name: growthparameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.growthparameters (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    embryonic_axis_length numeric(5,2),
    coleoptile_area numeric(5,2),
    first_leaf_area numeric(5,2),
    root_area numeric(5,2),
    root_count integer,
    leaf_area numeric(5,2),
    epiblast_area numeric(5,2),
    coleorhiza_area numeric(5,2),
    vascular_bundle_coleoptile numeric(5,2),
    vascular_bundle_scutellum numeric(5,2),
    amylase_activity numeric(5,2),
    endosperm_efficiency numeric(5,2),
    root_growth_intensity numeric(5,2),
    root_mass_intensity numeric(5,2),
    stem_growth_intensity numeric(5,2),
    stem_mass_intensity numeric(5,2),
    seed_growth_strength numeric(5,2)
);


ALTER TABLE public.growthparameters OWNER TO postgres;

--
-- Name: growthparameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.growthparameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.growthparameters_id_seq OWNER TO postgres;

--
-- Name: growthparameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.growthparameters_id_seq OWNED BY public.growthparameters.id;


--
-- Name: maincharacteristics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maincharacteristics (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    plant_height character varying(50),
    ear_shape character varying(50),
    grain_color character varying(50),
    grain_weight_100 numeric(5,2)
);


ALTER TABLE public.maincharacteristics OWNER TO postgres;

--
-- Name: maincharacteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maincharacteristics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maincharacteristics_id_seq OWNER TO postgres;

--
-- Name: maincharacteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maincharacteristics_id_seq OWNED BY public.maincharacteristics.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name_territory character varying(100) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: stemtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stemtype (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    type_st character varying(50)
);


ALTER TABLE public.stemtype OWNER TO postgres;

--
-- Name: stemtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stemtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stemtype_id_seq OWNER TO postgres;

--
-- Name: stemtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stemtype_id_seq OWNED BY public.stemtype.id;


--
-- Name: varieties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.varieties (
    id integer NOT NULL,
    name_main character varying(100) NOT NULL,
    type_main character varying(50) NOT NULL,
    code character varying(50),
    description text,
    origin character varying(100),
    registration_year integer
);


ALTER TABLE public.varieties OWNER TO postgres;

--
-- Name: varieties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.varieties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.varieties_id_seq OWNER TO postgres;

--
-- Name: varieties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.varieties_id_seq OWNED BY public.varieties.id;


--
-- Name: yield; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yield (
    id integer NOT NULL,
    variety_id integer NOT NULL,
    region_id integer NOT NULL,
    average_yield numeric(5,2),
    max_yield numeric(5,2)
);


ALTER TABLE public.yield OWNER TO postgres;

--
-- Name: yield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.yield_id_seq OWNER TO postgres;

--
-- Name: yield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yield_id_seq OWNED BY public.yield.id;


--
-- Name: yieldyears; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yieldyears (
    id integer NOT NULL,
    yield_id integer NOT NULL,
    year_y integer
);


ALTER TABLE public.yieldyears OWNER TO postgres;

--
-- Name: yieldyears_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yieldyears_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.yieldyears_id_seq OWNER TO postgres;

--
-- Name: yieldyears_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yieldyears_id_seq OWNED BY public.yieldyears.id;


--
-- Name: diseaseresistance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseaseresistance ALTER COLUMN id SET DEFAULT nextval('public.diseaseresistance_id_seq'::regclass);


--
-- Name: diseases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseases ALTER COLUMN id SET DEFAULT nextval('public.diseases_id_seq'::regclass);


--
-- Name: eardensity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eardensity ALTER COLUMN id SET DEFAULT nextval('public.eardensity_id_seq'::regclass);


--
-- Name: economicparameters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.economicparameters ALTER COLUMN id SET DEFAULT nextval('public.economicparameters_id_seq'::regclass);


--
-- Name: environmentalresistance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmentalresistance ALTER COLUMN id SET DEFAULT nextval('public.environmentalresistance_id_seq'::regclass);


--
-- Name: grainquality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grainquality ALTER COLUMN id SET DEFAULT nextval('public.grainquality_id_seq'::regclass);


--
-- Name: growingregions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growingregions ALTER COLUMN id SET DEFAULT nextval('public.growingregions_id_seq'::regclass);


--
-- Name: growthparameters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growthparameters ALTER COLUMN id SET DEFAULT nextval('public.growthparameters_id_seq'::regclass);


--
-- Name: maincharacteristics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maincharacteristics ALTER COLUMN id SET DEFAULT nextval('public.maincharacteristics_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: stemtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stemtype ALTER COLUMN id SET DEFAULT nextval('public.stemtype_id_seq'::regclass);


--
-- Name: varieties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.varieties ALTER COLUMN id SET DEFAULT nextval('public.varieties_id_seq'::regclass);


--
-- Name: yield id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yield ALTER COLUMN id SET DEFAULT nextval('public.yield_id_seq'::regclass);


--
-- Name: yieldyears id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yieldyears ALTER COLUMN id SET DEFAULT nextval('public.yieldyears_id_seq'::regclass);


--
-- Name: diseaseresistance diseaseresistance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseaseresistance
    ADD CONSTRAINT diseaseresistance_pkey PRIMARY KEY (id);


--
-- Name: diseases diseases_name_dis_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseases
    ADD CONSTRAINT diseases_name_dis_key UNIQUE (name_dis);


--
-- Name: diseases diseases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseases
    ADD CONSTRAINT diseases_pkey PRIMARY KEY (id);


--
-- Name: eardensity eardensity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eardensity
    ADD CONSTRAINT eardensity_pkey PRIMARY KEY (id);


--
-- Name: economicparameters economicparameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.economicparameters
    ADD CONSTRAINT economicparameters_pkey PRIMARY KEY (id);


--
-- Name: environmentalresistance environmentalresistance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmentalresistance
    ADD CONSTRAINT environmentalresistance_pkey PRIMARY KEY (id);


--
-- Name: grainquality grainquality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grainquality
    ADD CONSTRAINT grainquality_pkey PRIMARY KEY (id);


--
-- Name: growingregions growingregions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growingregions
    ADD CONSTRAINT growingregions_pkey PRIMARY KEY (id);


--
-- Name: growthparameters growthparameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growthparameters
    ADD CONSTRAINT growthparameters_pkey PRIMARY KEY (id);


--
-- Name: maincharacteristics maincharacteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maincharacteristics
    ADD CONSTRAINT maincharacteristics_pkey PRIMARY KEY (id);


--
-- Name: regions regions_name_territory_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_territory_key UNIQUE (name_territory);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: stemtype stemtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stemtype
    ADD CONSTRAINT stemtype_pkey PRIMARY KEY (id);


--
-- Name: varieties varieties_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.varieties
    ADD CONSTRAINT varieties_code_key UNIQUE (code);


--
-- Name: varieties varieties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.varieties
    ADD CONSTRAINT varieties_pkey PRIMARY KEY (id);


--
-- Name: yield yield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yield
    ADD CONSTRAINT yield_pkey PRIMARY KEY (id);


--
-- Name: yieldyears yieldyears_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yieldyears
    ADD CONSTRAINT yieldyears_pkey PRIMARY KEY (id);


--
-- Name: diseaseresistance diseaseresistance_disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseaseresistance
    ADD CONSTRAINT diseaseresistance_disease_id_fkey FOREIGN KEY (disease_id) REFERENCES public.diseases(id) ON DELETE CASCADE;


--
-- Name: diseaseresistance diseaseresistance_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diseaseresistance
    ADD CONSTRAINT diseaseresistance_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: eardensity eardensity_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eardensity
    ADD CONSTRAINT eardensity_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: economicparameters economicparameters_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.economicparameters
    ADD CONSTRAINT economicparameters_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: environmentalresistance environmentalresistance_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmentalresistance
    ADD CONSTRAINT environmentalresistance_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: grainquality grainquality_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grainquality
    ADD CONSTRAINT grainquality_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: growingregions growingregions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growingregions
    ADD CONSTRAINT growingregions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE CASCADE;


--
-- Name: growingregions growingregions_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growingregions
    ADD CONSTRAINT growingregions_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: growthparameters growthparameters_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.growthparameters
    ADD CONSTRAINT growthparameters_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: maincharacteristics maincharacteristics_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maincharacteristics
    ADD CONSTRAINT maincharacteristics_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: stemtype stemtype_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stemtype
    ADD CONSTRAINT stemtype_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: yield yield_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yield
    ADD CONSTRAINT yield_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE CASCADE;


--
-- Name: yield yield_variety_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yield
    ADD CONSTRAINT yield_variety_id_fkey FOREIGN KEY (variety_id) REFERENCES public.varieties(id) ON DELETE CASCADE;


--
-- Name: yieldyears yieldyears_yield_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yieldyears
    ADD CONSTRAINT yieldyears_yield_id_fkey FOREIGN KEY (yield_id) REFERENCES public.yield(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

