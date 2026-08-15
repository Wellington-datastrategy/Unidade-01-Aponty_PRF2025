/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
1
3_analise_bivariada_tipo_pista_uf.sql

Etapa 13 – Consultas Bivariadas:
Tipo de Pista e UF

Objetivo:
Relacionar o Tipo de Pista e a Unidade da
Federação com a variável-alvo (acidente_fatal),
identificando as categorias com maior
percentual de acidentes fatais.

====================================================
*/

-- ====================================================
-- ETAPA 13.1 - TIPO DE PISTA x ALVO
-- ====================================================

SELECT

    tipo_pista,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY tipo_pista

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC;


-- ====================================================
-- ETAPA 13.2 - UF x ALVO
-- ====================================================

SELECT

    uf,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY uf

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC;