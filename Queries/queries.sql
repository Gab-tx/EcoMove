-- Listar o nome e email de todos os usuários cadastrados.
SELECT nome, email 
FROM tb_usuario;

-- Mostrar todos os veículos com seu status e porcentagem de bateria.
SELECT codigo_veiculo, tipo, status, nivel_bateria
FROM tb_veiculo;
-- Mostrar todos os estacionamentos com nome e capacidade.
SELECT nome, capacidade
FROM tb_estacionamento;

-- Exibir todas as viagens com valor_total maior que 50.
SELECT * FROM tb_viagem
WHERE valor_total > 50;

-- Listar os veículos com porcentagem de bateria menor que 20%.
SELECT codigo_veiculo, tipo, nivel_bateria
FROM tb_veiculo
WHERE nivel_bateria < 20;

-- Listar o nome do usuário e o valor_total de cada viagem realizada.
SELECT u.nome, v.valor_total
FROM tb_viagem v
JOIN tb_usuario u ON v.fk_usuario = u.id_usuario;

-- Mostrar todas as viagens com o nome do veículo utilizado.
SELECT v.id_viagem, ve.codigo_veiculo, ve.tipo
FROM tb_viagem v
JOIN tb_frota f ON v.fk_frota = f.id_frota
JOIN tb_veiculo ve ON f.fk_veiculo = ve.id_veiculo;

-- Exibir todas as manutenções com o nome do técnico responsável.]
SELECT m.problema, m.solucao, t.nome AS tecnico_responsavel
FROM tb_manutencao m
JOIN tb_tecnico t ON m.fk_tecnico = t.id_tecnico;

-- Listar todos os veículos que já passaram por manutenção, exibindo também o problema registrado.
SELECT ve.codigo_veiculo, ve.tipo, m.problema
FROM tb_manutencao m
JOIN tb_veiculo ve ON m.fk_veiculo = ve.id_veiculo;

-- Mostrar a quantidade de viagens realizadas por cada usuário.
SELECT u.nome, COUNT(v.id_viagem) AS total_viagens
FROM tb_usuario u
LEFT JOIN tb_viagem v ON v.fk_usuario = u.id_usuario
GROUP BY u.nome;