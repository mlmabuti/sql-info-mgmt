CREATE TABLE jobHistory(
	empNo VARCHAR(5) NOT NULL REFERENCES employee,
	jobCode VARCHAR(4) NOT NULL REFERENCES job,
	deptCode VARCHAR(4) NOT NULL REFERENCES department,
	salary DECIMAL(10,2) CONSTRAINT salary_ck CHECK (salary >= 0),
	effDate DATE NOT NULL,
	PRIMARY KEY (empNo, jobCode, effDate)
); 
-- composite keys are combined foreign keys

CALL SYSPROC.ADMIN_CMD('DESCRIBE TABLE jobHistory')

