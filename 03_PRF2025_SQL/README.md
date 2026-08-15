# Análise de Dados PRF 2025 --- SQL

## Módulo 03 -- SQL para Análise de Dados

Projeto desenvolvido a partir dos **Dados Abertos da Polícia Rodoviária
Federal (PRF)**, com foco na análise de acidentes de trânsito
registrados em 2025.

O projeto utiliza **SQL e SQLite** para realizar auditoria, exploração
dos dados, criação de indicadores, análises bivariadas, consultas
combinadas, cálculo de Lift, criação de Views, avaliação da qualidade
dos dados, exportação de resultados e preparação de bases para análises
posteriores.

A unidade de análise utilizada é a **ocorrência de acidente**.

------------------------------------------------------------------------

## 🎯 Objetivo

Analisar os acidentes registrados pela PRF em 2025 e identificar padrões
e fatores associados à ocorrência de acidentes fatais.

A variável-alvo utilizada no projeto é:

``` text
acidente_fatal = 1 quando mortos >= 1
acidente_fatal = 0 quando mortos = 0
```

O objetivo analítico é identificar padrões e associações presentes nos
dados. Os resultados não devem ser interpretados, isoladamente, como
evidência de causalidade.

------------------------------------------------------------------------

## 📊 Fonte dos Dados

-   **Fonte:** Dados Abertos da Polícia Rodoviária Federal (PRF)
-   **Ano:** 2025
-   **Base:** Acidentes agrupados por ocorrência
-   **Total de registros analisados:** 72.529 ocorrências

A base original foi preservada na pasta:

``` text
dados_brutos/
```

A preservação da base original permite manter a rastreabilidade e
facilita a reprodução das análises.

------------------------------------------------------------------------

## 🛠️ Tecnologias e Ferramentas

-   SQLite
-   DB Browser for SQLite
-   SQL
-   Git
-   GitHub
-   CSV

Os resultados das consultas foram exportados em CSV para possibilitar
sua reutilização em ferramentas como **Excel, Python e Power BI**.

------------------------------------------------------------------------

## 📁 Estrutura do Projeto

``` text
Modulo3_AD_PRF2025_Sql/
│
├── dados_brutos/
│   └── dados_abertos_prf-datatran2025.csv
│
├── docs/
│   └── Readme_sql_proj_prf2025.md
│
├── resultados/
│   └── Resultados das consultas em formato CSV
│
├── sql/
│   ├── 01_auditoria.sql
│   ├── 02_criacao_view.sql
│   ├── 03_indicadores_gerais.sql
│   ├── 04_indicadores_uf.sql
│   ├── 05_indicadores_br.sql
│   ├── 06_serie_temporal.sql
│   ├── 07_tipo_acidente.sql
│   ├── 08_causa_acidente.sql
│   ├── 09_fase_dia.sql
│   ├── 10_condicao_meteorologica.sql
│   ├── 11_tipo_pista.sql
│   ├── 12_analise_bivariada.sql
│   ├── 13_analise_bivariada_tipo_pista_uf.sql
│   ├── 14_consulta_combinada.sql
│   ├── 15_indicador_com_lift.sql
│   ├── 16_views_analiticas.sql
│   ├── 17_exportacao_resultado.sql
│   ├── 18_resultados_bivariada_tipo_acidente.sql
│   ├── 19_exportacao_base_analitica.sql
│   └── 20_qualidade_dados_coalesce.sql
│
├── proj_prf_sql.db
├── .gitignore
└── README.md
```

------------------------------------------------------------------------

# 🔎 Desenvolvimento das Análises

O projeto foi desenvolvido de forma sequencial, seguindo as atividades
propostas no Módulo 03.

## Etapa 01 --- Auditoria da Base

A primeira etapa teve como objetivo verificar a estrutura inicial da
base e validar a quantidade de registros.

Foram realizadas consultas para:

-   verificar a estrutura da tabela principal;
-   identificar os campos disponíveis;
-   verificar a quantidade total de registros;
-   realizar controles iniciais de consistência.

A base analisada possui:

``` text
72.529 ocorrências
```

Script:

``` text
sql/01_auditoria.sql
```

------------------------------------------------------------------------

## Etapa 02 --- Criação da View Analítica

Foi criada a View:

``` text
vw_acidentes_base
```

A View funciona como uma camada analítica entre a tabela original e as
consultas desenvolvidas nas etapas seguintes.

Nessa camada foi criada a variável-alvo:

``` sql
CASE
    WHEN mortos >= 1 THEN 1
    ELSE 0
END AS acidente_fatal
```

A utilização da View evita a repetição da mesma transformação em
diferentes consultas.

Script:

``` text
sql/02_criacao_view.sql
```

------------------------------------------------------------------------

## Etapa 03 --- Indicadores Gerais

Foram calculados indicadores gerais da base, incluindo:

-   total de acidentes;
-   total de mortos;
-   total de acidentes fatais;
-   percentual de acidentes fatais.

Essa etapa estabelece uma visão geral da base antes das análises
segmentadas.

Script:

``` text
sql/03_indicadores_gerais.sql
```

------------------------------------------------------------------------

## Etapa 04 --- Indicadores por UF

Foram produzidos indicadores agrupados por Unidade da Federação.

As consultas permitem comparar:

-   total de acidentes;
-   acidentes fatais;
-   total de mortos;
-   percentual de acidentes fatais.

É importante diferenciar **ranking por volume** de **ranking por
percentual**, pois cada um responde a uma pergunta analítica diferente.

Script:

``` text
sql/04_indicadores_uf.sql
```

------------------------------------------------------------------------

## Etapa 05 --- Indicadores por BR

Foram produzidos indicadores agrupados por rodovia federal.

Foram consideradas métricas como:

-   total de acidentes;
-   total de mortos;
-   acidentes fatais;
-   percentual de acidentes fatais.

Quando aplicável, foram utilizados critérios mínimos de volume para
reduzir interpretações baseadas em grupos com poucas ocorrências.

Script:

``` text
sql/05_indicadores_br.sql
```

------------------------------------------------------------------------

## Etapa 06 --- Série Temporal

Foi realizada a análise da evolução das ocorrências ao longo do tempo.

A análise permite observar:

-   volume mensal de acidentes;
-   comportamento dos acidentes fatais;
-   distribuição das ocorrências ao longo do período analisado.

Script:

``` text
sql/06_serie_temporal.sql
```

------------------------------------------------------------------------

## Etapa 07 --- Tipo de Acidente

Foram analisados os acidentes agrupados por:

``` text
tipo_acidente
```

Para cada categoria foram calculados:

-   total de acidentes;
-   acidentes fatais;
-   total de mortos;
-   percentual de acidentes fatais.

Foi utilizado o critério mínimo de:

``` text
COUNT(*) >= 100
```

para reduzir a influência de categorias com baixo volume de ocorrências.

Script:

``` text
sql/07_tipo_acidente.sql
```

------------------------------------------------------------------------

## Etapa 08 --- Causa do Acidente

Foram analisadas as principais causas dos acidentes.

Para cada categoria foram calculados:

-   total de acidentes;
-   acidentes fatais;
-   total de mortos;
-   percentual de acidentes fatais.

A análise utiliza critérios de volume e ordenação para destacar
categorias relevantes.

É importante observar que `causa_acidente` é uma classificação presente
na base e não deve ser interpretada, isoladamente, como prova de
causalidade estatística.

Script:

``` text
sql/08_causa_acidente.sql
```

------------------------------------------------------------------------

## Etapa 09 --- Fase do Dia

Foram analisados os acidentes segundo a variável:

``` text
fase_dia
```

A consulta permite comparar a distribuição das ocorrências e a proporção
de acidentes fatais entre diferentes períodos do dia.

Script:

``` text
sql/09_fase_dia.sql
```

------------------------------------------------------------------------

## Etapa 10 --- Condição Meteorológica

Foram analisados os acidentes segundo:

``` text
condicao_meteorologica
```

Foram calculados indicadores de volume e fatalidade para as categorias
existentes na base.

A análise permite observar diferenças entre condições meteorológicas sem
estabelecer relação causal.

Script:

``` text
sql/10_condicao_meteorologica.sql
```

------------------------------------------------------------------------

## Etapa 11 --- Tipo de Pista

Foram analisados os acidentes segundo:

``` text
tipo_pista
```

A atividade contempla a comparação entre categorias como:

-   simples;
-   dupla;
-   múltipla.

Foram calculados:

-   total de acidentes;
-   acidentes fatais;
-   percentual de acidentes fatais.

A interpretação deve considerar simultaneamente a proporção fatal e o
volume de ocorrências.

Script:

``` text
sql/11_tipo_pista.sql
```

------------------------------------------------------------------------

## Etapa 12 --- Análise Bivariada

Foram realizadas consultas bivariadas envolvendo fatores explicativos e
a variável-alvo.

Entre as análises realizadas estão:

-   tipo de acidente × alvo;
-   causa do acidente × alvo.

As consultas utilizam métricas como:

``` text
COUNT(*)
SUM(acidente_fatal)
perc_fatais
```

Quando aplicável, foi utilizado o critério:

``` text
COUNT(*) >= 100
```

Script:

``` text
sql/12_analise_bivariada.sql
```

------------------------------------------------------------------------

## Etapa 13 --- Consultas Bivariadas: Pista, Traçado e UF

Foi realizada uma atividade específica envolvendo:

### Tipo de Pista e Traçado da Via

A consulta permite comparar simples, dupla e múltipla e observar se os
resultados fazem sentido do ponto de vista operacional.

### UF com Percentual Fatal

Foi produzido um ranking das Unidades da Federação segundo o percentual
de acidentes fatais.

A interpretação considera que:

``` text
Ranking por percentual
```

e:

``` text
Ranking por volume
```

respondem a perguntas diferentes.

Script:

``` text
sql/13_analise_bivariada_tipo_pista_uf.sql
```

------------------------------------------------------------------------

## Etapa 14 --- Consultas Combinadas

Foram realizadas consultas utilizando dois fatores explicativos
simultaneamente.

Entre as combinações analisadas estão:

``` text
tipo_pista + fase_dia
```

e:

``` text
causa_acidente + tipo_acidente
```

A atividade busca identificar combinações com:

-   alta proporção de acidentes fatais;
-   volume de ocorrências razoável;
-   cobertura suficiente para interpretação.

Script:

``` text
sql/14_consulta_combinada.sql
```

------------------------------------------------------------------------

## Etapa 15 --- Indicador com Lift

Foi introduzido o conceito de **Lift** para comparar a proporção de
acidentes fatais de uma determinada categoria com a taxa global de
acidentes fatais.

A lógica geral é:

``` text
Lift =
taxa de fatalidade da categoria
/
taxa global de fatalidade
```

A interpretação utilizada é:

  Lift         Interpretação
  ------------ ----------------------------------------
  `Lift > 1`   Proporção fatal acima da média global
  `Lift = 1`   Proporção próxima da média global
  `Lift < 1`   Proporção fatal abaixo da média global

O Lift não mede causalidade.

O indicador deve ser interpretado junto com o volume de ocorrências e a
cobertura da categoria, evitando conclusões baseadas apenas em
percentuais extremos.

Script:

``` text
sql/15_indicador_com_lift.sql
```

------------------------------------------------------------------------

## Etapa 16 --- Views Analíticas

Foram criadas Views para facilitar a reutilização das consultas e
indicadores.

Entre as estruturas utilizadas estão análises por:

-   UF;
-   BR;
-   tipo de acidente;
-   demais dimensões analíticas utilizadas no projeto.

A utilização de Views contribui para:

-   organização;
-   reutilização;
-   padronização;
-   manutenção da camada analítica.

Script:

``` text
sql/16_views_analiticas.sql
```

------------------------------------------------------------------------

## Etapa 17 --- Exportação dos Resultados

Os resultados das consultas foram preparados para exportação em formato
CSV.

Os arquivos são armazenados na pasta:

``` text
resultados/
```

Os resultados exportados podem ser reutilizados posteriormente em:

-   Excel;
-   Python;
-   Power BI.

Script:

``` text
sql/17_exportacao_resultado.sql
```

------------------------------------------------------------------------

## Etapa 18 --- Resultados da Análise Bivariada

Foi realizada a organização e exportação dos resultados da análise
bivariada por tipo de acidente.

Arquivo relacionado:

``` text
resultados/18_resultados_bivariada_tipo_acidente.csv
```

Script:

``` text
sql/18_resultados_bivariada_tipo_acidente.sql
```

------------------------------------------------------------------------

## Etapa 19 --- Exportação da Base Analítica e Base Modelável

Foram preparadas bases com objetivos diferentes.

### Base Analítica Completa

A base analítica contém a variável:

``` text
mortos
```

porque ela é necessária para análises descritivas e exploratórias
relacionadas à gravidade dos acidentes.

Entre os campos considerados estão:

``` text
data_inversa
dia_semana
horario
uf
br
municipio
causa_acidente
tipo_acidente
classificacao_acidente
fase_dia
condicao_meteorologica
tipo_pista
tracado_via
uso_solo
mortos
acidente_fatal
```

### Base Modelável Preliminar

A base modelável preliminar não contém:

``` text
mortos
```

A exclusão busca evitar **data leakage**, pois `mortos` participa
diretamente da definição da variável-alvo `acidente_fatal`.

A preparação final da base modelável será realizada posteriormente em
Python.

Script:

``` text
sql/19_exportacao_base_analitica.sql
```

------------------------------------------------------------------------

## Etapa 20 --- Qualidade dos Dados e COALESCE

Foi realizada uma etapa específica para avaliação da qualidade dos
dados.

Foram quantificados valores nulos em campos relevantes, incluindo:

-   UF;
-   BR;
-   município;
-   causa do acidente;
-   tipo de acidente.

Também foi utilizada a função:

``` sql
COALESCE()
```

para substituição controlada de valores ausentes nas consultas.

Exemplo:

``` sql
COALESCE(uf, 'NAO_INFORMADO')
```

A substituição realizada em consulta não altera a base bruta original.

Script:

``` text
sql/20_qualidade_dados_coalesce.sql
```

------------------------------------------------------------------------

# 🧮 Variável-Alvo

A variável `acidente_fatal` foi criada a partir da quantidade de mortos:

``` sql
CASE
    WHEN mortos >= 1 THEN 1
    ELSE 0
END AS acidente_fatal
```

Sua interpretação é:

  Valor   Significado
  ------- -----------------------------------
  `1`     Acidente com pelo menos uma morte
  `0`     Acidente sem mortes

Essa variável foi utilizada nas análises de proporção, comparações entre
categorias e cálculo de Lift.

------------------------------------------------------------------------

# 📈 Análise com Lift

O Lift compara a taxa de fatalidade de uma categoria com a taxa global
da base.

A fórmula conceitual é:

``` text
Lift =
taxa de fatalidade da categoria
--------------------------------
taxa global de fatalidade
```

Interpretação:

``` text
Lift > 1 → acima da taxa global
Lift = 1 → próxima da taxa global
Lift < 1 → abaixo da taxa global
```

O indicador auxilia na identificação de categorias que apresentam
proporção de fatalidade acima ou abaixo da média global.

Entretanto:

> **Lift não representa causalidade.**

Um Lift elevado indica uma proporção relativa maior que a referência
global, mas não demonstra que determinado fator seja responsável pelo
aumento da fatalidade.

------------------------------------------------------------------------

# 🗃️ Resultados Exportados

Os resultados das consultas foram exportados para:

``` text
resultados/
```

Entre os arquivos gerados estão:

``` text
01_auditoria.csv
12_analise_bivariada_causa_acidente_alvo.csv
13_bivariada_tipo_pista_uf.csv
14_consulta_combinada.csv
15_indicador_com_lift.csv
17_exportacao_resultado.csv
18_resultados_bivariada_tipo_acidente.csv
19_exportacao_base_analitica.csv
20_qualidade_dados_coalesce.csv
acidentes_prf_2025.csv
analise_bivariada.csv
br.csv
causa_acidente.csv
condicao_meteorologica.csv
estrutura_tb_principal.csv
fase_dia.csv
indicadores_gerais.csv
inversao_data.csv
lift.csv
lista_tabelas.csv
serie_temporal.csv
tipo_acidente.csv
tipo_pista.csv
total_registros.csv
uf.csv
versao_sqlite.csv
vw_acidentes.csv
```

Os arquivos CSV permitem a reutilização dos resultados em outras
ferramentas de análise.

------------------------------------------------------------------------

# 🧠 Base Analítica e Base Modelável

As duas bases possuem finalidades diferentes.

## Base Analítica

A base analítica mantém `mortos` para permitir análises descritivas,
exploratórias e de gravidade.

## Base Modelável Preliminar

A base modelável não utiliza `mortos` como variável explicativa,
evitando vazamento de informação relacionado à definição do alvo.

A preparação final para Machine Learning será realizada em Python.

Essa separação representa uma boa prática importante no fluxo de análise
de dados:

``` text
Base para análise descritiva
          ≠
Base para modelagem preditiva
```

------------------------------------------------------------------------

# 🔬 Qualidade dos Dados

A qualidade foi avaliada principalmente por meio de:

-   identificação de valores nulos;
-   verificação da estrutura da tabela;
-   conferência do número de registros;
-   padronização de campos nas consultas;
-   utilização de `COALESCE`;
-   preservação da base original.

O tratamento foi realizado preferencialmente na camada analítica,
preservando os dados brutos.

------------------------------------------------------------------------

# 📤 Exportação e Reutilização

A exportação em CSV foi utilizada como mecanismo de integração com
outras ferramentas.

O fluxo previsto é:

``` text
SQLite
   │
   ├── CSV → Excel
   │
   ├── CSV → Python
   │
   └── CSV → Power BI
```

Essa organização permite que os resultados produzidos no SQL sejam
reutilizados em etapas posteriores do projeto.

------------------------------------------------------------------------

# 🔁 Reprodutibilidade

O projeto foi organizado para permitir que outro usuário compreenda e
reproduza o fluxo analítico.

A organização considera:

-   dados brutos;
-   scripts SQL;
-   resultados;
-   documentação;
-   banco SQLite;
-   controle de versão com Git.

Os scripts SQL foram numerados e possuem cabeçalhos e comentários para
facilitar a compreensão.

O fluxo geral é:

``` text
Dados brutos
     ↓
Auditoria
     ↓
View analítica
     ↓
Indicadores
     ↓
Análises segmentadas
     ↓
Análises bivariadas
     ↓
Consultas combinadas
     ↓
Lift
     ↓
Views analíticas
     ↓
Qualidade dos dados
     ↓
Exportação
     ↓
Base analítica
     ↓
Base modelável preliminar
```

------------------------------------------------------------------------

# 💡 Boas Práticas Adotadas

Durante o desenvolvimento foram aplicadas boas práticas de análise e
organização de dados:

-   preservação dos dados brutos;
-   separação entre dados, scripts, documentação e resultados;
-   scripts SQL numerados;
-   cabeçalhos descritivos;
-   comentários nos scripts;
-   utilização de Views;
-   validação da quantidade de registros;
-   aplicação de critérios mínimos de volume;
-   tratamento controlado de valores nulos;
-   exportação dos resultados;
-   separação entre base analítica e base modelável;
-   prevenção de data leakage;
-   utilização de Git e GitHub;
-   documentação em Markdown.

------------------------------------------------------------------------

# ▶️ Como Reproduzir o Projeto

## 1. Clonar o repositório

``` bash
git clone https://github.com/Wellington-datastrategy/Modulo3_AD_PRF2025_SQL.git
```

Entrar na pasta:

``` bash
cd Modulo3_AD_PRF2025_SQL
```

------------------------------------------------------------------------

## 2. Abrir o banco

Abra:

``` text
proj_prf_sql.db
```

utilizando o **DB Browser for SQLite**.

------------------------------------------------------------------------

## 3. Acessar o SQL

No DB Browser for SQLite, abra a aba:

``` text
Execute SQL
```

------------------------------------------------------------------------

## 4. Executar os scripts

Os scripts estão organizados na pasta:

``` text
sql/
```

A recomendação é executar as etapas na ordem numérica:

``` text
01 → 02 → 03 → ... → 20
```

Algumas etapas dependem das Views e estruturas criadas anteriormente.

------------------------------------------------------------------------

## 5. Conferir os resultados

Antes de exportar os resultados, conferir:

-   quantidade de registros;
-   nomes das colunas;
-   valores calculados;
-   filtros;
-   agrupamentos;
-   critérios mínimos;
-   coerência dos resultados.

------------------------------------------------------------------------

## 6. Exportar

Os resultados devem ser armazenados em:

``` text
resultados/
```

Utilizar nomes claros e descritivos para facilitar a reutilização.

------------------------------------------------------------------------

# 📚 Documentação Complementar

A documentação complementar do projeto está disponível em:

``` text
docs/Readme_sql_proj_prf2025.md
```

Esse documento apresenta informações adicionais sobre:

-   fonte dos dados;
-   ferramenta utilizada;
-   execução do script;
-   arquivos gerados;
-   observações;
-   controle dos resultados;
-   referências.

------------------------------------------------------------------------

# 📖 Metodologia e Referências

## Dados e Metodologia

O projeto utiliza como referências:

-   Dados Abertos da Polícia Rodoviária Federal;
-   Dicionário de variáveis da PRF;
-   Plano de Ensino da trilha Data Analytics com Dados Abertos da PRF;
-   Conteúdo e orientações do Módulo 03 -- SQL para Análise de Dados;
-   metodologia CRISP-DM.

## Documentação Técnica

-   Documentação oficial do SQLite;
-   Documentação do DB Browser for SQLite.

A utilização de dados oficiais, metodologia estruturada e documentação
técnica contribui para a reprodutibilidade e o rigor do projeto.

------------------------------------------------------------------------

# 🎓 Competências Demonstradas

## SQL

-   `SELECT`;
-   `WHERE`;
-   `GROUP BY`;
-   `HAVING`;
-   `ORDER BY`;
-   `LIMIT`;
-   `CASE`;
-   `COUNT`;
-   `SUM`;
-   `ROUND`;
-   `COALESCE`;
-   funções de janela;
-   CTEs;
-   Views;
-   consultas agregadas;
-   análises bivariadas;
-   consultas combinadas;
-   cálculo de indicadores.

## Análise de Dados

-   auditoria de dados;
-   análise exploratória;
-   análise descritiva;
-   análise temporal;
-   análise por categorias;
-   análise bivariada;
-   análise de associação;
-   interpretação de indicadores;
-   avaliação de volume;
-   avaliação de cobertura;
-   identificação de valores nulos.

## Organização e Preparação de Dados

-   organização de dados brutos;
-   criação de camada analítica;
-   preparação de bases;
-   exportação para CSV;
-   separação entre base analítica e modelável;
-   prevenção de data leakage;
-   preparação para continuidade em Python.

## Controle de Versão

-   Git;
-   GitHub;
-   organização de repositório;
-   documentação em Markdown;
-   estruturação de projeto para reprodutibilidade.

------------------------------------------------------------------------

# 🔗 Integração com Outras Tecnologias

Os resultados deste projeto foram estruturados para permitir
continuidade em outras ferramentas.

``` text
                    SQL / SQLite
                         │
          ┌──────────────┼──────────────┐
          ▼              ▼              ▼
        Excel          Python        Power BI
          │              │              │
          └──────────────┼──────────────┘
                         ▼
                Análises posteriores
```

A base modelável preliminar poderá ser utilizada posteriormente em
Python para:

-   limpeza adicional;
-   tratamento de categorias;
-   codificação de variáveis;
-   análise exploratória;
-   seleção de variáveis;
-   preparação para modelagem;
-   técnicas de Machine Learning.

------------------------------------------------------------------------

# ⚠️ Limitações da Análise

Os resultados devem ser interpretados considerando as limitações dos
dados e da abordagem.

### 1. Associação não significa causalidade

Percentuais elevados ou valores de Lift acima de 1 não comprovam relação
causal.

### 2. Volume de ocorrências

Categorias com poucas ocorrências podem apresentar percentuais extremos.

Por esse motivo, algumas consultas utilizam:

``` text
COUNT(*) >= 100
```

### 3. Exposição ao risco

O número absoluto de acidentes não controla fatores como:

-   volume de tráfego;
-   extensão da rodovia;
-   quantidade de veículos;
-   características específicas da via;
-   exposição ao risco.

Portanto, rankings por volume devem ser interpretados considerando o
contexto dos dados disponíveis.

### 4. Valores ausentes

A presença de valores nulos ou categorias não informadas pode afetar
determinadas análises.

O projeto realiza a quantificação e a padronização desses valores na
camada analítica.

------------------------------------------------------------------------

# 📌 Considerações Finais

O projeto demonstra a utilização do SQL como ferramenta de análise de
dados, indo além de consultas isoladas.

O fluxo desenvolvido contempla:

``` text
Auditoria
   ↓
Exploração
   ↓
Transformação
   ↓
Indicadores
   ↓
Análises bivariadas
   ↓
Consultas combinadas
   ↓
Lift
   ↓
Views
   ↓
Qualidade dos dados
   ↓
Exportação
   ↓
Preparação de bases
```

A separação entre dados brutos, scripts SQL, resultados e documentação
permite maior:

-   rastreabilidade;
-   organização;
-   reprodutibilidade;
-   clareza;
-   reutilização dos resultados.

O projeto estabelece uma base para continuidade das análises utilizando
**Python, Power BI e técnicas de Machine Learning**.

------------------------------------------------------------------------

# 👤 Autor

**Wellington Lima**

Projeto desenvolvido no contexto da formação em **Análise e
Desenvolvimento de Sistemas / Análise de Dados**, utilizando dados
públicos da Polícia Rodoviária Federal.

------------------------------------------------------------------------

# 📌 Status do Projeto

**Concluído --- Módulo 03: SQL para Análise de Dados**

O projeto está versionado no GitHub e estruturado para continuidade em
etapas posteriores de análise de dados utilizando Python, Power BI e
técnicas de modelagem.

------------------------------------------------------------------------

## 🔗 Repositório

https://github.com/Wellington-datastrategy/Modulo3_AD_PRF2025_SQL
