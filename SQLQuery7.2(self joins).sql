create database selfjoin
use selfjoin

create table employee(
id int ,
name varchar(40),
managerId int
)
insert into employee values(1,'vishal',3),(2,'ashish',null),(3,'vikul',2),(4,'ganesh',3),(5,'amit',5),(6,'jyoti',1)

select id,name,managerid from employee

select emp.name as employeename , mrg.name as managername
 from employee emp left join employee mrg
 on emp.managerId=mrg.id

 -- self join means it join itself.
 select mgr.name,count(emp.id) as totalemp
 from employee emp join employee mgr
 on emp.managerId=mgr.id
 group by mgr.name









