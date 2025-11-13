# Projeto de BI: Análise de Desempenho dos Juizados Especiais - TJDFT

Este repositório contém os artefatos para o projeto de Laboratório de Inovação em Ciência de Dados, focado na criação de um Data Warehouse e painéis de BI para análise do desempenho do TJDFT.

## 1. Estrutura do Projeto

* `/01_ETL`: Contém o Notebook Jupyter (`.ipynb`) com todo o processo de ETL (Extração, Transformação e Carga) feito em Python/Pandas.
* `/02_SQL`: Contém os scripts SQL para a criação da estrutura, carga dos dados, índices e relações no MySQL.
* `/03_PowerBI`: Contém o arquivo `.pbix` final do dashboard.
* `/04_Documentacao`: Contém o artigo acadêmico (`.docx`) do projeto.
* `/05_Recursos_Mapa`: Contém o arquivo GeoJSON customizado do DF usado no painel de Origem.
* `/dados`: Contém as tabelas de dimensão (CSV) usadas na carga.

## 2. Fonte dos Dados

[cite_start]Os dados processuais (arquivos `.csv` de fatos) utilizados neste projeto são públicos e foram extraídos do portal **Justiça em Números** do Conselho Nacional de Justiça (CNJ) [cite: 254, 304-306].

* **Dados Fato (Não incluídos no Git):** Os arquivos `base_mestre.csv` e `fato_movimentos.csv` (milhões de linhas) não estão neste repositório devido ao seu tamanho. Eles são gerados pelo script na pasta `/01_ETL`.
* [cite_start]**Tabelas de Dimensão (Incluídas):** As tabelas `dim_classes`, `dim_assuntos_hierarquico` e `dim_movimentos` (na pasta `/dados`) foram obtidas do Sistema de Gestão de Tabelas Processuais Unificadas (SGT) do CNJ [cite: 253, 301-303].

## 3. Como Replicar o Projeto

1.  **ETL:** Execute o notebook em `/01_ETL` para gerar os arquivos CSV tratados (requer os arquivos brutos do CNJ).
2.  **Banco de Dados:** Crie um banco MySQL e execute os scripts da pasta `/02_SQL` na ordem numérica para criar a estrutura e carregar os dados.
3.  **Visualização:** Abra o arquivo `.pbix` (link google drive abaixo) no Power BI Desktop e atualize a fonte de dados para o seu banco MySQL.
O arquivo final do dashboard (`.pbix`) tem 95MB e é muito grande para o GitHub.
**[Clique aqui para baixar o arquivo TJDFT_BI.pbix do Google Drive](https://drive.google.com/file/d/1F3JmMyGmChdPpHvvRqugKBV0St2SlYjF/view?usp=drive_link)**

---
*Projeto desenvolvido por: Luiz Gustavo de Oliveira Pocceschi, Maria Angélica Nazareno Freitas, Nilton Lima e Alisson Soares Rodrigues.*