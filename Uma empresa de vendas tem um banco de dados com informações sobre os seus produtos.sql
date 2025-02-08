-- Criar a tabela de Produtos
CREATE TABLE Produtos1 (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL CHECK (preco > 0)
);

-- Criar a tabela de Pedidos
CREATE TABLE Pedidos1 (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_produto INTEGER,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    data_pedido TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Criar uma VIEW para exibir o relatório diário de vendas
CREATE VIEW Relatorio_Vendas_Diario AS
SELECT 
    DATE(data_pedido) AS data,
    id_produto,
    SUM(quantidade) AS total_vendido
FROM Pedidos
GROUP BY DATE(data_pedido), id_produto;

-- Inserindo alguns produtos
INSERT INTO Produtos (nome, preco) VALUES ('Teclado', 200.00);
INSERT INTO Produtos (nome, preco) VALUES ('Mouse', 150.00);

-- Inserindo pedidos para testes
INSERT INTO Pedidos (id_produto, quantidade, data_pedido) VALUES (1, 3, '2025-02-07 10:30:00');
INSERT INTO Pedidos (id_produto, quantidade, data_pedido) VALUES (2, 2, '2025-02-07 11:00:00');
INSERT INTO Pedidos (id_produto, quantidade, data_pedido) VALUES (1, 1, '2025-02-08 09:45:00');

-- Consultando o relatório
SELECT * FROM Relatorio_Vendas_Diario;
