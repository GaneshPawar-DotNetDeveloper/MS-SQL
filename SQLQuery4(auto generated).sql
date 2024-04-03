--create database identityColumn
--use identityColumn

--create table student(
--id int primary key identity (1,1),
--name varchar(50),
--gender varchar(10)
--)
insert into student values('ganesh',23)
insert into student values('mahesh','2k')
insert into student values('suresh',2)
insert into student values('nagesh',30)
insert into student values('chetan',23)
select * from student
delete from student where id=3
 
 set identity_insert student ON
 insert into student (id,name,gender)values(3,'rakesh',34)


  set identity_insert student OFF

 insert into student values('pritis',54)

 delete from student

 dbcc checkident('student',reseed,0)

