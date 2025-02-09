-- Criar a tabela clientes (se ainda não existir)
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL, -- Garante que não haja e-mails repetidos
    data_cadastro TEXT NOT NULL -- Usa TEXT para armazenar datas no SQLite
);

-- Inserir clientes, ignorando duplicatas de e-mail
INSERT OR IGNORE INTO clientes (nome, email, data_cadastro) VALUES
('Camila Celente', 'camila@email.com', '2025-02-09'),
('João Silva', 'joao@email.com', '2025-02-09'),
('Maria Souza', 'maria@email.com', '2025-02-08');
SELECT * FROM clientes;

-- Contar quantos clientes foram cadastrados em um dia específico
SELECT COUNT(*) AS total_clientes
FROM clientes
WHERE data_cadastro = '2025-02-09';
