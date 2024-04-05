create database indexes
use indexes
create table Employee(
id int primary key identity ,
nameOfEmployee varchar(40),
genderOfEmployee varchar(30),
ageOfEmployee varchar(40),
salaryOfEmployee varchar(40)

)
insert into employee values('ganesh','male',24,80000),('rahul','male',29,40000),('abhi','male',30,30000),('sana','female'
,29,45000),('jahida','female',27,60000)

select * from employee

select * from employee
where salaryOfEmployee >=10000 and salaryOfEmployee<=100000

-- in that selecter we select that employee which are salary was beetween 10 thusand to 1 lac so for that 
 --  we use that condition for find result but when there are huge of data then they consume time so for that we use indexer.
 
 --indexer sinario:
  -- mano ki aap ko book diya he or usme se app ko material nam ka topic nikal na he per us book ko index nahi he matalab 
  --us topic ka location ,page number nahi he so tab hub page by page dekhake jayenge that is table
   -- scan which is nat good for performance to that time we need indexer for 
   -- get query faster , reduce time.
   --delete  Employee

   create table Employee2(
id int  ,
nameOfEmployee varchar(40),
genderOfEmployee varchar(30),
ageOfEmployee varchar(40),
salaryOfEmployee varchar(40)

)
insert into employee2 values(5,'ganesh','male',24,80000),(8,'rahul','male',29,40000),(1,'abhi','male',30,30000),(7,'sana','female'
,29,45000),(7,'jahida','female',27,60000)

select * from Employee2

-- so here we don't use primary key for unique and sorting but we want sorting by id so for that we use unique culstured index

--1. unique clustured index
  create unique clustered index Ix_EmployeeId
  on Employee2(id)
  -- here statment will be terminated bcs. we get duplicate data so for sorting we use non-clustered index
-- 2. non-unique clusteredindex
create clustered index Ix_EmployeeId
  on Employee2(id)
  select * from Employee2
  -- here we get by sorting.
  -- clusterd index is sorting records in original table.
  -- we can make only one clustered insex on that table.

  drop index employee2.Ix_EmployeeId

  create clustered index Ix_employee2Salary
  on employee2(salaryOfEmployee)
   select * from Employee2
where salaryOfEmployee >=10000 and salaryOfEmployee<=100000
 
 select nameOfEmployee , salaryOfEmployee  from Employee2
where salaryOfEmployee >=10000 and salaryOfEmployee<=100000 
 
 drop index employee2.Ix_employee2Salary
--  select * from employee
--where salaryOfEmployee >=10000 and salaryOfEmployee<=100000
---- here make faster query we can use non unique clusterd index on salary

--create clustered index Ix_EmployeeSalary
--on employee(salaryOfEmployee)
---- Cannot create more than one clustered index on table 'employee'.
----Drop the existing clustered index primary  before creating another.


--// non clustered index
--3.non unique non clustered index

 create index IX_EmployeeID
 on employee2(id)
--select * from Employee2 where id=5
-- here we make non clustered non unique index.
-- so it created vertual separete memory which stored sorting data.

drop index employee2.IX_EmployeeID

-- here clusterd index is faster than non clusterd index.beacuase when we create non clustered index on salaray
  -- to us time o yek vertual sorting data memory creat karega par us table data me sirf id or salary rahegi 
  -- par jab hum use bolege ki muze name bhi chahiye tab vo original data se compare karega to isase time consume bad jayega.

  -- so isase bachane ke liye covering index use kr sakate he.
  -- covering index= creating index more than one column.

  create index IX_ToGetNameAndSalary
  on employee2(nameOfEmployee,salaryofemployee)
  --drop index employee2.IX_ToGetNameAndSalary

  select nameOfEmployee , salaryOfEmployee  from Employee2
where salaryOfEmployee >=10000 and salaryOfEmployee<=100000 or nameOfEmployee like 'gn%'

create index IX_ToGetName
  on employee2(nameOfEmployee)
select nameOfEmployee from Employee2

-- so we can create multiple non clustered index





