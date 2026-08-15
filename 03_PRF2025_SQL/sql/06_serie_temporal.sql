/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
06_serie_temporal.sql

Objetivo:
Analisar os indicadores temporais.

====================================================
*/
-- ==========================================
-- ETAPA 6 - EVOLUÇÃO MENSAL
-- ==========================================

SELECT
    CAST(strftime('%Y', data_inversa) AS INTEGER) AS ano,
    CAST(strftime('%m', data_inversa) AS INTEGER) AS mes,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(acidente_fatal) AS acidentes_fatais,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY ano, mes
ORDER BY ano, mes;

SELECT
    data_inversa
FROM acidentes_prf_2025
LIMIT 10;

-- ==========================================
-- ETAPA 6 - EVOLUÇÃO MENSAL (Data corrigida)
-- ==========================================

SELECT

    CAST(
        strftime(
            '%Y',
            substr(data_inversa,7,4) || '-' ||
            substr(data_inversa,4,2) || '-' ||
            substr(data_inversa,1,2)
        ) AS INTEGER
    ) AS ano,

    CAST(
        strftime(
            '%m',
            substr(data_inversa,7,4) || '-' ||
            substr(data_inversa,4,2) || '-' ||
            substr(data_inversa,1,2)
        ) AS INTEGER
    ) AS mes,

    COUNT(*) AS total_acidentes,

    SUM(mortos) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY ano, mes

ORDER BY ano, mes;
