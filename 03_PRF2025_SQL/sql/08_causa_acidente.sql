/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Projeto:
PRF 2025

Arquivo:
8_causa_acidente.sql

Etapa 8 – Causa do Acidente

Objetivo:
Analisar as principais causas dos acidentes,
identificando a quantidade de ocorrências,
acidentes fatais, total de mortos e o percentual
de acidentes fatais por causa.

====================================================
*/

SELECT

    causa_acidente,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    SUM(mortos) AS total_mortos,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY causa_acidente

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC

LIMIT 20;