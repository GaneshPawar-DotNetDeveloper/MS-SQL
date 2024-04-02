--create database foreignkeyConstraints
--use foreignkeyConstraints

--create table trainers (srnumber int primary key , name varchar(50)  )
--insert into trainers values(1,'ganesh ')
--insert into trainers values(2,'suresh ')
--insert into trainers values(3,'ramesh ')
--insert into trainers values(4,'sandesh ')

--select * from trainers
--create table student(
--rollnumber int,
--name varchar (50),
--srnumber int

--)
--select * from trainers
--select * from student
--drop table student
--create table student(
--rollnumber int,
--name varchar (50),
--trainerId int foreign key references trainers(srnumber))

--insert into student values(1,'dhiraj',1)
--insert into student values(2,'sachin',3)
--insert into student values(3,'pratik',3)
--insert into student values(2,'ajay',12)
--insert into student values(2,'gajanan',null)



select * from trainers
select * from student