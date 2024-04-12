
create database [Ranking function]
use [ranking function]

-- i want to numbring rows means serial number dena he to uske liye hum ranking function ka use karenge.
 --1.row_number
 --2.rank()
 --3.dense_rank()
 --4.ntile()

 create table student(
 name varchar(39),
 gender varchar(20),
 age int,
 salary int
 )
 insert into student values('suraj','male',27,2000),('ganesh','male',25,2200),
 ('raj','male',24,5200),('rahul','male',25,200),('kishore','male',28,1800)
 insert into student values('rekha','female',30,3900),('suman','female',39,2000)
 select * from student
 --1.. row_number()
  select name,gender,ROW_NUMBER()over (order by gender) as sr_number,age,salary from student

  -- so here it give continiously numbering male and female so i want get group like male nd female so
  -- for that we use partition
  
  select name,gender, ROW_NUMBER() over (partition by gender order by gender)as numbers,age,salary from student

  -- so if i want to delete duplicate data from table 
  insert into student values('sushant','male',28,2345)
  insert into student values('uma','female',23,3000)

  select * from student
  -- so here i want to delete duplicate values:

  select name,gender,age,salary,ROW_NUMBER () over (  partition by name order by name) as rollnumber from student
  
  -- but when we add uma as male 
  insert into student values('uma','male',23,3000)
  -- so they count like same name so for that we use 
  select name,gender,age,salary,ROW_NUMBER () over (  partition by name, gender order by name) as rollnumber from student

  -- so i want get which records are duplicate and they will be deleted.
  -- for that we use cte
   
   with cte 
   as (  select name,gender,age,salary,ROW_NUMBER () over (  partition by name, gender order by name) 
   as rollnumber from student
) 
--select * from cte where rollnumber>1
delete from cte where rollnumber>1

select * from student

--**** find highest salary ****

select name,salary from student
select name,salary,rank()over(order by salary desc) as srno from student
-- ye hume highest salary vala 1 rank pe dega or bad sare dega.
-- isme ye default ranking skip karata he
 -- so isme 4 rank pe koi nahi he to muze 4 th rank vala chahiye to 
 -- so isme default rank hume skip nahi karana to hume dense_rank() use karana hoga.

 select name,salary,
 rank()over(order by salary desc) as srno1,
 DENSE_RANK()over(order by salary desc) as srno2
 from student

 -- so ye hume default rank skip karake nahi de raha he.
 with cte 
 as (
 select name,salary,
 rank()over(order by salary desc) as srno1,
 DENSE_RANK()over(order by salary desc) as srno2
 from student
 )
 --select * from cte where srno2=2
 select name ,salary from cte where srno2=3

 -- muze do group banane ho to me 
 select *,NTILE(2) over (order by gender) from student