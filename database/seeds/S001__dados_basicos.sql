-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Seed
-- Arquivo: S001__dados_basicos.sql
-- Data: 2026-01-07
-- Descrição:
--   Carga inicial de dados estruturantes:
--   - perfis
--   - ciclos PCA
--   - status iniciais
-- =========================================================

INSERT INTO orgao (nome, sigla)
VALUES ('Companhia Nacional de Abastecimento', 'CONAB');

INSERT INTO perfil (nome, descricao) VALUES
('ADMINISTRADOR', 'Administrador do sistema'),
('ANALISTA', 'Analista da área de contratações'),
('DEMANDANTE', 'Responsável pela demanda'),
('APROVADOR', 'Autoridade competente');

INSERT INTO ciclo_pca (ano_referencia, data_inicio, data_fim, status)
VALUES (2027, '2026-01-01', '2026-12-31', 'ELABORACAO');
