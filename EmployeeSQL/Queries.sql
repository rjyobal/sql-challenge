--------------------
-- Data Analysis ---
--------------------
-- List the following details of each employee: employee number, last name, first name, gender, and salary. --
SELECT a.emp_no AS "Employee No", 
	a.last_name AS "Last Name", 
	a.first_name AS "First Name", 
	a.gender AS "Gender", 
	b.salary AS "Salary"
FROM employees a
LEFT JOIN salaries b
ON a.emp_no = b.emp_no;

-- List employees who were hired in 1986. --
SELECT a.emp_no AS "Employee No",
	a.last_name AS "Last Name", 
	a.first_name AS "First Name", 
	a.gender AS "Gender", 
	EXTRACT(YEAR FROM a.hire_date) AS "hire_date"
FROM employees a 
WHERE EXTRACT(YEAR FROM a.hire_date) = '1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates. --
SELECT a.dept_no AS "Department No", 
	b.dept_name AS "Department Name", 
	a.emp_no AS "Manager Emp No", 
	c.last_name AS "Manager Last Name", 
	c.first_name AS "Manager First Name", 
	a.from_date AS "Start Employment Date", 
	a.to_date AS "End Employment Date"
FROM dept_manager a
LEFT JOIN departments b
ON a.dept_no=b.dept_no
LEFT JOIN employees c
ON a.emp_no=c.emp_no
WHERE a.to_date >= CURRENT_DATE;

-- List the department of each employee with the following information: employee number, last name, first name, and department name. --
SELECT a.emp_no AS "Employee No", 
	b.last_name AS "Last Name", 
	b.first_name AS "First Name", 
	c.dept_name AS "Department Name"
FROM dept_emp a
LEFT JOIN employees b
ON a.emp_no=b.emp_no
LEFT JOIN departments c
ON a.dept_no=c.dept_no
WHERE a.to_date >= CURRENT_DATE;

-- List all employees whose first name is "Hercules" and last names begin with "B." --
SELECT emp_no AS "Employee No", 
	first_name AS "First Name", 
	last_name AS "Last Name"
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name. --
SELECT a.emp_no AS "Employee No", 
	b.last_name AS "Last Name", 
	b.first_name AS "First Name", 
	c.dept_name AS "Department Name"
FROM dept_emp a
LEFT JOIN employees b
ON a.emp_no=b.emp_no
LEFT JOIN departments c
ON a.dept_no=c.dept_no
WHERE c.dept_name = 'Sales'
AND a.to_date >= CURRENT_DATE;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. --
SELECT a.emp_no AS "Employee No", 
	b.last_name AS "Last Name", 
	b.first_name AS "First Name", 
	c.dept_name AS "Department Name"
FROM dept_emp a
LEFT JOIN employees b
ON a.emp_no=b.emp_no
LEFT JOIN departments c
ON a.dept_no=c.dept_no
WHERE (c.dept_name = 'Sales' OR c.dept_name = 'Development')
AND a.to_date >= CURRENT_DATE;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. --
SELECT last_name AS "Employee Last Name", count(last_name)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;


