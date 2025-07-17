
CREATE DATABASE COMPANY;
GO

USE COMPANY;
GO


CREATE TABLE Employee (
    SSN INT NOT NULL,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Name NVARCHAR(100),
    Address NVARCHAR(100),
    Salary DECIMAL(10, 2),
    Sex CHAR(1),
    SupervisorSSN INT,
    DeptNumber INT,
    CONSTRAINT pk_employee PRIMARY KEY (SSN),
    CONSTRAINT chk_employee_sex CHECK (Sex IN ('M', 'F')),
    CONSTRAINT fk_employee_supervisor FOREIGN KEY (SupervisorSSN)
        REFERENCES Employee(SSN),
    CONSTRAINT fk_employee_department FOREIGN KEY (DeptNumber)
        REFERENCES Department(DeptNumber)
);
GO

CREATE TABLE Department (
    DeptNumber INT NOT NULL,
    Name NVARCHAR(50),
    Location NVARCHAR(100),
    CONSTRAINT pk_department PRIMARY KEY (DeptNumber)
);
GO


CREATE TABLE Project (
    ProjNumber INT NOT NULL,
    Name NVARCHAR(50),
    Location NVARCHAR(100),
    DeptNumber INT,
    CONSTRAINT pk_project PRIMARY KEY (ProjNumber),
    CONSTRAINT fk_project_department FOREIGN KEY (DeptNumber)
        REFERENCES Department(DeptNumber)
);
GO


CREATE TABLE Dependent (
    SSN INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Sex CHAR(1),
    BirthDay DATE,
    Relationship NVARCHAR(20),
    CONSTRAINT pk_dependent PRIMARY KEY (SSN, Name),
    CONSTRAINT chk_dependent_sex CHECK (Sex IN ('M', 'F')),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (SSN)
        REFERENCES Employee(SSN)
);
GO


CREATE TABLE Manages (
    SSN INT NOT NULL,
    DeptNumber INT NOT NULL,
    StartDay DATE,
    CONSTRAINT pk_manages PRIMARY KEY (SSN, DeptNumber),
    CONSTRAINT fk_manages_employee FOREIGN KEY (SSN)
        REFERENCES Employee(SSN),
    CONSTRAINT fk_manages_department FOREIGN KEY (DeptNumber)
        REFERENCES Department(DeptNumber)
);
GO


CREATE TABLE WorksOn (
    SSN INT NOT NULL,
    ProjNumber INT NOT NULL,
    Hours DECIMAL(5, 2),
    CONSTRAINT pk_workson PRIMARY KEY (SSN, ProjNumber),
    CONSTRAINT fk_workson_employee FOREIGN KEY (SSN)
        REFERENCES Employee(SSN),
    CONSTRAINT fk_workson_project FOREIGN KEY (ProjNumber)
        REFERENCES Project(ProjNumber)
);
GO