-- script 1 
SELECT COUNT(custNo) "Customer Count", payterm
FROM customer
WHERE address LIKE '%CA%'
GROUP BY payterm;

-- script 2 
SELECT gender, COUNT(gender) "Gender Count"
FROM personnel
GROUP BY gender;

-- script 3
SELECT transNo, quantity
from receiptDetail
ORDER BY quantity DESC;


-- script 4
SELECT YEAR(paydate) "YEAR", transno, SUM(amount) "Total Payment"
FROM payment
WHERE amount > 999
GROUP BY YEAR(paydate),transno
ORDER BY YEAR(paydate) DESC, SUM(amount) DESC;

-- script 5
SELECT prodCode, COUNT(prodCode) "Changes"
FROM pricehist
GROUP BY prodCode
HAVING COUNT(prodCode) > 1;