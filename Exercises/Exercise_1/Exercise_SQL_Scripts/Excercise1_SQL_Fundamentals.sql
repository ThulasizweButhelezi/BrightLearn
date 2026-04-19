-- Databricks notebook source
 ----1. Write a SQL query to retrieve all columns from the employees table.

select * from `brightlearn`.`databases`.`excerise_1_data` limit 100;

----2. Write a SQL query to find all the unique departments in the employees table

select distinct department
from `brightlearn`.`databases`.`excerise_1_data`;

----3. Write a SQL query to retrieve all employees' first and last names, ordered by salary in descending order

select first_name,
      last_name,
      salary
from `brightlearn`.`databases`.`excerise_1_data`
order by salary desc;

---4. Write a SQL query to retrieve the top 5 highest-paid employees.

select first_name,
      last_name,
      salary
from `brightlearn`.`databases`.`excerise_1_data`
order by salary desc limit 5;

---5. Write a SQL query to find employees who work in the IT department.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where department='IT';

---6. Write a SQL query to find employees who work in the Finance department AND have a salary greater than 58,000.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where department='Finance'
and salary > 58000;

---7. Write a SQL query to find employees who work in the HR department OR the Marketing department.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where department ='HR' 
or department='Marketing';

---8. Write a SQL query to find employees who do not work in the IT department.

select*
from `brightlearn`.`databases`.`excerise_1_data`
where not department ='HR';

---9. Write a SQL query to find employees who are in the HR, IT, or Finance departments.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where department in ('HR','IT','Finance');

---10. Write a SQL query to find employees who are in the IT department, have a salary greater than 50,000, and are located in New York.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where department = 'IT'
and salary > 50000
and city='New York';

---11. Write a SQL query to retrieve the first and last names of employees who work in the Finance or Marketing department, earn more than 52,000, and order the results by salary in descending order.

select first_name,
      last_name,
      department,
      salary
from `brightlearn`.`databases`.`excerise_1_data`
where department in ('Finance','Marketing')
and salary>52000
order by salary desc;

---12. Write a SQL query to find all the unique cities where employees work, excluding those in the IT and HR departments.

select distinct city
from `brightlearn`.`databases`.`excerise_1_data`
where not department in ('IT','HR');

---13. Write a SQL query to retrieve employees who are NOT in the Finance department,have a salary greater than 50,000, and order the results by hire date in ascending order.

select *
from `brightlearn`.`databases`.`excerise_1_data`
where not department in ('Finance')
and salary > 50000
order by hire_date asc;

---14. Write a SQL query to find the first 3 employees who work in either Chicago or Los Angeles and belong to the IT or Marketing department.

select * 
from `brightlearn`.`databases`.`excerise_1_data`
where city in ('Chicago','Los Angeles')
and department in ('IT','Marketing')
limit 3;


