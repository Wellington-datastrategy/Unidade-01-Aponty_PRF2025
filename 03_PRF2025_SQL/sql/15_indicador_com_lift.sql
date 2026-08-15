/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
projeto_completo.sql

Etapa 15 – Indicadores Finais com Lift

Objetivo:
Calcular os indicadores analíticos por categoria,
incluindo o Lift em relação à taxa global de
acidentes fatais.

====================================================
*/

-- ====================================================
-- ETAPA 15 - LIFT POR TIPO DE ACIDENTE
-- ====================================================

WITH global AS (

    SELECT

        1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global

    FROM vw_acidentes_base

)

SELECT

    tipo_acidente AS categoria,

    COUNT(*) AS total_acidentes,

    SUM(CAST(mortos AS INTEGER)) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais,

    ROUND(
        (1.0 * SUM(acidente_fatal) / COUNT(*))
        / taxa_global,
        2
    ) AS lift

FROM vw_acidentes_base,

     global

GROUP BY

    categoria,
    taxa_global

HAVING COUNT(*) >= 100

ORDER BY lift DESC;