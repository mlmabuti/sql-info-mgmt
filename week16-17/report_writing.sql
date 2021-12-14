CREATE VIEW view_current_position AS 
SELECT e.empNo, MAX(jh.effdate) "maxEffdate"
FROM employee e
JOIN jobhistory jh on e.empno = jh.empno
GROUP BY e.empNo;

DROP VIEW view_current_position;

SELECT DISTINCT d.deptName, e.empNo, e.lastName, e.firstName, j.jobDesc, jh.salary
FROM employee e
JOIN jobhistory jh ON e.empno = jh.empno
JOIN view_current_position v ON v.empno = jh.empno
JOIN job j ON j.jobcode = jh.jobcode
JOIN department d ON d.deptcode = jh.deptcode
WHERE e.sepdate IS NULL AND v."maxEffdate" = jh.effdate
ORDER BY d.deptName, e.lastname;