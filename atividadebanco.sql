-- Detalhes da Tabela de Região
CREATE TABLE Região (
   IdRegiao INT PRIMARY KEY,
   NomeDaRegiao VARCHAR(255),
   TamanhoRegiao INT
);

-- Detalhes da Tabela de Veículo
CREATE TABLE Veículo (
   IdVeiculo INT PRIMARY KEY,
   CorDoVeiculo VARCHAR(50),
   PlacaVeiculo VARCHAR(20)
);

-- Detalhes da Tabela de Vendedor
CREATE TABLE Vendedor (
   IdVendedor INT PRIMARY KEY,
   NomeDoVendedor VARCHAR(255),
   IdRegiao INT,
   FOREIGN KEY (IdRegiao) REFERENCES Região(IdRegiao)
);

-- Detalhes da Tabela de Responsável
CREATE TABLE Responsável (
   IdResponsavel INT PRIMARY KEY,
   IdVendedor INT,
   IdVeiculo INT,
   DataDoResponsavel DATE,
   FOREIGN KEY (IdVendedor) REFERENCES Vendedor(IdVendedor),
   FOREIGN KEY (IdVeiculo) REFERENCES Veículo(IdVeiculo)
);

-- Detalhes da Tabela de Cliente
CREATE TABLE Cliente (
   IdCliente INT PRIMARY KEY,
   NomeDoCliente VARCHAR(255),
   CPFDaCliente VARCHAR(15),
   DataDeNascimento DATE
);

-- Detalhes da Tabela de Nota Fiscal
CREATE TABLE NotaFiscal (
   IdNotaFiscal INT PRIMARY KEY,
   DATAeHORA DATETIME,
   IdVendedor INT,
   IdCliente INT,
   FOREIGN KEY (IdVendedor) REFERENCES Vendedor(IdVendedor),
   FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);

-- Detalhes da Tabela de Ponto Estratégico
CREATE TABLE PontoEstratégico (
   IdPonto INT PRIMARY KEY,
   NomeDoPonto VARCHAR(255),
   IdRegiao INT,
   DataDoPedido DATE,
   FOREIGN KEY (IdRegiao) REFERENCES Região(IdRegiao)
);

-- Detalhes da Tabela de Produto
CREATE TABLE Produto (
   IdProduto INT PRIMARY KEY,
   ValorDoProduto DECIMAL(10, 2),
   DescricaoProduto VARCHAR(255),
   QuantidadeProdutos INT
);

-- Detalhes da Tabela de Itens da Nota
CREATE TABLE ItensdaNota (
   IdItem INT PRIMARY KEY,
   IdProduto INT,
   QuantidadeDeItens INT,
   IdNotaFiscal INT,
   FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto),
   FOREIGN KEY (IdNotaFiscal) REFERENCES NotaFiscal(IdNotaFiscal)
);

-- Inserções personalizadas para a tabela Região
INSERT INTO Região (IdRegiao, NomeDaRegiao, TamanhoRegiao)
VALUES
   (6, 'Região Zeta', 95),
   (7, 'Região Epsilon', 130),
   (8, 'Região Kappa', 165),
   (9, 'Região Lambda', 110),
   (10, 'Região Sigma', 145);

-- Inserções personalizadas para a tabela Veículo
INSERT INTO Veículo (IdVeiculo, CorDoVeiculo, PlacaVeiculo)
VALUES
   (6, 'Rosa', 'MNO456'),
   (7, 'Cinza', 'PQR789'),
   (8, 'Roxo', 'STU012'),
   (9, 'Laranja', 'VWX345'),
   (10, 'Prata', 'YZA678');

-- Inserções personalizadas para a tabela Vendedor
INSERT INTO Vendedor (IdVendedor, NomeDoVendedor, IdRegiao)
VALUES
   (6, 'Bruna Oliveira', 7),
   (7, 'Felipe Souza', 10),
   (8, 'Carla Lima', 6),
   (9, 'Gustavo Santos', 9),
   (10, 'Mariana Costa', 8);

-- Inserções personalizadas para a tabela Responsável
INSERT INTO Responsável (IdResponsavel, IdVendedor, IdVeiculo, DataDoResponsavel)
VALUES
   (11, 7, 10, '2023-11-15'),
   (12, 10, 8, '2023-12-20'),
   (13, 8, 6, '2023-01-25'),
   (14, 9, 9, '2023-02-10'),
   (15, 6, 7, '2023-03-05'),
   (16, 7, 6, '2023-04-12'),
   (17, 10, 7, '2023-05-18'),
   (18, 8, 10, '2023-06-22'),
   (19, 9, 8, '2023-07-30'),
   (20, 6, 9, '2023-08-08');

-- Inserções personalizadas para a tabela Cliente
INSERT INTO Cliente (IdCliente, NomeDoCliente, CPFDaCliente, DataDeNascimento)
VALUES
   (11, 'João Ferreira', '345.678.901-34', '1991-10-25'),
   (12, 'Tatiana Silva', '456.789.012-45', '1986-06-18'),
   (13, 'Pedro Rocha', '567.890.123-56', '1993-03-03'),
   (14, 'Luciana Oliveira', '678.901.234-67', '1989-12-20'),
   (15, 'Eduardo Santos', '789.012.345-78', '1996-08-07'),
   (16, 'Fernanda Lima', '890.123.456-89', '1983-05-14'),
   (17, 'Ricardo Souza', '901.234.567-90', '1999-02-01'),
   (18, 'Bianca Costa', '012.345.678-01', '1984-09-18'),
   (19, 'Gabriela Martins', '123.456.789-12', '1997-04-15'),
   (20, 'Henrique Oliveira', '234.567.890-23', '1987-11-22');

-- Inserções personalizadas para a tabela Nota Fiscal
INSERT INTO NotaFiscal (IdNotaFiscal, DATAeHORA, IdVendedor, IdCliente)
VALUES
(11, CONVERT(DATETIME, '2023-11-02 08:30:00', 120), 6, 13),
(12, CONVERT(DATETIME, '2023-12-05 12:15:00', 120), 7, 17),
(13, CONVERT(DATETIME, '2024-01-10 14:45:00', 120), 8, 15),
(14, CONVERT(DATETIME, '2024-02-15 10:20:00', 120), 9, 18),
(15, CONVERT(DATETIME, '2024-03-20 09:00:00', 120), 10, 14),
(16, CONVERT(DATETIME, '2024-04-25 16:30:00', 120), 6, 19),
(17, CONVERT(DATETIME, '2024-05-30 11:45:00', 120), 7, 12),
(18, CONVERT(DATETIME, '2024-06-05 13:00:00', 120), 8, 11),
(19, CONVERT(DATETIME, '2024-07-12 07:00:00', 120), 9, 16),
(20, CONVERT(DATETIME, '2024-08-18 15:10:00', 120), 10, 20);

-- Inserções personalizadas para a tabela Ponto Estratégico
INSERT INTO PontoEstratégico (IdPonto, NomeDoPonto, IdRegiao, DataDoPedido)
VALUES
(11, 'Ponto 11', 8, '2023-11-05'),
(12, 'Ponto 12', 10, '2023-12-08'),
(13, 'Ponto 13', 6, '2024-01-12'),
(14, 'Ponto 14', 9, '2024-02-18'),
(15, 'Ponto 15', 7, '2024-03-22'),
(16, 'Ponto 16', 10, '2024-04-28'),
(17, 'Ponto 17', 9, '2024-05-02'),
(18, 'Ponto 18', 8, '2024-06-10'),
(19, 'Ponto 19', 7, '2024-07-15'),
(20, 'Ponto 20', 6, '2024-08-20');

-- Inserções personalizadas para a tabela Produto
INSERT INTO Produto (IdProduto, ValorDoProduto, DescricaoProduto, QuantidadeProdutos)
VALUES
(11, 55.99, 'Produto K', 100),
(12, 35.50, 'Produto L', 150),
(13, 27.75, 'Produto M', 120),
(14, 65.20, 'Produto N', 200),
(15, 19.99, 'Produto O', 180),
(16, 45.75, 'Produto P', 90),
(17, 60.00, 'Produto Q', 130),
(18, 75.50, 'Produto R', 160),
(19, 23.30, 'Produto S', 110),
(20, 28.75, 'Produto T', 140);

-- Inserções personalizadas para a tabela Itens da Nota
INSERT INTO ItensdaNota (IdItem, IdProduto, QuantidadeDeItens, IdNotaFiscal)
VALUES
(11, 13, 2, 11),
(12, 18, 3, 12),
(13, 11, 1, 13),
(14, 16, 4, 14),
(15, 15, 2, 15),
(16, 20, 1, 16),
(17, 12, 3, 17),
(18, 17, 2, 18),
(19, 14, 5, 19),
(20, 19, 1, 20);

-- Seleção de dados de Ponto Estratégico e Região
SELECT PontoEstratégico.*, Região.NomeDaRegiao
FROM PontoEstratégico
INNER JOIN Região ON PontoEstratégico.IdRegiao = Região.IdRegiao;

-- Seleção de dados da tabela Região
SELECT NomeDaRegiao FROM Região;

-- Seleção de dados de Vendedor e Responsável no mês anterior
SELECT Vendedor.*, Responsável.IdVeiculo, Responsável.DataDoResponsavel
FROM Vendedor
INNER JOIN Responsável ON Vendedor.IdVendedor = Responsável.IdVendedor
WHERE MONTH(Responsável.DataDoResponsavel) = MONTH(GETDATE()) - 1;

-- Seleção de dados de Vendedor e Região
SELECT Vendedor.*, Região.NomeDaRegiao
FROM Vendedor
INNER JOIN Região ON Vendedor.IdRegiao = Região.IdRegiao;

-- Seleção de dados de Produto relacionado ao Vendedor através da Nota Fiscal
SELECT Produto.*
FROM Produto
INNER JOIN ItensdaNota ON Produto.IdProduto = ItensdaNota.IdProduto
INNER JOIN NotaFiscal ON ItensdaNota.IdNotaFiscal = NotaFiscal.IdNotaFiscal
WHERE NotaFiscal.IdVendedor = IdVendedor;

-- Seleção de dados de Vendedor pela Nota Fiscal e Itens da Nota
SELECT Vendedor.*
FROM Vendedor
INNER JOIN NotaFiscal ON Vendedor.IdVendedor = NotaFiscal.IdVendedor
INNER JOIN ItensdaNota ON NotaFiscal.IdNotaFiscal = ItensdaNota.IdNotaFiscal
WHERE ItensdaNota.IdProduto = IdProduto;

-- Seleção de dados de Produto sem relação com Itens da Nota
SELECT Produto.*
FROM Produto
LEFT JOIN ItensdaNota ON Produto.IdProduto = ItensdaNota.IdProduto
WHERE ItensdaNota.IdProduto IS NULL;

-- Seleção de dados de Responsável e Veículo
SELECT Responsável.*, Veículo.CorDoVeiculo, Veículo.PlacaVeiculo
FROM Responsável
INNER JOIN Veículo ON Responsável.IdVeiculo = Veículo.IdVeiculo
WHERE Veículo.IdVeiculo = Responsável.IdVeiculo;

-- Contagem de Itens por Nota Fiscal
SELECT IdNotaFiscal, COUNT(IdItem) AS QuantidadeDeItens
FROM ItensdaNota
GROUP BY IdNotaFiscal;