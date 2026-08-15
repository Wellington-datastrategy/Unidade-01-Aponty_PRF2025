/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Arquivo:
projeto_completo.sql

Etapa 18 – Base Analítica e Base Modelável

Objetivo:
Gerar a Base Analítica Completa e a Base
Modelável Preliminar para utilização em
análises descritivas e modelos preditivos.

====================================================
*/
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