/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
projeto_completo.sql

Autor:
Wellington

Data:
Julho/2026

Fonte dos Dados:
Dados Abertos da Polícia Rodoviária Federal (PRF) – 2025

Objetivo:
Desenvolver consultas SQL para auditoria,
análise exploratória, indicadores, consultas
bivariadas, Lift e preparação da base para
análises posteriores em Python.

====================================================
*/
-- Renomeando a tabela "dados_abertos_prf-datatran2025" para acidentes_prf_2025
ALTER TABLE "dados_abertos_prf-datatran2025"
RENAME TO acidentes_prf_2025;
/*
=========================================
01_auditoria.sql
Objetivo: conhecer a estrutura da base.
=========================================
*/

-- 1- Verificar a versão do SQLite
SELECT sqlite_version() AS versao_sqlite;

-- Listar as tabelas existentes
SELECT name
FROM sqlite_master
WHERE type = 'table';

-- 2- Estrutura da tabela principal
PRAGMA table_info(acidentes_prf_2025);

-- 3- Conferir a quantidade de registros
SELECT COUNT(*) as total_registros
FROM acidentes_prf_2025;


-- ============================================
-- ETAPA 2 - Criar a View Base Analítica
-- ============================================

-- Cria a view com a variável acidente_fatal
CREATE VIEW vw_acidentes_base AS
SELECT
    *,
    CASE
        WHEN CAST(mortos AS INTEGER) >= 1 THEN 1
        ELSE 0
    END AS acidente_fatal
FROM acidentes_prf_2025;
-- ===================================================
-- VALIDAÇÃO DA VIEW
-- ===================================================
-- Consulta para validar a VIEW - limite de 10 linhas
SELECT *
FROM vw_acidentes_base
LIMIT 10;

-- Confirmar se a coluna foi criada corretamente
SELECT acidente_fatal,
	count(*) AS Quantidade
FROM vw_acidentes_base
GROUP by acidente_fatal;

-- ==========================================
-- ETAPA 3 - INDICADORES GERAIS
-- ==========================================

SELECT
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais
FROM vw_acidentes_base;

-- ==========================================
-- ETAPA 4 - INDICADORES POR UF
-- ==========================================

SELECT uf,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*),2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY uf
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC, total_mortos DESC;

-- ==========================================
-- ETAPA 5 - RANKING DAS BRs
-- ==========================================

SELECT br,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(acidente_fatal) AS acidentes_fatais,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
WHERE br IS NOT NULL
GROUP BY br
HAVING COUNT(*) >= 100
ORDER BY total_mortos DESC
LIMIT 30;

-- ==========================================
-- ETAPA 6 - EVOLUÇÃO MENSAL
-- ==========================================

SELECT
    CAST(strftime('%Y', data_inversa) AS INTEGER) AS ano,
    CAST(strftime('%m', data_inversa) AS INTEGER) AS mes,
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(acidente_fatal) AS acidentes_fatais,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY ano, mes
ORDER BY ano, mes;

SELECT
    data_inversa
FROM acidentes_prf_2025
LIMIT 10;

-- ==========================================
-- ETAPA 6 - EVOLUÇÃO MENSAL (Data corrigida)
-- ==========================================

SELECT

    CAST(
        strftime(
            '%Y',
            substr(data_inversa,7,4) || '-' ||
            substr(data_inversa,4,2) || '-' ||
            substr(data_inversa,1,2)
        ) AS INTEGER
    ) AS ano,

    CAST(
        strftime(
            '%m',
            substr(data_inversa,7,4) || '-' ||
            substr(data_inversa,4,2) || '-' ||
            substr(data_inversa,1,2)
        ) AS INTEGER
    ) AS mes,

    COUNT(*) AS total_acidentes,

    SUM(mortos) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY ano, mes

ORDER BY ano, mes;

-- ==========================================
-- ETAPA 7 - TIPO DE ACIDENTE
-- ==========================================

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

-- ==========================================
-- ETAPA 8 - CAUSA DO ACIDENTE
-- ==========================================

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

-- ==========================================
-- ETAPA 9 - FASE DO DIA
-- ==========================================

SELECT fase_dia,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY fase_dia
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC;

-- ==========================================
-- ETAPA 10 - CONDIÇÃO METEOROLÓGICA
-- ==========================================

SELECT condicao_metereologica,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY condicao_metereologica
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC;

-- ==========================================
-- ETAPA 11 - TIPO DE PISTA
-- ==========================================

SELECT tipo_pista,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY tipo_pista
HAVING COUNT(*) >= 100
ORDER BY perc_fatais DESC;

-- ==========================================
-- ETAPA 12 - ANÁLISE BIVARIADA
-- ==========================================
SELECT
    tipo_pista,
    fase_dia,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS acidentes_fatais,
    SUM(mortos) AS total_mortos,
    ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY
    tipo_pista,
    fase_dia
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

-- ====================================================
-- ETAPA 14.1 - TIPO DE PISTA + FASE DO DIA
-- ====================================================

SELECT

    tipo_pista,

    fase_dia,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS cobertura_perc,

    ROUND(
        100.0 * SUM(acidente_fatal) /
        COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY

    tipo_pista,
    fase_dia

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC;


-- ====================================================
-- ETAPA 14.2 - CAUSA + TIPO DE ACIDENTE
-- ====================================================

SELECT

    causa_acidente,

    tipo_acidente,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS cobertura_perc,

    ROUND(
        100.0 * SUM(acidente_fatal) /
        COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

GROUP BY

    causa_acidente,
    tipo_acidente

HAVING COUNT(*) >= 100

ORDER BY perc_fatais DESC

LIMIT 30;
-- ====================================================
-- ETAPA 15 - LIFT POR TIPO DE ACIDENTE
-- ====================================================

WITH global AS (

    SELECT

        1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global

    FROM vw_acidentes_base

)

SELECT

    tipo_acidente AS categoria,

    COUNT(*) AS total_acidentes,

    SUM(CAST(mortos AS INTEGER)) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais,

    ROUND(
        (1.0 * SUM(acidente_fatal) / COUNT(*))
        / taxa_global,
        2
    ) AS lift

FROM vw_acidentes_base,

     global

GROUP BY

    categoria,
    taxa_global

HAVING COUNT(*) >= 100

ORDER BY lift DESC;

-- ====================================================
-- ETAPA 16.1 - VIEW POR UF E BR
-- ====================================================

DROP VIEW IF EXISTS vw_indicadores_uf_br;

CREATE VIEW vw_indicadores_uf_br AS

SELECT

    uf,

    br,

    COUNT(*) AS total_acidentes,

    SUM(CAST(mortos AS INTEGER)) AS total_mortos,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * SUM(acidente_fatal) / COUNT(*),
        2
    ) AS perc_fatais

FROM vw_acidentes_base

WHERE br IS NOT NULL

GROUP BY

    uf,
    br;

	-- ====================================================
-- ETAPA 16.2 - VIEW BIVARIADA POR TIPO DE ACIDENTE
-- ====================================================

CREATE VIEW vw_bivariada_tipo_acidente AS

WITH global AS (

    SELECT

        1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global

    FROM vw_acidentes_base

)

SELECT

    tipo_acidente AS categoria,

    COUNT(*) AS total_acidentes,

    SUM(acidente_fatal) AS acidentes_fatais,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS cobertura_perc,

    ROUND(
        100.0 * SUM(acidente_fatal) /
        COUNT(*),
        2
    ) AS perc_fatais,

    ROUND(
        (1.0 * SUM(acidente_fatal) / COUNT(*))
        / taxa_global,
        2
    ) AS lift

FROM vw_acidentes_base,
     global

GROUP BY

    categoria,
    taxa_global

HAVING COUNT(*) >= 100;

-- ====================================================
-- ETAPA 18.1 - BASE ANALÍTICA
-- ====================================================

SELECT

    data_inversa,

    dia_semana,

    horario,

    uf,

    br,

    municipio,

    causa_acidente,

    tipo_acidente,

    classificacao_acidente,

    fase_dia,

    condicao_metereologica,

    tipo_pista,

    tracado_via,

    uso_solo,

    mortos,

    acidente_fatal

FROM vw_acidentes_base;

	-- ====================================================
-- ETAPA 18.2 - BASE MODELÁVEL
-- ====================================================

SELECT

    uf,

    br,

    municipio,

    strftime(
        '%m',
        substr(data_inversa,7,4) || '-' ||
        substr(data_inversa,4,2) || '-' ||
        substr(data_inversa,1,2)
    ) AS mes,

    dia_semana,

    fase_dia,

    causa_acidente,

    tipo_acidente,

    condicao_metereologica,

    tipo_pista,

    tracado_via,

    uso_solo,

    acidente_fatal

FROM vw_acidentes_base;

    acidente_fatal,

FROM vw_acidentes_base;

-- ====================================================
-- ETAPA 20.1 - QUANTIFICAÇÃO DE NULOS
-- ====================================================

SELECT

    SUM(CASE
            WHEN uf IS NULL THEN 1
            ELSE 0
        END) AS nulos_uf,

    SUM(CASE
            WHEN br IS NULL THEN 1
            ELSE 0
        END) AS nulos_br,

    SUM(CASE
            WHEN municipio IS NULL THEN 1
            ELSE 0
        END) AS nulos_municipio,

    SUM(CASE
            WHEN causa_acidente IS NULL THEN 1
            ELSE 0
        END) AS nulos_causa,

    SUM(CASE
            WHEN tipo_acidente IS NULL THEN 1
            ELSE 0
        END) AS nulos_tipo

FROM vw_acidentes_base;

-- ====================================================
-- ETAPA 20.2 - PADRONIZAÇÃO COM COALESCE
-- ====================================================

SELECT

    COALESCE(uf, 'NAO_INFORMADO') AS uf_tratada,

    COALESCE(
        CAST(br AS TEXT),
        'NAO_INFORMADO'
    ) AS br_tratada,

    COUNT(*) AS total_acidentes

FROM vw_acidentes_base

GROUP BY

    uf_tratada,
    br_tratada

ORDER BY total_acidentes DESC

LIMIT 30;