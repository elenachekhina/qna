--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.3

-- Started on 2023-08-20 14:40:48 +04

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16705)
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 16704)
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 224
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- TOC entry 223 (class 1259 OID 16695)
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16694)
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 222
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- TOC entry 227 (class 1259 OID 16721)
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16720)
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 226
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- TOC entry 215 (class 1259 OID 16402)
-- Name: answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    body text,
    question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    author_id bigint DEFAULT 1 NOT NULL,
    mark boolean DEFAULT false
);


--
-- TOC entry 214 (class 1259 OID 16401)
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 214
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- TOC entry 219 (class 1259 OID 16432)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 20630)
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    title character varying
);


--
-- TOC entry 246 (class 1259 OID 20629)
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 246
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- TOC entry 237 (class 1259 OID 18625)
-- Name: authorizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authorizations (
    id bigint NOT NULL,
    user_id bigint,
    provider character varying,
    uid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 18624)
-- Name: authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 236
-- Name: authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authorizations_id_seq OWNED BY public.authorizations.id;


--
-- TOC entry 235 (class 1259 OID 18271)
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    commentable_type character varying,
    commentable_id bigint,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18270)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 229 (class 1259 OID 16777)
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    linkable_type character varying,
    linkable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    type character varying DEFAULT 'Link'::character varying NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 16776)
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 228
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- TOC entry 241 (class 1259 OID 19258)
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id bigint NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    revoked_at timestamp(6) without time zone
);


--
-- TOC entry 240 (class 1259 OID 19257)
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 240
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- TOC entry 243 (class 1259 OID 19276)
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id bigint,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    scopes character varying,
    created_at timestamp(6) without time zone NOT NULL,
    revoked_at timestamp(6) without time zone,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 19275)
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 242
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- TOC entry 239 (class 1259 OID 19246)
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 19245)
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 238
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    author_id bigint DEFAULT 1 NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 216
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- TOC entry 231 (class 1259 OID 17056)
-- Name: rewards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rewards (
    id bigint NOT NULL,
    name character varying,
    question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17055)
-- Name: rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 230
-- Name: rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rewards_id_seq OWNED BY public.rewards.id;


--
-- TOC entry 218 (class 1259 OID 16425)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 20091)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    subscriber_id bigint NOT NULL,
    subscriptable_type character varying,
    subscriptable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20090)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 244
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 221 (class 1259 OID 16478)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    confirmation_token character varying,
    admin boolean DEFAULT false
);


--
-- TOC entry 220 (class 1259 OID 16477)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 233 (class 1259 OID 17795)
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    votable_type character varying,
    votable_id bigint,
    voice integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 17794)
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 232
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- TOC entry 3532 (class 2604 OID 16708)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3531 (class 2604 OID 16698)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3533 (class 2604 OID 16724)
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- TOC entry 3522 (class 2604 OID 16405)
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- TOC entry 3548 (class 2604 OID 20633)
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- TOC entry 3539 (class 2604 OID 18628)
-- Name: authorizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authorizations ALTER COLUMN id SET DEFAULT nextval('public.authorizations_id_seq'::regclass);


--
-- TOC entry 3538 (class 2604 OID 18274)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3534 (class 2604 OID 16780)
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- TOC entry 3543 (class 2604 OID 19261)
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 19279)
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- TOC entry 3540 (class 2604 OID 19249)
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 16415)
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- TOC entry 3536 (class 2604 OID 17059)
-- Name: rewards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards ALTER COLUMN id SET DEFAULT nextval('public.rewards_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 20094)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 3527 (class 2604 OID 16481)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3537 (class 2604 OID 17798)
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- TOC entry 3781 (class 0 OID 16705)
-- Dependencies: 225
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
120	files	Question	50	124	2023-07-01 09:02:18.500497
121	files	Answer	130	125	2023-07-01 11:48:40.076155
\.


--
-- TOC entry 3779 (class 0 OID 16695)
-- Dependencies: 223
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
120	7rke3ywfp4ignu6fdufxw2us9eqs	V6v4Rg7cV54.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	376298	o5iOd4oODBonx+3dZ6dw3A==	2023-05-27 07:32:52.966306
124	mqo20sg72tl26jsrz9ga6jzdxjta	Screenshot 2023-06-08 at 15.32.18.png	image/png	{"identified":true,"analyzed":true}	amazon	435754	dcz4TpYTRxX8gScoXRqj6A==	2023-07-01 09:02:18.496014
125	amxge2w0yc18t5qcj8ux4zs4eccx	Screenshot 2023-05-12 at 11.31.33.png	image/png	{"identified":true,"analyzed":true}	amazon	51363	C1fSQa9+rqHBRk7xqCFXcQ==	2023-07-01 11:48:40.073974
83	pqmyesz77hc2c9j9viej38h4k5c5	dOPz_foaPZA.jpg	image/jpeg	{"analyzed":true}	amazon	409162	1qXI3e/4t0v8PZzXOOzUpA==	2023-05-16 17:13:20.750816
111	44nal79sy2r0igotpk01yp4wixbl	dOPz_foaPZA.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	409162	1qXI3e/4t0v8PZzXOOzUpA==	2023-05-23 15:58:36.051059
84	t91eu7bb112cqw3wx0yr93ujpgzr	dOPz_foaPZA.jpg	image/jpeg	{"analyzed":true}	amazon	409162	1qXI3e/4t0v8PZzXOOzUpA==	2023-05-16 17:22:55.124444
113	i8lp0vhbmyox9df1oxn9l4drh9ys	V6v4Rg7cV54.jpg	image/jpeg	{"identified":true,"analyzed":true}	amazon	376298	o5iOd4oODBonx+3dZ6dw3A==	2023-05-23 15:58:36.062766
81	zzxrxmfd3dsx9er4e8m6368jqszd	-qf3h9vaMkM.jpg	image/jpeg	\N	amazon	346716	14IF9RX9wkOBrLRe+gH8sQ==	2023-05-16 17:12:19.075412
\.


--
-- TOC entry 3783 (class 0 OID 16721)
-- Dependencies: 227
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- TOC entry 3771 (class 0 OID 16402)
-- Dependencies: 215
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.answers (id, body, question_id, created_at, updated_at, author_id, mark) FROM stdin;
130	Answer for question	50	2023-07-01 09:19:19.392008	2023-07-01 11:48:40.078238	40	f
131	Meow Meow Meow Meow	54	2023-07-02 08:17:56.952888	2023-07-02 08:19:50.939672	40	f
132	Test Question update job	2	2023-07-07 17:51:25.815184	2023-07-07 17:51:25.815184	40	f
133	Another test answer	2	2023-07-07 17:52:46.336938	2023-07-07 17:52:46.336938	40	f
134	Test subscription	2	2023-07-07 18:25:48.809781	2023-07-07 18:25:48.809781	40	f
136	Test subscription	2	2023-07-15 13:32:31.587891	2023-07-15 13:32:31.587891	40	f
137	New question for test	55	2023-07-15 13:35:25.303973	2023-07-15 13:35:25.303973	40	f
138	New answer with subscription	50	2023-07-15 18:08:30.837346	2023-07-15 18:08:45.105801	40	t
142	0 AaaaaaaaaaAaaaaaaaaa0 AaaaaaaaaaAaaaaaaaaa	54	2023-07-15 19:14:12.862613	2023-07-15 19:14:12.862613	40	f
143	0 AaaaaaaaaaAaaaaaaaaa0 AaaaaaaaaaAaaaaaaaaa	54	2023-07-15 19:14:34.843706	2023-07-15 19:14:34.843706	40	f
144	kjhkjkjkjkjhkjhkjhkjkjh	54	2023-07-15 19:15:04.390055	2023-07-15 19:15:04.390055	40	f
145	sdfghjkl;lkjhgdsasdfghjk	54	2023-07-15 19:16:48.070986	2023-07-15 19:16:48.070986	40	f
146	poiuytrewqwertyuiopoiuytrew	54	2023-07-15 19:16:54.857258	2023-07-15 19:16:54.857258	40	f
147	New subscription answer	58	2023-07-15 19:18:24.636704	2023-07-15 19:18:24.636704	40	f
148	New subscription question	58	2023-07-15 19:18:33.435537	2023-07-15 19:18:33.435537	40	f
79	Test answer	2	2023-05-21 08:48:36.01649	2023-05-27 09:05:07.0283	1	t
152	asdfghjklasdfghjkl	2	2023-07-22 14:13:34.655943	2023-07-22 14:13:34.655943	40	f
153	sssssssssss	2	2023-08-17 14:54:25.915501	2023-08-17 14:54:25.915501	40	f
121	!0 body symbols	2	2023-06-04 08:59:59.914987	2023-06-04 08:59:59.914987	1	f
122	!0 body symbols other client	2	2023-06-04 09:00:13.416764	2023-06-04 09:00:13.416764	3	f
123	Test with other page	2	2023-06-04 09:01:41.462545	2023-06-04 09:01:41.462545	1	f
124	ddddddddddddd	2	2023-06-05 19:51:50.380602	2023-06-05 19:51:50.380602	1	f
81	New body answer edit	2	2023-05-21 11:08:32.30167	2023-05-21 11:38:51.805199	1	f
\.


--
-- TOC entry 3775 (class 0 OID 16432)
-- Dependencies: 219
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-05-01 11:12:30.711699	2023-05-01 11:12:30.711699
schema_sha1	0ac746b7b81f4272b665888024b7a963fa063209	2023-05-01 11:12:30.721098	2023-05-01 11:12:30.721098
\.


--
-- TOC entry 3803 (class 0 OID 20630)
-- Dependencies: 247
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.articles (id, title) FROM stdin;
1	Quick brown fox
2	Fast black dogs
3	Swift green frogs
4	Quick brown fox
5	Fast black dogs
6	Swift green frogs
7	Quick brown fox
8	Fast black dogs
9	Swift green frogs
\.


--
-- TOC entry 3793 (class 0 OID 18625)
-- Dependencies: 237
-- Data for Name: authorizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authorizations (id, user_id, provider, uid, created_at, updated_at) FROM stdin;
42	40	github	30229600	2023-06-18 09:23:57.392965	2023-06-18 09:23:57.392965
\.


--
-- TOC entry 3791 (class 0 OID 18271)
-- Dependencies: 235
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, user_id, commentable_type, commentable_id, body, created_at, updated_at) FROM stdin;
32	40	Question	50	Comment for test	2023-07-01 09:19:38.184142	2023-07-01 09:19:38.184142
33	40	Answer	130	Comment for answer	2023-07-01 11:48:48.169303	2023-07-01 11:48:48.169303
34	40	Question	2	ghjghjghj	2023-07-15 19:24:44.461844	2023-07-15 19:24:44.461844
35	40	Answer	79	comment to answer papapapa	2023-07-22 13:23:51.573964	2023-07-22 13:23:51.573964
36	40	Question	2	Comment 123	2023-07-22 14:07:10.022648	2023-07-22 14:07:10.022648
37	40	Question	68	comment 54419	2023-07-23 09:29:23.695661	2023-07-23 09:29:23.695661
38	40	Question	54	hehe	2023-07-23 09:47:34.230151	2023-07-23 09:47:34.230151
\.


--
-- TOC entry 3785 (class 0 OID 16777)
-- Dependencies: 229
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, name, url, linkable_type, linkable_id, created_at, updated_at, type) FROM stdin;
50	Gist	https://gist.github.com/elenachekhina/ecda8cf62dafcd6807e64fa89bba5649	Answer	153	2023-08-17 14:54:25.947645	2023-08-17 14:54:25.947645	Gist
20	first link edit	https://ya.ru/	Answer	81	2023-05-21 11:08:32.304756	2023-05-21 11:08:42.484849	Link
21	Add new link through edit form	https://translate.yandex.ru	Answer	81	2023-05-21 11:09:13.52075	2023-05-21 11:09:13.52075	Link
18	Add new link edited	https://ya.ru	Answer	79	2023-05-21 11:01:25.085849	2023-05-21 11:19:06.195465	Link
45	Yandex	https://ya.ru/	Question	50	2023-07-01 09:18:35.782959	2023-07-01 09:18:35.782959	Link
46	Gist	https://gist.github.com/elenachekhina/ecda8cf62dafcd6807e64fa89bba5649	Answer	130	2023-07-01 09:19:19.39938	2023-07-01 09:19:19.39938	Gist
\.


--
-- TOC entry 3797 (class 0 OID 19258)
-- Dependencies: 241
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, scopes, created_at, revoked_at) FROM stdin;
1	40	1	RrDHxi9rG2P0DlgyKCZ1IpVkAfCL24-hhK7W5puabGE	600	urn:ietf:wg:oauth:2.0:oob	read	2023-06-25 13:49:48.91189	\N
2	40	1	fsrj0o1gROaycFfu0xV3fZ41XENjsIvxXBMyHEfbPYs	600	urn:ietf:wg:oauth:2.0:oob	read	2023-06-25 14:20:13.998013	\N
3	40	1	2M9JBRpqGM_0AxVwjQU9KOwK19vFXHcBP4iL3-qygp8	600	urn:ietf:wg:oauth:2.0:oob	read	2023-06-25 15:04:03.921118	2023-06-25 15:07:32.590258
4	40	1	D_eKvBpNWgC63g1HHoOfNyeLKQztr7wjEnBIY184EeE	600	urn:ietf:wg:oauth:2.0:oob	read	2023-07-01 09:09:00.105075	2023-07-01 09:09:22.159862
5	40	1	jIwN0CIBoTqVhxX4Cm0-H7Cq0ZcvJBz1PQabq7D3UA8	600	urn:ietf:wg:oauth:2.0:oob	read	2023-07-01 11:34:04.807027	2023-07-01 11:34:22.601099
6	40	1	BSU2GPLIugIee9XGsh25UkwiqvdZy8wD2wuF3V1M5kE	600	urn:ietf:wg:oauth:2.0:oob	read	2023-07-02 07:36:17.017635	2023-07-02 07:36:34.671034
\.


--
-- TOC entry 3799 (class 0 OID 19276)
-- Dependencies: 243
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, scopes, created_at, revoked_at, previous_refresh_token) FROM stdin;
1	40	1	_1ozueWmHtKLaL4GYlAV4DOdGoeQmZt9TfNJahepr6E	\N	7200	read	2023-06-25 15:07:32.633439	\N	
2	40	1	-75msIvH0PHd6LkIR-0tQAXazjxlsFjfXkAbNWzzFGE	\N	7200	read	2023-07-01 09:09:22.165948	\N	
3	40	1	WHG8AxkkrAcsCjfTeTOtRiU_yqxUt-DnRXptP9uEDxs	\N	7200	read	2023-07-01 11:34:22.605434	\N	
4	40	1	fw_x7e0NbzyTGQ7-XbHso4Tz0Pmw3ZnZq7-R3YVQNLk	\N	7200	read	2023-07-02 07:36:34.677149	\N	
\.


--
-- TOC entry 3795 (class 0 OID 19246)
-- Dependencies: 239
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, confidential, created_at, updated_at) FROM stdin;
1	Demo App	ydVCYBRtnGE0Wfd8D7eDLZejkXA6KodkYuyzwm-FYXM	wvtsuX_hklTxB0ZXrBLCHzbzjsBFBAGL7N7wZhX3brk	urn:ietf:wg:oauth:2.0:oob	read	t	2023-06-25 13:45:20.865746	2023-06-25 13:47:27.435283
\.


--
-- TOC entry 3773 (class 0 OID 16412)
-- Dependencies: 217
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.questions (id, title, body, created_at, updated_at, author_id) FROM stdin;
64	Greece	Where do you recommend to go in Greece?	2023-07-21 18:02:10.823654	2023-07-21 18:02:10.823654	40
65	Moscow	Moscow	2023-07-22 08:46:18.236197	2023-07-22 08:46:18.236197	40
66	New question woof	New question woof	2023-07-22 14:02:22.191685	2023-07-22 14:02:22.191685	40
67	qwertyuiop	qwertyuiop	2023-07-23 08:59:37.21411	2023-07-23 08:59:37.21411	40
68	zxcvbnm	zxcvbnm	2023-07-23 09:20:02.139707	2023-07-23 09:20:02.139707	40
54	Meow!	Meow Meow	2023-07-02 07:37:18.624418	2023-07-21 17:44:12.816581	40
55	New question for test!	Body of new question	2023-07-07 12:32:30.385159	2023-07-21 17:44:12.929444	40
56	New question for subscribe!	New question for subscribe	2023-07-15 18:19:50.028838	2023-07-21 17:44:13.041933	40
57	New test question subscribe!	New test question subscribe	2023-07-15 18:31:01.493496	2023-07-21 17:44:13.127665	40
58	New subscription question!	New subscription question	2023-07-15 19:18:17.466436	2023-07-21 17:44:13.224364	40
59	New question!	New question for elasticsearch	2023-07-19 15:28:05.377961	2023-07-21 17:44:13.298074	40
60	What is Arcadia!	What is YT?	2023-07-19 18:30:00.346352	2023-07-21 17:44:13.447235	40
61	What do you know about Georgia?!	Exactly Tbilisi	2023-07-21 15:42:20.30588	2023-07-21 17:44:13.536121	40
62	Who are you?!	Who am I?	2023-07-21 15:43:46.408796	2023-07-21 17:44:13.620023	40
50	Title question one!	Title question	2023-06-19 19:28:46.126055	2023-07-21 17:44:13.710957	40
2	Reindex question!	Question body	2023-05-07 12:55:40.152369	2023-07-21 17:44:13.789657	1
\.


--
-- TOC entry 3787 (class 0 OID 17056)
-- Dependencies: 231
-- Data for Name: rewards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rewards (id, name, question_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3774 (class 0 OID 16425)
-- Dependencies: 218
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20230404170627
20230404162945
20230501113233
20230501115227
20230508132151
20230508183325
20230512130821
20230513073731
20230516154721
20230523171725
20230524185503
20230530181025
20230605185453
20230612165424
20230616171057
20230625123825
20230629171432
20230707132921
1
\.


--
-- TOC entry 3801 (class 0 OID 20091)
-- Dependencies: 245
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscriptions (id, subscriber_id, subscriptable_type, subscriptable_id, created_at, updated_at) FROM stdin;
31	40	Question	50	2023-07-15 19:04:25.218957	2023-07-15 19:04:25.218957
42	40	Question	54	2023-07-15 19:16:50.101738	2023-07-15 19:16:50.101738
43	40	Question	2	2023-07-15 19:17:47.515531	2023-07-15 19:17:47.515531
45	40	Question	59	2023-07-19 15:28:05.416797	2023-07-19 15:28:05.416797
46	40	Question	60	2023-07-19 18:30:00.358152	2023-07-19 18:30:00.358152
47	40	Question	61	2023-07-21 15:42:20.461639	2023-07-21 15:42:20.461639
48	40	Question	62	2023-07-21 15:43:46.643524	2023-07-21 15:43:46.643524
50	40	Question	64	2023-07-21 18:02:11.018072	2023-07-21 18:02:11.018072
51	40	Question	65	2023-07-22 08:46:18.486374	2023-07-22 08:46:18.486374
52	40	Question	66	2023-07-22 14:02:22.38852	2023-07-22 14:02:22.38852
53	40	Question	67	2023-07-23 08:59:37.496092	2023-07-23 08:59:37.496092
54	40	Question	68	2023-07-23 09:20:02.306107	2023-07-23 09:20:02.306107
\.


--
-- TOC entry 3777 (class 0 OID 16478)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, admin) FROM stdin;
1	2023-05-07 09:13:32.831037	2023-05-07 09:13:32.831037	elena@mail.com	$2a$12$TO8CZ7Gy.BIzDShNfrOiVOsT3uoXCPTOnwSqXdNuXSBeHXNJTfyBG	\N	\N	\N	\N	f
2	2023-05-08 11:42:57.71055	2023-05-08 11:42:57.71055	asd@asd.com	$2a$12$P/TUXYFYEDL1pD./xk2tTeEybjM18tKLM.nRNaO6xujtoMJcsSLcK	\N	\N	\N	\N	f
3	2023-05-11 13:13:05.483334	2023-05-11 13:13:05.483334	aaa@aaa.ru	$2a$12$s5P07xbXkbHbaHckbKw0yepyLaFQYg6XbCOsBQyT3yRnkT3Uu/cC.	\N	\N	\N	\N	f
40	2023-06-18 09:23:57.3841	2023-06-29 17:16:21.95462	elenachekhina@yandex.ru	$2a$12$PBjCWBP/0gKy.nmjtzc8XuxAxUiWL54r5FMIauD98LoHiiudL2ErS	\N	\N	\N	\N	t
\.


--
-- TOC entry 3789 (class 0 OID 17795)
-- Dependencies: 233
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (id, user_id, votable_type, votable_id, voice, created_at, updated_at) FROM stdin;
17	3	Question	2	1	2023-06-03 11:06:50.535912	2023-06-03 11:06:50.535912
\.


--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 224
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 121, true);


--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 222
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 125, true);


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 226
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 214
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.answers_id_seq', 153, true);


--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 246
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.articles_id_seq', 9, true);


--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 236
-- Name: authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authorizations_id_seq', 43, true);


--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 38, true);


--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 228
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 50, true);


--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 240
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 6, true);


--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 242
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 4, true);


--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 238
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, true);


--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 216
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.questions_id_seq', 68, true);


--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 230
-- Name: rewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rewards_id_seq', 5, true);


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 244
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 54, true);


--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 41, true);


--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 232
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.votes_id_seq', 23, true);


--
-- TOC entry 3568 (class 2606 OID 16712)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3565 (class 2606 OID 16702)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3572 (class 2606 OID 16728)
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- TOC entry 3550 (class 2606 OID 16409)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 3559 (class 2606 OID 16438)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3613 (class 2606 OID 20637)
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 3591 (class 2606 OID 18632)
-- Name: authorizations authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authorizations
    ADD CONSTRAINT authorizations_pkey PRIMARY KEY (id);


--
-- TOC entry 3587 (class 2606 OID 18278)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3577 (class 2606 OID 16784)
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- TOC entry 3601 (class 2606 OID 19266)
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- TOC entry 3607 (class 2606 OID 19284)
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 19255)
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3555 (class 2606 OID 16419)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 17063)
-- Name: rewards rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_pkey PRIMARY KEY (id);


--
-- TOC entry 3557 (class 2606 OID 16431)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3611 (class 2606 OID 20098)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3563 (class 2606 OID 16483)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3585 (class 2606 OID 17802)
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- TOC entry 3569 (class 1259 OID 16718)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 3570 (class 1259 OID 16719)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 3566 (class 1259 OID 16703)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 3573 (class 1259 OID 16734)
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- TOC entry 3551 (class 1259 OID 16621)
-- Name: index_answers_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_author_id ON public.answers USING btree (author_id);


--
-- TOC entry 3552 (class 1259 OID 16410)
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- TOC entry 3592 (class 1259 OID 18639)
-- Name: index_authorizations_on_provider_and_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authorizations_on_provider_and_uid ON public.authorizations USING btree (provider, uid);


--
-- TOC entry 3593 (class 1259 OID 18638)
-- Name: index_authorizations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authorizations_on_user_id ON public.authorizations USING btree (user_id);


--
-- TOC entry 3588 (class 1259 OID 18285)
-- Name: index_comments_on_commentable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable ON public.comments USING btree (commentable_type, commentable_id);


--
-- TOC entry 3589 (class 1259 OID 18284)
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- TOC entry 3574 (class 1259 OID 16785)
-- Name: index_links_on_linkable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linkable ON public.links USING btree (linkable_type, linkable_id);


--
-- TOC entry 3575 (class 1259 OID 16914)
-- Name: index_links_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_type ON public.links USING btree (type);


--
-- TOC entry 3597 (class 1259 OID 19268)
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- TOC entry 3598 (class 1259 OID 19267)
-- Name: index_oauth_access_grants_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- TOC entry 3599 (class 1259 OID 19269)
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- TOC entry 3602 (class 1259 OID 19286)
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- TOC entry 3603 (class 1259 OID 19288)
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- TOC entry 3604 (class 1259 OID 19285)
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- TOC entry 3605 (class 1259 OID 19287)
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- TOC entry 3594 (class 1259 OID 19256)
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- TOC entry 3553 (class 1259 OID 16555)
-- Name: index_questions_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_questions_on_author_id ON public.questions USING btree (author_id);


--
-- TOC entry 3578 (class 1259 OID 17069)
-- Name: index_rewards_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rewards_on_question_id ON public.rewards USING btree (question_id);


--
-- TOC entry 3608 (class 1259 OID 20104)
-- Name: index_subscriptions_on_subscriber_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_subscriber_id ON public.subscriptions USING btree (subscriber_id);


--
-- TOC entry 3609 (class 1259 OID 20105)
-- Name: index_subscriptions_on_subscriptable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_subscriptable ON public.subscriptions USING btree (subscriptable_type, subscriptable_id);


--
-- TOC entry 3560 (class 1259 OID 16488)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 3561 (class 1259 OID 16489)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 3581 (class 1259 OID 17808)
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_user_id ON public.votes USING btree (user_id);


--
-- TOC entry 3582 (class 1259 OID 17810)
-- Name: index_votes_on_user_id_and_votable_type_and_votable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_votes_on_user_id_and_votable_type_and_votable_id ON public.votes USING btree (user_id, votable_type, votable_id);


--
-- TOC entry 3583 (class 1259 OID 17809)
-- Name: index_votes_on_votable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable ON public.votes USING btree (votable_type, votable_id);


--
-- TOC entry 3621 (class 2606 OID 18279)
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3623 (class 2606 OID 19294)
-- Name: oauth_access_grants fk_rails_330c32d8d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_330c32d8d9 FOREIGN KEY (resource_owner_id) REFERENCES public.users(id);


--
-- TOC entry 3614 (class 2606 OID 16420)
-- Name: answers fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 3622 (class 2606 OID 18633)
-- Name: authorizations fk_rails_4ecef5b8c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authorizations
    ADD CONSTRAINT fk_rails_4ecef5b8c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3615 (class 2606 OID 16622)
-- Name: answers fk_rails_5975430297; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_5975430297 FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 3625 (class 2606 OID 19289)
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- TOC entry 3619 (class 2606 OID 17064)
-- Name: rewards fk_rails_9818735278; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT fk_rails_9818735278 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- TOC entry 3618 (class 2606 OID 16729)
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 3627 (class 2606 OID 20099)
-- Name: subscriptions fk_rails_af2b916821; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_af2b916821 FOREIGN KEY (subscriber_id) REFERENCES public.users(id);


--
-- TOC entry 3624 (class 2606 OID 19270)
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- TOC entry 3617 (class 2606 OID 16713)
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 3620 (class 2606 OID 17803)
-- Name: votes fk_rails_c9b3bef597; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fk_rails_c9b3bef597 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3616 (class 2606 OID 16556)
-- Name: questions fk_rails_d96516e73c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_d96516e73c FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 3626 (class 2606 OID 19299)
-- Name: oauth_access_tokens fk_rails_ee63f25419; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_ee63f25419 FOREIGN KEY (resource_owner_id) REFERENCES public.users(id);


-- Completed on 2023-08-20 14:40:48 +04

--
-- PostgreSQL database dump complete
--

