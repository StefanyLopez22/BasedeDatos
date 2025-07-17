CREATE DATABASE Biblioteca ;
USE Biblioteca;

CREATE TABLE LECTORES (
    numlector INT PRIMARY KEY,
    nombre NVARCHAR(30),
    apellidopaterno NVARCHAR(30),
    apellidomaterno NVARCHAR(30),
    nummembresia INT
);
GO

CREATE TABLE LIBROS (
    numlibro INT PRIMARY KEY,
    numISBN INT,
    Cantidad INT,
    titulo NVARCHAR(50),
    autor NVARCHAR(40)
);
GO

CREATE TABLE PRESTA (
    numlector INT,
    numlibro INT,
    PRIMARY KEY (numlector, numlibro),
    FOREIGN KEY (numlector) REFERENCES LECTORES(numlector),
    FOREIGN KEY (numlibro) REFERENCES LIBROS(numlibro)
);
GO


