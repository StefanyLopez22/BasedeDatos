CREATE DATABASE ejercicio1999;
GO

USE ejercicio1999;

CREATE TABLE Empleado (
	Empleadoid int NOT NULL identity (1,1),
	Nombre nvarchar (15) NOT NULL,
	Apellido1 nvarchar (15) NOT NULL,
	Apellido2 nvarchar (15),
	Direccion nvarchar (50) NOT NULL,
	Salario decimal (10,2) NOT NULL,
	Jef int, 
	Departamento int NOT NULL, 

	--RESCRICCIONES
	CONSTRAINT pk_empleado
	PRIMARY KEY (Empleadoid),
	CONSTRAINT chk_salario
	CHECK (Salario between 200 and 50000),
	
	CONSTRAINT fk_empleado_jefe
	FOREIGN KEY (Jef)
	REFERENCES Empleado(Empleadoid)
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION

);
GO

CREATE TABLE Departamento(
	Departamentoid int NOT NULL identity (1,1),
	NombreDepto nvarchar (15) NOT NULL,
	Estatus char(2) NOT NULL,
	Administrador int NOT NULL,

	CONSTRAINT pk_departamento
	PRIMARY KEY (Departamentoid),
	CONSTRAINT unique_nombredepto
	UNIQUE (NombreDepto),
	CONSTRAINT chk_estatus
	CHECK (Administrador IN ('SI','NO')),

	CONSTRAINT fk_empleado_depto
	FOREIGN KEY  (Administrador)
	REFERENCES Empleado(Empleadoid)
); 
GO

ALTER TABLE Empleado 
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (Departamento)
REFERENCES Departamento(Departamentoid);
GO
--1 : 1 QUE LA FK SEA NOT NULL , UNUQUE
CREATE TABLE Ubicacion (
	Ubicacionid int NOT NULL identity (1,1),
	Ubicacion nvarchar (15) NOT NULL,

	Deptoid int NOT NULL,
	CONSTRAINT pk_ubicacion
	PRIMARY KEY (Ubicacionid),
	CONSTRAINT unique_deptoid
	UNIQUE (Deptoid),
	CONSTRAINT fk_ubicacion_depto
	FOREIGN KEY (Deptoid)
	REFERENCES Departamento(Departamentoid)
);
GO