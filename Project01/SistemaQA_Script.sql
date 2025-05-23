-- Banco de Dados: SistemaQA
CREATE DATABASE SistemaQA;
GO

USE SistemaQA;
GO

-- Tabela: UsuariosApp
CREATE TABLE UsuariosApp (
    id INT PRIMARY KEY IDENTITY,
    nome_usuario VARCHAR(100),
    email VARCHAR(150),
    data_cadastro DATE,
    ativo BIT
);

-- Tabela: TestesFuncionais
CREATE TABLE TestesFuncionais (
    id INT PRIMARY KEY IDENTITY,
    nome_teste VARCHAR(255),
    resultado VARCHAR(20),
    data_execucao DATE,
    responsavel VARCHAR(100)
);

-- Tabela: BugsReportados
CREATE TABLE BugsReportados (
    id INT PRIMARY KEY IDENTITY,
    titulo_bug VARCHAR(255),
    severidade VARCHAR(20),
    status_bug VARCHAR(30),
    data_report DATE,
    usuario_responsavel INT,
    FOREIGN KEY (usuario_responsavel) REFERENCES UsuariosApp(id)
);

-- INSERTs de exemplo em UsuariosApp
INSERT INTO UsuariosApp (nome_usuario, email, data_cadastro, ativo) VALUES
('Bruno QA', 'bruno.qa@teste.com', '2023-05-10', 1),
('Ana Tester', 'ana.tester@qa.com', '2022-12-01', 1),
('Carlos Dev', 'carlos.dev@dev.com', '2021-09-15', 0);

-- INSERTs em TestesFuncionais
INSERT INTO TestesFuncionais (nome_teste, resultado, data_execucao, responsavel) VALUES
('Validação de login', 'sucesso', '2024-01-15', 'Bruno QA'),
('Cadastro com email inválido', 'falha', '2024-01-20', 'Ana Tester'),
('Reset de senha', 'sucesso', '2024-01-22', 'Bruno QA');

-- INSERTs em BugsReportados
INSERT INTO BugsReportados (titulo_bug, severidade, status_bug, data_report, usuario_responsavel) VALUES
('Erro ao salvar formulário', 'Alta', 'Aberto', '2024-01-23', 1),
('Botão quebrado na home', 'Média', 'Em análise', '2024-01-24', 2),
('Crash no app Android', 'Crítica', 'Resolvido', '2024-01-25', 1);