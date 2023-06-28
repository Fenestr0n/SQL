/*
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/

DROP FUNCTION IF EXISTS parse_time;
DELIMITER //
CREATE FUNCTION parse_time(sec INT)
RETURNS VARCHAR(128)
DETERMINISTIC
BEGIN
	DECLARE dd CHAR(5);
	DECLARE hh, mm, ss CHAR(2);
	DECLARE result VARCHAR(100);
	SET dd = cast(floor(sec/60/60/24) as char(3));
	SET hh = cast(floor(mod(sec/60/60/24,1)*24) as char(2));
	SET mm = cast(floor(mod(mod(sec/60/60/24,1)*24,1)*60) as char(2));
	SET ss = cast(round(mod(mod(mod(sec/60/60/24,1)*24,1)*60,1)*60) as char(2));
	SET result = concat(dd, " days ", hh, " hours ", mm, " minutes ", ss, " seconds");
	RETURN result;
END //
DELIMITER ;

SELECT parse_time(123456);


/*
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
DROP PROCEDURE IF EXISTS even;
DELIMITER //
CREATE PROCEDURE even(IN n INT, IN m INT)
BEGIN
	DECLARE result VARCHAR(100) DEFAULT '';
	IF (n % 2 != 0) THEN SET n = n + 1;
	END IF;
	WHILE (n <= m) DO
		SET result = CONCAT(result, ' ', n);
        SET n = n + 2;
	END WHILE;
    SELECT result;
END //
DELIMITER ;

CALL even(1, 10);