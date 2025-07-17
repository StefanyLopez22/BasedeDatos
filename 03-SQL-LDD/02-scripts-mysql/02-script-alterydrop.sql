#Crear base de datos empresapatito
CREATE DATABASE empresapatito;


#usar la base de datos
USE empresapatito;


#crear una tabla empleados
CREATE TABLE empleados(
idempleado int not null,
Nombre VARCHAR (100) not null,
Puesto VARCHAR (50),
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (idempleado)
);


#agregar una columna en la tabla empleados 
ALTER TABLE empleados
ADD COLUMN
CorreoElectronico VARCHAR (100);

#modifiar el tipo de dato de un campo 
ALTER TABLE empleados
modify COLUMN Salario
 DECIMAL (12,2) not null;

#renombrar un campo
alter table empleados
rename column CorreoElectronico to Email;

#crear tabla departamentos 
CREATE TABLE departamentos (
IdDepartamento int not null auto_increment primary key,
NombreDepto varchar (100)
);


#agregar un campo a la tabla empleados, para que sea una fk 
ALTER TABLE empleados
add column idDepartamento int not null;

#gregar la llave foranea
ALTER TABLE empleados 
ADD CONSTRAINT fk_Empleados_departamento
FOREIGN KEY (idDepartamento)
REFERENCES departamentos(idDepartamento);


#Eliminar la clave primaria de empleados
ALTER TABLE empleados 
DROP  primary key;

#Eliminar la Foreign Key ela tabla empleados
ALTER TABLE empleados 
DROP CONSTRAINT fk_Empleados_departamento;

#eliminar el auto increment 
ALTER TABLE departamentos 
modify column idDepartamento int not null;

#Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP primary key ; 
 
#Crear un constraint de verficacion en salario
ALTER TABLE empleados 
ADD CONSTRAINT chk_salario
CHECK (Salario > 0.0);


CREATE TABLE categoria (
id int not null primary key default -1,
Nombre varchar(20),
Estatus char(1) default 'A'
);


INSERT INTO categoria
VALUES (default, 'Carnes', default);

INSERT INTO categoria
VALUES (default, 'Carnes', default);

SELECT * FROM categoria;


#eliminar la columna email 
ALTER TABLE empleados 
DROP COLUMN email;


ALTER TABLE empleados 
ADD CONSTRAINT pk_empleados
PRIMARY KEY  (idempleado);



ALTER TABLE departamentos 
ADD CONSTRAINT pk_departamentos
PRIMARY KEY  (IdDepartamento);


#emliminar tablas
DROP TABLE empleados;


DROP TABLE departamentos;

DROP TABLE categoria;

#Eliminar la base de dato
DROP DATABASE empresapatito;
