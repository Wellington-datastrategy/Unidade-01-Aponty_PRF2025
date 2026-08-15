/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
16_views_analiticas.sql

Etapa 16 – Views Analíticas

Objetivo:
Criar Views para reutilização das consultas
analíticas desenvolvidas ao longo do projeto.

====================================================
*/
-- ====================================================
-- ETAPA 16.1 - VIEW POR UF E BR
-- ====================================================

DROP VIEW IF EXISTS vw_indicadores_uf_br;

CREATE VIEW vw_indicadores_uf_br AS

SELECT

    uf,

    br,

    COUNT(*) AS total_acidentes,

    SUM(CAST(mortos AS INTEGER)) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

WHERE br IS NOT NULL

GROUP BY

    uf,
    br;

	-- ====================================================
-- ETAPA 16.2 - VIEW BIVARIADA POR TIPO DE ACIDENTE
-- ====================================================

CREATE VIEW vw_bivariada_tipo_acidente AS

WITH global AS (

    SELECT

        1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global

    FROM vw_acidentes_base

)

SELECT

    tipo_acidente AS categoria,

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

HAVING COUNT(*) >= 100;