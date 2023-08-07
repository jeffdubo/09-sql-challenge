-- SQL Challenge: Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- Results: 300024 records

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
s.emp_no=e.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- Results: 36150 records

SELECT 	first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- Results: 24 records

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
LEFT JOIN departments AS d
ON dm.dept_no=d.dept_no
LEFT JOIN employees AS e
ON dm.emp_no=e.emp_no;


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- Results: 331603 records
-- Note: Many staff are in multiple departments

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employee AS de
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no
LEFT JOIN employees AS e
ON de.emp_no=e.emp_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- Results: 20 records

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
-- Results: 52245 records

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales';


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Results: 137952 records

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name='Development';


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
-- Results: 1638 records

SELECT last_name, COUNT(emp_no) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;