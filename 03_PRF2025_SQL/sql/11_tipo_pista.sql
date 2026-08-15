/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
11_tipo_pista.sql

Etapa 11 – Tipo de Pista

Objetivo:
Analisar a distribuição dos acidentes conforme
o tipo de pista, identificando a quantidade de
ocorrências, acidentes fatais, total de mortos
e o percentual de acidentes fatais em cada tipo
de pista.

====================================================
*/

-- ====================================================
-- ETAPA 11 - TIPO DE PISTA
-- ====================================================

SELECT

    tipo_pista,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    SUM(mortos) AS total_mortos,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY tipo_pista

ORDER BY total_acidentes DESC;