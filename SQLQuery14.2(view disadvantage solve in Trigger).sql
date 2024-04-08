create database viewProblem
use  viewProblem

create table Employee(
id int primary key identity,
name varchar(40),
departmentId int foreign key references department(departmentId)
)
create table department(
departmentId int primary key,
name varchar(30)

)
insert into department valueS(1,'IT'),(2,'HR'),(3,'TL'),(4,'MANAGER')
INsert into Employee values('ganesh',1),('suraj',1),('rahul',3),('nilesh',4)

select * from employee
select * from department



select id, em.name,dp.name
from employee em join department dp
on em.departmentId=dp.departmentId

create  view vw_Em
as
(select id, em.name as employeeName,dp.name as departmentName
from employee em join department dp
on em.departmentId=dp.departmentId)

select * from  vw_Em

-- so here i want to update that view 
update [dbo].[vw_Em]
set departmentName='hr'
where id=1

select * from [dbo].[vw_Em]

-- so here when we upadate id 1 but it replace that all name like for id 1 there department is IT so it can change all IT name

-- so to overcome that problem we can use trigger

create trigger Tr_View_Update
on [dbo].[vw_Em]
 instead of update  -- query not get proper work so we not run quey we run only logic
as 
begin
declare @Employeeid int,@depaertmentName varchar(50),@DepartId int 
select @Employeeid= id,@depaertmentName=employeeName from inserted
	select @DepartId =  departmentId from department where name=@depaertmentName
update Employee
set departmentId=@DepartId 
where id=@Employeeid
end
drop trigger Tr_View_Update

update [dbo].[vw_Em]
set departmentName='SR'
where id=2

select * from [dbo].[vw_Em]
-- me jo bhi update kar raha hu vo rows gayab ho rahe he













