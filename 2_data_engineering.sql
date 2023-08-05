-- SQL Challenge: Data Engineering

-- This SQL file includes:
-- 1. PostgreSQL schema and code to create database tables
-- 2. PostgreSQL code to review and verify imported data

-- 1. Create database tables

CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30)
);


CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);


-- Assumption: employees can work in multiple departments (many do in the dataset), therefore
-- emp_no can not be a primary key. With only 2 fields it did not make sense to
-- create a composite key using both fields.

CREATE TABLE dept_employee (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Assumption: no employee can manage more than 1 department, therefore emp_no is a primary key

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Assumption: no employee can receive multiple salaries (even if they work in mulitple departments),
-- therefore emp_no is a primary key

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT
);


-- 2. Review and verify imported data

SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM dept_employee
SELECT * FROM dept_manager
SELECT * FROM salaries

SELECT COUNT(*) FROM titles			-- 7 records
SELECT COUNT(*) FROM employees		-- 30024 records
SELECT COUNT(*) FROM departments	-- 9 records
SELECT COUNT(*) FROM dept_employee	-- 331603 records
SELECT COUNT(*) FROM dept_manager	-- 24 records
SELECT COUNT(*) FROM salaries		-- 30024 records