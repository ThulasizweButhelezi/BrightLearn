-- Databricks notebook source
select* from brightlearn.databases.excerise_4_employees;
select* from brightlearn.databases.excerise_4_projects;

---1. Retrieve all employees and their assigned projects using an INNER JOIN. o Return: EmployeeID, FirstName, LastName, Department, Salary, ProjectID, ProjectName, Budget, Status.
select A.EmployeeID,
       A.LastName,
       A.Department,
       A.Salary,
       B.ProjectID,
       B.ProjectName,
       B.Budget,
       B.Status
from brightlearn.databases.excerise_4_employees as A
inner join brightlearn.databases.excerise_4_projects as B
on A.EmployeeID=B.EmployeeID; 

---2. Retrieve all employees and their assigned projects, including employees who have no projects using a LEFT JOIN.o Return: EmployeeID, FirstName, LastName, Department Salary, ProjectID, ProjectName, Budget, Status.

select A.EmployeeID,
       A.FirstName,
       A.LastName,
       A.Department,
       A.Salary,
       B.ProjectID,
       B.ProjectName,
       B.Budget,
       B.Status
from brightlearn.databases.excerise_4_employees as A
left join brightlearn.databases.excerise_4_projects as B
on A.EmployeeID=B.EmployeeID; 

---3. Retrieve all projects and their assigned employees, including projects that haveno employees using a RIGHT JOIN.o Return: ProjectID, ProjectName, Budget, Status, EmployeeID, FirstName,LastName, Department, Salary.

select A.ProjectID,
       A.Budget,
       A.Status,
       B.FirstName,
       B.lastName,
       B.Department,
       B.Salary
from brightlearn.databases.excerise_4_employees as B
right join brightlearn.databases.excerise_4_projects as A
on A.EmployeeID=B.EmployeeID; 

---4. Retrieve all employees and projects, including those without a match in either table using a FULL OUTER JOIN. o Return: EmployeeID, FirstName, LastName, Department, Salary, ProjectID, ProjectName, Budget, Status.

select A.EmployeeID,
       A.FirstName,
       A.LastName,
       A.Department,
       A.Salary,
       B.ProjectID,
       B.ProjectName,
       B.Budget,
       B.Status  
from brightlearn.databases.excerise_4_employees as A
full outer join brightlearn.databases.excerise_4_projects as B
on A.EmployeeID=B.EmployeeID; 

---5. Retrieve a list of all unique cities where employees are located and project statuses.o Return: Location (Rename the column to Location using an alias).

select distinct(City) as Location
from brightlearn.databases.excerise_4_employees
union
select Status
from brightlearn.databases.excerise_4_projects;
--6. Retrieve a list of all cities where employees are located and project statuses,allowing duplicates. o Return: Location (Rename the column to Location using an alias).

select City as Location
from brightlearn.databases.excerise_4_employees
union all
select Status
from brightlearn.databases.excerise_4_projects;

---7. Retrieve employees who earn more than 70,000. o Return: EmployeeID, FirstName, LastName, Department, Salary

select EmployeeID,
       FirstName,
       LastName,
       Department,
       Salary
from brightlearn.databases.excerise_4_employees
where Salary> 70000;

--8. Retrieve employees working in either IT or Finance departments. o Return: EmployeeID, FirstName, LastName, Department, Salary.

select EmployeeID,
       FirstName,
       LastName,
       Department,
       Salary
from brightlearn.databases.excerise_4_employees
where Department in ('IT', 'Finance');

---9. Retrieve projects that are not yet completed. o Return: ProjectID, ProjectName, Budget, Status.

select ProjectID,
       ProjectName,
       Budget,
       Status
from brightlearn.databases.excerise_4_projects
where Status not in ('Completed');

--10. Retrieve projects that have a budget greater than 70,000 and are notcompleted.• Return: ProjectID, ProjectName, Budget, Status.

select ProjectID,
       ProjectName,
       Budget,
       Status
from brightlearn.databases.excerise_4_projects
where Budget > 70000 and Status not in ('Completed');

--11. Retrieve employees from New York OR Toronto, ordered by salary in descending order.• Return: EmployeeID, FirstName, LastName, Department, Salary, City

select EmployeeID,
       FirstName,
       LastName,
       Department,
       Salary,
       City
from brightlearn.databases.excerise_4_employees
where City in ('New York', 'Toronto')
order by salary desc;

--12. Retrieve the top 3 highest-paid employees. • Return: EmployeeID, FirstName, LastName, Department, Salary.

select EmployeeID,
       FirstName,
       LastName,
       Department,
       Salary
from brightlearn.databases.excerise_4_employees
order by salary desc
limit 3;

---13. Find the total salary per department, sorted in descending order. • Return: Department, TotalSalary (Rename SUM(Salary) as TotalSalary).

select Department,
        sum(Salary) as Total_Salary
from brightlearn.databases.excerise_4_employees
group by Department
order by Total_Salary desc;

--14. Find the average salary per city, but only include cities where the average salaryis greater than 65,000.• Return: City, AverageSalary (Rename AVG(Salary) as AverageSalary).

select City,
       avg(Salary) as Average_Salary
from brightlearn.databases.excerise_4_employees
where Salary>65000
group by City;

select City,
       avg(Salary) as Average_Salary
from brightlearn.databases.excerise_4_employees
group by City
having  Average_Salary>65000;

--15.Count the number of employees per department, including only departments with more than 1 employee. • Return: Department, EmployeeCount (Rename COUNT(EmployeeID) as EmployeeCount).

select Department,
       count(EmployeeID) as EmployeeCount
from brightlearn.databases.excerise_4_employees
group by Department
having count(EmployeeID)>1;

--16. Retrieve the number of projects per status, but only include statuses with at least 2 projects.• Return: Status, ProjectCount (Rename COUNT(ProjectID) as ProjectCount).

select Status,
       count(ProjectID) as ProjectCount
from brightlearn.databases.excerise_4_projects
group by Status
having count(ProjectID)>=2;

--17. Retrieve the total project budget per employee, but only for employees who are managing projects worth more than 150,000.• Return: EmployeeID, FirstName, LastName,TotalProjectBudget (RenameSUM(Budget) as TotalProjectBudget).

select A.EmployeeID,
       B.FirstName,
       B.LastName,
       sum(A.Budget) as TotalBudget
from brightlearn.databases.excerise_4_projects as A
left join brightlearn.databases.excerise_4_employees as B
on A.EmployeeID=B.EmployeeID
group by A.EmployeeID,B.FirstName,B.LastName
having sum(A.Budget)> 150000;

