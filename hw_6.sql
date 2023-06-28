/*
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
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