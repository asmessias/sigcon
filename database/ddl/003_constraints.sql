-- =====================================================
-- SIGCON - Constraints
-- =====================================================

ALTER TABLE demanda
ADD CONSTRAINT chk_prioridade
CHECK (prioridade BETWEEN 1 AND 5);

ALTER TABLE aprovacao
ADD CONSTRAINT chk_decisao
CHECK (decisao IN ('APROVADO', 'REPROVADO'));
