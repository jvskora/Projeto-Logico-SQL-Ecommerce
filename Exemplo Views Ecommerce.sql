-- View para Clientes com Endereço

CREATE VIEW vw_cliente_endereco AS
SELECT 
    c.id AS cliente_id, 
    c.nome, 
    c.email, 
    c.tipo, 
    e.logradouro, 
    e.numero, 
    e.complemento, 
    e.bairro, 
    e.cidade, 
    e.estado, 
    e.cep
FROM 
    Cliente c
JOIN 
    Endereco e ON c.id = e.cliente_id;
    
-- View para Pedidos com Itens e Valor Total

CREATE VIEW vw_pedidos_completo AS
SELECT 
    p.id AS pedido_id, 
    p.cliente_id, 
    p.endereco_entrega_id, 
    p.data_criacao, 
    p.status, 
    p.valor_total,
    i.produto_id, 
    i.quantidade, 
    i.preco_unitario,
    (i.quantidade * i.preco_unitario) AS subtotal
FROM 

-- View para Carrinho com Itens

CREATE VIEW vw_carrinho_itens AS
SELECT 
    c.cliente_id, 
    c.id AS carrinho_id, 
    i.produto_id, 
    i.quantidade,
    p.nome AS produto_nome, 
    p.preco AS preco_produto,
    (i.quantidade * p.preco) AS subtotal
FROM 
    Carrinho c
JOIN 
    Item_Carrinho i ON c.id = i.carrinho_id
JOIN 
    Produto p ON i.produto_id = p.id;