
Microsoft: Introdução ao SQL Server 2022
Fundamentos de SQL para Testadores de Software
Paulo Pinheiro
Quality Assurance Analyst | Test Automation | Cypress : Detox : Playwright | TDD : BDD : Agile testing
Publicado em 2 de fev. de 2023

A minha ideia original era falar sobre testes em bancos de dados, mas para tal, resolvi fazer antes uma pequena introdução resumindo conceitos básicos, para que em um novo artigo aborde os testes com consultas em bancos de dados utilizando SQL.

SQL: Linguagem de Consulta Estruturada
O SQL é uma linguagem padrão para manipulação de registros em bancos de dados relacionais. A sigla SQL vem dos termos em inglês "Structured Query Language", que em português soa como "Linguagem de Consulta Estruturada". Como testador de software, é crucial realizar testes de banco de dados, exigindo o conhecimento de diferentes conceitos de banco de dados e SQL. Além disso, é necessário escrever consultas SQL para recuperar, atualizar e inserir dados nos bancos de dados. Portanto, aprender essa habilidade é igualmente importante para os profissionais de teste de software, assim como para desenvolvedores, DBAs e SQL.

1. Fundamentos de Banco de Dados
1.1 O que é um banco de dados?
Um banco de dados é uma coleção organizada e sistemática de dados armazenados e acessados em um sistema de computador. As organizações usam bancos de dados como método para armazenar, gerenciar e recuperar informações em tempo real.

1.2 SGBD - Sistema de Gerenciamento de Banco de Dados
O DBMS é um sistema de software projetado para manter e acessar o banco de dados, permitindo ao usuário acessar, criar, excluir e atualizar dados.

1.3 RDBMS - Sistema de Gerenciamento de Banco de Dados Relacional
O RDBMS, uma versão avançada do DBMS, utiliza o modelo relacional para criar bancos de dados relacionais, permitindo armazenar dados relacionados em várias tabelas.

1.4 Tabelas
Um banco de dados RDBMS usa tabelas para armazenar dados, sendo uma coleção de dados relacionados organizados em linhas e colunas.

1.5 Linhas
Uma row representa uma coleção de campos que formam um registro no banco de dados.

1.6 Colunas
Em um banco de dados, uma coluna representa valores do mesmo tipo e é também chamada de atributo.

2. Fundamentos do SQL
2.1 O que é SQL?
SQL é uma linguagem de programação usada para solicitar informações de um banco de dados, permitindo gerenciar e compartilhar dados em um sistema de gerenciamento de banco de dados relacional. Pode ser incorporado a outras linguagens por meio de bibliotecas e módulos SQL.

2.2 Os 5 Subconjuntos da Linguagem SQL
DML: Linguagem de Manipulação de Dados

Conjunto de comandos para manipular dados armazenados, incluindo INSERT, DELETE e UPDATE.
DQL: Linguagem de Consulta de Dados

Conjunto SQL que define o comando SELECT para consultar dados armazenados.
DDL: Linguagem de Definição de Dados

Conjunto SQL para gerenciar estruturas de banco de dados, incluindo CREATE, DROP e ALTER.
DCL: Linguagem de Controle de Dados

Conjunto para controlar acesso aos dados usando GRANT e REVOKE.
DTL ou TCL: Linguagem de Transação de Dados

Conjunto que gerencia transações, incluindo COMMIT, BEGIN e ROLLBACK.
3. Comandos, Funções e Operadores
A seguir, são apresentados alguns comandos, funções e operadores SQL essenciais:

SQL CREATE
O comando CREATE é utilizado para criar bancos de dados e tabelas.


CREATE DATABASE empresa;
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(100)
);
SQL INSERT
O comando INSERT é usado para inserir novos registros em uma tabela.


INSERT INTO funcionarios (id, nome, cargo) VALUES (1, 'Fernando', 'Analista de Sistemas');
SQL UPDATE
O comando UPDATE é utilizado para atualizar registros em uma tabela.


UPDATE funcionarios SET cargo = 'Analista de Sistemas e Aplicações' WHERE id = 1;
SQL DELETE
O comando DELETE é utilizado para excluir dados de uma tabela.


DELETE FROM funcionarios WHERE id = 1;
SQL SELECT
O comando SELECT é utilizado para consultar e selecionar dados de uma tabela.


SELECT id, nome, cargo FROM funcionarios;
SQL JOIN
A cláusula JOIN é utilizada para combinar linhas de várias tabelas com base na relação entre colunas.


-- Exemplo INNER JOIN
SELECT funcionarios.id, funcionarios.nome, departamentos.nome AS departamento
FROM funcionarios
INNER JOIN departamentos ON funcionarios.departamento_id = departamentos.id;
SQL UNION
A função UNION é usada para combinar resultados de dois ou mais comandos SELECT.


-- Exemplo UNION
SELECT nome FROM funcionarios
UNION
SELECT nome FROM clientes;
SQL CASE
A expressão CASE é usada para avaliar uma lista de condições e retornar um resultado específico.


-- Exemplo CASE
SELECT nome, nota,
    CASE
        WHEN nota = 7 THEN 100*0.7
        WHEN nota = 8 THEN 100*0.8
        WHEN nota = 9 THEN 100*0.9
        WHEN nota = 10 THEN 100
        ELSE 0
    END AS bonus
FROM treinamento;
SQL LIKE
O operador LIKE é utilizado para buscar padrões em strings.


-- Exemplo LIKE
SELECT * FROM funcionarios WHERE nome LIKE 'a%';
SQL BETWEEN
O operador BETWEEN é usado para selecionar valores dentro de um intervalo determinado.


-- Exemplo BETWEEN
SELECT * FROM funcionarios WHERE salario BETWEEN 2000 AND 5000;
SQL GROUP BY
A cláusula GROUP BY é responsável por agrupar linhas com valores correspondentes em determinadas colunas.


-- Exemplo GROUP BY
SELECT COUNT(id), cargo FROM funcionarios GROUP BY cargo;
SQL SUBSTRING
A função SUBSTRING é usada para extrair parte específica de uma string.


-- Exemplo SUBSTRING
SELECT nome, SUBSTRING(nome, 1, 5) AS substring FROM funcionarios;
SQL COUNT
A função COUNT é usada para contar a quantidade de registros que correspondem a um critério específico.


-- Exemplo COUNT
SELECT COUNT(id) FROM funcionarios;
SQL DISTINCT
A cláusula DISTINCT é usada para retornar apenas valores únicos em uma coluna.


-- Exemplo DISTINCT
SELECT DISTINCT cidade FROM funcionarios;
SQL DROP
O comando DROP é usado para excluir permanentemente componentes de um banco de dados.


-- Exemplo DROP
DROP TABLE funcionarios;
SQL ALTER
O comando ALTER é usado para modificar a estrutura de objetos armazenados no banco.


-- Exemplo ALTER
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(255);
SQL TRUNCATE
O comando TRUNCATE é usado para remover rapidamente todas as linhas de uma tabela.


-- Exemplo TRUNCATE
TRUNCATE TABLE funcionarios;
SQL COMMENT
O comando COMMENT é utilizado para incluir comentários explicativos em consultas.


-- Exemplo COMMENT
/* Este é um comentário explicativo */
SELECT * FROM funcionarios;
SQL RENAME
O comando RENAME é utilizado para renomear tabelas do banco.


-- Exemplo RENAME
RENAME TABLE funcionarios TO funcionariosTI;
SQL GRANT
O comando GRANT é usado para conceder permissões específicas para determinados objetos do banco.


-- Exemplo GRANT
GRANT INSERT, UPDATE ON funcionarios TO Roberta;
SQL REVOKE
O comando REVOKE é utilizado para remover privilégios concedidos com o GRANT.


-- Exemplo REVOKE
REVOKE UPDATE ON funcionarios FROM Roberta;
SQL BEGIN/SET TRANSACTION
O comando BEGIN TRANSACTION indica o início de uma transação.


-- Exemplo BEGIN TRANSACTION
BEGIN TRANSACTION;
SET TRANSACTION READ ONLY;
SELECT nome, cargo FROM funcionarios WHERE id = 5;
COMMIT;
SQL COMMIT
O comando COMMIT indica o fim de uma transação, salvando as alterações realizadas.


-- Exemplo COMMIT
BEGIN TRANSACTION;
UPDATE funcionarios SET cargo = 'Engenheiro de Software' WHERE id = 13;
COMMIT;
SQL ROLLBACK
O comando ROLLBACK é usado para descartar alterações feitas em uma transação, restaurando ao estado original.


-- Exemplo ROLLBACK
ROLLBACK;
SQL SAVEPOINT
O comando SAVEPOINT estabelece um "ponto de segurança" dentro da transação.


-- Exemplo SAVEPOINT
SAVEPOINT ponto_salvamento;
ROLLBACK TO SAVEPOINT ponto_salvamento;
Conforme foi mostrado ao longo deste conteúdo, a linguagem SQL é de extrema importância para quem trabalha com tecnologia. Além de ser essencial para ampliar suas oportunidades no mercado, ela também é simples de aprender e de manipular, oferecendo acesso rápido e seguro aos dados de um sistema.