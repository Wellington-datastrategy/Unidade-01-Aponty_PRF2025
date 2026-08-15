/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
03_indicadores_gerais.sql

Objetivo:
Gerar os indicadores gerais da base de acidentes.

====================================================
*/
-- Total de Acidentes
SELECT
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais
FROM vw_acidentes_base;