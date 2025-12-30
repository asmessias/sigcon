-- =====================================================
-- SIGCON - Views
-- =====================================================

CREATE OR REPLACE VIEW vw_pca_resumo AS
SELECT
    c.ano_referencia,
    d.status,
    COUNT(d.id_demanda) AS total_demandas,
    SUM(d.valor_estimado) AS valor_total
FROM ciclo_pca c
JOIN demanda d ON d.id_ciclo = c.id_ciclo
GROUP BY c.ano_referencia, d.status;
