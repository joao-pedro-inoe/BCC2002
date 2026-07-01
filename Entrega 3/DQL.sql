SELECT nome_comercial, preco_venda 
FROM produto 
WHERE id_produto NOT IN (
    SELECT id_produto_FK 
    FROM item_venda
);

SELECT p.nome, 'Cliente' AS papel 
FROM pessoa p
INNER JOIN cliente c ON p.id_pessoa = c.id_pessoa_FK
UNION
SELECT p.nome, 'Funcionario' AS papel 
FROM pessoa p
INNER JOIN funcionario f ON p.id_pessoa = f.id_pessoa_FK;

SELECT v.id_venda, p.nome AS nome_cliente, v.valor_total
FROM venda v
INNER JOIN pessoa p ON v.id_pessoa_cliente_FK = p.id_pessoa
WHERE v.valor_total > (
    SELECT AVG(valor_total) FROM venda
);

SELECT 
    id_venda, 
    valor_total, 
    ROUND((valor_total / (SELECT SUM(valor_total) FROM venda)) * 100, 2) AS percentual_receita
FROM venda;

SELECT p.nome, c.email
FROM pessoa p
INNER JOIN cliente c ON p.id_pessoa = c.id_pessoa_FK
WHERE c.id_pessoa_FK IN (
    SELECT v.id_pessoa_cliente_FK
    FROM venda v
    INNER JOIN item_venda iv ON v.id_venda = iv.id_venda_FK
    INNER JOIN produto pr ON iv.id_produto_FK = pr.id_produto
    WHERE pr.nome_comercial = 'Protetor Solar FPS 50'
);

-- Alternativa universal (Subconsulta com NOT EXISTS):
SELECT id_pessoa, nome 
FROM pessoa p
WHERE NOT EXISTS (
    SELECT 1 FROM cliente c WHERE c.id_pessoa_FK = p.id_pessoa
);