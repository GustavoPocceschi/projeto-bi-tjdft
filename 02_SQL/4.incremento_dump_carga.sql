-- ==========================================================
-- SCRIPT DE INSERTS DE REFORÇO E LIMPEZA (VERSÃO FINALÍSSIMA CONSOLIDADA E CORRIGIDA)
-- Garante a existência de TODOS os órfãos válidos identificados e
-- REMOVE links de assunto inválidos (ID=0).
-- Execute APÓS o dump de carga principal e ANTES dos índices/relações.
-- ==========================================================

USE `desempenho_tjdft_je`;

-- === GARANTIR ÓRFÃOS VÁLIDOS ===

-- Garante que os tipos de movimento 1 e 2 existam
INSERT IGNORE INTO `dim_tipo_movimento` (`id_tipo_de_movimento`, `dsc_tipo_de_movimento`) VALUES 
(1, 'Decisão/Tramitação'),
(2, 'Julgamento');
    
-- Garante que TODAS as classes órfãs identificadas (21) existam
INSERT IGNORE INTO `dim_classes` (`codigo_classe`, `nome_da_classe`, `situacao`) VALUES 
(11993, 'Carta Precatória Cível', 'A'), (12133, 'Alimentos - Lei Especial Nº 5.478/68', 'A'),
(12134, 'Cumprimento de Sentença de Obrigação de Prestar Alimentos', 'A'), (12135, 'Execução de Título Extrajudicial de Obrigação de Prestar Alimentos', 'A'),
(35, 'Depósito', 'A'), (97, 'Divórcio Consensual', 'A'), (99, 'Divórcio Litigioso', 'A'),
(203, 'Guarda', 'A'), (208, 'Regulamentação de Visitas', 'A'), (244, 'Homologação de Transação Extrajudicial', 'A'),
(1112, 'Execução de Título Extrajudicial', 'A'), (1122, 'Busca e Apreensão', 'A'), (12083, 'Cumprimento de Sentença', 'A'), 
(12084, 'Cumprimento Provisório de Sentença', 'A'), (12088, 'Execução de Título Judicial', 'A'), (12234, 'Carta Precatória Criminal', 'A'),
(12373, 'Execução de Medidas Sócio-Educativas', 'A'), (22, 'Ação Penal - Procedimento Sumaríssimo', 'A'),
(1111, 'Exceção de Incompetência de Juízo', 'A'), (1114, 'Restituição de Coisas Apreendidas', 'A'), (12251, 'Averiguação de Paternidade', 'A');
    
-- Garante que TODOS os movimentos órfãos identificados (30) existam (Lista consolidada e CORRIGIDA)
INSERT IGNORE INTO `dim_movimentos` (`codigo_movimento`, `descricao_movimento`, `situacao`) VALUES 
(56, 'Remessa Externa', 'A'),
(85, 'Citação', 'A'), 
(146, 'Expedição de Mandado', 'A'),
(198, 'Baixa Definitiva', 'A'), 
(266, 'Certidão de Remessa da Intimação para o Portal Eletrônico', 'A'),
(269, 'Certidão Automática de Juntada de Petição', 'A'),
(270, 'Certidão de Trânsito em Julgado Expedida', 'A'), 
(278, 'Certidão de Não Leitura (Portal Eletrônico)', 'A'),
(279, 'Certidão de Leitura da Intimação (Portal Eletrônico)', 'A'),
(355, 'Ofício Expedido', 'A'),
(377, 'Certidão Expedida', 'A'), 
(497, 'Intimação', 'A'), 
(581, 'Juntada', 'A'), 
(900, 'Remetido ao DJE', 'A'),
(947, 'Juntada de Mandado Cumprido Negativo', 'A'),
(960, 'Recurso Inominado Cível / Recurso Inominado', 'A'),
(974, 'Recebidos os Autos', 'A'), 
(1015, 'Decisão Monocrática - Declaração de Incompetência', 'A'),
(1045, 'Ato Ordinatório Praticado', 'A'),
(10963, 'Remetidos os Autos', 'A'),
(11002, 'Intimação Eletrônica - Confirmada', 'A'),
(11010, 'Conclusos para Despacho', 'A'), 
(11013, 'Conclusos para Sentença', 'A'),
(11383, 'Juntada de Ofício', 'A'),
(11394, 'Juntada de AR (Aviso de Recebimento)', 'A'),
(11396, 'Juntada de Documento', 'A'),
(11425, 'Expedido/Entregue Mandado/Carta Precatória/Rogatória', 'A'),
(11883, 'Juntada de Mandado', 'A'), 
(11884, 'Juntada de Petição de Juntada de Documentos', 'A'), 
(12067, 'Ciência ao MP', 'A'),
(12184, 'Certidão de Juntada da Petição de Manifestação da Parte', 'A'),
(12247, 'Expedição de Ofício', 'A'),
(14733, 'Certidão de Intimação Expedida', 'A'); -- <<< CÓDIGO FALTANTE ADICIONADO AQUI
    
-- Garante que o assunto órfão válido (1) exista
INSERT IGNORE INTO `dim_assuntos_hierarquico` (`cod_assunto`, `dsc_assunto`, `cod_assunto_pai`, `situacao`) VALUES 
(15546, 'Violência Doméstica contra a Mulher', 12543, 'A');

-- === LIMPEZA DE DADOS INVÁLIDOS ===

-- Remove as linhas da tabela ponte onde o id_assunto é 0 (inválido)
DELETE FROM `ponte_processo_assunto` WHERE `id_assunto` = 0;

-- ==========================================================