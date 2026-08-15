/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
7_tipo_acidente.sql

Etapa 7 – Tipo de Acidente

Objetivo:
Analisar a distribuição dos acidentes por tipo,
identificando quais ocorrências são mais frequentes
e quantos acidentes fatais existem em cada categoria.

====================================================
*/

-- ====================================================
-- ETAPA 7 - TIPO DE ACIDENTE
-- ====================================================

SELECT
    tipo_acidente,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY tipo_acidente
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC;