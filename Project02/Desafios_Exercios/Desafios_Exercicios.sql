/*	DESAFIO 01 = EQUIPE DE PRODUTOS PRECISA DOS NOMES DE TODAS AS PE�AS QUE PESAM MAIS QUE 500KG POR�M N�O MAIS QUE 700KG */
	SELECT Name FROM Production.Product WHERE Weight > 500 AND Weight < 700; 

/*DESAFIO 02 = Equipe de marketing precisa da relacao de empregados que sao casados e assalariados*/
	SELECT * FROM HumanResources.Employee;
		SELECT * FROM HumanResources.Employee WHERE MaritalStatus = 'M' AND SalariedFlag = 1;
		SELECT NationalIDNumber FROM HumanResources.Employee WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

/*DESAFIO 03 = User Peter Krebs estao devendo, pegue o e-mail dele para entrar em contato*/
	SELECT BusinessEntityID ,FirstName, LastName FROM Person.Person WHERE FirstName = 'Peter' AND LastName = 'Krebs'
		SELECT * FROM Person.EmailAddress WHERE BusinessEntityID = 26
		SELECT BusinessEntityID, EmailAddress FROM Person.EmailAddress WHERE BusinessEntityID = 26

/*DESAFIO 04: = Quantos Produtos ha cadastrados - table: production.product e Quantos tamanhos de produtos - table: production.product*/
	SELECT * FROM Production.Product
		SELECT COUNT (Name) FROM Production.Product
		SELECT COUNT (Size) FROM Production.Product
		SELECT COUNT (DISTINCT Class) FROM Production.Product
	
