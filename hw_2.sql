/*
Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
*/

CREATE DATABASE hw_2;
USE hw_2;

CREATE TABLE sales
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_date VARCHAR(10) NOT NULL,
  bucket VARCHAR(45) NOT NULL
);

INSERT sales(order_date, bucket)
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');


/*
Разделите  значения поля “bucket” на 3 сегмента:
- меньше 100(“Маленький заказ”), 
- 100-300(“Средний заказ”)
- больше 300 (“Большой заказ”)
*/
