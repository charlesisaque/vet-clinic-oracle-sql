-- Cliente Isolado

CREATE TABLE TB_CLIENTE_CLINICA_FABIO (

    NOME_COMPLETO       VARCHAR2(150) NOT NULL,

    CPF_CNPJ            VARCHAR2(14)  NOT NULL,

    TELEFONE1           VARCHAR2(14),

    TELEFONE2           VARCHAR2(14),

    RUA                 VARCHAR2(100),

    BAIRRO              VARCHAR2(100),

    CIDADE              VARCHAR2(50)

);



-- Animal Isolado

CREATE TABLE TB_ANIMAIS_FABIO (

    NOME_ANIMAL         VARCHAR2(100) NOT NULL,

    ESPECIE_ANIMAL      VARCHAR2(50)  NOT NULL,

    RACA_ANIMAL         VARCHAR2(50)  NOT NULL,

    PESO_ATUAL          DECIMAL(5,2)  NOT NULL,

    DATA_NASCIMENTO     DATE,

    SILVESTRE           VARCHAR2(1)   NOT NULL,

    ASA_MACHUCADA       VARCHAR2(1),

    OBSERVACOES         VARCHAR2(300)

);



-- Veterinário Isolado

CREATE TABLE TB_VETERINARIO_FABIO (

    NOME                VARCHAR2(150) NOT NULL,

    CRMV                VARCHAR2(20)  NOT NULL,

    ESPECIALIDADE       VARCHAR2(100),

    TURNO               VARCHAR2(20)

);



-- Atendimento Isolado

CREATE TABLE TB_ATENDIMENTO_FABIO (

    DATA_CONSULTA       DATE,

    VALOR_COBRADO       NUMBER(10,2),

    COMENTARIO          VARCHAR2(1000),

    REMEDIOS            VARCHAR2(500)

);



-- Produto Isolado

CREATE TABLE TB_PRODUTO_FABIO (

    NOME_PRODUTO        VARCHAR2(150) NOT NULL,

    CODIGO_BARRAS       VARCHAR2(50),

    PRECO_VENDA         NUMBER(10,2),

    QTD_ESTOQUE         INT

);







-- ==========================================

-- TABELAS PAIS (INDEPENDENTES - CRIAR PRIMEIRO)

-- ==========================================



-- 1. Cliente

CREATE TABLE TB_CLIENTE_CLINICA_FABIO (

    ID_CLIENTE          INT PRIMARY KEY NOT NULL,

    NOME_COMPLETO       VARCHAR2(150) NOT NULL,

    CPF_CNPJ            VARCHAR2(14)  NOT NULL UNIQUE,

    TELEFONE1           VARCHAR2(14),

    TELEFONE2           VARCHAR2(14),

    RUA                 VARCHAR2(100),

    BAIRRO              VARCHAR2(100),

    CIDADE              VARCHAR2(50),

    DATA_CRIACAO        DATE DEFAULT SYSDATE,

    USUARIO_CRIADOR     VARCHAR2(50) DEFAULT USER,

    DATA_ULT_ALTERACAO  DATE,

    USUARIO_ULT_ALT     VARCHAR2(50)

);



-- 2. Veterinário

CREATE TABLE TB_VETERINARIO_FABIO (

    ID_VETERINARIO      INT PRIMARY KEY NOT NULL,

    NOME                VARCHAR2(150) NOT NULL,

    CRMV                VARCHAR2(20)  NOT NULL UNIQUE,

    ESPECIALIDADE       VARCHAR2(100),

    TURNO               VARCHAR2(20),

    DATA_CRIACAO        DATE DEFAULT SYSDATE,

    USUARIO_CRIADOR     VARCHAR2(50) DEFAULT USER,

    DATA_ULT_ALTERACAO  DATE,

    USUARIO_ULT_ALT     VARCHAR2(50)

);



-- 3. Produto

CREATE TABLE TB_PRODUTO_FABIO (

    ID_PRODUTO          INT PRIMARY KEY NOT NULL,

    NOME_PRODUTO        VARCHAR2(150) NOT NULL,

    CODIGO_BARRAS       VARCHAR2(50)  UNIQUE,

    PRECO_VENDA         NUMBER(10,2),

    QTD_ESTOQUE         INT DEFAULT 0,

    DATA_CRIACAO        DATE DEFAULT SYSDATE,

    USUARIO_CRIADOR     VARCHAR2(50) DEFAULT USER,

    DATA_ULT_ALTERACAO  DATE,

    USUARIO_ULT_ALT     VARCHAR2(50)

);



-- ==========================================

-- TABELAS FILHAS (DEPENDENTES - CRIAR DEPOIS)

-- ==========================================



-- 4. Animal (Depende de Cliente)

CREATE TABLE TB_ANIMAIS_FABIO (

    ID_ANIMAL           INT PRIMARY KEY NOT NULL,

    ID_CLIENTE          INT NOT NULL, -- Chave Estrangeira

    NOME_ANIMAL         VARCHAR2(100) NOT NULL,

    ESPECIE_ANIMAL      VARCHAR2(50)  NOT NULL,

    RACA_ANIMAL         VARCHAR2(50)  NOT NULL,

    PESO_ATUAL          DECIMAL(5,2)  NOT NULL,

    DATA_NASCIMENTO     DATE,

    SILVESTRE           VARCHAR2(1)   NOT NULL,

    ASA_MACHUCADA       VARCHAR2(1),

    OBSERVACOES         VARCHAR2(300),

    DATA_CRIACAO        DATE DEFAULT SYSDATE,

    USUARIO_CRIADOR     VARCHAR2(50) DEFAULT USER,

    DATA_ULT_ALTERACAO  DATE,

    USUARIO_ULT_ALT     VARCHAR2(50),

    

    CONSTRAINT FK_ANIMAL_CLIENTE FOREIGN KEY (ID_CLIENTE) 

        REFERENCES TB_CLIENTE_CLINICA_FABIO(ID_CLIENTE)

);



-- 5. Atendimento (Depende de Animal e Veterinário)

CREATE TABLE TB_ATENDIMENTO_FABIO (

    ID_ATENDIMENTO      INT PRIMARY KEY NOT NULL,

    ID_ANIMAL           INT NOT NULL, -- Chave Estrangeira 1

    ID_VETERINARIO      INT NOT NULL, -- Chave Estrangeira 2

    DATA_CONSULTA       DATE DEFAULT SYSDATE,

    VALOR_COBRADO       NUMBER(10,2),

    COMENTARIO          VARCHAR2(1000),

    REMEDIOS            VARCHAR2(500),

    DATA_CRIACAO        DATE DEFAULT SYSDATE,

    USUARIO_CRIADOR     VARCHAR2(50) DEFAULT USER,

    DATA_ULT_ALTERACAO  DATE,

    USUARIO_ULT_ALT     VARCHAR2(50),

    

    CONSTRAINT FK_ATEND_ANIMAL FOREIGN KEY (ID_ANIMAL) 

        REFERENCES TB_ANIMAIS_FABIO(ID_ANIMAL),

    CONSTRAINT FK_ATEND_VET FOREIGN KEY (ID_VETERINARIO) 

        REFERENCES TB_VETERINARIO_FABIO(ID_VETERINARIO)

);