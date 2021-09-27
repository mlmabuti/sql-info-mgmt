-- create columns CREATE TABLE table_name (column_name data_type, ...)
CREATE TABLE department(deptCode VARCHAR(3) NOT NULL PRIMARY KEY, deptName VARCHAR(20));

-- check table
CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE department');

INSERT INTO department(deptCode, deptName)
VALUES ('IT', 'Information Tech');

SELECT deptCode, deptName
FROM department;

INSERT INTO department(deptCode, deptName)
VALUES ('IT', 'Information Tech');