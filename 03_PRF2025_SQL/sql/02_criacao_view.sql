/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
02_criacao_view.sql

Objetivo:
Criar uma View analítica contendo a variável
acidente_fatal.

====================================================
*/

CREATE VIEW vw_acidentes_base AS

SELECT *,

    CASE
        WHEN CAST(mortos AS INTEGER) >= 1 THEN 1
        ELSE 0
    END AS acidente_fatal
FROM acidentes_prf_2025;

-- ====================================================
-- Validação da View
-- ====================================================
SELECT

    acidente_fatal,

    COUNT(*) AS total

FROM vw_acidentes_base

GROUP BY acidente_fatal;