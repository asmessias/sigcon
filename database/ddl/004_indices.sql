-- =====================================================
-- SIGCON - Índices
-- =====================================================

CREATE INDEX idx_demanda_ciclo ON demanda(id_ciclo);
CREATE INDEX idx_demanda_status ON demanda(status);
CREATE INDEX idx_demanda_unidade ON demanda(id_unidade);
CREATE INDEX idx_aprovacao_demanda ON aprovacao(id_demanda);
