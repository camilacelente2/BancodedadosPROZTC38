-- Criar a tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- Criar a tabela de Produtos
CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL CHECK (preco > 0)
);

-- Criar a tabela de Pedidos
CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_produto INTEGER,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    data_pedido TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Criar um trigger que define automaticamente a data do pedido ao inserir um novo pedido
CREATE TRIGGER set_data_pedido
AFTER INSERT ON Pedidos
BEGIN
    UPDATE Pedidos 
    SET data_pedido = DATETIME('now') 
    WHERE id_pedido = NEW.id_pedido;
END;

-- Inserindo dados de teste
INSERT INTO Clientes (nome, email) VALUES ('Camila Celente', 'camila@email.com');
INSERT INTO Produtos (nome, preco) VALUES ('Notebook', 3500.00);
INSERT INTO Produtos (nome, preco) VALUES ('Mouse', 150.00);

-- Inserindo um pedido para testar o trigger
INSERT INTO Pedidos (id_cliente, id_produto, quantidade) VALUES (1, 1, 2);

-- Visualizando os dados inseridos
SELECT * FROM Clientes;
SELECT * FROM Produtos;
SELECT * FROM Pedidos;
