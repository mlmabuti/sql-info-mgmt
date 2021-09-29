/**
DDL = data definition language (declaring stuff)
DML = data manipulation language (re-assigning stuff)
*/


-- select all columns from the tables
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM project;
SELECT * FROM empprojact;

-- describe table
CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE emp');

-- select specific columns from table with condition.
SELECT firstnme, midinit, lastname, job
FROM emp 
WHERE job IN('CLERK','OPERATOR','FIELDREP') AND edlevel > 10;

