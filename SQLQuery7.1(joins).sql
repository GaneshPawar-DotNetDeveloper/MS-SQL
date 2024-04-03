 --create database joins
 --use joins

 --create table trainers(
 --trId int primary key,
 --trname varchar(50),
 --)
 --select trId,trname from trainers
 --insert into trainers values(1,'vikul')
 --insert into trainers values(2,'usha')
 --insert into trainers values(3,'atul')
 --insert into trainers values(4,'sachin')
 --insert into trainers values(5,'pratik')
 --insert into trainers values(6,'suraj')
 

 --select * from trainers
 --delete from trainers
-- select * from trainers
 --create table students(
 --rollnumber int primary key identity,
 --stuname varchar (50),
 --trainerID int foreign key references trainers(trId)
 
 --)
-- dbcc checkident('students',reseed,0)
-- insert into students values('mahesh',1)
-- insert into students values('suresh',2)
-- insert into students values('manish',3)
-- insert into students values('varsha',4)
-- insert into students values('mihaan',null )
-- insert into students values('ravikant',null)
-- insert into students values('rakesh',6)

-- delete from students
--select * from trainers
--select * from students
                

				-- this is syntax for inner join

--select students.stuname ,trainers.trname 
--from students inner join trainers
--on students.trainerId=trainers.trId

--select students.stuname as studentname,trainers.trname as trainername
--from students inner join trainers
--on students.trainerId=trainers.trId

--select s.stuname as studentname,t.trname as trainername
--from students s inner join trainers t
--on s.trainerId=t.trId

--select s.stuname as studentname,t.trname as trainername
--from students s  join trainers t
--on s.trainerId=t.trId

      -- left outer join
	--   from students inner join trainers
	  -- in that example join word left side is left outer side== student table is left
	  --                         right side is right outer side== trainer table is right 
      --           it consume both side common data that is full outer join
	  
	  --left outer join

--	  select s.stuname as studentname,t.trname as trainername
--from students s left outer join trainers t
--on s.trainerId=t.trId

--	  select s.stuname as studentname,t.trname as trainername
--from students s left  join trainers t
--on s.trainerId=t.trId

-- right outer join
-- select s.stuname as studentname,t.trname as trainername
--from students s right  join trainers t
--on s.trainerId=t.trId
 
 -- full outer join
--  select s.stuname as studentname,t.trname as trainername
--from students s full join trainers t
--on s.trainerId=t.trId 

-- cross join
-- select s.stuname as studentname,t.trname as trainername
--from students s cross  join trainers t
----on s.trainerId=t.trId

 --  real time example of cross join
    -- there are two different tables like student and subject. now students have each subject so here we can use cross join.


	-- here generally we use foreign key table as a left table

	-- when we want only uncommon data from left side table.

	--select s.stuname as studentname,t.trname as trainername
 -- from students s left outer join trainers t
 --  on s.trainerId=t.trId where t.trId is null

-- uncommon from right site  table
--select s.stuname as studentname,t.trname as trainername
--  from students s right join trainers t
--   on s.trainerId=t.trId where s.trainerId is null

--create table course(
--  Id int primary key identity,
--  name varchar(50)
--)
--insert into course values ('java'),('not net'),('php'),('python')
 
-- select * from students
-- select * from trainers
-- select * from course

-- alter table students
-- add courseId int foreign key references course(Id)

-- select s.stuname as studentname,t.trname as trainername,c.name as coursename
-- from students s join trainers t
-- on s.trainerId=t.trId 
-- join course c on c.Id = s.courseId


 --assignment :

 -- create tables like Enquery,addmission,course,trainer,batch,batch timing,fees
 -- requriement : give me all student names who attent session during 9 to 10 am. --> join addmission and batch timing 















