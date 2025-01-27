# Sistema de Gestão para Ecommerce

Este é um projeto de banco de dados para um sistema de gestão de ecommerce, desenvolvido com MySQL. O objetivo do sistema é gerenciar clientes, pedidos, produtos, estoques, e outras funcionalidades essenciais para um ecommerce.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

### 1. Cliente

Armazena informações sobre os clientes, tanto pessoas físicas (PF) quanto pessoas jurídicas (PJ).

**Colunas:**

- `id_cliente` (INT): Identificador único do cliente.
- `nome` (VARCHAR): Nome do cliente.
- `email` (VARCHAR): Email do cliente (único).
- `senha` (VARCHAR): Senha do cliente.
- `cpf` (CHAR): CPF do cliente (opcional e único).
- `cnpj` (CHAR): CNPJ do cliente (opcional e único).
- `tipo` (ENUM): Tipo do cliente (‘PF’ ou ‘PJ’).

### 2. Endereco

Registra os endereços associados aos clientes.

**Colunas:**

- `id_endereco` (INT): Identificador único do endereço.
- `cliente_id` (INT): Identificador do cliente associado.
- `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep` (VARCHAR/CHAR): Dados do endereço.

### 3. Pedido

Armazena os pedidos realizados pelos clientes.

**Colunas:**

- `id_pedido` (INT): Identificador único do pedido.
- `cliente_id` (INT): Cliente que realizou o pedido.
- `endereco_entrega_id` (INT): Endereço de entrega.
- `data_criacao` (DATETIME): Data de criação do pedido.
- `status` (ENUM): Status do pedido (e.g., ‘Pendente’, ‘Aprovado’).
- `valor_total` (DECIMAL): Valor total do pedido.

### 4. Categoria

Define as categorias dos produtos.

**Colunas:**

- `id_categoria` (INT): Identificador único da categoria.
- `nome` (VARCHAR): Nome da categoria.
- `descricao` (TEXT): Descrição da categoria.

### 5. Fornecedor

Registra informações sobre fornecedores.

**Colunas:**

- `id_fornecedor` (INT): Identificador único do fornecedor.
- `nome` (VARCHAR): Nome do fornecedor.
- `cnpj` (CHAR): CNPJ do fornecedor (único).
- `telefone`, `email` (VARCHAR): Contato do fornecedor.

### 6. Produto

Contém informações sobre os produtos vendidos.

**Colunas:**

- `id_produto` (INT): Identificador único do produto.
- `nome` (VARCHAR): Nome do produto.
- `descricao` (TEXT): Descrição do produto.
- `preco` (DECIMAL): Preço do produto.
- `categoria_id` (INT): Categoria associada ao produto.

### 7. Estoque

Gerencia as localizações de estoque.

**Colunas:**

- `id_estoque` (INT): Identificador único do estoque.
- `localizacao` (VARCHAR): Localização do estoque.

### 8. Produto\_Estoque

Tabela associativa para relacionar produtos e estoques.

**Colunas:**

- `id_produto` (INT): Produto no estoque.
- `id_estoque` (INT): Estoque associado.
- `quantidade` (INT): Quantidade do produto.

### 9. Carrinho

Gerencia os carrinhos de compras dos clientes.

**Colunas:**

- `id_carrinho` (INT): Identificador único do carrinho.
- `cliente_id` (INT): Cliente associado ao carrinho.

### 10. Item\_Carrinho

Armazena os itens adicionados nos carrinhos.

**Colunas:**

- `id_item` (INT): Identificador único do item.
- `carrinho_id` (INT): Carrinho associado.
- `produto_id` (INT): Produto adicionado.
- `quantidade` (INT): Quantidade do produto.

### 11. Item\_Pedido

Armazena os itens de cada pedido.

**Colunas:**

- `id_item` (INT): Identificador único do item.
- `pedido_id` (INT): Pedido associado.
- `produto_id` (INT): Produto no pedido.
- `quantidade`, `preco_unitario` (INT/DECIMAL): Quantidade e preço do produto.

### 12. Devolucao

Gerencia solicitações de devolução.

**Colunas:**

- `id_devolucao` (INT): Identificador único da devolução.
- `pedido_id` (INT): Pedido associado.
- `cliente_id` (INT): Cliente que solicitou.
- `data_devolucao` (DATETIME): Data da devolução.
- `motivo` (TEXT): Motivo da devolução.
- `status` (ENUM): Status da devolução.

### 13. Log\_Acoes

Mantém um registro das ações realizadas pelos clientes.

**Colunas:**

- `id_log` (INT): Identificador único do log.
- `cliente_id` (INT): Cliente que realizou a ação.
- `acao` (TEXT): Descrição da ação.
- `data_hora` (DATETIME): Data e hora da ação.

## Instruções para Execução

1. Crie o banco de dados:
   ```sql
   CREATE DATABASE Ecommerce;
   USE Ecommerce;
   ```
2. Execute os comandos SQL para criar as tabelas (veja os detalhes acima).
3. Insira dados iniciais conforme necessário para testar o sistema.
4. Teste as queries, views, procedures e triggers de exemplo

## Tecnologias Utilizadas

- **Banco de Dados:** MySQL
- **Ferramenta de Desenvolvimento:** MySQL Workbench

## Funcionalidades Principais

- Gestão de clientes e seus endereços.
- Cadastro e organização de produtos em categorias.
- Controle de estoque e associação com produtos.
- Registro de pedidos, itens de pedidos e carrinhos de compra.
- Solicitações de devoluções e acompanhamento de status.
- Registro de logs de ações realizadas pelos clientes.



