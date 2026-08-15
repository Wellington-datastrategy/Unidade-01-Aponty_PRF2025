/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
projeto_completo.sql

Etapa 19 – Qualidade dos Dados

Objetivo:
Quantificar valores nulos e utilizar a função
COALESCE para padronizar a exibição dos dados
sem alterar a base original.

====================================================
*/
-- ====================================================
-- ETAPA 20.1 - QUANTIFICAÇÃO DE NULOS
-- ====================================================

SELECT

    SUM(CASE
            WHEN uf IS NULL THEN 1
            ELSE 0
        END) AS nulos_uf,

    SUM(CASE
            WHEN br IS NULL THEN 1
            ELSE 0
        END) AS nulos_br,

    SUM(CASE
            WHEN municipio IS NULL THEN 1
            ELSE 0
        END) AS nulos_municipio,

    SUM(CASE
            WHEN causa_acidente IS NULL THEN 1
            ELSE 0
        END) AS nulos_causa,

    SUM(CASE
            WHEN tipo_acidente IS NULL THEN 1
            ELSE 0
        END) AS nulos_tipo

FROM vw_acidentes_base;

-- ====================================================
-- ETAPA 20.2 - PADRONIZAÇÃO COM COALESCE
-- ====================================================

SELECT

    COALESCE(uf, 'NAO_INFORMADO') AS uf_tratada,

    COALESCE(
        CAST(br AS TEXT),
        'NAO_INFORMADO'
    ) AS br_tratada,

    COUNT(*) AS total_acidentes

FROM vw_acidentes_base

GROUP BY

    uf_tratada,
    br_tratada

ORDER BY total_acidentes DESC

LIMIT 30;