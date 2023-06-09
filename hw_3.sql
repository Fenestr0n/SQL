CREATE DATABASE hw_3;
USE hw_3;

-- Создать таблицу продавцы
CREATE TABLE salespeople
(
    snum INT PRIMARY KEY,
    sname VARCHAR(25),
    city VARCHAR(25),
    comm DECIMAL(10, 2)
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

-- Создать таблицу заказы
CREATE TABLE orders (
    onum INT PRIMARY KEY,
    amt DECIMAL(10, 2),
    odate DATE,
    cnum INT,
    snum INT,
    FOREIGN KEY (cnum) REFERENCES customers (cnum),
    FOREIGN KEY (snum) REFERENCES salespeople (snum)
);

INSERT orders
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.1, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);


-- Вывести таблицу со столбцами в следующем порядке: city, sname, snum, comm
SELECT city, sname, snum, comm FROM salespeople;

--Вывести оценку (rating), сопровождаемую именем каждого заказчика в городе San Jose
SELECT cname, rating FROM customers WHERE city = 'San Jose';

-- Вывести уникальные значения snum всех продавцов из таблицы заказов
SELECT DISTINCT snum FROM orders;

-- Выбрать заказчиков, чьи имена начинаются с буквы G.
SELECT * FROM customers WHERE cname LIKE 'G%';

-- Вывести все заказы со значениями суммы выше чем $1.000
SELECT * FROM orders WHERE amt > 1000;

-- Выбрать наименьшую сумму заказа
SELECT * FROM orders WHERE amt = (
	SELECT MIN(amt) FROM orders);

-- Показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме
SELECT * FROM customers WHERE rating > 100 AND NOT city = 'Rome';


-- Создать таблицу сотрудники
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    surname VARCHAR(45),
    specialty VARCHAR(45),
    seniority INT,
    salary INT,
    age INT
);

INSERT employee (name, surname, specialty, seniority, salary, age) VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

-- Отсортируйте поле 'зарплата' в порядке убывания и возрастания
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY salary;

-- Отсортируйте по возрастанию поле 'зарплата' и выведите 5 строк с наибольшей заработной платой
SELECT * FROM (
	SELECT * FROM employee ORDER BY salary DESC LIMIT 5) AS temp_table
ORDER BY salary;

-- Выполните группировку всех сотрудников по специальности, суммарная зарплата которых превышает 100_000
SELECT specialty, SUM(salary) AS salary_sum
FROM employee
GROUP BY specialty
HAVING salary_sum > 100000;
