-- =====================================================================
-- SCRIPT DE ESTRUTURA FINAL (ADAPTADO AOS CSVs E SEM COLUNA 'fonte_carga')
-- =====================================================================

CREATE DATABASE IF NOT EXISTS `desempenho_tjdft_je` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `desempenho_tjdft_je`;

DROP TABLE IF EXISTS `fato_movimentos_unificada`, `ponte_processo_assunto`, `dim_tempo`, `dim_municipio`, `dim_orgao`, `dim_situacao`, `dim_procedimento`, `dim_tipo_movimento`, `dim_classes`, `dim_assuntos_hierarquico`, `dim_movimentos`;

-- --- RECRIANDO AS TABELAS DE DIMENSÃO ---

CREATE TABLE `dim_tempo` ( `id_data` INT UNSIGNED NOT NULL PRIMARY KEY, `data_completa` DATE NOT NULL, `ano` SMALLINT NOT NULL, `trimestre` TINYINT NOT NULL, `mes` TINYINT NOT NULL, `nome_mes` VARCHAR(20) NOT NULL, `dia` TINYINT NOT NULL, `dia_da_semana` TINYINT NOT NULL, `nome_dia_da_semana` VARCHAR(20) NOT NULL, UNIQUE KEY `uk_data_completa` (`data_completa`) ) ENGINE=InnoDB;
CREATE TABLE `dim_municipio` ( `id_municipio` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, `dsc_municipio` VARCHAR(100) NOT NULL ) ENGINE=InnoDB;
CREATE TABLE `dim_orgao` ( `id_nome_orgao` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, `dsc_nome_orgao` VARCHAR(255) NOT NULL ) ENGINE=InnoDB;
CREATE TABLE `dim_situacao` ( `id_situacao_atual` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, `dsc_situacao_atual` VARCHAR(50) NOT NULL ) ENGINE=InnoDB;
CREATE TABLE `dim_procedimento` ( `id_procedimento` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, `dsc_procedimento` VARCHAR(100) NOT NULL ) ENGINE=InnoDB;
CREATE TABLE `dim_tipo_movimento` ( `id_tipo_de_movimento` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, `dsc_tipo_de_movimento` VARCHAR(50) NOT NULL ) ENGINE=InnoDB;

-- CORREÇÃO: Nomes de colunas alinhados com os CSVs e sem 'fonte_carga'
CREATE TABLE `dim_classes` ( `codigo_classe` INT NOT NULL PRIMARY KEY, `nome_da_classe` VARCHAR(255), `situacao` CHAR(1) ) ENGINE=InnoDB;
CREATE TABLE `dim_assuntos_hierarquico` ( `cod_assunto` INT NOT NULL PRIMARY KEY, `dsc_assunto` VARCHAR(255), `situacao` CHAR(1), `cod_assunto_pai` INT ) ENGINE=InnoDB;
CREATE TABLE `dim_movimentos` ( `codigo_movimento` INT NOT NULL PRIMARY KEY, `descricao_movimento` VARCHAR(255), `situacao` CHAR(1) ) ENGINE=InnoDB;


-- --- RECRIANDO A FATO E A PONTE ---

CREATE TABLE `fato_movimentos_unificada` ( `processo` VARCHAR(30) NOT NULL, `grau` CHAR(2) NOT NULL, `id_data_movimento` INT UNSIGNED, `id_data_de_ajuizamento` INT UNSIGNED, `id_data_da_sentenca` INT UNSIGNED, `id_data_da_baixa` INT UNSIGNED, `id_data_da_ultima_movimentacao` INT UNSIGNED, `id_tipo_de_movimento` INT UNSIGNED, `id_nome_orgao` INT UNSIGNED, `id_municipio` INT UNSIGNED, `id_situacao_atual` INT UNSIGNED, `id_procedimento` INT UNSIGNED, `codigo_da_ultima_classe` INT, `codigo_movimento` INT, `codigo_situacao` INT, INDEX `idx_processo_grau` (`processo`, `grau`), INDEX `idx_data_movimento` (`id_data_movimento`), INDEX `idx_data_ajuizamento` (`id_data_de_ajuizamento`) ) ENGINE=InnoDB;
CREATE TABLE `ponte_processo_assunto` ( `processo` VARCHAR(30) NOT NULL, `grau` CHAR(2) NOT NULL, `id_assunto` INT NOT NULL, PRIMARY KEY (`processo`, `grau`, `id_assunto`) ) ENGINE=InnoDB;