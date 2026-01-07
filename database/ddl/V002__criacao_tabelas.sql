-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Migration
-- Arquivo: V002__criacao_tabelas.sql
-- Data: 2026-01-07
-- Descrição:
--   Criação das tabelas do domínio do SIGCON.
-- =========================================================

-- =========================================
-- Criação das tabelas principais
-- =========================================

CREATE TABLE orgao (
    id_orgao        BIGSERIAL PRIMARY KEY,
    nome            VARCHAR(200) NOT NULL,
    sigla           VARCHAR(50),
    ativo           BOOLEAN DEFAULT TRUE
);

CREATE TABLE unidade_organizacional (
    id_unidade      BIGSERIAL PRIMARY KEY,
    id_orgao        BIGINT NOT NULL REFERENCES orgao(id_orgao),
    nome            VARCHAR(200) NOT NULL,
    sigla           VARCHAR(50),
    tipo            VARCHAR(50),
    ativo           BOOLEAN DEFAULT TRUE
);

CREATE TABLE perfil (
    id_perfil   BIGSERIAL PRIMARY KEY,
    nome        VARCHAR(50) UNIQUE NOT NULL,
    descricao   TEXT
);

CREATE TABLE usuario (
    id_usuario      BIGSERIAL PRIMARY KEY,
    id_unidade      BIGINT REFERENCES unidade_organizacional(id_unidade),
    nome            VARCHAR(200) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    login           VARCHAR(100) UNIQUE NOT NULL,
    autenticacao    VARCHAR(20) NOT NULL,
    ativo           BOOLEAN DEFAULT TRUE,
    criado_em       TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE usuario_perfil (
    id_usuario  BIGINT REFERENCES usuario(id_usuario),
    id_perfil   BIGINT REFERENCES perfil(id_perfil),
    PRIMARY KEY (id_usuario, id_perfil)
);

CREATE TABLE ciclo_pca (
    id_ciclo        BIGSERIAL PRIMARY KEY,
    ano_referencia  INTEGER NOT NULL,
    data_inicio     DATE NOT NULL,
    data_fim        DATE NOT NULL,
    status          VARCHAR(30) NOT NULL,
    criado_em       TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE demanda (
    id_demanda      BIGSERIAL PRIMARY KEY,
    id_ciclo        BIGINT NOT NULL REFERENCES ciclo_pca(id_ciclo),
    id_unidade      BIGINT NOT NULL REFERENCES unidade_organizacional(id_unidade),
    id_responsavel  BIGINT NOT NULL REFERENCES usuario(id_usuario),
    objeto          TEXT NOT NULL,
    justificativa   TEXT NOT NULL,
    alinhamento_estrategico TEXT,
    valor_estimado  NUMERIC(18,2),
    data_prevista   DATE,
    prioridade      INTEGER,
    status          VARCHAR(30) NOT NULL,
    criada_em       TIMESTAMP WITH TIME ZONE DEFAULT now(),
    atualizada_em   TIMESTAMP WITH TIME ZONE
);

CREATE TABLE demanda_item (
    id_item         BIGSERIAL PRIMARY KEY,
    id_demanda      BIGINT NOT NULL REFERENCES demanda(id_demanda) ON DELETE CASCADE,
    descricao       TEXT NOT NULL,
    unidade_medida  VARCHAR(30),
    quantidade      NUMERIC(14,2),
    valor_unitario  NUMERIC(18,2)
);

CREATE TABLE justificativa (
    id_justificativa BIGSERIAL PRIMARY KEY,
    id_demanda      BIGINT REFERENCES demanda(id_demanda),
    tipo            VARCHAR(50) NOT NULL,
    descricao       TEXT NOT NULL,
    id_usuario      BIGINT REFERENCES usuario(id_usuario),
    registrada_em  TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE aprovacao (
    id_aprovacao    BIGSERIAL PRIMARY KEY,
    id_demanda      BIGINT NOT NULL REFERENCES demanda(id_demanda),
    nivel           VARCHAR(50),
    decisao         VARCHAR(20),
    parecer         TEXT,
    id_usuario      BIGINT REFERENCES usuario(id_usuario),
    decidido_em     TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE demanda_historico_status (
    id_historico    BIGSERIAL PRIMARY KEY,
    id_demanda      BIGINT NOT NULL REFERENCES demanda(id_demanda),
    status_anterior VARCHAR(30),
    status_novo     VARCHAR(30),
    id_usuario      BIGINT REFERENCES usuario(id_usuario),
    alterado_em     TIMESTAMP WITH TIME ZONE DEFAULT now()
);
