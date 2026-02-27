# 🛴 EcoMove — Sistema de Gestão de Micro-mobilidade Elétrica

Banco de dados relacional para gerenciamento de veículos elétricos compartilhados (patinetes e bicicletas), viagens, estacionamentos, manutenções e técnicos.

---

## 📦 Tecnologia

- **MySQL** — Banco de dados relacional

---

## 🗂️ Estrutura do Banco

| Tabela | Descrição |
|---|---|
| `tb_usuario` | Usuários do sistema |
| `tb_veiculo` | Veículos da frota (patinetes e bicicletas) |
| `tb_estacionamento` | Zonas de estacionamento (hotspots) |
| `tb_frota` | Associação entre veículos e estacionamentos |
| `tb_viagem` | Registro de viagens realizadas |
| `tb_manutencao` | Chamados de manutenção dos veículos |
| `tb_tecnico` | Técnicos responsáveis pelas manutenções |

---

## 🔗 Relacionamentos

- Um **Usuário** pode realizar muitas **Viagens** (1:N)
- Um **Veículo** pode aparecer em muitas **Viagens** (1:N)
- **Usuário ↔ Veículo** é resolvido via tabela associativa **Viagem**
- Uma **Zona de Estacionamento** pode conter muitos **Veículos** (1:N)
- Um **Veículo** pode ter muitos registros de **Manutenção** (1:N)
- Um **Técnico** pode abrir muitos chamados de **Manutenção** (1:N)

---

## ✅ Restrições e Regras

- `cpf` e `email` são **UNIQUE** em `tb_usuario` e `tb_tecnico`
- `codigo_veiculo` é **UNIQUE** em `tb_veiculo`
- `nivel_bateria` aceita apenas valores entre **0 e 100**
- `status` do veículo aceita apenas: `Disponivel`, `Em Uso`, `Manutenção`, `Bateria Fraca`
- `score` do usuário aceita valores entre **0 e 100**

---

## 🚀 Como usar

1. Execute o script de criação do banco:
```sql
-- Cria o banco e todas as tabelas
SOURCE ecomove_final.sql;
```

2. Os inserts de teste já estão incluídos no mesmo arquivo, populando todas as tabelas com 5 registros cada.

---

## 📁 Arquivos

| Arquivo | Descrição |
|---|---|
| `ecomove_final.sql` | Script completo: criação das tabelas, FKs e inserts de teste |
