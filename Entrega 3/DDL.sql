-- Criação do Banco de Dados
CREATE DATABASE farmacia_db;
USE farmacia_db;

-- Tabela Pessoa 
CREATE TABLE pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

-- Tabela Cliente 
CREATE TABLE cliente (
    id_pessoa_FK INT PRIMARY KEY,
    data_cadastro DATE NOT NULL,
    pontos_fidelidade INT DEFAULT 0,
    email VARCHAR(100),
    FOREIGN KEY (id_pessoa_FK) REFERENCES pessoa(id_pessoa)
);

-- Tabela Funcionario [cite: 55] (Necessário para a Venda)
CREATE TABLE funcionario (
    id_pessoa_FK INT PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pessoa_FK) REFERENCES pessoa(id_pessoa)
);

-- Tabela Produto 
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_comercial VARCHAR(100) NOT NULL,
    codigo_barras VARCHAR(50) UNIQUE NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL
);

-- Tabela Venda 
CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    id_pessoa_cliente_FK INT,
    id_pessoa_funcionario_FK INT NOT NULL,
    FOREIGN KEY (id_pessoa_cliente_FK) REFERENCES cliente(id_pessoa_FK),
    FOREIGN KEY (id_pessoa_funcionario_FK) REFERENCES funcionario(id_pessoa_FK)
);

-- Tabela Item Venda 
CREATE TABLE item_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda_FK INT NOT NULL,
    id_produto_FK INT NOT NULL,
    quantidade_vendida INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda_FK) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto_FK) REFERENCES produto(id_produto)
);