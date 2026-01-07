-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Migration
-- Arquivo: V007__triggers_controle.sql
-- Data: 2026-01-07
-- Descrição:
--   Criação de triggers de controle, auditoria e validação.
-- =========================================================

-- =========================================
-- Triggers de controle
-- =========================================

-- 1) Histórico automático de status
CREATE TRIGGER trg_historico_status
AFTER UPDATE OF status ON demanda
FOR EACH ROW
EXECUTE FUNCTION fn_registrar_historico_status();


-- 2) Bloqueio de edição por status
CREATE TRIGGER trg_bloquear_edicao
BEFORE UPDATE ON demanda
FOR EACH ROW
EXECUTE FUNCTION fn_bloquear_edicao_status();


-- 3) Exigir justificativa para alterações críticas
CREATE TRIGGER trg_exigir_justificativa
BEFORE UPDATE OF
    objeto,
    valor_estimado,
    data_prevista,
    prioridade
ON demanda
FOR EACH ROW
EXECUTE FUNCTION fn_exigir_justificativa();


-- 4) Regra CGPAR – demanda não executada
CREATE TRIGGER trg_demanda_nao_executada
AFTER UPDATE OF status ON demanda
FOR EACH ROW
WHEN (NEW.status = 'NAO_EXECUTADA')
EXECUTE FUNCTION fn_validar_demanda_nao_executada();
