-- Drop table if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create a table of departments
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(255)
);

-- Create a table of titles
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(255)
);


-- Create a table of employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(5),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date VARCHAR(10),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date VARCHAR(10)
);


-- Create a junction table of employees & department
CREATE TABLE dept_emp (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- Create a junction table of employees & department (manager)
CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create a table of salaries
CREATE TABLE salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
);
