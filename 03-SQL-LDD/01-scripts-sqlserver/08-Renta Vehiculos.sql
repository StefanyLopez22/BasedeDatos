
CREATE DATABASE RentaVehiculos;
GO
USE RentaVehiculos;

CREATE TABLE SUCURSAL (
    numsucursal INT PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    ubicacion NVARCHAR(50) NOT NULL
);
GO


CREATE TABLE VEHICULO (
    numvehiculo INT PRIMARY KEY,
    marca NVARCHAR(40) NOT NULL,
    ano DATE NOT NULL,
    modelo NVARCHAR(40) NOT NULL,
    placa NVARCHAR(10) NOT NULL,
    numsucursal INT NOT NULL,
    FOREIGN KEY (numsucursal) REFERENCES SUCURSAL(numsucursal)
);
GO


CREATE TABLE CLIENTS (
    numcli INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    apellidopaterno NVARCHAR(50) NOT NULL,
    apellidomaterno NVARCHAR(40) NOT NULL,
    Curp NCHAR(50) NOT NULL,
    Telefono NVARCHAR(40) NOT NULL,
    Calle NVARCHAR(50) NOT NULL,
    Num NVARCHAR(20) NOT NULL,
    Ciudad NVARCHAR(50) NOT NULL
);
GO


CREATE TABLE REMTA (
    NumeCliente INT NOT NULL,
    numvehiculo INT NOT NULL,
    numdissprestados INT NOT NULL,
    Fechainicio DATE NOT NULL,
    Fechatemino DATE NOT NULL,
    PRIMARY KEY (NumeCliente, numvehiculo, Fechainicio),
    FOREIGN KEY (NumeCliente) REFERENCES CLIENTS(numcli),
    FOREIGN KEY (numvehiculo) REFERENCES VEHICULO(numvehiculo)
);
GO