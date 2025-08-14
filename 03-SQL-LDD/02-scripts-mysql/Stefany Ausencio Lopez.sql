CREATE DATABASE CONTROL_PEDIDOS;
USE CONTROL_PEDIDOS;

CREATE TABLE PRODUCTOS(
Id_fab char(3) NOT NULL, 
Id_producto char (5) NOT NULL ,
Descripcion varchar (20) NOT NULL,
Precio decimal(10,2) NOT NULL,
Stock int NOT NULL,

primary key(Id_fab,Id_producto),
UNIQUE(Id_producto),
CHECK (Stock >0)
);

CREATE TABLE Clientes(
Num_Cli int NOT NULL, 
Empresa varchar(20) NOT NULL,
Limite_Credito decimal(10,2),

check (Limite_Credito>0 AND Limite_Credito<40000)
);

Drop table Clientes;

CREATE TABLE Clientes(
Num_Cli int NOT NULL, 
Empresa varchar(20) NOT NULL,
Limite_Credito decimal(10,2),

primary key (Num_Cli),
check (Limite_Credito>0 AND Limite_Credito<40000)
);

CREATE TABLE Representantes(
Num_Empl int not null,
Nombre varchar(16) not null,
Edad int,
Puesto varchar(13),
Fecha_contrato date not null,
Jefe int ,
Cuota Decimal(10,2) not null,
Ventas decimal(10,2) not null,

primary key(Num_Empl),
check(Edad>=18),

foreign key(Jefe) references Representantes(Num_Empl)


);

Alter table Clientes
add Rep_Cli int;

alter table airport
add constraint Rep_Cli
foreign key (Rep_Cli )
references Representantes(Num_Empl);

CREATE TABLE Pedidos(
Num_Pedido int not null,
Fecha_pedido date not null,
cliente int not null,
rep int ,
fab char (3) not null,
producto char (5) not null,
cantidad int not null,
importe decimal (10,2) not null,

primary key (Num_Pedido),
check (cantidad<0)
);


