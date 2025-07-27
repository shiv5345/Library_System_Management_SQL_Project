-- #Library Management System Project 


-- Creating Branch Table

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
	(
		branch_id VARCHAR(20) PRIMARY KEY,
		manager_id VARCHAR(20),
		branch_address VARCHAR(20),
		contact_no VARCHAR(20)
	);
-- Creating Employee Table

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
	(
		emp_id VARCHAR(15) PRIMARY KEY,
		emp_name VARCHAR(30),
		position VARCHAR(20),
		salary INT,
		branch_id VARCHAR(15) --FK--
	);

-- Creating books Table

DROP TABLE IF EXISTS books;
CREATE TABLE books
	(
		isbn VARCHAR(20) PRIMARY KEY,
		book_title VARCHAR(100),
		category VARCHAR(20),
		rental_price FLOAT,
		status VARCHAR(10),
		author VARCHAR(50),
		publisher VARCHAR(50)
	);


-- Creating members Table

DROP TABLE IF EXISTS members;
CREATE TABLE members
	(
		member_id VARCHAR(20) PRIMARY KEY,
		member_name VARCHAR(20),
		member_address VARCHAR(20),
		reg_date DATE
	);

-- Creating issued_status Table

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
	(
		issued_id VARCHAR(10) PRIMARY KEY,
		issued_member_id VARCHAR(10),	 --FK--
		issued_book_name VARCHAR(100),
		issued_date DATE,
		issued_book_isbn VARCHAR(20),    --FK--
		issued_emp_id VARCHAR(10)    	 --FK--
	);


-- Creating return_status Table

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
	(
		return_id VARCHAR(20) PRIMARY KEY,
		issued_id VARCHAR(20),			--FK
		return_book_name VARCHAR(20),
		return_date DATE,
		return_book_isbn VARCHAR(20)
	);

-- FOREIGN KEY CONSTRANTS

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);


ALTER TABLE issued_status
ADD CONSTRAINT fk_book_isbn
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);


ALTER TABLE issued_status
ADD CONSTRAINT fk_emp_id
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);


ALTER TABLE employees
ADD CONSTRAINT fk_branch_id
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);


ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

select * from issued_status;


















