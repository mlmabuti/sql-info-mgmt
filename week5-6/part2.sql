CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE emp');

-- to show stuff in between a range
-- aka, you can use BETWEEN x AND y
SELECT lastName, firstNme, job, salary 
FROM emp 
WHERE salary BETWEEN 30000 AND 40000;

-- you can use NOT IN (list)
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

