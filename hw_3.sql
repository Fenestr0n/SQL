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

