-- Fazer Viagem, Manutenção e técnico
CREATE DATABASE db_ecomove;

USE db_ecomove; 
CREATE TABLE tb_usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf INT(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    saldo_carteira DECIMAL(10,2),
    score DECIMAL(5,2) CHECK (score BETWEEN 0 AND 100)
);

CREATE TABLE tb_estacionamento(
    id_estacionamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    capacidade INT(40) NOT NULL,
    local VARCHAR(60) NOT NULL
);

CREATE TABLE tb_frota(
	id_frota INT PRIMARY KEY AUTO_INCREMENT,
	fk_veiculo INT NOT NULL,
	fk_estacionamento INT NOT NULL
);

CREATE TABLE tb_veiculo(
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45) NOT NULL,
    codigo_veiculo INT(11) NOT NULL UNIQUE,
    nivel_bateria INT CHECK (nivel_bateria BETWEEN 0 AND 100),
    status VARCHAR(45) NOT NULL CHECK (status IN ('Disponivel','Manutenção','Em Uso','Bateria Fraca')),
    fk_estacionamento INT NOT NULL
);

CREATE TABLE tb_viagem (
id_viagem INTEGER PRIMARY KEY AUTO_INCREMENT,
fk_local_partida INT NOT NULL,
fk_local_chegada INT NOT NULL,
valor_total DECIMAL(10,3) NOT NULL,
horario_inicio TIME NOT NULL,
horario_termino TIME NOT NULL,
fk_usuario INT NOT NULL,
fk_frota INT NOT NULL
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
cpf INT(11) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE
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
FOREIGN KEY (fk_frota) REFERENCES tb_frota(id_frota);

ALTER TABLE tb_viagem
ADD CONSTRAINT fk_local_partida
FOREIGN KEY (fk_local_partida) REFERENCES tb_estacionamento(id_estacionamento);

ALTER TABLE tb_viagem
ADD CONSTRAINT fk_local_chegada
FOREIGN KEY (fk_local_chegada) REFERENCES tb_estacionamento(id_estacionamento);

