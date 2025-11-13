-- =====================================================================
-- SCRIPT DE CRIAÇÃO/ATUALIZAÇÃO DE ÍNDICES (IDEMPOTENTE)
-- Pode ser executado várias vezes sem erro.
--
-- QUANDO EXECUTAR:
-- 1. ESTRUTURA
-- 2. CARGA DE DADOS
-- 3. >> ESTE SCRIPT DE ÍNDICES <<
-- 4. RELAÇÕES
-- =====================================================================

USE `desempenho_tjdft_je`;

-- --- ÍNDICES PARA A TABELA: fato_movimentos_unificada ---

DROP INDEX IF EXISTS `idx_id_data_sentenca` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_data_sentenca` ON `fato_movimentos_unificada`(`id_data_da_sentenca`);

DROP INDEX IF EXISTS `idx_id_data_baixa` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_data_baixa` ON `fato_movimentos_unificada`(`id_data_da_baixa`);

DROP INDEX IF EXISTS `idx_id_data_ultima_movimentacao` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_data_ultima_movimentacao` ON `fato_movimentos_unificada`(`id_data_da_ultima_movimentacao`);

DROP INDEX IF EXISTS `idx_id_tipo_de_movimento` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_tipo_de_movimento` ON `fato_movimentos_unificada`(`id_tipo_de_movimento`);

DROP INDEX IF EXISTS `idx_id_nome_orgao` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_nome_orgao` ON `fato_movimentos_unificada`(`id_nome_orgao`);

DROP INDEX IF EXISTS `idx_id_municipio` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_municipio` ON `fato_movimentos_unificada`(`id_municipio`);

DROP INDEX IF EXISTS `idx_id_situacao_atual` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_situacao_atual` ON `fato_movimentos_unificada`(`id_situacao_atual`);

DROP INDEX IF EXISTS `idx_id_procedimento` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_id_procedimento` ON `fato_movimentos_unificada`(`id_procedimento`);

DROP INDEX IF EXISTS `idx_codigo_da_ultima_classe` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_codigo_da_ultima_classe` ON `fato_movimentos_unificada`(`codigo_da_ultima_classe`);

DROP INDEX IF EXISTS `idx_codigo_movimento` ON `fato_movimentos_unificada`;
CREATE INDEX `idx_codigo_movimento` ON `fato_movimentos_unificada`(`codigo_movimento`);

-- --- ÍNDICE PARA A TABELA: ponte_processo_assunto ---

DROP INDEX IF EXISTS `idx_id_assunto` ON `ponte_processo_assunto`;
CREATE INDEX `idx_id_assunto` ON `ponte_processo_assunto`(`id_assunto`);