
CREATE DATABASE  FINAL;
GO
USE FINAL
GO
-- Tạo bảng role
CREATE TABLE ROLE (
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    name NVARCHAR(20),
    createAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id)
)
-- Thêm dữ liệu vào bảng quyền
INSERT INTO ROLE (name) VALUES
    (N'Admin'),
    (N'Guest')
GO
-- Tạo bảng User
CREATE TABLE [USER] (
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    email NVARCHAR(40) NOT NULL,
    name NVARCHAR(40),
    password NVARCHAR(MAX) NOT NULL,
    address NVARCHAR(MAX),
    phone NVARCHAR(MAX),
    pathImg NVARCHAR(MAX),
    idRole UNIQUEIDENTIFIER,
    createAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (idRole) REFERENCES ROLE(id) ON DELETE CASCADE
)
GO
-- Tạo bảng loại sản phẩm
CREATE TABLE CATEGORY(
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    slug NVARCHAR(255),
    name NVARCHAR(255),
    createAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id)
)
-- Tạo bảng sản phẩm
CREATE TABLE PRODUCT(
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    name NVARCHAR(255) NOT NULL,
    detail NVARCHAR(255),
    quantity INT,
    price DECIMAL ,
    type NVARCHAR(255),
    createAt DATETIME DEFAULT GETDATE(),
    idUser UNIQUEIDENTIFIER ,
    pathImg NVARCHAR(MAX),
    idCategory UNIQUEIDENTIFIER ,
    PRIMARY KEY (id),
    FOREIGN KEY (idUser) REFERENCES [USER] (id) ON DELETE CASCADE,
    FOREIGN KEY (idCategory) REFERENCES CATEGORY (id) ON DELETE CASCADE
);
GO
-- Tạo bảng order
CREATE TABLE [ORDER](
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    status int DEFAULT 0,
    total DECIMAL(38,2) DEFAULT 0,
    createAt DATETIME DEFAULT GETDATE() NOT NULL,
    idUser UNIQUEIDENTIFIER,
    PRIMARY KEY (id),
);
-- Tạo bảng chi tiết order
CREATE TABLE DETAILORDERS(
    id UNIQUEIDENTIFIER DEFAULT NEWID(),
    quantity INT NOT NULL,
    price DECIMAL(38,2) NOT NULL,
    idOrder UNIQUEIDENTIFIER,
    idProduct UNIQUEIDENTIFIER,
    createAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id),
    FOREIGN KEY (idOrder) REFERENCES [ORDER] (id) ON DELETE CASCADE,
    FOREIGN KEY (idProduct) REFERENCES [PRODUCT](id) ON DELETE CASCADE
);
GO
SELECT * FROM [PRODUCT]
SELECT * FROM [DETAILORDERS]
-- DROP DATABASE FINAL
SELECT *  FROM PRODUCT JOIN CATEGORY on PRODUCT.idCategory = CATEGORY.id
--DELETE FROM [ORDER]