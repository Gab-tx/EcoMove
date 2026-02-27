USE db_ecomove;

INSERT INTO tb_viagem (fk_local_partida, fk_local_chegada, valor_total, horario_inicio, horario_termino, fk_usuario, fk_frota) VALUES
(1, 2, 5.500, '08:00:00', '08:25:00', 1, 1),
(2, 3, 7.200, '09:15:00', '09:50:00', 2, 2),
(3, 4, 4.800, '11:00:00', '11:20:00', 3, 3),
(4, 5, 9.100, '14:30:00', '15:10:00', 4, 4),
(5, 1, 6.300, '17:45:00', '18:15:00', 5, 5); 

