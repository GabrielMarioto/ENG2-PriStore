PGDMP         (                x         
   pristoredb    12.0    12.0 7    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    25953 
   pristoredb    DATABASE     �   CREATE DATABASE pristoredb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE pristoredb;
                postgres    false            �            1259    26928 	   categoria    TABLE     e   CREATE TABLE public.categoria (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    26931    categoria_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categoria_cod_seq;
       public          postgres    false    202            P           0    0    categoria_cod_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categoria_cod_seq OWNED BY public.categoria.cod;
          public          postgres    false    203            �            1259    27054    cliente    TABLE     w  CREATE TABLE public.cliente (
    cli_cod integer NOT NULL,
    cli_nome character varying(40) NOT NULL,
    cli_cpf character varying(12) NOT NULL,
    cli_end character varying(40) NOT NULL,
    cli_email character varying(40),
    cli_telefone character varying(40) NOT NULL,
    cli_sexo character(1) NOT NULL,
    cli_saldo numeric(6,2) NOT NULL,
    cli_dtnasc date
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    27057    cliente_cli_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_cli_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cliente_cli_cod_seq;
       public          postgres    false    213            Q           0    0    cliente_cli_cod_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cliente_cli_cod_seq OWNED BY public.cliente.cli_cod;
          public          postgres    false    214            �            1259    26933    colecao    TABLE     �   CREATE TABLE public.colecao (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL,
    datainicio date NOT NULL
);
    DROP TABLE public.colecao;
       public         heap    postgres    false            �            1259    26936    colecao_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.colecao_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.colecao_cod_seq;
       public          postgres    false    204            R           0    0    colecao_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.colecao_cod_seq OWNED BY public.colecao.cod;
          public          postgres    false    205            �            1259    26938 
   fornecedor    TABLE     �  CREATE TABLE public.fornecedor (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL,
    cnpj character varying(18) NOT NULL,
    inscricaoestadual character varying(9) NOT NULL,
    endereco character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    tel character varying(14) NOT NULL,
    cidade character varying(50) NOT NULL,
    numrua integer NOT NULL,
    bairro character varying(50) NOT NULL,
    cep character varying(9) NOT NULL
);
    DROP TABLE public.fornecedor;
       public         heap    postgres    false            �            1259    26941    fornecedor_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.fornecedor_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.fornecedor_cod_seq;
       public          postgres    false    206            S           0    0    fornecedor_cod_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.fornecedor_cod_seq OWNED BY public.fornecedor.cod;
          public          postgres    false    207            �            1259    26943    funcionario    TABLE     �  CREATE TABLE public.funcionario (
    fun_cod integer NOT NULL,
    fun_nome character varying(40),
    fun_cpf character varying(15),
    fun_sexo character(1),
    fun_salario numeric(6,2),
    fun_telefone character varying(17),
    fun_email character varying(40),
    fun_endereco character varying(40),
    fun_cidade character varying(40),
    fun_bairro character varying(40),
    fun_cep character varying(40)
);
    DROP TABLE public.funcionario;
       public         heap    postgres    false            �            1259    26946    marca    TABLE     a   CREATE TABLE public.marca (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    26949    marca_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.marca_cod_seq;
       public          postgres    false    209            T           0    0    marca_cod_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.marca_cod_seq OWNED BY public.marca.cod;
          public          postgres    false    210            �            1259    26951    produto    TABLE     8  CREATE TABLE public.produto (
    cod integer NOT NULL,
    codcategoria integer NOT NULL,
    nome character varying(40) NOT NULL,
    tamanho character(2) NOT NULL,
    preco numeric(6,2) NOT NULL,
    descricao character varying(40) NOT NULL,
    codmarca integer NOT NULL,
    codcolecao integer NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    26954    produto_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produto_cod_seq;
       public          postgres    false    211            U           0    0    produto_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produto_cod_seq OWNED BY public.produto.cod;
          public          postgres    false    212            �            1259    27059    usuario    TABLE     �   CREATE TABLE public.usuario (
    fun_cod integer NOT NULL,
    usu_login character varying(20),
    usu_senha character varying(8),
    usu_nivel integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �
           2604    27062    categoria cod    DEFAULT     n   ALTER TABLE ONLY public.categoria ALTER COLUMN cod SET DEFAULT nextval('public.categoria_cod_seq'::regclass);
 <   ALTER TABLE public.categoria ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    27063    cliente cli_cod    DEFAULT     r   ALTER TABLE ONLY public.cliente ALTER COLUMN cli_cod SET DEFAULT nextval('public.cliente_cli_cod_seq'::regclass);
 >   ALTER TABLE public.cliente ALTER COLUMN cli_cod DROP DEFAULT;
       public          postgres    false    214    213            �
           2604    27064    colecao cod    DEFAULT     j   ALTER TABLE ONLY public.colecao ALTER COLUMN cod SET DEFAULT nextval('public.colecao_cod_seq'::regclass);
 :   ALTER TABLE public.colecao ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    27065    fornecedor cod    DEFAULT     p   ALTER TABLE ONLY public.fornecedor ALTER COLUMN cod SET DEFAULT nextval('public.fornecedor_cod_seq'::regclass);
 =   ALTER TABLE public.fornecedor ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    27066 	   marca cod    DEFAULT     f   ALTER TABLE ONLY public.marca ALTER COLUMN cod SET DEFAULT nextval('public.marca_cod_seq'::regclass);
 8   ALTER TABLE public.marca ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    27067    produto cod    DEFAULT     j   ALTER TABLE ONLY public.produto ALTER COLUMN cod SET DEFAULT nextval('public.produto_cod_seq'::regclass);
 :   ALTER TABLE public.produto ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    212    211            <          0    26928 	   categoria 
   TABLE DATA           .   COPY public.categoria (cod, nome) FROM stdin;
    public          postgres    false    202   �>       G          0    27054    cliente 
   TABLE DATA           �   COPY public.cliente (cli_cod, cli_nome, cli_cpf, cli_end, cli_email, cli_telefone, cli_sexo, cli_saldo, cli_dtnasc) FROM stdin;
    public          postgres    false    213   ?       >          0    26933    colecao 
   TABLE DATA           8   COPY public.colecao (cod, nome, datainicio) FROM stdin;
    public          postgres    false    204   q?       @          0    26938 
   fornecedor 
   TABLE DATA           {   COPY public.fornecedor (cod, nome, cnpj, inscricaoestadual, endereco, email, tel, cidade, numrua, bairro, cep) FROM stdin;
    public          postgres    false    206   �?       B          0    26943    funcionario 
   TABLE DATA           �   COPY public.funcionario (fun_cod, fun_nome, fun_cpf, fun_sexo, fun_salario, fun_telefone, fun_email, fun_endereco, fun_cidade, fun_bairro, fun_cep) FROM stdin;
    public          postgres    false    208   a@       C          0    26946    marca 
   TABLE DATA           *   COPY public.marca (cod, nome) FROM stdin;
    public          postgres    false    209   �@       E          0    26951    produto 
   TABLE DATA           k   COPY public.produto (cod, codcategoria, nome, tamanho, preco, descricao, codmarca, codcolecao) FROM stdin;
    public          postgres    false    211   A       I          0    27059    usuario 
   TABLE DATA           K   COPY public.usuario (fun_cod, usu_login, usu_senha, usu_nivel) FROM stdin;
    public          postgres    false    215   �A       V           0    0    categoria_cod_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_cod_seq', 6, true);
          public          postgres    false    203            W           0    0    cliente_cli_cod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cliente_cli_cod_seq', 4, true);
          public          postgres    false    214            X           0    0    colecao_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.colecao_cod_seq', 3, true);
          public          postgres    false    205            Y           0    0    fornecedor_cod_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.fornecedor_cod_seq', 1, true);
          public          postgres    false    207            Z           0    0    marca_cod_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marca_cod_seq', 6, true);
          public          postgres    false    210            [           0    0    produto_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.produto_cod_seq', 2, true);
          public          postgres    false    212            �
           2606    27069    cliente cliente_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_cod);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    213            �
           2606    26962    categoria pk_categoria 
   CONSTRAINT     U   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (cod);
 @   ALTER TABLE ONLY public.categoria DROP CONSTRAINT pk_categoria;
       public            postgres    false    202            �
           2606    26964    colecao pk_colecao 
   CONSTRAINT     Q   ALTER TABLE ONLY public.colecao
    ADD CONSTRAINT pk_colecao PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.colecao DROP CONSTRAINT pk_colecao;
       public            postgres    false    204            �
           2606    26966    fornecedor pk_fornecedor 
   CONSTRAINT     W   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pk_fornecedor PRIMARY KEY (cod);
 B   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT pk_fornecedor;
       public            postgres    false    206            �
           2606    26968    funcionario pk_funcionario 
   CONSTRAINT     ]   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (fun_cod);
 D   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT pk_funcionario;
       public            postgres    false    208            �
           2606    26970    marca pk_marca 
   CONSTRAINT     M   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (cod);
 8   ALTER TABLE ONLY public.marca DROP CONSTRAINT pk_marca;
       public            postgres    false    209            �
           2606    26972    produto pk_produto 
   CONSTRAINT     Q   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pk_produto PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.produto DROP CONSTRAINT pk_produto;
       public            postgres    false    211            �
           2606    27071    usuario pk_usuario 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (fun_cod);
 <   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_usuario;
       public            postgres    false    215            �
           2606    26973    produto categoria_produto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT categoria_produto_fk FOREIGN KEY (codcategoria) REFERENCES public.categoria(cod);
 F   ALTER TABLE ONLY public.produto DROP CONSTRAINT categoria_produto_fk;
       public          postgres    false    2732    202    211            �
           2606    26978    produto colecao_produto_fk    FK CONSTRAINT        ALTER TABLE ONLY public.produto
    ADD CONSTRAINT colecao_produto_fk FOREIGN KEY (codcolecao) REFERENCES public.colecao(cod);
 D   ALTER TABLE ONLY public.produto DROP CONSTRAINT colecao_produto_fk;
       public          postgres    false    211    204    2734            �
           2606    26983    produto marca_produto_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT marca_produto_fk FOREIGN KEY (codmarca) REFERENCES public.marca(cod);
 B   ALTER TABLE ONLY public.produto DROP CONSTRAINT marca_produto_fk;
       public          postgres    false    209    2740    211            <   8   x�3����I-���2�tN�9�<Q�+51��˔3$5/���(��Y�Z������ ��      G   ^   x�ı
�  ������;Լۢ�?h�hR!�����,��(u����XdmX�y����&�+�����Y3�ċ�h�!y4�@"^i$u���43      >   7   x�3���+K-���4202�50�50�2�442��rs����#)22����� ŕ@      @   �   x�%ͱ�0����):�P�tS��&$&N.hH��%�,>�M���;���m��(C	�h�<<h�Q!����Mk�%?QWy��ˁ�u��,��_:M3�P<�۽�u�Ue��G���~�J>;(�����9�)�l�5Z�|.ޅ��/�      B   l   x�m�=
�P���$:�G[|��.�gp��`�Nb ��؟ *YU�I�e�̨Dj	�8�5=f;�زb��8vHq>13i0p6���ػ��ܽ��7�RJrӘ��)�'�      C   /   x�3����N�2���I���2��O��I��2�tL�LI,����� �1
g      E   �   x�M�A
�0DדS���&��Ji�U��r��1ە� ^̠W�x�f4����t��Z���h[h����wcs�f7l:W�ZhX�a����D=�<OF��k�N>�������*��/��s�!�QX��"��rP��B| �>+M      I      x�3�LL��̃��\1z\\\ B�G     