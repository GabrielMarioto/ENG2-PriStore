PGDMP     7    8                x         
   pristoredb    12.0    12.0 -    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    25953 
   pristoredb    DATABASE     �   CREATE DATABASE pristoredb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE pristoredb;
                postgres    false            �            1259    26851 	   categoria    TABLE     e   CREATE TABLE public.categoria (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    26854    categoria_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categoria_cod_seq;
       public          postgres    false    202            >           0    0    categoria_cod_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categoria_cod_seq OWNED BY public.categoria.cod;
          public          postgres    false    203            �            1259    26856    colecao    TABLE     �   CREATE TABLE public.colecao (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL,
    datainicio date NOT NULL
);
    DROP TABLE public.colecao;
       public         heap    postgres    false            �            1259    26859    colecao_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.colecao_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.colecao_cod_seq;
       public          postgres    false    204            ?           0    0    colecao_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.colecao_cod_seq OWNED BY public.colecao.cod;
          public          postgres    false    205            �            1259    26861 
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
       public         heap    postgres    false            �            1259    26864    fornecedor_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.fornecedor_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.fornecedor_cod_seq;
       public          postgres    false    206            @           0    0    fornecedor_cod_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.fornecedor_cod_seq OWNED BY public.fornecedor.cod;
          public          postgres    false    207            �            1259    26912    funcionario    TABLE     �  CREATE TABLE public.funcionario (
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
       public         heap    postgres    false            �            1259    26866    marca    TABLE     a   CREATE TABLE public.marca (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    26869    marca_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.marca_cod_seq;
       public          postgres    false    208            A           0    0    marca_cod_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.marca_cod_seq OWNED BY public.marca.cod;
          public          postgres    false    209            �            1259    26871    produto    TABLE     8  CREATE TABLE public.produto (
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
       public         heap    postgres    false            �            1259    26874    produto_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produto_cod_seq;
       public          postgres    false    210            B           0    0    produto_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produto_cod_seq OWNED BY public.produto.cod;
          public          postgres    false    211            �
           2604    26915    categoria cod    DEFAULT     n   ALTER TABLE ONLY public.categoria ALTER COLUMN cod SET DEFAULT nextval('public.categoria_cod_seq'::regclass);
 <   ALTER TABLE public.categoria ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    26916    colecao cod    DEFAULT     j   ALTER TABLE ONLY public.colecao ALTER COLUMN cod SET DEFAULT nextval('public.colecao_cod_seq'::regclass);
 :   ALTER TABLE public.colecao ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    26917    fornecedor cod    DEFAULT     p   ALTER TABLE ONLY public.fornecedor ALTER COLUMN cod SET DEFAULT nextval('public.fornecedor_cod_seq'::regclass);
 =   ALTER TABLE public.fornecedor ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    26918 	   marca cod    DEFAULT     f   ALTER TABLE ONLY public.marca ALTER COLUMN cod SET DEFAULT nextval('public.marca_cod_seq'::regclass);
 8   ALTER TABLE public.marca ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    26919    produto cod    DEFAULT     j   ALTER TABLE ONLY public.produto ALTER COLUMN cod SET DEFAULT nextval('public.produto_cod_seq'::regclass);
 :   ALTER TABLE public.produto ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    211    210            -          0    26851 	   categoria 
   TABLE DATA           .   COPY public.categoria (cod, nome) FROM stdin;
    public          postgres    false    202   �2       /          0    26856    colecao 
   TABLE DATA           8   COPY public.colecao (cod, nome, datainicio) FROM stdin;
    public          postgres    false    204    3       1          0    26861 
   fornecedor 
   TABLE DATA           {   COPY public.fornecedor (cod, nome, cnpj, inscricaoestadual, endereco, email, tel, cidade, numrua, bairro, cep) FROM stdin;
    public          postgres    false    206   <3       7          0    26912    funcionario 
   TABLE DATA           �   COPY public.funcionario (fun_cod, fun_nome, fun_cpf, fun_sexo, fun_salario, fun_telefone, fun_email, fun_endereco, fun_cidade, fun_bairro, fun_cep) FROM stdin;
    public          postgres    false    212   �3       3          0    26866    marca 
   TABLE DATA           *   COPY public.marca (cod, nome) FROM stdin;
    public          postgres    false    208   a4       5          0    26871    produto 
   TABLE DATA           k   COPY public.produto (cod, codcategoria, nome, tamanho, preco, descricao, codmarca, codcolecao) FROM stdin;
    public          postgres    false    210   �4       C           0    0    categoria_cod_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_cod_seq', 2, true);
          public          postgres    false    203            D           0    0    colecao_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.colecao_cod_seq', 2, true);
          public          postgres    false    205            E           0    0    fornecedor_cod_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.fornecedor_cod_seq', 1, true);
          public          postgres    false    207            F           0    0    marca_cod_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marca_cod_seq', 3, true);
          public          postgres    false    209            G           0    0    produto_cod_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.produto_cod_seq', 1, false);
          public          postgres    false    211            �
           2606    26882    categoria pk_categoria 
   CONSTRAINT     U   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (cod);
 @   ALTER TABLE ONLY public.categoria DROP CONSTRAINT pk_categoria;
       public            postgres    false    202            �
           2606    26884    colecao pk_colecao 
   CONSTRAINT     Q   ALTER TABLE ONLY public.colecao
    ADD CONSTRAINT pk_colecao PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.colecao DROP CONSTRAINT pk_colecao;
       public            postgres    false    204            �
           2606    26886    fornecedor pk_fornecedor 
   CONSTRAINT     W   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pk_fornecedor PRIMARY KEY (cod);
 B   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT pk_fornecedor;
       public            postgres    false    206            �
           2606    26921    funcionario pk_funcionario 
   CONSTRAINT     ]   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (fun_cod);
 D   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT pk_funcionario;
       public            postgres    false    212            �
           2606    26888    marca pk_marca 
   CONSTRAINT     M   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (cod);
 8   ALTER TABLE ONLY public.marca DROP CONSTRAINT pk_marca;
       public            postgres    false    208            �
           2606    26890    produto pk_produto 
   CONSTRAINT     Q   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pk_produto PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.produto DROP CONSTRAINT pk_produto;
       public            postgres    false    210            �
           2606    26891    produto categoria_produto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT categoria_produto_fk FOREIGN KEY (codcategoria) REFERENCES public.categoria(cod);
 F   ALTER TABLE ONLY public.produto DROP CONSTRAINT categoria_produto_fk;
       public          postgres    false    210    2721    202            �
           2606    26896    produto colecao_produto_fk    FK CONSTRAINT        ALTER TABLE ONLY public.produto
    ADD CONSTRAINT colecao_produto_fk FOREIGN KEY (codcolecao) REFERENCES public.colecao(cod);
 D   ALTER TABLE ONLY public.produto DROP CONSTRAINT colecao_produto_fk;
       public          postgres    false    204    2723    210            �
           2606    26901    produto marca_produto_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT marca_produto_fk FOREIGN KEY (codmarca) REFERENCES public.marca(cod);
 B   ALTER TABLE ONLY public.produto DROP CONSTRAINT marca_produto_fk;
       public          postgres    false    208    2727    210            -      x�3����I-������� "��      /   ,   x�3���+K-���4202�50�50�2�442��r��qqq �]�      1   �   x�%ͱ�0����):�P�tS��&$&N.hH��%�,>�M���;���m��(C	�h�<<h�Q!����Mk�%?QWy��ˁ�u��,��_:M3�P<�۽�u�Ue��G���~�J>;(�����9�)�l�5Z�|.ޅ��/�      7   l   x�m�=
�P���$:�G[|��.�gp��`�Nb ��؟ *YU�I�e�̨Dj	�8�5=f;�زb��8vHq>13i0p6���ػ��ܽ��7�RJrӘ��)�'�      3      x�3����N����� �t      5   >   x�3�4����I-��U��IRΙyU����z���>�~.�
.�����@Ն\1z\\\ ��<     