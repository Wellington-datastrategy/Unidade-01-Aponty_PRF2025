/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
9_fase_dia.sql

Etapa 9 – Fase do Dia

Objetivo:
Analisar a distribuição dos acidentes conforme
a fase do dia, identificando a quantidade de
ocorrências, acidentes fatais, total de mortos
e o percentual de acidentes fatais em cada período.

====================================================
*/

-- ====================================================
-- ETAPA 9 - FASE DO DIA
-- ====================================================

SELECT

    fase_dia,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    SUM(mortos) AS total_mortos,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY fase_dia

ORDER BY total_acidentes DESC;