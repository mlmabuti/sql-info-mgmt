-- script 1: grouped by payterm; count customers with address that have CA 
SELECT COUNT(custNo) "Customer Count", payterm
FROM customer
WHERE address LIKE '%CA%'
GROUP BY payterm;

-- script 2: group genders then count.
SELECT gender, COUNT(gender) "Gender Count"
FROM personnel
GROUP BY gender;

-- script 3: get highest transNo purchase.
--SELECT transNo, quantity
--FROM receiptDetail
--ORDER BY quantity DESC;

SELECT transno, SUM(quantity) "Largest quantity"
FROM receiptdetail
GROUP BY transno
ORDER BY MAX(quantity) DESC;


-- script 4: get total amount paid per year, group all transNos and sum their amounts.
SELECT YEAR(paydate) "YEAR", transno, SUM(amount) "Total Payment"
FROM payment
WHERE amount > 999 -- only amounts >= 1000
GROUP BY YEAR(paydate),transno -- must group by year and transno because there are many of those rows
ORDER BY YEAR(paydate) DESC, SUM(amount) DESC;

-- script 5: get how many times a product's price has been updated by counting how many prodCodes there have been.
SELECT prodCode, COUNT(prodCode) "Changes"
FROM pricehist
GROUP BY prodCode
HAVING COUNT(prodCode) > 1;

-------------------------------------------------------------------------------------------------------------------
--SQL SCRIPT 1:  What is the summary count of customers paying cash-on-delivery, 
--30-day, and 45-day notice in California? Note:  CA is the code for California.
SELECT payterm, COUNT(custNo) "Count"
FROM customer 
WHERE address LIKE '%CA%'
GROUP BY payterm;

--SQL SCRIPT 2: How many current male and female does the company have?
SELECT gender, COUNT(gender) "Count"
FROM personnel 
GROUP BY gender;

--SQL SCRIPT 3: Which transaction has the biggest number of total quantities
-- delivered?  Refer to the RECEIPTDETAIL table.  Sort from the highest to the lowest quantity. (20 points)
--SELECT transno, SUM(quantity) "Largest quantity"
--FROM receiptdetail
--GROUP BY transno
--HAVING SUM(quantity) = 1
--ORDER BY MAX(quantity) DESC;

SELECT transno, SUM(quantity) "Largest quantity"
FROM receiptdetail
GROUP BY transno
ORDER BY MAX(quantity) DESC;

--SQL SCRIPT 4: Generate the total payment made per transaction
-- each year.  Exclude a total amount less than 1,000 dollars. 
--List year, transaction number, total Payment. 
--The listing should be grouped by year with the highest amount first on that year.
SELECT YEAR(paydate)"Year",  transno, SUM(amount) "Total"
FROM payment
GROUP BY YEAR(paydate), transno
HAVING SUM(amount) > 999
ORDER BY SUM(amount) DESC;

-- count records less than 1k
--SELECT YEAR(paydate) "YEAR", COUNT(transno)
--FROM payment 
--GROUP BY YEAR(paydate)
--HAVING SUM(amount) < 1000;


--SQL SCRIPT 5: Which product code has multiple changes in prices in PRICEHIST table? 
SELECT prodCode, COUNT(prodCode) "Count" 
FROM pricehist
GROUP BY prodCode
HAVING COUNT(prodCode) > 1;

-- avg of pf0003
SELECT prodCode, AVG(unitPrice)
FROM pricehist
GROUP BY prodCode
HAVING prodCOde = 'PF0003';

-- last hiring date 
SELECT hiredate 
FROM personnel
ORDER BY hiredate DESC;

