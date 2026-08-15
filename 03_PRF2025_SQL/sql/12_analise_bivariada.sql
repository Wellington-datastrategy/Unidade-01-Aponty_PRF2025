/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
12_analise_bivariada.sql

Etapa 12 – Análise Bivariada

Objetivo:
Relacionar o tipo de pista com a classificação
do acidente, identificando a quantidade de
ocorrências e o total de acidentes fatais em
cada combinação.

====================================================
*/

-- ====================================================
-- ETAPA 12 - ANÁLISE BIVARIADA
-- ====================================================

/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
projeto_completo.sql

Etapa 12 – Análise Bivariada

Objetivo:
Relacionar as variáveis Tipo de Acidente e
Causa do Acidente com a variável-alvo
(acidente_fatal), identificando as categorias
com maior percentual de acidentes fatais.

====================================================
*/

-- ====================================================
-- ETAPA 12.1 - TIPO DE ACIDENTE x ALVO
-- ====================================================

SELECT

    tipo_acidente,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY tipo_acidente

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC;


-- ====================================================
-- ETAPA 12.2 - CAUSA DO ACIDENTE x ALVO
-- ====================================================

SELECT

    causa_acidente,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY causa_acidente

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC

LIMIT 20;