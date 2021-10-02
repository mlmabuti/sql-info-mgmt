

-- PART 2
/**
 * HAVING is just like WHERE but for grouped rows
 */

-- get depts A00, D11, E11 then count all their employees

SELECT workDept, COUNT(empNo) AS "emp count"
from emp 
GROUP by workDept
HAVING workDept IN('A00', 'D11', 'E11'); 

-- list employee count for analysts and designers
SELECT job, COUNT(empNo)
from emp 
group by job 
HAVING job IN ('ANALYST', 'DESIGNER');

-- show gender count for each dept

SELECT workDept, sex, count(sex)
from emp 
group by workdept, sex;

-- count positions filled each year 
SELECT YEAR(hireDate) AS "year", workDept, job, COUNT(empNo) AS "emp count"
from emp 
group by YEAR(hireDate),job, workDept;