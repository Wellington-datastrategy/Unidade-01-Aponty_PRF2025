/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
10_condicao_meteorologica.sql

Etapa 10 – Condição Meteorológica

Objetivo:
Analisar a distribuição dos acidentes conforme
a condição meteorológica, identificando a
quantidade de ocorrências, acidentes fatais,
total de mortos e o percentual de acidentes
fatais em cada condição.

====================================================
*/

-- ====================================================
-- ETAPA 10 - CONDIÇÃO METEOROLÓGICA
-- ====================================================

SELECT

    condicao_metereologica,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    SUM(mortos) AS total_mortos,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY condicao_metereologica

ORDER BY total_acidentes DESC;