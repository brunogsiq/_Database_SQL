# 🧠 Guia de SQL para QA no Microsoft SQL Server

---

### 0. Dicas e curiosidades

- **Por que os camando são em maiúsculos?
  - Por uma questão de convenção para diferenciar do nome de tabela e outras informações.

- Ter diversos comandos "ativos", ou seja, não comentado, irá trazer todas as execuções, dividindo os retornos no console.
- Caso não especifique a tabela, ou seja, utilize apenas o asterisco (SELECT *), irá trazer todas as informações da tabela.
- Para comentar se utiliza dois sinais de menos ou traço: --

- **Atalhos
  - F5 - executará ação.
  - 

### 1. Fundamentos de Banco de Dados 🛢️

- **O que é um banco de dados?**
  - Um banco de dados é uma coleção organizada e sistemática de dados armazenados e acessados em um sistema de computador.

- **SGBD - Sistema de Gerenciamento de Banco de Dados 🧑‍💼**
  - O DBMS é crucial para acessar, criar, excluir e atualizar dados em um banco de dados.

- **RDBMS - Sistema de Gerenciamento de Banco de Dados Relacional 🌐**
  - O RDBMS utiliza o modelo relacional, permitindo ao usuário criar bancos de dados relacionais.

- **Tabelas 📊**
  - As tabelas são usadas para armazenar dados relacionados, organizados em linhas (Rows) e colunas (Columns).

### 2. Fundamentos do SQL 💻
- **O que é SQL?**
  - SQL é uma linguagem de consulta estruturada, usada para manipular e consultar dados em bancos de dados relacionais.

### 2.1 Os 5 Subconjuntos da Linguagem SQL

- DML, DQL, DDL, DCL e DTL ou TCL desempenham funções distintas na manipulação de dados.

- **DML**: Linguagem de Manipulação de Dados  
  Comandos: `INSERT`, `DELETE`, `UPDATE`

- **DQL**: Linguagem de Consulta de Dados  
  Comando: `SELECT`

- **DDL**: Linguagem de Definição de Dados  
  Comandos: `CREATE`, `DROP`, `ALTER`

- **DCL**: Linguagem de Controle de Dados  
  Comandos: `GRANT`, `REVOKE`

- **DTL ou TCL**: Linguagem de Transação de Dados  
  Comandos: `COMMIT`, `BEGIN`, `ROLLBACK`

---

### 3. Comandos, Funções e Operadores ⚙️

### SQL CREATE
  - Utilizado para criar bancos de dados e tabelas.

```sql
CREATE DATABASE empresa;
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(100)
);
```

### SQL INSERT
  - Inserção de novos registros em uma tabela.

```sql
INSERT INTO funcionarios (id, nome, cargo) 
	VALUES (1, 'Fernando', 'Analista de Sistemas');
```

```sql
INSERT INTO clientes (nome, email)
VALUES ('João Silva', 'joao@email.com');
```

### SQL UPDATE
  - Atualização de registros na tabela.

```sql
UPDATE funcionarios SET cargo = 'Analista de Sistemas e Aplicações' WHERE id = 1;
```

```sql
UPDATE produtos
SET preco = preco * 1.10
WHERE categoria = 'Eletrônicos';
```

### SQL DELETE
  - Exclusão de dados de uma tabela.

```sql
DELETE FROM funcionarios WHERE id = 1;
```

```sql
DELETE FROM usuarios
WHERE ultimo_login < '2023-01-01';
```

### SQL SELECT

- Consulta e seleção de dados.

```sql
SELECT id, nome, cargo FROM funcionarios;
```

- Retorna todas as colunas e registros da tabela.

```sql
SELECT * FROM nome_da_tabela;
```

- Retorna apenas colunas específicas.

```sql
SELECT coluna1, coluna2 FROM nome_da_tabela;
```

- Consulta com filtro de registros (Where)

```sql
SELECT * FROM produtos WHERE preco - 100;
SELECT * FROM pedidos WHERE status = 'entregue';
```

- `ASC` = crescente (padrão) | `DESC` = decrescente

```sql
SELECT * FROM clientes ORDER BY nome ASC;
SELECT * FROM pedidos ORDER BY data DESC;
```

- Filtrar com múltiplas condições

```sql
SELECT * FROM vendas WHERE valor > 500 AND forma_pagamento = 'cartão';
SELECT * FROM produtos WHERE categoria = 'Eletrônicos' OR preco < 100;
```

- Agrupamentos e Resumos (GROUP BY + HAVING)

```sql
SELECT categoria, COUNT(*) AS total
FROM produtos
GROUP BY categoria;
```

```sql
SELECT cliente_id, SUM(valor) AS total_gasto
FROM vendas
GROUP BY cliente_id
HAVING SUM(valor) > 1000;
```

- Subconsultas

```sql
SELECT nome FROM produtos 
WHERE id IN (
  SELECT produto_id FROM vendas WHERE quantidade > 10
);
```


### SQL JOIN
  - Combinação de linhas de várias tabelas.

```sql
SELECT funcionarios.id, funcionarios.nome, departamentos.nome AS departamento
FROM funcionarios
INNER JOIN departamentos ON funcionarios.departamento_id = departamentos.id;
```

```sql
-- INNER JOIN: dados comuns entre as tabelas
SELECT p.nome, c.nome
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id;
```

```sql
-- LEFT JOIN: todos da esquerda + correspondentes da direita
SELECT c.nome, p.id
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;
```

### SQL UNION
  - Combinação de resultados de dois ou mais comandos SELECT.

```sql
SELECT nome FROM funcionarios
UNION
SELECT nome FROM clientes;
```

### SQL CASE
  - Avaliação de condições e retorno de resultados específicos.

```sql
SELECT nome, nota,
    CASE
        WHEN nota = 7 THEN 100*0.7
        WHEN nota = 8 THEN 100*0.8
        WHEN nota = 9 THEN 100*0.9
        WHEN nota = 10 THEN 100
        ELSE 0
    END AS bonus
FROM treinamento;
```

### SQL LIKE
  - Busca por padrões em strings.

```sql
SELECT * FROM funcionarios WHERE nome LIKE 'a%';
```

### SQL BETWEEN
  - Seleção de valores dentro de um intervalo determinado.

```sql
SELECT * FROM funcionarios WHERE salario BETWEEN 2000 AND 5000;
```

### SQL GROUP BY

```sql
SELECT COUNT(id), cargo FROM funcionarios GROUP BY cargo;
```

### SQL SUBSTRING

```sql
SELECT nome, SUBSTRING(nome, 1, 5) AS substring FROM funcionarios;
```

### SQL COUNT

```sql
SELECT COUNT(id) FROM funcionarios;
```

### SQL DISTINCT: Omitir dados duplicados de um tabela

```sql
SELECT DISTINCT cidade FROM funcionarios;
```

```sql
SELECT coluna01, coluna02 FROM funcionarios;
```

### SQL DROP

```sql
DROP TABLE funcionarios;
```

### SQL ALTER

```sql
ALTER TABLE funcionarios ADD email VARCHAR(255);
```

### SQL TRUNCATE

```sql
TRUNCATE TABLE funcionarios;
```

### SQL COMMENT

```sql
/* Este é um comentário explicativo */
SELECT * FROM funcionarios;
```

### SQL RENAME

```sql
EXEC sp_rename 'funcionarios', 'funcionariosTI';
```

### SQL GRANT

```sql
GRANT INSERT, UPDATE ON funcionarios TO Roberta;
```

### SQL REVOKE

```sql
REVOKE UPDATE ON funcionarios FROM Roberta;
```

### SQL BEGIN/SET TRANSACTION

```sql
BEGIN TRANSACTION;
SET TRANSACTION READ ONLY;
SELECT nome, cargo FROM funcionarios WHERE id = 5;
COMMIT;
```

### SQL COMMIT

```sql
BEGIN TRANSACTION;
UPDATE funcionarios SET cargo = 'Engenheiro de Software' WHERE id = 13;
COMMIT;
```

### SQL ROLLBACK

```sql
ROLLBACK;
```

### SQL SAVEPOINT

```sql
SAVEPOINT ponto_salvamento;
ROLLBACK TO SAVEPOINT ponto_salvamento;
```

**Operadores comuns:**

- `=` igual  
- `<>` ou `!=` diferente  
- `<`, `>`, `<=`, `>=`  
- `BETWEEN x AND y`  
- `IN ('A', 'B', 'C')`  
- `LIKE 'texto%'` (inicia com)  
- `IS NULL` ou `IS NOT NULL`


## Simulando um banco fictício chamado SistemaQA com tabelas úteis para testes de software:

## 🔧 Estrutura de tabelas:

🧪 Tabela: TestesFuncionais
CREATE TABLE TestesFuncionais (
	id INT PRIMARY KEY IDENTITY,
	nome_teste VARCHAR(255),
	resultado VARCHAR(20),
	data_execucao DATE,
	responsavel VARCHAR(100)
);

📲 Tabela: UsuariosApp
CREATE TABLE UsuariosApp (
	id INT PRIMARY KEY IDENTITY,
	nome_usuario VARCHAR(100),
	email VARCHAR(150),
	data_cadastro DATE,
	ativo BIT
);
🔍 Tabela: BugsReportados
CREATE TABLE BugsReportados (
	id INT PRIMARY KEY IDENTITY,
	titulo_bug VARCHAR(255),
	severidade VARCHAR(20),
	status_bug VARCHAR(30),
	data_report DATE,
	usuario_responsavel INT,
	FOREIGN KEY (usuario_responsavel) REFERENCES UsuariosApp(id)
);


## 🔹 Consultar testes com falha nos últimos 7 dias:
SELECT * FROM TestesFuncionais
WHERE resultado = 'falha'
AND data_execucao >= DATEADD(DAY, -7, GETDATE());

## 🔹 Listar usuários ativos ordenados por data de cadastro:
SELECT nome_usuario, email
FROM UsuariosApp
WHERE ativo = 1
ORDER BY data_cadastro DESC;

## 🔹 Bugs por severidade:
SELECT severidade, COUNT(*) AS total
FROM BugsReportados
GROUP BY severidade;

## 🔹 Ver bugs e nomes dos responsáveis:
SELECT B.titulo_bug, B.status_bug, U.nome_usuario
FROM BugsReportados B
JOIN UsuariosApp U ON B.usuario_responsavel = U.id;

## 🔹 Filtros com WHERE
SELECT * FROM TestesFuncionais
WHERE resultado = 'falha'
AND data_execucao >= DATEADD(DAY, -7, GETDATE());

## 🔹 Agrupamentos (GROUP BY)
SELECT severidade, COUNT(*) AS total
FROM BugsReportados
GROUP BY severidade;

## 🔹 Junções (JOIN)
SELECT B.titulo_bug, B.status_bug, U.nome_usuario
FROM BugsReportados B
JOIN UsuariosApp U ON B.usuario_responsavel = U.id;

## 🔹 Ordenação
SELECT nome_usuario, email
FROM UsuariosApp
WHERE ativo = 1
ORDER BY data_cadastro DESC;

## 🔹 Atualização
UPDATE UsuariosApp
SET ativo = 0
WHERE data_cadastro < '2023-01-01';

## 🔹 Exclusão
DELETE FROM TestesFuncionais
WHERE resultado = 'inconclusivo';

## 🔹 Inserção
INSERT INTO TestesFuncionais (nome_teste, resultado, data_execucao, responsavel)
VALUES ('Login com senha inválida', 'falha', GETDATE(), 'Bruno QA');