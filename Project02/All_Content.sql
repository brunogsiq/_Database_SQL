--Comando: SELECT
	--Buscando todas as colunas/informacoes da tabela Person
		SELECT * FROM Person.Person;

	--Buscando coluna title na tabela Person
		SELECT Title FROM Person.Person;

	--Buscando colunas/informacoes da tabela EmailAddress
		SELECT * FROM Person.EmailAddress

	--Table: Person
		--FirstName = Nome 
		--MiddleName = Sobrenome
		--LastName = Ultimo 

		SELECT FirstName, MiddleName, LastName FROM person.Person;
		SELECT FirstName FROM Person.Person;
		SELECT MiddleName FROM Person.Person;
		SELECT LastName FROM Person.Person;
	
--Comando: DISTINCT
	--Exemplo, caso nao use o DISTINCT sera apresentada 19K de linhas (rows)
		SELECT FirstName FROM Person.Person
	--Quando utilizamos o comando corretamente, filtramos e dados duplicados nao serao apresentados
		SELECT DISTINCT FirstName FROM Person.Person

--Comando: Where
	--SELECT coluna1, coluna2 FROM tabela WHERE condicao
		SELECT * FROM Person.Person WHERE LastName = 'miller'
		SELECT * FROM Person.Person WHERE LastName = 'miller' AND FirstName = 'anna'
		SELECT * FROM Production.Product WHERE color = 'blue' OR color = 'black'
		SELECT * FROM Production.Product WHERE ListPrice >= 1500 AND ListPrice <= 2000

--Comando: Count
	--Número de linhas de acordo com uma condição, Exemplo:
		--SELECT COUNT (*) FROM TABELA
		--SELECT COUNT (coluna1) FROM TABELA
		--SELECT COUNT (DISTINCT coluna1) FROM TABELA
		SELECT COUNT (*) FROM Person.Person
		SELECT COUNT (title) FROM Person.Person
		SELECT COUNT (DISTINCT title) FROM Person.Person

