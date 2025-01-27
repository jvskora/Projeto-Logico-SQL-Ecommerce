--  Procedure para Registrar Devolução de Produto

DELIMITER //

CREATE PROCEDURE registrar_devolucao(
    IN p_pedido_id INT,
    IN p_cliente_id INT,
    IN p_motivo VARCHAR(255)
)
BEGIN
    DECLARE v_data_devolucao DATETIME;
    DECLARE v_status VARCHAR(50);

    SET v_data_devolucao = NOW();
    SET v_status = 'Aguardando Avaliação';

    INSERT INTO Devolucao (pedido_id, cliente_id, data_devolucao, motivo, status)
    VALUES (p_pedido_id, p_cliente_id, v_data_devolucao, p_motivo, v_status);

    -- Atualizar status do pedido para devolução
    UPDATE Pedido
    SET status = 'Devolução Pendentes'
    WHERE id = p_pedido_id;
END //

DELIMITER ;

-- Procedure para Atualizar Estoque após Venda

DELIMITER //

CREATE PROCEDURE atualizar_estoque(
    IN p_produto_id INT,
    IN p_quantidade_vendida INT
)
BEGIN
    DECLARE v_quantidade_atual INT;

    -- Buscar a quantidade atual no estoque
    SELECT quantidade INTO v_quantidade_atual
    FROM Produto_Estoque
    WHERE id_produto = p_produto_id AND id_estoque = 1; -- Exemplo para o primeiro estoque

    -- Atualizar a quantidade no estoque
    IF v_quantidade_atual >= p_quantidade_vendida THEN
        UPDATE Produto_Estoque
        SET quantidade = v_quantidade_atual - p_quantidade_vendida
        WHERE id_produto = p_produto_id AND id_estoque = 1;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente!';
    END IF;
END //

DELIMITER ;

-- Procedure para Criar Pedido e Atualizar Carrinho
DELIMITER //

CREATE PROCEDURE criar_pedido(
    IN p_cliente_id INT,
    IN p_endereco_entrega_id INT,
    OUT p_pedido_id INT
)
BEGIN
    DECLARE v_valor_total DECIMAL(10, 2);
    DECLARE v_status VARCHAR(50);

    -- Calcular o valor total do pedido
    SELECT SUM(i.quantidade * p.preco) INTO v_valor_total
    FROM Item_Carrinho i
    JOIN Produto p ON i.produto_id = p.id
    WHERE i.carrinho_id IN (SELECT id FROM Carrinho WHERE cliente_id = p_cliente_id);

    SET v_status = 'Pendente';

    -- Criar pedido
    INSERT INTO Pedido (cliente_id, endereco_entrega_id, data_criacao, status, valor_total)
    VALUES (p_cliente_id, p_endereco_entrega_id, NOW(), v_status, v_valor_total);

    -- Obter o id do pedido criado
    SET p_pedido_id = LAST_INSERT_ID();

    -- Limpar itens do carrinho após criar o pedido
    DELETE FROM Item_Carrinho WHERE carrinho_id IN (SELECT id FROM Carrinho WHERE cliente_id = p_cliente_id);
END //

DELIMITER ;