DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS title;

-- DATA ENGINEERING

-- Use the information you have to create a table schema 
-- for each of the six CSV files. Remember to specify data types, 
-- primary keys, foreign keys, and other constraints.

--  * For the primary keys check to see if the column is unique, 
--    otherwise create a [composite key](https://en.wikipedia.org/wiki/Compound_key). 
--    Which takes two primary keys in order to uniquely identify a row.
--  * Be sure to create tables in the correct order to handle foreign keys.

-- Import each CSV file into the corresponding SQL table. 
-- **Note** be sure to import the data in the same order that 
--          the tables were created and account for the headers when 
--          importing to avoid errors.

-- Tables need to be created in this order 
-- because of Foreign Key dependicies
-- also - csv imported in this order

CREATE TABLE department (
	dept_no VARCHAR(15) Primary Key NOT NULL,
	dept_name VARCHAR(45) NOT NULL	
);

SELECT * FROM department;

CREATE TABLE title(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(45)
);

SELECT * FROM title;

CREATE TABLE employee (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,	
	birth_date DATE NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id ) REFERENCES title(title_id)
);

SELECT * FROM employee;

CREATE TABLE dept_manager (
	dept_no VARCHAR(15) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT * FROM dept_manager;

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(15) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE salary(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT * FROM salary;
