-- Lenguaje SQL-LDD (create, alter, drop)
--go-ahi acaba la instruccion solo en sql
--crear la base de datos empresa
CREATE DATABASE empresa;
Go
-- Utilizar la base de datos creada
USE empresa;
Go

--crear la tabla empleados
CREATE TABLE Empleados(
IdEmpleado int not null,
Nombre varchar (100) not null,
Puesto varchar(50) not null, 
FechaIngreso date,
Salario money not null,
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);
GO

CREATE TABLE Productos(
ProductoId int primary key,
NombreProducto nvarchar(50) not null,
Existencia int not null, 
PrecioUnitario money not null
);
GO

CREATE TABLE Productos2(
ProductoId int not null identity(1,1),
NombreProducto nvarchar(50) not null, 
Existencia int not null,
Precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY(ProductoId),
CONSTRAINT unique_nombreproducto
UNIQUE (NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK (Precio>0.0)
);
GO

--Insertar un producto en productos sin identity
INSERT INTO Productos (
ProductoId ,
NombreProducto,
Existencia , 
PrecioUnitario 
)
VALUES(1,'Burritos de Frijoles',65,20.99);
GO

SELECT * FROM Productos;
GO

INSERT INTO Productos (
ProductoId ,
NombreProducto,
Existencia , 
PrecioUnitario 
)
VALUES(2,'Burritos de Frijoles',65,20.99);
GO
SELECT * FROM Productos;
GO

--Insertar en la tabla productos2 con identity
INSERT INTO Productos2(
NombreProducto ,
Existencia , 
Precio
)
VALUES('Burritps Chorizo Verde',100,21.0);
GO

INSERT INTO Productos2(
NombreProducto ,
Existencia , 
Precio
)
VALUES('Burritps Chorizo Gruezo',450,459.12);
GO

INSERT INTO Productos2(
NombreProducto ,
Existencia , 
Precio
)
VALUES('Burritps Chorizo Gruezo2',450,459.12);
GO

INSERT INTO Productos2(
NombreProducto ,
Existencia , 
Precio
)
VALUES('Burritps de frijol',999,60);
GO

SELECT * FROM Productos2;
GO

--Crear 2 tablas con razon de cardinalidad de 1:N con participacion total, 
--esto quiere decir que la foreign key es not null

CREATE TABLE Categoria (
CategoriaId int not null identity (1,1),
NombreCategoria nvarchar (20) not null,
CONSTRAINT pk_categoria
PRIMARY KEY (CategoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
GO
--una fk no se puede poner identity(incrementa)
-- la fk se puede nombrar diferente pero tinee que coincidir el tipo de dato
--not null->no puede estar vacio el campo
--
CREATE TABLE productos3(
ProductoId int not null identity (1,1),
NombreProducto nvarchar (20) not null, 
Existencia int not null,
PrecioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos3
PRIMARY KEY (ProductoId),
CONSTRAINT chk_existencia3
CHECK (Existencia >0 and Existencia <=1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario>0.0),
--constraint  nombre de la variable,debe de ser unico
CONSTRAINT unique_nombreproducto3
UNIQUE (NombreProducto),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY(CategoriaId)
REFERENCES categoria(CategoriaId)
);
GO

CREATE TABLE Categoria2 (
Id int not null identity (1,1),
NombreCategoria nvarchar (20) not null,
CONSTRAINT pk_categoria2
PRIMARY KEY (Id),
CONSTRAINT unique_nombrecategoria2
UNIQUE(NombreCategoria)
);
GO

CREATE TABLE productos4(
ProductoId int not null identity (1,1),
NombreProducto nvarchar (20) not null, 
Existencia int not null,
PrecioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos4
PRIMARY KEY (ProductoId),
CONSTRAINT chk_existencia4
CHECK (Existencia >0 and Existencia <=1000),
CONSTRAINT chk_preciounitario4
CHECK (PrecioUnitario>0.0),
--constraint  nombre de la variable,debe de ser unico
CONSTRAINT unique_nombreproducto4
UNIQUE (NombreProducto),
CONSTRAINT fk_productos4_categoria2
FOREIGN KEY(CategoriaId)
REFERENCES categoria2(Id)
);
GO

CREATE TABLE Tabla1 (
Tabla1id int not null identity (1,2),
Tabla1id2 int not null ,
Nombre nvarchar (20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY (Tabla1id, Tabla1id2),

);
GO

CREATE TABLE Tabla2 (
IdTabla2 int not null identity (1,1),
Nombre nvarchar (20) not null,
Tabla1id int not null ,
Tabla1id2 int not null ,
CONSTRAINT pk_tablaid2
PRIMARY KEY (IdTabla2),
CONSTRAINT fk_tabla1_tabla2
FOREIGN KEY(Tabla1id,Tabla1id2)
REFERENCES tabla1(Tabla1id,Tabla1id2)

);
GO

--crear tablas con una razon de cardinalidad 1:1
CREATE TABLE employee(
id int not null identity (1,1),
nombre nvarchar (20) not null, 
ap1 nvarchar (20) not null, 
ap2 nvarchar (20) not null, 
sexo char (1) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY (id)

);
GO

CREATE TABLE department(
id int not null identity (1,1),
nombre nvarchar (20) not null,
ubicacion nvarchar (30) not null,
employeeid int not null, 
CONSTRAINT pk_department
PRIMARY KEY(id),
CONSTRAINT fk_department_employee
FOREIGN KEY (employeeid)
REFERENCES employee(id),
CONSTRAINT unique_employeeid
UNIQUE(employeeid)
);

