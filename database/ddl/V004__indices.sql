-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Migration
-- Arquivo: V004__indices.sql
-- Data: 2026-01-07
-- Descrição:
--   Criação de índices para otimização de desempenho.
-- =========================================================

-- =========================================
-- Índices
-- =========================================

CREATE INDEX idx_demanda_ciclo ON demanda(id_ciclo);
CREATE INDEX idx_demanda_status ON demanda(status);
CREATE INDEX idx_demanda_unidade ON demanda(id_unidade);
CREATE INDEX idx_aprovacao_demanda ON aprovacao(id_demanda);
