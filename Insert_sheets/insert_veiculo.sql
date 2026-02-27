USE db_ecomove;
INSERT INTO tb_veiculo (tipo, codigo_veiculo, nivel_bateria, status, fk_estacionamento) VALUES
('Patinete',   10001, 85, 'Disponivel',   1),
('Bicicleta',  10002, 100,'Disponivel',   2),
('Patinete',   10003, 60, 'Disponivel',   3),
('Bicicleta',  10004, 45, 'Em Uso',       1),
('Patinete',   10005, 18, 'Bateria Fraca',4);