
# Projeto PRF 2025 — Preparação dos Dados

## Objetivo

Preparar os dados de acidentes da PRF 2025 para análise exploratória, desenvolvimento de dashboards no Power BI e construção de uma árvore de decisão explicável.

## Variável-alvo

`acidente_fatal = 1` quando `mortos >= 1`; caso contrário, `acidente_fatal = 0`.

## Bases geradas

- `..\dados_tratados\base_analitica_prf_2025.csv`: base completa para análises exploratórias (EDA) e Power BI.
- `..\dados_tratados\base_modelavel_prf_2025.csv`: base destinada à modelagem, preparada sem *data leakage*.

## Observação metodológica

A base modelável exclui as variáveis `mortos`, `feridos`, `feridos_leves`, `feridos_graves`, `total_vitimas`, `indice_gravidade`, `acidente_grave` e demais variáveis diretamente derivadas do desfecho, reduzindo o risco de *data leakage* durante o treinamento dos modelos de Machine Learning.

## Resultados

Base analítica:
72.529 registros
44 variáveis

Base modelável:
72.529 registros
19 variáveis
Taxa global de acidentes fatais:
7,18%

## Tecnologias utilizadas

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- Git
- GitHub

  ## Estrutura do projeto

dados_brutos/
dados_tratados/
notebooks/
logs/

## Principais etapas desenvolvidas

✔ Importação dos dados

✔ Tratamento de valores nulos

✔ Padronização das variáveis

✔ Criação da variável-alvo

✔ Construção da base analítica

✔ Construção da base modelável

✔ Verificação de Data Leakage

✔ Exportação das bases

✔ Documentação do projeto
