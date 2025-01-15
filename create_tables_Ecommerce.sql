CREATE DATABASE Ecommerce;
show databases;
use ecommerce;
show tables;

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf CHAR(11) UNIQUE NULL,
    cnpj CHAR(14) UNIQUE NULL,
    tipo ENUM('PF', 'PJ') NOT NULL
);
SELECT * FROM Cliente;

-- Tabela Endereco
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    endereco_entrega_id INT NOT NULL,
    data_criacao DATETIME NOT NULL,
    status ENUM('Pendente', 'Aprovado', 'Cancelado', 'Enviado', 'Entregue') NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (endereco_entrega_id) REFERENCES Endereco(id_endereco)
);

-- Tabela Categoria
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(255)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id_categoria)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(255) NOT NULL
);

-- Tabela Produto_Estoque (tabela associativa)
CREATE TABLE Produto_Estoque (
    id_produto INT NOT NULL,
    id_estoque INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_estoque),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

-- Tabela Carrinho
CREATE TABLE Carrinho (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

-- Tabela Item_Carrinho
CREATE TABLE Item_Carrinho (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    carrinho_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (carrinho_id) REFERENCES Carrinho(id_carrinho),
    FOREIGN KEY (produto_id) REFERENCES Produto(id_produto)
);

-- Tabela Item_Pedido
CREATE TABLE Item_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (produto_id) REFERENCES Produto(id_produto)
);

-- Tabela Devolucao
CREATE TABLE Devolucao (
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    cliente_id INT NOT NULL,
    data_devolucao DATETIME NOT NULL,
    motivo TEXT,
    status ENUM('Aguardando Avaliação', 'Aprovada', 'Rejeitada') NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

-- Tabela Log_Acoes
CREATE TABLE Log_Acoes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    acao TEXT NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

show tables;

SET FOREIGN_KEY_CHECKS = 1;