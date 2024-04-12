create database CTEandDERIVEDtable
use CTEandDERIVEDtable

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')


Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3) 


select * from tblemployee
select * from tblDepartment

-- so here i want department name who has equal to or more than 2 employees

-- 1. by joins

--select tblEmployee.Name,tblDepartment.DeptName
--from tblEmployee join tblDepartment
--on tblEmployee.DepartmentId=tblDepartment.DeptId

-- so i want count which is gerater than and equal to two
select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
--where COUNT(tblEmployee.Id)>=2 -- here we cant use agrrigate function with where clause
group by tblDepartment.DeptName
having  COUNT(tblEmployee.Id)>=2 

-- so now i want that query make reuseable means muze bad me 10 ya 100 se jyada bhi count nikalana  hoga tabhi bhi me 

--  select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
--from tblEmployee join tblDepartment
--on tblEmployee.DepartmentId=tblDepartment.DeptId
--group by tblDepartment.DeptName

-- 2. by using view -- when we want save data as permanant
create view vw_departmentwiseEmployee
as
select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName


select * from  vw_departmentwiseEmployee where employeecount >=2

-- 3. using temporary table:
select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount into #departments
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName

select * from #departments where employeecount>=2

--4. by using table variable:
declare @departments table (name varchar(50),Employeecount int )
insert into @departments
select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName
select * from #departments where employeecount>=2


-- if we want permenent then go with view
-- if we want only for one session then go with temp
-- if we want single batch only then go with table variable 

 -- so here i want in same Query so we use 
 -- 5. derived table

 select * from
 (select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName) DT
where employeecount>=2

-- here (select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
--from tblEmployee join tblDepartment
--on tblEmployee.DepartmentId=tblDepartment.DeptId
--group by tblDepartment.DeptName)  == is a table

-- DT is a derived table	
-- it like a subQuery but us SubQuery ko nam diya to vo derived table ban jayega.
-- derived table same Query ke liye hi bana sakate he.
-- we can give the name for select Query also which we can call as derived table.

-- 6 CTE(common table Expression)

with DEpartmentwiseEmployeecount-- here we can give any name
as
(select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName
)
--declare @name varchar (50)='ganesh'
--print @name
-- hare scope of cte is next imidiate statement , so we can't do that.
select * from DEpartmentwiseEmployeecount where employeecount>=2
-- all cte statement hume yeksath hi call karana padega.
--so hume yek hi purpose ke liye chahiye to hum cte use kar sakate he.

-- change column name:
with DEpartmentwiseEmployeecount(departmentName,TotalEmployee)
as
(select tblDepartment.DeptName,count(tblEmployee.Id)as employeecount
from tblEmployee join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId
group by tblDepartment.DeptName
)
select * from DEpartmentwiseEmployeecount where TotalEmployee>=2
create Table Employee
(
  EmployeeId int Primary key,
  Name varchar(20),
  ManagerId int
)
--drop  table Employee
Insert into Employee values (1, 'Tushar', 2)
Insert into Employee values (2, 'Ganesh', null)
Insert into Employee values (3, 'Akshay', 2)
Insert into Employee values (4, 'Abhishek', 3)
Insert into Employee values (5, 'Pratik', 1)
Insert into Employee values (6, 'Ajay', 3)
Insert into Employee values (7, 'Dhiraj', 1)
Insert into Employee values (8, 'Vasudha', 5)
Insert into Employee values (9, 'Kishore', 1)

select * from employee
--we get self join with alias
 select e.name,m.name
 from Employee e left join employee m
 on e.ManagerId =m.EmployeeId

 with cte
 as
 (select name,managerid,1 as level from Employee where ManagerId is null
  
  select employee.id,employee.name,employee.managerid,(cte.level+1)as level
  from employee join cte on employee.manager.id	=cte.id
 ) 


 select * from cte

 create table sampletable(id int ,name varchar(100))

 declare @start int=1
 while (@start<=1000)
 begin
 insert into sampletable values(@start ,'person'+ cast(@start as varchar(5)))
 set @start=@start+1
 end

 select * from sampletable



