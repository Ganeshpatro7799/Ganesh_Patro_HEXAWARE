---2.Write a query to display the names of all states belonging to the country Canada. 
--Display the records sorted in ascending order based on state name.(Q 2).
select * from location
select * from Countries
select * from Region

select state from location where country_id =(select id from Countries where name='Canada');

------------------------------------------------------------------------
--3.Write a query to display the first name of the managers of Accounts department. 
--Display the records sorted in ascending order based on manager name.
select * from manager
select * from employee
select * from department

select first_name from employee where  id in (
select employee_id from manager
where department_id=(select id from department where name='Accounts'))
order by first_name asc;

----------------------------------------------------------------------------
--9.	Write a query to display the names of all countries belonging to region Europe.
--Display the records sorted in ascending order based on country name.
select  * from Countries
select * from location
select * from Region
select name from Countries where region_id=(select id from Region where name='Europe')
 
----------------------------------------------------------------------------------------
--15.	Write a query to display the first name of all employees who are managers.
--Display the records sorted in ascending order based on first name.
select * from manager
select * from employee
select * from department

select first_name from employee 
where id in (select employee_id from manager)
order by first_name asc;
--------------------------------------------------------------------------------
--14.	Write a query to display the first name of the managers of HR department. 
--Display the records sorted in ascending order based on manager name
 
 select first_name from employee where id in 
 (select employee_id from manager where department_id =(select id from department where name='HR'))
 -----------------------------------------------
 --how many employees in the IT DEPARTMENT
  select count(id)  from employee where department_id= (select id from department where name='IT')
  -----------------------------
  select department_id ,max(salary) as max_salary from employee group by 
  department_id
----------------------------------------------
    select Country_id, count(state) from location 
     group by Country_id;
-------------------------------------------------------
--7.	Write a query to display the department id and the number of managers in the department.
--Display the records sorted in ascending order based on department id.
---Give an alias to the number of managers as manager_count.
  select * from manager
select * from employee
select * from department
select * from manager

select department_id ,count(employee_id) as manager_count from manager 
group by department_id
order by department_id
-----------------------------------------------------------------------------------------
---git code 1,3,4,5,6,7,8,9,10,11,12,13,14,16
Select * from employee;

Select * from manager;

Select * from department;

Select * from location;

Select * from region;

Select * from Countries;

-- A subquery is a select query inside another query 

--Two types 
--Non -corelated 
--Corelated 

-- Select the employee details of HR department

Select first_name, email, salary from employee where department_id=2;-- Hard-coding the data The department id in the department table for HR is 2

--By chance if sometimes the department HR's id is updated as 9 the above query will not give right answer.
update department set id=9 where name='HR'

--Subquery 
Select first_name, email, salary from employee 
where department_id =(Select id from department where name='HR')


Select * from location;
-- Display the states of India

Select state from location where country_id=
(Select id from Countries where name='India') and city='BOmbay'


Select * from manager;


--Multiple subquery
Select first_name from employee where id IN (Select employee_id from manager

where department_id =(Select id from department where name='HR')
)
 ;



--Display the employee detail whose departments's location is in state Texas
--multi-level subquery

Select first_name from employee where department_id=(
Select id from department where location_id =(
Select id from location where state='New Jersey'))


--Emplaoyee Max Salary
Select first_name from employee where salary =(
Select Max(salary) from employee);


--Employee Min salary
Select first_name from employee where salary =(
Select Min(salary) from employee);

Select first_name,salary from employee where salary<(
Select Avg(salary) from employee);

Select first_name,salary from employee where salary>(
Select Avg(salary) from employee);


--2 nd highest salary
Select first_name,salary from employee where salary=(
Select max(salary) from employee where salary !=(
Select Max(salary) from employee));

-- 3rd highest salary
Select max(salary) from employee where salary <(
Select max(salary) from employee where salary !=(
Select max(salary) from employee ))


-- 4th highest salary
Select max(salary) from employee where salary<(
Select max(salary) from employee where salary <(
Select max(salary) from employee where salary !=(
Select max(salary) from employee )))


-- Another type of subquery 





-- Group by 

Select * from employee;


Select department_id, count(id) as EmployeesInEachDept
from employee group by department_id


Select country_id, Count(state) from location 
group by country_id;

Select department_id, max(salary) from employee group by 
department_id;

--Write a query to display the department id and
--the number of managers in the department. 
--Display the records sorted in ascending
--order based on department name.
--Give an alias to the number of managers as 



Select * from manager;

Select department_id, count(employee_id) from manager  group by department_id;

