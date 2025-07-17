--Crear base de datos empresapatito
CREATE DATABASE empresapatito;
GO

--usar la base de datos
USE empresapatito;
GO

--crear una tabla empleados
CREATE TABLE empleados(
idempleado int not null,
Nombre VARCHAR (100) not null,
Puesto VARCHAR (50),
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (idempleado)
);
GO

--agregar una columna en la tabla empleados 
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR (100);
GO

SELECT * FROM empleados;

--modifiar el tipo de dato de un campo 
ALTER TABLE empleados
Alter COLUMN Salario money not null;

--renombrar un campo 
EXEC sp_rename 'empleados.CorreoElectronico','Email','COLUMN';

--crear tabla departamentos 
CREATE TABLE departamentos (
IdDepartamento int not null identity (1,1) primary key,
NombreDepto varchar (100)
);
GO

--agregar un campo a la tabla empleados, para que sea una fk 
ALTER TABLE empleados
add idDepartamento int not null;
GO

--agregar la llave foranea
ALTER TABLE empleados 
ADD CONSTRAINT fk_Empleados_departamento
FOREIGN KEY (idDepartamento)
REFERENCES departamentos(idDepartamento);
GO

--Eliminar la clave primaria de empleados
ALTER TABLE empleados 
DROP CONSTRAINT pk_empleados;
GO

--Eliminar la Foreign Key ela tabla empleados
ALTER TABLE empleados 
DROP CONSTRAINT fk_Empleados_departamento;
GO

--Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433D86C26CC8
GO 

--Crear un constraint de verficacion en salario
ALTER TABLE empleados 
ADD CONSTRAINT chk_salario
CHECK (Salario > 0.0);
GO

DROP TABLE categoria;
go

CREATE TABLE categoria (
id int not null primary key default -1,
Nombre varchar(20),
Estatus char(1) default 'A'
);
GO

INSERT INTO categoria
VALUES (1, 'Carnes', default);

INSERT INTO categoria
VALUES (2, 'Carnes', default);

SELECT * FROM categoria;


--eliminar la columna email 
ALTER TABLE empleados 
DROP COLUMN email;


ALTER TABLE empleados 
ADD CONSTRAINT pk_empleados
PRIMARY KEY  (idempleado);
go


ALTER TABLE departamentos 
ADD CONSTRAINT pk_departamentos
PRIMARY KEY  (IdDepartamento);
go

--emliminar tablas
DROP TABLE empleados;
GO

DROP TABLE departamentos
GO

DROP TABLE categoria;
GO

use master;
GO
--Eliminar la base de dato
DROP DATABASE empresapatito;
GO