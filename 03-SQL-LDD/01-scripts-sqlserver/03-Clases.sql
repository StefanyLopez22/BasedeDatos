
--Crear la base de datos 
CREATE DATABASE Clases;
GO

USE Clases;
GO

CREATE TABLE Instructor(
InstructorId INT not null identity(1,1),
SSN INT not null,
LName nvarchar(20),
FName nvarchar(20),
CONSTRAINT pk_Instructor
PRIMARY KEY(InstructorId, SSN)
);

CREATE TABLE Class(
ClassId INT not null identity(1,1),
CourseName nvarchar not null,
Yearr INT not null,
Term nvarchar(20) not null,
Section nvarchar(20) not null,
CONSTRAINT pk_Class
PRIMARY KEY (ClassId,CourseName,Yearr, Term, Section )
);

CREATE TABLE Teaches(
InstructorId INT not nulL,
SSN INT not null,
ClassId INT not null ,
CourseName nvarchar not null,
Yearr INT not null,
Term nvarchar(20) not null,
Section nvarchar(20) not null,
CONSTRAINT fk_Teaches_Instructor
FOREIGN KEY (InstructorId,SSN)
REFERENCES Instructor(InstructorId, SSN),
CONSTRAINT fk_Teaches_Class
FOREIGN KEY (ClassId,CourseName,Yearr,Term, Section)
REFERENCES Class(ClassId,CourseName,Yearr, Term, Section)
);
