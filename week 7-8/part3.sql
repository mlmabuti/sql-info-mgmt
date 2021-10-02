-- PART 3
-- use distinct to get unique values (like primary key shiz) in one or more columns

SELECT DISTINCT workdept
from emp;

--display max salary per dept for those with education >= 16yrs
-- salary must be 60k to 160k, sort by dept and years of educ (highest first)

-- MY SOL
SELECT DISTINCT workDept, MAX(salary), edLevel
from emp 
WHERE (salary BETWEEN 60000 AND 160000) AND edLevel >= 16 
GROUP BY workDept, edlevel
ORDER BY workDept, edLevel DESC;

-- SIR
SELECT workDept, edlevel, max(salary) "max salary"
FROM emp 
WHERE edlevel >=16
group by workDept,edlevel
HAVING max(salary) BETWEEN 60000 AND 160000
ORDER by workDept, edLevel desc;