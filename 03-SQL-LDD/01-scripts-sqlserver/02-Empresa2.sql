
--Crear la base de datos empresa2
CREATE DATABASE Empresa2;
Go

USE Empresa2; 
Go

CREATE TABLE Cliente(
ClienteId INT not null identity(1,1),
NombreCliente nvarchar(20),
rfc nvarchar(20),
Direccion nvarchar(20),
CONSTRAINT pk_Cliente
PRIMARY KEY (ClienteId)
);
Go

CREATE TABLE Pedido(
PedidoId INT not null identity(1,1),
fecha date,
ClienteId INT not null,
CONSTRAINT pk_Pedido
PRIMARY KEY (PedidoId),
CONSTRAINT fk_Pedido_Cliente
FOREIGN KEY (ClienteId)
REFERENCES Cliente(ClienteId)
);
GO

CREATE TABLE Categoria(
CategoriaId INT not null identity(1,1),
NombreCategoria nvarchar(20),
CONSTRAINT pk_Categoria
PRIMARY KEY (CategoriaId)
);

CREATE TABLE Producto(
ProductoId INT not null identity(1,1),
NombreProducto nvarchar(20),
Existencia nvarchar(20) not null,
PrecioUnitario money not null,
CategoriaId INT not null,
CONSTRAINT pk_Producto
PRIMARY KEY (ProductoId),
CONSTRAINT fk_Producto_Categoria
FOREIGN KEY (CategoriaId)
REFERENCES Categoria(CategoriaId)
);

CREATE TABLE DetallePedido(
PedidoId INT not null,
ProductoId INT not null,
PrecioVenta money not null,
CantidadVendida INT not null,
CONSTRAINT fk_DetallePedido_Pedido
FOREIGN KEY (PedidoId)
REFERENCES Pedido(PedidoId),
CONSTRAINT fk_DetallePedido_Producto
FOREIGN KEY (ProductoId)
REFERENCES Producto(ProductoId)
);