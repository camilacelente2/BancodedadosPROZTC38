-- Criando a base de dados (SQLite cria automaticamente ao definir tabelas)

-- Criando a tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- Criando a tabela de Produtos
CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

-- Criando a tabela de Pedidos
CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_produto INTEGER,
    quantidade INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (nome, email) VALUES ('Camila Celente', 'camila@email.com');
INSERT INTO Clientes (nome, email) VALUES ('João Silva', 'joao@email.com');
INSERT INTO Clientes (nome, email) VALUES ('Maria Souza', 'maria@email.com');

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (nome, preco) VALUES ('Notebook', 3500.00);
INSERT INTO Produtos (nome, preco) VALUES ('Smartphone', 2200.00);
INSERT INTO Produtos (nome, preco) VALUES ('Fone de Ouvido', 150.00);

-- Inserindo dados na tabela Pedidos
INSERT INTO Pedidos (id_cliente, id_produto, quantidade, data_pedido) VALUES (1, 1, 1, '2025-02-08');
INSERT INTO Pedidos (id_cliente, id_produto, quantidade, data_pedido) VALUES (2, 2, 2, '2025-02-07');
INSERT INTO Pedidos (id_cliente, id_produto, quantidade, data_pedido) VALUES (3, 3, 3, '2025-02-06');

-- Consulta utilizando JOIN para visualizar os pedidos com detalhes
SELECT 
    Pedidos.id_pedido,
    Clientes.nome AS Cliente,
    Produtos.nome AS Produto,
    Pedidos.quantidade,
    Produtos.preco,
    (Pedidos.quantidade * Produtos.preco) AS Total,
    Pedidos.data_pedido
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
JOIN Produtos ON Pedidos.id_produto = Produtos.id_produto;
