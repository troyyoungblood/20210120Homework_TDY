-- DATA ANALYSIS

-- 1. List the following details of each employee: employee number, 
--    last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, salary.salary
FROM employee AS e
RIGHT OUTER JOIN salary
ON e.emp_no = salary.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employee AS e
WHERE hire_date BETWEEN '1-1-1986' AND '12-31-1986';
-- ORDER BY hire_date; -- check to make sure query was correct
-- ORDER BY hire_date DESC; -- check to make sure query was correct

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, 
--    last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
 RIGHT OUTER JOIN department AS d
 ON dm.dept_no = d.dept_no
  LEFT OUTER JOIN employee AS e
  ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
 RIGHT OUTER JOIN employee AS e
 ON de.emp_no = e.emp_no
  LEFT OUTER JOIN department AS d
  ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name 
--    is "Hercules" and last names begin with "B."
--    Using ILIKE because it is case independent

SELECT e.first_name, e.last_name, e.sex
FROM employee AS e
WHERE first_name ILIKE 'Hercules' AND last_name ILIKE 'B%';

-- 6. List all employees in the Sales department, 
--    including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
 LEFT OUTER JOIN employee AS e
 ON de.emp_no = e.emp_no
  RIGHT OUTER JOIN department AS d
  ON de.dept_no = d.dept_no
  WHERE dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
 LEFT OUTER JOIN employee AS e
 ON de.emp_no = e.emp_no
  RIGHT OUTER JOIN department AS d
  ON de.dept_no = d.dept_no
  WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "count"
FROM employee
GROUP BY last_name
ORDER BY "count" DESC;

-- Epilogue
-- Search ID number 499942

SELECT e.first_name, e.last_name, e.hire_date
FROM employee AS e
WHERE emp_no = 499942;
