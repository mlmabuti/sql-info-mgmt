-- quiz how many do not live in CA
SELECT COUNT(custNo) "Customer Count", payterm
FROM customer
WHERE address NOT LIKE '%CA%'
GROUP BY payterm;

-- quiz get number of custs with 45D payterm
SELECT payTerm, COUNT(payterm) "Number of Customers" 
FROM customer 
WHERE address  LIKE '%NY%'  AND payTerm= '45D' 
GROUP BY payTerm;

SELECT payTerm, COUNT(payterm) "Number of Customers" 
FROM customer WHERE address  LIKE '%NY%' 
GROUP BY payTerm 
HAVING payTerm='45D';

-- quiz how many customers pay COD disregarding addr
SELECT COUNT(custNo) "Customer Count", payterm
FROM customer
GROUP BY payterm;

-- quiz transactions that only have 1 qty
SELECT transno, quantity
FROM receiptdetail
WHERE quantity = 1 AND transno IN ('TR000117','TR000019','TR000118','TR000114','TR000034');

--quiz last hiring date 
SELECT MIN(hiredate)
from personnel; 

-- count transactions less than 1k
SELECT COUNT(transno)
FROM payment
WHERE amount <= 1000;

-- prodcodes that did not change in price
SELECT COUNT(prodCode)
FROM pricehist 
WHERE COUNT(prodCode) = 1

-- averages instead of count in script 5
SELECT prodCode, AVG(unitPrice)
FROM pricehist
GROUP BY prodCode, unitPrice;