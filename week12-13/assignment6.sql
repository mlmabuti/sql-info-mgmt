---------------------------------------
CREATE VIEW hire_count_view AS 
SELECT YEAR(e.hiredate) "Year", MONTH(e.hiredate) "Month", COUNT(e.empno)"Count"
FROM employee e
GROUP BY YEAR(e.hiredate), MONTH(e.hiredate);

SELECT * FROM hire_count_view ORDER BY 1,2;
---------------------------------------
CREATE VIEW cust_trans_count AS
SELECT c.custno, c.custname, COUNT(s.transno) "TransCount"
FROM customer c 
JOIN sales s 
ON c.custno = s.custno
GROUP BY c.custno, c.custname;

SELECT * FROM cust_trans_count ORDER BY 3 DESC;
---------------------------------------
CREATE VIEW job_avg_salary AS 
SELECT j.jobcode, j.jobdesc, CAST(AVG(jh.salary) AS DECIMAL(10,2)) "AVG"
FROM job j 
JOIN jobhistory jh 
ON jh.jobcode = j.jobcode
WHERE j.jobcode NOT IN ('MGR', 'VP', 'PRES')
GROUP BY j.jobcode, j.jobdesc;

SELECT * FROM job_avg_salary;
---------------------------------------
--CREATE VIEW prod_price_changes AS 
SELECT COUNT(p.prodcode) "Changes", p.prodcode, p.description
FROM product p 
JOIN pricehist ph 
ON p.prodcode = ph.prodcode
GROUP BY p.prodcode, p.description
HAVING COUNT(p.prodcode) > 1;

SELECT * FROM prod_price_changes ORDER BY 1 DESC;
---------------------------------------
CREATE VIEW current_price AS 
SELECT p.prodcode, p.description, p.unit, ph.unitprice
FROM product p 
FULL JOIN pricehist ph 
ON p.prodcode = ph.prodcode
FULL JOIN pricehist ph2
ON ph2.effdate = ph.effdate 
WHERE (ph.prodcode, ph2.effdate) IN (SELECT prodcode, MAX(effdate) "effdate" 
										FROM pricehist 
										GROUP BY prodcode)
GROUP BY p.prodcode, p.description, p.unit, ph.unitprice;

SELECT * FROM current_price;
---------------------------------------
-- tables in quiz emp and jh
CREATE VIEW dept_employees AS 
SELECT jh.deptcode, d.deptname, COUNT(e.empno) "Count"
FROM department d, jobhistory jh
JOIN employee e 
ON e.empno = jh.empno
WHERE e.sepdate IS NULL 
GROUP BY jh.deptcode, d.deptname;

SELECT * FROM dept_employees;
---------------------------------------
CREATE VIEW emp_promotions AS 
SELECT e.empno,  e.lastname || ', ' || e.firstname "Name", COUNT(e.empno) "Promotions"
FROM employee e 
JOIN jobhistory jh 
ON e.empno = jh.empno
WHERE e.sepdate IS NULL
GROUP BY e.empno, e.lastname || ', ' || e.firstname;

SELECT * FROM emp_promotions ORDER BY 3 DESC;
---------------------------------------
CREATE VIEW most_bought AS 
SELECT p.prodcode, p.description, p.unit, SUM(sd.quantity) "TotalQuantity"
FROM product p 
JOIN salesdetail sd 
ON p.prodcode = sd.prodcode
GROUP BY p.prodcode, p.description, p.unit;

SELECT * FROM most_bought ORDER BY 4 DESC;
--------------------------------------THIS IS 9_2----------------------------------------------
CREATE VIEW v1 AS
SELECT s.transno, s.salesdate, ph.effdate, ph.prodcode, sd.quantity 
FROM salesdetail sd
JOIN pricehist ph 
ON ph.prodcode = sd.prodcode
JOIN sales s 
ON s.transno = sd.transno 
WHERE s.salesdate >= ph.effdate;

DROP VIEW v1;
SELECT * FROM v1;

CREATE VIEW v2 AS
SELECT MAX(v1.effdate) "effdate", v1.salesdate, v1.transno, v1.prodcode, v1.quantity
FROM v1
GROUP BY v1.transno, v1.salesdate, v1.prodcode, v1.quantity;

DROP VIEW v2;
SELECT * FROM v2;

CREATE VIEW v3 AS
SELECT p.prodcode, p.unit, p.description, SUM(ph.unitprice*v2.quantity) "TOTAL"
FROM product p 
JOIN v2
ON v2.prodcode = p.prodcode
JOIN pricehist ph
ON ph.prodcode = v2.prodcode
WHERE ph.effdate IN v2."effdate" AND v2.salesdate >= ph.effdate
GROUP BY p.prodcode, p.description, p.unit;

SELECT * FROM v3;
-------------------------------------------------------------------------
CREATE VIEW v4 AS
SELECT c.custno, c.custname, SUM(ph.unitprice*v2.quantity) "TOTAL"
FROM customer c 
JOIN sales s 
ON s.custno = c.custno
JOIN v2 
ON v2.transno = s.transno
JOIN pricehist ph 
ON ph.prodcode = v2.prodcode 
WHERE ph.effdate IN v2."effdate" AND v2.salesdate >= ph.effdate
GROUP BY c.custno, c.custname;

SELECT * FROM v4 ORDER BY 3 DESC;

-- QUIZ CHECK WHO BOUGHT THE PRODUCTS
--CREATE VIEW v4 AS
SELECT c.custno, c.custname, p.description, SUM(ph.unitprice*v2.quantity) "TOTAL"
FROM customer c 
JOIN sales s 
ON s.custno = c.custno
JOIN v2 
ON v2.transno = s.transno
JOIN pricehist ph 
ON ph.prodcode = v2.prodcode 
JOIN product p 
ON p.prodcode = v2.prodcode
WHERE ph.effdate IN v2."effdate" AND v2.salesdate >= ph.effdate
GROUP BY c.custno, c.custname, p.description;