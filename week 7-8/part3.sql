-- PART 3
-- use distinct to get unique values (like primary key shiz) in one or more columns

SELECT DISTINCT workdept
FROM emp;

--display MAX salary per dept for those with education >= 16yrs
-- salary must be 60k to 160k, sort BY dept and years of educ (highest first)

-- MY SOL
SELECT DISTINCT workDept, MAX(salary), edLevel
FROM emp 
WHERE (salary BETWEEN 60000 AND 160000) AND edLevel >= 16 
GROUP BY workDept, edlevel
ORDER BY workDept, edLevel DESC;

-- SIR
SELECT workDept, edlevel, MAX(salary) "MAX salary"
FROM emp 
WHERE edlevel >=16
GROUP BY workDept,edlevel
HAVING MAX(salary) BETWEEN 60000 AND 160000
ORDER BY workDept, edLevel desc;