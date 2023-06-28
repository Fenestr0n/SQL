CREATE DATABASE hw_4;
USE hw_4;

-- Создать таблицу автомобили
CREATE TABLE auto (
    regnum VARCHAR(10) PRIMARY KEY,
    mark VARCHAR(10),
    color VARCHAR(15),
    releasedt DATE,
    phonenum VARCHAR(15)
);

INSERT INTO auto (regnum, mark,	color, releasedt, phonenum )
VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', NULL),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', NULL),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', '9213333331');

-- Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA
SELECT mark, color, COUNT(*)
FROM auto 
WHERE mark IN ('BMW', 'LADA')
GROUP BY mark, color
ORDER BY mark;

-- Вывести на экран марку авто и количество авто не этой марки.
SELECT DISTINCT mark AS amount, (
	SELECT COUNT(*) FROM auto WHERE NOT mark = amount ) AS rest
FROM auto;


-- Даны 2 таблицы, созданные следующим образом:
CREATE TABLE test_a (id INT, test VARCHAR(10));
INSERT test_a (id, test) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

CREATE TABLE test_b (id INT);
INSERT test_b (id) VALUES
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT * FROM test_a
LEFT JOIN test_b on test_b.id = test_a.id
WHERE test_b.id IS NULL;