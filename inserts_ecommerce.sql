use ecommerce;
-- Inserindo dados para teste

-- Dados na tabela Cliente
INSERT INTO Cliente (nome, email, senha, cpf, cnpj, tipo) VALUES
('João Silva', 'joao@gmail.com', 'senha123', '12345678901', NULL, 'PF'),
('Empresa XYZ', 'contato@xyz.com', 'senha456', NULL, '98765432100012', 'PJ'),
('Maria Oliveira', 'maria.oliveira@gmail.com', 'senha789', '23456789012', NULL, 'PF'),
('Empresa ABC', 'contato@abc.com', 'senha1234', NULL, '11223344550011', 'PJ'),
('Carlos Souza', 'carlos.souza@gmail.com', 'senha321', '11223344556', NULL, 'PF'),
('Loja Online', 'loja@online.com', 'senha987', NULL, '12345678900012', 'PJ'),
('Ana Costa', 'ana.costa@gmail.com', 'senha654', '98765432109', NULL, 'PF'),
('Comércio XYZ', 'comercio@xyz.com', 'senha12345', NULL, '55667788990099', 'PJ'),
('Ricardo Lima', 'ricardo.lima@gmail.com', 'senha4567', '55566677788', NULL, 'PF'),
('Mega Store', 'megastore@gmail.com', 'senha8910', NULL, '99887766554422', 'PJ');

-- Dados na tabela Endereco
INSERT INTO Endereco (cliente_id, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
(1, 'Rua A', '100', NULL, 'Bairro Central', 'Cidade A', 'SP', '12345678'),
(2, 'Avenida B', '200', 'Sala 3', 'Bairro B', 'Cidade B', 'RJ', '87654321'),
(3, 'Rua C', '300', 'Apto 101', 'Bairro C', 'Cidade C', 'MG', '23456789'),
(4, 'Avenida D', '400', NULL, 'Bairro D', 'Cidade D', 'BA', '34567890'),
(5, 'Rua E', '500', 'Cobertura', 'Bairro E', 'Cidade E', 'PR', '45678901'),
(6, 'Rua F', '600', 'Perto da Praça', 'Bairro F', 'Cidade F', 'SC', '56789012'),
(7, 'Rua G', '700', 'Apto 202', 'Bairro G', 'Cidade G', 'RS', '67890123'),
(8, 'Avenida H', '800', 'Loja 2', 'Bairro H', 'Cidade H', 'ES', '78901234'),
(9, 'Rua I', '900', 'Bloco B', 'Bairro I', 'Cidade I', 'GO', '89012345'),
(10, 'Rua J', '1000', 'Casa 1', 'Bairro J', 'Cidade J', 'MT', '90123456');

-- Dados na tabela Categoria
INSERT INTO Categoria (nome, descricao) VALUES
('Eletrônicos', 'Aparelhos eletrônicos e acessórios'),
('Livros', 'Livros de diversos gêneros'),
('Roupas', 'Vestuário e acessórios'),
('Móveis', 'Móveis para casa e escritório'),
('Beleza', 'Produtos de cuidado pessoal'),
('Alimentos', 'Comidas e bebidas'),
('Saúde', 'Produtos para saúde e bem-estar'),
('Automóveis', 'Veículos e acessórios'),
('Brinquedos', 'Brinquedos e jogos'),
('Esportes', 'Produtos esportivos');

-- Dados na tabela Fornecedor
INSERT INTO Fornecedor (nome, cnpj, telefone, email) VALUES
('Fornecedor A', '12345678000199', '1123456789', 'fornecedorA@gmail.com'),
('Fornecedor B', '98765432000188', '1198765432', 'fornecedorB@gmail.com'),
('Fornecedor C', '11122233000111', '1134567890', 'fornecedorC@gmail.com'),
('Fornecedor D', '99988877000122', '1198765430', 'fornecedorD@gmail.com'),
('Fornecedor E', '88877766000133', '1145678901', 'fornecedorE@gmail.com'),
('Fornecedor F', '77766655000144', '1156789012', 'fornecedorF@gmail.com'),
('Fornecedor G', '66655544000155', '1167890123', 'fornecedorG@gmail.com'),
('Fornecedor H', '55544433000166', '1178901234', 'fornecedorH@gmail.com'),
('Fornecedor I', '44433322000177', '1189012345', 'fornecedorI@gmail.com'),
('Fornecedor J', '33322211000188', '1190123456', 'fornecedorJ@gmail.com');

-- Dados na tabela Produto
INSERT INTO Produto (nome, descricao, preco, categoria_id) VALUES
('Smartphone', 'Smartphone com 128GB', 1999.99, 1),
('Notebook', 'Notebook com 16GB RAM', 3499.99, 1),
('Livro A', 'Um livro interessante', 49.90, 2),
('Tablet', 'Tablet com 64GB de armazenamento', 899.99, 1),
('Cadeira Gamer', 'Cadeira ergonômica para gamers', 599.99, 1),
('Livro B', 'Outro livro interessante', 59.90, 2),
('Tênis Running', 'Tênis esportivo', 299.90, 3),
('Sofá Retrátil', 'Sofá retrátil para sala de estar', 1999.00, 4),
('Shampoo', 'Shampoo hidratante', 39.90, 5),
('Cerveja', 'Cerveja artesanal', 15.00, 6);


-- Dados na tabela Estoque
INSERT INTO Estoque (localizacao) VALUES
('Centro de Distribuição SP'),
('Centro de Distribuição RJ'),
('Centro de Distribuição MG'),
('Centro de Distribuição PR'),
('Centro de Distribuição SC'),
('Centro de Distribuição RS'),
('Centro de Distribuição ES'),
('Centro de Distribuição GO'),
('Centro de Distribuição MT'),
('Centro de Distribuição DF');

-- Dados na tabela Produto_Estoque
INSERT INTO Produto_Estoque (id_produto, id_estoque, quantidade) VALUES
(1, 1, 50),
(2, 1, 30),
(3, 2, 100),
(4, 3, 25),
(5, 4, 60),
(6, 5, 70),
(7, 6, 80),
(8, 7, 40),
(9, 8, 55),
(10, 9, 90);

-- Dados na tabela Carrinho
INSERT INTO Carrinho (cliente_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);


-- Dados na tabela Item_Carrinho
INSERT INTO Item_Carrinho (carrinho_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 1),
(4, 5, 2),
(5, 6, 3),
(6, 7, 1),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1);

-- Dados na tabela Pedido
INSERT INTO Pedido (cliente_id, endereco_entrega_id, data_criacao, status, valor_total) VALUES
(1, 1, '2025-01-14 10:00:00', 'Aprovado', 2049.89),
(2, 2, '2025-01-14 11:00:00', 'Pendente', 3499.99),
(3, 3, '2025-01-14 15:00:00', 'Pendente', 999.99),
(4, 4, '2025-01-14 16:00:00', 'Aprovado', 1199.80),
(5, 5, '2025-01-14 18:00:00', 'Pendente', 500.00),
(6, 6, '2025-01-14 19:00:00', 'Aprovado', 1599.90),
(7, 7, '2025-01-14 20:00:00', 'Pendente', 750.50),
(8, 8, '2025-01-14 21:00:00', 'Aprovado', 2200.80),
(9, 9, '2025-01-14 22:00:00', 'Pendente', 1200.45),
(10, 10, '2025-01-14 23:00:00', 'Aprovado', 499.99);

-- Dados na tabela Item_Pedido
INSERT INTO Item_Pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 1999.99),
(1, 3, 1, 49.90),
(2, 2, 1, 3499.99),
(3, 4, 1, 899.99),
(4, 5, 2, 599.99),
(5, 6, 3, 70.00),
(6, 7, 1, 80.00),
(7, 8, 1, 1999.00),
(8, 9, 2, 39.90),
(9, 10, 1, 15.00);

-- Dados na tabela Devolucao
INSERT INTO Devolucao (pedido_id, cliente_id, data_devolucao, motivo, status) VALUES
(1, 1, '2025-01-15 12:00:00', 'Produto com defeito', 'Aguardando Avaliação'),
(2, 3, '2025-01-15 14:00:00', 'Produto com defeito', 'Aguardando Avaliação'),
(3, 5, '2025-01-15 15:00:00', 'Produto danificado', 'Aguardando Avaliação'),
(4, 7, '2025-01-15 16:00:00', 'Produto não corresponde', 'Aguardando Avaliação'),
(5, 9, '2025-01-15 17:00:00', 'Produto errado', 'Aguardando Avaliação'),
(6, 2, '2025-01-15 18:00:00', 'Produto com defeito', 'Aguardando Avaliação'),
(7, 4, '2025-01-15 19:00:00', 'Produto danificado', 'Aguardando Avaliação'),
(8, 6, '2025-01-15 20:00:00', 'Produto não corresponde', 'Aguardando Avaliação'),
(9, 8, '2025-01-15 21:00:00', 'Produto não corresponde', 'Aguardando Avaliação'),
(10, 10, '2025-01-15 22:00:00', 'Produto danificado', 'Aguardando Avaliação');

-- Dados na tabela Log_Acoes
INSERT INTO Log_Acoes (cliente_id, acao, data_hora) VALUES
(1, 'Adicionou produto ao carrinho', '2025-01-14 09:30:00'),
(1, 'Finalizou pedido', '2025-01-14 10:00:00'),
(2, 'Criou conta', '2025-01-14 09:45:00'),
(3, 'Adicionou produto ao carrinho', '2025-01-14 15:30:00'),
(4, 'Finalizou pedido', '2025-01-14 16:10:00'),
(5, 'Criou conta', '2025-01-14 17:45:00'),
(6, 'Adicionou produto ao carrinho', '2025-01-14 18:30:00'),
(7, 'Finalizou pedido', '2025-01-14 19:00:00'),
(8, 'Criou conta', '2025-01-14 20:15:00'),
(9, 'Adicionou produto ao carrinho', '2025-01-14 21:30:00');

