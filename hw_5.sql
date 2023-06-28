CREATE DATABASE hw_5;
USE hw_5;

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

