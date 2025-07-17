CREATE DATABASE SistemaHospital;
GO

USE SistemaHospital;
GO

CREATE TABLE DOCTORES (
    Ntmdootor INT PRIMARY KEY,
    ncmbre NVARCHAR(50) NOT NULL,
    apellidopaterno NVARCHAR(50) NOT NULL,
    apellidomaterno NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE PACIENTES (
    Ntmpaciente INT PRIMARY KEY,
    Ncmbre NVARCHAR(50) NOT NULL,
    apellidopaterno NVARCHAR(50) NOT NULL,
    apellidomaterno NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE ATENCION (
    Ntmdootor INT NOT NULL,
    Ntmpaciente INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (Ntmdootor, Ntmpaciente, fecha),
    FOREIGN KEY (Ntmdootor) REFERENCES DOCTORES(Ntmdootor),
    FOREIGN KEY (Ntmpaciente) REFERENCES PACIENTES(Ntmpaciente)
);
GO
