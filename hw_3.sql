CREATE DATABASE hw_3;
USE hw_3;

-- Создать таблицу продавцы
CREATE TABLE salespeople
(
    snum INT PRIMARY KEY,
    sname VARCHAR(25),
    city VARCHAR(25),
    comm DECIMAL(2, 2)
);

INSERT salespeople
VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'New York', 0.10);

-- Создать таблицу заказчики
CREATE TABLE customers (
    cnum INT PRIMARY KEY,
    cname VARCHAR(25),
    city VARCHAR(25),
    rating INT,
    snum INT,
    FOREIGN KEY (snum) REFERENCES salespeople (snum)
);

INSERT customers
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);
