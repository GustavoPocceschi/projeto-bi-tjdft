-- =====================================================================
-- SCRIPT MESTRE DE AUDITORIA DE INTEGRIDADE REFERENCIAL (ÓRFÃOS)
-- Execute este script para encontrar todas as chaves na tabela fato
-- que não têm correspondência nas tabelas de dimensão.
-- =====================================================================

USE `desempenho_tjdft_je`;

-- --- VERIFICAÇÕES NA TABELA: fato_movimentos_unificada ---

-- 1. Verificação: Relação com dim_tempo (via id_data_movimento)
SELECT DISTINCT f.id_data_movimento AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_tempo d ON f.id_data_movimento = d.id_data
WHERE d.id_data IS NULL;

-- 2. Verificação: Relação com dim_tempo (via id_data_de_ajuizamento)
SELECT DISTINCT f.id_data_de_ajuizamento AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_tempo d ON f.id_data_de_ajuizamento = d.id_data
WHERE d.id_data IS NULL;

-- 3. Verificação: Relação com dim_tempo (via id_data_da_sentenca)
SELECT DISTINCT f.id_data_da_sentenca AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_tempo d ON f.id_data_da_sentenca = d.id_data
WHERE d.id_data IS NULL;

-- 4. Verificação: Relação com dim_tempo (via id_data_da_baixa)
SELECT DISTINCT f.id_data_da_baixa AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_tempo d ON f.id_data_da_baixa = d.id_data
WHERE d.id_data IS NULL;

-- 5. Verificação: Relação com dim_orgao
SELECT DISTINCT f.id_nome_orgao AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_orgao d ON f.id_nome_orgao = d.id_nome_orgao
WHERE d.id_nome_orgao IS NULL;

-- 6. Verificação: Relação com dim_municipio
SELECT DISTINCT f.id_municipio AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_municipio d ON f.id_municipio = d.id_municipio
WHERE d.id_municipio IS NULL;

-- 7. Verificação: Relação com dim_situacao
SELECT DISTINCT f.id_situacao_atual AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_situacao d ON f.id_situacao_atual = d.id_situacao_atual
WHERE d.id_situacao_atual IS NULL;

-- 8. Verificação: Relação com dim_procedimento
SELECT DISTINCT f.id_procedimento AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_procedimento d ON f.id_procedimento = d.id_procedimento
WHERE d.id_procedimento IS NULL;

-- 9. Verificação: Relação com dim_tipo_movimento
SELECT DISTINCT f.id_tipo_de_movimento AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_tipo_movimento d ON f.id_tipo_de_movimento = d.id_tipo_de_movimento
WHERE d.id_tipo_de_movimento IS NULL;

-- 10. Verificação: Relação com dim_classes
SELECT DISTINCT f.codigo_da_ultima_classe AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_classes d ON f.codigo_da_ultima_classe = d.codigo_classe
WHERE d.codigo_classe IS NULL;

-- 11. Verificação: Relação com dim_movimentos
SELECT DISTINCT f.codigo_movimento AS id_orfao
FROM fato_movimentos_unificada f
LEFT JOIN dim_movimentos d ON f.codigo_movimento = d.codigo_movimento
WHERE d.codigo_movimento IS NULL;


-- --- VERIFICAÇÃO NA TABELA: ponte_processo_assunto ---

-- 12. Verificação: Relação com dim_assuntos_hierarquico
SELECT DISTINCT p.id_assunto AS id_orfao
FROM ponte_processo_assunto p
LEFT JOIN dim_assuntos_hierarquico d ON p.id_assunto = d.cod_assunto
WHERE d.cod_assunto IS NULL;