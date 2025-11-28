CREATE DATABASE Atividade_Transacao;
USE Atividade_Transacao;

CREATE TABLE Clientes (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    ano_nasc INT
);

CREATE TABLE Produtos (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Vendas (
    id INT IDENTITY PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    data_venda DATE,
    quantidade INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

INSERT INTO Clientes (nome, ano_nasc) VALUES
('Ana', 2000),
('Bruno', 1998),
('Carlos', 1995);

INSERT INTO Produtos (nome, preco, estoque) VALUES
('Mouse Gamer', 120.00, 10),
('Teclado Mecânico', 350.00, 5),
('Headset', 200.00, 8);

SELECT * FROM Clientes
SELECT * FROM Produtos
SELECT * FROM Vendas