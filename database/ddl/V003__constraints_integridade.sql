-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Migration
-- Arquivo: V003__constraints_integridade.sql
-- Data: 2026-01-07
-- Descrição:
--   Definição das constraints e regras de integridade.
-- =========================================================

-- =========================================
-- Constraints de integridade
-- =========================================

ALTER TABLE demanda
ADD CONSTRAINT chk_prioridade
CHECK (prioridade BETWEEN 1 AND 5);

ALTER TABLE aprovacao
ADD CONSTRAINT chk_decisao
CHECK (decisao IN ('APROVADO', 'REPROVADO'));
