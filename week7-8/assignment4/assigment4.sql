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
SELECT transNo, quantity
FROM receiptDetail
ORDER BY quantity DESC;


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