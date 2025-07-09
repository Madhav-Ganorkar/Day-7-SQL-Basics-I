-- Create Database 
Create Database Day_7;
use Day_7;

-- Create departments table
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100),
  salary INT,
  dept_id INT,
  department VARCHAR(50),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
-- Insert into departments
INSERT INTO departments VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert into employees
INSERT INTO employees VALUES
(101, 'Alice', 'alice@ex.com', 80000, 2, 'IT'),
(102, 'Bob', 'bob@ex.com', 55000, 1, 'HR'),
(103, 'Charlie', 'charlie@ex.com', 95000, 2, 'IT'),
(104, 'David', 'david@ex.com', 45000, NULL, NULL),
(105, 'Eve', 'eve@ex.com', 72000, 3, 'Finance'),
(106, 'Frank', 'frank@ex.com', 90000, 3, 'Finance'),
(107, 'Grace', 'grace@ex.com', 50000, 4, 'Marketing');


# Implementation (5)

# 1. Write queries demonstrating all four join types.
-- INNER JOIN
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- RIGHT JOIN 
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- FULL OUTER JOIN (may not work in MySQL)
SELECT e.name, d.dept_name
FROM employees e
Full OUTER JOIN departments d ON e.dept_id = d.dept_id;




# 2. Use a CTE to break down a complex query.
WITH AvgSalaryPerDept AS (
  SELECT dept_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY dept_id
)
SELECT d.dept_name, a.avg_salary
FROM AvgSalaryPerDept a
JOIN departments d ON a.dept_id = d.dept_id
WHERE a.avg_salary > 60000;



# 3. Apply window functions to rank and partition data.
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;



# 4. Create an index and measure query speed improvement.
-- Before running the SELECT, check speed
EXPLAIN ANALYZE
SELECT * FROM employees WHERE email = 'alice@ex.com';

-- Create an index
CREATE INDEX idx_email ON employees(email);

-- After index, re-run and observe faster query
EXPLAIN ANALYZE
SELECT * FROM employees WHERE email = 'alice@ex.com';



# 5. Paginate results using `LIMIT`/`OFFSET` or appropriate syntax.
-- Page 1
SELECT * FROM employees ORDER BY emp_id LIMIT 3 OFFSET 0;

-- Page 2
SELECT * FROM employees ORDER BY emp_id LIMIT 3 OFFSET 3;

-- Page 3
SELECT * FROM employees ORDER BY emp_id LIMIT 3 OFFSET 6;

