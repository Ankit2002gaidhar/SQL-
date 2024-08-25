use company;

Select * from employees;
select * from department;
select * from job_history;
select * from managers;

-- 1. Retrieve all employee details from the employees table.
Select 
* 
from employees;

-- 2. Find the names of all departments from the department table.
Select 
dept_name
from department;

-- 3.List the first and last names of employees who work in the 'Sales' department.
Select 
dept_name,
first_name,
last_name 
from employees e inner join department d on e.dept_id=d.dept_id 
where d.dept_name="Sales";

-- 4 .Display all job titles and the start date from the job_history table.
Select 
job_title,
start_date
from job_history;

-- 5.Find the details of employees who were hired after January 1, 2020.
Select 
*
from employees 
where hire_date>"2020-01-01";

-- 6. Retrieve the department names and their corresponding department IDs
Select 
dept_name,
dept_id
from  department;

-- 7 . Select all employees with a salary greater than 70,000
Select 
*
from employees
where salary>70000;
 
-- 8. List all job titles and their corresponding employee IDs from the job_history table.
Select 
job_title,
emp_id
from job_history;

-- 9. Display all employee details along with their department name.
Select 
e.*,
d.dept_name
from employees e 
inner join department d
on e.dept_id=d.dept_id
order by e.emp_id ;

-- 10. Find the names of employees who are managers from the managers table.
Select 
concat(e.first_name," ",e.last_name) as employee_name
from employees e inner join managers m on 
e.emp_id=m.emp_id;

-- 11. List all employees who have 'IT' in their job history.
Select 
 e.*,
 j.job_title
 from employees e 
 inner join job_history j on
 e.emp_id=j.emp_id
 where j.job_title like ("%IT%");

-- 12. Count the number of employees in each department.
Select 
d.dept_name,
count(e.emp_id)
from employees e 
inner join department d
on e.dept_id=d.dept_id
group by d.dept_name;
 
-- 13. Display the first name and last name of employees along with their manager's name.
Select 
e.first_name,
e.last_name,
m.manager_name
from employees e 
inner join managers m
on e.emp_id=m.emp_id;

-- 14. Find all employees whose last name starts with the leƩer 'J'.
select 
*
from employees where 
last_name like("J%");

-- 15. Select the department names for employees who were hired in 2023.
Select 
d.dept_name,
e.emp_id 
from department d inner join 
employees e on d.dept_id=e.dept_id
where Year(e.hire_date)="2023";

-- 16.  Retrieve the maximum salary from the employees table.
Select
max(salary) from employees;

-- 17. Find the employee with the minimum salary in the 'HR' department.
Select 
d.dept_name,
e.emp_id,
e.salary
from employees e inner join department d
on e.dept_id=d.dept_id
where d.dept_name="HR" and e.salary=(Select min(salary) from employees);

-- 18. Display the total number of employees.
Select count(emp_id) from employees;

-- 19. Show all unique job titles in the job_history table.
Select distinct(job_title) from job_history;

-- 20. List all departments that have more than 2 employees.
Select 
d.dept_name,
count(e.emp_id)
from department d 
inner join employees e 
on d.dept_id=e.dept_id
group by d.dept_name
having count(e.emp_id)>2;

-- 21. Find the average salary of employees in the 'Marketing' department.
Select 
Avg(salary) 
from employees e inner join department d 
on e.dept_id=d.dept_id
where d.dept_name="Marketing";

-- 22. Display employee names in alphabetical order by last name.
Select 
concat(first_name," " ,last_name) as employee_name
from employees 
order by last_name asc;

-- 23. Retrieve all departments with their corresponding number of employees.
Select 
dept_name,
count(emp_id) as NrofEmployees
from department d inner join employees e
on d.dept_id=e.dept_id
group by dept_name;
 
-- 24. Select all employees who do not have a manager.
Select 
*
from employees
 where emp_id not in(Select emp_id from managers);
 
-- 25. Show the job history of the employee with the highest salary
Select 
*
from job_history j 
inner join employees e 
on j.emp_id=e.emp_id
where e.salary=(Select max(salary) from employees);

-- 26. Find all employees who have a NULL end date in their job history.
Select 
*
from employees e 
inner join job_history j
on e.emp_id=j.emp_id
where j.end_date is NULL;  
-- When comparing with null use (is null ) dont write val=null its wrong.

-- 27. Find all job titles that have been held by more than one employee.
Select 
job_title
from job_history j
inner join employees e 
on j.emp_id=e.emp_id
group by job_title
having count(e.emp_id)>1;

-- 28 List all employees who have the same first and last name initials.
Select 
*
from employees
where left(first_name,1)=left(last_name,1);

-- 29. Retrieve the details of the highest-paid employee.
Select 
*
from employees 
where salary=(Select max(salary) from employees);

-- 30. Retrieve employee details who have 3rd lowest salary.
Select
*
from employees
order by salary asc 
limit 1 offset 2;

-- 31 Retrieve employee details who have 5th highest salary.
Select 
*
from employees
order by salary desc 
limit 1 offset 4;


-- 32. Find the employees who have never changed their job title.
select 
*
from employees e 
inner join job_history j
on e.emp_id=j.emp_id
group by e.emp_id
having count(distinct job_title)=1;

-- 33. Show the last hired employee's details.
Select 
*
from employees
order by hire_date desc limit 1;

-- 34. Count the number of employees with the last name 'Smith'.
Select 
count(emp_id)
from employees where last_name="Smith";

-- 36. Find all departments that do not have any employees.
Select 
d.dept_name
from department d 
left join employees e 
on d.dept_id=e.emp_id
where e.emp_id is null;

-- 37. List all employees who have a salary between 60,000 and 80,000.
Select 
*
from employees 
where salary between 60000 and 80000;

-- 38. Retrieve the names of employees who have worked in the 'IT' department but not in the
-- 'Sales' department.
Select 
e.first_name,
e.last_name
from employees e join 
department d on e.dept_id=d.dept_id
where dept_name ='IT' and e.emp_id not in (Select dept_name from department where dept_name="Sales");

-- 39. Show all employees who have been with the company for more than 1 years.
Select 
*
from employees e  join 
job_history j on e.emp_id=j.emp_id
where timestampdiff(year,cast(start_date as date),cast(end_date as date)) >1;

-- 40. Find the employee details for those whose salary is above the average salary.
Select * 
from employees 
where salary>(Select avg(salary) from employees);

-- 41. List all departments with their average salaries.
SELECT d.dept_name,
AVG(e.salary) AS avg_salary
FROM employees e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 42. Retrieve the name and job title of employees who have worked in the 'Markeing'
-- department  in 2021.
Select 
e.first_name,
e.last_name,
j.job_title
from job_history j 
join employees e 
on j.emp_id=e.emp_id
join department d on
d.dept_id=e.dept_id
where d.dept_name="Marketing" and Year(e.hire_date)=2021;

-- 43. Display all departments that have at least one employee earning more than 70,000.
Select 
distinct dept_name
from department d 
inner join employees e
on d.dept_id=e.dept_id
where  e.salary>70000;

-- 44. Find the total salary paid to employees in each department.
Select 
d.dept_name,
sum(e.salary) 
from employees e 
join department d
on e.dept_id=d.dept_id
group by d.dept_name; 

-- 45. List all jobs that were started and ended in the same year.
Select job_title
from job_history
where year(start_date)=year(end_date);

-- 46. Retrieve the employee details for those with no job history.
Select *
from employees e
join job_history j
on e.emp_id=j.emp_id
where j.emp_id is null;


-- 47. Display the employees and their departments, ordered by hire date.
Select 
e.emp_id,
e.first_name,
e.last_name,
d.dept_name,
e.hire_date
from employees e
join department d
on e.dept_id=d.dept_id
order by e.hire_date;

-- 48. Find the total number of employees hired each year.
Select 
year(hire_date) as hire_year,
count(*) as total_hired 
from employees 
group by year(hire_date);


-- 49. Select all employees who have a middle initial 'A' in their first or last name.
Select 
*
from employees 
where first_name like "%A%"
or last_name like "%A%";

-- 50. Show all job histories for employees who were hired before 2021.
Select 
*
from job_history
where year(start_date)<2021;