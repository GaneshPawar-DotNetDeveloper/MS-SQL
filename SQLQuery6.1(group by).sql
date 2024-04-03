create database groupby
use groupby

create table student(
rollnumber int identity,
name varchar(40),
gender varchar(10),
city varchar(30),

)
insert into student values('ganesh','male','solapur'),
('dhiraj','male','pandharpur'),
('vasudha','female','nashik'),
('ajay','male','burhanpur'),
('farin','female','shrigonda'),
('chaitanya','male','yavatmal'),
('kishore','male','latur'),
('arati','female','nanded'),
('samrudhi','female','kokan')

select * from student
select gender ,count(rollnumber) as totalstudent
from student
--where gender='male'
--where gender in ('female')
group by gender
--where gender='male' -- here we cant use where after the group by so for correct syntax is use before
having gender in ('female');  -- here we always use having after the group by 

-- having clause:
 -- - gaving clause is used with group by command.
 -- we cannot use where claue with group by command.

 select gender ,count(rollnumber) as totalstudent
from student
group by gender
having count(rollnumber)<=4

select name,gender from student
--where gender='female'

group by gender
having 






