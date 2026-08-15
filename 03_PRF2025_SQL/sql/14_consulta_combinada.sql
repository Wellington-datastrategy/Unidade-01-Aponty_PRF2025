/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
14_consulta_combinada.sql

Etapa 14 – Consultas Combinadas:
Dois Fatores Explicativos

Objetivo:
Relacionar duas variáveis explicativas,
identificando combinações com maior
percentual de acidentes fatais e cobertura
na base de dados.

====================================================
*/

-- ====================================================
-- ETAPA 14.1 - TIPO DE PISTA + FASE DO DIA
-- ====================================================

SELECT

    tipo_pista,

    fase_dia,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS cobertura_perc,

    ROUND(
        100.0 * SUM(acidente_fatal) /
        COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY

    tipo_pista,
    fase_dia

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC;


-- ====================================================
-- ETAPA 14.2 - CAUSA + TIPO DE ACIDENTE
-- ====================================================

SELECT

    causa_acidente,

    tipo_acidente,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS cobertura_perc,

    ROUND(
        100.0 * SUM(acidente_fatal) /
        COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY

    causa_acidente,
    tipo_acidente

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC

LIMIT 30;