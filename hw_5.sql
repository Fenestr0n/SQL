CREATE DATABASE hw_5;
USE hw_5;


-- ЗАДАНИЕ №1

-- Создать таблицу автомобили
CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10),
    cost INT
);

INSERT cars (name, cost) VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

-- Создайте представление, в которое попадут автомобили стоимостью до $25_000
CREATE OR REPLACE VIEW car_price AS
	SELECT * FROM cars WHERE cost < 25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до $30_000 (используя оператор ALTER VIEW) 
ALTER VIEW car_price AS
	SELECT * FROM cars WHERE cost < 30000;

-- Создайте представление, в котором будут только автомобили марки 'Skoda' и 'Audi'
CREATE OR REPLACE VIEW vag_group AS
	SELECT * FROM cars WHERE name IN ('Skoda', 'Audi');

