CREATE DATABASE EmpresaEx;
GO
 
USE EmpresaEx;
go


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100),
    Description NVARCHAR(255)
);
GO


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Region NVARCHAR(100),
    HomePage NVARCHAR(255)
);
GO

CREATE TABLE ContactSupplier (
    ContactSupplierID INT PRIMARY KEY,
    ContactName NVARCHAR(100),
    Phone NVARCHAR(50),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    UnitPrice MONEY,
    UnitsInStock INT,
    QuantityPerUnit NVARCHAR(50),
    CategoryID INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName NVARCHAR(100),
    ContactName NVARCHAR(100),
    City NVARCHAR(100),
    Region NVARCHAR(100)
);
GO


CREATE TABLE ContactCustomer (
    ContactID INT PRIMARY KEY,
    CustomerID INT,
    Phone NVARCHAR(50),
    Email NVARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName NVARCHAR(100)
);
GO

CREATE TABLE PhonesShipper (
    PhoneID INT PRIMARY KEY,
    ShipperID INT,
    Phone NVARCHAR(50),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
GO


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATE,
    City NVARCHAR(100),
    ReportsTo INT NULL,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    RequiredDate DATE,
    CustomerID INT,
    ShipperID INT,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE Details (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice MONEY,
    Discount FLOAT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

