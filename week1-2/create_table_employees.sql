CREATE TABLE employee(empNo VARCHAR(5) PRIMARY KEY NOT NULL, 
						lastName VARCHAR(15), 
						firstName VARCHAR(15), 
						gender CHAR(1) CONSTRAINT gender_ck CHECK(gender in('M','F')));-- gender_ck is the name of the constraint

CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE employee');

CREATE SEQUENCE empNo_seq -- empNo_seq is the name
START WITH 1 
INCREMENT BY 2 
NO CYCLE 
CACHE 5;

-- LPAD adds those 00000's in front of the sequence number
INSERT INTO employee
VALUES(LPAD(NEXT VALUE FOR empNo_seq, 5, '0'), 'Smith', 'John', 'M');
									-- 5 is the size of empNo, '0' is the padding, smith john m are the data
							
SELECT * FROM employee;

INSERT INTO employee
VALUES(LPAD(NEXT VALUE FOR empNo_seq, 5, '0'), 'Smith', 'Jane', 'F');

INSERT INTO employee
VALUES('00002', 'Smith', 'Joseph', 'M')