/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
04_indicadores_uf.sql

Objetivo:
Analisar os indicadores por Unidade da Federação.

====================================================
*/

SELECT uf,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*),2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY uf
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC, total_mortos DESC;
