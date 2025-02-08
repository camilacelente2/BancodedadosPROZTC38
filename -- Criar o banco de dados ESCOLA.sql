CREATE TABLE ALUNO (
    ID INTEGER PRIMARY KEY,  -- Removido AUTOINCREMENT
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    endereco TEXT
);


-- Verificar se a tabela foi criada corretamente
SELECT * FROM ALUNO;

-- Inserir dados na tabela ALUNO
INSERT INTO ALUNO (nome, email, endereco) VALUES 
('João Carlos', 'Jcarlos@gmail.com', 'Rua 13 de maio'),
('José Vitor', 'Jvitor@gmail.com', 'Rua da Saudade'),
('Paulo André', 'Pandr@gmail.com', 'Rua do Sol');
  
-- Verificar se os dados foram inseridos corretamente
SELECT * FROM ALUNO;

