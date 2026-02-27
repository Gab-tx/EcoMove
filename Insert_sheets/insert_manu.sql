USE db_ecomove;

INSERT INTO tb_manutencao (problema, solucao, peca_substituida, fk_veiculo, fk_tecnico) VALUES
('Freio com defeito',          'Substituição do freio',  'Cabo de freio', 5, 1),
('Bateria descarregando rápido','Troca da bateria',       'Bateria 36V',   3, 2),
('Pneu furado',                'Troca do pneu',          'Pneu 8.5 pol',  1, 3),
('Display não liga',           'Reparo na fiação',        NULL,            4, 4),
('Guidão solto',               'Reaperto e ajuste',       NULL,            2, 5);