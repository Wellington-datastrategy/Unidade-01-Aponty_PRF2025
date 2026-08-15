# 📊 Unidade 01 — Aponty PRF2025

## Análise de Dados — Turma 03/2026

Repositório consolidado das quatro atividades desenvolvidas durante a **Unidade 01 do curso de Análise de Dados — Turma 03/2026**.

As atividades foram desenvolvidas em uma sequência progressiva, combinando o aprendizado de ferramentas de análise com a aplicação prática sobre dados reais de acidentes registrados pela **Polícia Rodoviária Federal (PRF) em 2025**.

O foco central da unidade é desenvolver a capacidade de **explorar dados, formular perguntas, produzir indicadores, identificar padrões, interpretar evidências e construir insights, conclusões ou hipóteses**, respeitando as limitações dos dados analisados.

---

# 🎯 Objetivo da Unidade

Desenvolver o raciocínio analítico por meio de uma experiência prática de análise de dados, utilizando diferentes ferramentas em etapas progressivas.

A trajetória pode ser representada da seguinte forma:

```text
Dados
  ↓
Exploração
  ↓
Perguntas analíticas
  ↓
Tratamento e consultas
  ↓
Indicadores
  ↓
Identificação de padrões
  ↓
Insights
  ↓
Conclusões e hipóteses
```

As ferramentas utilizadas ao longo da unidade são instrumentos para apoiar esse processo.

---

# 📚 Sequência das Atividades

## 01 — PRF 2025: Análise Exploratória

**Pasta:** `01_PRF2025_Analise-Exploratoria`

### Foco

Realizar uma primeira exploração dos dados de acidentes da PRF em 2025 utilizando **Excel e Tabelas Dinâmicas**.

A atividade trabalha a distribuição dos acidentes por diferentes dimensões e busca identificar padrões iniciais relacionados a:

* Unidade da Federação;
* evolução mensal;
* causas registradas;
* rodovias federais;
* tipos de acidente;
* acidentes fatais e não fatais;
* proporção de fatalidade;
* municípios com maior número de acidentes fatais.

### Base analisada

* **72.529 ocorrências**
* **30 campos originais**
* **5.210 acidentes fatais**
* **67.319 acidentes não fatais**
* **6.043 mortos**
* **7,18% de taxa global de fatalidade**

### Exemplos de achados

A síntese interpretativa identifica concentração territorial dos registros. Minas Gerais aparece com 9.570 ocorrências, seguida por Santa Catarina, com 8.186, e Paraná, com 7.630. As dez UFs com maiores volumes concentram aproximadamente 75% da base.

Esse resultado representa uma concentração em **volume absoluto de registros**, não uma medida direta de risco, pois a análise não controla fatores como extensão da malha rodoviária, fluxo de veículos ou exposição ao risco.

Outro achado é que maior frequência de ocorrências não significa necessariamente maior proporção de fatalidade.

A atividade também identifica perguntas para análises posteriores, como investigar quais características das ocorrências estão associadas às maiores proporções de fatalidade.

---

# 02 — Escola-Tech: Fundamentos de SQL

**Pasta:** `02_Escola-Tech_SQL`

### Foco

Desenvolver os fundamentos de **SQL e SQLite** por meio de um banco de dados acadêmico relacionado ao projeto Escola-Tech.

Esta atividade não utiliza os dados da PRF como objeto principal de análise.

Seu papel na Unidade 01 é desenvolver a competência técnica necessária para trabalhar posteriormente com bancos de dados e realizar consultas sobre dados reais.

### Principais operações trabalhadas

* criação de tabelas;
* importação de dados;
* auditoria;
* correção cadastral;
* inserção de registros;
* atualização de dados;
* limpeza;
* alteração da estrutura;
* consultas;
* classificação;
* geração de relatórios;
* documentação dos resultados.

### Tecnologias

* SQLite;
* DB Browser for SQLite;
* SQL;
* CSV;
* Git;
* GitHub.

---

# 03 — PRF 2025: Análise de Dados com SQL

**Pasta:** `03_PRF2025_SQL`

### Foco

Aplicar SQL sobre os dados reais de acidentes da PRF 2025 para investigar padrões e fatores associados à ocorrência de acidentes fatais.

A unidade de análise utilizada é a **ocorrência de acidente**.

Foi criada a variável-alvo:

```text
acidente_fatal = 1 quando mortos >= 1
acidente_fatal = 0 quando mortos = 0
```

### Principais análises

Foram desenvolvidas consultas envolvendo:

* indicadores gerais;
* Unidades da Federação;
* rodovias federais;
* evolução temporal;
* tipos de acidente;
* causas registradas;
* fase do dia;
* condições meteorológicas;
* tipo de pista;
* análises bivariadas;
* consultas combinadas;
* Lift;
* Views analíticas;
* qualidade dos dados;
* exportação de resultados.

### Exemplos de evidências encontradas

Na análise por tipo de acidente, atropelamentos de pedestres apresentaram proporção de fatalidade de **29,51%**, enquanto colisões frontais apresentaram **29,46%**.

Em relação à taxa global de 7,18%, os respectivos valores de Lift foram **4,11** e **4,10**.

Na análise por tipo de pista, foram observadas proporções de fatalidade de:

| Tipo de pista | Acidentes | Fatalidade |
| ------------- | --------: | ---------: |
| Simples       |    34.733 |      9,86% |
| Dupla         |    30.782 |      4,88% |
| Múltipla      |     7.014 |      4,06% |

Esses resultados mostram associações e diferenças observadas na base.

**Eles não permitem afirmar, isoladamente, que determinado tipo de acidente ou de pista seja a causa da maior fatalidade.**

### Exemplo de análise combinada

A combinação entre tipo de pista e fase do dia também revelou diferenças relevantes.

Entre os grupos analisados:

* pista simples + amanhecer: **14,64% de fatalidade; Lift 2,04**;
* pista simples + plena noite: **13,15%; Lift 1,83**;
* pista dupla + pleno dia: **3,17%; Lift 0,44**.

Esses resultados podem gerar novas perguntas analíticas sobre as características das ocorrências e os fatores associados à gravidade dos acidentes.

---

# 04 — PRF 2025: Preparação dos Dados com Python

**Pasta:** `04_PRF2025_Python`

### Foco

Preparar os dados de acidentes da PRF 2025 utilizando **Python**, criando bases estruturadas para análises exploratórias, dashboards e etapas posteriores de modelagem.

Nesta atividade, o foco principal está na **preparação e tratamento dos dados**, e não na apresentação de novos insights finais sobre os acidentes.

### Principais etapas

* importação dos dados;
* diagnóstico inicial;
* tratamento de valores nulos;
* padronização das variáveis;
* criação da variável-alvo;
* construção da base analítica;
* construção da base modelável;
* verificação de *data leakage*;
* exportação das bases;
* documentação das decisões de tratamento.

### Bases produzidas

**Base analítica**

* 72.529 registros;
* 44 variáveis;
* destinada a análises exploratórias e utilização em Power BI.

**Base modelável**

* 72.529 registros;
* 19 variáveis;
* preparada para modelagem;
* sem variáveis diretamente derivadas do desfecho que possam gerar *data leakage*.

Entre as variáveis excluídas da base modelável estão `mortos`, `feridos`, `feridos_leves`, `feridos_graves`, `total_vitimas`, `indice_gravidade` e `acidente_grave`.

---

# 🔎 O papel dos insights na Unidade

Nas atividades relacionadas à PRF, a análise não se limita à produção de tabelas ou consultas.

O objetivo é utilizar os resultados para responder perguntas como:

```text
O que está acontecendo?
        ↓
Onde acontece com maior frequência?
        ↓
Quais características apresentam maiores proporções?
        ↓
Quais padrões aparecem nos dados?
        ↓
O que esses padrões podem indicar?
        ↓
Que novas perguntas podem ser investigadas?
```

Um **insight** é uma interpretação relevante obtida a partir dos dados.

Uma **conclusão** deve estar sustentada pelas evidências disponíveis.

Uma **hipótese** representa uma explicação ou possibilidade que precisa ser investigada ou testada posteriormente.

---

# ⚠️ Cuidados na interpretação

As análises realizadas nesta unidade possuem caráter principalmente **descritivo e exploratório**.

Por isso:

* associação não significa causalidade;
* ranking absoluto não representa necessariamente risco;
* percentuais devem ser analisados juntamente com o volume de ocorrências;
* grupos muito pequenos podem produzir percentuais instáveis;
* diferenças entre categorias não explicam, por si só, por que determinado resultado ocorreu;
* análises mais robustas podem exigir variáveis adicionais de exposição e contexto.

Entre as variáveis que poderiam complementar futuras análises estão volume de tráfego, extensão da malha rodoviária, características da via e outras informações relacionadas à exposição ao risco.

---

# 🧠 Evolução do Processo Analítico

A sequência da Unidade 01 pode ser entendida como uma evolução do processo de análise:

```text
01 — Excel
Explorar e visualizar
        ↓
02 — SQL básico
Aprender a consultar e manipular dados
        ↓
03 — SQL + PRF
Investigar dados reais e produzir indicadores
        ↓
04 — Python
Preparar e estruturar bases para análises posteriores
```

O objetivo final é utilizar essas competências de forma integrada para transformar dados em informações e evidências capazes de apoiar decisões analíticas.

---

# 🛠️ Tecnologias Utilizadas

* Microsoft Excel;
* Tabelas Dinâmicas;
* SQL;
* SQLite;
* DB Browser for SQLite;
* Python;
* Pandas;
* NumPy;
* Matplotlib;
* Jupyter Notebook;
* Git;
* GitHub.

---

# 📁 Organização do Repositório

```text
Unidade-01-Aponty_PRF2025/
│
├── 01_PRF2025_Analise-Exploratoria/
│
├── 02_Escola-Tech_SQL/
│
├── 03_PRF2025_SQL/
│
├── 04_PRF2025_Python/
│
└── README.md
```

Cada pasta preserva os arquivos e a documentação da atividade correspondente.

A organização segue a sequência proposta para a Unidade 01 e permite visualizar a evolução do processo de análise.

---

# 🎓 Síntese da Unidade

A Unidade 01 proporcionou uma experiência prática de análise de dados utilizando diferentes ferramentas e, principalmente, diferentes formas de investigação.

O percurso desenvolvido parte da exploração inicial dos dados, passa pela aprendizagem dos fundamentos de SQL, avança para consultas e análises sobre dados reais da PRF 2025 e chega à preparação programática dos dados com Python.

O principal resultado da unidade é a compreensão de que:

> **ferramentas são meios; o objetivo da análise de dados é produzir evidências capazes de responder perguntas relevantes.**

Nesse processo, os dados da PRF 2025 foram utilizados para explorar padrões, calcular indicadores, investigar associações e formular novas perguntas analíticas, sempre considerando as limitações e o contexto da base.

---

## 👨‍💻 Autor

**Wellington Lima**

Curso: **Análise de Dados**
Turma: **03/2026**

---

## 📌 Finalidade do Repositório

Este repositório consolida as quatro atividades desenvolvidas durante a **Unidade 01 — Aponty PRF2025**, reunindo os materiais produzidos ao longo da sequência de aprendizagem para acompanhamento e avaliação acadêmica.
