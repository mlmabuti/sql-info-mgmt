-- AS assigns alias NOTE: use "" instead of '' for ALIASING
SELECT lastName AS "last name", firstNme AS "first name"
FROM emp;
-- SELECT lastName "last name", firstNme "first name" 
-- not adding AS results into the same thing.

-- compute the age for all the employees
SELECT lastName, firstNme, birthDate, 2020-YEAR(birthDate) AS "AGE"
FROM emp

-- check employees below 20
SELECT lastName, firstNme, birthDate, 2020-YEAR(birthDate)
FROM emp
WHERE 2020-YEAR(birthDate) <= 20;

-- select the 10% of the emps salary and create another col with it added to 
-- their current salary
SELECT lastname, firstNme, salary, 
0.1 * salary AS "10% of salary",
1.1 * salary AS "+10% increase"
FROM emp;

-- concatenate lastname and firstname
SELECT CONCAT(lastname, firstname)
FROM emp;
-- to fix the ugliness
SELECT CONCAT(CONCAT(lastname,', '), firstnme) AS "full name", job
from emp;