SELECT empNo, lastName, firstNme, midInit
FROM emp 
WHERE midInit IS NULL;

SELECT lastName || ', ' || firstNme AS "Name", birthDate
FROM emp 
ORDER BY lastName;

SELECT empNo, lastName, firstNme, hireDate
FROM emp 
WHERE YEAR(hireDate) BETWEEN 1990 and 2000
ORDER BY hireDate;

SELECT workDept, empNo, lastName || ', ' || firstNme, salary
FROM emp 
WHERE salary BETWEEN 30000 AND 50000
ORDER BY workDept, lastName;

SELECT workDept, empNo, lastName || ', ' || firstNme AS "Name",
salary, salary * 1.1 AS "New Salary"
FROM emp 
WHERE salary BETWEEN 35000 AND 40000
ORDER BY workDept, lastName;