DROP PROCEDURE DISPLAYTRANS; 

--#SET TERMINATOR @ 
CREATE PROCEDURE DISPLAYTRANS (transactionNo VARCHAR(8))
DYNAMIC RESULT SETS 1 
BEGIN 
    BEGIN 
        DECLARE cur1 CURSOR WITH RETURN FOR 
            SELECT s.transno, s.salesdate, p.prodcode,
                    p.description, p.unit, sd.quantity 
            FROM sales s 
            JOIN salesdetail sd ON sd.transno = s.transno 
            JOIN produt p ON p.prodcode = sd.prodcode 
            WHERE transactionNo = sd.transno;
        OPEN cur1;
    END;
END@
--#SET TERMINATOR ;

CALL DISPLAYTRANS('TR000039');
