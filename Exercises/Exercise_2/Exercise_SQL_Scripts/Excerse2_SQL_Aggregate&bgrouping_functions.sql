-- Databricks notebook source
select * from brightlearn.databases.excerise_2_data;

---1. Write a SQL query to find the total number of employees in the company

select count(id)as Total_Employees
from brightlearn.databases.excerise_2_data;

---2. Write a SQL query to find the total salary paid to all employees in the IT department.

select sum(salary) as Total_Salary_Paid
from brightlearn.databases.excerise_2_data
where department=('IT');

--- 3. Write a SQL query to calculate the average salary of employees in the HR department.

select avg(salary) as average_salary_of_employees
from brightlearn.databases.excerise_2_data
where department=('HR');

---4. Write a SQL query to find the highest and lowest salary in the company.

select max(salary) as Highest_salary, 
       min(salary) as lowest_salary
from brightlearn.databases.excerise_2_data;

---5. Write a SQL query to group employees by department and display the total salary paid in each department.

select sum(salary) as Total_salary_paid,
          department
from brightlearn.databases.excerise_2_data
group by department;

---6. Write a SQL query to count how many employees work in each city.

select city,
       count(id) as Total_Employees
from brightlearn.databases.excerise_2_data
group by city;

---7. Write a SQL query to group employees by department, calculate the average salary in each department, and order the results in descending order of average salary.

select department,
       avg(salary) as average_salary
from brightlearn.databases.excerise_2_data
group by department 
order by average_salary desc;

---8. Write a SQL query to find departments where the total salary paid exceeds 100,000.(Use GROUP BY and HAVING)

select department,
      sum(salary) as Total_salary_paid
from brightlearn.databases.excerise_2_data
group by department
having Total_salary_paid>100000;


---9. Write a SQL query to list cities where more than one employee works, ordered by the number of employees in descending order.

select city,
       count(id) as Number_of_employees
from brightlearn.databases.excerise_2_data
group by city
having Number_of_employees>1
order by Number_of_employees desc;

---10. Write a SQL query to find the department with the highest average salary.

select department,
       avg(salary) as average_salary
from brightlearn.databases.excerise_2_data
group by department
order by average_salary desc limit 1;


