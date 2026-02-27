DELIMITER $$

CREATE PROCEDURE popular_frota()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- 1. Usuarios
    WHILE i <= 1000 DO
        INSERT INTO usuario (nome, CPF, email, saldo, score)
        VALUES (
            CONCAT('Usuario_', i),
            FLOOR(10000000000 + RAND()*89999999999),
            CONCAT('user', i, '@email.com'),
            ROUND(RAND()*500,2),
            ROUND(RAND()*5,2)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 2. Estacionamento
    WHILE i <= 50 DO
        INSERT INTO estacionamento (nome, local, capacidade)
        VALUES (
            CONCAT('Estac_', i),
            CONCAT('Local_', i),
            FLOOR(50 + RAND()*150)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 3. Veiculos
    WHILE i <= 300 DO
        INSERT INTO veiculo (veiculo, porcentagem_bateria, status)
        VALUES (
            CONCAT('Veiculo_', i),
            ROUND(RAND()*100,2),
            IF(RAND() > 0.5, 'Disponivel', 'Em uso')
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 4. Frota
    WHILE i <= 300 DO
        INSERT INTO frota (id_estacionamento, id_veiculo)
        VALUES (
            FLOOR(1 + RAND()*50),
            i
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 5. Tecnicos
    WHILE i <= 50 DO
        INSERT INTO tecnico (nome, CPF, email)
        VALUES (
            CONCAT('Tecnico_', i),
            FLOOR(10000000000 + RAND()*89999999999),
            CONCAT('tec', i, '@email.com')
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 6. Manutenção
    WHILE i <= 200 DO
        INSERT INTO manutencao (problema, peca_substituida, id_veiculo, id_tecnico)
        VALUES (
            'Falha elétrica',
            'Bateria',
            FLOOR(1 + RAND()*300),
            FLOOR(1 + RAND()*50)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 7. Viagens
    WHILE i <= 1000 DO
        INSERT INTO viagem (
            local_partida,
            local_chegada,
            valor_total,
            horario_inicio,
            horario_termino,
            fk_usuario,
            fk_estacionamento,
            fk_veiculo
        )
        VALUES (
            CONCAT('Ponto_', FLOOR(RAND()*100)),
            CONCAT('Destino_', FLOOR(RAND()*100)),
            ROUND(RAND()*100,2),
            SEC_TO_TIME(FLOOR(RAND()*86400)),
            SEC_TO_TIME(FLOOR(RAND()*86400)),
            FLOOR(1 + RAND()*1000),
            FLOOR(1 + RAND()*50),
            FLOOR(1 + RAND()*300)
        );
        SET i = i + 1;
    END WHILE;

END$$

DELIMITER ;

CALL popular_frota();
