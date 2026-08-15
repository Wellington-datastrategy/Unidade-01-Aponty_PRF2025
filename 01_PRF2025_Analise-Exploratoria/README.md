# Análise Exploratória dos Acidentes PRF 2025

Projeto acadêmico de análise exploratória com Excel dos dados de acidentes registrados pela Polícia Rodoviária Federal (PRF) em 2025.

## Objetivo

Explorar a distribuição dos acidentes, com foco em acidentes fatais, identificando padrões iniciais por unidade da federação, mês, causas registradas, rodovias e tipos de acidente.

## Base analisada

- 72.529 registros de acidentes
- 30 campos originais
- Variável derivada `acidente_fatal`: 1 quando `mortos >= 1`; 0 quando `mortos = 0`
- Total de acidentes fatais: 5.210
- Total de acidentes não fatais: 67.319
- Total de mortos: 6.043
- Taxa global de fatalidade: aproximadamente 7,18%

## Estrutura do projeto

```text
PRF_2025_Analise_Exploratoria/
├── dados/
│   └── dados_abertos_prf-datatran2025.csv
├── entrega/
│   └── Analise_Exploratoria_Acidentes_PRF_2025.xlsx
├── docs/
│   ├── sintese_interpretativa.md
│   └── checklist_entrega.md
├── graficos/
├── logs/
├── .gitignore
└── README.md
```

## Principais análises

1. Acidentes por UF
2. Acidentes fatais por mês
3. Causas mais frequentes
4. Mortes por rodovia federal (BR)
5. Distribuição entre acidentes fatais e não fatais
6. Proporção de fatalidade por tipo de acidente
7. Classificação do acidente e mortalidade
8. Municípios com maior número de acidentes fatais

## Cuidados metodológicos

- Associação observada não implica causalidade.
- Rankings absolutos não representam, isoladamente, risco relativo.
- As análises por BR e UF não controlam extensão da malha, volume de tráfego ou exposição ao risco.
- A análise mensal de 2025 é exploratória e não permite concluir sazonalidade estatística.
- A classificação original contém um registro `NA` com `mortos = 1`; o dado original foi preservado e a variável derivada `acidente_fatal` foi usada para a classificação binária.

## Status

Projeto em organização final para entrega acadêmica e versionamento no GitHub.
