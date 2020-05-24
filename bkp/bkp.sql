PGDMP                         x         
   pristoredb    12.3    12.0 >    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    16393 
   pristoredb    DATABASE     �   CREATE DATABASE pristoredb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE pristoredb;
                postgres    false            �            1259    16394 	   categoria    TABLE     e   CREATE TABLE public.categoria (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16397    categoria_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categoria_cod_seq;
       public          postgres    false    202            `           0    0    categoria_cod_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categoria_cod_seq OWNED BY public.categoria.cod;
          public          postgres    false    203            �            1259    16399    cliente    TABLE     w  CREATE TABLE public.cliente (
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
       public         heap    postgres    false            �            1259    16402    cliente_cli_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_cli_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cliente_cli_cod_seq;
       public          postgres    false    204            a           0    0    cliente_cli_cod_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cliente_cli_cod_seq OWNED BY public.cliente.cli_cod;
          public          postgres    false    205            �            1259    16404    colecao    TABLE     �   CREATE TABLE public.colecao (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL,
    datainicio date NOT NULL
);
    DROP TABLE public.colecao;
       public         heap    postgres    false            �            1259    16407    colecao_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.colecao_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.colecao_cod_seq;
       public          postgres    false    206            b           0    0    colecao_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.colecao_cod_seq OWNED BY public.colecao.cod;
          public          postgres    false    207            �            1259    16409 
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
       public         heap    postgres    false            �            1259    16412    fornecedor_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.fornecedor_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.fornecedor_cod_seq;
       public          postgres    false    208            c           0    0    fornecedor_cod_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.fornecedor_cod_seq OWNED BY public.fornecedor.cod;
          public          postgres    false    209            �            1259    16414    funcionario    TABLE     �  CREATE TABLE public.funcionario (
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
       public         heap    postgres    false            �            1259    16417    marca    TABLE     a   CREATE TABLE public.marca (
    cod integer NOT NULL,
    nome character varying(40) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    16420    marca_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.marca_cod_seq;
       public          postgres    false    211            d           0    0    marca_cod_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.marca_cod_seq OWNED BY public.marca.cod;
          public          postgres    false    212            �            1259    16477    parametrizacao    TABLE     #  CREATE TABLE public.parametrizacao (
    nome_fantasia character varying(50) NOT NULL,
    razao_social character varying NOT NULL,
    endereco character varying NOT NULL,
    site character varying NOT NULL,
    email character varying NOT NULL,
    telefone character varying NOT NULL
);
 "   DROP TABLE public.parametrizacao;
       public         heap    postgres    false            �            1259    16422    produto    TABLE       CREATE TABLE public.produto (
    cod integer NOT NULL,
    codcategoria integer NOT NULL,
    nome character varying(40) NOT NULL,
    preco numeric(6,2) NOT NULL,
    descricao character varying(40) NOT NULL,
    codmarca integer NOT NULL,
    codcolecao integer NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    16425    produto_cod_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_cod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produto_cod_seq;
       public          postgres    false    213            e           0    0    produto_cod_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produto_cod_seq OWNED BY public.produto.cod;
          public          postgres    false    214            �            1259    16467    tamanho    TABLE     �   CREATE TABLE public.tamanho (
    codproduto integer NOT NULL,
    tamanho character varying(3) NOT NULL,
    qtde integer NOT NULL
);
    DROP TABLE public.tamanho;
       public         heap    postgres    false            �            1259    16427    usuario    TABLE     �   CREATE TABLE public.usuario (
    fun_cod integer NOT NULL,
    usu_login character varying(20),
    usu_senha character varying(8),
    usu_nivel integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �
           2604    16430    categoria cod    DEFAULT     n   ALTER TABLE ONLY public.categoria ALTER COLUMN cod SET DEFAULT nextval('public.categoria_cod_seq'::regclass);
 <   ALTER TABLE public.categoria ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16431    cliente cli_cod    DEFAULT     r   ALTER TABLE ONLY public.cliente ALTER COLUMN cli_cod SET DEFAULT nextval('public.cliente_cli_cod_seq'::regclass);
 >   ALTER TABLE public.cliente ALTER COLUMN cli_cod DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16432    colecao cod    DEFAULT     j   ALTER TABLE ONLY public.colecao ALTER COLUMN cod SET DEFAULT nextval('public.colecao_cod_seq'::regclass);
 :   ALTER TABLE public.colecao ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    16433    fornecedor cod    DEFAULT     p   ALTER TABLE ONLY public.fornecedor ALTER COLUMN cod SET DEFAULT nextval('public.fornecedor_cod_seq'::regclass);
 =   ALTER TABLE public.fornecedor ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    16434 	   marca cod    DEFAULT     f   ALTER TABLE ONLY public.marca ALTER COLUMN cod SET DEFAULT nextval('public.marca_cod_seq'::regclass);
 8   ALTER TABLE public.marca ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    212    211            �
           2604    16435    produto cod    DEFAULT     j   ALTER TABLE ONLY public.produto ALTER COLUMN cod SET DEFAULT nextval('public.produto_cod_seq'::regclass);
 :   ALTER TABLE public.produto ALTER COLUMN cod DROP DEFAULT;
       public          postgres    false    214    213            J          0    16394 	   categoria 
   TABLE DATA           .   COPY public.categoria (cod, nome) FROM stdin;
    public          postgres    false    202   -G       L          0    16399    cliente 
   TABLE DATA           �   COPY public.cliente (cli_cod, cli_nome, cli_cpf, cli_end, cli_email, cli_telefone, cli_sexo, cli_saldo, cli_dtnasc) FROM stdin;
    public          postgres    false    204   uG       N          0    16404    colecao 
   TABLE DATA           8   COPY public.colecao (cod, nome, datainicio) FROM stdin;
    public          postgres    false    206   �G       P          0    16409 
   fornecedor 
   TABLE DATA           {   COPY public.fornecedor (cod, nome, cnpj, inscricaoestadual, endereco, email, tel, cidade, numrua, bairro, cep) FROM stdin;
    public          postgres    false    208   *H       R          0    16414    funcionario 
   TABLE DATA           �   COPY public.funcionario (fun_cod, fun_nome, fun_cpf, fun_sexo, fun_salario, fun_telefone, fun_email, fun_endereco, fun_cidade, fun_bairro, fun_cep) FROM stdin;
    public          postgres    false    210   �H       S          0    16417    marca 
   TABLE DATA           *   COPY public.marca (cod, nome) FROM stdin;
    public          postgres    false    211   OI       Y          0    16477    parametrizacao 
   TABLE DATA           f   COPY public.parametrizacao (nome_fantasia, razao_social, endereco, site, email, telefone) FROM stdin;
    public          postgres    false    217   �I       U          0    16422    produto 
   TABLE DATA           b   COPY public.produto (cod, codcategoria, nome, preco, descricao, codmarca, codcolecao) FROM stdin;
    public          postgres    false    213   �I       X          0    16467    tamanho 
   TABLE DATA           <   COPY public.tamanho (codproduto, tamanho, qtde) FROM stdin;
    public          postgres    false    216   CJ       W          0    16427    usuario 
   TABLE DATA           K   COPY public.usuario (fun_cod, usu_login, usu_senha, usu_nivel) FROM stdin;
    public          postgres    false    215   `J       f           0    0    categoria_cod_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_cod_seq', 6, true);
          public          postgres    false    203            g           0    0    cliente_cli_cod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cliente_cli_cod_seq', 4, true);
          public          postgres    false    205            h           0    0    colecao_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.colecao_cod_seq', 3, true);
          public          postgres    false    207            i           0    0    fornecedor_cod_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.fornecedor_cod_seq', 1, true);
          public          postgres    false    209            j           0    0    marca_cod_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marca_cod_seq', 6, true);
          public          postgres    false    212            k           0    0    produto_cod_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.produto_cod_seq', 2, true);
          public          postgres    false    214            �
           2606    16437    cliente cliente_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_cod);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    204            �
           2606    16484     parametrizacao parametrizacao_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.parametrizacao
    ADD CONSTRAINT parametrizacao_pk PRIMARY KEY (nome_fantasia);
 J   ALTER TABLE ONLY public.parametrizacao DROP CONSTRAINT parametrizacao_pk;
       public            postgres    false    217            �
           2606    16439    categoria pk_categoria 
   CONSTRAINT     U   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (cod);
 @   ALTER TABLE ONLY public.categoria DROP CONSTRAINT pk_categoria;
       public            postgres    false    202            �
           2606    16441    colecao pk_colecao 
   CONSTRAINT     Q   ALTER TABLE ONLY public.colecao
    ADD CONSTRAINT pk_colecao PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.colecao DROP CONSTRAINT pk_colecao;
       public            postgres    false    206            �
           2606    16443    fornecedor pk_fornecedor 
   CONSTRAINT     W   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pk_fornecedor PRIMARY KEY (cod);
 B   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT pk_fornecedor;
       public            postgres    false    208            �
           2606    16445    funcionario pk_funcionario 
   CONSTRAINT     ]   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (fun_cod);
 D   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT pk_funcionario;
       public            postgres    false    210            �
           2606    16447    marca pk_marca 
   CONSTRAINT     M   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (cod);
 8   ALTER TABLE ONLY public.marca DROP CONSTRAINT pk_marca;
       public            postgres    false    211            �
           2606    16449    produto pk_produto 
   CONSTRAINT     Q   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pk_produto PRIMARY KEY (cod);
 <   ALTER TABLE ONLY public.produto DROP CONSTRAINT pk_produto;
       public            postgres    false    213            �
           2606    16471    tamanho pk_tamanho 
   CONSTRAINT     X   ALTER TABLE ONLY public.tamanho
    ADD CONSTRAINT pk_tamanho PRIMARY KEY (codproduto);
 <   ALTER TABLE ONLY public.tamanho DROP CONSTRAINT pk_tamanho;
       public            postgres    false    216            �
           2606    16451    usuario pk_usuario 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (fun_cod);
 <   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_usuario;
       public            postgres    false    215            �
           2606    16452    produto categoria_produto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT categoria_produto_fk FOREIGN KEY (codcategoria) REFERENCES public.categoria(cod);
 F   ALTER TABLE ONLY public.produto DROP CONSTRAINT categoria_produto_fk;
       public          postgres    false    2741    213    202            �
           2606    16457    produto colecao_produto_fk    FK CONSTRAINT        ALTER TABLE ONLY public.produto
    ADD CONSTRAINT colecao_produto_fk FOREIGN KEY (codcolecao) REFERENCES public.colecao(cod);
 D   ALTER TABLE ONLY public.produto DROP CONSTRAINT colecao_produto_fk;
       public          postgres    false    2745    213    206            �
           2606    16472    tamanho fk_tamanho    FK CONSTRAINT     w   ALTER TABLE ONLY public.tamanho
    ADD CONSTRAINT fk_tamanho FOREIGN KEY (codproduto) REFERENCES public.produto(cod);
 <   ALTER TABLE ONLY public.tamanho DROP CONSTRAINT fk_tamanho;
       public          postgres    false    216    213    2753            �
           2606    16462    produto marca_produto_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT marca_produto_fk FOREIGN KEY (codmarca) REFERENCES public.marca(cod);
 B   ALTER TABLE ONLY public.produto DROP CONSTRAINT marca_produto_fk;
       public          postgres    false    211    213    2751            J   8   x�3����I-���2�tN�9�<Q�+51��˔3$5/���(��Y�Z������ ��      L   ^   x�ı
�  ������;Լۢ�?h�hR!�����,��(u����XdmX�y����&�+�����Y3�ċ�h�!y4�@"^i$u���43      N   7   x�3���+K-���4202�50�50�2�442��rs����#)22����� ŕ@      P   �   x�%ͱ�0����):�P�tS��&$&N.hH��%�,>�M���;���m��(C	�h�<<h�Q!����Mk�%?QWy��ˁ�u��,��_:M3�P<�۽�u�Ue��G���~�J>;(�����9�)�l�5Z�|.ޅ��/�      R   l   x�m�=
�P���$:�G[|��.�gp��`�Nb ��؟ *YU�I�e�̨Dj	�8�5=f;�زb��8vHq>13i0p6���ػ��ܽ��7�RJrӘ��)�'�      S   /   x�3����N�2���I���2��O��I��2�tL�LI,����� �1
g      Y      x������ � �      U   �   x�3�4����I-��U��IRΙyU����z���>�~.�
.�����@��\����~�٩
�N
�%�i�y
^�y��ٙ�F��z�!�y��
E@3�:�8M8�s/OT�JM̃H%r- �F�m����� ~�)�      X      x������ � �      W      x�3�LL��̃��\1z\\\ B�G     