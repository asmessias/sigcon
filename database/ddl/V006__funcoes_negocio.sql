-- =========================================================
-- Projeto: SIGCON
-- Fase: 9 – Estratégia de Versionamento e Seeds
-- Tipo: Migration
-- Arquivo: V006__funcoes_negocio.sql
-- Data: 2026-01-07
-- Descrição:
--   Criação de funções de negócio em PL/pgSQL.
-- =========================================================

-- =========================================
-- Funções de negócio
-- =========================================

-- 1) Histórico automático de status
CREATE OR REPLACE FUNCTION fn_registrar_historico_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status IS DISTINCT FROM OLD.status THEN
        INSERT INTO demanda_historico_status (
            id_demanda,
            status_anterior,
            status_novo,
            id_usuario
        )
        VALUES (
            OLD.id_demanda,
            OLD.status,
            NEW.status,
            NEW.id_responsavel
        );
    END IF;

    NEW.atualizada_em := now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- 2) Bloqueio de edição quando status impede alteração
CREATE OR REPLACE FUNCTION fn_bloquear_edicao_status()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status IN ('APROVADA', 'CANCELADA') THEN
        RAISE EXCEPTION
        'Demanda não pode ser alterada quando estiver no status %',
        OLD.status;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- 3) Exigir justificativa para alterações relevantes
CREATE OR REPLACE FUNCTION fn_exigir_justificativa()
RETURNS TRIGGER AS $$
DECLARE
    v_existe_justificativa BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM justificativa j
        WHERE j.id_demanda = OLD.id_demanda
          AND j.registrada_em >= (now() - INTERVAL '10 minutes')
    )
    INTO v_existe_justificativa;

    IF NOT v_existe_justificativa THEN
        RAISE EXCEPTION
        'Operação exige registro prévio de justificativa para a demanda %',
        OLD.id_demanda;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- 4) Regra CGPAR art. 10 – Demanda não executada
CREATE OR REPLACE FUNCTION fn_validar_demanda_nao_executada()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'NAO_EXECUTADA' THEN
        INSERT INTO justificativa (
            id_demanda,
            tipo,
            descricao,
            id_usuario
        )
        VALUES (
            NEW.id_demanda,
            'NAO_EXECUTADA',
            'Demanda não executada no ciclo do PCA',
            NEW.id_responsavel
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
