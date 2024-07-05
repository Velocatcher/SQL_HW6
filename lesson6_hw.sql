/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //
CREATE FUNCTION formatSeconds(seconds INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
DECLARE days INT;
DECLARE hours INT;
DECLARE minutes INT;
DECLARE result VARCHAR(250);
SET days = FLOOR(seconds / (3600*24));
SET seconds = seconds - (days * 3600 * 24);
SET hours = FLOOR(seconds / 3600);
SET seconds = seconds - (hours * 3600);
SET minutes = FLOOR(seconds / 60);
SET seconds = seconds - (minutes * 60);

SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

RETURN result;
END //
DELIMITER ;

SELECT formatSeconds(123456);


/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER //

CREATE PROCEDURE get_even_numbers()
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE result TEXT DEFAULT NULL;
WHILE i <= 10 DO
    IF i % 2 = 0 THEN
		IF result IS NULL THEN
				SET result = CONCAT(i);
			ELSE
				SET result = concat(result, ', ', i);
			END IF;          
    END IF;
    SET i = i + 1;
END WHILE;
SELECT result;
END //
DELIMITER ;


CALL get_even_numbers();
DROP procedure get_even_numbers;