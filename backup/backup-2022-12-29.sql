PGDMP                         z            project    15.0    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    19270    project    DATABASE     z   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Czech_Czechia.1250';
    DROP DATABASE project;
                postgres    false            �           0    0    DATABASE project    ACL     -   GRANT CONNECT ON DATABASE project TO "Kaca";
                   postgres    false    3488                        2615    19273    bds    SCHEMA        CREATE SCHEMA bds;
    DROP SCHEMA bds;
                Kaca    false            �            1259    19410    author    TABLE     �   CREATE TABLE bds.author (
    author_id integer NOT NULL,
    given_name character varying(45) NOT NULL,
    family_name character varying(45),
    born integer NOT NULL,
    died integer,
    popularity_rank integer
);
    DROP TABLE bds.author;
       bds         heap    postgres    false    5            �           0    0    TABLE author    ACL     T   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.author TO "Kaca";
          bds          postgres    false    237            �            1259    19409    author_author_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE bds.author_author_id_seq;
       bds          postgres    false    237    5            �           0    0    author_author_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bds.author_author_id_seq OWNED BY bds.author.author_id;
          bds          postgres    false    236            �           0    0    SEQUENCE author_author_id_seq    ACL     :   GRANT ALL ON SEQUENCE bds.author_author_id_seq TO "Kaca";
          bds          postgres    false    236            �            1259    19416    author_has_title    TABLE     p   CREATE TABLE bds.author_has_title (
    author_author_id bigint NOT NULL,
    title_title_id bigint NOT NULL
);
 !   DROP TABLE bds.author_has_title;
       bds         heap    postgres    false    5            �           0    0    TABLE author_has_title    ACL     ^   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.author_has_title TO "Kaca";
          bds          postgres    false    238            �            1259    19364    borrow    TABLE     �   CREATE TABLE bds.borrow (
    borrow_id integer NOT NULL,
    release_date date NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    extensions integer NOT NULL,
    user_user_id bigint NOT NULL,
    copy_copy_id bigint NOT NULL
);
    DROP TABLE bds.borrow;
       bds         heap    postgres    false    5            �           0    0    TABLE borrow    ACL     T   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.borrow TO "Kaca";
          bds          postgres    false    231            �            1259    19393    borrow_archive    TABLE       CREATE TABLE bds.borrow_archive (
    borrow_archive_id integer NOT NULL,
    release_date date NOT NULL,
    date_of_return timestamp(0) without time zone NOT NULL,
    extensions integer NOT NULL,
    user_user_id bigint NOT NULL,
    copy_copy_id bigint NOT NULL
);
    DROP TABLE bds.borrow_archive;
       bds         heap    postgres    false    5            �           0    0    TABLE borrow_archive    ACL     \   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.borrow_archive TO "Kaca";
          bds          postgres    false    235            �            1259    19392 $   borrow_archive_borrow_archive_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.borrow_archive_borrow_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE bds.borrow_archive_borrow_archive_id_seq;
       bds          postgres    false    235    5            �           0    0 $   borrow_archive_borrow_archive_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE bds.borrow_archive_borrow_archive_id_seq OWNED BY bds.borrow_archive.borrow_archive_id;
          bds          postgres    false    234            �           0    0 -   SEQUENCE borrow_archive_borrow_archive_id_seq    ACL     J   GRANT ALL ON SEQUENCE bds.borrow_archive_borrow_archive_id_seq TO "Kaca";
          bds          postgres    false    234            �            1259    19363    borrow_borrow_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.borrow_borrow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE bds.borrow_borrow_id_seq;
       bds          postgres    false    5    231            �           0    0    borrow_borrow_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bds.borrow_borrow_id_seq OWNED BY bds.borrow.borrow_id;
          bds          postgres    false    230            �           0    0    SEQUENCE borrow_borrow_id_seq    ACL     :   GRANT ALL ON SEQUENCE bds.borrow_borrow_id_seq TO "Kaca";
          bds          postgres    false    230            �            1259    19307    borrow_type    TABLE     o   CREATE TABLE bds.borrow_type (
    borrow_type_id integer NOT NULL,
    type character varying(45) NOT NULL
);
    DROP TABLE bds.borrow_type;
       bds         heap    postgres    false    5            �           0    0    TABLE borrow_type    ACL     Y   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.borrow_type TO "Kaca";
          bds          postgres    false    221            �            1259    19306    borrow_type_borrow_type_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.borrow_type_borrow_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE bds.borrow_type_borrow_type_id_seq;
       bds          postgres    false    221    5            �           0    0    borrow_type_borrow_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE bds.borrow_type_borrow_type_id_seq OWNED BY bds.borrow_type.borrow_type_id;
          bds          postgres    false    220            �           0    0 '   SEQUENCE borrow_type_borrow_type_id_seq    ACL     D   GRANT ALL ON SEQUENCE bds.borrow_type_borrow_type_id_seq TO "Kaca";
          bds          postgres    false    220            �            1259    19335    copy    TABLE       CREATE TABLE bds.copy (
    copy_id integer NOT NULL,
    type_of_borrow integer NOT NULL,
    release_year integer NOT NULL,
    borrowed boolean NOT NULL,
    lang_id integer NOT NULL,
    no_of_pages integer NOT NULL,
    height numeric NOT NULL,
    depth numeric NOT NULL,
    width numeric NOT NULL,
    stock_location_mark character varying(45) NOT NULL,
    borrow_type_borrow_type_id bigint NOT NULL,
    location_location_id bigint,
    title_title_id bigint NOT NULL,
    lang_name_lang_name_id bigint NOT NULL
);
    DROP TABLE bds.copy;
       bds         heap    postgres    false    5            �           0    0 
   TABLE copy    ACL     R   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.copy TO "Kaca";
          bds          postgres    false    229            �            1259    19334    copy_copy_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.copy_copy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE bds.copy_copy_id_seq;
       bds          postgres    false    229    5            �           0    0    copy_copy_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE bds.copy_copy_id_seq OWNED BY bds.copy.copy_id;
          bds          postgres    false    228            �           0    0    SEQUENCE copy_copy_id_seq    ACL     6   GRANT ALL ON SEQUENCE bds.copy_copy_id_seq TO "Kaca";
          bds          postgres    false    228            �            1259    19277    customer_detail    TABLE     �   CREATE TABLE bds.customer_detail (
    customer_id integer NOT NULL,
    membership_expiration date NOT NULL,
    shelve_number integer NOT NULL
);
     DROP TABLE bds.customer_detail;
       bds         heap    postgres    false    5            �           0    0    TABLE customer_detail    ACL     ]   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.customer_detail TO "Kaca";
          bds          postgres    false    215            �            1259    19276    customer_detail_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.customer_detail_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE bds.customer_detail_customer_id_seq;
       bds          postgres    false    215    5            �           0    0    customer_detail_customer_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE bds.customer_detail_customer_id_seq OWNED BY bds.customer_detail.customer_id;
          bds          postgres    false    214            �           0    0 (   SEQUENCE customer_detail_customer_id_seq    ACL     E   GRANT ALL ON SEQUENCE bds.customer_detail_customer_id_seq TO "Kaca";
          bds          postgres    false    214            �            1259    19447    genre    TABLE     n   CREATE TABLE bds.genre (
    title_to_genre_id integer NOT NULL,
    genre character varying(100) NOT NULL
);
    DROP TABLE bds.genre;
       bds         heap    postgres    false    5            �           0    0    TABLE genre    ACL     S   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.genre TO "Kaca";
          bds          postgres    false    241            �            1259    19453    genre_has_title    TABLE     v   CREATE TABLE bds.genre_has_title (
    genre_title_to_genre_id bigint NOT NULL,
    title_title_id bigint NOT NULL
);
     DROP TABLE bds.genre_has_title;
       bds         heap    postgres    false    5            �           0    0    TABLE genre_has_title    ACL     ]   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.genre_has_title TO "Kaca";
          bds          postgres    false    242            �            1259    19446    genre_title_to_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.genre_title_to_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE bds.genre_title_to_genre_id_seq;
       bds          postgres    false    241    5            �           0    0    genre_title_to_genre_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE bds.genre_title_to_genre_id_seq OWNED BY bds.genre.title_to_genre_id;
          bds          postgres    false    240            �           0    0 $   SEQUENCE genre_title_to_genre_id_seq    ACL     A   GRANT ALL ON SEQUENCE bds.genre_title_to_genre_id_seq TO "Kaca";
          bds          postgres    false    240            �            1259    19321 	   lang_name    TABLE     ]   CREATE TABLE bds.lang_name (
    lang_id integer NOT NULL,
    name character varying(45)
);
    DROP TABLE bds.lang_name;
       bds         heap    postgres    false    5            �           0    0    TABLE lang_name    ACL     W   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.lang_name TO "Kaca";
          bds          postgres    false    225            �            1259    19320    lang_name_lang_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.lang_name_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE bds.lang_name_lang_id_seq;
       bds          postgres    false    5    225            �           0    0    lang_name_lang_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE bds.lang_name_lang_id_seq OWNED BY bds.lang_name.lang_id;
          bds          postgres    false    224            �           0    0    SEQUENCE lang_name_lang_id_seq    ACL     ;   GRANT ALL ON SEQUENCE bds.lang_name_lang_id_seq TO "Kaca";
          bds          postgres    false    224            �            1259    19314    location    TABLE     �   CREATE TABLE bds.location (
    location_id integer NOT NULL,
    floor integer NOT NULL,
    location character varying(45) NOT NULL
);
    DROP TABLE bds.location;
       bds         heap    postgres    false    5            �           0    0    TABLE location    ACL     V   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.location TO "Kaca";
          bds          postgres    false    223            �            1259    19313    location_location_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE bds.location_location_id_seq;
       bds          postgres    false    5    223            �           0    0    location_location_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE bds.location_location_id_seq OWNED BY bds.location.location_id;
          bds          postgres    false    222            �           0    0 !   SEQUENCE location_location_id_seq    ACL     >   GRANT ALL ON SEQUENCE bds.location_location_id_seq TO "Kaca";
          bds          postgres    false    222            �            1259    19300    role    TABLE     a   CREATE TABLE bds.role (
    role_id integer NOT NULL,
    type character varying(45) NOT NULL
);
    DROP TABLE bds.role;
       bds         heap    postgres    false    5            �           0    0 
   TABLE role    ACL     R   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.role TO "Kaca";
          bds          postgres    false    219            �            1259    19299    role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE bds.role_role_id_seq;
       bds          postgres    false    219    5            �           0    0    role_role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE bds.role_role_id_seq OWNED BY bds.role.role_id;
          bds          postgres    false    218            �           0    0    SEQUENCE role_role_id_seq    ACL     6   GRANT ALL ON SEQUENCE bds.role_role_id_seq TO "Kaca";
          bds          postgres    false    218            �            1259    19381    sign_in    TABLE     �   CREATE TABLE bds.sign_in (
    login_id integer NOT NULL,
    login_email character varying(45) NOT NULL,
    salt character varying(45) NOT NULL,
    passwd_hash character varying(100) NOT NULL,
    user_user_id bigint NOT NULL
);
    DROP TABLE bds.sign_in;
       bds         heap    postgres    false    5            �           0    0    TABLE sign_in    ACL     U   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.sign_in TO "Kaca";
          bds          postgres    false    233            �            1259    19380    sign_in_login_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.sign_in_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE bds.sign_in_login_id_seq;
       bds          postgres    false    233    5            �           0    0    sign_in_login_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bds.sign_in_login_id_seq OWNED BY bds.sign_in.login_id;
          bds          postgres    false    232            �           0    0    SEQUENCE sign_in_login_id_seq    ACL     :   GRANT ALL ON SEQUENCE bds.sign_in_login_id_seq TO "Kaca";
          bds          postgres    false    232            �            1259    19328    title    TABLE     �   CREATE TABLE bds.title (
    title_id integer NOT NULL,
    title_name character varying(45) NOT NULL,
    publication_year integer NOT NULL,
    availability_present integer NOT NULL,
    availability_absent integer NOT NULL
);
    DROP TABLE bds.title;
       bds         heap    postgres    false    5            �           0    0    TABLE title    ACL     S   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.title TO "Kaca";
          bds          postgres    false    227            �            1259    19327    title_title_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.title_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE bds.title_title_id_seq;
       bds          postgres    false    5    227            �           0    0    title_title_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE bds.title_title_id_seq OWNED BY bds.title.title_id;
          bds          postgres    false    226            �           0    0    SEQUENCE title_title_id_seq    ACL     8   GRANT ALL ON SEQUENCE bds.title_title_id_seq TO "Kaca";
          bds          postgres    false    226            �            1259    19284    user    TABLE     4  CREATE TABLE bds."user" (
    user_id integer NOT NULL,
    given_name character varying(45) NOT NULL,
    family_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone_number character varying(45) NOT NULL,
    born date NOT NULL,
    customer_detail_customer_id bigint
);
    DROP TABLE bds."user";
       bds         heap    postgres    false    5            �           0    0    TABLE "user"    ACL     T   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds."user" TO "Kaca";
          bds          postgres    false    217            �            1259    19431    user_has_role    TABLE     g   CREATE TABLE bds.user_has_role (
    user_user_id bigint NOT NULL,
    role_role_id bigint NOT NULL
);
    DROP TABLE bds.user_has_role;
       bds         heap    postgres    false    5            �           0    0    TABLE user_has_role    ACL     [   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.user_has_role TO "Kaca";
          bds          postgres    false    239            �            1259    19283    user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE bds.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE bds.user_user_id_seq;
       bds          postgres    false    5    217            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE bds.user_user_id_seq OWNED BY bds."user".user_id;
          bds          postgres    false    216            �           0    0    SEQUENCE user_user_id_seq    ACL     6   GRANT ALL ON SEQUENCE bds.user_user_id_seq TO "Kaca";
          bds          postgres    false    216            �           2604    19413    author author_id    DEFAULT     n   ALTER TABLE ONLY bds.author ALTER COLUMN author_id SET DEFAULT nextval('bds.author_author_id_seq'::regclass);
 <   ALTER TABLE bds.author ALTER COLUMN author_id DROP DEFAULT;
       bds          postgres    false    236    237    237            �           2604    19367    borrow borrow_id    DEFAULT     n   ALTER TABLE ONLY bds.borrow ALTER COLUMN borrow_id SET DEFAULT nextval('bds.borrow_borrow_id_seq'::regclass);
 <   ALTER TABLE bds.borrow ALTER COLUMN borrow_id DROP DEFAULT;
       bds          postgres    false    231    230    231            �           2604    19396     borrow_archive borrow_archive_id    DEFAULT     �   ALTER TABLE ONLY bds.borrow_archive ALTER COLUMN borrow_archive_id SET DEFAULT nextval('bds.borrow_archive_borrow_archive_id_seq'::regclass);
 L   ALTER TABLE bds.borrow_archive ALTER COLUMN borrow_archive_id DROP DEFAULT;
       bds          postgres    false    234    235    235            �           2604    19310    borrow_type borrow_type_id    DEFAULT     �   ALTER TABLE ONLY bds.borrow_type ALTER COLUMN borrow_type_id SET DEFAULT nextval('bds.borrow_type_borrow_type_id_seq'::regclass);
 F   ALTER TABLE bds.borrow_type ALTER COLUMN borrow_type_id DROP DEFAULT;
       bds          postgres    false    220    221    221            �           2604    19338    copy copy_id    DEFAULT     f   ALTER TABLE ONLY bds.copy ALTER COLUMN copy_id SET DEFAULT nextval('bds.copy_copy_id_seq'::regclass);
 8   ALTER TABLE bds.copy ALTER COLUMN copy_id DROP DEFAULT;
       bds          postgres    false    228    229    229            �           2604    19280    customer_detail customer_id    DEFAULT     �   ALTER TABLE ONLY bds.customer_detail ALTER COLUMN customer_id SET DEFAULT nextval('bds.customer_detail_customer_id_seq'::regclass);
 G   ALTER TABLE bds.customer_detail ALTER COLUMN customer_id DROP DEFAULT;
       bds          postgres    false    215    214    215            �           2604    19450    genre title_to_genre_id    DEFAULT     |   ALTER TABLE ONLY bds.genre ALTER COLUMN title_to_genre_id SET DEFAULT nextval('bds.genre_title_to_genre_id_seq'::regclass);
 C   ALTER TABLE bds.genre ALTER COLUMN title_to_genre_id DROP DEFAULT;
       bds          postgres    false    240    241    241            �           2604    19324    lang_name lang_id    DEFAULT     p   ALTER TABLE ONLY bds.lang_name ALTER COLUMN lang_id SET DEFAULT nextval('bds.lang_name_lang_id_seq'::regclass);
 =   ALTER TABLE bds.lang_name ALTER COLUMN lang_id DROP DEFAULT;
       bds          postgres    false    224    225    225            �           2604    19317    location location_id    DEFAULT     v   ALTER TABLE ONLY bds.location ALTER COLUMN location_id SET DEFAULT nextval('bds.location_location_id_seq'::regclass);
 @   ALTER TABLE bds.location ALTER COLUMN location_id DROP DEFAULT;
       bds          postgres    false    223    222    223            �           2604    19303    role role_id    DEFAULT     f   ALTER TABLE ONLY bds.role ALTER COLUMN role_id SET DEFAULT nextval('bds.role_role_id_seq'::regclass);
 8   ALTER TABLE bds.role ALTER COLUMN role_id DROP DEFAULT;
       bds          postgres    false    219    218    219            �           2604    19384    sign_in login_id    DEFAULT     n   ALTER TABLE ONLY bds.sign_in ALTER COLUMN login_id SET DEFAULT nextval('bds.sign_in_login_id_seq'::regclass);
 <   ALTER TABLE bds.sign_in ALTER COLUMN login_id DROP DEFAULT;
       bds          postgres    false    233    232    233            �           2604    19331    title title_id    DEFAULT     j   ALTER TABLE ONLY bds.title ALTER COLUMN title_id SET DEFAULT nextval('bds.title_title_id_seq'::regclass);
 :   ALTER TABLE bds.title ALTER COLUMN title_id DROP DEFAULT;
       bds          postgres    false    226    227    227            �           2604    19287    user user_id    DEFAULT     h   ALTER TABLE ONLY bds."user" ALTER COLUMN user_id SET DEFAULT nextval('bds.user_user_id_seq'::regclass);
 :   ALTER TABLE bds."user" ALTER COLUMN user_id DROP DEFAULT;
       bds          postgres    false    216    217    217            �          0    19410    author 
   TABLE DATA           ^   COPY bds.author (author_id, given_name, family_name, born, died, popularity_rank) FROM stdin;
    bds          postgres    false    237   ϭ       �          0    19416    author_has_title 
   TABLE DATA           I   COPY bds.author_has_title (author_author_id, title_title_id) FROM stdin;
    bds          postgres    false    238   �       �          0    19364    borrow 
   TABLE DATA           h   COPY bds.borrow (borrow_id, release_date, due_date, extensions, user_user_id, copy_copy_id) FROM stdin;
    bds          postgres    false    231   #�       �          0    19393    borrow_archive 
   TABLE DATA           ~   COPY bds.borrow_archive (borrow_archive_id, release_date, date_of_return, extensions, user_user_id, copy_copy_id) FROM stdin;
    bds          postgres    false    235   ��       �          0    19307    borrow_type 
   TABLE DATA           8   COPY bds.borrow_type (borrow_type_id, type) FROM stdin;
    bds          postgres    false    221   �       �          0    19335    copy 
   TABLE DATA           �   COPY bds.copy (copy_id, type_of_borrow, release_year, borrowed, lang_id, no_of_pages, height, depth, width, stock_location_mark, borrow_type_borrow_type_id, location_location_id, title_title_id, lang_name_lang_name_id) FROM stdin;
    bds          postgres    false    229   e�                 0    19277    customer_detail 
   TABLE DATA           Y   COPY bds.customer_detail (customer_id, membership_expiration, shelve_number) FROM stdin;
    bds          postgres    false    215    �       �          0    19447    genre 
   TABLE DATA           6   COPY bds.genre (title_to_genre_id, genre) FROM stdin;
    bds          postgres    false    241   S�       �          0    19453    genre_has_title 
   TABLE DATA           O   COPY bds.genre_has_title (genre_title_to_genre_id, title_title_id) FROM stdin;
    bds          postgres    false    242   �       �          0    19321 	   lang_name 
   TABLE DATA           /   COPY bds.lang_name (lang_id, name) FROM stdin;
    bds          postgres    false    225   �       �          0    19314    location 
   TABLE DATA           =   COPY bds.location (location_id, floor, location) FROM stdin;
    bds          postgres    false    223   `�       �          0    19300    role 
   TABLE DATA           *   COPY bds.role (role_id, type) FROM stdin;
    bds          postgres    false    219   ��       �          0    19381    sign_in 
   TABLE DATA           V   COPY bds.sign_in (login_id, login_email, salt, passwd_hash, user_user_id) FROM stdin;
    bds          postgres    false    233   ��       �          0    19328    title 
   TABLE DATA           o   COPY bds.title (title_id, title_name, publication_year, availability_present, availability_absent) FROM stdin;
    bds          postgres    false    227   �       �          0    19284    user 
   TABLE DATA           w   COPY bds."user" (user_id, given_name, family_name, email, phone_number, born, customer_detail_customer_id) FROM stdin;
    bds          postgres    false    217   J�       �          0    19431    user_has_role 
   TABLE DATA           @   COPY bds.user_has_role (user_user_id, role_role_id) FROM stdin;
    bds          postgres    false    239   �       �           0    0    author_author_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('bds.author_author_id_seq', 121, true);
          bds          postgres    false    236            �           0    0 $   borrow_archive_borrow_archive_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('bds.borrow_archive_borrow_archive_id_seq', 5, true);
          bds          postgres    false    234            �           0    0    borrow_borrow_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.borrow_borrow_id_seq', 6, true);
          bds          postgres    false    230            �           0    0    borrow_type_borrow_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('bds.borrow_type_borrow_type_id_seq', 5, true);
          bds          postgres    false    220            �           0    0    copy_copy_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bds.copy_copy_id_seq', 5, true);
          bds          postgres    false    228            �           0    0    customer_detail_customer_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('bds.customer_detail_customer_id_seq', 5, true);
          bds          postgres    false    214            �           0    0    genre_title_to_genre_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('bds.genre_title_to_genre_id_seq', 5, true);
          bds          postgres    false    240            �           0    0    lang_name_lang_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('bds.lang_name_lang_id_seq', 5, true);
          bds          postgres    false    224            �           0    0    location_location_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('bds.location_location_id_seq', 5, true);
          bds          postgres    false    222            �           0    0    role_role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bds.role_role_id_seq', 5, true);
          bds          postgres    false    218            �           0    0    sign_in_login_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.sign_in_login_id_seq', 6, true);
          bds          postgres    false    232            �           0    0    title_title_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.title_title_id_seq', 114, true);
          bds          postgres    false    226            �           0    0    user_user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('bds.user_user_id_seq', 50, true);
          bds          postgres    false    216            �           2606    19415    author author_author_id_key 
   CONSTRAINT     X   ALTER TABLE ONLY bds.author
    ADD CONSTRAINT author_author_id_key UNIQUE (author_id);
 B   ALTER TABLE ONLY bds.author DROP CONSTRAINT author_author_id_key;
       bds            postgres    false    237            �           2606    19420 &   author_has_title author_has_title_pkey 
   CONSTRAINT        ALTER TABLE ONLY bds.author_has_title
    ADD CONSTRAINT author_has_title_pkey PRIMARY KEY (author_author_id, title_title_id);
 M   ALTER TABLE ONLY bds.author_has_title DROP CONSTRAINT author_has_title_pkey;
       bds            postgres    false    238    238            �           2606    19398 "   borrow_archive borrow_archive_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY bds.borrow_archive
    ADD CONSTRAINT borrow_archive_pkey PRIMARY KEY (borrow_archive_id);
 I   ALTER TABLE ONLY bds.borrow_archive DROP CONSTRAINT borrow_archive_pkey;
       bds            postgres    false    235            �           2606    19369    borrow borrow_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY bds.borrow
    ADD CONSTRAINT borrow_pkey PRIMARY KEY (borrow_id, user_user_id);
 9   ALTER TABLE ONLY bds.borrow DROP CONSTRAINT borrow_pkey;
       bds            postgres    false    231    231            �           2606    19312    borrow_type borrow_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY bds.borrow_type
    ADD CONSTRAINT borrow_type_pkey PRIMARY KEY (borrow_type_id);
 C   ALTER TABLE ONLY bds.borrow_type DROP CONSTRAINT borrow_type_pkey;
       bds            postgres    false    221            �           2606    19342    copy copy_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_pkey PRIMARY KEY (copy_id);
 5   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_pkey;
       bds            postgres    false    229            �           2606    19282 $   customer_detail customer_detail_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY bds.customer_detail
    ADD CONSTRAINT customer_detail_pkey PRIMARY KEY (customer_id);
 K   ALTER TABLE ONLY bds.customer_detail DROP CONSTRAINT customer_detail_pkey;
       bds            postgres    false    215            �           2606    19457 $   genre_has_title genre_has_title_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY bds.genre_has_title
    ADD CONSTRAINT genre_has_title_pkey PRIMARY KEY (genre_title_to_genre_id, title_title_id);
 K   ALTER TABLE ONLY bds.genre_has_title DROP CONSTRAINT genre_has_title_pkey;
       bds            postgres    false    242    242            �           2606    19452    genre genre_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY bds.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (title_to_genre_id);
 7   ALTER TABLE ONLY bds.genre DROP CONSTRAINT genre_pkey;
       bds            postgres    false    241            �           2606    19326    lang_name lang_name_lang_id_key 
   CONSTRAINT     Z   ALTER TABLE ONLY bds.lang_name
    ADD CONSTRAINT lang_name_lang_id_key UNIQUE (lang_id);
 F   ALTER TABLE ONLY bds.lang_name DROP CONSTRAINT lang_name_lang_id_key;
       bds            postgres    false    225            �           2606    19319    location location_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY bds.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);
 =   ALTER TABLE ONLY bds.location DROP CONSTRAINT location_pkey;
       bds            postgres    false    223            �           2606    19305    role role_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY bds.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 5   ALTER TABLE ONLY bds.role DROP CONSTRAINT role_pkey;
       bds            postgres    false    219            �           2606    19386    sign_in sign_in_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY bds.sign_in
    ADD CONSTRAINT sign_in_pkey PRIMARY KEY (login_id);
 ;   ALTER TABLE ONLY bds.sign_in DROP CONSTRAINT sign_in_pkey;
       bds            postgres    false    233            �           2606    19333    title title_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bds.title
    ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);
 7   ALTER TABLE ONLY bds.title DROP CONSTRAINT title_pkey;
       bds            postgres    false    227            �           2606    19291    user user_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY bds."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 <   ALTER TABLE ONLY bds."user" DROP CONSTRAINT user_email_key;
       bds            postgres    false    217            �           2606    19435     user_has_role user_has_role_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY bds.user_has_role
    ADD CONSTRAINT user_has_role_pkey PRIMARY KEY (user_user_id, role_role_id);
 G   ALTER TABLE ONLY bds.user_has_role DROP CONSTRAINT user_has_role_pkey;
       bds            postgres    false    239    239            �           2606    19293    user user_phone_number_key 
   CONSTRAINT     \   ALTER TABLE ONLY bds."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);
 C   ALTER TABLE ONLY bds."user" DROP CONSTRAINT user_phone_number_key;
       bds            postgres    false    217            �           2606    19289    user user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY bds."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 7   ALTER TABLE ONLY bds."user" DROP CONSTRAINT user_pkey;
       bds            postgres    false    217            �           2606    19421 7   author_has_title author_has_title_author_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.author_has_title
    ADD CONSTRAINT author_has_title_author_author_id_fkey FOREIGN KEY (author_author_id) REFERENCES bds.author(author_id);
 ^   ALTER TABLE ONLY bds.author_has_title DROP CONSTRAINT author_has_title_author_author_id_fkey;
       bds          postgres    false    238    3287    237            �           2606    19426 5   author_has_title author_has_title_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.author_has_title
    ADD CONSTRAINT author_has_title_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id);
 \   ALTER TABLE ONLY bds.author_has_title DROP CONSTRAINT author_has_title_title_title_id_fkey;
       bds          postgres    false    238    227    3277            �           2606    19404 /   borrow_archive borrow_archive_copy_copy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow_archive
    ADD CONSTRAINT borrow_archive_copy_copy_id_fkey FOREIGN KEY (copy_copy_id) REFERENCES bds.copy(copy_id);
 V   ALTER TABLE ONLY bds.borrow_archive DROP CONSTRAINT borrow_archive_copy_copy_id_fkey;
       bds          postgres    false    229    3279    235            �           2606    19399 /   borrow_archive borrow_archive_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow_archive
    ADD CONSTRAINT borrow_archive_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 V   ALTER TABLE ONLY bds.borrow_archive DROP CONSTRAINT borrow_archive_user_user_id_fkey;
       bds          postgres    false    3267    217    235            �           2606    19375    borrow borrow_copy_copy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow
    ADD CONSTRAINT borrow_copy_copy_id_fkey FOREIGN KEY (copy_copy_id) REFERENCES bds.copy(copy_id);
 F   ALTER TABLE ONLY bds.borrow DROP CONSTRAINT borrow_copy_copy_id_fkey;
       bds          postgres    false    3279    231    229            �           2606    19370    borrow borrow_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow
    ADD CONSTRAINT borrow_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 F   ALTER TABLE ONLY bds.borrow DROP CONSTRAINT borrow_user_user_id_fkey;
       bds          postgres    false    217    231    3267            �           2606    19343 )   copy copy_borrow_type_borrow_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_borrow_type_borrow_type_id_fkey FOREIGN KEY (borrow_type_borrow_type_id) REFERENCES bds.borrow_type(borrow_type_id);
 P   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_borrow_type_borrow_type_id_fkey;
       bds          postgres    false    229    221    3271            �           2606    19358 %   copy copy_lang_name_lang_name_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_lang_name_lang_name_id_fkey FOREIGN KEY (lang_name_lang_name_id) REFERENCES bds.lang_name(lang_id);
 L   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_lang_name_lang_name_id_fkey;
       bds          postgres    false    225    229    3275            �           2606    19348 #   copy copy_location_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_location_location_id_fkey FOREIGN KEY (location_location_id) REFERENCES bds.location(location_id);
 J   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_location_location_id_fkey;
       bds          postgres    false    3273    223    229            �           2606    19353    copy copy_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id);
 D   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_title_title_id_fkey;
       bds          postgres    false    227    3277    229            �           2606    19458 <   genre_has_title genre_has_title_genre_title_to_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.genre_has_title
    ADD CONSTRAINT genre_has_title_genre_title_to_genre_id_fkey FOREIGN KEY (genre_title_to_genre_id) REFERENCES bds.genre(title_to_genre_id);
 c   ALTER TABLE ONLY bds.genre_has_title DROP CONSTRAINT genre_has_title_genre_title_to_genre_id_fkey;
       bds          postgres    false    241    242    3293            �           2606    19463 3   genre_has_title genre_has_title_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.genre_has_title
    ADD CONSTRAINT genre_has_title_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id);
 Z   ALTER TABLE ONLY bds.genre_has_title DROP CONSTRAINT genre_has_title_title_title_id_fkey;
       bds          postgres    false    227    242    3277            �           2606    19387 !   sign_in sign_in_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.sign_in
    ADD CONSTRAINT sign_in_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 H   ALTER TABLE ONLY bds.sign_in DROP CONSTRAINT sign_in_user_user_id_fkey;
       bds          postgres    false    3267    233    217            �           2606    19294 *   user user_customer_detail_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds."user"
    ADD CONSTRAINT user_customer_detail_customer_id_fkey FOREIGN KEY (customer_detail_customer_id) REFERENCES bds.customer_detail(customer_id);
 S   ALTER TABLE ONLY bds."user" DROP CONSTRAINT user_customer_detail_customer_id_fkey;
       bds          postgres    false    215    217    3261            �           2606    19441 -   user_has_role user_has_role_role_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.user_has_role
    ADD CONSTRAINT user_has_role_role_role_id_fkey FOREIGN KEY (role_role_id) REFERENCES bds.role(role_id);
 T   ALTER TABLE ONLY bds.user_has_role DROP CONSTRAINT user_has_role_role_role_id_fkey;
       bds          postgres    false    219    239    3269            �           2606    19436 -   user_has_role user_has_role_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.user_has_role
    ADD CONSTRAINT user_has_role_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 T   ALTER TABLE ONLY bds.user_has_role DROP CONSTRAINT user_has_role_user_user_id_fkey;
       bds          postgres    false    217    239    3267            <           826    19275     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     \   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bds GRANT ALL ON SEQUENCES  TO "Kaca";
          bds          postgres    false    5            ;           826    19274    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bds GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLES  TO "Kaca";
          bds          postgres    false    5            �     x�e�Ovܸ�רS��G� ,ݲ$�,%�4�_�H�Ol����7�1�J|�Yf�/�ʇ�O6�h�a��U}U5{3<�4�s��GV���O[��8���s���<N�֪��S�.���{���bE�S\��{��c��ý�a:��:�O;l�p��	��ק�w|dHv�����e�Zvg?�]���`C���߇|i���֬%Ů�&�������|ϋ�)��"��߹��g��g��&�w#���8��]b�m~�`�ꊭb�#��m��j������m<�o���}�[�a��k�9���Pn���4�e���zNP���p���6�)�rCC�/�%��.���W5> ��n��
I������v�'	[�m���F���|_��-Պ]�~�u�͗8@[�s/$kE��xiF�ZS��)����,�Նx��qs������'�����xG��b�毃��8R��+�ڱ?�g7:Ή7���u�·�+���ż���N�A �%��3��2��/�qI��i��]�cEzt.ش<�D����8��o����!B�r�"�Aa�q׹#��{�Cd���7;�7�TKm\��䚊���<X�8^^M�~��q�`֠`ve�GR�����!��Z�P#�'d��[v��|��Wb��F���Q�vN�v�FRӲ;�Cm��ϳ���[�R�r�~F�{v~]Pk5���Mnb�~�6���~b�hj��}���8�k�����[���!*�k�u���wPEM���.u1�� &8�攑()�\W0=�^�6sbo�n(�	AB�]�7�cNH�!��^����%;��Y�$D��{�-�vB��'���}l�Nh(ص�6��o�j�w8aH�$�
��P`�����x�]l�&���ǎ?�$'ٰ�ٯ=���>-xɆ�ȒLq��M�=B��9�/�M�d���p�X �-I��U��TV�T$��u��&iP9�ڱ�4�C�G��1�6�hڊ ���>�L[S�ao�8l����S�Cnm+���$mC���|Hx>[���[A�d���Q�W	N_0i�=�E6t��O���V#~��؏E|B�*���ݰ��0$����瘝��4ƴ���)����RU�P���|h�U4/<���x�aa�jR��&�ӻ���X.�
���2/x��R"kaﲁ�Ԕ ��l�< Ȃ���^��l(�)��0�r��cYE�\�8J}�4)����VGCx�A���ӹC9�4�tE�f?�[��]�M���41��i�bi���t��vxSg�冴x1)�7.�/ȴ -O}�>��$wEx;�~(H閴:���M�	:�|�=���>�њ�c�ı��Tڐ��E�F�Ňr�0�y�s���c�s�&×�X!aR��p2{��a7�
�_j
�g��`5k{��'@F��(ڀl�W��
�$����?��iɠ=��c��4�s�Qd�bӹ]�:����Lk�0��a��iW�m�L[e���x7����������?�� o�      �   !   x�3�4�2�4�2�4�2�4�2�4����� '�      �   t   x�M��!Dѳ]E���֒���,�%O�k �ܛ�׼'7�q����� CO6�fL�L�������Y����|ư��524�	�&39ɚ��N����;^�ɚ1�ߥ��7("      �   d   x�M��1D�3T�X�`;	[K��#�Ksx_�� #������F�}ch��2���*>����g6l��/ƾ��%�ٴ�K�DP{7)�ٲ����F�!f      �   :   x�3����+��2�,JMK-J�KNU��˩�2�LM,�2�LI��2�,OM������ ��Y      �   �   x�%�1�0���0U��#Q�(0t 1s�#���;���XQX)�4X������z����jB�Ѐ�ǩ/K��T��9��Ii���z��LX3�;��	Y��lo��F��CV�@k���z>֡����|'���!         C   x�%���0Bѳ���Uw��s�Q��#&+��Mx��I^��:�4)ڨ��b����\���w�Z��      �   �   x�3�L��K�;қwx�BvQfU�����������BpA~Vj��
�%��T*$�e&g^�eę�_\��rx�љ�ه*��d�df'�ۘ����+����]T�0�˄���4%3����\1z\\\ ��R�      �   !   x�3�4�2�4�2�4�2�4�2�4����� '�      �   ;   x�3�<ғztaIf^"��c^zN�^0Ϙ�����#� �	g@~T�)gP)����� c�o      �   =   x�3�4�46V�q�2�4�44Qp�2�4�0Tp�2�4�4U�	�2�4�Tp����� �r      �   ;   x�3�L�-�ɯLM�2�L.-.��M-�2�,.-H-���p�&�%�Y��ή�\1z\\\ d��      �   �   x���AR� @�5�#�Z���fHL�Q;�-fܐ��A����.{.�-�#�'{���z�4�!�<T��6;e(��,�K���U�;��n�U�BT_��fC/��:��覤���XM���LQ.�Sv�=BA�'��S�����+jƿ�)/i]�8�����4�ܧ6�ٳ"��
���ҁߎ���߾1��N��k����j~uY��x���y�1����Y      �   U  x�MV�r7>�O��9��!��an�l)rD�KҫJj/$��ș���s^"y�I�d�FC,�@�|���=ۣ�[o��|<#1z7K�L�V��޴;��r�+�Rm��*��	��'��V�2:��c�H�O?�����8]�'�7^�u�+�^�#��q1���ǣ;��Km��:k�0�;��K&�d�Ug[M��R�ŵw�(]�,|P}�:���oLR�s��ѿ�Qv_�Ge�ir�0n\�(�)�^L�R�y�����0�S0v����_�@H�9����:ȅ��Y�Í*���g�M9�3�6�s�^�9%KKۡV.vt4���"}0����?�a�o�c��:l�;�_��r�$O�ҫ䢿�G�m3�p\�{��u+?Ry�k�@<Z��7�%nP"2�����ޝQE7 <&x��BP}x�!8N��5�ǛQ������O����y.~֭�GK�tx?�MF�����⋅�����A��=����M��h8a]Z����E�2��|�'վ��vnO^�D��h��CjlJ8��9-Lt-�ȟ��g6{�P,3��i�A,Mb'���<�4f�'5����_�
��(w�]G�g#@L�n�4�JG��!�+��`�
���ڢ�`�,čC�_ڏ,<��hY�ŝjzyuTXY�߹M�9�1]����!�LK�%�b��_@6���zk�O��c5K6ZZ%O�z��D7ݙ��^.䗀b�O�%嫲�*׬�k�³�/�rG��pe-�����ʦK�lTT)؜��i�1<�;�ܽ���EA
 ����х(��޹v�rʤ\u������c�{��o�Ӊ�W�/j ���M��lo��QP=���k�3�A�d^��D���;&ei墋G�^02S�p�
d����	I>v��/����5��4�� �a{T��I}�}=�<f#��vQ0A���*��emV(I�0�^��(N�N�;�	e|Q�RXtawO񒑽s�[�י���s�ѐƆ�[��5rx��Rg����ϙ�\������T��<�&�V}s�Q6�� �{�<�>�	�Ϛ{��¬�)�9?���~ĈU�㊦�*��P?��.��
�q���oD�33N�* OY�1o�AV�㣣�wV.�ݢ�<��Mc�ld"$�':�����W�Y �vu��5;n�)�p�^�(B2u'�N��8ي!�%��� �������!NaXF���(��,���b���.��"��!TG&��;T���'2���uR���סA�!S��vE�\��a����ꉸ6����K�r���D�L��a�ѭ�LŴi�k�O��z�w��WGgҲW1 u%n�s�31à%5m�CPq��R��x�c���J�\<��I�s$��}偙�r�[�hJ�Ӭ7)�	�;/�v�����fP.%�5g�]��;"�<������ERc�j����ʄ�΀Ah���ƪg����I�ݜ�����{N�^�c���<�^zs8��"� мsn�֦0�Lq	����|�Ls�}"n/u85��a)���OO���C�B�Bnͫ���I9l]$С�E;\ �%_��I�*�}�+��׻w���^      �   �  x�mV]s�8|��B��x�u�s)�r�Խ�y�D��u����/�Iնg��Ӄ_z�ȋ+��_��gg�~rԽ�{y�7�ΥB&U��T�B&�����ߊ�d�v1l !�F�Y��\�ߴ;�$�j͝^�l�,k�L�y&TR��:�;qiШ3�~�6����n�բHJ�w$.葼�x����@9?�N5ˤ��~gv��v������\�H�"�W';q=>��� �k����h�4���@R-����nb��s�K���$�\��sՈs�����'m|?,���*�U�d&.��y�M�0�9�(]�Ui.����M�ŭ��_�����3�giV�r� P}0`���SX�
�$�5��
�� ���!h�j�$뎋*J|1Y��{��Z\���?.qU����ߚq ��h�0��<ݑ��],U�n��E���h0�k��1�鎌�:���$���Sۃ$;-m�khh����S-^�
���^[�{����nҼd����j��Ƹ�[=��u;Є-�آ*^{���|
k`\0���r:�0�ON3İ�t��S,::�3����܁N^�{�1b�1�����կ��nA���yX��V�Oo����?5L����XR�D|�	��9n4�0:�� �ק�eOeS���ⵚ���YUy%�����Z�pDU2c2����0�/�S1n�VU�!�a5�Ϛ#K�y�;'�FF�Y���d[x��ouK\����
FW$p�[�
�k+.{O��a�����v�v6xLn��u`Ǹ�1���Lŝ`��7��#v���D�]���VYh]�FI�-�ą'���ߣ�����58\�:jE%0�u,��T|���`���b�J�4~jf���Ӓ��2����c��r���͸x �l�~>�զv�;���[�v�/�V��(�a�x��t�6�N�%,�q/`#�Ѡp�|ogu��
YD���ERd�y�.^����޳�-�
^O���s�T��KW�<l�ֺTJ���I��m�x��z��s�����#Mp^����c���t,�d_������U��w�@s��6���ʊR�1��w�ю�OÒl�×�l�p蘹J\���a�e�d
[�zQgx�ٛ�� ���1n�C�U�s`��Q?�^��VC�S� ��cr.s�tAf�c�����s�v�r�����e��Y��	a�	c��0�WݳL�y�$��#�S|      �   !   x�3�4�2�4�2�4�2�4�2�4����� '�     