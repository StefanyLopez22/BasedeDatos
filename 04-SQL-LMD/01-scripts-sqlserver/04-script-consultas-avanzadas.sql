--Consultas Avanzadas 

--Hallar todos los representantes que o bien:
--a) trabajan en daimiel, Navarra, o Castellon; o bien
--b) No tienen Jefe y estan contratados desde junio de 1988; o 
--c) superan su cuota pero tienen ventas de 600000 o menos 


Select r.Num_Empl AS [Numero Empleado], 
	r.Nombre AS [Nombre Empleado],
	r.Fecha_Contrato AS [Fecha de Contrato],
	r.Cuota AS [Cuota de Ventas],
	r.Ventas AS [Ventas Totales],
	o.Ciudad AS [Ciudad de la Oficina],
	r.Jefe AS [Numero de Jefe]
From Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina =r.Oficina_Rep
Where (o.Ciudad in ('Daimiel','Navarra','Castellón')) or
		(Jefe IS NULL and Fecha_Contrato >='1988-06-01') or 
		(r.Ventas> Cuota and r.Ventas<=600000)	
;

--Listar todos los pedidos mostrando el numero de pedido,
--su importe y el nombre y limite de credito del cliente 

SELECT p.Importe, p.Importe,c.Empresa,c.Limite_Credito
FROM Pedidos AS p
INNER JOIN Clientes AS C
ON c.Num_Cli = p.Cliente;

--Listar la oficinas con un objetivo superior a 60000, mostrando el nombre
--de la cuidad, nombre del representante y su puesto
SELECT o.Ciudad AS [Oficina] , 
		r.Nombre AS [Representante], 
		r.Puesto AS [Puesto],
		o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;


--Listar todos los pedidos mostrando el numero de pedido,
--el importe, el nombre y limite de credito del cliente

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   c.Empresa AS [Cliente],
	   c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 


SELECT *
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 

--Listar cada representante mostrando su nombre, la cuidad, 
--region, en que trabajan

SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina;

--Listar las oficinas (ciudad), nombres y puestos de sus jefes
SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl = o.Jef;


--lsitar los pedidos mostrando el numero de pedido, el importe 
--y la cantidad de cada producto

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   pr.Stock AS [Cantidad],
	   pr.Descripcion AS [Descripcion]
	  
FROM Pedidos AS pe
INNER JOIN Productos AS pr
ON pr.Id_producto = pe.Producto
	AND pe.Fab = pr.Id_fab

--Listar los nombres de los empleados y los nombres de sus jefes 

SELECT empl.Nombre AS [Empleado],
	   jefs.Nombre AS [Jefe]
FROM Representantes AS jefs
INNER JOIN Representantes AS empl
ON jefs.Num_Empl = empl.Jefe;

--Listar los pedidos con un importe superior a 25000, incluyendo el nombre del representante, numero de pedido,
--importe, nombre del representante que tomo nota del pedido y el nombre del cliente

Select p.Num_Pedido, p.Importe, r.Nombre, c.Empresa
From Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl = p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del cliente que lo encargo 
--y el nombre del representante asignado al cliente, y el importe
SELECT p.Num_Pedido AS [Numero de pedido],
		c.Empresa AS [Cliente],
		r.Nombre AS [Representante cliente],
		p.Importe
FROM Representantes AS r
INNER JOIN Clientes AS c
ON r.Num_Empl = c.Rep_Cli
INNER JOIN Pedidos AS p
ON c.Num_Cli = p.Cliente
WHERE Importe > 25000;

use bdg1join;
SELECT * FROM Categoria;

SELECT * FROM Producto;

--iNNER JOIN 

Select * 
from Categoria as c
JOIN  Producto as p
on c.cargoriaid = p.categoria;

--LEFT JOIN o LEFT OUTER JOIN

--La primera table que aparece en el from es la tabla izquierda

Select * 
from Categoria as c
JOIN  Producto as p
on c.cargoriaid = p.categoria;

--Mostras todas las categorias que no tengan productos asignados

Select c.cargoriaid, c.nombre 
from Categoria as c
LEFT JOIN Producto as p
on c.cargoriaid = p.categoria
WHERE p.categoria is null;

--Right JOIN - RIGTH OUTER JOIN = TODOS LOS DATOS DE LA TABLA DERECHA Y LOS QUE COINICIDEN
--CON LA TABLA IZQUIERDA, Y LOS QUE NO COINCIDEN LOS PONE EN NULL

--selecciona todos aquellos productos que no tienen categoria asignada 
Select p.nombre as [Nombre del producto],
		p.precio as [precio]
from Categoria as c
RIGHT JOIN  Producto as p
on c.cargoriaid = p.categoria
WHERE categoria is null;

--FULL JOIN = OBTIENE  LOS DATOS DE LA TABLA IZQUIERDA, LOS DATOS DE LA TABLA 
--DERECHA Y TODAS LAS COINCIDENCIAS ENTRE LAS 2

Select * 
from Categoria as c
FULL JOIN  Producto as p
on c.cargoriaid = p.categoria;

Select * 
from Categoria as c
CROSS JOIN  Producto as p;

SELECT * 
FROM Categoria AS c,
Producto as p
where c.cargoriaid = p.categoria;

/*AGREGACION

count (*) - cuenta las filas ,
count (campo) - cuenta las filas pero no los null,
min() - obtiene el valor minimo de un campo,
max() - obtiene el valor maximo de un campo ,
avg() - obtiene la media aridmetica o promedio,
sum() - obtiene el total o la sumatioria 
*/

use NORTHWND;

--cuentos clientes hay

select COUNT(*) as [numero de clientes]
from Customers;

--cuantas ventas han realizado
select COUNT (*)
from Orders;

--cuantas ventas se realizaron en 1996

select COUNT(*)
from Orders
where DATEPART(YEAR, OrderDate )=1996

--seleccionar la venta de la fecha mas antigua que se hizo 

select MIN(orderDate) as [Fecha primera venta]
from Orders

--seleccionar el total que se ha vendido
select sum (UnitPrice * Quantity) as [Total de ventas]
from [Order Details]

--seleccionar el total de ventas entre 1996 y 1997
select sum (UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as od
inner join Orders as o
on o.OrderID = od.OrderID
where DATEPART(YEAR, o.OrderDate) between 1996 and 1997
and o.CustomerID = 'AROUT';

--seleccionar las ventas totales hechas a cada uno de nuestros clientes
select c.CompanyName as [cliente],
sum (UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as od
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
where DATEPART(YEAR, o.OrderDate) between 1996 and 1997
group by c.CompanyName;
