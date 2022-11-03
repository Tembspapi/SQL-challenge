-- This script perfoms the following tasks:

-- -- 1. Drop the table if it exists
-- -- 2. Create the table and its columns and primary key
-- -- 3. Create the foreign key (FK) if necessary
-- -- 4. Drop the column if FK is compose and the column it is not necessary


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

DROP TABLE IF EXISTS dept_emp,
					 dept_manager,
					 titles,
					 salaries,
					 employees,
					 departments;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table departments:

-- Create the table
CREATE TABLE departments(
	dept_no CHAR(5) NOT NULL,
	dept_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Table titles:

-- Create the table
CREATE TABLE titles(
	title_id VARCHAR(5)  NOT NULL,
	title VARCHAR(50) NOT NULL
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Table employees:

-- Create the table
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id CHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Table dept_emp:

-- Create the table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no CHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
	PRIMARY KEY(emp_no, dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table dept_manager:

-- Create the table
CREATE TABLE dept_manager (
	dept_no CHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
	PRIMARY KEY(emp_no, dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table salaries:

-- Create the table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
	PRIMARY KEY(emp_no)
);


