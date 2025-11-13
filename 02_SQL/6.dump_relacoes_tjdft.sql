-- =====================================================================
-- SCRIPT DE DEFINIÇÃO DE RELAÇÕES (FOREIGN KEYS)
--
-- QUANDO EXECUTAR:
-- 1. ESTRUTURA
-- 2. CARGA DE DADOS
-- 3. ÍNDICES
-- 4. >> ESTE SCRIPT DE RELAÇÕES (ÚLTIMO PASSO) <<
-- =====================================================================

USE `desempenho_tjdft_je`;
SET FOREIGN_KEY_CHECKS=1;

-- --- RELAÇÕES DA TABELA FATO UNIFICADA ---

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tempo_movimento`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tempo_movimento` FOREIGN KEY (`id_data_movimento`) REFERENCES `dim_tempo` (`id_data`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tempo_ajuizamento`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tempo_ajuizamento` FOREIGN KEY (`id_data_de_ajuizamento`) REFERENCES `dim_tempo` (`id_data`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tempo_sentenca`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tempo_sentenca` FOREIGN KEY (`id_data_da_sentenca`) REFERENCES `dim_tempo` (`id_data`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tempo_baixa`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tempo_baixa` FOREIGN KEY (`id_data_da_baixa`) REFERENCES `dim_tempo` (`id_data`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tempo_ultima_mov`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tempo_ultima_mov` FOREIGN KEY (`id_data_da_ultima_movimentacao`) REFERENCES `dim_tempo` (`id_data`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_orgao`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_orgao` FOREIGN KEY (`id_nome_orgao`) REFERENCES `dim_orgao` (`id_nome_orgao`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_municipio`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `dim_municipio` (`id_municipio`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_situacao`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_situacao` FOREIGN KEY (`id_situacao_atual`) REFERENCES `dim_situacao` (`id_situacao_atual`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_procedimento`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_procedimento` FOREIGN KEY (`id_procedimento`) REFERENCES `dim_procedimento` (`id_procedimento`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_tipo_movimento`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_tipo_movimento` FOREIGN KEY (`id_tipo_de_movimento`) REFERENCES `dim_tipo_movimento` (`id_tipo_de_movimento`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_classes`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_classes` FOREIGN KEY (`codigo_da_ultima_classe`) REFERENCES `dim_classes` (`codigo_classe`);

ALTER TABLE `fato_movimentos_unificada` DROP CONSTRAINT IF EXISTS `fk_fato_dim_movimentos`;
ALTER TABLE `fato_movimentos_unificada` ADD CONSTRAINT `fk_fato_dim_movimentos` FOREIGN KEY (`codigo_movimento`) REFERENCES `dim_movimentos` (`codigo_movimento`);


-- --- RELAÇÃO DA TABELA PONTE ---

ALTER TABLE `ponte_processo_assunto` DROP CONSTRAINT IF EXISTS `fk_ponte_dim_assunto`;
ALTER TABLE `ponte_processo_assunto` ADD CONSTRAINT `fk_ponte_dim_assunto` FOREIGN KEY (`id_assunto`) REFERENCES `dim_assuntos_hierarquico` (`cod_assunto`);