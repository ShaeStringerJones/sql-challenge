-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM "Employees" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date FROM "Employees"
WHERE DATE_PART('year', hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT * FROM "Department_Manager";
SELECT * FROM "Departments";
SELECT * FROM "Employees";

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Departments" d
JOIN "Department_Manager" dm
ON d.dept_no = dm.dep_no
JOIN "Employees" e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT * FROM "Department_Employees"
SELECT * FROM "Employees";
SELECT * FROM "Departments";

SELECT e.emp_no, e.last_name, e.first_name, de.dep_no, d.dept_name
FROM "Employees" e
Join "Department_Employees" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dep_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
Join "Department_Employees" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dep_no = d.dept_no
WHERE d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
Join "Department_Employees" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dep_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY count DESC