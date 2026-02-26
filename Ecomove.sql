-- Fazer Viagem, Manutenção e técnico
CREATE DATABASE db_ecomove;

USE db_ecomove; 

CREATE TABLE tb_viagem (
id_viagem INTEGER PRIMARY KEY AUTO_INCREMENT,
local_partida VARCHAR(45) NOT NULL,
local_chegada VARCHAR(45) NOT NULL,
valor_total DECIMAL(10,3) NOT NULL,
horario_inicio TIME NOT NULL,
horario_termino TIME NOT NULL,
fk_usuario INT NOT NULL,
fk_estacionamento INT NOT NULL,
fk_veiculo INT NOT NULL
-- Requer tabelas: Usuario, frota, estacionamento
);
CREATE TABLE tb_manutencao(
id_manu INTEGER PRIMARY KEY AUTO_INCREMENT, 
problema VARCHAR(100) NOT NULL,
solucao VARCHAR(100) NOT NULL,
peca_substituida VARCHAR(60),
fk_veiculo INT NOT NULL,
fk_tecnico INT NOT NULL
-- Requer tabelas: Veiculo, tecnico
);

CREATE TABLE tb_tecnico(
id_tecnico INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
cpf INT(11) NOT NULL,
email VARCHAR(100) NOT NULL
);

-- Foreign Keys
-- Manutenção <-> veiculo,tecnico
ALTER TABLE tb_manutencao
ADD CONSTRAINT fk_tecnico
FOREIGN KEY (fk_tecnico) REFERENCES tb_tecnico(id_tecnico);

ALTER TABLE tb_manutencao
ADD CONSTRAINT fk_veiculo
FOREIGN KEY (fk_veiculo) REFERENCES tb_veiculo(id_veiculo);

-- Viagem <-> usuario, frota, estacionamento

ALTER TABLE tb_viagem
ADD CONSTRAINT fk_usuario 
FOREIGN KEY (fk_usuario) REFERENCES tb_usuario(id_usuario);

ALTER TABLE tb_viagem
ADD CONSTRAINT fk_frota
FOREIGN KEY (fk_frota) REFERENCES tb_frota(fk_veiculo);

ALTER TABLE tb_viagem
ADD CONSTRAINT fk_estacionamento
FOREIGN KEY (fk_estacionamento) REFERENCES tb_frota(fk_estacionamento);