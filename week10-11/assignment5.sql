/**
SQL SCRIPT 1: List the transaction number, sales date, product code, 
description, unit and quantity from hope database.  Sort according to 
transaction number and product code. Use LEFT JOIN in your solution.

SQL SCRIPT 2: Display the employee number, last name, first name, job description,
and effectivity date from the job history of the employee. Sort last name and 
effectivity date (last date first). Use LEFT JOIN.

SQL SCRIPT 3: Show total quantity sold from product table.  Display product code, 
description, unit, quantity. Use RIGHT JOIN.  Sort according to the most product sold.

SQL SCRIPT 4:  Generate the detailed payments made by customers for specific 
transactions.  Display customer number, customer name, payment date, official
receipt no, transaction number and payment amount. Sort according  to the 
customer name. Use LEFT JOIN.

SQL SCRIPT 5:  What is the current price of  each product?  Display product code, 
product description, unit, and its current price. Always assume that NOT ALL 
products HAVE unit price BUT you need to display it even if it has no unit 
price on it. DO NOT USE INNER JOIN.

HINT:  You will use MAX(). This is a nested join. Your list should consist only of 57 rows.
**/

--SCRIPT 1
SELECT s.transno, s.salesdate, p.prodcode, p.description, p.unit, sd.quantity
FROM sales s, product p 
LEFT JOIN salesdetail sd
ON s.transno = sd.transno 
WHERE p.prodcode = sd.prodcode
ORDER BY sd.transno, p.prodcode; 

--SCRIPT 2
SELECT e.empno, e.lastname, e.firstname, j.jobdesc, jh.effdate
FROM employee e, job j 
LEFT JOIN jobhistory jh
ON e.empno = jh.empno
WHERE j.jobcode = jh.jobcode 
ORDER BY e.lastname, jh.effdate DESC;

--SCRIPT 3
SELECT p.prodcode, p.description, p.unit, SUM(sd.quantity) "Quantity"
FROM salesdetail sd
RIGHT JOIN product p
ON p.prodcode = sd.prodcode
GROUP BY p.unit, p.description, p.prodcode
ORDER BY SUM(sd.quantity) DESC;

--SCRIPT 4
SELECT c.custno, c.custname, py.paydate, py.orno, s.transno, py.amount
FROM sales s, payment py 
LEFT JOIN customer c
ON s.transno = py.transno 
WHERE c.custno = s.custno
ORDER BY custname;

--SCRIPT 5 (NOTE: THERE IS PROBABLY A WAY TO DO THIS WITHOUT A SUBQUERY
			-- Also haven't checked if the results match the quiz)
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

-- SCRIPT 5 using 1 JOIN and AND
SELECT p.prodcode, p.description, p.unit, ph.unitprice
FROM product p, pricehist ph
FULL JOIN pricehist ph2
ON ph2.effdate = ph.effdate
WHERE (ph.prodcode, ph2.effdate) 
				IN (
				SELECT prodcode, MAX(effdate) "effdate"
				FROM pricehist
				GROUP BY prodcode
				) 
				AND p.prodcode = ph.prodcode
GROUP BY p.prodcode, p.description, p.unit, ph.unitprice;

-- CHECK QUIZ SCRIPT 4
SELECT c.custno, c.custname, SUM(py.amount)
FROM sales s, payment py 
LEFT JOIN customer c
ON s.transno = py.transno 
WHERE c.custno = s.custno
GROUP BY c.custname,c.custno
ORDER BY SUM(py.amount) DESC;
--- END

-- DRE SOLUTION ON SCRIPT 5
select p.prodcode, p.description, p.unit, b.unitprice AS PRICE
from product p 
join (
select prodcode, max(effdate) a_1
from pricehist
group by prodcode) a
on p.prodcode = a.prodcode 
join (
select prodcode, unitprice, max(effdate) a_2
from pricehist 
group by prodcode, unitprice) b
on p.prodcode = b.prodcode and a.a_1 = b.a_2