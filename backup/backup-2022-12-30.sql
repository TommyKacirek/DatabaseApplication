PGDMP                           z            project    15.0    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    19270    project    DATABASE     z   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Czech_Czechia.1250';
    DROP DATABASE project;
                postgres    false            �           0    0    DATABASE project    ACL     -   GRANT CONNECT ON DATABASE project TO "Kaca";
                   postgres    false    3500                        2615    19273    bds    SCHEMA        CREATE SCHEMA bds;
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
       bds          postgres    false    231    5            �           0    0    borrow_borrow_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bds.borrow_borrow_id_seq OWNED BY bds.borrow.borrow_id;
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
       bds          postgres    false    5    229            �           0    0    copy_copy_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE bds.copy_copy_id_seq OWNED BY bds.copy.copy_id;
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
       bds          postgres    false    5    215            �           0    0    customer_detail_customer_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE bds.customer_detail_customer_id_seq OWNED BY bds.customer_detail.customer_id;
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
          bds          postgres    false    240            �            1259    19481    injection_attack    TABLE     �   CREATE TABLE bds.injection_attack (
    id bigint NOT NULL,
    name character varying(45) NOT NULL,
    username character varying(45) NOT NULL
);
 !   DROP TABLE bds.injection_attack;
       bds         heap    postgres    false    5            �           0    0    TABLE injection_attack    ACL     ^   GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE bds.injection_attack TO "Kaca";
          bds          postgres    false    244            �            1259    19480    injection_attack_id_seq    SEQUENCE     }   CREATE SEQUENCE bds.injection_attack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE bds.injection_attack_id_seq;
       bds          postgres    false    244    5            �           0    0    injection_attack_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE bds.injection_attack_id_seq OWNED BY bds.injection_attack.id;
          bds          postgres    false    243            �           0    0     SEQUENCE injection_attack_id_seq    ACL     =   GRANT ALL ON SEQUENCE bds.injection_attack_id_seq TO "Kaca";
          bds          postgres    false    243            �            1259    19321 	   lang_name    TABLE     ]   CREATE TABLE bds.lang_name (
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
       bds          postgres    false    225    5            �           0    0    lang_name_lang_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE bds.lang_name_lang_id_seq OWNED BY bds.lang_name.lang_id;
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
       bds          postgres    false    223    5            �           0    0    location_location_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE bds.location_location_id_seq OWNED BY bds.location.location_id;
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
       bds          postgres    false    5    233            �           0    0    sign_in_login_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bds.sign_in_login_id_seq OWNED BY bds.sign_in.login_id;
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
       bds          postgres    false    217    5            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE bds.user_user_id_seq OWNED BY bds."user".user_id;
          bds          postgres    false    216            �           0    0    SEQUENCE user_user_id_seq    ACL     6   GRANT ALL ON SEQUENCE bds.user_user_id_seq TO "Kaca";
          bds          postgres    false    216            �           2604    19413    author author_id    DEFAULT     n   ALTER TABLE ONLY bds.author ALTER COLUMN author_id SET DEFAULT nextval('bds.author_author_id_seq'::regclass);
 <   ALTER TABLE bds.author ALTER COLUMN author_id DROP DEFAULT;
       bds          postgres    false    236    237    237            �           2604    19367    borrow borrow_id    DEFAULT     n   ALTER TABLE ONLY bds.borrow ALTER COLUMN borrow_id SET DEFAULT nextval('bds.borrow_borrow_id_seq'::regclass);
 <   ALTER TABLE bds.borrow ALTER COLUMN borrow_id DROP DEFAULT;
       bds          postgres    false    230    231    231            �           2604    19396     borrow_archive borrow_archive_id    DEFAULT     �   ALTER TABLE ONLY bds.borrow_archive ALTER COLUMN borrow_archive_id SET DEFAULT nextval('bds.borrow_archive_borrow_archive_id_seq'::regclass);
 L   ALTER TABLE bds.borrow_archive ALTER COLUMN borrow_archive_id DROP DEFAULT;
       bds          postgres    false    235    234    235            �           2604    19310    borrow_type borrow_type_id    DEFAULT     �   ALTER TABLE ONLY bds.borrow_type ALTER COLUMN borrow_type_id SET DEFAULT nextval('bds.borrow_type_borrow_type_id_seq'::regclass);
 F   ALTER TABLE bds.borrow_type ALTER COLUMN borrow_type_id DROP DEFAULT;
       bds          postgres    false    221    220    221            �           2604    19338    copy copy_id    DEFAULT     f   ALTER TABLE ONLY bds.copy ALTER COLUMN copy_id SET DEFAULT nextval('bds.copy_copy_id_seq'::regclass);
 8   ALTER TABLE bds.copy ALTER COLUMN copy_id DROP DEFAULT;
       bds          postgres    false    228    229    229            �           2604    19280    customer_detail customer_id    DEFAULT     �   ALTER TABLE ONLY bds.customer_detail ALTER COLUMN customer_id SET DEFAULT nextval('bds.customer_detail_customer_id_seq'::regclass);
 G   ALTER TABLE bds.customer_detail ALTER COLUMN customer_id DROP DEFAULT;
       bds          postgres    false    215    214    215            �           2604    19450    genre title_to_genre_id    DEFAULT     |   ALTER TABLE ONLY bds.genre ALTER COLUMN title_to_genre_id SET DEFAULT nextval('bds.genre_title_to_genre_id_seq'::regclass);
 C   ALTER TABLE bds.genre ALTER COLUMN title_to_genre_id DROP DEFAULT;
       bds          postgres    false    241    240    241            �           2604    19484    injection_attack id    DEFAULT     t   ALTER TABLE ONLY bds.injection_attack ALTER COLUMN id SET DEFAULT nextval('bds.injection_attack_id_seq'::regclass);
 ?   ALTER TABLE bds.injection_attack ALTER COLUMN id DROP DEFAULT;
       bds          postgres    false    243    244    244            �           2604    19324    lang_name lang_id    DEFAULT     p   ALTER TABLE ONLY bds.lang_name ALTER COLUMN lang_id SET DEFAULT nextval('bds.lang_name_lang_id_seq'::regclass);
 =   ALTER TABLE bds.lang_name ALTER COLUMN lang_id DROP DEFAULT;
       bds          postgres    false    224    225    225            �           2604    19317    location location_id    DEFAULT     v   ALTER TABLE ONLY bds.location ALTER COLUMN location_id SET DEFAULT nextval('bds.location_location_id_seq'::regclass);
 @   ALTER TABLE bds.location ALTER COLUMN location_id DROP DEFAULT;
       bds          postgres    false    222    223    223            �           2604    19303    role role_id    DEFAULT     f   ALTER TABLE ONLY bds.role ALTER COLUMN role_id SET DEFAULT nextval('bds.role_role_id_seq'::regclass);
 8   ALTER TABLE bds.role ALTER COLUMN role_id DROP DEFAULT;
       bds          postgres    false    219    218    219            �           2604    19384    sign_in login_id    DEFAULT     n   ALTER TABLE ONLY bds.sign_in ALTER COLUMN login_id SET DEFAULT nextval('bds.sign_in_login_id_seq'::regclass);
 <   ALTER TABLE bds.sign_in ALTER COLUMN login_id DROP DEFAULT;
       bds          postgres    false    232    233    233            �           2604    19331    title title_id    DEFAULT     j   ALTER TABLE ONLY bds.title ALTER COLUMN title_id SET DEFAULT nextval('bds.title_title_id_seq'::regclass);
 :   ALTER TABLE bds.title ALTER COLUMN title_id DROP DEFAULT;
       bds          postgres    false    226    227    227            �           2604    19287    user user_id    DEFAULT     h   ALTER TABLE ONLY bds."user" ALTER COLUMN user_id SET DEFAULT nextval('bds.user_user_id_seq'::regclass);
 :   ALTER TABLE bds."user" ALTER COLUMN user_id DROP DEFAULT;
       bds          postgres    false    217    216    217            �          0    19410    author 
   TABLE DATA           ^   COPY bds.author (author_id, given_name, family_name, born, died, popularity_rank) FROM stdin;
    bds          postgres    false    237   ڸ       �          0    19416    author_has_title 
   TABLE DATA           I   COPY bds.author_has_title (author_author_id, title_title_id) FROM stdin;
    bds          postgres    false    238   x�       �          0    19364    borrow 
   TABLE DATA           h   COPY bds.borrow (borrow_id, release_date, due_date, extensions, user_user_id, copy_copy_id) FROM stdin;
    bds          postgres    false    231   ��       �          0    19393    borrow_archive 
   TABLE DATA           ~   COPY bds.borrow_archive (borrow_archive_id, release_date, date_of_return, extensions, user_user_id, copy_copy_id) FROM stdin;
    bds          postgres    false    235   5�       �          0    19307    borrow_type 
   TABLE DATA           8   COPY bds.borrow_type (borrow_type_id, type) FROM stdin;
    bds          postgres    false    221   ��       �          0    19335    copy 
   TABLE DATA           �   COPY bds.copy (copy_id, type_of_borrow, release_year, borrowed, lang_id, no_of_pages, height, depth, width, stock_location_mark, borrow_type_borrow_type_id, location_location_id, title_title_id, lang_name_lang_name_id) FROM stdin;
    bds          postgres    false    229   ��       �          0    19277    customer_detail 
   TABLE DATA           Y   COPY bds.customer_detail (customer_id, membership_expiration, shelve_number) FROM stdin;
    bds          postgres    false    215   ��       �          0    19447    genre 
   TABLE DATA           6   COPY bds.genre (title_to_genre_id, genre) FROM stdin;
    bds          postgres    false    241   ��       �          0    19453    genre_has_title 
   TABLE DATA           O   COPY bds.genre_has_title (genre_title_to_genre_id, title_title_id) FROM stdin;
    bds          postgres    false    242   r�       �          0    19481    injection_attack 
   TABLE DATA           ;   COPY bds.injection_attack (id, name, username) FROM stdin;
    bds          postgres    false    244   ��       �          0    19321 	   lang_name 
   TABLE DATA           /   COPY bds.lang_name (lang_id, name) FROM stdin;
    bds          postgres    false    225   Q�       �          0    19314    location 
   TABLE DATA           =   COPY bds.location (location_id, floor, location) FROM stdin;
    bds          postgres    false    223   ��       �          0    19300    role 
   TABLE DATA           *   COPY bds.role (role_id, type) FROM stdin;
    bds          postgres    false    219   ��       �          0    19381    sign_in 
   TABLE DATA           V   COPY bds.sign_in (login_id, login_email, salt, passwd_hash, user_user_id) FROM stdin;
    bds          postgres    false    233   4�       �          0    19328    title 
   TABLE DATA           o   COPY bds.title (title_id, title_name, publication_year, availability_present, availability_absent) FROM stdin;
    bds          postgres    false    227   !�       �          0    19284    user 
   TABLE DATA           w   COPY bds."user" (user_id, given_name, family_name, email, phone_number, born, customer_detail_customer_id) FROM stdin;
    bds          postgres    false    217   ��       �          0    19431    user_has_role 
   TABLE DATA           @   COPY bds.user_has_role (user_user_id, role_role_id) FROM stdin;
    bds          postgres    false    239   c�       �           0    0    author_author_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('bds.author_author_id_seq', 179, true);
          bds          postgres    false    236            �           0    0 $   borrow_archive_borrow_archive_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('bds.borrow_archive_borrow_archive_id_seq', 5, true);
          bds          postgres    false    234            �           0    0    borrow_borrow_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.borrow_borrow_id_seq', 6, true);
          bds          postgres    false    230            �           0    0    borrow_type_borrow_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('bds.borrow_type_borrow_type_id_seq', 5, true);
          bds          postgres    false    220            �           0    0    copy_copy_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bds.copy_copy_id_seq', 5, true);
          bds          postgres    false    228            �           0    0    customer_detail_customer_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('bds.customer_detail_customer_id_seq', 5, true);
          bds          postgres    false    214            �           0    0    genre_title_to_genre_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('bds.genre_title_to_genre_id_seq', 5, true);
          bds          postgres    false    240            �           0    0    injection_attack_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('bds.injection_attack_id_seq', 1, false);
          bds          postgres    false    243            �           0    0    lang_name_lang_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('bds.lang_name_lang_id_seq', 5, true);
          bds          postgres    false    224            �           0    0    location_location_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('bds.location_location_id_seq', 5, true);
          bds          postgres    false    222            �           0    0    role_role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bds.role_role_id_seq', 5, true);
          bds          postgres    false    218            �           0    0    sign_in_login_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.sign_in_login_id_seq', 6, true);
          bds          postgres    false    232            �           0    0    title_title_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('bds.title_title_id_seq', 172, true);
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
       bds            postgres    false    241            �           2606    19488 *   injection_attack injection_attack_name_key 
   CONSTRAINT     b   ALTER TABLE ONLY bds.injection_attack
    ADD CONSTRAINT injection_attack_name_key UNIQUE (name);
 Q   ALTER TABLE ONLY bds.injection_attack DROP CONSTRAINT injection_attack_name_key;
       bds            postgres    false    244            �           2606    19486 &   injection_attack injection_attack_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY bds.injection_attack
    ADD CONSTRAINT injection_attack_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY bds.injection_attack DROP CONSTRAINT injection_attack_pkey;
       bds            postgres    false    244            �           2606    19326    lang_name lang_name_lang_id_key 
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
       bds            postgres    false    217            �           2606    19474 7   author_has_title author_has_title_author_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.author_has_title
    ADD CONSTRAINT author_has_title_author_author_id_fkey FOREIGN KEY (author_author_id) REFERENCES bds.author(author_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY bds.author_has_title DROP CONSTRAINT author_has_title_author_author_id_fkey;
       bds          postgres    false    238    237    3293            �           2606    19469 5   author_has_title author_has_title_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.author_has_title
    ADD CONSTRAINT author_has_title_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY bds.author_has_title DROP CONSTRAINT author_has_title_title_title_id_fkey;
       bds          postgres    false    238    227    3283            �           2606    19404 /   borrow_archive borrow_archive_copy_copy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow_archive
    ADD CONSTRAINT borrow_archive_copy_copy_id_fkey FOREIGN KEY (copy_copy_id) REFERENCES bds.copy(copy_id);
 V   ALTER TABLE ONLY bds.borrow_archive DROP CONSTRAINT borrow_archive_copy_copy_id_fkey;
       bds          postgres    false    3285    235    229            �           2606    19399 /   borrow_archive borrow_archive_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow_archive
    ADD CONSTRAINT borrow_archive_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 V   ALTER TABLE ONLY bds.borrow_archive DROP CONSTRAINT borrow_archive_user_user_id_fkey;
       bds          postgres    false    235    3273    217            �           2606    19375    borrow borrow_copy_copy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow
    ADD CONSTRAINT borrow_copy_copy_id_fkey FOREIGN KEY (copy_copy_id) REFERENCES bds.copy(copy_id);
 F   ALTER TABLE ONLY bds.borrow DROP CONSTRAINT borrow_copy_copy_id_fkey;
       bds          postgres    false    231    3285    229            �           2606    19370    borrow borrow_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.borrow
    ADD CONSTRAINT borrow_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 F   ALTER TABLE ONLY bds.borrow DROP CONSTRAINT borrow_user_user_id_fkey;
       bds          postgres    false    231    217    3273            �           2606    19343 )   copy copy_borrow_type_borrow_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_borrow_type_borrow_type_id_fkey FOREIGN KEY (borrow_type_borrow_type_id) REFERENCES bds.borrow_type(borrow_type_id);
 P   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_borrow_type_borrow_type_id_fkey;
       bds          postgres    false    229    3277    221            �           2606    19358 %   copy copy_lang_name_lang_name_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_lang_name_lang_name_id_fkey FOREIGN KEY (lang_name_lang_name_id) REFERENCES bds.lang_name(lang_id);
 L   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_lang_name_lang_name_id_fkey;
       bds          postgres    false    3281    225    229            �           2606    19348 #   copy copy_location_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_location_location_id_fkey FOREIGN KEY (location_location_id) REFERENCES bds.location(location_id);
 J   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_location_location_id_fkey;
       bds          postgres    false    223    3279    229            �           2606    19353    copy copy_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.copy
    ADD CONSTRAINT copy_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id);
 D   ALTER TABLE ONLY bds.copy DROP CONSTRAINT copy_title_title_id_fkey;
       bds          postgres    false    227    3283    229            �           2606    19458 <   genre_has_title genre_has_title_genre_title_to_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.genre_has_title
    ADD CONSTRAINT genre_has_title_genre_title_to_genre_id_fkey FOREIGN KEY (genre_title_to_genre_id) REFERENCES bds.genre(title_to_genre_id);
 c   ALTER TABLE ONLY bds.genre_has_title DROP CONSTRAINT genre_has_title_genre_title_to_genre_id_fkey;
       bds          postgres    false    3299    242    241            �           2606    19463 3   genre_has_title genre_has_title_title_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.genre_has_title
    ADD CONSTRAINT genre_has_title_title_title_id_fkey FOREIGN KEY (title_title_id) REFERENCES bds.title(title_id);
 Z   ALTER TABLE ONLY bds.genre_has_title DROP CONSTRAINT genre_has_title_title_title_id_fkey;
       bds          postgres    false    242    3283    227            �           2606    19387 !   sign_in sign_in_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.sign_in
    ADD CONSTRAINT sign_in_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 H   ALTER TABLE ONLY bds.sign_in DROP CONSTRAINT sign_in_user_user_id_fkey;
       bds          postgres    false    217    3273    233            �           2606    19294 *   user user_customer_detail_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds."user"
    ADD CONSTRAINT user_customer_detail_customer_id_fkey FOREIGN KEY (customer_detail_customer_id) REFERENCES bds.customer_detail(customer_id);
 S   ALTER TABLE ONLY bds."user" DROP CONSTRAINT user_customer_detail_customer_id_fkey;
       bds          postgres    false    3267    215    217            �           2606    19441 -   user_has_role user_has_role_role_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.user_has_role
    ADD CONSTRAINT user_has_role_role_role_id_fkey FOREIGN KEY (role_role_id) REFERENCES bds.role(role_id);
 T   ALTER TABLE ONLY bds.user_has_role DROP CONSTRAINT user_has_role_role_role_id_fkey;
       bds          postgres    false    3275    239    219            �           2606    19436 -   user_has_role user_has_role_user_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bds.user_has_role
    ADD CONSTRAINT user_has_role_user_user_id_fkey FOREIGN KEY (user_user_id) REFERENCES bds."user"(user_id);
 T   ALTER TABLE ONLY bds.user_has_role DROP CONSTRAINT user_has_role_user_user_id_fkey;
       bds          postgres    false    3273    217    239            A           826    19275     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     \   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bds GRANT ALL ON SEQUENCES  TO "Kaca";
          bds          postgres    false    5            @           826    19274    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bds GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLES  TO "Kaca";
          bds          postgres    false    5            �   �  x�m�Orܸ��x��4E� .ݲ$�,M�cWR�A�p7"6�Iɭ�Ye|�YΦ+�ʇ�O\%i���}���%{�/m٩�L+���`%qvmbk{v�4��Ԫ��sƩb���g��|�7��t�V�`o������3Ώ'g_���׸ő7B0A纸�����L_�1=�j&�fWar�ɹ����w�t��O������դ�eX{v7Z痶�OO�d�L�fg�[���n�_=�m���jj7�;9S��F���S��5Tl��Gg|zV�O2T���m�!��5�cp1I�5�/���jB�����2�='(|i�?�1S��q�6?P\�y��v��sɋTB��~�$�݅��X�ڭ��I��K��:��v_�WzeM�b��{3m,{�zhk\��d���/��(#Wj*!�� )�������!^�S��Yv�o���|�!C��%��W�����یG�qvaC\Y���d�>C�9��Z�.��:�;^�?�V�����4�%�	rA\��j3!�Σ��������F7Z�w�Gk��s�GJ�&����tn�?�e��E\��.ö�F��7��-��g3�o�*�ڸp���UU�>y`	��^Ix~�尶>cV�`+va��!)��S�~��L����2;Gb�{��+�JP%��w�	��k3EgڌZ%��٭٢6:���z�Fƭ��R�V?��<Y�ʨU�*���D;�k7�k`�E?��4U��<�� ��D�>���$��p��D��Eݭ��TQ��죍m�ˀ	N�:f$J�F�f���^�Sdoöϑ	AB�\]؈n���$�g-t=w���F�wy��I(��C��H[�3vB��G�]�}L�Nh(ؕ׆����Fg3p�!��p�|�M$�C7F�f�7��dI��};T|�ђ�dŮ&�r��!�.�xɊ�H���ӗ�u�)%f�D�)؇�MgvI�Nj�����!�5I��Vͮ�c^aR�ԇё���d���ѯ-� Ɇpi��_�db��."���C#����K�9��*�������T���>��F�����Z 4�#�g���ߴ�ZP-���;T�ED�ϘԘ��,�[��K]S����">"���w��T�����OURk�Ƹr��)����4���@�t�i?�g2� h��طS4�񅙑*I�Ø�IgsR����r��P MP̗���5U�I#{�xNM	R0�a�Nfܔ$�:@�Lk|�Na�P��;���&ȼx(R��1ð/���Ҥ��\[�+7��[`)Aw:�(G���.H���ac\���31�}�$�_�ݸ�!o��9�h��*���抴xiRXo��_��iAZ�����Ғ��m���4�>#�k��8�O�&f|464���a�X*��GkBH�ىkC>�tCM��:��(,�)�)�w.�[���}�)��sa,�01C�pj*�Cì�$ԼV�Ϥ�	�b�W�8�A�D�zd;zuo󭰑ԼNG���n���`<���C��8�{a���s�N������MZ���o@�)n3����I� �Nú;�y�+��b�}�����2x��a��'�`�,ؕ[B��9{�cdqۮ�T�pe6�(�GH����K�Ť���%֫F�,;���\k�i�������Q7��M�B�̹S�������{���<���j�G�/?�� \�f      �   )   x�3�4�2�4�2�4�2�4�2�4�24��447����� G�T      �   t   x�M��!Dѳ]E���֒���,�%O�k �ܛ�׼'7�q����� CO6�fL�L�������Y����|ư��524�	�&39ɚ��N����;^�ɚ1�ߥ��7("      �   d   x�M��1D�3T�X�`;	[K��#�Ksx_�� #������F�}ch��2���*>����g6l��/ƾ��%�ٴ�K�DP{7)�ٲ����F�!f      �   :   x�3����+��2�,JMK-J�KNU��˩�2�LM,�2�LI��2�,OM������ ��Y      �   �   x�%�1�0���0U��#Q�(0t 1s�#���;���XQX)�4X������z����jB�Ѐ�ǩ/K��T��9��Ii���z��LX3�;��	Y��lo��F��CV�@k���z>֡����|'���!      �   C   x�%���0Bѳ���Uw��s�Q��#&+��Mx��I^��:�4)ڨ��b����\���w�Z��      �   �   x�3�L��K�;қwx�BvQfU�����������BpA~Vj��
�%��T*$�e&g^�eę�_\��rx�љ�ه*��d�df'�ۘ����+����]T�0�˄���4%3����\1z\\\ ��R�      �   !   x�3�4�2�4�2�4�2�4�2�4����� '�      �   �   x��=nA���a�?5BP�6��1�֎ld���}"�7�6rt1A޵�\�
�i�U3�Z�$E��$�/O��ڊ6�xT7�.�X�'��7JNj&���������-�q�9*D�ˎ�UP^�̹�#��{�1�C,_n����+�>W�#}/��Q�=M      �   ;   x�3�<ғztaIf^"��c^zN�^0Ϙ�����#� �	g@~T�)gP)����� c�o      �   =   x�3�4�46V�q�2�4�44Qp�2�4�0Tp�2�4�4U�	�2�4�Tp����� �r      �   ;   x�3�L�-�ɯLM�2�L.-.��M-�2�,.-H-���p�&�%�Y��ή�\1z\\\ d��      �   �   x���AR� @�5�#�Z���fHL�Q;�-fܐ��A����.{.�-�#�'{���z�4�!�<T��6;e(��,�K���U�;��n�U�BT_��fC/��:��覤���XM���LQ.�Sv�=BA�'��S�����+jƿ�)/i]�8�����4�ܧ6�ٳ"��
���ҁߎ���߾1��N��k����j~uY��x���y�1����Y      �   `  x�MVKr#7]�O��c�EY�ّꖬQҐ�Q�1����@�]^�v־�}��'��H���V3
@~^�|�S�=j��FYQ��S1������h�|���i��tX��j��V�>N�c-��η���Ɉǟ�F�}�yo�HW���<���]y�*�x�����v^>�)�^jk��Y(��)�]2'+�:�j:-8�b,���G��d���Չ�W|c�b�蝃�������R<)M{�{�q�G�O9�b*�����=|�7|�����W'����B�αW�g�A.��h�?nT�D-�w6�T���\,��9{��x�,-m�Z���ф���t��(�SJ��:�}c�`�
"���l��%�S&�x"�^�"�M>9o����RܛVG�[����_�����v��5!p���|�-���*��1��5���{��q*�V���=ތr���H�}*Ŭ��s�n=Z�����l2wVԐ�_-$��M��|T^n�>��@�	��
�"׽6��.����G�>��=��s{�Z�%b�E�5R3`S��=̙xha�k��F���O=��ػ�b�q-'L�bi;��u�	�1�>�q��O��G 5t@�{�:"�8b�7���PW:z7i_�v��Tŵ�e!n�f�~d�ɴ�@�r,�T�˫����j�νj�x����J�N�YeZ:.��K����L��[�|:%]���X���*yJ�K�'�������B~(��]R�*��rͺA��*�h�j,w�W��k�h��l��FE����K�V=�s?�c���Ž\T� �Q��!�]�o�k�,�L�U��=ܮ�?���fp?��{���pa`���?��d����LՓk�q?�f:�1J�ՎN�؀��cR�V.�xt�#3e�:�@��^���p�c��j�y�\C�M���'��+����s�c6o��m����Y�f�@��������t��~@�P�We)�EvG����/�;��	���1=�ilx��/�!Q#�W�+u��X:��̦����ܤ"���wQ��󍲱'�p�ߓ���IH(�ܣ<fuN��ѵ�(0��X�9�hZ� �r:�����ܠ�z��9��N��1�1�d��EM�d�8>9j�}g�y�-j��ޤ16�F&bA�x�#�]��ځU���lWG�Z��V��WL�z5�"$CPw�������[k��{�Y^k�Z���e��{��?Ȣ�����;��h��j.[�Bu��`ҿ�o�*]@U�D�?�N
}���:49d��cڮH���1��]=�f�C�pbu)V���h��V3,7�՞���!~-��R����|4����LZ�*���M}&f��f�m"�<`*n�G,��w:����T�����?Grm�7�9��(���܀�tQ�3�z���0��B`�a7K�_Ok�RrXs�ޕ��#Ƀl�_�z]t 5V�{,,�L�����1l�z�j�hx�d��_���ٹ�D�:��Γ��7�y.� �;��am
C�h�G�Cƣ̣��)�)>t1����D�^JsҀ-bV�R��I��aq����F�8ܚW����ںHu���r�%�`I�(�@*r�����o>|�?�a�      �   �  x�mV]s�8|��B��x�u�s)�r�Խ�y�D��u����/�Iնg��Ӄ_z�ȋ+��_��gg�~rԽ�{y�7�ΥB&U��T�B&�����ߊ�d�v1l !�F�Y��\�ߴ;�$�j͝^�l�,k�L�y&TR��:�;qiШ3�~�6����n�բHJ�w$.葼�x����@9?�N5ˤ��~gv��v������\�H�"�W';q=>��� �k����h�4���@R-����nb��s�K���$�\��sՈs�����'m|?,���*�U�d&.��y�M�0�9�(]�Ui.����M�ŭ��_�����3�giV�r� P}0`���SX�
�$�5��
�� ���!h�j�$뎋*J|1Y��{��Z\���?.qU����ߚq ��h�0��<ݑ��],U�n��E���h0�k��1�鎌�:���$���Sۃ$;-m�khh����S-^�
���^[�{����nҼd����j��Ƹ�[=��u;Є-�آ*^{���|
k`\0���r:�0�ON3İ�t��S,::�3����܁N^�{�1b�1�����կ��nA���yX��V�Oo����?5L����XR�D|�	��9n4�0:�� �ק�eOeS���ⵚ���YUy%�����Z�pDU2c2����0�/�S1n�VU�!�a5�Ϛ#K�y�;'�FF�Y���d[x��ouK\����
FW$p�[�
�k+.{O��a�����v�v6xLn��u`Ǹ�1���Lŝ`��7��#v���D�]���VYh]�FI�-�ą'���ߣ�����58\�:jE%0�u,��T|���`���b�J�4~jf���Ӓ��2����c��r���͸x �l�~>�զv�;���[�v�/�V��(�a�x��t�6�N�%,�q/`#�Ѡp�|ogu��
YD���ERd�y�.^����޳�-�
^O���s�T��KW�<l�ֺTJ���I��m�x��z��s�����#Mp^����c���t,�d_������U��w�@s��6���ʊR�1��w�ю�OÒl�×�l�p蘹J\���a�e�d
[�zQgx�ٛ�� ���1n�C�U�s`��Q?�^��VC�S� ��cr.s�tAf�c�����s�v�r�����e��Y��	a�	c��0�WݳL�y�$��#�S|      �   !   x�3�4�2�4�2�4�2�4�2�4����� '�     