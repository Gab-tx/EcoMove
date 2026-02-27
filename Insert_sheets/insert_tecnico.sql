-- Inserts da tabela tecnico
USE db_ecomove;
INSERT INTO tb_tecnico (nome, cpf, email) VALUES
('Roberto Nunes',   33344455566, 'roberto.nunes@eco.com'),
('Fernanda Reis',   77788899900, 'fernanda.reis@eco.com'),
('Lucas Martins',   11100099988, 'lucas.martins@eco.com'),
('Camila Ferreira', 44433322211, 'camila.ferreira@eco.com'),
('Diego Carvalho',  66655544433, 'diego.carvalho@eco.com');

SELECT * FROM tb_tecnico;