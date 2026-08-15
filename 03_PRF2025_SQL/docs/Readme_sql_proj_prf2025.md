/*
====================================================
MÓDULO 03 – SQL PARA ANÁLISE DE DADOS

Projeto:
Data Analytics com Dados Abertos da PRF

Arquivo:
projeto_completo.sql

Autor:
Wellington

Data:
Julho/2026

# Importação da Base no SQLite

## Fluxo de Importação

No SQLite, o arquivo CSV deve ser importado para uma tabela antes da execução das consultas SQL.

Após a importação, todas as consultas do projeto são executadas sobre a tabela `acidentes_prf_2025` e a View `vw_acidentes_base`.

### Procedimento utilizado neste projeto

1. Abrir o DB Browser for SQLite.
2. Criar ou abrir o banco de dados `proj_prf_sql.db`.
3. Importar o arquivo CSV para a tabela `acidentes_prf_2025`.
4. Executar o arquivo `sql/projeto_completo.sql`.
5. Conferir os resultados de cada etapa.
6. Exportar os resultados em formato CSV para a pasta `resultados`.

---

## Importação via SQLite CLI

Caso a importação seja realizada pela linha de comando, os comandos são:

```sql
sqlite3 prf_2025.sqlite

.mode csv

.separator ;

.import dados_brutos/acidentes2025.csv acidentes_prf_2025

SELECT COUNT(*) AS total_ocorrencias
FROM acidentes_prf_2025;
```

---

## Observações

- O separador utilizado na base é **ponto e vírgula (`;`)**.
- Após a importação, as consultas são executadas normalmente utilizando a tabela `acidentes_prf_2025`.
- No SQLite, algumas funções de data diferem das utilizadas no DuckDB. Neste projeto, a extração do mês foi realizada com `strftime()` e `substr()`, conforme implementado no script principal.

Fonte dos Dados:
Dados Abertos da Polícia Rodoviária Federal (PRF) – 2025

Base:
Acidentes de trânsito agrupados por ocorrência.

Problema:
Identificar fatores associados aos acidentes
com vítimas fatais.

Variável-Alvo:
acidente_fatal = 1 quando mortos >= 1;
caso contrário, acidente_fatal = 0.

Ferramenta:
SQLite (DB Browser for SQLite)

Instruções de Uso:

1. Abrir o banco de dados no DB Browser for SQLite.
2. Executar as consultas em blocos, seguindo
   a ordem das etapas do projeto.
3. Conferir os resultados antes de exportar
   os arquivos CSV.
4. Exportar os resultados para a pasta
   "resultados".

Observação:
Este script foi organizado em etapas para
facilitar a reprodução, manutenção e avaliação
do projeto.

====================================================
*/
# README_SQL.md

## Fonte dos Dados

- Base: Dados Abertos da Polícia Rodoviária Federal (PRF)
- Ano: 2025
- Unidade de análise: Acidentes agrupados por ocorrência

---

## Ferramenta e Versão

- Banco de Dados: SQLite
- Ferramenta: DB Browser for SQLite
- Versão: 3.46.1

---

## Como Executar o Script

1. Abrir o arquivo `proj_prf_sql.db` no DB Browser for SQLite.
2. Acessar a aba **Executar SQL**.
3. Abrir o arquivo `projeto_completo.sql`.
4. Executar as consultas na ordem em que estão documentadas.
5. Exportar os resultados em formato CSV para a pasta `resultados`.

---

## Arquivo Principal

```
sql/projeto_completo.sql
```

---

## Arquivos Gerados

### Auditoria

- lista_tabelas.csv
- estrutura_tabela_principal.csv
- total_registros.csv

### Views

- vw_acidentes.csv
- indicadores_uf_br.csv
- bivariada_tipo_acidente.csv

### Indicadores

- indicadores_gerais.csv
- indicadores_uf.csv
- indicadores_br.csv
- evolucao_mensal.csv

### Análises por Categoria

- tipo_acidente.csv
- causa_acidente.csv
- fase_dia.csv
- condicao_metereologica.csv
- tipo_pista.csv

### Consultas Bivariadas

- bivariada_tipo_acidente.csv
- bivariada_causa_acidente.csv
- bivariada_tipo_pista.csv
- bivariada_uf.csv

### Consultas Combinadas

- combinada_pista_fase.csv
- combinada_causa_tipo.csv

### Lift

- lift_tipo_acidente.csv
- lift_fase_dia.csv
- lift_causa_acidente.csv

### Bases Finais

- base_analitica_sql.csv
- base_modelavel_preliminar_sql.csv

---

## Número de Controle

- Total de ocorrências: **72.529**
- Total de acidentes fatais: **5.210**
- Total de mortos: **6.043**

---

## Observações

- O script foi organizado em etapas, seguindo a sequência apresentada nas aulas do Módulo 03.
- A View `vw_acidentes_base` foi utilizada como base para todas as análises.
- Os resultados foram exportados em formato CSV para reutilização em Excel, Python e Power BI.
- A Base Modelável não contém a variável `mortos`, evitando *data leakage* em modelos preditivos.
- As consultas utilizam comentários e cabeçalhos para facilitar a reprodução e compreensão do código.

## Fonte dos Dados

- Base: Dados Abertos da Polícia Rodoviária Federal (PRF)
- Ano: 2025
- Unidade de análise: Acidentes agrupados por ocorrência

---

## Ferramenta e Versão

- Banco de Dados: SQLite
- Ferramenta: DB Browser for SQLite
- Versão: 3.46.1

---

## Como Executar o Script

1. Abrir o arquivo `proj_prf_sql.db` no DB Browser for SQLite.
2. Acessar a aba **Executar SQL**.
3. Abrir o arquivo `projeto_completo.sql`.
4. Executar as consultas na ordem em que estão documentadas.
5. Exportar os resultados em formato CSV para a pasta `resultados`.

---

## Arquivo Principal

```
sql/projeto_completo.sql
```

---

## Arquivos Gerados

### Auditoria

- lista_tabelas.csv
- estrutura_tabela_principal.csv
- total_registros.csv

### Views

- vw_acidentes.csv
- indicadores_uf_br.csv
- bivariada_tipo_acidente.csv

### Indicadores

- indicadores_gerais.csv
- indicadores_uf.csv
- indicadores_br.csv
- evolucao_mensal.csv

### Análises por Categoria

- tipo_acidente.csv
- causa_acidente.csv
- fase_dia.csv
- condicao_metereologica.csv
- tipo_pista.csv

### Consultas Bivariadas

- bivariada_tipo_acidente.csv
- bivariada_causa_acidente.csv
- bivariada_tipo_pista.csv
- bivariada_uf.csv

### Consultas Combinadas

- combinada_pista_fase.csv
- combinada_causa_tipo.csv

### Lift

- lift_tipo_acidente.csv
- lift_fase_dia.csv
- lift_causa_acidente.csv

### Bases Finais

- base_analitica_sql.csv
- base_modelavel_preliminar_sql.csv

---

## Número de Controle

- Total de ocorrências: **72.529**
- Total de acidentes fatais: **5.210**
- Total de mortos: **6.043**

---

## Observações

- O script foi organizado em etapas, seguindo a sequência apresentada nas aulas do Módulo 03.
- A View `vw_acidentes_base` foi utilizada como base para todas as análises.
- Os resultados foram exportados em formato CSV para reutilização em Excel, Python e Power BI.
- A Base Modelável não contém a variável `mortos`, evitando *data leakage* em modelos preditivos.
- As consultas utilizam comentários e cabeçalhos para facilitar a reprodução e compreensão do código.

---

# Referências

## Dados e Metodologia

- Plano de Ensino da trilha **Data Analytics com Dados Abertos da PRF**.
- Dados Abertos da Polícia Rodoviária Federal (PRF) – Base de Acidentes 2025 agrupados por ocorrência.
- Dicionário de Variáveis da PRF.
- Metodologia **CRISP-DM (Cross Industry Standard Process for Data Mining)**, utilizada como referência para organização das etapas de análise.

---

## Documentação Técnica

- Documentação oficial do SQLite.
- Documentação do DB Browser for SQLite.

---

## Considerações Finais

Este projeto foi desenvolvido com base em dados oficiais da Polícia Rodoviária Federal (PRF), seguindo a metodologia CRISP-DM e as práticas apresentadas no Módulo 03 – SQL para Análise de Dados.

As consultas foram organizadas em etapas sequenciais, documentadas com comentários e cabeçalhos padronizados, visando garantir a reprodutibilidade, a rastreabilidade das análises e a facilidade de manutenção do código.

Todos os resultados foram exportados em formato CSV, permitindo sua reutilização em ferramentas como Excel, Python e Power BI.