-- List all employees: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries as sal
	ON emp.emp_no= sal.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, dp.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm
INNER JOIN departments AS dp
	ON dm.dept_no = dp.dept_no
INNER JOIN employees AS emp
	ON dm.emp_no = emp.emp_no;

-- List the department of each employee: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
	ON emp.emp_no = de.emp_no
INNER JOIN departments AS dp
	ON de.dept_no = dp.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
	ON emp.emp_no = de.emp_no
INNER JOIN departments AS dp
	ON de.dept_no = dp.dept_no
WHERE dp.dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
	ON emp.emp_no = de.emp_no
INNER JOIN departments AS dp
	ON de.dept_no = dp.dept_no
WHERE dp.dept_name LIKE 'Sales'
	OR dp.dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Total Employees"
FROM employees
GROUP BY last_name
ORDER BY "Total Employees" DESC;

