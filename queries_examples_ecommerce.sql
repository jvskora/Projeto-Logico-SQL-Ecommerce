use Ecommerce;

-- Ex de queries: 
-- Mostra os clientes cadastrados :
SELECT * FROM Cliente;

-- Lista os produtos e suas respectivas categorias:
SELECT p.id_produto, p.nome AS produto, p.preco, c.nome AS categoria
FROM Produto p
JOIN Categoria c ON p.categoria_id = c.id_categoria;

-- Verifica o estoque dos produtos em todos os locais:
SELECT e.localizacao, p.nome AS produto, pe.quantidade
FROM Produto_Estoque pe
JOIN Produto p ON pe.id_produto = p.id_produto
JOIN Estoque e ON pe.id_estoque = e.id_estoque;

-- Exibe os detalhes de um pedido específico, incluindo os itens comprados:
SELECT p.id_pedido, c.nome AS cliente, i.produto_id, pr.nome AS produto, 
       i.quantidade, i.preco_unitario, p.valor_total, p.status
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.id_cliente
JOIN Item_Pedido i ON p.id_pedido = i.pedido_id
JOIN Produto pr ON i.produto_id = pr.id_produto
WHERE p.id_pedido = 1; -- Substitua pelo ID do pedido desejado

-- Quantos pedidos foram feitos por cada cliente: 
SELECT 
    c.nome AS cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM 
    Cliente c
JOIN 
    Pedido p ON c.id_cliente = p.cliente_id
GROUP BY 
    c.id_cliente;
    
-- Pedidos feitos por um cliente especifico
SELECT 
    p.id_pedido,
    p.data_criacao,
    p.status AS status_pedido,
    p.valor_total,
    c.nome AS nome_cliente,
    c.tipo AS tipo_cliente,
    i.produto_id,
    pr.nome AS nome_produto,
    i.quantidade,
    i.preco_unitario
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.id_cliente
JOIN Item_Pedido i ON p.id_pedido = i.pedido_id
JOIN Produto pr ON i.produto_id = pr.id_produto
WHERE c.nome = 'João Silva';  -- Substitua 'João Silva' pelo nome do cliente desejado

-- Exibir o conteúdo de um carrinho de compras:
SELECT c.id_carrinho, cl.nome AS cliente, p.nome AS produto, i.quantidade
FROM Carrinho c
JOIN Cliente cl ON c.cliente_id = cl.id_cliente
JOIN Item_Carrinho i ON c.id_carrinho = i.carrinho_id
JOIN Produto p ON i.produto_id = p.id_produto
WHERE cl.nome = 'João Silva'; -- Substitua pelo nome do cliente

-- Lista todas as devoluções pendentes: 
SELECT d.id_devolucao, c.nome AS cliente, d.data_devolucao, d.motivo, d.status
FROM Devolucao d
JOIN Cliente c ON d.cliente_id = c.id_cliente
WHERE d.status = 'Aguardando Avaliação';

-- Histórico de devolução
SELECT d.id_devolucao, p.id_pedido, d.data_devolucao, d.motivo, d.status
FROM Devolucao d
JOIN Pedido p ON d.pedido_id = p.id_pedido
JOIN Cliente c ON d.cliente_id = c.id_cliente
WHERE c.nome = 'Maria Oliveira'; -- Substitua pelo nome do cliente

-- Identifica os produtos mais vendidos
SELECT p.nome AS produto, SUM(i.quantidade) AS total_vendido
FROM Item_Pedido i
JOIN Produto p ON i.produto_id = p.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC
LIMIT 5; -- Top 5 produtos

-- Relatorio de vendas por categoria: 

SELECT c.nome AS categoria, SUM(i.quantidade * i.preco_unitario) AS total_vendas
FROM Item_Pedido i
JOIN Produto p ON i.produto_id = p.id_produto
JOIN Categoria c ON p.categoria_id = c.id_categoria
GROUP BY c.nome
ORDER BY total_vendas DESC;

-- Quais produtos venderam mais de 1 unidade
SELECT 
    p.nome AS produto,
    SUM(i.quantidade) AS total_vendido
FROM 
    Item_Pedido i
JOIN 
    Produto p ON i.produto_id = p.id_produto
GROUP BY 
    p.id_produto
HAVING 
    SUM(i.quantidade) > 1;

-- Total de vendas por categoria utilizando (HAVING):
SELECT 
    c.nome AS categoria,
    SUM(i.quantidade * i.preco_unitario) AS total_vendas
FROM 
    Item_Pedido i
JOIN 
    Produto p ON i.produto_id = p.id_produto
JOIN 
    Categoria c ON p.categoria_id = c.id_categoria
GROUP BY 
    c.nome
HAVING 
    SUM(i.quantidade * i.preco_unitario) > 50;  -- Exemplo de filtro por vendas totais

SELECT * FROM Cliente;
SELECT * FROM Endereco;
SELECT * FROM Pedido;
SELECT * FROM Categoria;
SELECT * FROM Fornecedor;
SELECT * FROM Produto;
SELECT * FROM Estoque;
SELECT * FROM Produto_Estoque;
SELECT * FROM Carrinho;
SELECT * FROM Item_Carrinho;
SELECT * FROM Item_Pedido;
SELECT * FROM Devolucao;
SELECT * FROM Log_Acoes;