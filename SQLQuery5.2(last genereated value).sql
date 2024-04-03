create database lastgeneratedvalue
 use lastgeneratedvalue

 create table student(
 id int primary key identity (1,1),
 name varchar(50),
 gender varchar(10)
 )
 insert into student values('ram','male')
 insert into student values('sita','female')
 insert into student values('lakshiman','male')
 insert into student values('hanuman','male')
 insert into student values('ravan','male')

 select * from student


 create table study(
 rollnumber int not null,
 name varchar(50)
 )
 insert into study values(1,'ganesh')
 insert into study values(Null , 'suresh') -- it is not posssible when you write null or Null -- it is not case sensitive
 select * from study









