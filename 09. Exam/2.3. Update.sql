UPDATE 
	coaches
SET
	salary = salary * coach_level
WHERE 
	first_name LIKE 'C%'
	AND
	coach_level > 1;