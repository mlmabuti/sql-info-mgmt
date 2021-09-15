SELECT * FROM pet;

CREATE TABLE job (jobCode VARCHAR(4) NOT NULL PRIMARY KEY, 
					jobDesc VARCHAR(20));

CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE employee');

SELECT * FROM employee;

-- ADD name data_type
-- DROP name data to remove

ALTER TABLE employee
ADD birthDate DATE;

ALTER TABLE employee
ADD hireDate DATE
ADD sepDate DATE;

-- UPDATE TABLE after altering
CALL SYSPROC.ADMIN_CMD('REORG TABLE employee');
