
# Decisões de tratamento — Módulo 4

Data de geração: 2026-08-10 19:07

## Principais decisões

- Nomes de colunas padronizados para minúsculas, sem acentos e com underline.
- Colunas numéricas convertidas com `pd.to_numeric(errors='coerce')`.
- Datas convertidas com `pd.to_datetime(errors='coerce')`.
- Categorias ausentes relevantes preenchidas como `IGNORADO`.
- Variável-alvo criada: `acidente_fatal = 1` quando `mortos >= 1`.
- Base modelável construída sem variáveis derivadas do desfecho (*data leakage*).

## Arquivos gerados

- ..\dados_tratados\base_analitica_prf_2025.csv
- ..\dados_tratados\base_modelavel_prf_2025.csv
- ..\dados_tratados\dicionario_variaveis_modulo4.csv
