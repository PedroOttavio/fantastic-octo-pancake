--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-16 02:50:03

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
-- TOC entry 218 (class 1259 OID 24759)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cargo character varying(100),
    salario numeric(10,2)
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24758)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcionario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.funcionario_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 217
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcionario_id_seq OWNED BY public.funcionario.id;


--
-- TOC entry 222 (class 1259 OID 24777)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    codigo_pedido integer NOT NULL,
    valor numeric(10,2) NOT NULL,
    descricao text,
    tipo_pedido character varying(100),
    funcionario_id integer,
    usuario_id integer
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24776)
-- Name: pedidos_codigo_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_codigo_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_codigo_pedido_seq OWNER TO postgres;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 221
-- Name: pedidos_codigo_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_codigo_pedido_seq OWNED BY public.pedidos.codigo_pedido;


--
-- TOC entry 220 (class 1259 OID 24766)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24765)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4651 (class 2604 OID 24762)
-- Name: funcionario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario ALTER COLUMN id SET DEFAULT nextval('public.funcionario_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 24780)
-- Name: pedidos codigo_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN codigo_pedido SET DEFAULT nextval('public.pedidos_codigo_pedido_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 24769)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4810 (class 0 OID 24759)
-- Dependencies: 218
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionario (id, nome, cargo, salario) VALUES (1, 'João da Silva', 'Atendente', 1800.00);
INSERT INTO public.funcionario (id, nome, cargo, salario) VALUES (2, 'Maria Souza', 'Gerente', 3500.00);


--
-- TOC entry 4814 (class 0 OID 24777)
-- Dependencies: 222
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos (codigo_pedido, valor, descricao, tipo_pedido, funcionario_id, usuario_id) VALUES (1, 259.99, 'Pedido de frango congelado', 'Alimentício', 1, 1);
INSERT INTO public.pedidos (codigo_pedido, valor, descricao, tipo_pedido, funcionario_id, usuario_id) VALUES (2, 1200.00, 'Pedido de ração para granja', 'Veterinário', 2, 2);
INSERT INTO public.pedidos (codigo_pedido, valor, descricao, tipo_pedido, funcionario_id, usuario_id) VALUES (3, 23.00, 'sdfsdf', 'Presencial', 1, 1);
INSERT INTO public.pedidos (codigo_pedido, valor, descricao, tipo_pedido, funcionario_id, usuario_id) VALUES (4, 20.00, '2 refrigerantes', 'Presencial', 1, 1);


--
-- TOC entry 4812 (class 0 OID 24766)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id, nome, email, senha) VALUES (1, 'Carlos Mendes', 'carlos@example.com', 'senha123');
INSERT INTO public.usuario (id, nome, email, senha) VALUES (2, 'Ana Lima', 'ana@example.com', '1234segura');


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 217
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcionario_id_seq', 2, true);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 221
-- Name: pedidos_codigo_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_codigo_pedido_seq', 4, true);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 6, true);


--
-- TOC entry 4655 (class 2606 OID 24764)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 24784)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (codigo_pedido);


--
-- TOC entry 4657 (class 2606 OID 24775)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4659 (class 2606 OID 24773)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 24785)
-- Name: pedidos fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id) ON DELETE SET NULL;


--
-- TOC entry 4663 (class 2606 OID 24790)
-- Name: pedidos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE SET NULL;


-- Completed on 2025-07-16 02:50:04

--
-- PostgreSQL database dump complete
--

