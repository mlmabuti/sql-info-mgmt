DROP PROCEDURE PAYMENT_SHORT;

--#SET TERMINATOR @
CREATE PROCEDURE PAYMENT_SHORT ()
DYNAMIC RESULT SETS 1 
BEGIN
  	BEGIN 
  		DECLARE cur1 CURSOR WITH RETURN FOR 
  			SELECT DISTINCT s.transno, c.custname, t.total "Total Sales", 
  							GET_TOTAL_PAYMENT(s.transno) "Total Payment", 
  							(t.total)-GET_TOTAL_PAYMENT(s.transno) "Difference"
  			FROM sales s
  			JOIN customer c ON c.custno = s.custno
  			JOIN view_total_sales t ON t.transno = s.transno;
  			
  		OPEN cur1;
  	END;
END@
--#SET TERMINATOR ;

CALL PAYMENT_SHORT();

-- tests
SELECT * FROM v1;
SELECT * FROM v2;

-- create view
DROP VIEW view_total_sales;

CREATE VIEW view_total_sales AS
SELECT v2.transno, SUM(ph.unitprice*v2.quantity) "TOTAL"
FROM product p 
JOIN v2
ON v2.prodcode = p.prodcode
JOIN pricehist ph
ON ph.prodcode = v2.prodcode
WHERE ph.effdate IN v2."effdate" AND v2.salesdate >= ph.effdate
GROUP BY v2.transno;

SELECT * FROM view_total_sales
ORDER BY 1;

-- total unpaid
SELECT DISTINCT SUM ((t.total)-GET_TOTAL_PAYMENT(s.transno)) "Difference"
FROM sales s
JOIN view_total_sales t ON t.transno = s.transno;