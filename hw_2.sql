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

ALTER TABLE hw_2.sales ADD COLUMN order_size VARCHAR(20);

UPDATE hw_2.sales SET order_size =
CASE
    WHEN hw_2.sales.bucket = 'less than equal to 100'
		THEN 'Маленький заказ'
	WHEN hw_2.sales.bucket = '101 to 300'
		THEN 'Средний заказ'
	WHEN hw_2.sales.bucket = 'greater than 300'
		THEN 'Большой заказ'
	ELSE 'Fail'
    END;


/*
Создайте таблицу “orders”, заполните ее значениями.
Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE TABLE hw_2.order
(
  orderid INT AUTO_INCREMENT PRIMARY KEY,
  employeeid VARCHAR(10) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  orderstatus VARCHAR(45) NOT NULL
);

INSERT hw_2.order(employeeid, amount, orderstatus)
VALUES
('e03', 15.00,'OPEN'),
('e01', 25.50,'OPEN'),
('e05', 100.70,'CLOSED'),
('e02', 22.18,'OPEN'),
('e04', 9.50,'CANCELLED'),
('e04', 99.99,'OPEN');

SELECT orderid, orderstatus,
CASE
	WHEN orderstatus = 'OPEN'
		THEN 'Order is in open state'
	WHEN orderstatus = 'CLOSED'
		THEN 'Order is closed'
	WHEN orderstatus = 'CANCELLED'
		THEN 'Order is cancelled'
	ELSE 'Fail'
END AS order_summary
FROM hw_2.order;
