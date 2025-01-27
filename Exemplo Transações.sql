-- Transação simples 
-- Desabilitando o autocommit
SET autocommit = 0;

-- Iniciando a transação
START TRANSACTION;

-- Exemplo de modificações
UPDATE produtos SET preco = preco * 1.1 WHERE categoria = 'Eletrônicos';

-- Confirmando a transação
COMMIT;

-- Caso ocorra um erro, você pode usar um ROLLBACK
-- ROLLBACK;

-- Transação com procedure: 

DELIMITER $$

CREATE PROCEDURE atualizar_preco()
BEGIN
    -- Inicia a transação
    START TRANSACTION;

    -- Definindo um ponto de salvamento (Savepoint)
    SAVEPOINT antes_atualizacao;

    -- Tentando realizar a atualização
    BEGIN
        UPDATE produtos SET preco = preco * 1.1 WHERE categoria = 'Eletrônicos';
        
        -- Se algo der errado, podemos fazer o rollback para o ponto de salvamento
        -- Exemplo de erro: podemos simular um erro aqui usando um comando incorreto
        -- COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO antes_atualizacao;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro na transação!';
    END;

    -- Se tudo correr bem, confirma a transação
    COMMIT;
END $$

DELIMITER ;
