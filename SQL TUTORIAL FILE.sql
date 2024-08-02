-- 1] Retreive all data and columns from customers

SELECT * FROM customers;

-- 2]  Retreive all data and columns from orders

SELECT * FROM orders;

-- 3] Retreive only f_name and country of all customers 

Select first_name,country
from customers;

-- 4] List all countries of all customers without duplicates
Select distinct(country) from customers;

-- 5] Retreive all customers where result is sorted by score(smallest first) ascending
Select * from customers order by score asc;

-- 5] Retreive all customers where result is sorted by score(Highest first) descending 

Select * from customers order by score desc;

-- 6] Retreive all customers ,sorting the result by country (alphabetically ) and then by score (highest first)

Select * from customers order by country asc, score desc;

-- customers  is in 4 th column and score is in 5 th column (not recommended)
Select * from customers order by 4 asc, 5 desc;

-- 7] list only german customers 
Select * from customers where country='Germany';

-- 8] Find all customers whose score is higher than 500

Select * from customers where score>500;

-- 9] Find all customers whose score is less than 500

Select * from customers where score<500;

-- 10]  Find all customers whose score is less than or equal to 500

Select * from customers where score<=500;

-- 11]  Find all customers whose score is greater than or equal to 500

Select * from customers where score>=500;

-- 12] Find all non german customers .

Select * from customers where country <> 'Germany';

-- 13] Find all customers come from Germany and whose score is less than 400.

Select * from customers where country='Germany' and score<400;

-- 14] Find all customers come from Germany or whose score is less than 400.

Select * from customers where country='Germany' or score<400;

-- 15] Find all customers  whose score is not less than 400.

Select * from customers where not score<400;

-- 16] Find all customers whose score is in range between 100 and 500.

Select * from customers where score between 100 and 500;


Select * from customers where score >= 100 and score<=500;

-- 17] Find all customers whose id is equal to 1,2,5

Select * from customers where customer_id IN (1,2,5);

Select * from customers where customer_id=1 or customer_id=2 or customer_id=5;

-- LIKE OPERATOR 
-- % matches anything
-- Underscore _ matches exactly one character 

-- Find names begin with M -------> M%
-- Find names end with n -------> %n
-- Find names containing  M -------> %M%
-- Find names containing M at 3rd position -------> __M%

-- 18] Find all customers whose first name starts  with M .

Select * from customers where first_name like 'M%';

-- 19] Find all customers whose First name ends  with n .

Select * from customers where first_name like '%n';

-- 20] Find all customers whose first name contains r .

Select * from customers where first_name like '%r%';

-- 21] Find all customers whose first name contains r in 3rd position.

Select * from customers where first_name like '__r%';

-- 22] Aliases 

Select c.customer_id as cid from customers as c;

-- 23] List a=customer id , first name , order id , quantity . Exclude the customers who have not placed any orders .

Select 
c.customer_id,
first_name,
order_id,
quantity
from customers as c
inner join orders as o
on c.customer_id=o.customer_id;

-- 23] List customer id , first name , order id , quantity . Include the customers who have not placed any orders .


Select 
c.customer_id,
first_name,
order_id,
quantity
from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- 24] List customer id, first name, order id , quantity. Include all orders , regardless of wheather there is matching customer.


Select 
c.customer_id,
first_name,
order_id,
quantity
from customers as c
right join orders as o
on c.customer_id=o.customer_id;

-- 25] List customer id, first name, order id , quantity. Include everything, all customers and all orders.

Select 
c.customer_id,
first_name,
order_id,
quantity
from customers as c
left join orders as o
on c.customer_id=o.customer_id
union
Select 
c.customer_id,
first_name,
order_id,
quantity
from customers as c
right join orders as o
on c.customer_id=o.customer_id;

-- 26] List first_name, last_name and country of all persons from customers and employees

Select 
      first_name,
      last_name,
      country
from customers
Union
Select 
      first_name,
      last_name,
      emp_country
from employees;

-- 27] Find total no of customers 
Select count(customer_id)  as total_customers from customers;
-- nulls are ignored in count

-- 28] Find total quantity of all orders
Select sum(quantity) as sum_quantity from orders;

-- 29] Find average score of all customers
Select avg(score) as avg_score from customers;

-- 30] Find the highest score of customers
Select max(score) as max_score from customers;


-- 31] Find the lowest score of customers
Select min(score) as max_score from customers;

-- 32] Find the earliest date from orders.

Select min(order_date) as earliest_date from orders;


-- 33] Find the latest order  date from orders.

Select max(order_date) as latest_date from orders;

-- 34] List all customers name where name is combination of fist_name and last_name

Select concat(first_name,' ',last_name) as customer_name from customers;

-- 35] List first name of all customers in uppercase and lowercase.

Select  upper(first_name) as upper_fist_name,
lower(first_name) as lower_first_name
from customers;

-- 36] List all last name of all customers and remove all the white spaces in names

select trim(last_name) as clean_name,length(last_name),Length(trim(last_name)) from customers ;

-- 37] Subtract 3 characters from last name of all customers , starting from 2nd position
-- substring(column,start,length)

select last_name,substring(last_name,2,3) as subsString from customers;

-- 38] Find total no of customers for each country
select count(*) as total_customers,country from customers group by country;

-- 39] Find total customers for each country and sort the result by total(lowest first)

Select count(*) as total_customers, country from customers group by country order by count(*) asc;

-- 40] Find highest scores of customers  for each country

Select max(score) as highest_score,country from customers group by country;

-- 41] Find total no of customers for each country and only include countries that have more than 1 customers .

Select count(*) as total_customers,country from customers group by country having count(*) >1;
-- having clause only works with group by 

-- 42] Find all orders placed from customers whose score higher than 500 using customer id.

Select * from orders 
where customer_id in(
Select customer_id from customers where score>500);


Select * from orders as o
where exists (
Select 1 from customers as c where c.customer_id=o.customer_id and score>500);

-- 43] Insert new column anna nixon from uk

insert into customers value(Default, "Anna", "Nixon","UK",Null);

select * from customers;

-- 43] Insert new Customer max lang

Insert into customers (first_name,last_name) values('Max','Lang');

select * from customers;

-- 44] Change the country of customer id 7 to germany 

update customers set country="Germany" where customer_id=7;

Select * from customers;

-- 45] Change the score of the customer anna to 100 and change her country from uk to usa 

Update customers set country="USA", score =100 where customer_id=6;

-- 46] Delete both new customers anna and max 
Delete from customers where customer_id in(6,7);

select * from customers;

truncate customers;

-- 46] Cereate a new sql table called persons with 4 columns :id , person name , birth date and phone

Create table db_sql_tutorial.persons(
id INT PRIMARY KEY auto_increment,
person_name VARCHAR(10) not null ,
birth_date DATE,
phone VARCHAR(15)  not null unique
);

-- 47]Add new column to person

Alter table persons add email varchar(15) not null;

-- 48]Drop table
drop table persons;

