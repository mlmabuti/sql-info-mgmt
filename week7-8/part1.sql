/** GROUP BY is used to arrange identical data 
into groups with the help of some functions. 
i.e if a particular column has the same values in
different rows then it will arrange these rows in a group
*/

-- group by job 
SELECT job 
FROM emp 
GROUP BY job;

-- use COUNT() aggregate func
SELECT job, COUNT(job) AS "Employee Count"
FROM emp 
GROUP BY job;

-- view job and salary and use AVG() to get avg salary
SELECT job, AVG(salary) AS "Avg salary"
FROM emp
GROUP BY job;

-- get annual salary paid by the company for each job position using SUM()
SELECT job, SUM(salary) AS "salary paid for position"
FROM emp 
GROUP BY job;

-- lowest and highest salary per position using MIN() and MAX()
SELECT job, MIN(salary) AS "min", MAX(salary) AS "max"
FROM emp 
GROUP BY job;

-- get earliest hire date 
SELECT MIN(hireDate) AS "earliest hire"
FROM emp;

-- get earliest hire date PER JOB
SELECT job, MIN(hireDate) AS "earliest hire"
FROM emp 
GROUP BY job;

-- most recent hire
SELECT MAX(hireDate) AS "hireDate"
FROM emp; 

-- most recently hired employee
SELECT lastName, firstnme, hireDate
FROM emp 
ORDER BY hireDate DESC;