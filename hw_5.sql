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



-- ЗАДАНИЕ №2

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

-- Таблица групп анализов Analysis_groups
CREATE TABLE Analysis_groups (
    gr_id INT PRIMARY KEY AUTO_INCREMENT,   -- ID группы
    gr_name VARCHAR(45),    -- название группы
    gr_temp INT     -- температурный режим хранения
);

INSERT Analysis_groups (gr_name, gr_temp) VALUES
('Иммунологические', -22),
('Серологические', -17),
('Микробиологические', -5);


-- Таблица анализов Analysis
CREATE TABLE Analysis (
    an_id INT PRIMARY KEY AUTO_INCREMENT,   -- ID анализа
    an_name VARCHAR(45),    -- название анализа
    an_cost INT,    -- себестоимость анализа
    an_price INT,   -- розничная цена анализа
    an_group INT,   -- группа анализов
    FOREIGN KEY (an_group) REFERENCES Analysis_groups (gr_id) ON DELETE CASCADE
);

INSERT Analysis (an_name, an_cost, an_price, an_group) VALUES 
('Забор крови', 250, 320, 1),
('Фагоцитоз', 300, 550, 1),
('Кандидоз', 170, 480, 2),
('Столбняк', 530, 1300, 2),
('Анализ мокроты', 270, 500, 3),
('Дисбактериоз кишечника', 500, 1250, 3);


-- Таблица заказов Orders
CREATE TABLE Orders (
    ord_id INT PRIMARY KEY AUTO_INCREMENT,  -- ID заказа
    ord_datetime DATETIME,  -- дата и время заказа
    ord_an INT,     -- ID анализа
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id) ON DELETE CASCADE
);

INSERT Orders (ord_datetime, ord_an) VALUES
('2020-01-31 09:00:00', 1),
('2020-02-05 10:00:00', 2),
('2020-02-06 13:30:00', 3),
('2020-02-07 15:30:00', 4),
('2020-02-09 12:00:00', 5),
('2020-02-10 11:30:00', 6),
('2020-02-15 14:30:00', 3),
('2020-02-17 12:30:00', 2),
('2020-02-18 11:00:00', 1);


-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SELECT an_name, an_cost, ord_datetime
FROM Analysis
JOIN Orders
ON ord_an = an_id
WHERE ord_datetime BETWEEN '2020-02-05'
AND '2020-02-05' + INTERVAL 1 week;


-- ЗАДАНИЕ №3

/*
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время 
станций для пар смежных станций. Мы можем вычислить это значение без использования оконной функции SQL, 
но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

CREATE TABLE train (
    train_id INT,
    station VARCHAR(20),
    station_time TIME
);

INSERT timetable VALUES
	(110, 'San Francisco', '10:00:00'),
	(110, 'Redwood City', '10:54:00'),
	(110, 'Palo Alto', '11:02:00'),
	(110, 'San Jose', '12:35:00'),
	(120, 'San Francisco', '11:00:00'),
	(120, 'Palo Alto', '12:49:00'),
	(120, 'San Jose', '13:30:00');

SELECT *, TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id), station_time) AS time_to_next_station
FROM train;

