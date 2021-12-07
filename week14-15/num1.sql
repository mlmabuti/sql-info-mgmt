DROP PROCEDURE SHOWSTATE;

--#SET TERMINATOR @ 
CREATE PROCEDURE SHOWSTATE(stateCode VARCHAR(2))
DYNAMIC RESULT SETS 1 
BEGIN 
    SET stateCode = UPPER(stateCode);
    BEGIN 
        DECLARE cur1 CURSOR WITH RETURN FOR
            SELECT * FROM customer 
            WHERE address LIKE '%'||stateCode||'%';
        OPEN cur1;
    END; 
END@ 
--#SET TERMINATOR ;

CALL SHOWSTATE('ca');