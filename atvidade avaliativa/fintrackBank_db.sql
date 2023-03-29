CREATE DATABASE IF NOT EXISTS fintrack
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

USE fintrack;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usu INT AUTO_INCREMENT PRIMARY KEY,
  nome_usu VARCHAR(50) NOT NULL,
  email_usu VARCHAR(100) NOT NULL UNIQUE,
  cpf_usu VARCHAR(11) NOT NULL UNIQUE,
  senha_usu VARBINARY(255) NOT NULL,
  saldo_conta DECIMAL(9,2) NOT NULL DEFAULT 0,
  limite_total DECIMAL(9,2) NOT NULL DEFAULT 0
) DEFAULT CHARSET = utf8 COMMENT 'Informações pessoais e da carteira do usuario';

CREATE TABLE IF NOT EXISTS categorias (
  id_cat INT AUTO_INCREMENT PRIMARY KEY,
  nome_cat VARCHAR(50) NOT NULL,
  descricao_cat VARCHAR(150) UNIQUE
) DEFAULT CHARSET = utf8 COMMENT 'Tabela de categorias';

CREATE TABLE IF NOT EXISTS movimentos (
  id_mov INT AUTO_INCREMENT PRIMARY KEY,
  data_mov DATE NOT NULL,
  descricao_mov VARCHAR(150),
  idCategoria_mov INT NOT NULL,
  tipo_mov VARCHAR(20) NOT NULL,
  valor_mov DECIMAL(9,2) NOT NULL,
  status_mov VARCHAR(20) NOT NULL,
  FOREIGN KEY (idCategoria_mov) REFERENCES categorias (id_cat)
) DEFAULT CHARSET = utf8 COMMENT 'Tabela de movimentos';