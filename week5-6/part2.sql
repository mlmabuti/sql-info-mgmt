CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE emp');

-- to show stuff in between a range
-- aka, you can use BETWEEN x AND y
SELECT lastName, firstNme, job, salary 
FROM emp 
WHERE salary BETWEEN 30000 AND 40000;

-- salary greater than 60k and job is not pres or manager
SELECT lastName, firstNme, job, salary 
FROM emp 
WHERE salary >= 60000 AND job NOT IN('PRES', 'MANAGER');

-- kinda like a regex pattern search, LIKE filters patterns 
-- % is a wildcard that includes any following character
SELECT lastName, job, salary 
FROM emp 
WHERE lastName LIKE 'S%';

-- filter a lastname with a second letter that has E
-- _ refers to the preceding character; you can have multiple
SELECT lastName, job, salary 
FROM emp 
WHERE lastName LIKE '_E%';

-- for DATES, fetch stuff with bdays in between 1961 and 1971
SELECT lastname, firstNme, birthDate
FROM emp 
--WHERE birthDate >= '1961-01-01' AND birthDate <= '1971-12-31';
WHERE birthDate BETWEEN '1961-01-01' AND '1971-12-31';