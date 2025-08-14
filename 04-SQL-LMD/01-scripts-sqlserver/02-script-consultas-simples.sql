--Lenguaje SQL-LMD
--Consultas simpleas 

USE NORTHWND;
GO;

--Seleccionar todos los clientes 
SELECT * FROM Customers;

--Seleccionar todos los clientes pero solamente mostrando 
--la clave, nombre del ciente, ciudad y el Pais (Proyeccion)

SELECT CustomerID, CompanyName, City, Country
FROM Customers;

-- Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City Ciudad, Country
 AS [Ciudad Chida]
 FROM Customers;

--Campos Calculados!
--Seleccinar las ordenes de compra mostrando productos, la cantidad vendida
--precio de venta, descuento y el total

SELECT ProductID AS [Nombre Producto], UnitPrice AS [Precio],
	Quantity AS [Cantidad], Discount AS [Descuento],
	(UnitPrice * Quantity ) AS [Importe Sin Descuento],
	(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];

--Seleccionar las ordenes de compra,mostrando  el ciente al que se le vendio, 
--el empleado que la realizo, la fecha de la orden, el trasportista
--y la fecha de la orden hay que dividirla en año,mes,dia,trimestre.

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente],
EmployeeID AS [Empleado], 
ShipVia AS [Transportista],
YEAR(OrderDate) AS [Año de la compra],
MONTH (OrderDate) AS [Mes de la compra],
DAY (OrderDate) AS [Dia de la compra]
FROM Orders;

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente],
EmployeeID AS [Empleado], 
ShipVia AS [Transportista],
DATEPART(year, OrderDate) AS [Año de la compra],
DATEPART (mm, OrderDate) AS [Mes de la compra],
DATEPART (d, OrderDate) AS [Dia de la compra],
DATEPART (qq, OrderDate) AS [Trimestre],
DATEPART (week, OrderDate) AS [Semana],
DATEPART (WEEKDAY, OrderDate) AS [Dia Semana],
DATENAME (WEEKDAY, OrderDate) AS [Nombre Dia]
FROM Orders

Order by 9;
--orden by : ordenar los datso de forma ascedente y descendente

--seleccionar los empleados ordenados por su pais
SELECT (TitleOfCourtesy + ' ' + FirstName + ' ' + LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees;


SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country ASC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY [Nombre Completo ] DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country, City;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country DESC, City;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country DESC, City DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country ASC, City DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  2 ASC, 3 DESC;

SELECT CONCAT (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) AS [Nombre Completo ],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  1 ASC,Country DESC, 3 DESC;

--Seleccionar todos los productos que su precio sea mayor a 40.3, 
--(mostrar el numero del producto, nombre del producto, y el precio unitario)

SELECT ProductID AS [Numero de producto],
		ProductName AS [Nombre del Producto],
		UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3;

--///////////////////////////////////////////////
SELECT ProductID AS [Numero de producto],
		ProductName AS [Nombre del Producto],
		UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;

--//////////////////////////////////////////////
SELECT ProductID AS [Numero de producto],
		ProductName AS [Nombre del Producto],
		UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';

--/////////////////////////////////////////////

SELECT ProductID AS [Numero de producto],
		ProductName AS [Nombre del Producto],
		UnitPrice AS [Precio]
FROM Products
WHERE ProductName <>  'Carnarvon Tigers';

--/////////////////////////////////////////////

SELECT ProductID AS [Numero de producto],
		ProductName AS [Nombre del Producto],
		UnitPrice AS [Precio]
FROM Products
WHERE ProductName !='Carnarvon Tigers';

--/////////////////////////////////////////////

--Seleccionar todas las ordenes que sean de brazil - rio de janeiro
--mostrando solo el numero de orden, la fecha de orden, pais de envio, ciudad 
--transportista 

SELECT  OrderID as [Numero de orden],
		OrderDate AS [Fecha de orden],
		ShipCountry AS [Pais de envio],
		ShipCity AS [Ciudad de envio],
		ShipVia AS [Transportitsta]
FROM Orders
WHERE  ShipCity = 'Rio de Janeiro';

--INNER JOIN
SELECT  o.OrderID as [Numero de orden],
		o.OrderDate AS [Fecha de orden],
		o.ShipCountry AS [Pais de envio],
		o.ShipCity AS [Ciudad de envio],
		s.ShipperID AS [Numero de transportista],
		s.CompanyName AS [Transportista]

FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE  ShipCity = 'Rio de Janeiro';

--Seleccionar todas las ordenes 
--mostrando lo mismo que la consulta aneterior 
--pero todas aquellas que no tengan region de envio 

SELECT  o.OrderID as [Numero de orden],
		o.OrderDate AS [Fecha de orden],
		o.ShipCountry AS [Pais de envio],
		o.ShipCity AS [Ciudad de envio],
		s.ShipperID AS [Numero de transportista],
		s.CompanyName AS [Transportista]

FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE  ShipRegion is not null;

--Seleccionar todas las ordenes enviadas a 
--brazil, alemania y que tengan region, ordenar de forma decendente por el shipcountry 

SELECT  o.OrderID as [Numero de orden],
		o.OrderDate AS [Fecha de orden],
		o.ShipCountry AS [Pais de envio],
		o.ShipCity AS [Ciudad de envio],
		s.ShipperID AS [Numero de transportista],
		s.CompanyName AS [Transportista]

FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE  (ShipCountry = 'Mexico' or 
		ShipCountry = 'Germany' or
		ShipCountry = 'Brazil') and
		ShipRegion is not null
		
Order by ShipRegion DESC;

USE BDEJEMPLO2;
Go

--Seleccionar cuantos puestos diferentes tienen los representantes

SELECT DISTINCT Puesto
FROM Representantes;

--SELECCIONAR TODO LOS PAISES DIFERENTES DE MIS CLIENTES 
SELECT DISTINCT Country, City
FROM Customers;

SELECT DISTINCT Country, City, CompanyName 
FROM Customers 
Order by 1 asc ;

SELECT DISTINCT Country, City, CompanyName 
FROM Customers 
Where City = 'buenos Aires'

SELECT * FROM Products;

select DISTINCT CategoryID 
from Products;

--cuantos puestos diferentes tienen los representantes 
--funciones de agregado : solamente regresan 1 solo registro 

select COUNT(DISTINCT Puesto) AS [Numero de puesto]
from Representantes;

--SELECCIONAR EL PRECIO MINIMO DE LOS PRODUCTOS 
SELECT MIN(Precio) AS [Precio minimo]
FROM Productos;

--listar las oficinas cuyas ventas estan por debajo del 80% de sus objetivos 
select Ciudad, Ventas, Objetivo, (0.8 * Objetivo) AS [80% del Objetivo ]
from Oficinas
where Ventas< (0.8* Objetivo);

--seleccionar los primeros 5 registros de los pedidos 
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos;

--SELECCIONAR LOS 5 PEDIDOS CON EL IMPORTE MAS GRANDE 
Select top 5 Importe 
from Pedidos
order by Importe desc;

--test de rango (Between)
--hayar los pedidos dek ultimo trimestre de 1989
SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
Where Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
Order by Fecha_Pedido DESC ;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
Where Fecha_Pedido >='1989-10-01' AND Fecha_Pedido<= '1989-12-31' 
Order by Fecha_Pedido DESC ;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
Where datepart (quarter ,Fecha_Pedido) = 1
Order by Fecha_Pedido DESC ;

--hallar los pedidos que tienen un importe entre 30000 y 39999.99
Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
From Pedidos
where  Importe between 30000 and 39999.99;

Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
From Pedidos
where  Importe >= 30000 and Importe <= 39999.99;

--listar los representantes cuyas ventas no se encuentran entre el 80 y el 120 por ciento de su cuota
select Num_Empl,Nombre,Puesto Ventas, Cuota
from Representantes
where Ventas not between (0.8*Cuota) and (1.2 * Cuota);

select Num_Empl,Nombre,Puesto Ventas, Cuota
from Representantes
where not (Ventas >= (0.8*Cuota) and Ventas <= (1.2 * Cuota));

--Test de pertenencia a conjuntos (IN)
--Hayar los pedidos de 4 representantes en concreto
Select Num_Pedido, Fecha_Pedido, Importe, Rep
From Pedidos
WHERE Rep IN (107,109,101,103);

Select Num_Pedido, Fecha_Pedido, Importe, Rep
From Pedidos
WHERE Rep = 107 OR
	Rep =109 OR
	Rep = 101 OR
	Rep = 103;

Select Num_Pedido, Fecha_Pedido, Importe, Rep
From Pedidos
WHERE Rep NOT IN (107,109,101,103);

Select Num_Pedido, Fecha_Pedido, Importe, Rep
From Pedidos
WHERE NOT ( Rep = 107 OR
	Rep =109 OR
	Rep = 101 OR
	Rep = 103);

--test de encaje de patrones (Like)

SELECT *
FROM Clientes
Where Empresa Like 'Ac%';.

SELECT *
FROM Clientes
Where Empresa Like '%L';

SELECT *
FROM Clientes
Where Empresa Like '%er%';

Select *
From Clientes
Where Empresa Like '[A-D]%';

Select *
From Clientes
Where Empresa Like '[ADf]%';

Select *
From Clientes
Where Empresa Like '_ilas';

Select *
From Clientes
Where Empresa Like '____';

--Negacion (muestra todos menos los que inician con ADf)
Select *
From Clientes
Where Empresa Like '[^ADf]%';

--Hallar todos los representantes que o bien:
--a) trabajan en daimiel, Navarra, o Castellon; o bien
--b) No tienen Jefe y estan contratados desde junio de 1988; o 
--c) superan su cuota pero tienen ventas de 600000 o menos 

Select Nombre,Oficina_Rep,Jefe,Fecha_Contrato,Cuota
From Representantes
Where Oficina_Rep in (11,12,22) or
		(Jefe IS NULL and Fecha_Contrato >='1988-06-01') or 
		(Ventas> Cuota and Ventas<=600000)	
;

