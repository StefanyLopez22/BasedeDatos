-- Crear Base de Datos 
CREATE DATABASE restriccionesbdg1;


--Utilizar la base de datos
USE restriccionesbdg1;

--Crear la tabla categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
);

INSERT into categoria
VALUES(1,'Carnes Frias');

INSERT into categoria
VALUES(1,'Vinos y Licores');

INSERT into categoria
VALUES(null,'Ropa');

SELECT * FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30),
constraint pk_categoria
primary key(categoriaid)
);

INSERT into categoria
VALUES(1,'Carnes Frias');

INSERT into categoria
VALUES(2,'Vinos y Licores');

INSERT into categoria
VALUES(3,'Ropa');

INSERT into categoria
VALUES(4,'Ropa');

SELECT * FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);

INSERT into categoria
VALUES(1,'Carnes Frias');

INSERT into categoria
VALUES(2,'Vinos y Licores');


INSERT into categoria
VALUES(8,'ropa china ');

SELECT * FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);

drop table producto;

CREATE TABLE producto(
productoid int not null,
nombreprod nvarchar(20) not null,
precio money not null, 
existencia numeric(10,2) not null,
categoria int, 
constraint pk_producto
primary key (productoid),
constraint unique_nombreprod
unique(nombreprod),
constraint chk_precio
check(precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key (categoria)
references categoria (categoriaid)
);


INSERT INTO producto
values (1, 'Tonayan', 4000, 4,2);

INSERT INTO producto
values (2, 'Tonayan2', 1250.6, 40,2);

INSERT INTO producto
values (3, 'Bucañas', 200 , 8,2);

INSERT INTO producto
values (4, 'Calzon Chino', 6.3, 890,8);

select * from producto

select * 
from producto as p
inner join categoria as c 
on c.categoriaid = p.categoria;



