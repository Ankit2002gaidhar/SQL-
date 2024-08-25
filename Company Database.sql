Create database Company;


-- Department Table 
Create Table department(
dept_id INT PRIMARY KEY,
dept_name Varchar(100)
);

-- Employees Table
Create Table employees(
emp_id INT PRIMARY KEY,
first_name Varchar(50),
last_name Varchar(50),
hire_date Date,
salary DECIMAL(10,2),
dept_id INT,
Foreign Key (dept_id) References department(dept_id)
);

-- Job-History table
CREATE TABLE job_history (
    emp_id INT,
    job_title VARCHAR(100),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    PRIMARY KEY (emp_id)
);

-- Manager Table 
CREATE TABLE managers (
    manager_id INT PRIMARY KEY,
    emp_id INT,
    manager_name VARCHAR(100),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


-- Inserting data into department table 

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'Marketing'),
(4, 'IT');

-- Inserting data into employees table 

INSERT INTO employees (emp_id, first_name, last_name, hire_date, salary, dept_id) VALUES
(1, 'John', 'Doe', '2018-05-12', 60000, 1),
(2, 'Jane', 'Smith', '2019-07-23', 75000, 3),
(3, 'Emily', 'Johnson', '2020-01-15', 82000, 4),
(4, 'Michael', 'Brown', '2021-03-30', 58000, 2),
(5, 'Linda', 'Williams', '2022-06-10', 65000, 1),
(6, 'David', 'Jones', '2019-12-01', 72000, 4),
(7, 'Laura', 'Garcia', '2020-09-15', 68000, 2),
(8, 'Sarah', 'Martinez', '2021-05-25', 73000, 3),
(9, 'James', 'Taylor', '2022-02-01', 60000, 1),
(10, 'Robert', 'Hernandez', '2023-01-12', 75000, 4);


-- Inserting data into job_history table 

INSERT INTO job_history (emp_id, job_title, start_date, end_date) VALUES
(1, 'Sales Executive', '2018-05-12', '2021-03-30'),
(2, 'Marketing Coordinator', '2019-07-23', '2021-06-30'),
(3, 'IT Specialist', '2020-01-15', '2022-08-01'),
(4, 'HR Assistant', '2021-03-30', '2022-12-31'),
(5, 'Sales Executive', '2022-06-10', '2024-08-25'),
(6, 'IT Specialist', '2019-12-01', '2022-08-15'),
(7, 'HR Manager', '2020-09-15', '2022-11-30'),
(8, 'Marketing Coordinator', '2021-05-25', '2023-06-30'),
(9, 'Sales Executive', '2022-02-01', '2023-10-31'),
(10, 'IT Specialist', '2023-01-12', NULL);

-- inserting data into managers table 

INSERT INTO managers (manager_id, emp_id, manager_name) VALUES
(1, 1, 'Alice Johnson'),
(2, 2, 'Bob Lee'),
(3, 3, 'Charlie Brown'),
(4, 4, 'Diana Green'),
(5, 5, 'Evan White'),
(6, 6, 'Fiona Harris'),
(7, 7, 'George Lewis'),
(8, 8, 'Hannah Scott'),
(9, 9, 'Ian Turner'),
(10, 10, 'Jack Adams');



