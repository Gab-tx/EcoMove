DROP PROCEDURE IF EXISTS popular_frota;

DELIMITER $$

CREATE PROCEDURE popular_frota()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- 🔴 Desativa verificação de FK
    SET FOREIGN_KEY_CHECKS = 0;

    -- 🔴 Limpa tabelas (ordem não importa com FK desativada)
    TRUNCATE TABLE tb_viagem;
    TRUNCATE TABLE tb_manutencao;
    TRUNCATE TABLE tb_frota;
    TRUNCATE TABLE tb_veiculo;
    TRUNCATE TABLE tb_tecnico;
    TRUNCATE TABLE tb_usuario;
    TRUNCATE TABLE tb_estacionamento;

    -- 🔴 Ativa novamente FK
    SET FOREIGN_KEY_CHECKS = 1;

    -- 1️⃣ USUÁRIOS
    WHILE i <= 1000 DO
        INSERT INTO tb_usuario (nome, cpf, email, saldo_carteira, score)
        VALUES (
            CONCAT('Usuario_', i),
            LPAD(i,11,'0'),
            CONCAT('user', i, '@email.com'),
            ROUND(RAND()*500,2),
            ROUND(RAND()*100,2)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 2️⃣ ESTACIONAMENTOS
    WHILE i <= 50 DO
        INSERT INTO tb_estacionamento (nome, capacidade, local)
        VALUES (
            CONCAT('Estac_', i),
            FLOOR(50 + RAND()*150),
            CONCAT('Local_', i)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 3️⃣ VEÍCULOS
    WHILE i <= 300 DO
        INSERT INTO tb_veiculo (tipo, codigo_veiculo, nivel_bateria, status, fk_estacionamento)
        VALUES (
            'Patinete',
            1000 + i,
            FLOOR(RAND()*100),
            'Disponivel',
            FLOOR(1 + RAND()*50)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 4️⃣ FROTA
    WHILE i <= 300 DO
        INSERT INTO tb_frota (fk_veiculo, fk_estacionamento)
        VALUES (
            i,
            FLOOR(1 + RAND()*50)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 5️⃣ TÉCNICOS
    WHILE i <= 50 DO
        INSERT INTO tb_tecnico (nome, cpf, email)
        VALUES (
            CONCAT('Tecnico_', i),
            LPAD(i+2000,11,'0'),
            CONCAT('tec', i, '@email.com')
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 6️⃣ MANUTENÇÕES
    WHILE i <= 200 DO
        INSERT INTO tb_manutencao (problema, solucao, peca_substituida, fk_veiculo, fk_tecnico)
        VALUES (
            'Falha elétrica',
            'Troca de bateria',
            'Bateria',
            FLOOR(1 + RAND()*300),
            FLOOR(1 + RAND()*50)
        );
        SET i = i + 1;
    END WHILE;

    SET i = 1;

    -- 7️⃣ VIAGENS
    WHILE i <= 1000 DO
        INSERT INTO tb_viagem (
            fk_local_partida,
            fk_local_chegada,
            valor_total,
            horario_inicio,
            horario_termino,
            fk_usuario,
            fk_frota
        )
        VALUES (
            FLOOR(1 + RAND()*50),
            FLOOR(1 + RAND()*50),
            ROUND(RAND()*100,2),
            SEC_TO_TIME(FLOOR(RAND()*86400)),
            SEC_TO_TIME(FLOOR(RAND()*86400)),
            FLOOR(1 + RAND()*1000),
            FLOOR(1 + RAND()*300)
        );
        SET i = i + 1;
    END WHILE;

END$$

DELIMITER ;