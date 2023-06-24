

-- PART 2
/**
 * HAVING is just like WHERE but for grouped rows
 */

-- get depts A00, D11, E11 then count all their employees

SELECT workDept, COUNT(empNo) AS "emp count"
FROM emp 
GROUP BY workDept
HAVING workDept IN('A00', 'D11', 'E11'); 

-- list employee count for analysts and designers
SELECT job, COUNT(empNo)
FROM emp 
GROUP BY job 
HAVING job IN ('ANALYST', 'DESIGNER');

-- show gender count for each dept

SELECT workDept, sex, count(sex)
FROM emp 
GROUP BY workdept, sex;

-- count positions filled each year 
SELECT YEAR(hireDate) AS "year", workDept, job, COUNT(empNo) AS "emp count"
FROM emp 
GROUP BY YEAR(hireDate),job, workDept;